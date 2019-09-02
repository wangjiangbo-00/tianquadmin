<?php
/**
 * Shop.php
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

use data\service\Goods;
use data\service\GoodsGroup as GoodsGroupService;
use data\service\Member;
use data\service\Shop as ShopService;
use data\service\Address;
use think\Controller;
use data\service\Platform;

/**
 * 店铺控制器
 * 创建人：李吉
 * 创建时间：2017-02-06 10:59:23
 */
class Shop extends BaseController
{

    private $goods_group = null;

    private $shop_id = null;

    private $member = null;

    private $goods_group_id = null;

    public function __construct()
    {
        parent::__construct();
        $this->shop_id = isset($_GET['shop_id']) ? $_GET['shop_id'] : '';
        $this->goods_group_id = isset($_GET['goods_group_id']) ? $_GET['goods_group_id'] : '';
        if ($this->shop_id != '') {
            // 店内分类
            $this->goods_group = new GoodsGroupService();
            $goods_group_list = $this->goods_group->getGoodsGroupQuery($this->shop_id);
            $this->assign("goods_group_list", $goods_group_list);
            
            // 店铺信息
            $shop = new ShopService();
            $shop_info = $shop->getShopDetail($this->shop_id);
            $shop_banner = $shop_info['base_info']['shop_banner'];
            $this->assign('shop_info', $shop_info['base_info']);
            $this->assign('shop_banner', $shop_banner);
            $this->assign('title', $shop_info['base_info']['shop_name']);
            
            // 店铺是否被收藏
            if (! empty($this->uid)) {
                $this->member = new Member();
                $is_favorites = $this->member->getIsMemberFavorites($this->uid, $this->shop_id, 'shop');
                $this->assign('is_favorites', $is_favorites);
            } else {
                $this->assign('is_favorites', '-1');
            }
            $this->assign('goods_group_id', $this->goods_group_id);
            $this->assign("shop_id", $this->shop_id);
        }
    }

    /**
     * 商家入驻首页
     * 创建人：王永杰
     * 创建时间：2017年2月7日 15:04:59
     *
     * @return \think\response\View
     */
    public function applyIndex()
    {
        if (empty($this->uid)) {
            $this->redirect(__URL__."/login");
        } else {
            $is_system = $this->user->getSessionUserIsSystem();
            $this->assign("is_system", $is_system);
            $apply_state = $this->user->getMemberIsApplyShop($this->uid);
            $this->assign("apply_state", $apply_state);
            $user_info = $this->user->getUserInfo();
            $this->assign("member_info", $user_info);
        }
        return view($this->style . 'Shop/applyIndex');
    }

    /**
     * 功能：店铺街
     * 创建人：李志伟
     * 时间：2017年2月7日16:21:17
     */
    public function shopStreet()
    {
        $shop = new ShopService();
        
        $shop_name = isset($_GET['shop_name']) ? $_GET['shop_name'] : ''; // 店铺名称
        $shop_group_id = isset($_GET['shop_group_id']) ? $_GET['shop_group_id'] : ''; // 店铺分类
        $order_type = isset($_GET['order_type']) ? $_GET['order_type'] : ''; // 排序类型 为1销售排行2信誉排行
        $sort = isset($_GET['sort']) ? $_GET['sort'] : 'asc'; // 倒排正排
        $page = isset($_GET['page']) ? $_GET['page'] : '1'; // pageindex
        
        $order = "shop_sort " . $sort;
        if ($order_type == 1) {
            $order = "shop_sales " . $sort;
        } else 
            if ($order_type == 2) {
                $order = "shop_credit " . $sort;
            }
        
        $condition['shop_state'] = 1;
        if (! empty($shop_group_id)) {
            $condition['shop_group_id'] = $shop_group_id;
        }
        
        if (! empty($shop_name)) {
            $condition['shop_name'] = array(
                "like",
                "%" . $shop_name . "%"
            );
        }
        
        $shop_list = $shop->getShopList($page, 6, $condition, $order); // 店铺查询
        $shop_group_list = $shop->getShopGroup(); // 店铺分类
        $assign_get_list = array(
            'order_type' => $order_type, // 排序类型
            'shop_group_id' => $shop_group_id, // 店铺类型
            'shop_name' => $shop_name, // 搜索名称
            'page' => $page, // 当前页
            'sort' => $sort, // 排序
            'shop_list' => $shop_list['data'], // 店铺列表
            'page_count' => $shop_list['page_count'], // 总页数
            'total_count' => $shop_list['total_count'], // 总条数
            'shop_group_list' => $shop_group_list['data']
        ); // 店铺分页
        
        foreach ($assign_get_list as $key => $value) {
            $this->assign($key, $value);
        }
        
        return view($this->style . 'Shop/shopStreet');
    }

