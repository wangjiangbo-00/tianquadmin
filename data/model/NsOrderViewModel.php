<?php
/**
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

namespace data\model;

use data\model\BaseModel as BaseModel;
use data\model\NsGoodsGroupModel as NsGoodsGroupModel;
use data\model\NsGoodsSkuModel as NsGoodsSkuModel;

/**
 * 商品表视图
 * @author Administrator
 *
 */
class NsOrderViewModel extends BaseModel
{

    protected $table = 'zytc_order';

    /**
     * 获取列表返回数据格式
     * @param unknown $page_index
     * @param unknown $page_size
     * @param unknown $condition
     * @param unknown $order
     * @return unknown
     */
    public function getGoodsViewList($page_index, $page_size, $condition, $order)
    {

        $queryList = $this->getGoodsViewQuery($page_index, $page_size, $condition, $order);
        $queryCount = $this->getGoodsrViewCount($condition);
        $list = $this->setReturnList($queryList, $queryCount, $page_size);
        return $list;
    }

    /**
     * 获取列表
     * @param unknown $page_index
     * @param unknown $page_size
     * @param unknown $condition
     * @param unknown $order
     * @return \data\model\multitype:number
     */
    public function getOrderDetailsView($orderid)
    {
        $condition["ng.order_id"] = $orderid;
        $viewObj = $this->alias('ng')
            ->join('zytc_order_addr ngaddr', 'ng.order_id = ngaddr.order_id', 'left')
            ->join('zytc_order_extra ngextra', 'ng.order_id = ngextra.order_id', 'left')
            ->join('zytc_order_goods nggoods', 'ng.order_id = nggoods.order_id', 'left')
            ->field('ng.order_id, ng.out_trade_no, ng.pay_time, ng.shipping_time, 
               ng.sign_time, ng.order_price, ng.order_money,  ng.refund_flag, 
              ng.shipping_money, ng.order_status, ng.pay_status,ng.group_buy,ng.ordertype,ng.profit_status,
            ng.given_status, ng.preshippfee,ng.sharefrom,
             ng.discount, ng.discount_goods_id, ng.isfree, ng.user_name,
            ngextra.buyer_message, ngextra.fixaddr,ngextra.tryrefund, ngextra.sendnickname, ngextra.recievenickname,
            ngaddr.receiver_mobile,ngaddr.receiver_address,ngaddr.receiver_name,ngaddr.provincename,ngaddr.cityname,ngaddr.districtname,
            nggoods.goods_price,nggoods.buysum,nggoods.skuname,nggoods.discount_goods_id,nggoods.discount,nggoods.goodtitle,nggoods.goodposter');
        $order = $this->getView($viewObj,  $condition);

        return $order;
    }

    /**
     * 获取列表数量
     * @param unknown $condition
     * @return \data\model\unknown
     */
    public function getGoodsrViewCount($condition)
    {
        $viewObj = $this->alias('ng')
            ->join('zytc_goods_category ngc', 'ng.category_id = ngc.category_id', 'left')
            ->join('sys_album_picture sap', 'ng.picture = sap.pic_id', 'left')
            ->field('ng.goods_id');
        $count = $this->viewCount($viewObj, $condition);
        return $count;
    }
}