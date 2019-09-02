<?php
/**
 * Order.php
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

//require_once __DIR__ . '/../../../vendor/autoload.php';

use data\model\NsMemberExpressAddressModel;
use data\model\NsOrderModel;
use data\service\Address as AddressService;
use data\service\Express;
use data\service\Express as ExpressService;
use data\service\Order\OrderGoods;
use data\service\Order\OrderStatus;
use data\service\Order as OrderService;
use data\model\NsOrderAddrModel;


use data\service\User;
use think\cache\driver\Redis;

use think\Log;


/**
 * 订单控制器
 *
 * @author Administrator
 *        
 */
class Order extends BaseController
{

    public function __construct()
    {
        parent::__construct();
    }

    /**
     * 订单列表
     */
    public function orderList()
    {
        if (request()->isAjax()) {
            $page_index = request()->post('page_index', 1);
            $page_size = request()->post('page_size', PAGESIZE);
            $start_date = request()->post('start_date') == "" ? '' : request()->post('start_date');
            $end_date = request()->post('end_date') == "" ? '' : request()->post('end_date');
            $user_name = request()->post('user_name', '');
            $order_no = request()->post('order_no', '');
            $order_status = request()->post('order_status', '');
/*
            $result = Db::table('zxtc.zytc_order')
                ->where('order_status','in',[1,2,3,6])
                ->whereOr(['order_status'=>4,"finish_reason"=>0])
                ->select();
*/

            //Log::info("orderList call with parms".$order_status);

            if($start_date)
            {
                $condition["create_time"] = [
                    [
                        ">",
                        $start_date
                    ],
                    [
                        "<",
                        $end_date
                    ]
                ];
            }

            if ($order_status != '') {
                // $order_status 1 待发货

                    $condition['order_status'] = $order_status;
            }
            else
            {
                $condition['order_status'] =

                    array(
                        'in',
                        [1,2,3,4,6]
                    );




            }
            $condition['finish_reason'] =

                array(
                    'in',
                    [0,4]
                );

            $condition['shop_id'] = $this->instance_id;
            $order_service = new OrderService();
            $list = $order_service->getOrderList($page_index, $page_size, $condition, 'create_time desc');
            return $list;
        } else {
            $status = request()->get('status', '');
            $this->assign("status", $status);
            $all_status = OrderStatus::getOrderCommonStatus();
            $child_menu_list = array();
            $child_menu_list[] = array(
                'url' => "Order/orderList",
                'menu_name' => '全部',
                "active" => $status == '' ? 1 : 0
            );
            foreach ($all_status as $k => $v) {
                if( $v['is_meun'])
                {
                    $child_menu_list[] = array(
                        'url' => "order/orderlist?status=" . $v['status_id'],
                        'menu_name' => $v['status_name'],
                        "active" => $status == $v['status_id'] ? 1 : 0
                    );
                }

            }
            $this->assign('child_menu_list', $child_menu_list);
            // 获取物流公司
            $express = new ExpressService();
            $where = 1;
            $expressList = $express->expressCompanyQuery();
            $this->assign('expressList', $expressList);
            return view($this->style . "Order/orderList");
        }
    }

    public function refundprocessList()
    {
        if (request()->isAjax()) {
            $page_index = request()->post('page_index', 1);
            $page_size = request()->post('page_size', PAGESIZE);
            $start_date = request()->post('start_date') == "" ? '' : request()->post('start_date');
            $end_date = request()->post('end_date') == "" ? '' : request()->post('end_date');
            $user_name = request()->post('user_name', '');
            $order_no = request()->post('order_no', '');
            $order_status = request()->post('order_status', '');
            /*
                        $result = Db::table('zxtc.zytc_order')
                            ->where('order_status','in',[1,2,3,6])
                            ->whereOr(['order_status'=>4,"finish_reason"=>0])
                            ->select();
            */

            //Log::info("orderList call with parms".$order_status);

            if($start_date)
            {
                $condition["createtime"] = [
                    [
                        ">",
                        $start_date
                    ],
                    [
                        "<",
                        $end_date
                    ]
                ];
            }

            if ($order_status != '') {
                // $order_status 1 待发货

                $condition['status'] = $order_status;
            }
            else
            {
                $condition['status'] =

                    array(
                        'in',
                        [0,1,2,3,4,5,6]
                    );

            }


            $condition['shopid'] = $this->instance_id;
            $order_service = new OrderService();
            $list = $order_service->getOrderRefundProcessList($page_index, $page_size, $condition, 'createtime desc');
            return $list;
        } else {
            $status = request()->get('status', '');
            $this->assign("status", $status);
            $all_status = OrderStatus::getOrderRefundProcessStatus();
            $child_menu_list = array();
            $child_menu_list[] = array(
                'url' => "Order/refundprocessList",
                'menu_name' => '全部',
                "active" => $status == '' ? 1 : 0
            );
            foreach ($all_status as $k => $v) {
                if( $v['is_meun'])
                {
                    $child_menu_list[] = array(
                        'url' => "order/refundprocessList?status=" . $v['status_id'],
                        'menu_name' => $v['status_name'],
                        "active" => $status == $v['status_id'] ? 1 : 0
                    );
                }

            }
            $this->assign('child_menu_list', $child_menu_list);
            // 获取物流公司

            return view($this->style . "Order/orderRefundProcessList");
        }
    }