    /**
     * 功能：店铺首页
     * 创建人：李志伟
     * 时间：2017年2月7日16:21:43
     */
    public function shopIndex()
    {
        $shop = new ShopService();
        $shop_id = $this->shop_id;
        $shop_info = $shop->getShopDetail($shop_id);
        $shop_banner = $shop_info['base_info']['shop_banner'];
        $this->assign('shop_banner', $shop_banner);
        
        $shop_ad_list = $shop->getShopAdList(1, 0, [
            'type' => 0,
            'shop_id' => $this->shop_id
        ]);
        $this->assign('shop_ad_list', $shop_ad_list['data']);
        
//         $goods = new Goods();
//         $conditions = array(
//             'new_goods_list' => [
//                 'ng.shop_id' => $shop_id,
//                 'is_new' => 1
//             ],
//             'recommend_goods_list' => [
//                 'ng.shop_id' => $shop_id,
//                 'is_recommend' => 1
//             ],
//             'hot_goods_list' => [
//                 'ng.shop_id' => $shop_id,
//                 'is_hot' => 1
//             ]
//         );
        
//         foreach ($conditions as $key => $item) {
//             $this->assign($key, $goods->getGoodsList(1, 15, $item, 'sort'));
//         }

        $Platform = new Platform();
        $recommend_block = $Platform->getshopPlatformGoodsRecommendClass($shop_id);
        foreach($recommend_block as $k=>$v){
            //获取模块下商品
            $goods_list = $Platform->getPlatformGoodsRecommend($v['class_id']);
            if(empty($goods_list)){
                unset($recommend_block[$k]);
            }
        }
        $this->assign("recommend_block", $recommend_block);
        return view($this->style . 'Shop/shopIndex');
    }

