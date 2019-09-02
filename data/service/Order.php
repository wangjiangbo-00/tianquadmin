<?php
/**
 * Order.php
 *
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

namespace data\service;

/**
 * 订单
 */
use data\api\IOrder as IOrder;
use data\extend\Kdniao;
use data\model\AlbumPictureModel;
use data\model\CityModel;
use data\model\DistrictModel;
use data\model\NsCartModel;
use data\model\NsGoodsEvaluateModel;
use data\model\NsGoodsModel;
use data\model\NsOrderAddrModel;
use data\model\NsOrderExpressCompanyModel;
use data\model\NsOrderExtraModel;
use data\model\NsOrderGoodsExpressModel;
use data\model\NsOrderGoodsModel;
use data\model\NsOrderModel;
use data\model\NsOrderRefundProcessModel;
use data\model\NsOrderShopReturnModel;
use data\model\NsShopModel;
use data\model\ProvinceModel;
use data\service\BaseService;
use data\service\GoodsCalculate\GoodsCalculate;
use data\service\NfxCommissionCalculate;
use data\service\NfxUser;
use data\service\niubusiness\NbsBusinessAssistantAccount;
use data\service\Order\Order as OrderBusiness;
use data\service\Order\OrderAccount;
use data\service\Order\OrderExpress;
use data\service\Order\OrderGoods;
use data\service\Order\OrderStatus;
use data\service\promotion\GoodsExpress;
use data\service\promotion\GoodsPreference;
use data\service\shopaccount\ShopAccount;
use data\model\NsShopOrderReturnModel;
use think\Log;

use data\model\NsMemberExpressAddressModel;


class Order extends BaseService implements IOrder
{

    function __construct()
    {
        parent::__construct();
    }

    /*
     * (non-PHPdoc)
     * @see \data\api\IOrder::getOrderDetail()
     */
    public function getOrderDetail($order_id)
    {
        // 查询主表信息
        $order = new OrderBusiness();
        $detail = $order->getDetail($order_id);
        $detail['pay_status_name'] = $this->getPayStatusInfo($detail['pay_status'])['status_name'];
        //$detail["status_name"] = $this->getOrderStatusInfo($detail["order_status"])["status_name"];


        $detail['operation'] = '';


        // 订单来源名称
        $order_status = OrderStatus::getOrderCommonStatus();

        if ($detail["ordertype"] == 0) {
            $detail["order_type_str"] = "普通订单";
        } else if ($detail["ordertype"] == 1) {
            $detail["order_type_str"] = "送礼订单";
        } else if ($detail["ordertype"] == 2) {
            $detail["order_type_str"] = "抽奖订单";
        }


        if ($detail["group_buy"] == 0) {
            $detail["order_group_str"] = "普通订单";
        } else if ($detail["group_buy"] == 1) {
            $detail["order_group_str"] = "用户拼单";
        } else if ($detail["group_buy"] == 2) {
            $detail["order_group_str"] = "平台团购";
        }


        foreach ($order_status as $k_status => $v_status) {

            if ($v_status['status_id'] == $detail['order_status']) {
                $detail['operation'] = $v_status['operation'];

                $detail['status_name'] = $v_status['status_name'];

            }


        }

        if ($detail["tryrefund"] == 1) {
            $operation_refund = ["no" => "setrefund", "color" => red, "name" => "退货"];
            $operations = $detail['operation'];
            $operations[] = $operation_refund;
            $detail['operation'] = $operations;


        }

        if ($detail["fixaddr"] == 1) {

            $operation_refund = ["no" => "fixaddr", "color" => blue, "name" => "修改地址"];
            $operations = $detail['operation'];
            $operations[] = $operation_refund;
            $detail['operation'] = $operations;

        }


        return $detail;
        // TODO Auto-generated method stub
    }

    /**
     * 获取订单基础信息
     *
     * @param unknown $order_id
     */
    public function getOrderInfo($order_id)
    {
        $order_model = new NsOrderModel();
        $order_info = $order_model->get($order_id);
        return $order_info;
    }

    /*
     * (non-PHPdoc)
     * @see \data\api\IOrder::getOrderList()
     */
    public function getOrderList($page_index = 1, $page_size = 0, $condition = '', $order = '')
    {
        $order_model = new NsOrderModel();
        // 查询主表
        $order_list = $order_model->pageQuery($page_index, $page_size, $condition, $order, '*');

        if (!empty($order_list['data'])) {
            foreach ($order_list['data'] as $k => $v) {

                $goodsModel = new NsOrderGoodsModel();
                $good_info = $goodsModel->getInfo(array(
                    "order_id" => $v["order_id"]
                ), "*");

                $addrModel = new NsOrderAddrModel();
                $addr_info = $addrModel->getInfo(array(
                    "order_id" => $v["order_id"]
                ), "*");


                $order_list['data'][$k]['receiver_province_name'] = $addr_info["provincename"];
                $order_list['data'][$k]['receiver_city_name'] = $addr_info["cityname"];
                $order_list['data'][$k]['receiver_district_name'] = $addr_info["districtname"];
                $order_list['data'][$k]['receiver_address'] = $addr_info["receiver_address"];
                $order_list['data'][$k]['receiver_mobile'] = $addr_info["receiver_mobile"];
                $order_list['data'][$k]['receiver_name'] = $addr_info["receiver_name"];

                $order_list['data'][$k]['goodposter'] = $good_info["goodposter"];
                $order_list['data'][$k]['goodtitle'] = $good_info["goodtitle"];
                $order_list['data'][$k]['buysum'] = $good_info["buysum"];
                $order_list['data'][$k]['goods_price'] = $good_info["goods_price"];

                if ($v["group_buy"] == 1) {
                    $order_list['data'][$k]['ordertype'] = "拼团订单";
                } else {
                    $order_list['data'][$k]['ordertype'] = "普通订单";
                }
                // 查询订单项表


                $order_list['data'][$k]['operation'] = '';


                // 订单来源名称
                $order_status = OrderStatus::getOrderCommonStatus();
                // 根据订单类型判断订单相关操作


                // 查询订单操作
                foreach ($order_status as $k_status => $v_status) {

                    if ($v_status['status_id'] == $v['order_status']) {
                        $order_list['data'][$k]['operation'] = $v_status['operation'];
                        $order_list['data'][$k]['member_operation'] = $v_status['member_operation'];
                        $order_list['data'][$k]['status_name'] = $v_status['status_name'];
                        $order_list['data'][$k]['is_refund'] = $v_status['is_refund'];
                    }


                }


                    if ($v["tryrefund"] == 1) {
                        $operation_refund = ["no" => "setrefund", "color" => red, "name" => "退货"];
                        $operations = $order_list['data'][$k]['operation'];
                        $operations[] = $operation_refund;
                        $order_list['data'][$k]['operation'] = $operations;


                    }

                    if ($v["fixaddr"] == 1) {

                        $operation_refund = ["no" => "fixaddr", "color" => blue, "name" => "修改地址"];
                        $operations = $order_list['data'][$k]['operation'];
                        $operations[] = $operation_refund;
                        $order_list['data'][$k]['operation'] = $operations;

                    }

            }
        }
        return $order_list;
    }


    public function getOrderRefundProcessList($page_index = 1, $page_size = 0, $condition = '', $order = '')
    {
        $order_model = new NsOrderRefundProcessModel();
        // 查询主表
        $order_list = $order_model->pageQuery($page_index, $page_size, $condition, $order, '*');


        $order_status = OrderStatus::getOrderRefundProcessStatus();


        if (!empty($order_list['data'])) {
            foreach ($order_list['data'] as $k => $v) {


                foreach ($order_status as $k_status => $v_status) {

                    if ($v_status['status_id'] == $v['status']) {
                        $order_list['data'][$k]['operation'] = $v_status['operation'];
                        $order_list['data'][$k]['member_operation'] = $v_status['member_operation'];
                        $order_list['data'][$k]['status_name'] = $v_status['status_name'];
                        $order_list['data'][$k]['is_refund'] = $v_status['is_refund'];
                    }


                }
            }
        }


        return $order_list;
    }

