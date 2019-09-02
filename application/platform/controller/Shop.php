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
namespace app\platform\controller;

use data\model\NsPlatformBannerModel;
use data\service\Address;
use data\service\Shop as ShopService;
use data\service\WebSite as WebSite;
use think\Controller;
use data\service\User;

/**
 * 店铺设置控制器
 *
 * @author Administrator
 *        
 */
class Shop extends BaseController
{
    /**
     * 店铺列表
     */
    public function shopList(){
        if (request()->isAjax()){
            $index = request()->post('pageIndex',1);
            $search_text = request()->post('search_text','');
            $shop_type = request()->post('shop_type','');
            $status = request()->post('status','');
            $condition['shop_name'] = array('like','%'.$search_text.'%');
            $condition['shop_type'] = $shop_type;
            
             $condition = array_filter($condition);
             if($status != ''){
                 $condition['shop_state'] = $status;
             }
             
            //var_dump($condition);
            $shop = new ShopService();
            $list = $shop->getShopList($index, PAGESIZE, $condition,'shop_recommend desc,shop_sort');
            foreach($list['data'] as $k=>$v){
                $username=new User();
                $user_name = $username ->getUserInfoByUid($uid=$v['uid']);
                $list[$k]['username'] = $user_name['user_name'];
            }
            return $list;
        }
        $shop = new ShopService();
        $shop_type_list = $shop->getShopTypeList();
        $this->assign('shop_type_list',$shop_type_list['data']);
        return view($this->style."Shop/shopList");
    }
    
    /**
     * 修改店铺排序
     */
    public function updateShopList(){
        if(request()->isAjax()){
            $shop_id = isset($_POST['shop_id']) ? $_POST['shop_id'] : '';
            $shop_sort = isset($_POST['shop_sort']) ? $_POST['shop_sort'] : '';
            $shop = new ShopService();
            $retval = $shop->updateShopSort($shop_id,$shop_sort);
            return AjaxReturn($retval);
        }
    }
    
    public function setStatus(){
        if(request()->isAjax()){
            $shop_id = request()->post('shop_id','');
            $type = request()->post('type','1');
            $shop = new ShopService();
            $retval = $shop ->setStatus($shop_id, $type);
            return AjaxReturn($retval);
        }
    }
    
    /**
     * 设置店铺为推荐
     */
    public function setRecomment(){
        if(request()->isAjax()){
            $shop_id = isset($_POST['shop_id']) ? $_POST['shop_id'] : '';
            $shop_recommend = isset($_POST['shop_recommend']) ? $_POST['shop_recommend'] : '';
            $shop = new ShopService();
            $retval = $shop->setRecomment($shop_id,$shop_recommend);
            return AjaxReturn($retval);
        }
        return view($this->style."Shop/shopList");
    }
    /**
     * 店铺等级
     * @return multitype:number unknown
     */
    public function shopLevelList(){
        if (request()->isAjax()) {
            $index = isset($_POST["pageIndex"]) ? $_POST["pageIndex"] : 1;
            $search_text = isset($_POST['search_text']) ? $_POST['search_text'] : '';
            $shop = new ShopService();
            $list = $shop->getShopTypeList($index, PAGESIZE, ['type_name' => array('like','%'.$search_text.'%')]);
            return $list;
        }
        return view($this->style."Shop/shopLevelList");
    }
    /**
     * 店铺申请列表
     * @return multitype:number unknown
     */
    public function shopApplyList(){
        if (request()->isAjax()) {
            $index = isset($_POST["pageIndex"]) ? $_POST["pageIndex"] : 1;
            $search_text = isset($_POST['search_text']) ? $_POST['search_text'] : '';
            $shop = new ShopService();
            $list = $shop->getShopApplyList($index, PAGESIZE, ['shop_name' => array('like','%'.$search_text.'%')]);
            return $list;
        }
        return view($this->style."Shop/shopApplyList");
    }
    /**
     * 店铺申请列表
     * @return multitype:number unknown
     */
    public function shopGroupList(){
        if (request()->isAjax()) {
            $index = isset($_POST["pageIndex"]) ? $_POST["pageIndex"] : 1;
            $search_text = isset($_POST['search_text']) ? $_POST['search_text'] : '';
            $shop = new ShopService();
            $list = $shop->getShopGroup($index, PAGESIZE, ['group_name' => array('like','%'.$search_text.'%')]);
            return $list;
        }
        return view($this->style."Shop/shopGroupList");
    }
    