    /**
     * 功能说明：获取店铺信息
     */
    public function getShopInfo()
    {
        // 获取信息
        $shopInfo['shopId'] = $this->instance_id;
        $shopInfo['shopName'] = $this->instance_name;
        // 返回信息
        return $shopInfo;
    }

    /**
     * 功能说明：获取打印订单项预览信息
     */
    public function getOrderExpressPreview()
    {
        $shop_id = $this->instance_id;
        // 获取值
        $orderIdArray = $_GET['ids'];
        // 操作
        $order_service = new OrderService();
        $goods_express_list = $order_service->getOrderGoodsExpressDetail($orderIdArray, $shop_id);
        // 返回信息
        return $goods_express_list;
    }

    /**
     * 功能说明：打印预览 发货单
     */
    public function printDeliveryPreview()
    {
        // 获取值
        $order_service = new OrderService();
        $order_ids = $_GET["order_ids"] ? $_GET["order_ids"] : "";
        $ShopName = $_GET["ShopName"] ? $_GET["ShopName"] : "";
        $shop_id = $this->instance_id;
        $order_str = explode(",", $order_ids);
        $order_array = array();
        foreach ($order_str as $order_id) {
            $detail = array();
            $detail = $order_service->getOrderDetail($order_id);
            if (empty($detail)) {
                $this->error("没有获取到订单信息");
            }
            $order_array[] = $detail;
        }
        $receive_address = $order_service->getShopReturnSet($shop_id);
        $this->assign("order_print", $order_array);
        $this->assign("ShopName", $ShopName);
        $this->assign("receive_address", $receive_address);
        return view($this->style . 'Order/printDeliveryPreview');
    }

    /**
     * 打印快递单
     *
     * @return Ambigous <\think\response\View, \think\response\$this, \think\response\View>
     */
    public function printExpressPreview()
    {
        $order_service = new OrderService();
        $address_service = new AddressService();
        
        $order_ids = $_GET["order_ids"] ? $_GET["order_ids"] : "";
        $ShopName = $_GET["ShopName"] ? $_GET["ShopName"] : "";
        $co_id = $_GET["co_id"] ? $_GET["co_id"] : "";
        
        $shop_id = $this->instance_id;
        $order_str = explode(",", $order_ids);
        $order_array = array();
        foreach ($order_str as $order_id) {
            $detail = array();
            $detail = $order_service->getOrderDetail($order_id);
            if (empty($detail)) {
                $this->error("没有获取到订单信息");
            }
            $detail['address'] = $address_service->getAddress($detail['receiver_province'], $detail['receiver_city'], $detail['receiver_district']);
            $order_array[] = $detail;
        }
        $express_server = new ExpressService();
        // 物流模板信息
        $express_shipping = $express_server->getExpressShipping($co_id);
        // 物流打印信息
        $express_shipping_item = $express_server->getExpressShippingItems($express_shipping["sid"]);
        $receive_address = $order_service->getShopReturnSet($shop_id);
        $this->assign("order_print", $order_array);
        $this->assign("ShopName", $ShopName);
        $this->assign("express_ship", $express_shipping);
        $this->assign("express_item_list", $express_shipping_item);
        $this->assign("receive_address", $receive_address);
        return view($this->style . 'Order/printExpressPreview');
    }

