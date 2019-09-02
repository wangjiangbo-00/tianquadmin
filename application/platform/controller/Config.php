<?php
/**
 * Config.php
 * Niushop商城系统 - 团队十年电商经验汇集巨献!
 * =========================================================
 * Copy right 2015-2025 山西牛酷信息科技有限公司, 保留所有权利。
 * ----------------------------------------------
 * 官方网址: http://www.niushop.com.cn
 * 这不是一个自由软件！您只能在不用于商业目的的前提下对程序代码进行修改和使用。
 * 任何企业和个人不允许对程序代码以任何形式任何目的再发布。
 * =========================================================
 * @author : niuteam
 * @date : 2015.1.17
 * @version : v1.0.0.0
 */
namespace app\platform\controller;

use app\api\controller\User;
use data\extend\Send;
use data\service\Address as DataAddress;
use data\service\Config as WebConfig;
use data\service\Platform;
use data\service\Promotion;
use data\service\Shop as Shop;
use think\Config as thinkConfig;
use data\service\Promotion as PromotionService;
use data\service\promotion\PromoteRewardRule;
use data\service\GoodsBrand as GoodsBrand;
use data\service\GoodsCategory as GoodsCategory;
use data\service\Goods as Goods;
use data\extend\database;
/**
 * 网站设置模块控制器
 *
 * @author Administrator
 *        
 */
class Config extends BaseController
{

    public $backup_path = "runtime/dbsql/";

    public function __construct()
    {
        parent::__construct();
    }
    /**
     * 网站设置
     */
    public function webConfig()
    {
        if ($_POST) {
            // 网站设置
            $title = $_POST['title']; // 网站标题
            $logo = $_POST['logo']; // 网站logo
            $web_desc = $_POST['web_desc']; // 网站描述
            $key_words = $_POST['key_words']; // 网站关键字
            $web_icp = $_POST['web_icp']; // 网站备案号
            $web_style = $_POST['web_style']; // 网站风格
            $web_qrcode = $_POST['web_qrcode']; // 网站公众号二维码
            $web_url = $_POST['web_url']; // 店铺网址
            $web_phone = $_POST['web_phone']; // 网站联系方式
            $web_email = $_POST['web_email']; // 网站邮箱
            $web_qq = $_POST['web_qq']; // 网站qq号
            $web_weixin = $_POST['web_weixin']; // 网站微信号
            $web_address = $_POST['web_address']; // 网站联系地址
            
            $web_status = request()->post("web_status", ''); // 网站运营状态
            $wap_status = request()->post("wap_status", ''); // 手机端网站运营状态
            $third_count = request()->post("third_count", ''); // 第三方统计
            $close_reason = request()->post("close_reason", ''); // 站点关闭原因
            
            $retval = $this->website->updateWebSite($title, $logo, $web_desc, $key_words, $web_icp, $web_style, $web_qrcode, $web_url, $web_phone, $web_email, $web_qq, $web_weixin, $web_address, $web_status, $wap_status, $third_count, $close_reason);
            return AjaxReturn($retval);
        } else {
            
            $child_menu_list = array(
                array(
                    'url' => "config/webconfig",
                    'menu_name' => "网站设置",
                    "active" => 1
                ),
                array(
                    'url' => "config/seoConfig",
                    'menu_name' => "SEO设置",
                    "active" => 0
                )
            );
            
            $this->assign('child_menu_list', $child_menu_list);
            $list = $this->website->getWebSiteInfo();
            $style_list = $this->website->getWebStyleList();
            $path = getQRcode(request()->domain() . thinkConfig::get('view_replace_str.APP_MAIN'), 'upload/qrcode', 'url');
            $this->assign('style_list', $style_list);
            $this->assign("website", $list);
            $this->assign("qrcode_path", $path);
            return view($this->style . "Config/webConfig");
        }
    }

    /**
     * seo设置
     */
    public function seoConfig()
    {
        $child_menu_list = array(
            array(
                'url' => "config/webconfig",
                'menu_name' => "网站设置",
                "active" => 0
            ),
            array(
                'url' => "config/seoconfig",
                'menu_name' => "SEO设置",
                "active" => 1
            )
        );
        
        $this->assign('child_menu_list', $child_menu_list);
        
        $Config = new WebConfig();
        if (request()->isAjax()) {
            $shop_id = $this->instance_id;
            $seo_title = request()->post("seo_title", '');
            $seo_meta = request()->post("seo_meta", '');
            $seo_desc = request()->post("seo_desc", '');
            $seo_other = request()->post("seo_other", '');
            $retval = $Config->SetSeoConfig($shop_id, $seo_title, $seo_meta, $seo_desc, $seo_other);
            return AjaxReturn($retval);
        } else {
            $shop_id = $this->instance_id;
            $shopSet = $Config->getSeoConfig($shop_id);
            $this->assign("info", $shopSet);
        }
        return view($this->style . "Config/seoConfig");
    }

    /**
     * qq登录配置
     *
     * @return Ambigous <\think\response\View, \think\response\$this, \think\response\View>
     */
    public function loginqqconfig()
    {
        $appkey = isset($_POST['appkey']) ? $_POST['appkey'] : '';
        $appsecret = isset($_POST['appsecret']) ? $_POST['appsecret'] : '';
        $url = isset($_POST['url']) ? $_POST['url'] : '';
        $call_back_url = isset($_POST['call_back_url']) ? $_POST['call_back_url'] : '';
        $is_use = isset($_POST['is_use']) ? $_POST['is_use'] : 0;
        $web_config = new WebConfig();
        // 获取数据
        $retval = $web_config->setQQConfig($this->instance_id, $appkey, $appsecret, $url, $call_back_url, $is_use);
        return AjaxReturn($retval);
    }

    /**
     * 微信登录配置
     *
     * @return Ambigous <\think\response\View, \think\response\$this, \think\response\View>
     */
    public function loginWeixinConfig()
    {
        $appid = isset($_POST['appkey']) ? $_POST['appkey'] : '';
        $appsecret = isset($_POST['appsecret']) ? $_POST['appsecret'] : '';
        $url = isset($_POST['url']) ? $_POST['url'] : '';
        $call_back_url = isset($_POST['call_back_url']) ? $_POST['call_back_url'] : '';
        $is_use = isset($_POST['is_use']) ? $_POST['is_use'] : 0;
        $web_config = new WebConfig();
        // 获取数据
        $retval = $web_config->setWchatConfig($this->instance_id, $appid, $appsecret, $url, $call_back_url, $is_use);
        return AjaxReturn($retval);
    }

    /**
     * 第三方登录 页面显示
     */
    public function loginConfig()
    {
        $type = isset($_GET["type"]) ? $_GET["type"] : "qq";
        if ($type == "qq") {
            $child_menu_list = array(
                array(
                    'url' => "config/loginconfig?type=qq",
                    'menu_name' => "qq登录",
                    "active" => 1
                )
            );
        } else {
            $child_menu_list = array(
                array(
                    'url' => "config/loginconfig?type=wchat",
                    'menu_name' => "微信登录",
                    "active" => 1
                )
            );
        }
        $this->assign('child_menu_list', $child_menu_list);
        $this->assign("type", $type);
        $web_config = new WebConfig();
        // qq登录配置
        // 获取当前域名
        $domain_name = \think\Request::instance()->domain();
        // 获取回调域名qq回调域名
        $qq_call_back = __URL__ . '/wap/login/callback';
        // 获取qq配置信息
        $qq_config = $web_config->getQQConfig($this->instance_id);
        $qq_config['value']["AUTHORIZE"] = $domain_name;
        $qq_config['value']["CALLBACK"] = $qq_call_back;
        $this->assign("qq_config", $qq_config);
        // 微信登录配置
        // 微信登录返回
        $wchat_call_back = __URL__ . '/wap/Login/callback';
        $wchat_config = $web_config->getWchatConfig($this->instance_id);
        $wchat_config['value']["AUTHORIZE"] = $domain_name;
        $wchat_config['value']["CALLBACK"] = $wchat_call_back;
        $this->assign("wchat_config", $wchat_config);
        
        return view($this->style . "Config/loginConfig");
    }
    /**
     * 第三方微信登录设置页面
     */
    public function loginwchatconfig(){
        // 微信登录配置
        // 微信登录返回
        $web_config = new WebConfig();
        $type='weixin';
        $domain_name = \think\Request::instance()->domain();
        $wchat_call_back = __URL__ . '/wap/Login/callback';
        $wchat_config = $web_config->getWchatConfig($this->instance_id);
        $wchat_config['value']["AUTHORIZE"] = $domain_name;
        $wchat_config['value']["CALLBACK"] = $wchat_call_back;
        $this->assign("wchat_config", $wchat_config);
        return view($this->style . "Config/loginwchatconfig");
    }
    /**
     * 第三方qq登录设置页面
     */
    public function loginqqsetconfig(){
        $type = 'qq';
        $web_config = new WebConfig();
        // qq登录配置
        // 获取当前域名
        $domain_name = \think\Request::instance()->domain();
        // 获取回调域名qq回调域名
        $qq_call_back = __URL__ . '/wap/login/callback';
        // 获取qq配置信息
        $qq_config = $web_config->getQQConfig($this->instance_id);
        $qq_config['value']["AUTHORIZE"] = $domain_name;
        $qq_config['value']["CALLBACK"] = $qq_call_back;
        $this->assign("qq_config", $qq_config);
        return view($this->style . "Config/loginqqsetconfig");
    }
  
    /**
     * 支付配置--微信
     *
     * @return Ambigous <\think\response\View, \think\response\$this, \think\response\View>
     */
    public function payConfig()
    {
        if (request()->isAjax()) {
            $type = isset($_POST['type']) ? $_POST['type'] : '';
            if ($type == 'wchat') {
                // 微信支付
                $appkey = str_replace(' ', '', request()->post('appkey', ''));
                $appsecret = str_replace(' ', '', request()->post('appsecret', ''));
                $paySignKey = str_replace(' ', '', request()->post('paySignKey', ''));
                $MCHID = str_replace(' ', '', request()->post('MCHID', ''));
                $is_use = isset($_POST['is_use']) ? $_POST['is_use'] : 0;
                $web_config = new WebConfig();
                // 获取数据
                $retval = $web_config->setWpayConfig($this->instance_id, $appkey, $appsecret, $MCHID, $paySignKey, $is_use);
                return AjaxReturn($retval);
            }
        } else {
            $type = isset($_GET['type']) ? $_GET['type'] : 'wchat';
            if ($type == 'wchat') {
                $web_config = new WebConfig();
                $data = $web_config->getWpayConfig($this->instance_id);
                $this->assign("config", $data);
                return view($this->style . "Config/payConfig");
            }
        }
    }


    
    public function payAliConfig()
    {
        if (request()->isAjax()) {
            // 支付宝
            $partnerid = str_replace(' ', '', request()->post('ali_partnerid', ''));
            $seller = str_replace(' ', '', request()->post('ali_seller', ''));
            $ali_key = str_replace(' ', '', request()->post('ali_key', ''));
            $is_use = isset($_POST['is_use']) ? $_POST['is_use'] : 0;
            $web_config = new WebConfig();
            // 获取数据
            $retval = $web_config->setAlipayConfig($this->instance_id, $partnerid, $seller, $ali_key, $is_use);
            return AjaxReturn($retval);
        }
        $web_config = new WebConfig();
        $data = $web_config->getAlipayConfig($this->instance_id);
        $this->assign("config", $data);
        return view($this->style . "Config/payAliConfig");
    }
    
    
    