    /*
     * (non-PHPdoc)
     * @see \data\api\IOrder::orderCreate()
     */
    public function orderCreate($order_type, $out_trade_no, $pay_type, $shipping_type, $order_from, $buyer_ip, $buyer_message, $buyer_invoice, $shipping_time, $receiver_mobile, $receiver_province, $receiver_city, $receiver_district, $receiver_address, $receiver_zip, $receiver_name, $point, $coupon_id, $user_money, $goods_sku_list, $platform_money, $pick_up_id, $shipping_company_id, $coin = 0)
    {
        $order = new OrderBusiness();
        if ($pay_type == 4) {
            // 如果是货到付款 判断当前地址是否符合货到付款的地址
            $address = new Address();
            $result = $address->getDistributionAreaIsUser(0, $receiver_province, $receiver_city, $receiver_district);
            if (!$result) {
                return ORDER_CASH_DELIVERY;
            }
        }
        $retval = $order->orderCreate($order_type, $out_trade_no, $pay_type, $shipping_type, $order_from, $buyer_ip, $buyer_message, $buyer_invoice, $shipping_time, $receiver_mobile, $receiver_province, $receiver_city, $receiver_district, $receiver_address, $receiver_zip, $receiver_name, $point, $coupon_id, $user_money, $goods_sku_list, $platform_money, $pick_up_id, $shipping_company_id, $coin);
        runhook("Notify", "orderCreate", array(
            "order_id" => $retval
        ));
        //针对特殊订单执行支付处理
        if ($retval > 0) {
            //货到付款
            if ($pay_type == 4) {
                $this->orderOnLinePay($out_trade_no, 4);
            } else {
                $order_model = new NsOrderModel();
                $order_info = $order_model->getInfo(['order_id' => $retval], '*');
                if (!empty($order_info)) {
                    if ($order_info['user_platform_money'] != 0) {
                        if ($order_info['pay_money'] == 0) {
                            $this->orderOnLinePay($out_trade_no, 5);

                        }
                    } else {

                        if ($order_info['pay_money'] == 0) {
                            $this->orderOnLinePay($out_trade_no, 1);//默认微信支付
                        }
                    }
                }

            }

        }
        return $retval;
        // TODO Auto-generated method stub
    }

    /**
     * (non-PHPdoc)
     *
     * @see \data\api\IOrder::getOrderTradeNo()
     */
    public function getOrderTradeNo()
    {
        $order = new OrderBusiness();
        $no = $order->createOutTradeNo();
        return $no;
    }

    /*
     * (non-PHPdoc)
     * @see \data\api\IOrder::orderDelivery()
     */
    public function orderDelivery($order_id, $order_goods_id_array, $express_name, $shipping_type, $express_company_id, $express_no)
    {
        $order_express = new OrderExpress();
        $retval = $order_express->deliveywithkdnpush($order_id, $order_goods_id_array, $express_name, $shipping_type, $express_company_id, $express_no);

        return $retval;
    }

    public function orderFixAddr($order_id, $addr_id)
    {
        $user_express = new NsMemberExpressAddressModel();
        $addr = $user_express->getInfo(array(
            "id" => $addr_id
        ), "*");

        if ($addr != null) {
            $addrModel = new NsOrderAddrModel();
            $addr_info = $addrModel->getInfo(array(
                "order_id" => $order_id
            ), "*");

            if ($addr_info != null) {
                $data = array(
                    'receiver_mobile' => $addr["mobile"],
                    'receiver_province' => $addr["province"],
                    'receiver_city' => $addr["city"],
                    'receiver_district' => $addr["district"],
                    'receiver_address' => $addr["address"],
                    'receiver_name' => $addr["consigner"],
                    'provincename' => $addr["provincename"],
                    'cityname' => $addr["cityname"],
                    'districtname' => $addr["districtname"],
                    'receiver_zip' => "",
                );


                $retval = $addrModel->save($data, [
                    'order_id' => $order_id
                ]);


            }

            $extraModel = new NsOrderExtraModel();
            $extra_info = $extraModel->getInfo(array(
                "order_id" => $order_id
            ), "*");

            if ($extra_info != null) {
                $data = array(
                    'fixaddr' => 2,
                );

                $retval = $extraModel->save($data, [
                    'order_id' => $order_id
                ]);
            }

        }


        return $retval;
    }

    /*
     * (non-PHPdoc)
     * @see \data\api\IOrder::orderGoodsDelivery()
     */
    public function orderGoodsDelivery($order_id, $order_goods_id_array)
    {
        $order_goods = new OrderGoods();
        $retval = $order_goods->orderGoodsDelivery($order_id, $order_goods_id_array);
        return $retval;
        // TODO Auto-generated method stub
    }

    /*
     * (non-PHPdoc)
     * @see \data\api\IOrder::orderClose()
     */
    public function orderClose($order_id)
    {
        $order = new OrderBusiness();
        $retval = $order->orderClose($order_id);
        return $retval;
        // TODO Auto-generated method stub
    }

    /*
     * 订单完成的函数
     * (non-PHPdoc)
     * @see \data\api\IOrder::orderComplete()
     */
    public function orderComplete($orderid)
    {
        $order = new OrderBusiness();
        $retval = $order->orderComplete($orderid);
        // 处理店铺的账户资金
        $this->dealShopAccount_OrderComplete("", $orderid);
        // 处理平台的账户资金
        $this->updateAccountOrderComplete($orderid);
        runhook("Notify", "orderComplete", array(
            "order_id" => $orderid
        ));
        return $retval;
        // TODO Auto-generated method stub
    }

    /*
     * 订单在线支付
     * (non-PHPdoc)
     * @see \data\api\IOrder::orderOnLinePay()
     */
    public function orderOnLinePay($order_pay_no, $pay_type)
    {
        $order = new OrderBusiness();
        $retval = $order->OrderPay($order_pay_no, $pay_type, 0);
        if ($retval > 0) {
            // 处理店铺的账户资金
            $this->dealShopAccount_OrderPay($order_pay_no);
            // 处理平台的资金账户
            $this->dealPlatformAccountOrderPay($order_pay_no);

            $order_model = new NsOrderModel();
            $condition = " out_trade_no=" . $order_pay_no;
            $order_list = $order_model->getQuery($condition, "order_id", "");
            foreach ($order_list as $k => $v) {
                runhook("Notify", "orderPay", array(
                    "order_id" => $v["order_id"]
                ));
                // 判断是否需要在本阶段赠送积分
                $order = new OrderBusiness();
                $res = $order->giveGoodsOrderPoint($v["order_id"], 3);
            }
        }
        return $retval;
    }

    /*
     * 订单线下支付
     * (non-PHPdoc)
     * @see \data\api\IOrder::orderOffLinePay()
     */
    public function orderOffLinePay($order_id, $pay_type, $status)
    {
        $order = new OrderBusiness();

        $new_no = $this->getOrderNewOutTradeNo($order_id);
        if ($new_no) {
            $retval = $order->OrderPay($new_no, $pay_type, $status);
            if ($retval > 0) {
                $pay = new UnifyPay();
                $pay->offLinePay($new_no, $pay_type);
                // 处理店铺的账户资金
                $this->dealShopAccount_OrderPay('', $order_id);
                // 处理平台的资金账户
                $this->dealPlatformAccountOrderPay('', $order_id);
                // 判断是否需要在本阶段赠送积分
                $order = new OrderBusiness();
                $res = $order->giveGoodsOrderPoint($order_id, 3);
            }
            return $retval;
        } else {
            return 0;
        }
        // TODO Auto-generated method stub
    }

    /**
     * (non-PHPdoc)
     *
     * @see \data\api\IOrder::getOrderNewOutTradeNo()
     */
    public function getOrderNewOutTradeNo($order_id)
    {
        $order_model = new NsOrderModel();
        $out_trade_no = $order_model->getInfo([
            'order_id' => $order_id
        ], 'out_trade_no');
        $order = new OrderBusiness();
        $new_no = $order->createNewOutTradeNo($order_id);
        $pay = new UnifyPay();
        $pay->modifyNo($out_trade_no['out_trade_no'], $new_no);
        return $new_no;
    }