    /**
     * 添加店铺分组
     * @return \think\response\View
     */
    public function addShopGroup(){
        if(request()->isAjax()){
            $group_name=isset($_POST['group_name'])?$_POST['group_name']:'';
            $group_sort=isset($_POST['group_sort'])?$_POST['group_sort']:'';
            $shop=new ShopService();
            $retval=$shop->addShopGroup($group_name, $group_sort);
            return AjaxReturn($retval);
        }else{
            return view($this->style."Shop/addShopGroup");
        }
    }
    
    /**
     * 修改店铺分组
     */
    public function updateShopGroup(){
        $shop=new ShopService();
        if(request()->isAjax()){
            $shop_group_id=isset($_POST['shop_group_id'])?$_POST['shop_group_id']:'';
            $group_name=isset($_POST['group_name'])?$_POST['group_name']:'';
            $group_sort=isset($_POST['group_sort'])?$_POST['group_sort']:'';
            $retval=$shop->updateShopGroup($shop_group_id, $group_name, $group_sort);
            return AjaxReturn($retval);
        }else{
            $shop_group_id=isset($_GET['shop_group_id'])?$_GET['shop_group_id']:'';
            $shop_group_info=$shop->getShopGroupDetail($shop_group_id);
            $this->assign('shop_group_info',$shop_group_info);
            return view($this->style."Shop/updateShopGroup");
        }
    }
    /**
     * 审核店铺
     * 任鹏强
     * 2017年2月17日10:57:54
     */
    public function shopVerify(){
        $apply_id = isset($_GET['id']) ? $_GET['id'] : '';
        $shop = new ShopService();
        $result=$shop->getShopApplyDetail($apply_id);
        //        dump($result);
        $this->assign('result',$result);
        return view($this->style."Shop/shopVerify");
    }
    /**
     *
     */
    public function ajax_shopVerify(){
        if(request()->isAjax()){
            $shop_apply_id = isset($_POST['apply_id']) ? $_POST['apply_id'] : '';
            $type = isset($_POST['type']) ? $_POST['type'] : '';
            $shop = new ShopService();
            $retval = $shop->dealwithShopApply($shop_apply_id, $type);
            return AjaxReturn($retval);
        }
    }
    
    /**
     * 删除店铺分组
     * @return multitype:number string |multitype:unknown
     */
    public function delShopGroup(){
        $shop=new ShopService();
        $shop_group_id=isset($_POST['shop_group_id'])?$_POST['shop_group_id']:'';
        $retval=$shop->delShopGroup($shop_group_id);
        if(empty($retval)){
            $retval=['code'=>0,'message'=>'分组已被使用不可删除!'];
            return $retval;
        }
        return AjaxReturn($retval);
    }
    