    /**
     * 订单详情
     *
     * @return Ambigous <\think\response\View, \think\response\$this, \think\response\View>
     */
    public function orderDetail()
    {
        $order_id = isset($_GET['order_id']) ? $_GET['order_id'] : 0;
        if ($order_id == 0) {
            $this->error("没有获取到订单信息");
        }
        $order_service = new OrderService();
        $detail = $order_service->getOrderDetail($order_id);
        
        if (empty($detail)) {
            $this->error("没有获取到订单信息");
        }
        $this->assign("order", $detail);
        return view($this->style . "Order/orderDetail");
    }

    /**
     * 订单退款详情
     */
    public function orderRefundDetail()
    {
        $order_goods_id = isset($_GET['itemid']) ? $_GET['itemid'] : 0;
        if ($order_goods_id == 0) {
            $this->error("没有获取到退款信息");
        }
        $order_service = new OrderService();
        $info = $order_service->getOrderGoodsRefundInfo($order_goods_id);
        $this->assign('order_goods', $info);
        return view($this->style . "Order/orderRefundDetail");
    }

    /**
     * 线下支付
     */
    public function orderOffLinePay()
    {
        $order_service = new OrderService();
        $order_id = $_POST['order_id'];
        $order_info = $order_service->getOrderInfo($order_id);
        if ($order_info['payment_type'] == 6) {
            $res = $order_service->orderOffLinePay($order_id, 6, 0);
        } else {
            $res = $order_service->orderOffLinePay($order_id, 10, 0);
        }
        
        return AjaxReturn($res);
    }

    /**
     * 交易完成
     *
     * @param unknown $orderid            
     * @return Exception
     */
    public function orderComplete()
    {
        $order_service = new OrderService();
        $order_id = $_POST['order_id'];
        $res = $order_service->orderComplete($order_id);
        return AjaxReturn($res);
    }

    /**
     * 交易关闭
     */
    public function orderClose()
    {
        $order_service = new OrderService();
        $order_id = $_POST['order_id'];
        $res = $order_service->orderClose($order_id);
        return AjaxReturn($res);
    }

    /**
     * 订单发货 所需数据
     */
    public function orderDeliveryData()
    {
        $order_service = new OrderService();
        $express_service = new ExpressService();
        $address_service = new AddressService();
        $order_id = $_POST['order_id'];
        $order_info = $order_service->getOrderDetail($order_id);
        $addrModel = new NsOrderAddrModel();
        $addr_info = $addrModel->getInfo(array(
            "order_id" =>$order_id
        ), "*");
        $order_info['address'] = $address_service->getAddress($addr_info['receiver_province'], $addr_info['receiver_city'], $addr_info['receiver_district']);
        $shopId = $this->instance_id;
        // 快递公司列表
        $express_company_list = $express_service->expressCompanyQuery();
        // 订单商品项

        $data['order_info'] = $order_info;
        $data['express_company_list'] = $express_company_list;

        return $data;
    }


    public function orderUserAddr()
    {

        $order_id = $_POST['order_id']?$_POST['order_id']:0;
        $userid = $_POST['userid'];
        $addrModel = new NsMemberExpressAddressModel();

        if($order_id == 0 )
        {
            $this->error("没有获取到订单信息");
        }

        $orderModel = new NsOrderModel();

        $condition =   array(
            'order_id' => $order_id
        );
        $order = $orderModel->getInfo($condition, $field = 'ordertype,buyer_id,giver_id');

        if($order["ordertype"] == 0 )
        {
            $userid = $order["buyer_id"];
        }
        else
        {
            $userid = $order["giver_id"];
        }


        $addr_info = $addrModel->getQuery(array(
            "uid" =>$userid
        ), "*","");


         $data['user_addrs'] = $addr_info;;
        return $data;
    }