    /**
     * 订单调整金额(non-PHPdoc)
     *
     * @see \data\api\IOrder::orderMoneyAdjust()
     */
    public function orderMoneyAdjust($order_id, $order_goods_id_adjust_array, $shipping_fee)
    {
        // 调整订单
        $order_goods = new OrderGoods();
        $retval = $order_goods->orderGoodsAdjustMoney($order_goods_id_adjust_array);

        if ($retval >= 0) {
            // 计算整体商品调整金额
            $new_no = $this->getOrderNewOutTradeNo($order_id);
            $order = new OrderBusiness();
            $order_goods_money = $order->getOrderGoodsMoney($order_id);
            $retval_order = $order->orderAdjustMoney($order_id, $order_goods_money, $shipping_fee);
            $order_model = new NsOrderModel();
            $order_money = $order_model->getInfo([
                'order_id' => $order_id
            ], 'pay_money');
            $pay = new UnifyPay();
            $pay->modifyPayMoney($new_no, $order_money['pay_money']);
            return $retval_order;
        } else {
            return $retval;
        }
    }

    /**
     * 查询订单
     *
     * {@inheritdoc}
     *
     * @see \data\api\IOrder::orderQuery()
     */
    public function orderQuery($where = "", $field = "*")
    {
        $order = new OrderBusiness();
        return $order->where($where)
            ->field($field)
            ->select();
    }

    /**
     * 查询订单项退款信息(non-PHPdoc)
     *
     * @see \data\api\IOrder::getOrderGoodsRefundInfo()
     */
    public function getOrderGoodsRefundInfo($order_goods_id)
    {
        $order_goods = new OrderGoods();
        $order_goods_info = $order_goods->getOrderGoodsRefundDetail($order_goods_id);
        return $order_goods_info;
    }

    /**
     * 查询订单的订单项列表
     *
     * @param unknown $order_id
     */
    public function getOrderGoods($order_id)
    {
        $order = new OrderBusiness();
        return $order->getOrderGoods($order_id);
    }

    /**
     * 查询订单的订单项列表
     *
     * @param unknown $order_id
     */
    public function getOrderGoodsInfo($order_goods_id)
    {
        $order = new OrderBusiness();
        $picture = new AlbumPictureModel();
        $order_goods_info = $order->getOrderGoodsInfo($order_goods_id);
        $order_goods_info['goods_picture'] = $picture->get($order_goods_info['goods_picture'])['pic_cover'];
        return $order_goods_info;
    }

    /*
     * (non-PHPdoc)
     * @see \data\api\IOrder::addOrder()
     */
    public function addOrder($data)
    {
        // TODO Auto-generated method stub
    }

    /*
     * (non-PHPdoc)
     * @see \data\api\IOrder::orderGoodsRefundAskfor()
     */
    public function orderGoodsRefundAskfor($order_id, $order_goods_id, $refund_type, $refund_require_money, $refund_reason)
    {
        $order_goods = new OrderGoods();
        $retval = $order_goods->orderGoodsRefundAskfor($order_id, $order_goods_id, $refund_type, $refund_require_money, $refund_reason);
        return $retval;
        // TODO Auto-generated method stub
    }

    /*
     * (non-PHPdoc)
     * @see \data\api\IOrder::orderGoodsCancel()
     */
    public function orderGoodsCancel($order_id, $order_goods_id)
    {
        $order_goods = new OrderGoods();
        $retval = $order_goods->orderGoodsCancel($order_id, $order_goods_id);
        return $retval;
        // TODO Auto-generated method stub
    }

    /*
     * (non-PHPdoc)
     * @see \data\api\IOrder::orderGoodsReturnGoods()
     */
    public function orderGoodsReturnGoods($order_id, $order_goods_id, $refund_shipping_company, $refund_shipping_code)
    {
        $order_goods = new OrderGoods();
        $retval = $order_goods->orderGoodsReturnGoods($order_id, $order_goods_id, $refund_shipping_company, $refund_shipping_code);
        return $retval;
        // TODO Auto-generated method stub
    }

    /*
     * (non-PHPdoc)
     * @see \data\api\IOrder::orderGoodsRefundAgree()
     */
    public function orderGoodsRefundAgree($order_id, $order_goods_id)
    {
        $order_goods = new OrderGoods();
        $retval = $order_goods->orderGoodsRefundAgree($order_id, $order_goods_id);
        return $retval;
        // TODO Auto-generated method stub
    }

    /*
     * (non-PHPdoc)
     * @see \data\api\IOrder::orderGoodsRefuseForever()
     */
    public function orderGoodsRefuseForever($order_id, $order_goods_id)
    {
        $order_goods = new OrderGoods();
        $retval = $order_goods->orderGoodsRefuseForever($order_id, $order_goods_id);
        return $retval;
        // TODO Auto-generated method stub
    }

    /*
     * (non-PHPdoc)
     * @see \data\api\IOrder::orderGoodsRefuseOnce()
     */
    public function orderGoodsRefuseOnce($order_id, $order_goods_id)
    {
        $order_goods = new OrderGoods();
        $retval = $order_goods->orderGoodsRefuseOnce($order_id, $order_goods_id);
        return $retval;
        // TODO Auto-generated method stub
    }

    /*
     * (non-PHPdoc)
     * @see \data\api\IOrder::orderGoodsConfirmRecieve()
     */
    public function orderGoodsConfirmRecieve($order_id, $order_goods_id)
    {
        $order_goods = new OrderGoods();
        $retval = $order_goods->orderGoodsConfirmRecieve($order_id, $order_goods_id);
        return $retval;
        // TODO Auto-generated method stub
    }

    /*
     * (non-PHPdoc)
     * @see \data\api\IOrder::orderGoodsConfirmRefund()
     */
    public function orderGoodsConfirmRefund($order_id, $order_goods_id, $refund_real_money)
    {
        $order_goods = new OrderGoods();
        $retval = $order_goods->orderGoodsConfirmRefund($order_id, $order_goods_id, $refund_real_money);
        // 计算店铺的账户
        $this->updateShopAccount_OrderRefund($order_goods_id);
        $this->updateShopAccount_OrderComplete($order_id);
        // 计算平台的账户
        $this->updateAccountOrderRefund($order_goods_id);
        $this->updateAccountOrderComplete($order_id);
        return $retval;
    }

    /**
     * 获取对应sku列表价格
     *
     * @param unknown $goods_sku_list
     */
    public function getGoodsSkuListPrice($goods_sku_list)
    {
        $goods_preference = new GoodsPreference();
        $money = $goods_preference->getGoodsSkuListPrice($goods_sku_list);
        return $money;
    }

    /**
     * 获取邮费
     *
     * @param unknown $goods_sku_list
     * @param unknown $province
     * @param unknown $city
     * @return Ambigous <unknown, number>
     */
    public function getExpressFee($goods_sku_list, $express_company_id, $province, $city)
    {
        $goods_express = new GoodsExpress();
        $fee = $goods_express->getSkuListExpressFee($goods_sku_list, $express_company_id, $province, $city);
        return $fee;
    }

    /**
     * (non-PHPdoc)
     *
     * @see \data\api\IOrder::orderGoodsRefundMoney()
     */
    public function orderGoodsRefundMoney($order_goods_id)
    {
        $order_goods = new OrderGoods();
        $money = $order_goods->orderGoodsRefundMoney($order_goods_id);
        return $money;
    }

    /**
     * 获取用户可使用优惠券
     *
     * @param unknown $goods_sku_list
     */
    public function getMemberCouponList($goods_sku_list)
    {
        $goods_preference = new GoodsPreference();
        $coupon_list = $goods_preference->getMemberCouponList($goods_sku_list);
        return $coupon_list;
    }