    /**
     * 设置微信和支付宝开关状态是否启用
     */
    public function setStatus()
    {
        $web_config = new WebConfig();
        if (request()->isAjax()) {
            $is_use = request()->post("is_use", '');
            $type = request()->post("type", '');
            $retval = $web_config->setWpayStatusConfig($this->instance_id, $is_use, $type);
            return AjaxReturn($retval);
        }
    }

    /**
     * 广告列表
     */
    public function shopAdList()
    {
        if (request()->isAjax()) {
            $shop_ad = new Shop();
            
            $list = $shop_ad->getShopAdList(1, 10, [
                'shop_id' => $this->instance_id
            ], 'sort');
            return $list;
        }
        return view($this->style . "Config/shopAdList");
    }

    /**
     * 添加店铺广告
     *
     * @return \think\response\View
     */
    public function addShopAd()
    {
        if (request()->isAjax()) {
            $ad_image = isset($_POST['ad_image']) ? $_POST['ad_image'] : '';
            $link_url = isset($_POST['link_url']) ? $_POST['link_url'] : '';
            $sort = isset($_POST['sort']) ? $_POST['sort'] : 0;
            $type = isset($_POST['type']) ? $_POST['type'] : 0;
            $background = isset($_POST['background']) ? $_POST['background'] : '#FFFFFF';
            $shop_ad = new Shop();
            $res = $shop_ad->addShopAd($ad_image, $link_url, $sort, $type, $background);
            return AjaxReturn($res);
        }
        return view($this->style . "Config/addShopAd");
    }

    /**
     * 修改店铺广告
     */
    public function updateShopAd()
    {
        if (request()->isAjax()) {
            $id = isset($_POST['id']) ? $_POST['id'] : '';
            $ad_image = isset($_POST['ad_image']) ? $_POST['ad_image'] : '';
            $link_url = isset($_POST['link_url']) ? $_POST['link_url'] : '';
            $sort = isset($_POST['sort']) ? $_POST['sort'] : 0;
            $type = isset($_POST['type']) ? $_POST['type'] : 0;
            $background = isset($_POST['background']) ? $_POST['background'] : '#FFFFFF';
            $shop_ad = new Shop();
            $res = $shop_ad->updateShopAd($id, $ad_image, $link_url, $sort, $type, $background);
            return AjaxReturn($res);
        }
        $shop_ad = new Shop();
        $id = isset($_GET['id']) ? $_GET['id'] : '';
        $info = $shop_ad->getShopAdDetail($id);
        $this->assign('info', $info);
        return view($this->style . "Config/updateShopAd");
    }

    public function delShopAd()
    {
        $id = isset($_POST['id']) ? $_POST['id'] : '';
        $res = 0;
        if (! empty($id)) {
            $shop_ad = new Shop();
            $res = $shop_ad->delShopAd($id);
        }
        return AjaxReturn($res);
    }

    /**
     * 店铺导航列表
     */
    public function shopNavigationList()
    {
        if (request()->isAjax()) {
            $shop = new Shop();
            $page_index = request()->post("pageIndex", 1);
            $page_size = request()->post('page_size', PAGESIZE);
            $search_text = request()->post('search_text','');
            $list = $shop->ShopNavigationList($page_index, $page_size, [
                'nav_title' => array(
                    'like',
                    '%' . $search_text . '%'
                )
            ], 'sort');
            return $list;
        } else {
            return view($this->style . "Config/shopNavigationList");
        }
    }

    /**
     * 店铺导航添加
     *
     * @return multitype:unknown
     */
    public function addShopNavigation()
    {
        $shop = new Shop();
        if (request()->isAjax()) {
            $nav_title = isset($_POST['nav_title']) ? $_POST['nav_title'] : '';
            $nav_url = isset($_POST['nav_url']) ? $_POST['nav_url'] : '';
            $type = isset($_POST['type']) ? $_POST['type'] : '';
            $sort = isset($_POST['sort']) ? $_POST['sort'] : '';
            $align = isset($_POST['align']) ? $_POST['align'] : '';
            $nav_type = request()->post("nav_type", '');
            $is_blank = request()->post("is_blank", '');
            $template_name = request()->post("template_name", '');
            $retval = $shop->addShopNavigation($nav_title, $nav_url, $type, $sort, $align, $nav_type, $is_blank, $template_name);
            return AjaxReturn($retval);
        } else {
            $shopNavTemplate = $shop->getShopNavigationTemplate(1);
            $this->assign("shopNavTemplate", $shopNavTemplate);
            return view($this->style . "Config/addShopNavigation");
        }
    }

    /**
     * 修改店铺导航
     *
     * @return multitype:unknown
     */
    public function updateShopNavigation()
    {
        $shop = new Shop();
        if (request()->isAjax()) {
            $nav_id = isset($_POST['nav_id']) ? $_POST['nav_id'] : '';
            $nav_title = isset($_POST['nav_title']) ? $_POST['nav_title'] : '';
            $nav_url = isset($_POST['nav_url']) ? $_POST['nav_url'] : '';
            $type = isset($_POST['type']) ? $_POST['type'] : '';
            $sort = isset($_POST['sort']) ? $_POST['sort'] : '';
            $align = isset($_POST['align']) ? $_POST['align'] : '';
            $nav_type = request()->post("nav_type", '');
            $is_blank = request()->post("is_blank", '');
            $template_name = request()->post("template_name", '');
            $retval = $shop->updateShopNavigation($nav_id, $nav_title, $nav_url, $type, $sort, $align, $nav_type, $is_blank, $template_name);
            return AjaxReturn($retval);
        } else {
            $nav_id = request()->get('nav_id','');
            //var_dump($_GET['nav_id']);die;
            $data = $shop->shopNavigationDetail($nav_id);
            $this->assign('data', $data);
            $shopNavTemplate = $shop->getShopNavigationTemplate(1);
            $this->assign("shopNavTemplate", $shopNavTemplate);
            return view($this->style . "Config/updateShopNavigation");
        }
    }

    /**
     * 删除店铺导航
     *
     * @return multitype:unknown
     */
    public function delShopNavigation()
    {
        if (request()->isAjax()) {
            $shop = new Shop();
            $nav_id = isset($_POST['nav_id']) ? $_POST['nav_id'] : '';
            $retval = $shop->delShopNavigation($nav_id);
            return AjaxReturn($retval);
        }
    }

    /**
     * 修改店铺导航排序
     *
     * @return multitype:unknown
     */
    public function modifyShopNavigationSort()
    {
        if (request()->isAjax()) {
            $shop = new Shop();
            $nav_id = isset($_POST['nav_id']) ? $_POST['nav_id'] : '';
            $sort = isset($_POST['sort']) ? $_POST['sort'] : '';
            $retval = $shop->modifyShopNavigationSort($nav_id, $sort);
            return AjaxReturn($retval);
        }
    }

    /**
     * 友情链接列表
     *
     * @return unknown[]
     */
    public function linkList()
    {
        if (request()->isAjax()) {
            $page_index = request()->post("pageIndex", 1);
            $page_size = request()->post('page_size', PAGESIZE);
            $search_text = isset($_POST['search_text']) ? $_POST['search_text'] : '';
            $platform = new Platform();
            $list = $platform->getLinkList($page_index, $page_size, [
                'link_title' => array(
                    'like',
                    '%' . $search_text . '%'
                )
            ], 'link_sort ASC');
            return $list;
        }
        return view($this->style . "Config/linkList");
    }

    /**
     * 添加友情链接
     *
     * @return unknown[]
     */
    public function addLink()
    {
        if (request()->isAjax()) {
            $link_title = isset($_POST["link_title"]) ? $_POST["link_title"] : '';
            $link_url = isset($_POST["link_url"]) ? $_POST["link_url"] : '';
            $link_pic = isset($_POST["link_pic"]) ? $_POST["link_pic"] : '';
            $link_sort = isset($_POST["link_sort"]) ? $_POST["link_sort"] : 0;
            $is_blank = request()->post("is_blank", '');
            $is_show = request()->post("is_show", '');
            $platform = new Platform();
            $res = $platform->addLink($link_title, $link_url, $link_pic, $link_sort, $is_blank, $is_show);
            return AjaxReturn($res);
        }
        return view($this->style . "Config/addLink");
    }

    /**
     * 修改友情链接
     */
    public function updateLink()
    {
        if (request()->isAjax()) {
            $link_id = isset($_POST["link_id"]) ? $_POST["link_id"] : '';
            $link_title = isset($_POST["link_title"]) ? $_POST["link_title"] : '';
            $link_url = isset($_POST["link_url"]) ? $_POST["link_url"] : '';
            $link_pic = isset($_POST["link_pic"]) ? $_POST["link_pic"] : '';
            $link_sort = isset($_POST["link_sort"]) ? $_POST["link_sort"] : 0;
            $is_blank = request()->post("is_blank", '');
            $is_show = request()->post("is_show", '');
            $platform = new Platform();
            $res = $platform->updateLink($link_id, $link_title, $link_url, $link_pic, $link_sort, $is_blank, $is_show);
            return AjaxReturn($res);
        }
        $link_id = isset($_GET["link_id"]) ? $_GET["link_id"] : '';
        $platform = new Platform();
        $link_info = $platform->getLinkDetail($link_id);
        $this->assign('link_info', $link_info);
        return view($this->style . "Config/updateLink");
    }

    /**
     * 删除友情链接
     *
     * @return unknown[]
     */
    public function delLink()
    {
        $link_id = isset($_POST["link_id"]) ? $_POST["link_id"] : '';
        $platform = new Platform();
        $res = $platform->deleteLink($link_id);
        return AjaxReturn($res);
    }