    /**
     * 订单发货
     */
    public function orderDelivery()
    {



        if (request()->isAjax()) {

            $id = isset($_POST['order_id']) ? $_POST['order_id'] : 0;

            $express_company_id = $_POST['express_company_id'];
            $express_no = $_POST['express_no'];


            $userModel =  new User();

            $user = $userModel->getUserToken();

            if(!$id)
            {
                return AjaxReturn(0);
            }

            //todo need notify to settimer
            $is_win = strtoupper(substr(PHP_OS, 0, 3)) === 'WIN' ? 1 : 0;

            //暂时根据环境区分
            if ($is_win) {

                $url = "http://127.0.0.1:8012/ziyoutechan/owner/goodsdelivey";
            } else {
                $url = "https://www.weiruikj.cn/ziyoutechan/owner/goodsdelivey";
            }
            $parm = array(
                "session" => $user["token"],
                "orderid" => $id,
                "companyid" => $express_company_id,
                "shipcode" => $express_no,
            );

            $response = http_do_get($url, $parm);

            $res = 0;
            Log::record("orderDelivery with url = " . $url . "responese = " . $response);
            if ($response) {
                $responsejson = json_decode($response,true);

                if($responsejson && array_key_exists("returncode",$responsejson)  && $responsejson["returncode"] == 0)
                {
                    $res = 1;
                }
                else
                {

                }


            }

            return AjaxReturn($res);
        }



/*
        $conn_args = array(
            'host' => '39.106.73.97',
            'port' => '5672',
            'login' => 'jiangbwang',
            'password' => 'wjb998877',
            'vhost'=>'/'
        );
        $e_name = 'KSHOP'; //交换机名
//$q_name = 'q_linvo'; //无需队列名
        $k_queue = 'hello'; //路由key

//创建连接和channel

        $connection = new AMQPStreamConnection($conn_args['host'], $conn_args['port'], $conn_args['login'], $conn_args['password'], $conn_args['vhost']); // 创建连接
        $channel = $connection->channel();
        $channel->queue_declare($k_queue, false, true, false, false);
        $channel->exchange_declare($e_name, 'direct', false, true, false);
        $channel->queue_bind($k_queue, $e_name); // 队列和交换器绑定
        $messageBody = 'testinfo12'; // 要推送的消息
        $message = new AMQPMessage($messageBody, array('content_type' => 'text/plain', 'delivery_mode' => AMQPMessage::DELIVERY_MODE_PERSISTENT));
        $channel->basic_publish($message, '',$k_queue); // 推送消息
        $channel->close();
        $connection->close();
*/


    }


    /**
     * 订单发货
     */
    public function orderFixAddr()
    {


        $order_service = new OrderService();
        $order_id = $_POST['order_id'];

        $addr_id = $_POST['addr_id'];


        $res = $order_service->orderFixAddr($order_id, $addr_id);



        /*
                $conn_args = array(
                    'host' => '39.106.73.97',
                    'port' => '5672',
                    'login' => 'jiangbwang',
                    'password' => 'wjb998877',
                    'vhost'=>'/'
                );
                $e_name = 'KSHOP'; //交换机名
        //$q_name = 'q_linvo'; //无需队列名
                $k_queue = 'hello'; //路由key

        //创建连接和channel

                $connection = new AMQPStreamConnection($conn_args['host'], $conn_args['port'], $conn_args['login'], $conn_args['password'], $conn_args['vhost']); // 创建连接
                $channel = $connection->channel();
                $channel->queue_declare($k_queue, false, true, false, false);
                $channel->exchange_declare($e_name, 'direct', false, true, false);
                $channel->queue_bind($k_queue, $e_name); // 队列和交换器绑定
                $messageBody = 'testinfo12'; // 要推送的消息
                $message = new AMQPMessage($messageBody, array('content_type' => 'text/plain', 'delivery_mode' => AMQPMessage::DELIVERY_MODE_PERSISTENT));
                $channel->basic_publish($message, '',$k_queue); // 推送消息
                $channel->close();
                $connection->close();
        */

        return AjaxReturn($res);
    }

    public function orderSetrefund()
    {

        $order_id = $_POST['order_id'];

        $redis = new Redis();
        $redis->lpush("flag.order_setrefund",$order_id);

        return AjaxReturn(1);
    }

    /**
     * 获取订单大订单项
     */
    public function getOrderGoods()
    {
        $order_id = $_POST['order_id'];
        $order_service = new OrderService();
        $order_goods_list = $order_service->getOrderGoods($order_id);
        $order_info = $order_service->getOrderInfo($order_id);
        $list[0] = $order_goods_list;
        $list[1] = $order_info;
        return $list;
    }

    /**
     * 订单价格调整
     */
    public function orderAdjustMoney($order_id, $order_goods_id_adjust_array, $shipping_fee)
    {
        $order_id = $_POST['order_id'];
        $order_goods_id_adjust_array = $_POST['order_goods_id_adjust_array'];
        $shipping_fee = $_POST['shipping_fee'];
        $order_service = new OrderService();
        $res = $order_service->orderMoneyAdjust($order_id, $order_goods_id_adjust_array, $shipping_fee);
        return AjaxReturn($res);
    }