    /**
     * 添加店铺等级
     * @return \think\response\View
     */
    public function addShopLevel(){
        if(request()->isAjax()){
            $type_name=isset($_POST['type_name'])?$_POST['type_name']:'';
            $type_module_array=isset($_POST['type_module_array'])?$_POST['type_module_array']:'';
            $type_desc=isset($_POST['type_desc'])?$_POST['type_desc']:'';
            $type_sort=isset($_POST['type_sort'])?$_POST['type_sort']:'';
            $shop=new ShopService();
            $retval=$shop->addShopType($type_name, $type_module_array, $type_desc, $type_sort);
            return AjaxReturn($retval);
        }else{
            //权限
            $web_site=new WebSite();
            $module_list_one=$web_site->getSystemModuleList(1,0,['module'=>'admin','level'=>1],'sort');
            $module_list_two=$web_site->getSystemModuleList(1,0,['module'=>'admin','level'=>2],'sort');
            $module_list_three=$web_site->getSystemModuleList(1,0,['module'=>'admin','level'=>3],'sort');
            $this->assign('module_list_one',$module_list_one['data']);
            $this->assign('module_list_two',$module_list_two['data']);
            $this->assign('module_list_three',$module_list_three['data']);
            return view($this->style."Shop/addShopLevel");
        }
    }
    /**
     * 修改店铺等级
     * @return multitype:unknown
     */
    public function updateShopLevel(){
        $shop=new ShopService();
        if(request()->isAjax()){
            $instance_typeid=isset($_POST['instance_typeid'])?$_POST['instance_typeid']:'';
            $type_name=isset($_POST['type_name'])?$_POST['type_name']:'';
            $type_module_array=isset($_POST['type_module_array'])?$_POST['type_module_array']:'';
            $type_desc=isset($_POST['type_desc'])?$_POST['type_desc']:'';
            $type_sort=isset($_POST['type_sort'])?$_POST['type_sort']:'';
            $retval=$shop->updateShopType($instance_typeid, $type_name, $type_module_array, $type_desc, $type_sort);
            return AjaxReturn($retval);
        }else{
            $instance_typeid=isset($_GET['instance_typeid'])?$_GET['instance_typeid']:'';
            $shop_level_info=$shop->getShopTypeDetail($instance_typeid);
            $this->assign('shop_level_info',$shop_level_info);
    
            $web_site=new WebSite();
            $module_list_one=$web_site->getSystemModuleList(1,0,['module'=>'admin','level'=>1],'sort');
            $module_list_two=$web_site->getSystemModuleList(1,0,['module'=>'admin','level'=>2],'sort');
            $module_list_three=$web_site->getSystemModuleList(1,0,['module'=>'admin','level'=>3],'sort');
            $this->assign('module_list_one',$module_list_one['data']);
            $this->assign('module_list_two',$module_list_two['data']);
            $this->assign('module_list_three',$module_list_three['data']);
    
            return view($this->style."Shop/updateShopLevel");
        }
    }
    /**
     * 修改店铺
     */
    public function updateShop(){
        if(request()->isAjax()){
            $shop_id = isset($_POST['shop_id']) ? $_POST['shop_id'] : '';
            $shop_name = isset($_POST['shop_name']) ? $_POST['shop_name'] : '';
            $shop_group_id = isset($_POST['shop_group_id']) ? $_POST['shop_group_id'] : '';
            $shop_type = isset($_POST['shop_type']) ? $_POST['shop_type'] : '';
            $shop_credit = isset($_POST['shop_credit']) ? $_POST['shop_credit'] : '';
            $shop_desccredit = isset($_POST['shop_desccredit']) ? $_POST['shop_desccredit'] : '';
            $shop_servicecredit = isset($_POST['shop_servicecredit']) ? $_POST['shop_servicecredit'] : '';
            $shop_deliverycredit = isset($_POST['shop_deliverycredit']) ? $_POST['shop_deliverycredit'] : '';
            $store_qtian = isset($_POST['store_qtian']) ? $_POST['store_qtian'] : '';
            $shop_zhping = isset($_POST['shop_zhping']) ? $_POST['shop_zhping'] : '';
            $shop_erxiaoshi = isset($_POST['shop_erxiaoshi']) ? $_POST['shop_erxiaoshi'] : '';
            $shop_tuihuo = isset($_POST['shop_tuihuo']) ? $_POST['shop_tuihuo'] : '';
            $shop_shiyong = isset($_POST['shop_shiyong']) ? $_POST['shop_shiyong'] : '';
            $shop_shiti = isset($_POST['shop_shiti']) ? $_POST['shop_shiti'] : '';
            $shop_xiaoxie = isset($_POST['shop_xiaoxie']) ? $_POST['shop_xiaoxie'] : '';
            $shop_huodaofk = isset($_POST['shop_huodaofk']) ? $_POST['shop_huodaofk'] : '';
            $shop_state = isset($_POST['shop_state']) ? $_POST['shop_state'] : '';
            $shop_close_info = isset($_POST['shop_close_info']) ? $_POST['shop_close_info'] : '';
            $shop = new ShopService();
            $res = $shop->updateShopConfigByPlatform($shop_id, $shop_name, $shop_group_id, $shop_type, $shop_credit, $shop_desccredit, $shop_servicecredit, $shop_deliverycredit, $store_qtian, $shop_zhping, $shop_erxiaoshi, $shop_tuihuo, $shop_shiyong, $shop_shiti, $shop_xiaoxie, $shop_huodaofk, $shop_state, $shop_close_info);
            return AjaxReturn($res);
        }
        $shop_id = isset($_GET['shop_id']) ? $_GET['shop_id'] : 0;
        $shop = new ShopService();
        $group_list = $shop->getShopGroup(1, 0);
        $this->assign('group_list', $group_list['data']);
        $type_list = $shop->getShopTypeList(1, 0);
        $this->assign('type_list', $type_list['data']);
        $info = $shop->getShopDetail($shop_id);
        $this->assign('info', $info['base_info']);
        $apply_info = $shop->getShopApplyDetail(['shop_id'=>$shop_id]);
        $this->assign('apply_info', $apply_info);
        //         var_dump($apply_info);
        //         var_dump($group_list['data']);
        //         var_dump($type_list['data']);
        //         var_dump($info);
        return view($this->style."Shop/updateShop");
    }
    public function updateShopApply(){
        $apply_id = isset($_POST['apply_id']) ? $_POST['apply_id'] : '';
        $company_name = isset($_POST['company_name']) ? $_POST['company_name'] : '';
        $company_province_id = isset($_POST['company_province_id']) ? $_POST['company_province_id'] : '';
        $company_city_id = isset($_POST['company_city_id']) ? $_POST['company_city_id'] : '';
        $company_district_id = isset($_POST['company_district_id']) ? $_POST['company_district_id'] : '';
        $company_address_detail = isset($_POST['company_address_detail']) ? $_POST['company_address_detail'] : '';
        $company_phone = isset($_POST['company_phone']) ? $_POST['company_phone'] : '';
        $company_employee_count = isset($_POST['company_employee_count']) ? $_POST['company_employee_count'] : '';
        $company_registered_capital = isset($_POST['company_registered_capital']) ? $_POST['company_registered_capital'] : '';
        $contacts_name = isset($_POST['contacts_name']) ? $_POST['contacts_name'] : '';
        $contacts_phone = isset($_POST['contacts_phone']) ? $_POST['contacts_phone'] : '';
        $contacts_email = isset($_POST['contacts_email']) ? $_POST['contacts_email'] : '';
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
        $is_settlement_account = isset($_POST['is_settlement_account']) ? $_POST['is_settlement_account'] : '';
        $settlement_bank_account_name = isset($_POST['settlement_bank_account_name']) ? $_POST['settlement_bank_account_name'] : '';
        $settlement_bank_account_number = isset($_POST['settlement_bank_account_number']) ? $_POST['settlement_bank_account_number'] : '';
        $settlement_bank_name = isset($_POST['settlement_bank_name']) ? $_POST['settlement_bank_name'] : '';
        $settlement_bank_code = isset($_POST['settlement_bank_code']) ? $_POST['settlement_bank_code'] : '';
        $settlement_bank_address = isset($_POST['settlement_bank_address']) ? $_POST['settlement_bank_address'] : '';
        $tax_registration_certificate = isset($_POST['tax_registration_certificate']) ? $_POST['tax_registration_certificate'] : '';
        $taxpayer_id = isset($_POST['taxpayer_id']) ? $_POST['taxpayer_id'] : '';
        $tax_registration_certificate_electronic = isset($_POST['tax_registration_certificate_electronic']) ? $_POST['tax_registration_certificate_electronic'] : '';
        $shop = new ShopService();
        $res = $shop->updateShopApply($apply_id, $company_name, $company_province_id, $company_city_id, $company_district_id, $company_address_detail, $company_phone, $company_employee_count, $company_registered_capital,
            $contacts_name, $contacts_phone, $contacts_email, $business_licence_number, $business_sphere, $business_licence_number_electronic, $organization_code, $organization_code_electronic,
            $general_taxpayer, $bank_account_name, $bank_account_number, $bank_name, $bank_code, $bank_address, $bank_licence_electronic, $is_settlement_account, $settlement_bank_account_name,
            $settlement_bank_account_number, $settlement_bank_name, $settlement_bank_code, $settlement_bank_address, $tax_registration_certificate, $taxpayer_id, $tax_registration_certificate_electronic);
        return AjaxReturn($res);
    }
    /**
     * 店铺基础设置
     */
    public function shopConfig()
    {
        $child_menu_list = array(
            array(
                'url' => "Shop/shopConfig",
                'menu_name' => "店铺设置",
                "active" => 1
            ),
            array(
                'url' => "Shop/shopStyle",
                'menu_name' => "pc端主题",
                "active" => 0
            ),
            array(
                'url' => "Shop/shopWchatStyle",
                'menu_name' => "微信端主题",
                "active" => 0
            )
        );
        $shop = new ShopService();
        if (request()->isAjax()) {
            $shop_id = $this->instance_id;
            $shop_logo = isset($_POST['shop_logo']) ? $_POST['shop_logo'] : '';
            $shop_banner = isset($_POST['shop_banner']) ? $_POST['shop_banner'] : '';
            $shop_avatar = isset($_POST['shop_avatar']) ? $_POST['shop_avatar'] : '';
            $shop_qq = isset($_POST['shop_qq']) ? $_POST['shop_qq'] : '';
            $shop_ww = isset($_POST['shop_ww']) ? $_POST['shop_ww'] : '';
            $shop_phone = isset($_POST['shop_phone']) ? $_POST['shop_phone'] : '';
            $shop_keywords = isset($_POST['shop_keywords']) ? $_POST['shop_keywords'] : '';
            $shop_description = isset($_POST['shop_description']) ? $_POST['shop_description'] : '';
            $res = $shop->updateShopConfigByshop($shop_id, $shop_logo, $shop_banner, $shop_avatar, $shop_qq, $shop_ww, $shop_phone, $shop_keywords, $shop_description);
            return AjaxReturn($res);
        }
        $shop_info = $shop->getShopDetail($this->instance_id);
        $this->assign('shop_info', $shop_info);
        $this->assign('child_menu_list', $child_menu_list);
        return view($this->style . "Shop/shopConfig");
    }
    /**
     * 店铺提现列表
     * @return Ambigous <\think\response\View, \think\response\$this, \think\response\View>
     */
    public function shopAccountWithdrawList(){
        if(request()->isAjax()){
            $pageindex = request()->post("pageIndex",1);
            $status = request()->post('status','');
            $shop = new ShopService;
            if($status != ''){
                $condition['status'] = $status;
            }
           
            //return $condition['status'];
            $list = $shop->getShopAccountWithdrawList($pageindex,PAGESIZE,$condition, 'ask_for_date desc');
            return $list;
        }else{
            return view($this->style . "Shop/shopAccountWithdrawList");
        }
    }
    /**
     * 店铺提现审核
     * @return Ambigous <\think\response\View, \think\response\$this, \think\response\View>
     */
    public function shopAccountWithdrawAudit(){
        $shop=new ShopService();
        $shop_id = $_POST['shop_id'];
        $id = $_POST['id'];
        $status = $_POST['status'];
        $retval = $shop->shopAccountWithdrawAudit($shop_id, $id, $status);
        return AjaxReturn($retval);
    
    }

