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
namespace app\admin\controller;

use app\api\controller\User;
use data\extend\Send;
use data\service\Address as DataAddress;
use data\service\Config as WebConfig;
use data\service\Platform;
use data\service\Promotion;
use data\service\Shop as Shop;
use think\Config as thinkConfig;

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
        if(empty($info) || $info['shop_id'] != $this->instance_id)
        {
            $this->error("当前广告不存在或者当前用户无权限!");
        }
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
            $res = $dataAddress->updateProvince($province_id, $province_name, $area_id);
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
/*
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
        return view($this->style . 'Config/updateNotice');
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
    
}