    /**
     * 查询商品列表可用积分数
     *
     * @param unknown $goods_sku_list
     */
    public function getGoodsSkuListUsePoint($goods_sku_list)
    {
        $point = 0;
        $goods_sku_list_array = explode(",", $goods_sku_list);
        foreach ($goods_sku_list_array as $k => $v) {

            $sku_data = explode(':', $v);
            $sku_id = $sku_data[0];
            $goods = new Goods();
            $goods_id = $goods->getGoodsId($sku_id);
            $goods_model = new NsGoodsModel();
            $point_use = $goods_model->getInfo([
                'goods_id' => $goods_id
            ], 'point_exchange_type,point_exchange');
            if ($point_use['point_exchange_type'] == 1) {
                $point += $point_use['point_exchange'];
            }
        }
        return $point;
    }

    /**
     *
     * {@inheritdoc}
     *
     * @see \data\api\IOrder::OrderTakeDelivery()
     */
    public function OrderTakeDelivery($order_id)
    {
        $order = new OrderBusiness();
        $res = $order->OrderTakeDelivery($order_id);
        return $res;
    }

    /**
     * 删除购物车中的数据
     * 修改时间：2017年5月26日 14:35:38 王永杰
     * 首先要查询当前商品在购物车中的数量，如果商品数量等于1则删除，如果商品数量大于1个，则减少该商品的数量
     * (non-PHPdoc)
     *
     * @see \data\api\IOrder::deleteCart()
     */
    public function deleteCart($goods_sku_list, $uid)
    {
        $cart = new NsCartModel();
        $goods_sku_list_array = explode(",", $goods_sku_list);
        foreach ($goods_sku_list_array as $k => $v) {
            $sku_data = explode(':', $v);
            $sku_id = $sku_data[0];
            $info = $cart->getInfo([
                'buyer_id' => $uid,
                'sku_id' => $sku_id
            ], "num,cart_id");
            $num = $info['num'];
            $cart_id = $info['cart_id'];
            if ($num == 1) {
                // 购物车中该商品数量为1的话就删除
                $cart->destroy([
                    'buyer_id' => $uid,
                    'sku_id' => $sku_id
                ]);
            } else {
                // 修改商品数量
                $data["num"] = $num - 1;
                $cart->update($data, [
                    'cart_id' => $cart_id
                ]);
            }
        }
        $_SESSION["user_cart"] = '';
    }

    /**
     *
     * {@inheritdoc}
     *
     * @see \data\api\IOrder::getOrderCount()
     */
    public function getOrderCount($condition)
    {
        $order = new NsOrderModel();
        $count = $order->where($condition)->count();
        return $count;
    }

    /**
     *
     * {@inheritdoc}
     *
     * @see \data\api\IOrder::getPayMoneySum()
     */
    public function getPayMoneySum($condition, $date)
    {
        $order_model = new NsOrderModel();
        $money_sum = $order_model->where($condition)
            ->whereTime('create_time', $date)
            ->sum('pay_money');
        return $money_sum;
    }

    /**
     *
     * {@inheritdoc}
     *
     * @see \data\api\IOrder::getGoodsNumSum()
     */
    public function getGoodsNumSum($condition, $date)
    {
        $order_model = new NsOrderModel();
        $order_list = $order_model->where($condition)
            ->whereTime('create_time', $date)
            ->select();
        $goods_sum = 0;
        foreach ($order_list as $k => $v) {
            $order_goods = new NsOrderGoodsModel();
            $goods_sum += $order_goods->where([
                'order_id' => $v['order_id']
            ])->sum('num');
        }
        return $goods_sum;
    }

    /**
     * 获取具体配送状态信息
     *
     * @param unknown $shipping_status_id
     * @return Ambigous <NULL, multitype:string >
     */
    public static function getShippingInfo($shipping_status_id)
    {
        $shipping_status = OrderStatus::getShippingStatus();
        $info = null;
        foreach ($shipping_status as $shipping_info) {
            if ($shipping_status_id == $shipping_info['shipping_status']) {
                $info = $shipping_info;
                break;
            }
        }
        return $info;
    }

    /**
     * 获取具体支付状态信息
     *
     * @param unknown $pay_status_id
     * @return multitype:multitype:string |string
     */
    public static function getPayStatusInfo($pay_status_id)
    {
        $pay_status = OrderStatus::getPayStatus();
        $info = null;
        foreach ($pay_status as $pay_info) {
            if ($pay_status_id == $pay_info['pay_status']) {
                $info = $pay_info;
                break;
            }
        }
        return $info;
    }


    public static function getOrderStatusInfo($status_id)
    {
        $pay_status = OrderStatus::getOrderCommonStatus();
        $info = null;
        foreach ($pay_status as $pay_info) {
            if ($status_id == $pay_info['status_id']) {
                $info = $pay_info;
                break;
            }
        }
        return $info;
    }

    /**
     * 获取订单各状态数量
     */
    public static function getOrderStatusNum($condition = '')
    {
        $order = new NsOrderModel();
        $orderStatusNum['all'] = $order->where($condition)->count(); // 全部
        $condition['order_status'] = 0; // 待付款
        $orderStatusNum['wait_pay'] = $order->where($condition)->count();
        $condition['order_status'] = 1; // 待发货
        $orderStatusNum['wait_delivery'] = $order->where($condition)->count();
        $condition['order_status'] = 2; // 待收货
        $orderStatusNum['wait_recieved'] = $order->where($condition)->count();
        $condition['order_status'] = 3; // 已收货
        $orderStatusNum['recieved'] = $order->where($condition)->count();
        $condition['order_status'] = 4; // 交易成功
        $orderStatusNum['success'] = $order->where($condition)->count();
        $condition['order_status'] = 5; // 已关闭
        $orderStatusNum['closed'] = $order->where($condition)->count();
        $condition['order_status'] = -1; // 退款中
        $orderStatusNum['refunding'] = $order->where($condition)->count();
        $condition['order_status'] = -2; // 已退款
        $orderStatusNum['refunded'] = $order->where($condition)->count();
        $condition['order_status'] = array(
            'in',
            '3,4'
        ); // 已收货
        $condition['is_evaluate'] = 0; // 未评价
        $orderStatusNum['wait_evaluate'] = $order->where($condition)->count(); // 待评价

        return $orderStatusNum;
    }

    /**
     * 商品评价-添加
     *
     * @param unknown $dataList
     *            评价内容的 数组
     * @return Ambigous <multitype:, \think\false>
     */
    public function addGoodsEvaluate($dataArr, $order_id)
    {
        $goodsEvaluate = new NsGoodsEvaluateModel();
        $goods = new NsGoodsModel();
        $res = $goodsEvaluate->saveAll($dataArr);
        $result = false;

        if ($res != false) {
            // 修改订单评价状态
            $order = new NsOrderModel();
            $data = array(
                'is_evaluate' => 1
            );
            $result = $order->save($data, [
                'order_id' => $order_id
            ]);
        }
        foreach ($dataArr as $item) {
            $good_info = $goods->get($item['goods_id']);
            $evaluates = $good_info['evaluates'] + 1;
            $star = $good_info['star'] + $item['scores'];
            $match_point = $star / $evaluates;
            $match_ratio = $match_point / 5 * 100 + '%';
            $data = array(
                'evaluates' => $evaluates,
                'star' => $star,
                'match_point' => $match_point,
                'match_ratio' => $match_ratio
            );
            $goods->update($data, [
                'goods_id' => $item['goods_id']
            ]);
        }

        return $result;
    }

    /**
     * 商品评价-回复
     *
     * @param unknown $explain_first
     *            评价内容
     * @param unknown $ordergoodsid
     *            订单项ID
     * @return Ambigous <number, \think\false>
     */
    public function addGoodsEvaluateExplain($explain_first, $order_goods_id)
    {
        $goodsEvaluate = new NsGoodsEvaluateModel();
        $data = array(
            'explain_first' => $explain_first
        );
        return $goodsEvaluate->save($data, [
            'order_goods_id' => $order_goods_id
        ]);
    }