    public function test()
    {
        $order_service = new OrderService();
        $list = $order_service->test();
        var_dump($list);
    }

    public function orderGoodsOpertion()
    {
        $order_goods = new OrderGoods();
        $order_id = 14;
        $order_goods_id = 35;
        
        // 申请退款
        $refund_type = 2;
        $refund_require_money = 202;
        $refund_reason = '不想买了';
        $retval = $order_goods->orderGoodsRefundAskfor($order_id, $order_goods_id, $refund_type, $refund_require_money, $refund_reason);
        
        // 卖家同意退款
        // $retval = $order_goods->orderGoodsRefundAgree($order_id, $order_goods_id);
        
        // 卖家确认退款
        // $refund_real_money = 10;
        // $retval = $order_goods->orderGoodsConfirmRefund($order_id, $order_goods_id, $refund_real_money);
        
        // 买家退货
        // $refund_shipping_company = 8;
        // $refund_shipping_code = '545654465';
        // $retval = $order_goods->orderGoodsReturnGoods($order_id ,$order_goods_id, $refund_shipping_company, $refund_shipping_code);
        
        // 卖家确认收货
        // $retval = $order_goods->orderGoodsConfirmRecieve($order_id, $order_goods_id);
        
        // 买家取消订单
        // $retval = $order_goods->orderGoodsCancel($order_id ,$order_goods_id);
        
        // 卖家拒绝退款
        // $retval = $order_goods->orderGoodsRefuseForever($order_id, $order_goods_id);
        
        // 卖家拒绝本次退款
        // $retval = $order_goods->orderGoodsRefuseOnce($order_id, $order_goods_id);
        // $orderGoodsList = NsOrderGoodsModel::where("order_id=$order_id AND refund_status<>0 AND refund_status<>5")->select();
        // $map = array("order_id"=>$order_id, "refund_status"=>array("neq", 0), "refund_status"=>array("neq", 5));
        // $orderGoodsList = NsOrderGoodsModel::all($map);
        // $refund_count = count($orderGoodsList);
        // $orderGoodsListTotal = NsOrderGoodsModel::where("order_id=$order_id AND refund_status=5")->count();
        // $total_count = count($orderGoodsListTotal);
        // $retval = $orderGoodsListTotal;
        var_dump($retval);
    }

    /**
     * 买家申请退款
     *
     * @return Ambigous <number, \data\service\niushop\Order\Exception, \data\service\niushop\Order\Ambigous>
     */
    public function orderGoodsRefundAskfor()
    {
        $order_id = isset($_POST['order_id']) ? $_POST['order_id'] : $this->error("缺少必需参数order_id");
        $order_goods_id = isset($_POST['order_goods_id']) ? $_POST['order_goods_id'] : $this->error("缺少必需参数order_goods_id");
        $refund_type = isset($_POST['refund_type']) ? $_POST['refund_type'] : $this->error("缺少必填参数refund_type");
        $refund_require_money = isset($_POST['refund_require_money']) ? $_POST['refund_require_money'] : 0;
        $refund_reason = isset($_POST['refund_reason']) ? $_POST['refund_reason'] : '';
        $order_service = new OrderService();
        $retval = $order_service->orderGoodsRefundAskfor($order_id, $order_goods_id, $refund_type, $refund_require_money, $refund_reason);
        return AjaxReturn($retval);
    }

    /**
     * 买家取消退款
     *
     * @return number
     */
    public function orderGoodsCancel()
    {
        $order_id = isset($_POST['order_id']) ? $_POST['order_id'] : $this->error("缺少必需参数order_id");
        $order_goods_id = isset($_POST['order_goods_id']) ? $_POST['order_goods_id'] : $this->error("缺少必需参数order_goods_id");
        $order_service = new OrderService();
        $retval = $order_service->orderGoodsCancel($order_id, $order_goods_id);
        return AjaxReturn($retval);
    }