    /**
     * 功能：店铺商品分类
     * 创建人：李志伟
     * 时间：2017年2月7日17:03:30
     */
    public function shopGoodList()
    {
        $goods = new Goods();
        $good_list = null;
        $keyword = isset($_GET["keyword"]) ? $_GET["keyword"] : '';
        $order_type = isset($_GET['order_type']) ? $_GET['order_type'] : ''; // 1销量2价钱3评论
        $sort = isset($_GET['sort']) ? $_GET['sort'] : 'asc'; // 倒排正排
        $is_shipping_fee = isset($_GET['is_shipping_fee']) ? $_GET['is_shipping_fee'] : ''; // 1就是免运费
        $is_stock = isset($_GET['is_stock']) ? $_GET['is_stock'] : ''; // 是否有库存
                                                                       
        // 排序
        $order = " create_time ";
        switch ($order_type) {
            case 1:
                $order = ' sales ';
                break;
            case 2:
                $order = ' price ';
                break;
            case 3:
                $order = ' evaluates ';
                break;
        }
        ;
        $order = $order . $sort;
        
        // 条件筛选
        $condition = array();
        // 1.关键词搜索
        if (! empty($keyword)) {
            $condition['goods_name'] = array(
                "like",
                "%" . $keyword . "%"
            );
        }
        // 2.免运费
        if (! empty($is_shipping_fee)) {
            $condition['shipping_fee'] = '0';
        }
        // 3.有库存
        if (! empty($is_stock)) {
            $condition['stock'] = array(
                'GT',
                0
            );
            ;
        }
        
        // 一级筛选条件（排序）
        $screen_list_two = array(
            array(
                'order_name' => '综合',
                'order_type' => 0
            ),
            array(
                'order_name' => '销量',
                'order_type' => 1
            ),
            array(
                'order_name' => '价格',
                'order_type' => 2
            ),
            array(
                'order_name' => '评论',
                'order_type' => 3
            )
        );
        
        if ($this->goods_group_id == 0) {
            $condition['shop_id'] = $this->shop_id;
        }
        $good_list = $goods->getGroupGoodsList($this->goods_group_id, $condition, 0, $order);
        for ($i = 0; $i < count($good_list); $i ++) {
            $good_list[$i]['pic_cover_mid'] = $good_list[$i]['picture_info']['pic_cover_mid'];
            $good_list[$i]['pic_id'] = $good_list[$i]['picture_info']['pic_id'];
        }
        
        // 拼接链接参数
        $condition_url = '';
        $condition_url_par = array(
            'shop_id' => $this->shop_id,
            'goods_group_id' => $this->goods_group_id,
            'is_shipping_fee' => $is_shipping_fee,
            'is_stock' => $is_stock,
            'keyword' => $keyword
        );
        foreach ($condition_url_par as $key => $value) {
            if (! empty($value)) {
                $condition_url .= '&' . $key . '=' . $value;
            }
        }
        
        $assign_get_list = array(
            'shop_id' => $this->shop_id, // 店铺id
            'goods_group_id' => $this->goods_group_id, // 分类
            'sort' => $sort, // 排序
            'order_type' => $order_type, // 排序类型
            'is_shipping_fee' => $is_shipping_fee, // 是否包邮
            'is_stock' => $is_stock, // 库存
            'good_list' => $good_list, // 列表
            'condition_url' => rtrim($condition_url, '&'), // 链接所需的url参数
            'screen_list_two' => $screen_list_two
        ); // 一级筛选条件列表
        
        foreach ($assign_get_list as $key => $value) {
            $this->assign($key, $value);
        }
        return view($this->style . 'Shop/shopGoodList');
    }

    /**
     * 商家入驻第一步：同意协议
     * 创建人：王永杰
     * 创建时间：2017年2月7日 16:15:30
     */
    public function applyFristAgreement()
    {
        $this->assign("is_read", isset($_GET['is_read']) ? $_GET['is_read'] : 0);
        return view($this->style . 'Shop/applyFristAgreement');
    }