    /**
     * 商品评价-追评
     *
     * @param unknown $again_content
     *            追评内容
     * @param unknown $againImageList
     *            传入追评图片的 数组
     * @param unknown $ordergoodsid
     *            订单项ID
     * @return Ambigous <number, \think\false>
     */
    public function addGoodsEvaluateAgain($again_content, $againImageList, $order_goods_id)
    {
        $goodsEvaluate = new NsGoodsEvaluateModel();
        $data = array(
            'again_content' => $again_content,
            'again_addtime' => date("Y-m-d H:i:s", time()),
            'again_image' => $againImageList
        );
        return $goodsEvaluate->save($data, [
            'order_goods_id' => $order_goods_id
        ]);
    }

    /**
     * 商品评价-追评回复
     *
     * @param unknown $again_explain
     *            追评的 回复内容
     * @param unknown $ordergoodsid
     *            订单项ID
     * @return Ambigous <number, \think\false>
     */
    public function addGoodsEvaluateAgainExplain($again_explain, $order_goods_id)
    {
        $goodsEvaluate = new NsGoodsEvaluateModel();
        $data = array(
            'again_explain' => $again_explain
        );
        return $goodsEvaluate->save($data, [
            'order_goods_id' => $order_goods_id
        ]);
    }

    /**
     * 获取指定订单的评价信息
     *
     * @param unknown $orderid
     *            订单ID
     */
    public function getOrderEvaluateByOrder($order_id)
    {
        $goodsEvaluate = new NsGoodsEvaluateModel();
        $condition['order_id'] = $order_id;
        $field = 'order_id, order_no, order_goods_id, goods_id, goods_name, goods_price, goods_image, shop_id, shop_name, content, addtime, image, explain_first, member_name, uid, is_anonymous, scores, again_content, again_addtime, again_image, again_explain';
        return $goodsEvaluate->getQuery($condition, $field, 'order_goods_id ASC');
    }

    /**
     * 获取指定会员的评价信息
     *
     * @param unknown $uid
     *            会员ID
     */
    public function getOrderEvaluateByMember($uid)
    {
        $goodsEvaluate = new NsGoodsEvaluateModel();
        $condition['uid'] = $uid;
        $field = 'order_id, order_no, order_goods_id, goods_id, goods_name, goods_price, goods_image, shop_id, shop_name, content, addtime, image, explain_first, member_name, uid, is_anonymous, scores, again_content, again_addtime, again_image, again_explain';
        return $goodsEvaluate->getQuery($condition, $field, 'order_goods_id ASC');
    }

    /**
     * 评价信息 分页
     *
     * @param unknown $page_index
     * @param unknown $page_size
     * @param unknown $condition
     * @param unknown $order
     * @return number
     */
    public function getOrderEvaluateDataList($page_index, $page_size, $condition, $order)
    {
        $goodsEvaluate = new NsGoodsEvaluateModel();
        return $goodsEvaluate->pageQuery($page_index, $page_size, $condition, $order, "*");
    }

    /**
     * 获取评价列表
     *
     * @param unknown $page_index
     *            页码
     * @param unknown $page_size
     *            页大小
     * @param unknown $condition
     *            条件
     * @param unknown $order
     *            排序
     * @return multitype:number unknown
     */
    public function getOrderEvaluateList($page_index, $page_size, $condition, $order)
    {
        $goodsEvaluate = new NsGoodsEvaluateModel();
        $field = 'order_id, order_no, order_goods_id, goods_id, goods_name, goods_price, goods_image, shop_id, shop_name, content, addtime, image, explain_first, member_name, uid, is_anonymous, scores, again_content, again_addtime, again_image, again_explain';
        return $goodsEvaluate->pageQuery($page_index, $page_size, $condition, $order, $field);
    }

    /**
     * 修改订单数据
     *
     * @param unknown $order_id
     * @param unknown $data
     */
    public function modifyOrderInfo($data, $order_id)
    {
        $order = new NsOrderModel();
        return $order->save($data, [
            'order_id' => $order_id
        ]);
    }

    /**
     * 判断店铺类型
     *
     * @param unknown $shop_id
     */
    private function getShopTypeDetail($shop_id)
    {
        $shop_model = new NsShopModel();
        $shop_detail = $shop_model->get($shop_id);
        if (empty($shop_detail)) {
            return 0;
        } else {
            return $shop_detail["shop_type"];
        }
    }

    /**
     * (non-PHPdoc)
     *
     * @see \data\api\IOrder::getShopOrderAccountList()
     */
    public function getShopOrderAccountList($shop_id, $start_time, $end_time, $page_index, $page_size)
    {
        $order_account = new OrderAccount();
        $list = $order_account->getShopOrderSumList($shop_id, $start_time, $end_time, $page_index, $page_size);
        return $list;
    }

    /**
     * (non-PHPdoc)
     *
     * @see \data\api\IOrder::getShopOrderRefundList()
     */
    public function getShopOrderRefundList($shop_id, $start_time, $end_time, $page_index, $page_size)
    {
        $order_account = new OrderAccount();
        $list = $order_account->getShopOrderRefundList($shop_id, $start_time, $end_time, $page_index, $page_size);
        return $list;
    }

    /**
     * (non-PHPdoc)
     *
     * @see \data\api\IOrder::getShopOrderStatics()
     */
    public function getShopOrderStatics($shop_id, $start_time, $end_time)
    {
        $order_account = new OrderAccount();
        $order_sum = $order_account->getShopOrderSum($shop_id, $start_time, $end_time);
        $order_refund_sum = $order_account->getShopOrderSumRefund($shop_id, $start_time, $end_time);
        $order_sum_account = $order_sum - $order_refund_sum;
        $array = array(
            'order_sum' => $order_sum,
            'order_refund_sum' => $order_refund_sum,
            'order_account' => $order_sum_account
        );
        return $array;
    }

    /**
     * (non-PHPdoc)
     *
     * @see \data\api\IOrder::getShopOrderAccountDetail()
     */
    public function getShopOrderAccountDetail($shop_id)
    {
        // 获取总销售统计
        $account_all = $this->getShopOrderStatics($shop_id, '2015-1-1', '3050-1-1');
        // 获取今日销售统计
        $date_day_start = date("Y-m-d", time());
        $date_day_end = date("Y-m-d H:i:s", time());
        $account_day = $this->getShopOrderStatics($shop_id, $date_day_start, $date_day_end);
        // 获取周销售统计（7天）
        $date_week_start = date('Y-m-d', strtotime('-7 days'));
        $date_week_end = $date_day_end;
        $account_week = $this->getShopOrderStatics($shop_id, $date_week_start, $date_week_end);
        // 获取月销售统计(30天)
        $date_month_start = date('Y-m-d', strtotime('-30 days'));
        $date_month_end = $date_day_end;
        $account_month = $this->getShopOrderStatics($shop_id, $date_month_start, $date_month_end);
        $array = array(
            'day' => $account_day,
            'week' => $account_week,
            'month' => $account_month,
            'all' => $account_all
        );
        return $array;
    }

    /*
     * (non-PHPdoc)
     *
     * @see \data\api\IOrder::getShopAccountCountInfo()
     */
    public function getShopAccountCountInfo($shop_id)
    {
        // 本月第一天
        $date_month_start = date('Y-m-d', strtotime('-30 days'));
        $date_month_end = date("Y-m-d H:i:s", time());
        // 下单金额
        $order_account = new OrderAccount();
        $condition["create_time"] = [
            [
                ">=",
                $date_month_start
            ],
            [
                "<=",
                $date_month_end
            ]
        ];
        $condition['order_status'] = array(
            'NEQ',
            0
        );
        $condition['order_status'] = array(
            'NEQ',
            5
        );
        if ($shop_id != 0) {
            $condition['shop_id'] = array(
                'NEQ',
                0
            );
        }
        $order_money = $order_account->getShopSaleSum($condition);
        // var_dump($order_money);
        // 下单会员
        $order_user_num = $order_account->getShopSaleUserSum($condition);
        // 下单量
        $order_num = $order_account->getShopSaleNumSum($condition);
        // 下单商品数
        $order_goods_num = $order_account->getShopSaleGoodsNumSum($condition);
        // 平均客单价
        if ($order_user_num > 0) {
            $user_money_average = $order_money / $order_user_num;
        } else {
            $user_money_average = 0;
        }
        // 平均价格
        if ($order_goods_num > 0) {
            $goods_money_average = $order_money / $order_goods_num;
        } else {
            $goods_money_average = 0;
        }
        $array = array(
            "order_money" => sprintf('%.2f', $order_money),
            "order_user_num" => $order_user_num,
            "order_num" => $order_num,
            "order_goods_num" => $order_goods_num,
            "user_money_average" => sprintf('%.2f', $user_money_average),
            "goods_money_average" => sprintf('%.2f', $goods_money_average)
        );
        return $array;
    }

