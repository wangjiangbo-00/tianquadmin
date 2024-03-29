<?php
/**
 * Express.php
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

use data\service\Address as Address;
use data\service\Express as ExpressService;

/**
 * 物流
 *
 * @author Administrator
 *        
 */
class Express extends BaseController
{

    public function __construct()
    {
        parent::__construct();
    }

    /**
     * 物流地址
     */
    public function expressAddress()
    {
        if (request()->isAjax()) {
            $express = new ExpressService();
            $pageindex = isset($_POST['pageIndex']) ? $_POST['pageIndex'] : '';
            $list = $express->getShopExpressAddressList($pageindex, PAGESIZE, [
                'shop_id' => $this->instance_id
            ], '');
            return $list;
        } else {
            return view($this->style . 'Express/expressAddress');
        }
    }

    /**
     * 功能说明：获取省
     * 创建人：李志伟
     * 创建时间：2017年1月4日14:40:31
     */
    public function getProvinceList()
    {
        $address = new Address();
        $data = $address->getProvinceList();
        return $data;
    }

    /**
     * 功能说明：获取市
     * 创建人：李志伟
     * 创建时间：2017年1月4日14:41:02
     */
    public function getCityList()
    {
        $province = $_POST['province'];
        $address = new Address();
        $data = $address->getCityList($province);
        return $data;
    }

    /**
     * 功能说明：获取区/县
     * 创建人：李志伟
     * 创建时间：2017年1月4日14:41:19
     */
    public function getDistrictList()
    {
        $city = $_POST['city'];
        $address = new Address();
        $data = $address->getDistrictList($city);
        return $data;
    }

    /**
     * 添加物流地址
     *
     * @return Ambigous <multitype:unknown, multitype:unknown unknown string >
     */
    public function addExpressAddress()
    {
        // 获取数据一律使用三元运算符
        $contact = isset($_POST['contact']) ? $_POST['contact'] : '';
        $mobile = isset($_POST['mobile']) ? $_POST['mobile'] : '';
        $phone = isset($_POST['phone']) ? $_POST['phone'] : '';
        $company_name = isset($_POST['company_name']) ? $_POST['company_name'] : '';
        $province = isset($_POST['province']) ? $_POST['province'] : '';
        $city = isset($_POST['city']) ? $_POST['city'] : '';
        $district = isset($_POST['district']) ? $_POST['district'] : '';
        $zipcode = isset($_POST['zipcode']) ? $_POST['zipcode'] : '';
        $address = isset($_POST['address']) ? $_POST['address'] : '';
        $express = new ExpressService();
        $retval = $express->addShopExpressAddress($contact, $mobile, $phone, $company_name, $province, $city, $district, $zipcode, $address);
        return AjaxReturn($retval);
    }

    /**
     * 功能说明： 根据id查看收货地址详情
     * 创建人：李志伟
     * 创建时间：2017年1月5日11:23:38
     */
    public function ExpressAddressInfo()
    {
        $express_address_id = isset($_POST['express_address_id']) ? $_POST['express_address_id'] : '';
        $express = new ExpressService();
        $retval = $express->selectShopExpressAddressInfo($express_address_id);
        return $retval;
    }

    /**
     * 修改物流地址
     *
     * @return Ambigous <multitype:unknown, multitype:unknown unknown string >
     */
    public function updateExpressAddress()
    {
        $express = new ExpressService();
        $express_address_id = isset($_POST['express_address_id']) ? $_POST['express_address_id'] : '';
        $contact = isset($_POST['contact']) ? $_POST['contact'] : '';
        $mobile = isset($_POST['mobile']) ? $_POST['mobile'] : '';
        $phone = isset($_POST['phone']) ? $_POST['phone'] : '';
        $company_name = isset($_POST['company_name']) ? $_POST['company_name'] : '';
        $province = isset($_POST['province']) ? $_POST['province'] : '';
        $city = isset($_POST['city']) ? $_POST['city'] : '';
        $district = isset($_POST['district']) ? $_POST['district'] : '';
        $zipcode = isset($_POST['zipcode']) ? $_POST['zipcode'] : '';
        $address = isset($_POST['address']) ? $_POST['address'] : '';
        $retval = $express->updateShopExpressAddress($express_address_id, $contact, $mobile, $phone, $company_name, $province, $city, $district, $zipcode, $address);
        return AjaxReturn($retval);
    }

    public function on56NotifyMessage()
    {
        require __DIR__ . '/../../../thirdpart/56PushSDK/ReceivePushData.php';


        $returnData = new \ReceivePushData();
//接收推送
        $num = $returnData->num;//快递单号
        $exp = $returnData->exp;//公司简码
        $msg = $returnData->data;//轨迹信息

        trace("receive from 56 notify with message".$num.$exp.$msg);




    }

