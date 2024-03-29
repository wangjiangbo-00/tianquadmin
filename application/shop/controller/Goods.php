<?php
/**
 * Goods.php
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
namespace app\shop\controller;

use data\service\Goods as GoodsService;
use data\service\GoodsBrand as GoodsBrand;
use data\service\GoodsCategory as GoodsCategoryService;
use data\service\GoodsGroup as GoodsGroupService;
use data\service\Member as MemberService;
use data\service\Order as OrderService;
use data\service\Platform as PlatformService;
use data\service\promotion\GoodsExpress;
use data\service\Shop as ShopService;
use data\service\Address;
use think\Session;
use data\service\Config;

/**
 * 商品控制器
 * 创建人：李吉
 * 创建时间：2017-02-06 10:59:23
 */
class Goods extends BaseController
{
    
    // 商品
    private $goods = null;

    private $goods_group = null;
    
    // 店铺
    private $shop = null;
    
    // 会员、个人
    private $member = null;
    
    // 商品分类
    private $goods_category = null;
    
    // 平台
    private $platform = null;

    public function __construct()
    {
        parent::__construct();
    }

    public function _empty($name)
    {}

    /**
     * 商品详情
     * 创建人：王永杰
     * 创建时间：2017年2月7日 15:47:00
     *
     * @return \think\response\View
     */
    public function goodsinfo()
    {
        $this->goods_category = new GoodsCategoryService();
        $goodsid = 0;
        if (isset($_GET["goodsid"])) {
            $this->goods = new GoodsService();
            $this->goods_group = new GoodsGroupService();
            $this->shop = new ShopService();
            $this->member = new MemberService();
            $goodsid = (int) $_GET["goodsid"];
            $this->assign('goods_id', $goodsid); // 将商品id传入方便查询当前商品的评论
            $this->member->addMemberViewHistory($goodsid);
            
            // 商品详情
            $goods_info = $this->goods->getGoodsDetail($goodsid);
            if (empty($goods_info)) {
                $this->redirect(__URL__.'/index'); // 没有商品返回到首页
            }
            //把属性值相同的合并
            $goods_attribute_list = $goods_info['goods_attribute_list'];
            $goods_attribute_list_new =array();
            foreach($goods_attribute_list as $item){
                $attr_value_name = '';
                foreach ($goods_attribute_list as $key=>$item_v){
                    if($item_v['attr_value_id'] == $item['attr_value_id']){
                        $attr_value_name .= $item_v['attr_value_name']. ',';
                        unset($goods_attribute_list[$key]);
                    }
                }
                if(!empty($attr_value_name)){
                    array_push($goods_attribute_list_new, array('attr_value_id'=>$item['attr_value_id'],'attr_value'=>$item['attr_value'],'attr_value_name'=>rtrim($attr_value_name,',')));
                }
                 
            }
            $goods_info['goods_attribute_list'] = $goods_attribute_list_new;
            
            $goods_info['member_price'] = sprintf("%.2f", $goods_info['member_price']);
            if ($goods_info['match_ratio'] == 0) {
                $goods_info['match_ratio'] = 100;
            }
            if ($goods_info['match_point'] == 0) {
                $goods_info['match_point'] = 5;
            }
            // 处理小数
            $goods_info['match_ratio'] = round($goods_info['match_ratio'], 2);
            $goods_info['match_point'] = round($goods_info['match_point'], 2);
            $this->assign("goods_info", $goods_info);
            
            
            $Config = new Config();
            $seoconfig = $Config->getSeoConfig($this->instance_id);
            if (! empty($goods_info['keywords'])) {
                $seoconfig['seo_meta'] = $goods_info['keywords']; // 关键词
                $seoconfig['seo_desc'] = $goods_info['goods_name']; // 描述
            }
            $this->assign("seoconfig", $seoconfig);
            
            $this->assign("goods_sku_count", count($goods_info["sku_list"]));
            $this->assign("spec_list", count($goods_info["spec_list"]));
            
            $this->assign("shop_id", $goods_info['shop_id']); // 所属店铺id
            
            $default_gallery_img = ""; // 图片必须都存在才行
            for ($i = 0; $i < count($goods_info["img_list"]); $i ++) {
                if ($i == 0) {
                    $default_gallery_img = $goods_info["img_list"][$i]["pic_cover_big"];
                }
            }
            $this->assign("default_gallery_img", $default_gallery_img);
            // 店内分类
            $goods_group_list = $this->goods_group->getGoodsGroupQuery($goods_info["shop_id"]);
            $this->assign("goods_group_list", $goods_group_list);
            // 店内商品销量排行榜
            $goods_rank = $this->goods->getGoodsList(1, 0, array(
                "ng.category_id" => $goods_info["category_id"]
            ), "ng.sales desc");
            $this->assign("goods_rank", $goods_rank["data"]);
            
            // 店内商品收藏数排行榜
            $goods_collection = $this->goods->getGoodsList(1, 0, array(
                "ng.category_id" => $goods_info["category_id"]
            ), "ng.collects desc");
            $this->assign("goods_collection", $goods_collection["data"]);
            
            // 店铺详情
            $shop_info = $this->shop->getShopDetail($goods_info["shop_id"]);
            $this->assign("shop_info", $shop_info["base_info"]);
            
            // 计算店铺综合分数，暂时保留一位小数
            $shop_score = sprintf("%.1f", ($shop_info["base_info"]["shop_desccredit"] + $shop_info["base_info"]["shop_servicecredit"] + $shop_info["base_info"]["shop_deliverycredit"]) / 3);
            $this->assign("shop_score", $shop_score);
            
            // 当前用户是否收藏了该商品,uid是从baseController获取到的
            $is_member_fav_goods = - 1;
            $is_member_fav_shop = - 1;
            if (isset($this->uid)) {
                $is_member_fav_goods = $this->member->getIsMemberFavorites($this->uid, $goodsid, 'goods');
                $is_member_fav_shop = $this->member->getIsMemberFavorites($this->uid, $shop_info["base_info"]["shop_id"], 'shop');
            }
            $this->assign("is_member_fav_goods", $is_member_fav_goods);
            $this->assign("is_member_fav_shop", $is_member_fav_shop);
            
            // 评价数量
            $evaluates_count = $this->goods->getGoodsEvaluateCount($goodsid);
            $this->assign('evaluates_count', $evaluates_count);
            
            $integral_flag = 0; // 是否是积分商品
            
            if ($goods_info["point_exchange_type"] == 1) {
                $integral_flag ++;
                // 积分中心-->商品详情界面
            }
            $this->assign("integral_flag", $integral_flag);
            
            $consult_list = array();
            // 店铺详情
            $shop_info = $this->shop->getShopDetail($goods_info["shop_id"]);
            $this->assign("shop_info", $shop_info["base_info"]);
            // 购买咨询 全部
            $this->goods = new GoodsService();
            $consult_list[0] = $this->goods->getConsultList(1, 5, [
                'goods_id' => $goodsid
            ], 'consult_addtime desc');
            // 商品咨询
            $consult_list[1] = $this->goods->getConsultList(1, 5, [
                'goods_id' => $goodsid,
                'ct_id' => 1
            ], 'consult_addtime desc');
            
            // 支付咨询
            $consult_list[2] = $pay_consult_list = $this->goods->getConsultList(1, 5, [
                'goods_id' => $goodsid,
                'ct_id' => 2
            ], 'consult_addtime desc');
            
            // 发票及保险咨询
            $consult_list[3] = $invoice_consult_list = $this->goods->getConsultList(1, 5, [
                'goods_id' => $goodsid,
                'ct_id' => 3
            ], 'consult_addtime desc');
            
            $this->assign('consult_list', $consult_list);
            $user_location = get_city_by_ip();
            $this->assign("user_location", get_city_by_ip()); // 获取用户位置信息
            if ($user_location['status'] == 1) {
                // 定位成功，查询当前城市的运费
                $goods_express = new GoodsExpress();
                $address = new Address();
                $province = $address->getProvinceId($user_location["province"]);
                $city = $address->getCityId($user_location["city"]);
                $express = $goods_express->getGoodsExpressTemplate($goodsid, $province['province_id'], $city['city_id']);
                $goods_info["shipping_fee_name"] = $express;
            }
            $web_info = $this->web_site->getWebSiteInfo();
            // 标题title(商品详情页面)
            $this->assign("title_before", $goods_info['goods_name'] . ' - ');
            $this->assign('shipping_name',$goods_info["shipping_fee_name"]);
             if (! $goods_info["category_id"] == "") {
                $category_name = $this->goods_category->getCategoryParentQuery($goods_info["category_id"]);
            } else {
                $category_name = "全部分类";
            } 
            $this->assign("category_name", $category_name);
            if ($goods_info["promotion_info"] == '限时折扣') {
                // 活动-->商品详情界面
                return view($this->style . 'Goods/goodsInfoPromotion');
            } else {
                // 基础-->商品详情界面
                return view($this->style . 'Goods/goodsInfo');
            }
        } else {
            $this->redirect('Index/index'); // 没有商品返回到首页
        }
    }
    /**
     * 根据地区获取物流模板
     */
    public function selcectexpress(){
        $goods_id = request()->post("goods_id",'');
        $province_id = request()->post("province_id",'');
        $city_id = request()->post("city_id",'');
        $goods_express = new GoodsExpress();
        $express = $goods_express->getGoodsExpressTemplate($goods_id, $province_id, $city_id);
        return $express;
    }
    /**
     * 根据地址获取邮费
     */
    public function getExpressFee()
    {
        $goods_id = isset($_POST['goods_id']) ? $_POST['goods_id'] : '';
        $province = isset($_POST['province']) ? $_POST['province'] : '';
        $city = isset($_POST['city']) ? $_POST['city'] : '';
        $goods_express = new GoodsExpress();
        $express = $goods_express->getGoodsExpressTemplate($goods_id, $province, $city);
        return $express;
    }