    /**
     * 商家入驻第二步：公司信息认证
     * 创建人：王永杰
     * 创建时间：2017年2月7日 16:30:43
     *
     * @return \think\response\View
     */
    public function applySecondCompanyInfo()
    {
        $shop = new ShopService();
        if (request()->isAjax()) {
            $apply_type = isset($_POST['apply_type']) ? $_POST['apply_type'] : '';
            $uid = $this->user->getSessionUid();
            $company_name = isset($_POST['company_name']) ? $_POST['company_name'] : '';
            $company_province_id = isset($_POST['company_province_id']) ? $_POST['company_province_id'] : '';
            $company_city_id = isset($_POST['company_city_id']) ? $_POST['company_city_id'] : '';
            $company_district_id = isset($_POST['company_district_id']) ? $_POST['company_district_id'] : '';
            $company_address_detail = isset($_POST['company_address_detail']) ? $_POST['company_address_detail'] : '';
            $company_phone = isset($_POST['company_phone']) ? $_POST['company_phone'] : '';
            $company_type = isset($_POST['company_type']) ? $_POST['company_type'] : 1;
            $company_employee_count = isset($_POST['company_employee_count']) ? $_POST['company_employee_count'] : 1;
            $company_registered_capital = isset($_POST['company_registered_capital']) ? $_POST['company_registered_capital'] : 0;
            $contacts_name = isset($_POST['contacts_name']) ? $_POST['contacts_name'] : '';
            $contacts_phone = isset($_POST['contacts_phone']) ? $_POST['contacts_phone'] : '';
            $contacts_email = isset($_POST['contacts_email']) ? $_POST['contacts_email'] : '';
            $contacts_card_no = isset($_POST['contacts_card_no']) ? $_POST['contacts_card_no'] : '';
            $contacts_card_electronic_1 = isset($_POST['contacts_card_electronic_1']) ? $_POST['contacts_card_electronic_1'] : '';
            $contacts_card_electronic_2 = isset($_POST['contacts_card_electronic_2']) ? $_POST['contacts_card_electronic_2'] : '';
            $contacts_card_electronic_3 = isset($_POST['contacts_card_electronic_3']) ? $_POST['contacts_card_electronic_3'] : '';
            $business_licence_number = isset($_POST['business_licence_number']) ? $_POST['business_licence_number'] : '';
            $business_sphere = isset($_POST['business_sphere']) ? $_POST['business_sphere'] : '';
            $business_licence_number_electronic = isset($_POST['business_licence_number_electronic']) ? $_POST['business_licence_number_electronic'] : '';
            $organization_code = isset($_POST['organization_code']) ? $_POST['organization_code'] : '';
            $organization_code_electronic = isset($_POST['organization_code_electronic']) ? $_POST['organization_code_electronic'] : '';
            $general_taxpayer = isset($_POST['general_taxpayer']) ? $_POST['general_taxpayer'] : '';
            $bank_account_name = isset($_POST['bank_account_name']) ? $_POST['bank_account_name'] : '';
            $bank_account_number = isset($_POST['bank_account_number']) ? $_POST['bank_account_number'] : '';
            $bank_name = isset($_POST['bank_name']) ? $_POST['bank_name'] : '';
            $bank_code = isset($_POST['bank_code']) ? $_POST['bank_code'] : '';
            $bank_address = isset($_POST['bank_address']) ? $_POST['bank_address'] : '';
            $bank_licence_electronic = isset($_POST['bank_licence_electronic']) ? $_POST['bank_licence_electronic'] : '';
            $is_settlement_account = isset($_POST['is_settlement_account']) ? $_POST['is_settlement_account'] : 1;
            $settlement_bank_account_name = isset($_POST['settlement_bank_account_name']) ? $_POST['settlement_bank_account_name'] : '';
            $settlement_bank_account_number = isset($_POST['settlement_bank_account_number']) ? $_POST['settlement_bank_account_number'] : '';
            $settlement_bank_name = isset($_POST['settlement_bank_name']) ? $_POST['settlement_bank_name'] : '';
            $settlement_bank_code = isset($_POST['settlement_bank_code']) ? $_POST['settlement_bank_code'] : '';
            $settlement_bank_address = isset($_POST['settlement_bank_address']) ? $_POST['settlement_bank_address'] : '';
            $tax_registration_certificate = isset($_POST['tax_registration_certificate']) ? $_POST['tax_registration_certificate'] : '';
            $taxpayer_id = isset($_POST['taxpayer_id']) ? $_POST['taxpayer_id'] : '';
            $tax_registration_certificate_electronic = isset($_POST['tax_registration_certificate_electronic']) ? $_POST['tax_registration_certificate_electronic'] : '';
            $shop_name = isset($_POST['shop_name']) ? $_POST['shop_name'] : '';
            $apply_state = isset($_POST['apply_state']) ? $_POST['apply_state'] : 1;
            $apply_message = isset($_POST['apply_message']) ? $_POST['apply_message'] : '';
            $apply_year = isset($_POST['apply_year']) ? $_POST['apply_year'] : 1;
            $shop_type_name = isset($_POST['shop_type_name']) ? $_POST['shop_type_name'] : '';
            $shop_type_id = isset($_POST['shop_type_id']) ? $_POST['shop_type_id'] : 0;
            $shop_group_name = isset($_POST['shop_group_name']) ? $_POST['shop_group_name'] : '';
            $shop_group_id = isset($_POST['shop_group_id']) ? $_POST['shop_group_id'] : 0;
            $paying_money_certificate = isset($_POST['paying_money_certificate']) ? $_POST['paying_money_certificate'] : '';
            $paying_money_certificate_explain = isset($_POST['paying_money_certificate_explain']) ? $_POST['paying_money_certificate_explain'] : '';
            $paying_amount = isset($_POST['paying_amount']) ? $_POST['paying_amount'] : 0;
            $recommend_uid = isset($_POST["recommend_uid"]) ? $_POST["recommend_uid"] : 0;
            
            if ($recommend_uid > 0) {
                $business_assistant = new NbsBusinessAssistant();
                $res = $business_assistant->getUserBusinessAssistantInfo($recommend_uid);
                if (empty($res)) {
                    return AjaxReturn(0);
                }
            }
            $retval = $shop->addShopApply($apply_type, $uid, $company_name, $company_province_id, $company_city_id, $company_district_id, $company_address_detail, $company_phone, $company_type, $company_employee_count, $company_registered_capital, $contacts_name, $contacts_phone, $contacts_email, $contacts_card_no, $contacts_card_electronic_1, $contacts_card_electronic_2, $contacts_card_electronic_3, $business_licence_number, $business_sphere, $business_licence_number_electronic, $organization_code, $organization_code_electronic, $general_taxpayer, $bank_account_name, $bank_account_number, $bank_name, $bank_code, $bank_address, $bank_licence_electronic, $is_settlement_account, $settlement_bank_account_name, $settlement_bank_account_number, $settlement_bank_name, $settlement_bank_code, $settlement_bank_address, $tax_registration_certificate, $taxpayer_id, $tax_registration_certificate_electronic, $shop_name, $apply_state, $apply_message, $apply_year, $shop_type_name, $shop_type_id, $shop_group_name, $shop_group_id, $paying_money_certificate, $paying_money_certificate_explain, $paying_amount, $recommend_uid);
            return AjaxReturn($retval);
        } else {
            $shop_type_list = $shop->getShopTypeList();
            $this->assign('shop_type_list', $shop_type_list['data']);
            
            $shop_group = $shop->getShopGroup();
            $this->assign('shop_group', $shop_group['data']);
            
            $apply_state = $this->user->getMemberIsApplyShop($this->uid);
            $this->assign("apply_state", $apply_state);
            $this->assign("is_read", isset($_GET['is_read']) ? $_GET['is_read'] : 0);
            
            return view($this->style . 'Shop/applySecondCompanyInfo');
        }
    }