    /**
     * 买家退货
     *
     * @return Ambigous <number, \think\false, boolean, string>
     */
    public function orderGoodsReturnGoods()
    {
        $order_id = isset($_POST['order_id']) ? $_POST['order_id'] : $this->error("缺少必需参数order_id");
        $order_goods_id = isset($_POST['order_goods_id']) ? $_POST['order_goods_id'] : $this->error("缺少必需参数order_goods_id");
        $refund_shipping_company = $_POST['refund_shipping_company'];
        $refund_shipping_code = $_POST['$refund_shipping_code'];
        $order_service = new OrderService();
        $retval = $order_service->orderGoodsReturnGoods($order_id, $order_goods_id, $refund_shipping_company, $refund_shipping_code);
        return AjaxReturn($retval);
    }

    /**
     * 买家同意买家退款申请
     *
     * @return number
     */
    public function orderGoodsRefundAgree()
    {
        if (request()->isAjax()) {

            $id = isset($_POST['order_id']) ? $_POST['order_id'] : '';


            $userModel =  new User();

            $user = $userModel->getUserToken();

            if(!$id)
            {
                return AjaxReturn(0);
            }

            //todo need notify to settimer
            $is_win = strtoupper(substr(PHP_OS, 0, 3)) === 'WIN' ? 1 : 0;

            //暂时根据环境区分
            if ($is_win) {

                $url = "http://127.0.0.1:8012/ziyoutechan/owner/acceptrefundapply";
            } else {
                $url = "https://www.weiruikj.cn/ziyoutechan/owner/acceptrefundapply";
            }
            $parm = array(
                "session" => $user["wx_openid"],
                "orderid" => $id,
            );

            $response = http_do_get($url, $parm);

            $res = 0;
            Log::record("RefundAgree with url = " . $url . "responese = " . $response);
            if ($response) {
                $responsejson = json_decode($response,true);

                if($responsejson && array_key_exists("returncode",$responsejson)  && $responsejson["returncode"] == 0)
                {
                    $res = 1;
                }
                else
                {

                }


            }


            return AjaxReturn($res);
        }
    }

    /**
     * 买家永久拒绝本次退款
     *
     * @return Ambigous <number, Exception>
     */
    public function orderGoodsRefuseForever()
    {
        if (request()->isAjax()) {

            $id = isset($_POST['order_id']) ? $_POST['order_id'] : '';


            $userModel =  new User();

            $user = $userModel->getUserToken();





            if(!$id)
            {
                return AjaxReturn(0);
            }

            //todo need notify to settimer
            $is_win = strtoupper(substr(PHP_OS, 0, 3)) === 'WIN' ? 1 : 0;

            //暂时根据环境区分
            if ($is_win) {

                $url = "http://127.0.0.1:8012/ziyoutechan/owner/refuserefundapply";
            } else {
                $url = "https://www.weiruikj.cn/ziyoutechan/owner/refuserefundapply";
            }
            $parm = array(
                "session" => $user["wx_openid"],
                "orderid" => $id,
            );

            $response = http_do_get($url, $parm);

            $res = 0;
            Log::record("RefundAgree with url = " . $url . "responese = " . $response);
            if ($response) {
                $responsejson = json_decode($response,true);

                if($responsejson && array_key_exists("returncode",$responsejson)  && $responsejson["returncode"] == 0)
                {
                    $res = 1;
                }
                else
                {

                }


            }


            return AjaxReturn($res);
        }
    }

    /**
     * 卖家拒绝本次退款
     *
     * @return Ambigous <number, Exception>
     */
    public function orderGoodsRefuseOnce()
    {
        $order_id = isset($_POST['order_id']) ? $_POST['order_id'] : $this->error("缺少必需参数order_id");
        $order_goods_id = isset($_POST['order_goods_id']) ? $_POST['order_goods_id'] : $this->error("缺少必需参数order_goods_id");
        $order_service = new OrderService();
        $retval = $order_service->orderGoodsRefuseOnce($order_id, $order_goods_id);
        return AjaxReturn($retval);
    }

    /**
     * 卖家确认收货
     *
     * @return Ambigous <number, Exception>
     */
    public function orderGoodsConfirmRecieve()
    {
        if (request()->isAjax()) {

            $id = isset($_POST['order_id']) ? $_POST['order_id'] : '';


            $userModel =  new User();

            $user = $userModel->getUserToken();





            if(!$id)
            {
                return AjaxReturn(0);
            }

            //todo need notify to settimer
            $is_win = strtoupper(substr(PHP_OS, 0, 3)) === 'WIN' ? 1 : 0;

            //暂时根据环境区分
            if ($is_win) {

                $url = "http://127.0.0.1:8012/ziyoutechan/owner/receiverefundgoods";
            } else {
                $url = "https://www.weiruikj.cn/ziyoutechan/owner/receiverefundgoods";
            }
            $parm = array(
                "session" => $user["wx_openid"],
                "orderid" => $id,
            );

            $response = http_do_get($url, $parm);

            $res = 0;
            Log::record("orderGoodsConfirmRecieve with url = " . $url . "responese = " . $response);
            if ($response) {
                $responsejson = json_decode($response,true);

                if($responsejson && array_key_exists("returncode",$responsejson)  && $responsejson["returncode"] == 0)
                {
                    $res = 1;
                }
                else
                {

                }


            }


            return AjaxReturn($res);
        }
    }