    /**
     * 商品列表
     * 创建人：李志伟
     * 创建时间：2017年2月7日 15:47:10
     * 修改人：王永杰
     * 修改时间：2017年2月28日 11:06:39
     *
     * @return \think\response\View
     */
    public function goodsList()
    {
        $category_id = isset($_GET["category_id"]) ? $_GET["category_id"] : ""; // 商品分类
        $keyword = isset($_GET["keyword"]) ? $_GET["keyword"] : ""; // 关键词
        $shipping_fee = isset($_GET["shipping_fee"]) ? $_GET["shipping_fee"] : ""; // 是否包邮，0：包邮；1：运费价格
        $stock = isset($_GET["stock"]) ? $_GET["stock"] : ""; // 仅显示有货，大于0
        $page = isset($_GET['page']) ? $_GET['page'] : '1'; // 当前页
        $order = isset($_GET["order"]) ? $_GET["order"] : "";
        $sort = isset($_GET["sort"]) ? $_GET["sort"] : "desc";
        $brand_id = isset($_GET['brand_id']) ? $_GET['brand_id'] : '';
        $brand_name = isset($_GET['brand_name']) ? $_GET['brand_name'] : ''; // 品牌名称
        $min_price = isset($_GET['min_price']) ? $_GET['min_price'] : ''; // 价格区间,最小
        $max_price = isset($_GET['max_price']) ? $_GET['max_price'] : ''; // 最大
        $platform_proprietary = isset($_GET["platform_proprietary"]) ? $_GET["platform_proprietary"] : ""; // 平台自营 shopid== 1
        $province_id = isset($_GET["province_id"]) ? $_GET["province_id"] : ""; // 商品所在地
        $province_name = isset($_GET["province_name"]) ? $_GET["province_name"] : ""; // 所在地名称
                                                                                      // 属性筛选get参数
        $attr = isset($_GET["attr"]) ? $_GET["attr"] : ""; // 属性值
        
        $this->assign("attr_str", $attr);
        // 将属性条件字符串转化为数组
        $attr_array = $this->stringChangeArray($attr);
        $this->assign("attr_array", $attr_array);
        $orderby = ""; // 排序方式
        if ($order != "") {
            $orderby = $order." ".$sort.",ng.sort asc";
        }else{
            $orderby = "ng.sort asc";
        }
        $this->assign("order", $order); // 要排序的字段
        $this->assign("sort", $sort); // 升序降序
        $this->goods_category = new GoodsCategoryService();
        if ($category_id != "") {
            // 获取商品分类下的品牌列表、价格区间
            $category_brands = null;
            $category_price_grades = null;
            
            // 查询品牌列表，用于筛选
            $category_brands = $this->goods_category->getGoodsCategoryBrands($category_id);
            
            // 查询价格区间，用于筛选
            $category_price_grades = $this->goods_category->getGoodsCategoryPriceGrades($category_id);
            $category_count = 0; // 默认没有数据
            if ($category_brands != "") {
                $category_count = 1; // 有数据
            }
            $this->goods = new GoodsService();
            $goods_category_info = $this->goods_category->getGoodsCategoryDetail($category_id);
            $attr_id = $goods_category_info["attr_id"];
            // 查询商品分类下的属性和规格集合
            $goods_attribute = $this->goods->getAttributeInfo([
                "attr_id" => $attr_id
            ]);
            $attribute_detail = $this->goods->getAttributeServiceDetail($attr_id, [
                'is_search' => 1
            ]);
            $attribute_list = array();
            if (! empty($attribute_detail['value_list']['data'])) {
                $attribute_list = $attribute_detail['value_list']['data'];
                foreach ($attribute_list as $k => $v) {
                    $is_unset = 0;
                    if (! empty($attr_array)) {
                        foreach ($attr_array as $t => $m) {
                            if (trim($v["attr_value_name"]) == trim($m[0])) {
                                unset($attribute_list[$k]);
                                $is_unset = 1;
                            }
                        }
                    }
                    if ($is_unset == 0) {
                        $value_items = explode(",", $v['value']);
                        $attribute_list[$k]['value'] = trim($v["value"]);
                        $attribute_list[$k]['value_items'] = $value_items;
                    }
                }
            }
            $attr_list = $attribute_list;
            $this->assign("attr_or_spec", $attr_list);
            $this->assign("category_brands", $category_brands);
            $this->assign("category_count", $category_count);
            $this->assign("category_price_grades", $category_price_grades);
            $this->assign("category_price_grades_count", count($category_price_grades));
        }
        
        $this->platform = new PlatformService(); // 新品推荐
        $goods_new_list = $this->platform->getPlatformGoodsRecommend(1);
        $this->assign("goods_new_list", $goods_new_list);
        
        // 销量排行榜
        $goods_sales_list = $this->getSalesGoodsList($category_id);
        $this->assign("goods_sales_list", $goods_sales_list);
        
        // 浏览历史
        $member_histrorys = $this->getMemberHistories();
        $this->assign('member_histrorys', $member_histrorys);
        
        // 猜您喜欢
        $guess_member_likes = $this->member->getGuessMemberLikes();
        $this->assign("guess_member_likes", $guess_member_likes);
        $this->assign("guess_member_likes_count", count($guess_member_likes));
        
        // -----------------查询条件筛选---------------------
        $this->assign("category_id", $category_id); // 商品分类ID
        $this->assign("brand_id", $brand_id); // 品牌ID
        $this->assign("brand_name", $brand_name); // 品牌ID
        $this->assign("min_price", $min_price); // 最小
        $this->assign("max_price", $max_price); // 最大
        $this->assign("shipping_fee", $shipping_fee); // 是否包邮
        $this->assign("stock", $stock); // 仅显示有货
        $this->assign("platform_proprietary", $platform_proprietary); // 平台自营
        $this->assign("province_name", $province_name);
        $page_size = 12;
        // -----------------查询条件筛选----------------------
        
        $url_parameter = $_SERVER['QUERY_STRING']; // get参数
                                                   // 筛选属性参数
        $index_num = strpos($url_parameter, "&attr");
        $attr_url = "";
        $order_url = "";
        if (! $index_num === false) {
            if (! empty($attr_array)) {
                $attr_url = mb_substr($url_parameter, $index_num);
            }
            $url_parameter = mb_substr($url_parameter, 0, $index_num);
        } else {
            $order_url = $url_parameter;
        }
        $this->assign("attr_url", $attr_url);
        
        $url_parameter_not_shipping = str_replace("&shipping_fee=0", "", $url_parameter); // 筛选：排除包邮
        $url_parameter_not_price = str_replace("&min_price=$min_price&max_price=$max_price", "", $url_parameter); // 筛选：排除价格区间
        $url_brand_name = str_replace("%2C", ",", rawurlencode($brand_name));
        $url_parameter_not_brand = str_replace("&brand_id=$brand_id&brand_name=" . $url_brand_name . "", "", $url_parameter); // 筛选：排除品牌
        $url_parameter_not_stock = str_replace("&stock=$stock", "", $url_parameter); // 筛选：排除仅显示有货
        $url_parameter_not_platform_proprietary = str_replace("&platform_proprietary=$platform_proprietary", "", $url_parameter); // 筛选：排除平台自营
        $url_parameter_not_order = str_replace("&order=$order&sort=$sort", "", $url_parameter); // 排序，排除之前的排序规则，防止重复，
        $url_parameter_not_province_id = str_replace("&province_id=$province_id&province_name=" . urlencode($province_name) . "", "", $url_parameter); // 排序，排除之前的排序规则，防止重复，
        
        $this->assign("url_parameter", $url_parameter); // 正常
        $this->assign("url_parameter_not_order", $url_parameter_not_order); // 排序，排除之前的排序规则，防止重复，
        $this->assign("url_parameter_not_shipping", $url_parameter_not_shipping); // 筛选：排除包邮
        $this->assign("url_parameter_not_price", $url_parameter_not_price . $attr_url); // 筛选：排除价格，
        $this->assign("url_parameter_not_brand", $url_parameter_not_brand . $attr_url); // 筛选：排除品牌
        $this->assign("url_parameter_not_stock", $url_parameter_not_stock); // 筛选：排除仅显示有货
        $this->assign("url_parameter_not_platform_proprietary", $url_parameter_not_platform_proprietary); // 筛选：排除平台自营
        $this->assign("url_parameter_not_province_id", $url_parameter_not_province_id); // 筛选：排除平台自营
        $this->assign("user_location", get_city_by_ip()); // 获取用户位置信息
        $goods_list = $this->getGoodsListByConditions($category_id, $brand_id, $min_price, $max_price, $keyword, $page, $page_size, $orderby, $shipping_fee, $stock, $platform_proprietary, $province_id, $attr_array);
        $this->assign("goods_list", $goods_list); // 返回商品列表
        
        $category_name = "";
        if (! $category_id == "") {
            $category_name = $this->goods_category->getCategoryParentQuery($category_id);
        } else {
            $category_name = "全部分类";
        }
        
        // if (count($goods_list["data"]) > 0) {
        // $category_name = $goods_list["data"][0]["category_name"]; // 面包屑
        // }
        $this->assign("category_name", $category_name);
        $this->assign('page_count', $goods_list['page_count']);
        $this->assign('total_count', $goods_list['total_count']);
        $this->assign('page', $page);
        
        return view($this->style . '/Goods/goodsList');
    }