    /**
     * 搜索设置
     */
    public function searchConfig()
    {
        $type = isset($_GET["type"]) ? $_GET["type"] : "hot";
        if ($type == "hot") {
            $child_menu_list = array(
                array(
                    'url' => "Config/searchConfig?type=hot",
                    'menu_name' => "热门搜索",
                    "active" => 1
                ),
                array(
                    'url' => "Config/searchConfig?type=default",
                    'menu_name' => "默认搜索",
                    "active" => 0
                )
            );
        } else {
            
            $child_menu_list = array(
                array(
                    'url' => "Config/searchConfig?type=hot",
                    'menu_name' => "热门搜索",
                    "active" => 0
                ),
                array(
                    'url' => "Config/searchConfig?type=default",
                    'menu_name' => "默认搜索",
                    "active" => 1
                )
            );
        }
        $web_config = new WebConfig();
        // 热门搜索
        $keywords_array = $web_config->getHotsearchConfig($this->instance_id);
        if (! empty($keywords_array)) {
            $keywords = implode(",", $keywords_array);
        } else {
            $keywords = '';
        }
        $this->assign('hot_keywords', $keywords);
        // 默认搜索
        $default_keywords = $web_config->getDefaultSearchConfig($this->instance_id);
        $this->assign('default_keywords', $default_keywords);
        $this->assign('child_menu_list', $child_menu_list);
        $this->assign('type', $type);
        return view($this->style . "Config/searchConfig");
    }

    /**
     * 热门搜索 提交修改
     */
    public function hotSearchConfig()
    {
        $keywords = isset($_POST["keywords"]) ? $_POST["keywords"] : '';
        if (! empty($keywords)) {
            $keywords_array = explode(",", $keywords);
        } else {
            $keywords_array = array();
        }
        $web_config = new WebConfig();
        $res = $web_config->setHotsearchConfig($this->instance_id, $keywords_array, 1);
        return AjaxReturn($res);
    }

    /**
     * 默认搜索 提交修改
     */
    public function defaultSearchConfig()
    {
        $keywords = isset($_POST["default_keywords"]) ? $_POST["default_keywords"] : '';
        $web_config = new WebConfig();
        $res = $web_config->setDefaultSearchConfig($this->instance_id, $keywords, 1);
        return AjaxReturn($res);
    }

    /**
     * 验证码设置
     *
     * @return \think\response\View
     */
    public function codeConfig()
    {
        $webConfig = new WebConfig();
        if (request()->isAjax()) {
            $platform = isset($_POST['platform']) ? $_POST['platform'] : '';
            $admin = isset($_POST['adminCode']) ? $_POST['adminCode'] : 0;
            $pc = isset($_POST['pcCode']) ? $_POST['pcCode'] : 0;
            $res = $webConfig->setLoginVerifyCodeConfig($this->instance_id, $platform, $admin, $pc);
            return AjaxReturn($res);
        }
        $code_config = $webConfig->getLoginVerifyCodeConfig($this->instance_id);
        $this->assign('code_config', $code_config["value"]);
        return view($this->style . 'Config/codeConfig');
    }

    /**
     * 邮件短信接口设置
     */
    public function messageConfig()
    {
        $type = isset($_GET["type"]) ? $_GET["type"] : "email";
        if ($type == 'email') {
            $child_menu_list = array(
                array(
                    'url' => "Config/messageConfig?type=email",
                    'menu_name' => "邮箱设置",
                    "active" => 1
                ),
                array(
                    'url' => "Config/messageConfig?type=sms",
                    'menu_name' => "短信设置",
                    "active" => 0
                )
            );
        } else {
            $child_menu_list = array(
                array(
                    'url' => "Config/messageConfig?type=email",
                    'menu_name' => "邮箱设置",
                    "active" => 0
                ),
                array(
                    'url' => "Config/messageConfig?type=sms",
                    'menu_name' => "短信设置",
                    "active" => 1
                )
            );
        }
        $config = new WebConfig();
        $email_message = $config->getEmailMessage($this->instance_id);
        $this->assign('email_message', $email_message);
        $mobile_message = $config->getMobileMessage($this->instance_id);
        $this->assign('mobile_message', $mobile_message);
        $this->assign('child_menu_list', $child_menu_list);
        $this->assign('type', $type);
        return view($this->style . 'Config/messageConfig');
    }
    /**
     * 短信通知设置
     */
    public function messagesmsconfig(){
        $config = new WebConfig();
        $type= 'sms';
        $email_message = $config->getEmailMessage($this->instance_id);
        $this->assign('email_message', $email_message);
        $mobile_message = $config->getMobileMessage($this->instance_id);
        $this->assign('mobile_message', $mobile_message);
        $this->assign('type', $type);
        return view($this->style . 'Config/messagesmsconfig');
    }
    /**
     * 邮件通知设置
     * @return \think\response\View
     */
    public function messageemailconfig(){
        $config = new WebConfig();
        $type= 'email';
        $email_message = $config->getEmailMessage($this->instance_id);
        $this->assign('email_message', $email_message);
        $mobile_message = $config->getMobileMessage($this->instance_id);
        $this->assign('mobile_message', $mobile_message);
        $this->assign('type', $type);
        return view($this->style . 'Config/messageemailconfig');
    }
    
    /**
     * ajax 邮件接口
     */
    public function setEmailMessage()
    {
        $email_host = isset($_POST['email_host']) ? $_POST['email_host'] : '';
        $email_port = isset($_POST['email_port']) ? $_POST['email_port'] : '';
        $email_addr = isset($_POST['email_addr']) ? $_POST['email_addr'] : '';
        $email_id = isset($_POST['email_id']) ? $_POST['email_id'] : '';
        $email_pass = isset($_POST['email_pass']) ? $_POST['email_pass'] : '';
        $is_use = isset($_POST['is_use']) ? $_POST['is_use'] : '';
        $config = new WebConfig();
        $res = $config->setEmailMessage($this->instance_id, $email_host, $email_port, $email_addr, $email_id, $email_pass, $is_use);
        return AjaxReturn($res);
    }

    /**
     * ajax 短信接口
     *
     * @return unknown[]
     */
    public function setMobileMessage()
    {
        $app_key = request()->post('app_key', '');
        $secret_key = request()->post('secret_key', '');
        $free_sign_name = request()->post('free_sign_name', '');
        $is_use = request()->post('is_use', '');
        $user_type = request()->post('user_type', 0); // 用户类型 0:旧用户，1：新用户 默认是旧用户
        $config = new WebConfig();
        $res = $config->setMobileMessage($this->instance_id, $app_key, $secret_key, $free_sign_name, $is_use, $user_type);
        return AjaxReturn($res);
    }

    /**
     * 邮件发送测试接口
     *
     * @return unknown[]
     */
    public function testSend()
    {
        $send = new Send();
       // $toemail = "854991437@qq.com";//$_POST['email_test'];
        $title = 'Niushop测试邮箱发送';
        $content = '测试邮箱发送成功不成功？';
        $email_host = request()->post('email_host', '');
        $email_port = request()->post('email_port', '');
        $email_addr = request()->post('email_addr', '');
        $email_id = request()->post('email_id', '');
        $email_pass = request()->post('email_pass', '');
        $toemail = request()->post('email_test', '');
        $res = emailSend($email_host, $email_id, $email_pass, $email_addr, $toemail, $title, $content);
       // $config = new WebConfig();
      //  $email_message = $config->getEmailMessage($this->instance_id);
      //  $email_value = $email_message["value"];
     //   $res = emailSend($email_value['email_host'], $email_value['email_id'], $email_value['email_pass'], $email_value['email_addr'], $toemail, $title, $content);
     //   var_dump($res);
     //   exit;
        if ($res) {
            return AjaxReturn(1);
        } else {
            return AjaxReturn(-1);
        }
    }

    /**
     * 帮助类型
     *
     * @return unknown
     */
    public function helpclass()
    {
        if (request()->isAjax()) {
            $page_index = request()->post("pageIndex", 1);
            $page_size = request()->post('page_size', PAGESIZE);
            $platform = new Platform();
            $list = $platform->getPlatformHelpClassList($page_index, $page_size, [
                'type' => 1
            ], 'sort');
            return $list;
        }
        return view($this->style . "Config/helpClass");
    }

    /**
     * 修改帮助类型
     * 任鹏强
     * 2017年2月18日14:26:20
     */
    public function updateClass()
    {
        if (request()->isAjax()) {
            $class_id = isset($_POST['class_id']) ? $_POST['class_id'] : '';
            $type = isset($_POST['type']) ? $_POST['type'] : 1;
            $class_name = isset($_POST['class_name']) ? $_POST['class_name'] : '';
            $parent_class_id = isset($_POST['parent_class_id']) ? $_POST['parent_class_id'] : 0;
            $sort = isset($_POST['sort']) ? $_POST['sort'] : '';
            $platform = new Platform();
            $res = $platform->updatePlatformClass($class_id, $type, $class_name, $parent_class_id, $sort);
            return AjaxReturn($res);
        }
    }

    /**
     * 删除帮助类型
     */
    public function classDelete()
    {
        $class_id = request()->post('id', '');
        $platform = new Platform();
        $retval = $platform->deleteHelpClass($class_id);
        return AjaxReturn($retval);
    }

    /**
     * 添加 帮助类型
     */
    public function addHelpClass()
    {
        if (request()->isAjax()) {
            $class_name = isset($_POST['class_name']) ? $_POST['class_name'] : '';
            $sort = isset($_POST['sort']) ? $_POST['sort'] : '';
            $platform = new Platform();
            $res = $platform->addPlatformHelpClass(1, $class_name, 0, $sort);
            return AjaxReturn($res);
        }
        return view($this->style . 'Config/addHelpClass');
    }

    /**
     * 删除帮助内容标题
     *
     * @return unknown[]
     */
    public function titleDelete()
    {
        $id = request()->post('id', '');
        $platform = new Platform();
        $res = $platform->deleteHelpTitle($id);
        return AjaxReturn($res);
    }

    /**
     * 帮助内容
     *
     * @return multitype:number unknown |Ambigous <\think\response\View, \think\response\$this, \think\response\View>
     */
    public function helpDocument()
    {
        if (request()->isAjax()) {
            $page_index = request()->post("pageIndex", 1);
            $page_size = request()->post('page_size', PAGESIZE);
            $platform = new Platform();
            $list = $platform->getPlatformHelpDocumentList($page_index, $page_size, '', 'sort');
            return $list;
        }
        return view($this->style . "Config/helpDocument");
    }

    /**
     * 修改内容
     */
    public function updateDocument()
    {
        $platform = new Platform();
        if (request()->isAjax()) {
            $uid = $this->user->getSessionUid();
            $id = isset($_POST['id']) ? $_POST['id'] : '';
            $title = isset($_POST['title']) ? $_POST['title'] : '';
            $class_id = isset($_POST['class_id']) ? $_POST['class_id'] : '';
            $link_url = isset($_POST['link_url']) ? $_POST['link_url'] : '';
            $content = isset($_POST['content']) ? $_POST['content'] : '';
            $image = isset($_POST['image']) ? $_POST['image'] : '';
            $sort = isset($_POST['sort']) ? $_POST['sort'] : 0;
            $revle = $platform->updatePlatformDocument($id, $uid, $class_id, $title, $link_url, $sort, $content, $image);
            return AjaxReturn($revle);
        } else {
            $id = isset($_GET['id']) ? $_GET['id'] : '';
            $this->assign('id', $id);
            $document_detail = $platform->getPlatformDocumentDetail($id);
          //  $document_detail["content"] = htmlspecialchars($document_detail["content"]);
            $document_detail["content"] = $document_detail["content"];
            $this->assign('document_detail', $document_detail);
            $help_class_list = $platform->getPlatformHelpClassList();
            $this->assign('help_class_list', $help_class_list['data']);
            return view($this->style . 'Config/updateDocument');
        }
    }

