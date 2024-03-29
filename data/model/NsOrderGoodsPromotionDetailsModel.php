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
/**
 * 订单商品项优惠详情
 *  id int(11) NOT NULL AUTO_INCREMENT,
  order_id int(11) NOT NULL COMMENT '订单ID',
  sku_id int(11) NOT NULL COMMENT '商品skuid',
  promotion_type_id int(11) NOT NULL COMMENT '优惠类型规则ID（满减对应规则）',
  promotion_id int(11) NOT NULL COMMENT '优惠ID',
  discount_money decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '优惠的金额，单位：元，精确到小数点后两位',
  used_time datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '使用时间',
 */
class NsOrderGoodsPromotionDetailsModel extends BaseModel {

    protected $table = 'zytc_order_goods_promotion_details';
    protected $rule = [
        'id'  =>  '',
    ];
    protected $msg = [
        'id'  =>  '',
    ];

}