    /**
     * 将属性字符串转化为数组
     *
     * @param unknown $string            
     * @return multitype:multitype: |multitype:
     */
    private function stringChangeArray($string)
    {
        if (trim($string) != "") {
            $temp_array = explode(";", $string);
            $attr_array = array();
            foreach ($temp_array as $k => $v) {
                $v_array = array();
                if (strpos($v, ",") === false) {
                    $attr_array = array();
                    break;
                } else {
                    $v_array = explode(",", $v);
                    if (count($v_array) != 2) {
                        $attr_array = array();
                        break;
                    } else {
                        $attr_array[] = $v_array;
                    }
                }
            }
            return $attr_array;
        } else {
            return array();
        }
    }

    /**
     * 获取所有地址：省市县
     * 创建人：王永杰
     * 创建时间：2017年3月6日 14:21:43
     */
    public function getAddress()
    {
        // 省
        $address = new Address();
        $province_list = $address->getProvinceList();
        $list["province_list"] = $province_list;
        
        // 市
        $city_list = $address->getCityList();
        $list["city_list"] = $city_list;
        // 区县
        $district_list = $address->getDistrictList();
        $list["district_list"] = $district_list;
        return $list;
    }

    /**
     * 查询商品的sku信息
     * 创建人：王永杰
     * 创建时间：2017年3月1日 13:39:31
     */
    public function getGoodsSkuInfo()
    {
        $goods_id = $_POST["goods_id"];
        $this->goods = new GoodsService();
        return $this->goods->getGoodsAttribute($goods_id);
    }