    /**
     * 添加内容
     */
    public function addDocument()
    {
        $platform = new Platform();
        if (request()->isAjax()) {
            $uid = $this->user->getSessionUid();
            $title = isset($_POST['title']) ? $_POST['title'] : '';
            $class_id = isset($_POST['class_id']) ? $_POST['class_id'] : '';
            $link_url = isset($_POST['link_url']) ? $_POST['link_url'] : '';
            $content = isset($_POST['content']) ? $_POST['content'] : '';
            $image = isset($_POST['image']) ? $_POST['image'] : '';
            $sort = isset($_POST['sort']) ? $_POST['sort'] : '';
            $result = $platform->addPlatformDocument($uid, $class_id, $title, $link_url, $sort, $content, $image);
            return AjaxReturn($result);
        } else {
            $help_class_list = $platform->getPlatformHelpClassList();
            $this->assign('help_class_list', $help_class_list['data']);
            return view($this->style . 'Config/addDocument');
        }
    }
    
    /**
     * 首页版块 列表
     */
    public function blockList()
    {
        if (request()->isAjax()) {
            $page_index = request()->post("pageIndex", 1);
            $page_size = request()->post('page_size', PAGESIZE);
            $search_text = isset($_POST['search_text']) ? $_POST['search_text'] : '';
            $platform_block = new Platform();
            $block_list = $platform_block->webBlockList($page_index, $page_size, [
                'block_name' => array(
                    'like',
                    '%' . $search_text . '%'
                )
            ], 'sort', 'block_id, is_display, block_color, sort, block_name, create_time, modify_time');
            return $block_list;
        }
        return view($this->style . "Config/blockList");
    }
    /**
     * 添加版块
     */
    public function addBlock()
    {
        $platform = new Platform();
        if (request()->isAjax()) {
            $block_name = isset($_POST['block_name']) ? $_POST['block_name'] : '';
            $block_short_name = isset($_POST['block_short_name']) ? $_POST['block_short_name'] : '';
            $block_color = isset($_POST['block_color']) ? $_POST['block_color'] : '';
            $is_display = isset($_POST['is_display']) ? $_POST['is_display'] : 1;
            $sort = isset($_POST['sort']) ? $_POST['sort'] : 0;
            $recommend_ad_image_name = isset($_POST['recommend_ad_image_name']) ? $_POST['recommend_ad_image_name'] : '';
            $recommend_ad_image = isset($_POST['recommend_ad_image']) ? $_POST['recommend_ad_image'] : '';
            $recommend_ad_slide_name = isset($_POST['recommend_ad_slide_name']) ? $_POST['recommend_ad_slide_name'] : '';
            $recommend_ad_slide = isset($_POST['recommend_ad_slide']) ? $_POST['recommend_ad_slide'] : '';
            $recommend_ad_images_name = isset($_POST['recommend_ad_images_name']) ? $_POST['recommend_ad_images_name'] : '';
            $recommend_ad_images = isset($_POST['recommend_ad_images']) ? $_POST['recommend_ad_images'] : '';
            $recommend_brands = isset($_POST['recommend_brands']) ? $_POST['recommend_brands'] : '';
            $recommend_categorys = isset($_POST['recommend_categorys']) ? $_POST['recommend_categorys'] : '';
            $recommend_goods_category_name_1 = isset($_POST['recommend_goods_category_name_1']) ? $_POST['recommend_goods_category_name_1'] : '';
            $recommend_goods_category_1 = isset($_POST['recommend_goods_category_1']) ? $_POST['recommend_goods_category_1'] : '';
            $recommend_goods_category_name_2 = isset($_POST['recommend_goods_category_name_2']) ? $_POST['recommend_goods_category_name_2'] : '';
            $recommend_goods_category_2 = isset($_POST['recommend_goods_category_2']) ? $_POST['recommend_goods_category_2'] : '';
            $recommend_goods_category_name_3 = isset($_POST['recommend_goods_category_name_3']) ? $_POST['recommend_goods_category_name_3'] : '';
            $recommend_goods_category_3 = isset($_POST['recommend_goods_category_3']) ? $_POST['recommend_goods_category_3'] : '';
            $res = $platform->addWebBlock($is_display, $block_color, $sort, $block_name, $block_short_name, $recommend_ad_image_name, $recommend_ad_image, $recommend_ad_slide_name, $recommend_ad_slide, $recommend_ad_images_name, $recommend_ad_images, $recommend_brands, $recommend_categorys, $recommend_goods_category_name_1, $recommend_goods_category_1, $recommend_goods_category_name_2, $recommend_goods_category_2, $recommend_goods_category_name_3, $recommend_goods_category_3);
            return AjaxReturn($res);
        }
        // 获取所有品牌
        $goods_brand = new GoodsBrand();
        $goods_brand_list = $goods_brand->getGoodsBrandList(1, 0);
        $this->assign('goods_brand_list', $goods_brand_list['data']);
    
        // 获取商品分类
        $goods_category = new GoodsCategory();
        $category_list = $goods_category->getGoodsCategoryList(1, 0, [
            'is_visible' => 1
        ]);
        $this->assign('goods_category_list', $category_list['data']);
    
        // 获取单图 $recommend_ad_image_list， 多图$recommend_ad_images_list， 幻灯片$recommend_ad_slide_list 广告位
        $recommend_ad_image_list = $platform->getPlatformAdvPositionList(1, 0, [
            'ap_display' => 2,
            'is_use' => 1
        ]);
        $this->assign('recommend_ad_image_list', $recommend_ad_image_list['data']);
        $recommend_ad_images_list = $platform->getPlatformAdvPositionList(1, 0, [
            'ap_display' => 1,
            'is_use' => 1
        ]);
        $this->assign('recommend_ad_images_list', $recommend_ad_images_list['data']);
        $recommend_ad_slide_list = $platform->getPlatformAdvPositionList(1, 0, [
            'ap_display' => 0,
            'is_use' => 1
        ]);
        $this->assign('recommend_ad_slide_list', $recommend_ad_slide_list['data']);
    
        return view($this->style . "Config/addBlock");
    }
    /**
     * 删除 首页版块
     */
    public function delBlock()
    {
        $platform = new Platform();
        $block_id = request()->post('block_id', 0);
        $res = $platform->deleteWebBlock($block_id);
        return AjaxReturn($res);
    }
    /**
     * 修改 版块
     */
    public function updateBlock()
    {
        $platform = new Platform();
        if (request()->isAjax()) {
            $block_id = isset($_POST['block_id']) ? $_POST['block_id'] : '';
            $block_name = isset($_POST['block_name']) ? $_POST['block_name'] : '';
            $block_short_name = isset($_POST['block_short_name']) ? $_POST['block_short_name'] : '';
            $block_color = isset($_POST['block_color']) ? $_POST['block_color'] : '';
            $is_display = isset($_POST['is_display']) ? $_POST['is_display'] : 1;
            $sort = isset($_POST['sort']) ? $_POST['sort'] : 0;
            $recommend_ad_image_name = isset($_POST['recommend_ad_image_name']) ? $_POST['recommend_ad_image_name'] : '';
            $recommend_ad_image = isset($_POST['recommend_ad_image']) ? $_POST['recommend_ad_image'] : '';
            $recommend_ad_slide_name = isset($_POST['recommend_ad_slide_name']) ? $_POST['recommend_ad_slide_name'] : '';
            $recommend_ad_slide = isset($_POST['recommend_ad_slide']) ? $_POST['recommend_ad_slide'] : '';
            $recommend_ad_images_name = isset($_POST['recommend_ad_images_name']) ? $_POST['recommend_ad_images_name'] : '';
            $recommend_ad_images = isset($_POST['recommend_ad_images']) ? $_POST['recommend_ad_images'] : '';
            $recommend_brands = isset($_POST['recommend_brands']) ? $_POST['recommend_brands'] : '';
            $recommend_categorys = isset($_POST['recommend_categorys']) ? $_POST['recommend_categorys'] : '';
            $recommend_goods_category_name_1 = isset($_POST['recommend_goods_category_name_1']) ? $_POST['recommend_goods_category_name_1'] : '';
            $recommend_goods_category_1 = isset($_POST['recommend_goods_category_1']) ? $_POST['recommend_goods_category_1'] : '';
            $recommend_goods_category_name_2 = isset($_POST['recommend_goods_category_name_2']) ? $_POST['recommend_goods_category_name_2'] : '';
            $recommend_goods_category_2 = isset($_POST['recommend_goods_category_2']) ? $_POST['recommend_goods_category_2'] : '';
            $recommend_goods_category_name_3 = isset($_POST['recommend_goods_category_name_3']) ? $_POST['recommend_goods_category_name_3'] : '';
            $recommend_goods_category_3 = isset($_POST['recommend_goods_category_3']) ? $_POST['recommend_goods_category_3'] : '';
            $res = $platform->updateWebBlock($block_id, $is_display, $block_color, $sort, $block_name, $block_short_name, $recommend_ad_image_name, $recommend_ad_image, $recommend_ad_slide_name, $recommend_ad_slide, $recommend_ad_images_name, $recommend_ad_images, $recommend_brands, $recommend_categorys, $recommend_goods_category_name_1, $recommend_goods_category_1, $recommend_goods_category_name_2, $recommend_goods_category_2, $recommend_goods_category_name_3, $recommend_goods_category_3);
    
            return AjaxReturn($res);
        }
        $block_id = isset($_GET['block_id']) ? $_GET['block_id'] : '';
        // 获取所有品牌
        $goods_brand = new GoodsBrand();
        $goods_brand_list = $goods_brand->getGoodsBrandList(1, 0);
        $this->assign('goods_brand_list', $goods_brand_list['data']);
    
        // 获取商品分类
        $goods_category = new GoodsCategory();
        $category_list = $goods_category->getGoodsCategoryList(1, 0, [
            'is_visible' => 1
        ]);
        $this->assign('goods_category_list', $category_list['data']);
    
        // 获取单图 $recommend_ad_image_list， 多图$recommend_ad_images_list， 幻灯片$recommend_ad_slide_list 广告位
        $recommend_ad_image_list = $platform->getPlatformAdvPositionList(1, 0, [
            'ap_display' => 2,
            'is_use' => 1
        ]);
        $this->assign('recommend_ad_image_list', $recommend_ad_image_list['data']);
        $recommend_ad_images_list = $platform->getPlatformAdvPositionList(1, 0, [
            'ap_display' => 1,
            'is_use' => 1
        ]);
        $this->assign('recommend_ad_images_list', $recommend_ad_images_list['data']);
        $recommend_ad_slide_list = $platform->getPlatformAdvPositionList(1, 0, [
            'ap_display' => 0,
            'is_use' => 1
        ]);
        $this->assign('recommend_ad_slide_list', $recommend_ad_slide_list['data']);
        // 获取详情
        $block_info = $platform->getWebBlockDetail($block_id);
        $block_info['base_info']['goods_category_name_1'] = $goods_category->getName($block_info['base_info']['recommend_goods_category_1'])['category_name'];
        $block_info['base_info']['goods_category_name_2'] = $goods_category->getName($block_info['base_info']['recommend_goods_category_2'])['category_name'];
        $block_info['base_info']['goods_category_name_3'] = $goods_category->getName($block_info['base_info']['recommend_goods_category_3'])['category_name'];
        //var_dump($block_info);
        $this->assign('block_info', $block_info['base_info']);
        return view($this->style . "Config/updateBlock");
    }
    