    /**
     * 根据手机号查询推广人id
     *
     * @return number|unknown|number
     */
    public function getShopAssistantCode()
    {
        $assistant_code = isset($_POST['assistant_code']) ? $_POST['assistant_code'] : 0;
        if ($assistant_code) {
            $business_assistant = new NbsBusinessAssistant();
            $res = $business_assistant->getShopAssistantCode($assistant_code);
            return $res;
        }
        return 0;
    }

    /**
     * 获取省列表
     */
    public function getProvince()
    {
        $address = new Address();
        $province_list = $address->getProvinceList();
        return $province_list;
    }

    /**
     * 获取城市列表
     *
     * @return Ambigous <multitype:\think\static , \think\false, \think\Collection, \think\db\false, PDOStatement, string, \PDOStatement, \think\db\mixed, boolean, unknown, \think\mixed, multitype:, array>
     */
    public function getCity()
    {
        $address = new Address();
        $province_id = isset($_POST['province_id']) ? $_POST['province_id'] : 0;
        $city_list = $address->getCityList($province_id);
        return $city_list;
    }

    /**
     * 获取区域地址
     */
    public function getDistrict()
    {
        $address = new Address();
        $city_id = isset($_POST['city_id']) ? $_POST['city_id'] : 0;
        $district_list = $address->getDistrictList($city_id);
        return $district_list;
    }

    /**
     * 商家入驻第三步：店铺信息认证
     * 创建人：王永杰
     * 创建时间：2017年2月7日 16:38:55
     *
     * @return \think\response\View
     */
    public function applyThirdStoreInfo()
    {
        return view($this->style . 'Shop/applyThirdStoreInfo');
    }

    /**
     * 商家入驻，等待审核
     * 创建人：王永杰
     * 创建时间：2017年2月7日 16:42:13
     *
     * @return \think\response\View
     */
    public function applyFinish()
    {
        return view($this->style . 'Shop/applyFinish');
    }
}