    /**
     * 功能说明：运费模板管理-列表分页
     * 创建人：耿鹏鹏
     * 创建时间：2015-6-11 12:04
     * 修改人：王永杰
     * 修改时间：2017年6月27日 09:12:48
     */
    public function freightTemplateList()
    {
        if (request()->isAjax()) {
            $pageindex = request()->post('page_index', 1);
            $page_page = request()->post('page_size', PAGESIZE);
            $co_id = request()->post("co_id", 0);
            if ($co_id) {
                $condition['shop_id'] = $this->instance_id;
            }
           
            $shippingfee_list = new ExpressService();
            $express_list_pagequery = $shippingfee_list->getShippingFeeList($pageindex, $page_page, $condition, 'is_default desc,create_time desc');
            $totalcount = $express_list_pagequery['total_count'];
            $pagecount = $express_list_pagequery['page_count'];
            $this->assign('data_length', count($express_list_pagequery['data']));
            $this->assign('totalcount', $totalcount);
            $this->assign('pagecount', $pagecount);
            $this->assign("co_id", $co_id);
            $this->assign('express_list_pagequery', $express_list_pagequery['data']); // 列表
            return view($this->style . 'Express/freightTemplateListPage');
        } else {

            return view($this->style . 'Express/freightTemplateList');
        }
    }

    /**
     * 功能说明：运费模板管理-添加
     * 创建人：耿鹏鹏
     * 创建时间：2015-6-17 10:39
     */
    public function freightTemplateEdit()
    {
        $express = new ExpressService();
        $address = new Address();
        if (request()->isAjax()) {
            $retval = - 1;
            $data = request()->post("data", "");
            $json_data = json_decode($data, true);
            $shipping_fee_id = $json_data['shipping_fee_id']; // 0：添加，大于0：修改

            $is_default = $json_data['is_default']; // 是否默认
            $shipping_fee_name = $json_data['shipping_fee_name']; // 运费模板名称
            $province_id_array = $json_data['province_id_array']; // 省id组

            

            $weight_snum = $json_data['weight_snum']; // 首重
            $weight_sprice = $json_data['weight_sprice']; // 首重运费
            $weight_xnum = $json_data['weight_xnum']; // 续重
            $weight_xprice = $json_data['weight_xprice']; // 续重运费
            
            $fee_mode = $json_data['fee_mode']; // 是否启用体积计算运费，0：不启用，1：启用


            
            if ($shipping_fee_id) {
                $retval = $express->updateShippingFee($shipping_fee_id, $is_default, $shipping_fee_name, $province_id_array, $weight_snum, $weight_sprice, $weight_xnum, $weight_xprice, $fee_mode);
            } else {
                $retval = $express->addShippingFee( $is_default, $shipping_fee_name, $province_id_array,   $weight_snum, $weight_sprice, $weight_xnum, $weight_xprice, $fee_mode);
            }
            return AjaxReturn($retval);
        } else {

            $shipping_fee_id = request()->get("shipping_fee_id", 0); // 运费模板id（用于修改运费模板）
            


            $this->assign("shipping_fee_id", $shipping_fee_id);
            $current_province_id_array = ""; // 省，排除当前编辑的省市id组
            $current_city_id_array = ""; // 市
            $is_default = 1; // 获取当前物流公司是否有默认地区
            
            if ($shipping_fee_id) {
                // 编辑修改
                $shipping_fee_detail = $express->shippingFeeDetail($shipping_fee_id);
                if ($shipping_fee_detail['is_default']) {
                    $is_default = $shipping_fee_detail['is_default'];
                }
                $current_province_id_array = $shipping_fee_detail['province_id_array'];

                $this->assign("shipping_fee_detail", $shipping_fee_detail);
            }
            $this->assign("is_default", $is_default);
            
            // 当前物流公司已存在的省市id组，将禁用，不能再选择,
            $existing_address_list = $express->getExpressCompanyProvincesAndCitiesById($this->instance_id, $current_province_id_array, $current_city_id_array);
            $address_list = $address->getAreaTree($existing_address_list); // 获取地区树，排除当前物流公司的所有省市（修改时的省市不能禁用）
            $this->assign("address_list", $address_list);
            
            return view($this->style . 'Express/freightTemplateEdit');
        }
    }

    /**
     * 运费模板删除
     * 2017年6月27日 14:38:50 王永杰
     */
    public function freightTemplateDelete()
    {
        $shipping_fee_id = $_POST["shipping_fee_id"];
        $express = new ExpressService();
        $retval = $express->shippingFeeDelete($shipping_fee_id);
        return AjaxReturn($retval);
    }

