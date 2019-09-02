<?php
/**
 * OrderExpress.php
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
namespace data\service\Order;

use data\model\NsOrderGoodsExpressModel;
use data\model\NsOrderModel;
use data\model\UserModel;
use data\model\NsOrderExpressCompanyModel;
use data\service\BaseService;

use think\cache\driver\Redis;

/**
 * 订单项物流操作类
 */
class OrderExpress extends BaseService
{

    function __construct()
    {
        parent::__construct();
    }

    /**
     * 物流公司发货
     *
     * @param unknown $order_id            
     * @param unknown $order_goods_id_array
     *            订单项数组
     * @param unknown $express_name
     *            包裹名称
     * @param unknown $shipping_type
     *            发货方式1 需要物流 0无需物流
     * @param unknown $express_company_id
     *            物流公司ID
     * @param unknown $express_no
     *            物流单号
     */
    public function delivey($order_id, $order_goods_id_array, $express_name, $shipping_type, $express_company_id, $express_no)
    {
        $user = new UserModel();
        $user_name = $user->getInfo([
            'uid' => $this->uid
        ], 'user_name');
        $order_express = new NsOrderGoodsExpressModel();
        $order_express->startTrans();
        try {
            $count = $order_express->getCount([
                'order_goods_id_array' => $order_goods_id_array
            ]);
            if ($count == 0) {
                
                $express_company = new NsOrderExpressCompanyModel();
                $express_company_info = $express_company->getInfo([
                    'co_id' => $express_company_id
                ], 'company_name');
                $data_goods_delivery = array(
                    'order_id' => $order_id,
                    'order_goods_id_array' => $order_goods_id_array,
                    'express_name' => $express_name,
                    'shipping_type' => $shipping_type,
                    'express_company' => $express_company_info['company_name'],
                    'express_company_id' => $express_company_id,
                    'express_no' => $express_no,
                    'shipping_time' => date('Y-m-d H:i:s', time()),
                    'uid' => $this->uid,
                    'user_name' => $user_name['user_name']
                );
                $order_express->save($data_goods_delivery);
                // 循环添加到订单商品项
                $order_goods = new OrderGoods();
                $order_goods->orderGoodsDelivery($order_id, $order_goods_id_array);
                runhook("Notify", "orderDelivery", array(
                    "order_goods_ids" => $order_goods_id_array
                ));
                $order_express->commit();
            }
            return 1;
        } catch (\Exception $e) {
            $order_express->rollback();
            return $e->getMessage();
        }
    }


    public function deliveywith56push($order_id, $order_goods_id_array, $express_name, $shipping_type, $express_company_id, $express_no)
    {
        $user = new UserModel();
        $user_name = $user->getInfo([
            'uid' => $this->uid
        ], 'user_name');
        $order_express = new NsOrderGoodsExpressModel();
        $order_express->startTrans();
        try {
            $count = $order_express->getCount([
                'order_id' => $order_id
            ]);
            if ($count == 0) {

                $express_company = new NsOrderExpressCompanyModel();
                $express_company_info = $express_company->getInfo([
                    'co_id' => $express_company_id
                ], ['company_name','company_code']);
                $data_goods_delivery = array(
                    'order_id' => $order_id,
                    'order_goods_id_array' => null,
                    'express_name' => $express_name,
                    'shipping_type' => $shipping_type,
                    'express_company' => $express_company_info['company_name'],
                    'express_company_id' => $express_company_id,
                    'express_no' => $express_no,
                    'shipping_time' => date('Y-m-d H:i:s', time()),
                    'uid' => $this->uid,
                    'user_name' => $user_name['user_name'],
                    'company_code' => $express_company_info['company_code']
                );
                $ret = $order_express->save($data_goods_delivery);
                // 循环添加到订单商品项



                $order_express->commit();

                if($ret!=null)
                {
                    require __DIR__ . '/../../../thirdpart/56PushSDK/AddPushSDK.php';

                    $key = 'f172e9c349b7bb774f59d582d6bb9bb6'; //请填写订阅查询授权码

                    $kuaidipush = new \AddPushSDK();

                    $kuaidipush->setKey($key);

//订阅订单
                    $result = $kuaidipush->addPushApi($express_no,  $express_company_info['company_code'], 'http://39.106.73.97/index.php/admin/expressnotify/on56notifymessage');//订阅顺丰单号123456789

                    trace($result);
                }
            }
            return 1;
        } catch (\Exception $e) {
            $order_express->rollback();
            return $e->getMessage();
        }
    }


    public function deliveywithkdnpush($order_id, $order_goods_id_array, $express_name, $shipping_type, $express_company_id, $express_no)
    {
        $user = new UserModel();
        $user_name = $user->getInfo([
            'uid' => $this->uid
        ], 'user_name');
        $order_express = new NsOrderGoodsExpressModel();
        $order_express->startTrans();
        try {
            $count = $order_express->getCount([
                'order_id' => $order_id
            ]);
            if ($count == 0) {

                $express_company = new NsOrderExpressCompanyModel();
                $express_company_info = $express_company->getInfo([
                    'co_id' => $express_company_id
                ], ['company_name','kdncode']);
                $data_goods_delivery = array(
                    'order_id' => $order_id,

                    'express_name' => $express_name,
                    'shipping_type' => $shipping_type,
                    'express_company' => $express_company_info['company_name'],
                    'express_company_id' => $express_company_id,
                    'express_no' => $express_no,
                    'shipping_time' => date('Y-m-d H:i:s', time()),
                    'uid' => $this->uid,
                    'user_name' => $user_name['user_name'],
                    'company_code' => $express_company_info['kdncode']
                );
                $ret = $order_express->save($data_goods_delivery);
                // 循环添加到订单商品项

                if($ret!=null)
                {
                    $orderModule = new NsOrderModel();

                    $orderforupdate = array(
                        'shipping_time' => date("Y-m-d H:i:s", time()),
                        'shipping_status' => 1,
                    );
                    $orderModule->save($orderforupdate,["order_id"=>$order_id]);


                    $order_express->commit();
                    $config = [
                        'host' => '118.24.89.246',
                        'port' => 6379,
                        'password' => 'zhuangdawang',
                        'select' => 0,
                        'timeout' => 0,
                        'expire' => 0,
                        'persistent' => false,
                        'prefix' => '',
                    ];
                    $redis = new Redis($config);
                    $redis->lpush("flag.order_express",$order_id);

                }

            }
            return 1;
        } catch (\Exception $e) {
            $order_express->rollback();
            return $e->getMessage();
        }
    }
}