    /**
     * 右侧边栏-->我看过的
     * 创建人：王永杰
     * 创建时间：2017年2月28日 11:06:28
     */
    public function getMemberHistories()
    {
        // 浏览历史
        $this->member = new MemberService();
        $member_histrorys = $this->member->getMemberViewHistory();
        return $member_histrorys;
    }

    /**
     * 功能：ajax删除浏览记录
     * 创建人：李志伟
     * 创建时间：2017年2月16日15:15:36
     */
    public function deleteMemberHistory()
    {
        $this->member = new MemberService();
        $this->member->deleteMemberViewHistory();
        return AjaxReturn(1);
    }

    /**
     * 根据条件查询商品列表：商品分类查询，关键词查询，价格区间查询，品牌查询
     * 创建人：王永杰
     * 创建时间：2017年2月24日 16:55:05
     */
    public function getGoodsListByConditions($category_id, $brand_id, $min_price, $max_price, $keyword, $page, $page_size, $order, $shipping_fee, $stock, $platform_proprietary, $province_id, $attr_array)
    {
        $this->goods = new GoodsService();
        $condition = null;
        if ($category_id != "") {
            // 商品分类Id
            $condition["ng.category_id"] = $category_id;
        }
        // 品牌Id
        if ($brand_id != "") {
            $condition["ng.brand_id"] = array(
                "in",
                $brand_id
            );
        }
        
        // 价格区间
        if ($max_price != "") {
            $condition["ng.promotion_price"] = [
                [
                    ">=",
                    $min_price
                ],
                [
                    "<=",
                    $max_price
                ]
            ];
        }
        // 关键词
        if ($keyword != "") {
            $condition["ng.goods_name"] = array(
                "like",
                "%" . $keyword . "%"
            );
        }
        
        // 包邮
        if ($shipping_fee != "") {
            $condition["ng.shipping_fee"] = $shipping_fee;
        }
        
        // 仅显示有货
        if ($stock != "") {
            $condition["ng.stock"] = array(
                ">",
                $stock
            );
        }
        
        // 平台直营
        if ($platform_proprietary != "") {
            $condition["ng.shop_id"] = $platform_proprietary;
        }
        
        // 商品所在地
        if ($province_id != "") {
            $condition["ng.province_id"] = $province_id;
        }
        // 属性 (条件拼装)
        $array_count = count($attr_array);
        $attr_str_where = "";
        if (! empty($attr_array)) {
            // 循环拼装sql属性条件
            foreach ($attr_array as $k => $v) {
                if ($attr_str_where == "") {
                    $attr_str_where = "(attr_value = '$v[0]' and attr_value_name='$v[1]')";
                } else {
                    $attr_str_where = $attr_str_where . " or " . "(attr_value = '$v[0]' and attr_value_name='$v[1]')";
                }
            }
            if ($attr_str_where != "") {
                $attr_query = $this->goods->getGoodsAttributeQuery($attr_str_where);
                
                $attr_array = array();
                foreach ($attr_query as $t => $b) {
                    $attr_array[$b["goods_id"]][] = $b;
                }
                $goodsid_str = "0";
                foreach ($attr_array as $z => $x) {
                    if (count($x) == $array_count) {
                        if ($goodsid_str == "") {
                            $goodsid_str = $z;
                        } else {
                            $goodsid_str = $goodsid_str . "," . $z;
                        }
                    }
                }
                if ($goodsid_str != "") {
                    $condition["goods_id"] = [
                        "in",
                        $goodsid_str
                    ];
                }
            }
        }
        $list = $this->goods->getGoodsList($page, $page_size, $condition, $order);
        
        return $list;
    }