    /**
     * 物流公司模板信息
     */
    public function ExpressTemplate()
    {
        // 微物流->运单模版选择打印项全部检索
        $express = new ExpressService();
        $express_shipping_items_select = $express->getExpressShippingItemsLibrary($this->instance_id);
        foreach ($express_shipping_items_select as $key => $value) {
            $field_name[$key] = str_replace("A", "", $value['field_name']);
        }
        array_multisort($field_name, SORT_NUMERIC, SORT_ASC, $express_shipping_items_select);
        if (isset($_GET['co_id'])) {
            $id = $_GET['co_id'];
        } else {
            return false;
        }
        $express_company_detail = $express->expressCompanyDetail($id);
        $express_shipping_detail = $express->getExpressShipping($id);
        $sid = 0;
        if (! empty($express_shipping_detail)) {
            $sid = $express_shipping_detail["sid"];
        }
        $print = $express->getExpressShippingItems($sid);
        if (! empty($print)) {
            foreach ($print as $key => $value) {
                $field_name[$key] = str_replace("A", "", $value['field_name']);
            }
            array_multisort($field_name, SORT_NUMERIC, SORT_ASC, $print);
        }
        $this->assign('express_company_select', $express_company_detail);
        $this->assign('express_shipping_select', $express_shipping_detail);
        $this->assign('print', $print);
        $this->assign("express_id", $id);
        $this->assign('express_shipping_items_select', $express_shipping_items_select);
        return view($this->style . 'Express/expressTemplate');
    }

    /**
     * 功能说明：运单模板管理-添加-添加保存-编辑保存
     * 更新 物流公司的模板
     */
    public function SetPrintTemplate()
    {
        $shopId = $this->instance_id;
        // 模板id
        $template_id = isset($_POST['templateID']) ? $_POST['templateID'] : '';
        // 物流id
        $co_id = isset($_POST['express_id']) ? $_POST['express_id'] : '';
        // 模板宽度
        $width = isset($_POST['width_length']) ? $_POST['width_length'] : '';
        // 模板高度
        $height = isset($_POST['heigth_length']) ? $_POST['heigth_length'] : '';
        // 图片路径
        $img = isset($_POST['imgUrl']) ? $_POST['imgUrl'] : '';
        // 打印项
        $itemsArray = isset($_POST['sendDatas']) ? $_POST['sendDatas'] : '';
        $express_service = new ExpressService();
        // 更新模板信息
        $result = $express_service->updateExpressShipping($template_id, $width, $height, $img, $itemsArray);
        return $result;
    }

    public function GetTemPalteElement()
    {
        if (isset($_POST['templateID'])) {
            $id = $_POST['templateID'];
        } else {
            return false;
        }
        $express = new ExpressService();
        $express_shipping_select = $express->getExpressShippingItems($id);
        $data = $express_shipping_select[0][0];
        $data['template'] = $express_shipping_select[1];
        return AjaxReturn($data);
    }

    /**
     * 功能说明：运单模板管理-添加-上传图片-用于文件上传的服务器端请求地址
     */
    public function UploadImage()
    {
        $guid = $this->uid;
        $shopId = $this->instance_id;
        if (file_exists($_FILES['fileUploadImg']['tmp_name'])) {
            $upFilePath = "upload/admin/express/";
            if (stristr($_FILES['fileUploadImg']['type'], 'jpeg')) {
                $suffix = 'jpg';
            } elseif (stristr($_FILES['fileUploadImg']['type'], 'png')) {
                $suffix = 'png';
            } elseif (stristr($_FILES['fileUploadImg']['type'], 'bmp')) {
                $suffix = 'bmp';
            } else {
                return false;
            }
            $str = $upFilePath . $guid . "." . $suffix;
            $ok = @move_uploaded_file($_FILES['fileUploadImg']['tmp_name'], $str);
            if ($ok === FALSE) {
                echo "上传失败！";
            } else {
                $filename = $guid . "." . $suffix;
                $path = "express/" . $guid . "." . $suffix;
                $filesize = $_FILES['fileUploadImg']['size']; // 已上传文件的大小，单位为字节。
                $extension = $suffix; // 文件的 MIME 类型，例如"image/gif"。
                $image = getimagesize($str);
                $width = $image["0"]; // //获取图片的宽
                $height = $image["1"]; // /获取图片的高
                $image_library_insert = $this->core->image_library_insert($guid, $shopId, $filename, $path, $filesize, $extension, $width, $height);
                if ($image_library_insert) {
                    echo $guid . "." . $suffix;
                } else {
                    echo "写入数据库失败";
                }
            }
        }
    }