    /**
     * 店铺幻灯设置
     */
    public function shopAd()
    {
        $child_menu_list = array(
            array(
                'url' => "Shop/shopConfig",
                'menu_name' => "店铺设置",
                "active" => 0
            ),
            array(
                'url' => "Shop/shopAd",
                'menu_name' => "幻灯设置",
                "active" => 1
            ),
            array(
                'url' => "Shop/shopStyle",
                'menu_name' => "pc端主题",
                "active" => 0
            ),
            array(
                'url' => "Shop/shopWchatStyle",
                'menu_name' => "微信端主题",
                "active" => 0
            )
        );
        
        $this->assign('child_menu_list', $child_menu_list);
        return view($this->style . "Shop/shopAd");
    }

    /**
     * 店铺主题
     */
    public function shopStyle()
    {
        $child_menu_list = array(
            array(
                'url' => "Shop/shopConfig",
                'menu_name' => "店铺设置",
                "active" => 0
            ),
            array(
                'url' => "Shop/shopStyle",
                'menu_name' => "pc端主题",
                "active" => 1
            ),
            array(
                'url' => "Shop/shopWchatStyle",
                'menu_name' => "微信端主题",
                "active" => 0
            )
        );
        
        $this->assign('child_menu_list', $child_menu_list);
        return view($this->style . "Shop/shopStyle");
    }