    /**
     * 根据关键词返回商品列表
     * 创建人：王永杰
     * 创建时间：2017年2月10日 15:17:00
     */
    public function getGoodsListByKeyWord()
    {
        $page_index = 1;
        $page_size = 0;
        $keyword = "";
        $order = "";
        $list = null;
        $this->goods = new GoodsService();
        if (isset($_GET["keyword"])) {
            $page_index = $_GET["page_index"];
            $page_size = $_GET["page_size"];
            $keyword = $_GET["keyword"];
            $order = $_GET["order"];
            $list = $this->goods->getGoodsList($page_index, $page_size, array(
                "ng.goods_name" => array(
                    "like",
                    "%" . $keyword . "%"
                )
            ), $order);
        } else {
            // 没有条件，查询全部
            $list = $this->goods->getGoodsList($page_index, $page_size, "", $order);
        }
        return $list;
    }

    /**
     * 获取销量排行榜的商品列表
     * 创建人：王永杰
     * 创建时间：2017年2月9日 17:23:40
     */
    public function getSalesGoodsList()
    {
        $this->goods = new GoodsService();
        $list = $this->goods->getGoodsList(1, 3, '', "sales desc");
        return $list["data"];
    }

    /**
     * 店铺品牌
     * 创建人：李志伟
     * 创建时间：2017年2月7日17:34:20
     */
    public function brandList()
    {
        $goods_brand = new GoodsBrand();
        $page_index = isset($_GET['page']) ? $_GET['page'] : '1';
        $page_size = isset($_POST['page_size']) ? $_POST['page_size'] : '';
        $category_id = isset($_GET['category_id']) ? $_GET['category_id'] : '';
        $left = isset($_GET['left']) ? $_GET['left'] : '';
        if ($category_id == '') {
            $list = $goods_brand->getGoodsBrandList($page_index, 16, '', 'sort');
        } else {
            $list = $goods_brand->getGoodsBrandList($page_index, 16, [
                'category_id_1' => $category_id
            ], 'sort');
        }
        $this->assign('category_id', $category_id);
        $this->assign('is_head_goods_nav', 1); // 代表默认显示以及分类
                                               // 获取商品分类
        $goods_Category = new GoodsCategoryService();
        $condition['level'] = 1;
        $type = $goods_Category->getGoodsCategoryList(1, 0, $condition, 'sort');
        
        $this->assign('type_list', $type['data']);
        $this->assign('page_count', $list['page_count']);
        $this->assign('total_count', $list['total_count']);
        $this->assign('page', $page_index);
        $this->assign('left', $left);
        $this->assign('list', $list['data']);
        
        // 浏览历史
        $this->member = new MemberService();
        $member_histrorys = $this->member->getMemberViewHistory();
        $this->assign('member_histrorys', $member_histrorys);
        
        // 猜您喜欢
        $guess_member_likes = $this->member->getGuessMemberLikes();
        $this->assign("guess_member_likes", $guess_member_likes);
        $this->assign("guess_member_likes_count", count($guess_member_likes));
        return view($this->style . 'Goods/brandList');
    }