    /**
     * 卖家确认退款
     *
     * @return Ambigous <Exception, unknown>
     */
    public function orderGoodsConfirmRefund()
    {
        $order_id = isset($_POST['order_id']) ? $_POST['order_id'] : $this->error("缺少必需参数order_id");
        $order_goods_id = isset($_POST['order_goods_id']) ? $_POST['order_goods_id'] : $this->error("缺少必需参数order_goods_id");
        $refund_real_money = isset($_POST['refund_real_money']) ? $_POST['refund_real_money'] : $this->error("缺少必需参数refund_real_money");
        $order_service = new OrderService();
        $retval = $order_service->orderGoodsConfirmRefund($order_id, $order_goods_id, $refund_real_money);
        return AjaxReturn($retval);
    }

    /**
     * 确认退款时，查询买家实际付款金额
     */
    public function orderGoodsRefundMoney()
    {
        $order_service = new OrderService();
        $order_goods_id = isset($_POST['order_goods_id']) ? $_POST['order_goods_id'] : "";
        $res = 0;
        if ($order_goods_id != '') {
            $res = $order_service->orderGoodsRefundMoney($order_goods_id);
        }
        return $res;
    }

    /**
     * 获取订单销售统计
     */
    public function getOrderAccount()
    {
        $order_service = new OrderService();
        // 获取日销售统计
        $account = $order_service->getShopOrderAccountDetail($this->instance_id);
        var_dump($account);
    }

    /**
     * 退货设置
     * 任鹏强
     */
    public function returnSetting()
    {
        $order_service = new OrderService();
        $shop_id = $this->instance_id;
        if (request()->isAjax()) {
            $address = request()->post('address', '');
            $real_name = request()->post('real_name', '');
            $mobile = request()->post('mobile', '');
            $zipcode = request()->post('zipcode', '');
            $retval = $order_service->updateShopReturnSet($shop_id, $address, $real_name, $mobile, $zipcode);
            return AjaxReturn($retval);
        } else {
            $info = $order_service->getShopReturnSet($shop_id);
            $this->assign('info', $info);
            return view($this->style . "Order/returnSetting");
        }
    }

    /**
     * 提货
     *
     * @return Ambigous <multitype:unknown, multitype:unknown unknown string >
     */
    public function pickupOrder()
    {
        $order_id = isset($_POST['order_id']) ? $_POST['order_id'] : $this->error("缺少必需参数order_id");
        $buyer_name = isset($_POST['buyer_name']) ? $_POST['buyer_name'] : "";
        $buyer_phone = isset($_POST['buyer_phone']) ? $_POST['buyer_phone'] : "";
        $remark = isset($_POST['remark']) ? $_POST['remark'] : "";
        $order_service = new OrderService();
        $retval = $order_service->pickupOrder($order_id, $buyer_name, $buyer_phone, $remark);
        return AjaxReturn($retval);
    }

    /**
     * 获取物流跟踪信息
     */
    public function getExpressInfo()
    {
        $order_service = new OrderService();
        $order_goods_id = request()->post('order_goods_id');
        $expressinfo = $order_service->getOrderGoodsExpressMessage($order_goods_id);
        return $expressinfo;
    }

    /**
     * 添加备注
     */
    public function addMemo()
    {
        $order_service = new OrderService();
        $order_id = request()->post('order_id');
        $memo = request()->post('memo');
        $result = $order_service->addOrderSellerMemo($order_id, $memo);
        return $order_id;
    }

    /**
     * 获取订单备注信息
     * 
     * @return unknown
     */
    public function getOrderSellerMemo()
    {
        $order_service = new OrderService();
        $order_id = request()->post('order_id');
        $res = $order_service->getOrderSellerMemo($order_id);
        return $res;
    }
}