    /**
     * 微信端样式
     */
    public function shopWchatStyle()
    {
        $child_menu_list = array(
            array(
                'url' => "Shop/shopConfig",
                'menu_name' => "店铺设置",
                "active" => 0
            ),
            array(
                'url' => "Shop/shopStyle",
                'menu_name' => "pc端主题",
                "active" => 0
            ),
            array(
                'url' => "Shop/shopWchatStyle",
                'menu_name' => "微信端主题",
                "active" => 1
            )
        );
        $this->assign('child_menu_list', $child_menu_list);
        return view($this->style . "Shop/shopWchatStyle");
    }

    /**
     * 自提点列表
     */
    public function pickupPointList()
    {
        if (request()->isAjax()) {
            $shop = new ShopService();
            $page_index = request()->post('page_index', 1);
            $page_size = request()->post('page_size', PAGESIZE);
            $search_text = request()->post('search_text', '');
            $condition = array(
                'name' => array(
                    'like',
                    '%' . $search_text . '%'
                )
            );
            $result = $shop->getPickupPointList($page_index, $page_size, $condition, 'create_time asc');
            return $result;
        } else {
            return view($this->style . "Shop/sinceList");
        }
    }

    /**
     * 添加自提点
     */
    public function addPickupPoint()
    {
        if (request()->isAjax()) {
            $shop = new ShopService();
            $shop_id = $this->instance_id;
            $name = request()->post('name');
            $address = request()->post('address');
            $contact = request()->post('contact');
            $phone = request()->post('phone');
            $province_id = request()->post('province_id');
            $city_id = request()->post('city_id');
            $district_id = request()->post('district_id');
            $res = $shop->addPickupPoint($shop_id, $name, $address, $contact, $phone, $province_id, $city_id, $district_id, '', '');
            return AjaxReturn($res);
        }
        return view($this->style . "Shop/addSince");
    }