    /**
     * 首页板块的显示与不显示
     */
    public function setWebBlockIsBlock()
    {
        if (request()->isAjax()) {
            $block_id = request()->post('block_id', '');
            $is_display = request()->post('is_display', '');
            $platform = new Platform();
            $res = $platform->setWebBlockIsBlock($block_id, $is_display);
            return AjaxReturn($res);
        }
    }
    
    /**
     * 促销 版块
     */
    public function goodsRecommendClass()
    {
        $platform = new Platform();
        $goods_recommend_class = $platform->getPlatformGoodsRecommendClass();
        $this->assign('goods_recommend_class', $goods_recommend_class);
        $goods_category = new GoodsCategory();
        $category_list_1 = $goods_category->getGoodsCategoryList(1, 0, [
            'is_visible' => 1,
            'level' => 1
        ]);
        $this->assign('category_list_1', $category_list_1['data']);
        return view($this->style . "Config/goodsRecommendClass");
    }
    
    /**
     * 获取促销版块 单个详情
     */
    public function getGoodsRecommendClass()
    {
        $class_id = isset($_POST['class_id']) ? $_POST['class_id'] : '';
        $platform = new Platform();
        $info = $platform->getPlatformGoodsRecommendClassDetail($class_id);
        return $info;
    }
    /**
     * 查询 商品分类 列表 通过 ajax
     */
    public function getGoodsCategoryListAjax()
    {
        $goods_category = new GoodsCategory();
        $goods_category_id = request()->post('category_id', 0);
        $list = $goods_category->getGoodsCategoryList(1, 0, [
            'pid' => $goods_category_id,
            'is_visible' => 1
        ], 'sort', 'category_id, category_name');
        return $list['data'];
    }
    /**
     * 搜索商品
     */
//     public function searchGoods()
//     {
//         $goods_name = request()->post('goods_name', '');
//         $category_id = request()->post('category_id', '');
//         $category_level = request()->post('category_level', '');
//         $where['ng.goods_name'] = array(
//             'like',
//             '%' . $goods_name . '%'
//         );
//         $where['ng.category_id_' . $category_level] = $category_id;
//         $where['ng.state'] = 1;
//         $where = array_filter($where);
//         $goods = new Goods();
//         $list = $goods->getGoodsList(1, 0, $where);
//         return $list;
//     }
    public function searchGoods()
    {
         $goods_name = request()->post('goods_name', '');
        $category_id = request()->post('category_id', '');
        $category_level = request()->post('category_level', '');
        $where['ng.goods_name'] = array(
            'like',
            '%' . $goods_name . '%'
        );
        $where['ng.category_id_' . $category_level] = $category_id;
        $where['ng.state'] = 1;
        $where = array_filter($where);
        $goods = new Goods();
        $list = $goods->getGoodsList(1, 0, $where);
        return $list;
    }
    
    /**
     * 编辑促销版块
     */
    public function updateGoodsRecommendClass()
    {
        $class_id = isset($_POST['class_id']) ? $_POST['class_id'] : 0;
        $class_name = isset($_POST['class_name']) ? $_POST['class_name'] : '';
        $goods_id_array = isset($_POST['goods_id_str']) ? $_POST['goods_id_str'] : '';
        $sort = isset($_POST['sort']) ? $_POST['sort'] : '';
        $platform = new Platform();
        $res = $platform->updatePlatformGoodsRecommendClass($class_id, $class_name, $sort, $goods_id_array);
        return AjaxReturn($res);
    }
    
    /**
     * 删除 促销版块
     *
     * @return unknown[]
     */
    public function delGoodsRecommendClass()
    {
        $class_id = isset($_POST['class_id']) ? $_POST['class_id'] : 0;
        if ($class_id > 0) {
            $platform = new Platform();
            $res = $platform->deletePlatformGoodsRecommendClass($class_id);
            return AjaxReturn($res);
        } else {
            return AjaxReturn(0);
        }
    }
    
    /**
     *广告设置列表
     */
    public function platformadvpositionlist(){
        if (request()->isAjax()) {
            $page_index = request()->post("pageIndex", 1);
            $page_size = request()->post('page_size', PAGESIZE);
            $ap_name = request()->post('search_text', '');
            $type = request()->post('type', '');
            $ap_display = request()->post('ap_display', '');
            $platform = new Platform();
            if ($type != "") {
                $condition['type'] = $type;
            }
            if ($ap_display != "") {
                $condition['ap_display'] = $ap_display;
            }
            if (! empty($ap_name)) {
                $condition["ap_name"] = array(
                    "like",
                    "%" . $ap_name . "%"
                );
            }
            $condition['instance_id'] = $this->instance_id;
            $list = $platform->getPlatformAdvPositionList($page_index, $page_size, $condition,'');
            return $list;
        }
        return view($this->style . "Config/platformAdvPositionList");
    }
    /**
     * 管理广告位
     */
    public function platformadvlist()
    {
        $ap_id = isset($_GET['ap_id']) ? $_GET['ap_id'] : '';
        $this->assign('ap_id', $ap_id);
        if (request()->isAjax()) {
            $page_index = request()->post("pageIndex", 1);
            $page_size = request()->post("page_size", PAGESIZE);
            $search_text = isset($_POST['search_text']) ? $_POST['search_text'] : '';
            $ap_id = isset($_POST['ap_id']) ? $_POST['ap_id'] : '';
            $platform = new Platform();
            $list = $platform->getPlatformAdvList($page_index, $page_size, [
                'ap_id' => $ap_id,
                'adv_title' => array(
                    'like',
                    '%' . $search_text . '%'
                )
            ]);
            return $list;
        }
        return view($this->style . "Config/platformAdvList");
    }
    /**
     * 添加广告
     */
    public function addPlatformAdv()
    {
        if (request()->isAjax()) {
            $ap_id = isset($_POST['ap_id']) ? $_POST['ap_id'] : '';
            $adv_title = isset($_POST['adv_title']) ? $_POST['adv_title'] : '';
            $adv_url = isset($_POST['adv_url']) ? $_POST['adv_url'] : '';
            $adv_image = isset($_POST['adv_image']) ? $_POST['adv_image'] : '';
            $slide_sort = isset($_POST['slide_sort']) ? $_POST['slide_sort'] : '';
            $background = isset($_POST['background']) ? $_POST['background'] : '';
            $platform = new Platform();
            $res = $platform->addPlatformAdv($ap_id, $adv_title, $adv_url, $adv_image, $slide_sort, $background);
            return AjaxReturn($res);
        }
        $ap_id = isset($_GET['ap_id']) ? $_GET['ap_id'] : '';
        $platform = new Platform();
        $list = $platform->getPlatformAdvPositionList(1, 0, '', '', 'ap_id,ap_name,ap_class,ap_display');
        $this->assign('platform_adv_position_list', $list['data']);
        $this->assign('ap_id', $ap_id);
        return view($this->style . "Config/addPlatformAdv");
    }
    /**
     * 修改广告位
     */
    public function updateplatformadv()
    {
        $platform = new Platform();
        if (request()->isAjax()) {
            $adv_id = isset($_POST['adv_id']) ? $_POST['adv_id'] : '';
            $ap_id = isset($_POST['ap_id']) ? $_POST['ap_id'] : '';
            $adv_title = isset($_POST['adv_title']) ? $_POST['adv_title'] : '';
            $adv_url = isset($_POST['adv_url']) ? $_POST['adv_url'] : '';
            $adv_image = isset($_POST['adv_image']) ? $_POST['adv_image'] : '';
            $slide_sort = isset($_POST['slide_sort']) ? $_POST['slide_sort'] : '';
            $background = isset($_POST['background']) ? $_POST['background'] : '';
            $res = $platform->updatePlatformAdv($adv_id, $ap_id, $adv_title, $adv_url, $adv_image, $slide_sort, $background);
            return AjaxReturn($res);
        }
        $adv_id = isset($_GET['adv_id']) ? $_GET['adv_id'] : '';
        $adv_info = $platform->getPlatformAdDetail($adv_id);
        $this->assign('adv_info', $adv_info);
        $list = $platform->getPlatformAdvPositionList(1, 0, '', '', 'ap_id,ap_name,ap_class,ap_display');
        $this->assign('platform_adv_position_list', $list['data']);
        return view($this->style . "config/updateplatformadv");
    }
    /**
     * 添加广告位
     *
     * @return \think\response\View
     */
    public function addPlatformAdvPosition()
    {
        if (request()->isAjax()) {
            $ap_name = isset($_POST['ap_name']) ? $_POST['ap_name'] : '';
            $ap_intro = isset($_POST['ap_intro']) ? $_POST['ap_intro'] : '';
            $ap_class = isset($_POST['ap_class']) ? $_POST['ap_class'] : 0;
            $ap_display = isset($_POST['ap_display']) ? $_POST['ap_display'] : 2;
            $is_use = isset($_POST['is_use']) ? $_POST['is_use'] : 0;
            $ap_height = isset($_POST['ap_height']) ? $_POST['ap_height'] : '';
            $ap_width = isset($_POST['ap_width']) ? $_POST['ap_width'] : '';
            $default_content = isset($_POST['default_content']) ? $_POST['default_content'] : '';
            $ap_background_color = isset($_POST['ap_background_color']) ? $_POST['ap_background_color'] : '';
            $type = isset($_POST['type']) ? $_POST['type'] : '';
            $platform = new Platform();
            $res = $platform->addPlatformAdvPosition($this->instance_id, $ap_name, $ap_intro, $ap_class, $ap_display, $is_use, $ap_height, $ap_width, $default_content, $ap_background_color, $type);
            return AjaxReturn($res);
        }
        return view($this->style . "Config/addPlatformAdvPosition");
    }
    /**
     * 修改广告位
     */
    public function updateplatformadvposition()
    {
        $platform = new Platform();
        if (request()->isAjax()) {
            $ap_id = isset($_POST['ap_id']) ? $_POST['ap_id'] : '';
            $ap_name = isset($_POST['ap_name']) ? $_POST['ap_name'] : '';
            $ap_intro = isset($_POST['ap_intro']) ? $_POST['ap_intro'] : '';
            $ap_class = isset($_POST['ap_class']) ? $_POST['ap_class'] : 0;
            $ap_display = isset($_POST['ap_display']) ? $_POST['ap_display'] : 2;
            $is_use = isset($_POST['is_use']) ? $_POST['is_use'] : 0;
            $ap_height = isset($_POST['ap_height']) ? $_POST['ap_height'] : '';
            $ap_width = isset($_POST['ap_width']) ? $_POST['ap_width'] : '';
            $default_content = isset($_POST['default_content']) ? $_POST['default_content'] : '';
            $ap_background_color = isset($_POST['ap_background_color']) ? $_POST['ap_background_color'] : '';
            $type = isset($_POST['type']) ? $_POST['type'] : '';
            $res = $platform->updatePlatformAdvPosition($ap_id, $this->instance_id, $ap_name, $ap_intro, $ap_class, $ap_display, $is_use, $ap_height, $ap_width, $default_content, $ap_background_color, $type);
            return AjaxReturn($res);
        }
        $id = isset($_GET['ap_id']) ? $_GET['ap_id'] : '';
        $info = $platform->getPlatformAdvPositionDetail($id);
        $this->assign('info', $info);
        return view($this->style . "config/updateplatformadvposition");
    }
    /**
     * 删除广告位
     */
    public function delPlatformAdv()
    {
        $adv_id = isset($_POST['adv_id']) ? $_POST['adv_id'] : '';
        $platform = new Platform();
        $res = $platform->deletePlatformAdv($adv_id);
        return AjaxReturn($res);
    }
    /*
     *广告位的启用禁用 
     */
    public function setPlatformAdvPositionUse()
    {
        if (request()->isAjax()) {
            $ap_id = request()->post('ap_id', '');
            $is_use = request()->post('is_use', '');
            $platform = new Platform();
            $res = $platform->setPlatformAdvPositionUse($ap_id, $is_use);
            return AjaxReturn($res);
        }
    }
    /**
     * 用户通知 设置
     *
     * @return \think\response\View
     */
    public function userNotice()
    {
        $web_config = new WebConfig();
        if (request()->isAjax()) {
            $user_notice = isset($_POST['user_notice']) ? $_POST['user_notice'] : '';
            $res = $web_config->setUserNotice($this->instance_id, $user_notice, 1);
            return AjaxReturn($res);
        }
        $user_notice = $web_config->getUserNotice($this->instance_id);
        $this->assign('user_notice', $user_notice);
        return view($this->style . 'Config/userNotice');
    }