    /**
     * 全部商品分类
     *
     * @return \think\response\View
     */
    public function category()
    {
        return view($this->style . 'Goods/category');
    }

    /**
     * 商品信息
     */
    public function getGoodsInfo()
    {
        $this->member = new MemberService();
        $list = $this->member->getMemberViewHistory();
    }

    /**
     * 积分中心
     * 创建人：王永杰
     * 创建时间：2017年2月17日 17:56:41
     */
    public function integralCenter()
    {
        $this->goods = new GoodsService();
        $order = "";
        // 排序
        if (isset($_GET["id"])) {
            if ($_GET["id"] == 1) {
                $order = "sales desc";
            } else 
                if ($_GET["id"] == 2) {
                    $order = "collects desc";
                } else 
                    if ($_GET["id"] == 3) {
                        $order = "evaluates desc";
                    } else 
                        if ($_GET["id"] == 4) {
                            $order = "shares desc";
                        } else {
                            $_GET["id"] = 0;
                            $order = "";
                        }
        } else {
            $_GET["id"] = 0;
        }
        
        $page_index = isset($_GET['page']) ? $_GET['page'] : '1';
        $condition = array(
            "ng.state" => 1,
            "ng.point_exchange_type" => array(
                'NEQ',
                0
            )
        );
        $page_count = 25;
        $hotGoods = $this->goods->getGoodsList(1, 4, $condition, $order);
        $allGoods = $this->goods->getGoodsList($page_index, $page_count, $condition, $order);
        if (isset($_GET["page"])) {
            if (($_GET["page"] > 1 && $_GET["page"] <= $allGoods["page_count"])) {
                $_GET["page"] = 1;
            }
        }
        $this->assign("id", $_GET["id"]);
        $this->assign('page', $page_index);
        $this->assign("allGoods", $allGoods);
        $this->assign("hotGoods", $hotGoods);
        $this->assign('page_count', $allGoods['page_count']);
        $this->assign('total_count', $allGoods['total_count']);
        return view($this->style . 'Goods/integralCenter');
    }