    /**
     * 修改自提点
     */
    public function updatePickupPoint()
    {
        $pickip_id = isset($_GET['id']) ? $_GET['id'] : '';
        if (request()->isAjax()) {
            $shop = new ShopService();
            $id = request()->post('id');
            $shop_id = $this->instance_id;
            $name = request()->post('name');
            $address = request()->post('address');
            $contact = request()->post('contact');
            $phone = request()->post('phone');
            $province_id = request()->post('province_id');
            $city_id = request()->post('city_id');
            $district_id = request()->post('district_id');
            $res = $shop->updatePickupPoint($id, $shop_id, $name, $address, $contact, $phone, $province_id, $city_id, $district_id, '', '');
            return AjaxReturn($res);
        }
        $shop = new ShopService();
        $pickupPoint_detail = $shop->getPickupPointDetail($pickip_id);
        $this->assign('pickupPoint_detail', $pickupPoint_detail);
        $this->assign('pickip_id', $pickip_id);
        return view($this->style . "Shop/updatePickupPoint");
    }

    /**
     * 删除自提点
     */
    public function deletepickupPoint()
    {
        if (request()->isAjax()) {
            $pickip_id = request()->post('pickupPoint_id');
            $shop = new ShopService();
            $res = $shop->deletePickupPoint($pickip_id);
            return AjaxReturn($res);
        }
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
     * 获取选择地址
     *
     * @return unknown
     */
    public function getSelectAddress()
    {
        $address = new Address();
        $province_list = $address->getProvinceList();
        $province_id = isset($_POST['province_id']) ? $_POST['province_id'] : 0;
        $city_id = isset($_POST['city_id']) ? $_POST['city_id'] : 0;
        $city_list = $address->getCityList($province_id);
        $district_list = $address->getDistrictList($city_id);
        $data["province_list"] = $province_list;
        $data["city_list"] = $city_list;
        $data["district_list"] = $district_list;
        return $data;
    }




    /**
     * 添加自提点
     */
    public function addshop()
    {
        if (request()->isAjax()) {

            $userservice = new User();

            $username = request()->post('username');
            $passwd = request()->post('passwd');
            $safepw = request()->post('safepw');

            $userid = $userservice->add($username,$passwd,$safepw,null,null,1,null,null,null,null,null,0);

            $shop = new ShopService();

            $name = request()->post('name');
            $address = request()->post('address');
            $contact = request()->post('contact');
            $phone = request()->post('phone');
            $province_id = request()->post('province_id');
            $city_id = request()->post('city_id');

            $res = $shop->addshop( $name, 1,$userid, 0,null, $province_id, $city_id, $address, '',1);





            return AjaxReturn($res);
        }
        return view($this->style . "Shop/addShop");
    }


    public function getShopBannerList()
    {
        if (request()->isAjax()) {
            $page_index = request()->post("page_index", 1);
            $page_size = request()->post('page_size', PAGESIZE);
            $promotion = new NsPlatformBannerModel();
            $condition = array(



            );
            $list = $promotion->pageQuery($page_index, $page_size, $condition, 'sort desc', '*');
            return $list;

            return $list;
        }



        return view($this->style . "Shop/getShopBannerList");
    }


    public function addShopBanner()
    {
        if (request()->isAjax()) {
            $shop = new ShopService();
            $name = isset($_POST['name']) ? $_POST['name'] : '';
            $type = isset($_POST['type']) ? $_POST['type'] : '';
            $refid = isset($_POST['refid']) ? $_POST['refid'] : '';
            $refdetails = isset($_POST['refdetails']) ? $_POST['refdetails'] : '';
            $pic = isset($_POST['pic']) ? $_POST['pic'] : '';
            $is_visible = isset($_POST['is_visible']) ? $_POST['is_visible'] : '';
            $is_valid = isset($_POST['is_valid']) ? $_POST['is_valid'] : '';
            $description = isset($_POST['description']) ? $_POST['description'] : '';
            $sort= isset($_POST['sort']) ? $_POST['sort'] : '';
            $retval = $shop->addShopBanner($name, $type,$refid,$refdetails, $pic, $is_visible,$is_valid,$description,$sort);
            return AjaxReturn($retval);
        }
        return view($this->style . "Shop/addShopBanner");
    }

    /**
     * 修改限时折扣
     */
    public function updateShopBanner()
    {
        if (request()->isAjax()) {
            $shop = new ShopService();
            $id = isset($_POST['id']) ? $_POST['id'] : '';
            $name = isset($_POST['name']) ? $_POST['name'] : '';
            $type = isset($_POST['type']) ? $_POST['type'] : '';
            $refid = isset($_POST['refid']) ? $_POST['refid'] : '';
            $refdetails = isset($_POST['refdetails']) ? $_POST['refdetails'] : '';
            $pic = isset($_POST['pic']) ? $_POST['pic'] : '';
            $is_visible = isset($_POST['is_visible']) ? $_POST['is_visible'] : '';
            $is_valid = isset($_POST['is_valid']) ? $_POST['is_valid'] : '';
            $description = isset($_POST['description']) ? $_POST['description'] : '';
            $sort= isset($_POST['sort']) ? $_POST['sort'] : '';
            $retval = $shop->updateShopBanner($id, $description,$pic,$is_visible,$is_valid,$sort);
            return AjaxReturn($retval);
        }
        $id = isset($_GET['id']) ? $_GET['id'] : '';;
        $shop = new ShopService();
        $info = $shop->GetShopBannerDetails($id);

        $this->assign("info", $info);
        return view($this->style . "Shop/updateShopBanner");
    }

    /**
     * 修改自提点
     */


    /**
     * 删除自提点
     */





}
