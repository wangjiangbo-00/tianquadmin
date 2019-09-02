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
class NsGoodsEditViewModel extends BaseModel {

    protected $table = 'zytc_goods_edit';
    
    /**
     * 获取列表返回数据格式
     * @param unknown $page_index
     * @param unknown $page_size
     * @param unknown $condition
     * @param unknown $order
     * @return unknown
     */
    public function getGoodsEditViewList($page_index, $page_size, $condition, $order){
    
        $queryList = $this->getGoodsEditViewQuery($page_index, $page_size, $condition, $order);
        $queryCount = $this->getGoodsEditrViewCount($condition);
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
    public function getGoodsEditViewQuery($page_index, $page_size, $condition, $order)
    {
        $viewObj = $this->alias('ng')
        ->join('zytc_goods_category ngc','ng.category_id = ngc.category_id','left')
        ->join('sys_album_picture sap','ng.picture = sap.pic_id', 'left')
        ->join('zytc_shop nss','ng.shop_id = nss.shop_id','left')
        ->field('ng.id,ng.goods_id, ng.goods_name, ng.shop_id, ng.category_id, 
               ng.price, ng.group_price, 
            ng.stock,  
            ng.min_stock_alarm, 
              ng.picture, ng.keywords, ng.introduction, 
            ng.description, ng.code, ng.is_recommend, 
              ng.state, ng.edit_type,ng.submit_status,ng.review_status,ng.refusemsg,ng.create_time, 
            ng.update_time, ng.sort,ng.real_sales, ngc.category_id, ngc.category_name, sap.pic_cover_micro,sap.pic_cover_mid,sap.pic_cover_small,nss.shop_name,sap.pic_id');
        $list = $this->viewPageQuery($viewObj, $page_index, $page_size, $condition, $order);

        return $list;
    }
    /**
     * 获取列表数量
     * @param unknown $condition
     * @return \data\model\unknown
     */
    public function getGoodsEditrViewCount($condition)
    {
        $viewObj = $this->alias('ng')
        ->join('zytc_goods_category ngc','ng.category_id = ngc.category_id','left')

        ->join('sys_album_picture sap','ng.picture = sap.pic_id', 'left')
        ->field('ng.goods_id');
        $count = $this->viewCount($viewObj,$condition);
        return $count;
    }
}