    /**
     * 功能：商品评论
     * 创建人：李志伟
     * 创建时间：2017年2月23日11:12:57
     */
    public function getGoodsComments()
    {
        $page_index = $_POST['page_index'];
        $page_size = $_POST['page_size'];
        $goods_id = $_POST['goods_id'];
        $comments_type = $_POST['comments_type'];
        $order = new OrderService();
        $condition['goods_id'] = $goods_id;
        switch ($comments_type) {
            case 1:
                $condition['explain_type'] = 1;
                break;
            case 2:
                $condition['explain_type'] = 2;
                break;
            case 3:
                $condition['explain_type'] = 3;
                break;
            case 4:
                $condition['image|again_image'] = array(
                    'NEQ',
                    ''
                );
                break;
        }
        $condition['is_show'] = 1;
        $goodsEvaluationList = $order->getOrderEvaluateDataList($page_index, $page_size, $condition, 'addtime desc');
        return $goodsEvaluationList;
    }

    /**
     * 商品购买咨询
     *
     * @return \think\response\View
     */
    public function goodsConsult()
    {
        // 商品详情
        $goodsid = isset($_GET['goodsid']) ? $_GET['goodsid'] : '';
        $page = isset($_GET['page']) ? $_GET['page'] : '1'; // pageindex
        $ct_id = isset($_GET['ct_id']) ? $_GET['ct_id'] : ''; // pageindex
        
        $this->goods = new GoodsService();
        $goods_info = $this->goods->getGoodsDetail($goodsid);
        
        $condition['goods_id'] = $goodsid;
        if (! empty($ct_id)) {
            $condition['ct_id'] = $ct_id;
        }
        
        // 商品咨询
        $consult_list = $this->goods->getConsultList($page, 5, $condition, 'consult_addtime desc');
        $this->assign('consult_list', $consult_list);
        
        $assign_get_list = array(
            'goods_info' => $goods_info, // 商品详情
            'goodsid' => $goodsid, // 商品id
            'page' => $page, // 当前页
            'page_count' => $consult_list['page_count'], // 总页数
            'total_count' => $consult_list['total_count'], // 总条数
            'consult_list' => $consult_list['data'], // 店铺分页
            'ct_id' => $ct_id
        );
        
        foreach ($assign_get_list as $key => $value) {
            $this->assign($key, $value);
        }
        
        return view($this->style . 'Goods/goodsConsult');
    }