    /**
     * 功能：物流公司
     * 创建：左骐羽
     * 时间：2016年12月9日11:45:07
     */
    public function expressCompany()
    {
        $expressCompany = new ExpressService();
        if (request()->isAjax()) {
            $page_index = request()->post('page_index', 1);
            $page_size = request()->post('page_size', PAGESIZE);
            $search_text = request()->post('search_text', '');
            $condition = array(
                'shop_id' => $this->instance_id,
                'company_name|express_no' => array(
                    'like',
                    '%' . $search_text . '%'
                )
            );
            $retval = $expressCompany->getExpressCompanyList($page_index, $page_size, $condition);
            return $retval;
        }
        return view($this->style . 'Express/expressCompany');
    }

    /**
     * 功能：添加物流公司
     * 创建：左骐羽
     * 时间：2016年12月9日14:43:18
     */
    public function addExpressCompany()
    {
        $expressCompany = new ExpressService();
        if (request()->isAjax()) {
            $shop_id = $this->instance_id;
            $company_name = isset($_POST['company_name']) ? $_POST['company_name'] : '';
            $express_logo = isset($_POST['express_logo']) ? $_POST['express_logo'] : '';
            $express_no = $_POST['express_no'];
            $is_enabled = $_POST['is_enabled'];
            $image = isset($_POST['image']) ? $_POST['image'] : '';
            $phone = $_POST['phone'];
            $orders = $_POST['orders'];
            $is_default = isset($_POST['is_default']) ? $_POST['is_default'] : '0';
            $retval = $expressCompany->addExpressCompany($shop_id, $company_name, $express_logo, $express_no, $is_enabled, $image, $phone, $orders, $is_default);
            return AjaxReturn($retval);
        }
        return view($this->style . 'Express/addExpressCompany');
    }

    /**
     * 功能：修改物流公司信息
     * 创建：左骐羽
     * 时间：2016年12月9日16:07:27
     */
    public function updateExpressCompany()
    {
        $expressCompany = new ExpressService();
        if (request()->isAjax()) {
            $co_id = $_POST['co_id'];
            $shopId = $this->instance_id;
            $company_name = $_POST['company_name'];
            $express_logo = isset($_POST['express_logo']) ? $_POST['express_logo'] : '';
            $express_no = $_POST['express_no'];
            $is_enabled = $_POST['is_enabled'];
            $image = isset($_POST['image']) ? $_POST['image'] : '';
            $phone = $_POST['phone'];
            $orders = $_POST['orders'];
            $is_default = isset($_POST['is_default']) ? $_POST['is_default'] : '0';
            $retval = $expressCompany->updateExpressCompany($co_id, $shopId, $company_name, $express_logo, $express_no, $is_enabled, $image, $phone, $orders, $is_default);
            return AjaxReturn($retval);
        }
        $co_id = $_GET['co_id'];
        $expressCompanyinfo = $expressCompany->expressCompanyDetail($co_id);
        if($expressCompanyinfo['shop_id'] != $this->instance_id || empty($expressCompanyinfo))
        {
            $this->error("当前物流公司不存在或者当前用户无权限!");
        }
        $this->assign('expressCompany', $expressCompanyinfo);
        return view($this->style . 'Express/updateExpressCompany');
    }

    /**
     * 功能：删除物流公司
     * 创建：左骐羽
     * 时间：2016年12月9日16:42:14
     */
    public function expressCompanyDelete()
    {
        if (request()->isAjax()) {
            $expressCompany = new ExpressService();
            $co_id = $_POST['co_id'];
            $retval = $expressCompany->expressCompanyDelete($co_id);
            return AjaxReturn($retval);
        }
    }

    /**
     * 功能说明：物流地址删除
     * 创建：李志伟
     * 时间：2017年1月4日17:20:27
     */
    public function deleteShopExpressAddress()
    {
        if (request()->isAjax()) {
            $expressCompany = new ExpressService();
            $express_address_id = $_POST['express_address_id'];
            $retval = $expressCompany->deleteShopExpressAddress($express_address_id);
            return AjaxReturn($retval);
        }
    }

    /**
     * 功能说明：设置默认地址
     * $addressType 为0发货地址 1收货地址
     * 创建人：李志伟
     * 创建时间：2017-1-5 12:10:02
     */
    public function modifyShopExpressAddress()
    {
        if (request()->isAjax()) {
            $expressCompany = new ExpressService();
            $addressType = isset($_POST['addressType']) ? $_POST['addressType'] : '';
            $express_address_id = isset($_POST['express_address_id']) ? $_POST['express_address_id'] : '';
            if ($addressType == 0) {
                $retval = $expressCompany->modifyShopExpressAddressConsigner($express_address_id, 1);
            } elseif ($addressType == 1) {
                $retval = $expressCompany->modifyShopExpressAddressReceiver($express_address_id, 1);
            }
            return AjaxReturn($retval);
        }
    }
}