    /**
     * 奖励管理
     */
    public function bonuses()
    {
        if (request()->isAjax()) {
            $shop_id = $this->instance_id;
            $sign_point = isset($_POST['sign_point']) ? $_POST['sign_point'] : 0;
            $share_point = isset($_POST['share_point']) ? $_POST['share_point'] : 0;
            $reg_member_self_point = isset($_POST['reg_member_self_point']) ? $_POST['reg_member_self_point'] : 0;
            $reg_member_one_point = 0;
            $reg_member_two_point = 0;
            $reg_member_three_point = 0;
            $reg_promoter_self_point = 0;
            $reg_promoter_one_point = 0;
            $reg_promoter_two_point = 0;
            $reg_promoter_three_point = 0;
            $reg_partner_self_point = 0;
            $reg_partner_one_point = 0;
            $reg_partner_two_point = 0;
            $reg_partner_three_point = 0;
            $into_store_coupon = isset($_POST['into_store_coupon']) ? $_POST['into_store_coupon'] : 0;
            $share_coupon = isset($_POST['share_coupon']) ? $_POST['share_coupon'] : 0;
            $dataShop = new Shop();
            $res = $dataShop->setRewardRule($shop_id, $sign_point, $share_point, $reg_member_self_point, $reg_member_one_point, $reg_member_two_point, $reg_member_three_point, $reg_promoter_self_point, $reg_promoter_one_point, $reg_promoter_two_point, $reg_promoter_three_point, $reg_partner_self_point, $reg_partner_one_point, $reg_partner_two_point, $reg_partner_three_point, $into_store_coupon, $share_coupon);
            return AjaxReturn($res);
        }
        $dataShop = new Shop();
        $res = $dataShop->getRewardRuleDetail($this->instance_id);
        $this->assign("res", $res);
        // 查询未过期的优惠劵
        $coupon = new Promotion();
        $condition['shop_id'] = $this->instance_id;
        $nowTime = date("Y-m-d H:i:s");
        $condition['end_time'] = array(
            ">",
            $nowTime
        );
        $list = $coupon->getCouponTypeList(1, 0, $condition);
        $this->assign("coupon", $list['data']);
        return view($this->style . 'Config/bonuses');
    }

    /**
     * 修改公告
     *
     * @return Ambigous <multitype:unknown, multitype:unknown unknown string >|Ambigous <\think\response\View, \think\response\$this, \think\response\View>
     */
    public function updateNotice()
    {
        $web_config = new WebConfig();
        $shopid = $this->instance_id;
        if (request()->isAjax()) {
            $notice_message = request()->post('notice_message', '');
            $is_enable = request()->post('is_enable', '');
            $res = $web_config->setNotice($shopid, $notice_message, $is_enable);
            return AjaxReturn($res);
        }
        
        $info = $web_config->getNotice($shopid);
        $this->assign('info', $info);
        return view($this->style . 'Config/updatenotice');
    }

    public function areaManagement()
    {
        $dataAddress = new DataAddress();
        $area_list = $dataAddress->getAreaList(); // 区域地址
        $list = $dataAddress->getProvinceList();
        foreach ($list as $k => $v) {
            if ($dataAddress->getCityCountByProvinceId($v['province_id']) > 0) {
                $v['issetLowerLevel'] = 1;
            } else {
                $v['issetLowerLevel'] = 0;
            }
            if (! empty($area_list)) {
                foreach ($area_list as $area) {
                    if ($area['area_id'] == $v['area_id']) {
                        $list[$k]['area_name'] = $area['area_name'];
                        break;
                    }
                }
            }
        }
        $this->assign("area_list", $area_list);
        $this->assign("list", $list);
        return view($this->style . 'Config/areaManagement');
    }

    public function selectCityListAjax()
    {
        if (request()->isAjax()) {
            $province_id = request()->post('province_id', '');
            $dataAddress = new DataAddress();
            $list = $dataAddress->getCityList($province_id);
            foreach ($list as $v) {
                if ($dataAddress->getDistrictCountByCityId($v['city_id']) > 0) {
                    $v['issetLowerLevel'] = 1;
                } else {
                    $v['issetLowerLevel'] = 0;
                }
            }
            return $list;
        }
    }

    public function selectDistrictListAjax()
    {
        if (request()->isAjax()) {
            $city_id = request()->post('city_id', '');
            $dataAddress = new DataAddress();
            $list = $dataAddress->getDistrictList($city_id);
            return $list;
        }
    }

    public function addCityAjax()
    {
        if (request()->isAjax()) {
            $dataAddress = new DataAddress();
            $city_id = 0;
            $province_id = request()->post('superiorRegionId', '');
            $city_name = request()->post('regionName', '');
            $zipcode = request()->post('zipcode', '');
            $sort = request()->post('regionSort', '');
            $res = $dataAddress->addOrupdateCity($city_id, $province_id, $city_name, $zipcode, $sort);
            return AjaxReturn($res);
        }
    }

    public function updateCityAjax()
    {
        if (request()->isAjax()) {
            $dataAddress = new DataAddress();
            $city_id = request()->post('eventId', '');
            $province_id = request()->post('superiorRegionId', '');
            $city_name = request()->post('regionName', '');
            $zipcode = request()->post('zipcode', '');
            $sort = request()->post('regionSort', '');
            $res = $dataAddress->addOrupdateCity($city_id, $province_id, $city_name, $zipcode, $sort);
            return AjaxReturn($res);
        }
    }

    public function addDistrictAjax()
    {
        if (request()->isAjax()) {
            $dataAddress = new DataAddress();
            $district_id = 0;
            $city_id = request()->post('superiorRegionId', '');
            $district_name = request()->post('regionName', '');
            $sort = request()->post('regionSort', '');
            $res = $dataAddress->addOrupdateDistrict($district_id, $city_id, $district_name, $sort);
            return AjaxReturn($res);
        }
    }

    public function updateDistrictAjax()
    {
        if (request()->isAjax()) {
            $dataAddress = new DataAddress();
            $district_id = request()->post('eventId', '');
            $city_id = request()->post('superiorRegionId', '');
            $district_name = request()->post('regionName', '');
            $sort = request()->post('regionSort', '');
            $res = $dataAddress->addOrupdateDistrict($district_id, $city_id, $district_name, $sort);
            return AjaxReturn($res);
        }
    }

    public function updateProvinceAjax()
    {
        if (request()->isAjax()) {
            $dataAddress = new DataAddress();
            $province_id = request()->post('eventId', '');
            $province_name = request()->post('regionName', '');
            $sort = request()->post('regionSort', '');
            $area_id = request()->post('area_id', '');
            $res = $dataAddress->updateProvince($province_id, $province_name, $sort, $area_id);
            return AjaxReturn($res);
        }
    }

    public function addProvinceAjax()
    {
        if (request()->isAjax()) {
            $dataAddress = new DataAddress();
            $province_name = request()->post('regionName', ''); // 区域名称
            $sort = request()->post('regionSort', ''); // 排序
            $area_id = request()->post('area_id', 0); // 区域id
            $res = $dataAddress->addProvince($province_name, $sort, $area_id);
            return AjaxReturn($res);
        }
    }

    public function deleteRegion()
    {
        if (request()->isAjax()) {
            $type = request()->post('type', '');
            $regionId = request()->post('regionId', '');
            $dataAddress = new DataAddress();
            if ($type == 1) {
                $res = $dataAddress->deleteProvince($regionId);
                return AjaxReturn($res);
            }
            if ($type == 2) {
                $res = $dataAddress->deleteCity($regionId);
                return AjaxReturn($res);
            }
            if ($type == 3) {
                $res = $dataAddress->deleteDistrict($regionId);
                return AjaxReturn($res);
            }
        }
    }

    public function updateRegionAjax()
    {
        if (request()->isAjax()) {
            $dataAddress = new DataAddress();
            $upType = request()->post('upType', '');
            $regionType = request()->post('regionType', '');
            $regionName = request()->post('regionName', '');
            $regionSort = request()->post('regionSort', '');
            $regionId = request()->post('regionId', '');
            $res = $dataAddress->updateRegionNameAndRegionSort($upType, $regionType, $regionName, $regionSort, $regionId);
            return AjaxReturn($res);
        }
    }