    /*
     * (non-PHPdoc)
     *
     * @see \data\api\IOrder::getShopGoodsSalesList()
     */
    public function getShopGoodsSalesList($page_index = 1, $page_size = 0, $condition = '', $order = '')
    {
        // $goods_calculate = new GoodsCalculate();
        // $goods_sales_list = $goods_calculate->getGoodsSalesInfoList($page_index, $page_size , $condition , $order );
        // return $goods_sales_list;
        $goods_model = new NsGoodsModel();
        $goods_list = $goods_model->pageQuery($page_index, $page_size, $condition, $order, '*');
        // 条件
        $start_date = date('Y-m-d', strtotime('-30 days'));
        $end_date = date("Y-m-d H:i:s", time());
        $condition['create_time'] = [
            'between',
            [
                $start_date,
                $end_date
            ]
        ];

        $order_condition["shop_id"] = $condition["shop_id"];
        $goods_calculate = new GoodsCalculate();
        // 得到条件内的订单项
        $order_goods_list = $goods_calculate->getOrderGoodsSelect($order_condition);
        // 遍历商品
        foreach ($goods_list["data"] as $k => $v) {
            $data = array();
            $goods_sales_num = $goods_calculate->getGoodsSalesNum($order_goods_list, $v["goods_id"]);
            $goods_sales_money = $goods_calculate->getGoodsSalesMoney($order_goods_list, $v["goods_id"]);
            $data["sales_num"] = $goods_sales_num;
            $data["sales_money"] = $goods_sales_money;
            $goods_list["data"][$k]["sales_info"] = $data;
        }
        return $goods_list;
    }

    /*
     * (non-PHPdoc)
     * @see \data\api\IOrder::getShopGoodsSalesAll()
     */
    public function getShopGoodsSalesQuery($shop_id, $start_date, $end_date, $condition)
    {
        // TODO Auto-generated method stub
        // 商品
        $goods_model = new NsGoodsModel();
        $goods_list = $goods_model->getQuery($condition, "*", '');
        // 订单项
        $condition['create_time'] = [
            'between',
            [
                $start_date,
                $end_date
            ]
        ];
        $order_condition["create_time"] = [
            [
                ">=",
                $start_date
            ],
            [
                "<=",
                $end_date
            ]
        ];
        $order_condition['order_status'] = array(
            'NEQ',
            0
        );
        $order_condition['order_status'] = array(
            'NEQ',
            5
        );
        if ($shop_id != '') {
            $order_condition["shop_id"] = $shop_id;
        }
        $goods_calculate = new GoodsCalculate();
        $order_goods_list = $goods_calculate->getOrderGoodsSelect($order_condition);
        // 遍历商品
        foreach ($goods_list as $k => $v) {
            $data = array();
            $goods_sales_num = $goods_calculate->getGoodsSalesNum($order_goods_list, $v["goods_id"]);
            $goods_sales_money = $goods_calculate->getGoodsSalesMoney($order_goods_list, $v["goods_id"]);
            $goods_list[$k]["sales_num"] = $goods_sales_num;
            $goods_list[$k]["sales_money"] = $goods_sales_money;
        }
        return $goods_list;
    }

    /**
     * 查询一段时间内的店铺下单金额
     *
     * @param unknown $shop_id
     * @param unknown $start_date
     * @param unknown $end_date
     * @return Ambigous <\data\service\Order\unknown, number, unknown>
     */
    public function getShopSaleSum($condition)
    {
        $order_account = new OrderAccount();
        $sales_num = $order_account->getShopSaleSum($condition);
        return $sales_num;
    }

    /**
     * 查询一段时间内的店铺下单量
     *
     * @param unknown $shop_id
     * @param unknown $start_date
     * @param unknown $end_date
     * @return unknown
     */
    public function getShopSaleNumSum($condition)
    {
        $order_account = new OrderAccount();
        $sales_num = $order_account->getShopSaleNumSum($condition);
        return $sales_num;
    }

    /**
     * ***********************************************店铺账户--Start******************************************************
     */
    /**
     * 订单支付的时候 调整店铺账户
     *
     * @param string $order_out_trade_no
     * @param number $order_id
     */
    private function dealShopAccount_OrderPay($order_out_trade_no = "", $order_id = 0)
    {
        if ($order_out_trade_no != "" && $order_id == 0) {
            $order_model = new NsOrderModel();
            $condition = " out_trade_no=" . $order_out_trade_no;
            $order_list = $order_model->getQuery($condition, "order_id", "");
            foreach ($order_list as $k => $v) {
                $this->updateShopAccount_OrderPay($v["order_id"]);
            }
        } else {
            if ($order_out_trade_no == "" && $order_id != 0) {
                $this->updateShopAccount_OrderPay($order_id);
            }
        }
    }

    /**
     * 订单完成的时候调整账户金额
     *
     * @param string $order_out_trade_no
     * @param number $order_id
     */
    private function dealShopAccount_OrderComplete($order_out_trade_no = "", $order_id = 0)
    {

        if ($order_out_trade_no != "" && $order_id == 0) {
            $order_model = new NsOrderModel();
            $condition = " out_trade_no=" . $order_out_trade_no;
            $order_list = $order_model->getQuery($condition, "order_id", "");
            foreach ($order_list as $k => $v) {
                $this->updateShopAccount_OrderComplete($v["order_id"]);
            }
        } else {
            if ($order_out_trade_no == "" && $order_id != 0) {
                $this->updateShopAccount_OrderComplete($order_id);
            }
        }

    }

    /**
     * 订单支付
     *
     * @param unknown $order_id
     */
    private function updateShopAccount_OrderPay($order_id)
    {
        $order_model = new NsOrderModel();
        $shop_account = new ShopAccount();
        $order = new OrderBusiness();
        $order_model->startTrans();
        try {
            $order_obj = $order_model->get($order_id);
            // 订单的实际付款金额
            $pay_money = $order->getOrderRealPayMoney($order_id);
            // 订单的支付方式
            $payment_type = $order_obj["payment_type"];
            // 店铺id
            $shop_id = $order_obj["shop_id"];
            // 订单号
            $order_no = $order_obj["order_no"];
            // 处理订单的营业总额
            $shop_account->addShopAccountProfitRecords(getSerialNo(), $shop_id, $pay_money, 1, $order_id, "店铺订单支付金额" . $pay_money . "元, 订单号为：" . $order_no . ", 支付方式【线下支付】。");
            if ($payment_type != ORDER_REFUND_STATUS) {
                // 在线支付 处理店铺的入账总额
                $shop_account->addShopAccountMoneyRecords(getSerialNo(), $shop_id, $pay_money, 1, $order_id, "店铺订单支付金额" . $pay_money . "元, 订单号为：" . $order_no . ", 支付方式【在线支付】, 已入店铺账户。");
            }
            // 处理平台的利润分成
            $this->addShopOrderAccountRecords($order_id, $order_no, $shop_id, $pay_money);
            $order_model->commit();
        } catch (\Exception $e) {
            Log::write("updateShopAccount_OrderPay" . $e->getMessage());
            $order_model->rollback();
        }
    }