    /**
     * 商品咨询添加
     */
    public function goodsConsultInsert()
    {
        $randomCode = isset($_POST['randomCode']) ? $_POST['randomCode'] : '';
        if ($randomCode != Session::get('randomCode')) {
            return [
                'code' => '-1',
                'message' => '验证码输入错误'
            ];
        }
        $goods_id = isset($_POST['goods_id']) ? $_POST['goods_id'] : '';
        $shop_id = isset($_POST['shop_id']) ? $_POST['shop_id'] : '';
        $goods_name = isset($_POST['goods_name']) ? $_POST['goods_name'] : '';
        $ct_id = isset($_POST['ct_id']) ? $_POST['ct_id'] : '';
        $consult_content = isset($_POST['consult_content']) ? $_POST['consult_content'] : '';
        
        $this->shop = new ShopService();
        $this->member = new MemberService();
        
        $shop_info = $this->shop->getShopDetail($shop_id);
        $shop_name = $shop_info['base_info']['shop_name'];
        
        $member_info = $this->member->getMemberDetail();
        $member_name = empty($member_info) ? '' : $member_info['member_name'];
        $uid = empty($this->uid) ? '0' : $this->uid;
        
        $this->goods = new GoodsService();
        $retval = $this->goods->addConsult($goods_id, $goods_name, $uid, $member_name, $shop_id, $shop_name, $ct_id, $consult_content);
        return AjaxReturn($retval);
    }
    /**
     * 获取商品详情
     */
    public function getGoodsDetail(){
        $goods = new GoodsService();
        $goods_id = isset($_POST['goods_id']) ? $_POST['goods_id'] : '';
        $goods_detail = $goods->getGoodsDetail($goods_id);
        return $goods_detail;
    }
    
    /**
     * 添加购物车(用于未登陆添加购物车)
     */
    public function addCart()
    {
        $goods = new GoodsService();
        $uid = $this->uid;
        $cart_detail = $_POST['cart_detail'];
        $goods_id = $cart_detail['goods_id'];
        $goods_name = $cart_detail['goods_name'];
        $shop_id = $this->instance_id;
        $web_info = $this->web_site->getWebSiteInfo();
        $count = $cart_detail['count'];
        $sku_id = $cart_detail['sku_id'];
        $sku_name = $cart_detail['sku_name'];
        $price = $cart_detail['price'];
        $cost_price = $cart_detail['cost_price'];
        $picture_id = $cart_detail['picture_id'];
        $_SESSION['order_tag'] = ""; // 清空订单        
        $retval = $goods->addCart($uid, $shop_id, $web_info['title'], $goods_id, $goods_name, $sku_id, $sku_name, $price, $count, $picture_id, 0);
        return $retval;
    }   
    /**
     * 购物车
     * 创建人：王永杰
     * 创建时间：2017年2月7日 15:45:49
     * @return \think\response\View
     */
//     public function cart()
//     {
//         $goods = new GoodsService();
//         $goods = new GoodsService();
//         $cart_list = $goods->getCart($this->uid);
//         $this->assign("cart_list", $cart_list);
//         return view($this->style . 'Goods/cart');
//     }
    public function cart()
    {
        $goods = new Goods();
        $cart_list = $this->getShoppingCart();
       // var_dump($cart_list[0]['shop_name']);die;
        // 店铺，店铺中的商品
        $list = Array();
        for ($i = 0; $i < count($cart_list); $i ++) {
            $list[$cart_list[$i]["shop_id"] . ',' . $cart_list[$i]["shop_name"]][] = $cart_list[$i];
        }
        $this->assign("list", $list);
        $this->assign("cart_list",$cart_list);
        //var_dump($list);die;
       return view($this->style . 'Goods/cart');
    }
    /**
     * 获取购物车信息
     * 创建人：王永杰
     * 创建时间：2017年2月15日 14:34:54
     *
     * {@inheritdoc}
     *
     * @see \app\shop\controller\BaseController::getShoppingCart()
     */
    public function getShoppingCart()
    {
        $goods = new GoodsService();
        $cart_list = $goods->getCart($this->uid);
        return $cart_list;
    }
    
    /**
     * 右侧购物车列表信息
     */
    public function carts()
    {
        $goods = new Goods();
        $cart_list = $this->getShoppingCart();
        // var_dump($cart_list[0]['shop_name']);die;
        // 店铺，店铺中的商品
        $list = Array();
        for ($i = 0; $i < count($cart_list); $i ++) {
            $list[$cart_list[$i]["shop_id"] . ',' . $cart_list[$i]["shop_name"]][] = $cart_list[$i];
        }
       

        return $list;
    }
    
    /**
     * 根据cartid删除购物车中的商品
     * 创建人：王永杰
     * 创建时间：2017年2月15日 14:34:45
     *
     * @return unknown
     */
    public function deleteShoppingCartById()
    {
        $goods = new GoodsService();
        $cart_id_array = $_POST["cart_id_array"];
        $res = $goods->cartDelete($cart_id_array);
        $_SESSION['order_tag'] = ""; // 清空订单
        return AjaxReturn($res);
    }    
    /**
     * 更新购物车中商品数量
     * 创建人：王永杰
     * 创建时间：2017年2月15日 15:43:23
     *
     * @return unknown
     */
    public function updateCartGoodsNumber()
    {
        $goods = new GoodsService();
        $cart_id = $_POST["cart_id"];
        $num = $_POST["num"];
        $_SESSION['order_tag'] = ""; // 清空订单
        $res = $goods->cartAdjustNum($cart_id, $num);
        return $res;
    }
    
}