    /**
     * 购物设置
     */
    public function shopSet()
    {
        if (request()->isAjax()) {
            $shop_id = $this->instance_id;
            $order_auto_delinery = request()->post("order_auto_delinery", '') ? request()->post("order_auto_delinery", '') : 0;
            
            $order_balance_pay = request()->post("order_balance_pay", '') ? request()->post("order_balance_pay", '') : 0;
            $order_delivery_complete_time = request()->post("order_delivery_complete_time", '') ? request()->post("order_delivery_complete_time", '') : 0;
            $order_show_buy_record = request()->post("order_show_buy_record", '') ? request()->post("order_show_buy_record", '') : 0;
            $order_invoice_tax = request()->post("order_invoice_tax", '') ? request()->post("order_invoice_tax", '') : 0;
            $order_invoice_content = request()->post("order_invoice_content", '') ? request()->post("order_invoice_content", '') : '';
            $order_delivery_pay = request()->post("order_delivery_pay", '') ? request()->post("order_delivery_pay", '') : 0;
            $order_buy_close_time = request()->post("order_buy_close_time", '') ? request()->post("order_buy_close_time", '') : 0;
            $buyer_self_lifting = request()->post("buyer_self_lifting", '') ? request()->post("buyer_self_lifting", '') : 0;
            $seller_dispatching = request()->post("seller_dispatching", '1');
            $shopping_back_points = request()->post("shopping_back_points", '') ? request()->post("shopping_back_points", '') : 0;
            //var_dump($seller_dispatching);die;
            $Config = new WebConfig();
            $retval = $Config->SetShopConfig($shop_id, $order_auto_delinery, $order_balance_pay, $order_delivery_complete_time, $order_show_buy_record, $order_invoice_tax, $order_invoice_content, $order_delivery_pay, $order_buy_close_time, $buyer_self_lifting, $seller_dispatching,$shopping_back_points);
            return AjaxReturn($retval);
        } else {
            $Config = new WebConfig();
            // 订单收货之后多长时间自动完成
            $shop_id = $this->instance_id;
            $shopSet = $Config->getShopConfig($shop_id);
            $this->assign("shopSet", $shopSet);
            return view($this->style . "Config/shopSet");
        }
    }

    /**
     * 通知系统
     */
    public function notifyIndex()
    {
        $config_service = new WebConfig();
        $shop_id = $this->instance_id;
        $notify_list = $config_service->getNoticeConfig($shop_id);
        $this->assign("notify_list", $notify_list);
        return view($this->style . 'Config/notifyConfig');
    }

    /**
     * 开启和关闭 邮件 和短信的开启和 关闭
     */
    public function updateNotifyEnable()
    {
        $id = $_POST["id"];
        $is_use = $_POST["is_use"];
        $config_service = new WebConfig();
        $retval = $config_service->updateConfigEnable($id, $is_use);
        return AjaxReturn($retval);
    }

    /**
     * 修改模板
     *
     * @return \think\response\View
     */
    public function notifyTemplate()
    {
        $type = isset($_GET["type"]) ? $_GET["type"] : "email";
        $config_service = new WebConfig();
        $shop_id = $this->instance_id;
        $template_detail = $config_service->getNoticeTemplateDetail($shop_id, $type);
        $template_type_list = $config_service->getNoticeTemplateType($type);
        for ($i = 0; $i < count($template_type_list); $i ++) {
            $template_code = $template_type_list[$i]["template_code"];
            $is_enable = 0;
            $template_title = "";
            $template_content = "";
            $sign_name = "";
            foreach ($template_detail as $template_obj) {
                if ($template_obj["template_code"] == $template_code) {
                    $is_enable = $template_obj["is_enable"];
                    $template_title = $template_obj["template_title"];
                    $template_content = $template_obj["template_content"];
                    $sign_name = $template_obj["sign_name"];
                    break;
                }
            }
            $template_type_list[$i]["is_enable"] = $is_enable;
            $template_type_list[$i]["template_title"] = $template_title;
            $template_type_list[$i]["template_content"] = $template_content;
            $template_type_list[$i]["sign_name"] = $sign_name;
        }
        $template_item_list = $config_service->getNoticeTemplateItem($template_type_list[0]["template_code"]);
        $this->assign("template_type_list", $template_type_list);
        $this->assign("template_json", json_encode($template_type_list));
        $this->assign("template_select", $template_type_list[0]);
        $this->assign("template_item_list", $template_item_list);
        $this->assign("template_send_item_json", json_encode($template_item_list));
        if ($type == "email") {
            return view($this->style . 'Config/notifyEmailTemplate');
        } else {
            return view($this->style . 'Config/notifySmsTemplate');
        }
    }
    
    /**
     * 修改邮件通知模板
     */
    public function notifyemailtemplate(){
        $type = "email";
        $config_service = new WebConfig();
        $shop_id = $this->instance_id;
        $template_detail = $config_service->getNoticeTemplateDetail($shop_id, $type);
        $template_type_list = $config_service->getNoticeTemplateType($type);
        for ($i = 0; $i < count($template_type_list); $i ++) {
            $template_code = $template_type_list[$i]["template_code"];
            $is_enable = 0;
            $template_title = "";
            $template_content = "";
            $sign_name = "";
            foreach ($template_detail as $template_obj) {
                if ($template_obj["template_code"] == $template_code) {
                    $is_enable = $template_obj["is_enable"];
                    $template_title = $template_obj["template_title"];
                    $template_content = $template_obj["template_content"];
                    $sign_name = $template_obj["sign_name"];
                    break;
                }
            }
            $template_type_list[$i]["is_enable"] = $is_enable;
            $template_type_list[$i]["template_title"] = $template_title;
            $template_type_list[$i]["template_content"] = $template_content;
            $template_type_list[$i]["sign_name"] = $sign_name;
        }
        $template_item_list = $config_service->getNoticeTemplateItem($template_type_list[0]["template_code"]);
        $this->assign("template_type_list", $template_type_list);
        $this->assign("template_json", json_encode($template_type_list));
        $this->assign("template_select", $template_type_list[0]);
        $this->assign("template_item_list", $template_item_list);
        //var_dump($template_item_list);die;
        $this->assign("template_send_item_json", json_encode($template_item_list));
        return view($this->style . 'Config/notifyemailtemplate');
    }
    
    /**
     * 修改短信通知模板
     */
    public function notifysmstemplate(){
        $type = "sms";
        $config_service = new WebConfig();
        $shop_id = $this->instance_id;
        $template_detail = $config_service->getNoticeTemplateDetail($shop_id, $type);
        $template_type_list = $config_service->getNoticeTemplateType($type);
        for ($i = 0; $i < count($template_type_list); $i ++) {
            $template_code = $template_type_list[$i]["template_code"];
            $is_enable = 0;
            $template_title = "";
            $template_content = "";
            $sign_name = "";
            foreach ($template_detail as $template_obj) {
                if ($template_obj["template_code"] == $template_code) {
                    $is_enable = $template_obj["is_enable"];
                    $template_title = $template_obj["template_title"];
                    $template_content = $template_obj["template_content"];
                    $sign_name = $template_obj["sign_name"];
                    break;
                }
            }
            $template_type_list[$i]["is_enable"] = $is_enable;
            $template_type_list[$i]["template_title"] = $template_title;
            $template_type_list[$i]["template_content"] = $template_content;
            $template_type_list[$i]["sign_name"] = $sign_name;
        }
        $template_item_list = $config_service->getNoticeTemplateItem($template_type_list[0]["template_code"]);
        $this->assign("template_type_list", $template_type_list);
        $this->assign("template_json", json_encode($template_type_list));
        $this->assign("template_select", $template_type_list[0]);
        $this->assign("template_item_list", $template_item_list);
        $this->assign("template_send_item_json", json_encode($template_item_list));
        return view($this->style . 'Config/notifysmstemplate');
    }   

    /**
     * 得到可用的变量
     *
     * @return unknown
     */
    public function getTemplateItem()
    {
        $template_code = $_POST["template_code"];
        $config_service = new WebConfig();
        $template_item_list = $config_service->getNoticeTemplateItem($template_code);
        return $template_item_list;
    }

    /**
     * 更新通知模板
     *
     * @return multitype:unknown
     */
    public function updateNotifyTemplate()
    {
        $template_code = isset($_POST["type"]) ? $_POST["type"] : "email";
        $template_data = isset($_POST["template_data"]) ? $_POST["template_data"] : "";
        $shop_id = $this->instance_id;
        $config_service = new WebConfig();
        $retval = $config_service->updateNoticeTemplate($shop_id, $template_code, $template_data);
        return AjaxReturn($retval);
    }

    /**
     * 会员提现设置
     *
     * @return multitype:number unknown |Ambigous <\think\response\View, \think\response\$this, \think\response\View>
     */
    public function memberWithdrawSetting()
    {
        if (request()->isAjax()) {
            $shop_id = $this->instance_id;
            $key = 'WITHDRAW_BALANCE';
            $value = array(
                'withdraw_cash_min' => $_POST['cash_min'] ? $_POST['cash_min'] : 0,
                'withdraw_multiple' => $_POST['multiple'] ? $_POST['multiple'] : 1,
                'withdraw_poundage' => $_POST['poundage'] ? $_POST['poundage'] : 0,
                'withdraw_message' => $_POST['message'] ? $_POST['message'] : ''
            );
            $is_use = $_POST['is_use'];
            $config_service = new WebConfig();
            $retval = $config_service->setBalanceWithdrawConfig($shop_id, $key, $value, $is_use);
            return AjaxReturn($retval);
        } else {
            $shop_id = $this->instance_id;
            $config_service = new WebConfig();
            $list = $config_service->getBalanceWithdrawConfig($shop_id);
            if (empty($list)) {
                $list['id'] = '';
                $list['value']['withdraw_cash_min'] = '';
                $list['value']['withdraw_multiple'] = '';
                $list['value']['withdraw_poundage'] = '';
                $list['value']['withdraw_message'] = '';
            }
            $this->assign("list", $list);
            return view($this->style . "Config/memberWithdrawSetting");
        }
    }

    /**
     * 用户提现审核
     *
     * @return Ambigous <multitype:unknown, multitype:unknown unknown string >
     */
    public function userCommissionWithdrawAudit()
    {
        $id = $_POST["id"];
        $status = $_POST["status"];
        $user = new User();
        $retval = $user->UserCommissionWithdrawAudit($this->instance_id, $id, $status);
        return AjaxReturn($retval);
    }

    /**
     * 支付
     *
     * @return Ambigous <\think\response\View, \think\response\$this, \think\response\View>
     */
    public function paymentConfig()
    {
        $config_service = new WebConfig();
        $shop_id = $this->instance_id;
        $pay_list = $config_service->getPayConfig($shop_id);
        $this->assign("pay_list", $pay_list);
        return view($this->style . 'Config/paymentConfig');
    }