    /**
     * 订单项退款
     *
     * @param unknown $order_goods_id
     */
    private function updateShopAccount_OrderRefund($order_goods_id)
    {
        $order_goods_model = new NsOrderGoodsModel();
        $order_model = new NsOrderModel();
        $shop_account = new ShopAccount();
        $order_goods_model->startTrans();
        try {
            // 查询订单项的信息
            $order_goods_obj = $order_goods_model->get($order_goods_id);
            // 退款金额
            $refund_money = $order_goods_obj["refund_real_money"];
            // 订单id
            $order_id = $order_goods_obj["order_id"];
            // 订单信息
            $order_obj = $order_model->get($order_id);
            // 订单的支付方式
            $payment_type = $order_obj["payment_type"];
            // 店铺id
            $shop_id = $order_obj["shop_id"];
            // 订单号
            $order_no = $order_obj["order_no"];
            // 处理店铺的总营业额
            $shop_account->addShopAccountProfitRecords(getSerialNo(), $shop_id, -$refund_money, 2, $order_goods_id, "订单项退款金额" . $refund_money . "元, 订单号：" . $order_no . ", 退款方式【线下】。");
            if ($payment_type != ORDER_REFUND_STATUS) {
                // 在线支付 处理店铺入账金额
                $shop_account->addShopAccountMoneyRecords(getSerialNo(), $shop_id, -$refund_money, 2, $order_goods_id, "订单项退款金额" . $refund_money . "元, 订单号：" . $order_no . ", 退款方式【线上】。");
            }
            // 订单退款 更新平台抽取利润
            $this->updateShopOrderGoodsReturnRecords($order_id, $order_goods_id, $shop_id);
            $order_goods_model->commit();
        } catch (\Exception $e) {
            $order_goods_model->rollback();
        }
    }

    /**
     * 订单完成
     *
     * @param unknown $order_id
     */
    private function updateShopAccount_OrderComplete($order_id)
    {
        $order_model = new NsOrderModel();
        $shop_account = new ShopAccount();
        $order = new OrderBusiness();
        $order_model->startTrans();
        try {
            #订单的信息
            $order_obj = $order_model->get($order_id);
            $order_sataus = $order_obj["order_status"];
            #判断当前订单的状态是否 已经交易完成 或者 已退款的状态
            if ($order_sataus == ORDER_COMPLETE_SUCCESS || $order_sataus == ORDER_COMPLETE_REFUND || $order_sataus == ORDER_COMPLETE_SHUTDOWN) {
                #订单的实际付款金额
                $pay_money = $order->getOrderRealPayMoney($order_id);
                #订单的支付方式
                $payment_type = $order_obj["payment_type"];
                #店铺id
                $shop_id = $order_obj["shop_id"];
                #订单号
                $order_no = $order_obj["order_no"];
                if ($payment_type != ORDER_REFUND_STATUS) {
                    #在线支付
                    $shop_account->addShopAccountProceedsRecords(getSerialNo(), $shop_id, $pay_money, 1, $order_id, "订单完成，店铺收入金额" . $pay_money . "元,订单号为：" . $order_no);
                }
                // 平台抽取店铺利润佣金发放
                $shop_account->updateShopOrderAccountRecord($order_id);
            }
            $order_model->commit();
        } catch (\Exception $e) {
            $order_model->rollback();
        }
    }

    /**
     * ***********************************************店铺账户--End******************************************************
     */

    /**
     * ***********************************************平台账户计算--Start******************************************************
     */
    /**
     * 订单支付时处理 平台的账户
     *
     * @param string $order_out_trade_no
     * @param number $order_id
     */
    public function dealPlatformAccountOrderPay($order_out_trade_no = "", $order_id = 0)
    {
        if ($order_out_trade_no != "" && $order_id == 0) {
            $order_model = new NsOrderModel();
            $condition = " out_trade_no=" . $order_out_trade_no;
            $order_list = $order_model->getQuery($condition, "order_id", "");
            foreach ($order_list as $k => $v) {
                $this->updateAccountOrderPay($v["order_id"]);
            }
        } else
            if ($order_out_trade_no == "" && $order_id != 0) {
                $this->updateAccountOrderPay($order_id);
            }
    }

    /**
     * 处理平台的利润抽成
     *
     * @param unknown $order_id
     * @param unknown $order_no
     * @param unknown $shop_id
     * @param unknown $pay_money
     */
    private function addShopOrderAccountRecords($order_id, $order_no, $shop_id, $pay_money)
    {
        $account_service = new ShopAccount();
        $account_service->addShopOrderAccountRecords($order_id, $order_no, $shop_id, $pay_money);

    }

    /**
     * 订单退款 更新平台抽取提成
     *
     * @param unknown $order_id
     * @param unknown $order_goods_id
     * @param unknown $shop_id
     */
    private function updateShopOrderGoodsReturnRecords($order_id, $order_goods_id, $shop_id)
    {
        $account_service = new ShopAccount();

        $account_service->updateShopOrderGoodsReturnRecords($order_id, $order_goods_id, $shop_id);

    }

    /**
     * 订单支付成功后处理 平台账户
     *
     * @param unknown $orderid
     */
    private function updateAccountOrderPay($order_id)
    {
        $order_model = new NsOrderModel();
        $shop_account = new ShopAccount();
        $order = new OrderBusiness();
        $order_model->startTrans();
        try {
            $order_obj = $order_model->get($order_id);
            // 订单的实际付款金额
            $pay_money = $order->getOrderRealPayMoney($order_id);
            // 订单的支付方式
            $payment_type = $order_obj["payment_type"];
            // 店铺id
            $shop_id = $order_obj["shop_id"];
            // 订单号
            $order_no = $order_obj["order_no"];
            if ($payment_type != ORDER_REFUND_STATUS) {
                // 在线支付 处理平台的资金账户
                $shop_account->addAccountOrderRecords($shop_id, $pay_money, 1, $order_id, "店铺订单支付金额" . $pay_money . "元, 订单号为：" . $order_no . ", 支付方式【在线支付】。");
            }
            $order_model->commit();
        } catch (\Exception $e) {
            Log::write("updateAccountOrderPay:" . $e->getMessage());
            $order_model->rollback();
        }
    }

    /**
     * 订单完成时 处理平台的利润抽成
     *
     * @param unknown $order_id
     */
    private function updateAccountOrderComplete($order_id)
    {
        $order_model = new NsOrderModel();
        $order_obj = $order_model->get($order_id);
        $order_sataus = $order_obj["order_status"];
        #判断当前订单的状态是否 已经交易完成 或者 已退款的状态
        if ($order_sataus == ORDER_COMPLETE_SUCCESS || $order_sataus == ORDER_COMPLETE_REFUND || $order_sataus == ORDER_COMPLETE_SHUTDOWN) {
            $order_account_model = new NsShopOrderReturnModel();
            $shop_account = new ShopAccount();
            $order_return_obj = $order_account_model->getInfo(["order_id" => $order_id]);
            if (!empty($order_return_obj)) {
                $shop_id = $order_return_obj["shop_id"];
                $return_money = $order_return_obj["platform_money"];
                $order_no = $order_return_obj["order_no"];
                $real_pay_money = $order_return_obj["order_pay_money"];
                $shop_account->addAccountReturnRecords($shop_id, $return_money, 1, $order_return_obj["id"], "订单号为：" . $order_no . "的订单交易完成，订单实际付款金额为：" . $real_pay_money . "元，平台抽取" . $return_money);
            }
        }

    }

    /**
     * 订单退款 更细平台的订单支付金额
     *
     * @param unknown $order_goods_id
     */
    private function updateAccountOrderRefund($order_goods_id)
    {
        $order_goods_model = new NsOrderGoodsModel();
        $order_model = new NsOrderModel();
        $shop_account = new ShopAccount();
        $order_goods_model->startTrans();
        try {
            // 查询订单项的信息
            $order_goods_obj = $order_goods_model->get($order_goods_id);
            // 退款金额
            $refund_money = $order_goods_obj["refund_real_money"];
            // 订单id
            $order_id = $order_goods_obj["order_id"];
            // 订单信息
            $order_obj = $order_model->get($order_id);
            // 订单的支付方式
            $payment_type = $order_obj["payment_type"];
            // 店铺id
            $shop_id = $order_obj["shop_id"];
            // 订单号
            $order_no = $order_obj["order_no"];
            if ($payment_type != ORDER_REFUND_STATUS) {
                // 在线支付 处理店铺入账金额
                $shop_account->addAccountOrderRecords($shop_id, -$refund_money, 2, $order_goods_id, "订单项退款金额" . $refund_money . "元, 订单号：" . $order_no . "。");
            }
            $order_goods_model->commit();
        } catch (\Exception $e) {
            $order_goods_model->rollback();
        }

    }

    /**
     * ***********************************************平台账户计算--End******************************************************
     */

    /**
     * ***********************************************订单的佣金计算--Start******************************************************
     */

    /**
     * 支付后续佣金操作
     *
     * @param unknown $order_out_trade_no
     * @param unknown $order_id
     */
    private function orderCommissionCalculate($order_out_trade_no = "", $order_id = 0)
    {

    }

    /**
     * 处理单个 订单佣金计算
     *
     * @param unknown $order_id
     */
    private function oneOrderCommissionCalculate($order_id)
    {

    }

    public function partent_test()
    {

    }

    /**
     * 订单退款成功后需要重新计算订单的佣金
     *
     * @param unknown $order_id
     * @param unknown $order_goods_id
     */
    public function updateCommissionMoney($order_id, $order_goods_id)
    {

    }

    /**
     * 订单完成交易进行 佣金结算
     *
     * @param unknown $order_id
     */
    private function updateOrderCommission($order_id)
    {

    }

    /**
     * ***********************************************订单的佣金计算--End******************************************************
     */

    /**
     * ***********************************************招商员的账户计算--Start******************************************************
     */
    /**
     * 招商员的订单佣金计算
     *
     * @param string $order_out_trade_no
     * @param number $order_id
     */
    private function AssistantOrderCommissionCalculate($order_out_trade_no = "", $order_id = 0)
    {
    }

    /**
     * 订单退款 更新佣金金额
     *
     * @param unknown $order_id
     */
    private function UpdateAssistantOrderCommissionRefund($order_id)
    {

    }

    /**
     * 订单交易完成发放订单的佣金
     *
     * @param unknown $order_id
     */
    private function UpdateAssistantOrderCommission($order_id)
    {
    }

    /**
     * ***********************************************招商员的账户计算--End******************************************************
     */
    /**
     * 查询店铺的退货设置
     * (non-PHPdoc)
     *
     * @see \data\api\IShop::getShopReturnSet()
     */
    public function getShopReturnSet($shop_id)
    {
        $shop_return = new NsOrderShopReturnModel();
        $shop_return_obj = $shop_return->get($shop_id);
        if (empty($shop_return_obj)) {
            $data = array(
                "shop_id" => $shop_id,
                "create_time" => date("Y-m-d H:i:s", time())
            );
            $shop_return->save($data);
            $shop_return_obj = $shop_return->get($shop_id);
        }
        return $shop_return_obj;
    }

    /**
     *
     * 更新店铺的退货信息
     * (non-PHPdoc)
     *
     * @see \data\api\IShop::updateShopReturnSet()
     */
    public function updateShopReturnSet($shop_id, $address, $real_name, $mobile, $zipcode)
    {
        $shop_return = new NsOrderShopReturnModel();
        $data = array(
            "shop_address" => $address,
            "seller_name" => $real_name,
            "seller_mobile" => $mobile,
            "seller_zipcode" => $zipcode,
            "modify_time" => date("Y-m-d H:i:s", time())
        );
        $result_id = $shop_return->save($data, [
            "shop_id" => $shop_id
        ]);
        return $result_id;
    }

    /**
     * 得到订单的发货信息
     *
     * @param unknown $order_ids
     */
    public function getOrderGoodsExpressDetail($order_ids, $shop_id)
    {
        $order_goods_model = new NsOrderGoodsModel();
        $order_model = new NsOrderModel();
        $order_goods_express = new NsOrderGoodsExpressModel();
        // 查询订单的订单项的商品信息
        $order_goods_list = $order_goods_model->where(" order_id in ($order_ids)")->select();

        for ($i = 0; $i < count($order_goods_list); $i++) {
            $order_id = $order_goods_list[$i]["order_id"];
            $order_goods_id = $order_goods_list[$i]["order_goods_id"];
            $order_obj = $order_model->get($order_id);
            $order_goods_list[$i]["order_no"] = $order_obj["order_no"];
            $goods_express_obj = $order_goods_express->where("FIND_IN_SET($order_goods_id,order_goods_id_array)")->select();
            if (!empty($goods_express_obj)) {
                $order_goods_list[$i]["express_company"] = $goods_express_obj[0]["express_company"];
                $order_goods_list[$i]["express_no"] = $goods_express_obj[0]["express_no"];
            } else {
                $order_goods_list[$i]["express_company"] = "";
                $order_goods_list[$i]["express_no"] = "";
            }
        }
        return $order_goods_list;
    }

    /**
     * 通过订单id 得到 该订单的发货物流
     *
     * @param unknown $order_id
     */
    public function getOrderGoodsExpressList($order_id)
    {
        $order_goods_express_model = new NsOrderGoodsExpressModel();
        $express_list = $order_goods_express_model->getQuery([
            "order_id" => $order_id
        ], "*", "");
        return $express_list;
    }

    /**
     * 订单提货(non-PHPdoc)
     *
     * @see \data\api\IOrder::pickupOrder()
     */
    public function pickupOrder($order_id, $buyer_name, $buyer_phone, $remark)
    {
        $order = new OrderBusiness();
        $retval = $order->pickupOrder($order_id, $buyer_name, $buyer_phone, $remark);
        return $retval;
    }

    /**
     * 查询订单项的物流信息
     *
     * @param unknown $order_goods_id
     */
    public function getOrderGoodsExpressMessage($express_id)
    {
        try {
            $order_express_model = new NsOrderGoodsExpressModel();
            $express_obj = $order_express_model->get($express_id);
            if (!empty($express_obj)) {
                $order_id = $express_obj["order_id"];
                $order_model = new NsOrderModel();
                // 订单编号
                $order_obj = $order_model->get($order_id);
                $order_no = $order_obj["order_no"];
                $shop_id = $order_obj["shop_id"];
                // 物流公司信息
                $express_company_id = $express_obj["express_company_id"];
                $express_company_model = new NsOrderExpressCompanyModel();
                $express_company_obj = $express_company_model->get($express_company_id);
                // 快递公司编号
                $express_no = $express_company_obj["express_no"];
                // 物流编号
                $send_no = $express_obj["express_no"];
                $kdniao = new Kdniao($shop_id);
                $data = array(
                    "OrderCode" => $order_no,
                    "ShipperCode" => $express_no,
                    "LogisticCode" => $send_no
                );
                $result = $kdniao->getOrderTracesByJson(json_encode($data));
                return json_decode($result, true);
            } else {
                return array(
                    "Success" => false,
                    "Reason" => "订单物流信息有误!"
                );
            }
        } catch (\Exception $e) {
            return array(
                "Success" => false,
                "Reason" => "订单物流信息有误!"
            );
        }
    }

    /**
     * 添加卖家对订单的备注
     *
     * @param unknown $order_goods_id
     */
    public function addOrderSellerMemo($order_id, $memo)
    {
        $order = new NsOrderModel();
        $data = array(
            'seller_memo' => $memo
        );
        $retval = $order->save($data, [
            'order_id' => $order_id
        ]);
        return $retval;
    }

    /**
     * 获取订单备注信息
     *
     * {@inheritdoc}
     *
     * @see \data\api\IOrder::getOrderRemark()
     */
    public function getOrderSellerMemo($order_id)
    {
        $order = new NsOrderModel();
        $res = $order->getQuery([
            'order_id' => $order_id
        ], "seller_memo", '');
        $seller_memo = "";
        if (!empty($res[0]['seller_memo'])) {
            $seller_memo = $res[0]['seller_memo'];
        }
        return $seller_memo;
    }
}