    /**
     * 第三方登录页面
     */
    public function partyLogin()
    {
        $web_config = new WebConfig();
        // qq登录配置
        // 获取当前域名
        $domain_name = \think\Request::instance()->domain();
        // 获取回调域名qq回调域名
        $qq_call_back = $domain_name . \think\Request::instance()->root() . '/wap/login/callback';
        // 获取qq配置信息
        $qq_config = $web_config->getQQConfig($this->instance_id);
        // dump($qq_config);
        $qq_config['value']["AUTHORIZE"] = $domain_name;
        $qq_config['value']["CALLBACK"] = $qq_call_back;
        $qq_config['name'] = 'qq登录';
        $this->assign("qq_config", $qq_config);
        // 微信登录配置
        // 微信登录返回
        $wchat_call_back = $domain_name . \think\Request::instance()->root() . '/wap/Login/callback';
        $wchat_config = $web_config->getWchatConfig($this->instance_id);
        $wchat_config['value']["AUTHORIZE"] = $domain_name;
        $wchat_config['value']["CALLBACK"] = $wchat_call_back;
        $wchat_config['name'] = '微信登录';
        $this->assign("wchat_config", $wchat_config);
        return view($this->style . 'Config/partyLogin');
    }

    /**
     * 配送地区管理
     */
    public function distributionAreaManagement()
    {
        $dataAddress = new DataAddress();
        $provinceList = $dataAddress->getProvinceList();
        $cityList = $dataAddress->getCityList();
        foreach ($provinceList as $k => $v) {
            $arr = array();
            foreach ($cityList as $c => $co) {
                if ($co["province_id"] == $v['province_id']) {
                    $arr[] = $co;
                    unset($cityList[$c]);
                }
            }
            $provinceList[$k]['city_list'] = $arr;
        }
        $this->assign("list", $provinceList);
        $districtList = $dataAddress->getDistrictList();
        $this->assign("districtList", $districtList);
        $this->getDistributionArea();
        return view($this->style . "Config/distributionAreaManagement");
    }

    /**
     * 注册与访问
     */
    public function giftFreeChance()
    {
        $config_service = new WebConfig();
        if (request()->isAjax()) {
            $shop_id = $this->instance_id;
            $is_open = request()->post('isopen', '0');

            $chance = request()->post('chance', '999');

            $res = $config_service->setGiftFreeChance($shop_id, $is_open, $chance);
            return AjaxReturn($res);
        } else {
            $gift_free_chance = $config_service->getGiftFreeChance($this->instance_id);
            $this->assign('gift_free_chance', json_decode($gift_free_chance['value'],true));
            return view($this->style . "Config/giftFreeChance");
        }
    }

    /**
     * 获取配送地区设置
     */
    public function getDistributionArea()
    {
        $dataAddress = new DataAddress();
        $res = $dataAddress->getDistributionAreaInfo($this->instance_id);
        if ($res != '') {
            $this->assign("provinces", explode(',', $res['province_id']));
            $this->assign("citys", explode(',', $res['city_id']));
            $this->assign("districts", $res["district_id"]);
        }
    }

    /**
     * 通过ajax添加或编辑配送区域
     */
    public function addOrUpdateDistributionAreaAjax()
    {
        if (request()->isAjax()) {
            $dataAddress = new DataAddress();
            $shop_id = $this->instance_id;
            $province_id = request()->post("province_id", "");
            $city_id = request()->post("city_id", "");
            $district_id = request()->post("district_id", "");
            $res = $dataAddress->addOrUpdateDistributionArea($shop_id, $province_id, $city_id, $district_id);
            return AjaxReturn($res);
        }
    }
    /**
     * 积分管理
     */
   public function pointConfig()
    {
        $pointConfig = new PromotionService();
        if (request()->isAjax()) {
            $convert_rate = isset($_POST['convert_rate']) ? $_POST['convert_rate'] : '';
            $is_open = isset($_POST['is_open']) ? $_POST['is_open'] : 0;
            $desc = isset($_POST['desc']) ? $_POST['desc'] : 0;
            $retval = $pointConfig->setPointConfig($convert_rate, $is_open, $desc);
            return AjaxReturn($retval);
        }
        $pointconfiginfo = $pointConfig->getPointConfig();
        $this->assign("pointconfiginfo", $pointconfiginfo);
        return view($this->style . "Config/pointConfig");
    }
    /**
     * 积分奖励
     */
    public function integral()
    {
        if (request()->isAjax()) {
            $shop_id = $this->instance_id;
            $sign_point = isset($_POST['sign_point']) ? $_POST['sign_point'] : 0;
            $share_point = isset($_POST['share_point']) ? $_POST['share_point'] : 0;
            $reg_member_self_point = isset($_POST['reg_member_self_point']) ? $_POST['reg_member_self_point'] : 0;
            $reg_member_one_point = 0;
            $reg_member_two_point = 0;
            $reg_member_three_point = 0;
            $reg_promoter_self_point = 0;
            $reg_promoter_one_point = 0;
            $reg_promoter_two_point = 0;
            $reg_promoter_three_point = 0;
            $reg_partner_self_point = 0;
            $reg_partner_one_point = 0;
            $reg_partner_two_point = 0;
            $reg_partner_three_point = 0;
            $rewardRule = new PromoteRewardRule();
            $res = $rewardRule->setPointRewardRule($shop_id, $sign_point, $share_point, $reg_member_self_point, $reg_member_one_point, $reg_member_two_point, $reg_member_three_point, $reg_promoter_self_point, $reg_promoter_one_point, $reg_promoter_two_point, $reg_promoter_three_point, $reg_partner_self_point, $reg_partner_one_point, $reg_partner_two_point, $reg_partner_three_point);
            return AjaxReturn($res);
        }
        $rewardRule = new PromoteRewardRule();
        $res = $rewardRule->getRewardRuleDetail($this->instance_id);
        $Config = new WebConfig();
        $integralConfig = $Config->getIntegralConfig($this->instance_id);
        $this->assign("res", $res);
        $this->assign("integralConfig", $integralConfig);
        return view($this->style . "/config/integral");
    }
    
    
    /**
     * 物流跟踪
     */
    public function databaseList(){
        if(request()->isAjax()){
            $web_config = new WebConfig();
            $database_list = $web_config->getDatabaseList();
            //将所有建都转为小写
            $database_list = array_map('array_change_key_case', $database_list);
            foreach($database_list as $k=>$v){
               $database_list[$k]["data_length_info"] = format_bytes($v['data_length']);
            }
            return $database_list;
        }else{
            $child_menu_list = array(
                array(
                    'url' => "Config/DatabaseList",
                    'menu_name' => "数据库备份",
                    "active" => 1
                ),
                array(
                    'url' => "Config/importDataList",
                    'menu_name' => "数据库恢复",
                    "active" => 0
                )
            );
            $this->assign('child_menu_list', $child_menu_list);
            return view($this->style."Config/databaseList");
           
        }   
    }           

    public function expressMessage()
    {
        if (request()->isAjax()) {
            $config_service = new WebConfig();
            $shop_id = $this->instance_id;
            $appid = request()->post("appid", "");
            $appkey = request()->post("appkey", "");
            $back_url = request()->post('back_url', "");
            $is_use = request()->post("is_use", "");
            $res = $config_service->updateOrderExpressMessageConfig($shop_id, $appid, $appkey, $back_url, $is_use);
            return AjaxReturn($res);
        } else {
            $config_service = new WebConfig();
            $shop_id = $this->instance_id;
            $expressMessageConfig = $config_service->getOrderExpressMessageConfig($shop_id);
            $this->assign('emconfig', $expressMessageConfig);
            return view($this->style . "Config/expressMessage");
        }
    }
    /**
    ** 备份数据
    */
    public function exportDatabase(){
        $tables = isset($_POST['tables']) ? $_POST['tables'] : '';
        $id = isset($_POST['id']) ? $_POST['id'] : '';
        $start = isset($_POST['start']) ? $_POST['start'] : '' ;
        if(!empty($tables) && is_array($tables)){ //初始化
            //读取备份配置
            $config = array(
                'path'	 => "runtime/dbsql/",
                'part'	 => 20971520,
                'compress' => 1,
                'level'	=> 9,
            );
            //检查是否有正在执行的任务
            $lock = "{$config['path']}backup.lock";
            if(is_file($lock)){
                exit($lock.'检测到有一个备份任务正在执行，请稍后再试！');
            } else {
                if(!file_exists($config['path']) || !is_dir($config['path'])) mkdir($config['path'],0777,true);
                //创建锁文件
    
                file_put_contents($lock, date('Ymd-His', time()));
            }
            // 自动创建备份文件夹
            //检查备份目录是否可写
            is_writeable($config['path']) || exit('backup_not_exist_success');
            session('backup_config', $config);
            //生成备份文件信息
            $file = array(
                'name' => date('Ymd-His', time()),
                'part' => 1,
            );
    
            session('backup_file', $file);
    
            //缓存要备份的表
            session('backup_tables', $tables);
    
            //创建备份文件
            include 'data\extend\database.class.php';
    
            $database = new database($file, $config);
            if(false !== $database->create()){
                $tab = array('id' => 0, 'start' => 0);
                $data=array();
                $data['status']=1;
                $data['message']='初始化成功';
                $data['tables']=$tables;
                $data['tab']=$tab;
                return $data;
            } else {
                exit('backup_set_error');
            }
        } elseif (is_numeric($id) && is_numeric($start)) { //备份数据
            $tables = session('backup_tables');
            //备份指定表
            include 'data\extend\database.class.php';
            $database = new database(session('backup_file'), session('backup_config'));
            $start  = $database->backup($tables[$id], $start);
            if(false === $start){ //出错
                exit('admin/backup_error');
            } elseif (0 === $start) { //下一表
                if(isset($tables[++$id])){
                    $tab = array('id' => $id,'table'=>$tables[$id],'start' => 0);
                    $data=array();
                    $data['rate'] = 100;
                    $data['status']=1;
                    $data['info']='备份完成！';
                    $data['tab']=$tab;
                    return $data;
                } else { //备份完成，清空缓存
                    unlink("runtime/dbsql/".'backup.lock');
                    session('backup_tables', null);
                    session('backup_file', null);
                    session('backup_config', null);
                    exit('_operation_success_');
                }
            } else {
                $tab  = array('id' => $id,'table'=>$tables[$id],'start' => $start[0]);
                $rate = floor(100 * ($start[0] / $start[1]));
                $data=array();
                $data['status']=1;
                $data['rate'] = $rate;
                $data['info']="正在备份...({$rate}%)";
                $data['tab']=$tab;
                return  $data;
            }
        } else { //出错
            exit('_param_error_');
        }
    }
    
}