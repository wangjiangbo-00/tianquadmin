<?php
/**
 * Goods.php
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
 * 商品服务层
 */
use data\api\IGoods as IGoods;
use data\model\NsCartModel;
use data\model\NsConsultModel;
use data\model\NsConsultTypeModel;
use data\model\NsGoodsCategoryModel as NsGoodsCategoryModel;
use data\model\NsGoodsEditModel;
use data\model\NsGoodsEditViewModel;
use data\model\NsGoodsEvaluateModel;
use data\model\NsGoodsGroupModel as NsGoodsGroupModel;
use data\model\NsGoodsModel as NsGoodsModel;
use data\model\NsGoodsSkuEditModel;
use data\model\NsGoodsSkuModel as NsGoodsSkuModel;
use data\model\NsGoodsSpecModel as NsGoodsSpecModel;
use data\model\NsGoodsSpecValueModel as NsGoodsSpecValueModel;
use data\model\NsGoodsViewModel as NsGoodsViewModel;
use data\model\NsPromotionDiscountModel;
use data\model\NsShopModel;
use data\model\AlbumPictureModel as AlbumPictureModel;
use data\model\NsAttributeModel;
use data\model\NsAttributeValueModel;
use data\model\NsGoodsAttributeModel;
use data\service\BaseService as BaseService;
use data\service\promotion\GoodsDiscount;
use data\service\promotion\GoodsExpress;
use data\service\promotion\GoodsMansong;
use data\service\promotion\GoodsPreference;
use think\Model;
use think\Db;
use think;
use phpDocumentor\Reflection\Types\Array_;
use data\model\NsGoodsDeletedModel;
use data\model\NsGoodsSkuDeletedModel;
use data\model\NsGoodsAttributeDeletedModel;
use data\model\NsGoodsDeletedViewModel;
use data\model\BaseModel;
use think\Log;
use think\cache\driver\Redis;


class Goods extends BaseService implements IGoods
{

    private $goods;
    private $goods_edit;

    function __construct()
    {
        parent::__construct();
        $this->goods = new NsGoodsModel();
        $this->goods_edit = new NsGoodsEditModel();
    }

    /*
     * (non-PHPdoc)
     * @see \data\api\IGoods::getGoodsList()
     */
    public function getGoodsList($page_index = 1, $page_size = 0, $condition = '', $order = '')
    {
        // 针对商品分类
        if (! empty($condition['ng.category_id'])) {
            $goods_category = new GoodsCategory();
            $category_list = $goods_category->getCategoryTreeList($condition['ng.category_id']);
            $condition['ng.category_id | ng.extend_category_id'] = array(
                'in',
                $category_list
            );
            unset($condition['ng.category_id']);
        }
        $goods_view = new NsGoodsViewModel();
        $list = $goods_view->getGoodsViewList($page_index, $page_size, $condition, $order);

        return $list;
        
        // TODO Auto-generated method stub
    }

    public function getGoodsEditList($page_index = 1, $page_size = 0, $condition = '', $order = '')
    {
        // 针对商品分类

        $goods_view = new NsGoodsEditViewModel();
        $list = $goods_view->getGoodsEditViewList($page_index, $page_size, $condition, $order);

        return $list;

        // TODO Auto-generated method stub
    }

    /*
     * (non-PHPdoc)
     * @see \data\api\IGoods::getGoodsCount()
     */
    public function getGoodsCount($condition)
    {
        $count = $this->goods->where($condition)->count();
        return $count;
        
        // TODO Auto-generated method stub
    }

    /**
     * (non-PHPdoc)
     *
     * @see \data\api\IGoods::goods_QRcode_make()
     */
    function goods_QRcode_make($goodsId, $url)
    {
        $data = array(
            'QRcode' => $url
        );
        $result = $this->goods->save($data, [
            'goods_id' => $goodsId
        ]);
        if ($result > 0) {
            return SUCCESS;
        } else {
            return UPDATA_FAIL;
        }
    }

    /**
     * 添加修改商品
     * goods_id '商品id(SKU)',
     * goods_name '商品名称',
     * shop_id '店铺id',
     * category_id '商品分类id',
     * category_id_1 '一级分类id',
     * category_id_2 '二级分类id',
     * category_id_3 '三级分类id',
     * brand_id int(10) '品牌id',
     * group_id_array '店铺分类id 首尾用,隔开',
     * goods_type '实物或虚拟商品标志 1实物商品 0 虚拟商品 2 F码商品',
     * market_price '市场价',
     * price '商品原价格',
     * promotion_price '商品促销价格',
     * cost_price '成本价',
     * point_exchange_type '积分兑换类型 0 非积分兑换 1 只能积分兑换 ',
     * point_exchange '积分兑换',
     * give_point '购买商品赠送积分',
     * is_member_discount '参与会员折扣',
     * shipping_fee '运费 0为免运费',
     * shipping_fee_id '售卖区域id 物流模板id ns_order_shipping_fee 表id',
     * stock '商品库存',
     * max_buy '限购 0 不限购',
     * clicks'商品点击数量',
     * min_stock_alarm '库存预警值',
     * sales '销售数量',
     * collects '收藏数量',
     * star '好评星级',
     * evaluates '评价数',
     * shares '分享数',
     * province_id '一级地区id',
     * city_id '二级地区id',
     * picture '商品主图',
     * keywords '商品关键词',
     * introduction '商品简介',
     * description '商品详情',
     * QRcode '商品二维码',
     * code '商家编号',
     * is_stock_visible '页面不显示库存',
     *
     * state '商品状态 0下架，1正常，10违规（禁售）',
     * sale_date '上下架时间',
     * create_time '商品添加时间',
     * update_time '商品编辑时间',
     * sort '排序',
     * img_id_array '商品图片序列',
     * sku_img_array '商品sku应用图片列表 属性,属性值，图片ID',
     * match_point '实物与描述相符（根据评价计算）',
     * match_ratio '实物与描述相符（根据评价计算）百分比',
     * real_sales '实际销量',
     * goods_attribute '商品类型',
     * goods_spec_format '商品规格',
     *
     * @return \data\model\NsGoodsModel|number
     */
  public function addOrEditGoods($goodsforedit)
    {
        $error = 0;


        $this->goods->startTrans();
        try {

            $goods_img_model = new AlbumPictureModel();

            $goods_img = $goods_img_model->getInfo([
                'pic_id' => $goodsforedit['picture']]

            , '*');

            $picturerul = "";

            if($goods_img!=null)
            {
                $picturerul = $goods_img["pic_cover"];
            }


            $data_goods = array(
                'goods_name' => $goodsforedit['title'],
                'shop_id' => $goodsforedit['shopid'],
                'category_id' => $goodsforedit['categoryId'],
                'price' => $goodsforedit['price'],
                'group_price' => $goodsforedit['group_price'],
                'stock' => $goodsforedit['stock'],
                'type' => $goodsforedit['type'],
                'picture' => $goodsforedit['picture'],
                'introduction' => $goodsforedit['introduction'],
                'shortdesp' => $goodsforedit['shortdesp'],
                'description' => $goodsforedit['description'],
                'code' => $goodsforedit['code'],
                'bannerurl' => $goodsforedit['banner'],
                'pictureurl' => $picturerul,
                'sort' => $goodsforedit['sort'],
                'img_id_array' => $goodsforedit['imageArray'],
               'state' => 0,
                //'goods_attribute_id' => $goodsforedit['goods_attribute_id'],
               // 'goods_spec_format' => $goodsforedit['goods_spec_format'],
                'goods_attribute_id' => 0,
                'goods_spec_format' => null,
                'goods_weight' => $goodsforedit['goods_weight'],
                'group_number' => $goodsforedit['group_number'],
                'openselflift' => $goodsforedit['openselflift'],
                'selfliftreturn' => $goodsforedit['selfliftreturn'],
                'shipping_fee_id' => $goodsforedit['shipping_fee_id'],

            );
            $sku_array  = null;

            //$sku_array = $goodsforedit['skuArray'];
            if(true)
            {
                if ($goodsforedit['goodsId'] == 0) {

                    //first add good

                    $data_goods['create_time'] = date("Y-m-d H:i:s", time());

                    if($data_goods['state'] == 1)
                    {
                        $data_goods['state'] = 0;
                    }

                    $catid = $goodsforedit['categoryId'];

                    //$redis = new Redis();
                    //$redis->lpush("apicheck.getrecommendgoods",$catid);
                    //$redis->lpush("apicheck.getrecommendgoods",0);
                    $res = $this->goods->save($data_goods);



                    //$data_goods['create_time'] = date("Y-m-d H:i:s", time());
                    //$data_goods['goods_id'] = $res;
                    //$data_goods['edit_type'] = 1;
                    //$catid = $goodsforedit['categoryId'];



                    if (! empty($sku_array)) {
                        $sku_list_array = explode('§', $sku_array);
                        foreach ($sku_list_array as $k => $v) {
                            $res = $this->addOrUpdateGoodsSkuItem($res, $v);
                            if (! $res) {
                                $error = 1;
                            }
                        }

                    } else {
                        //todo do nothing now
                        /*
                        $goods_sku = new NsGoodsSkuModel();

                        // 添加一条skuitem
                        $sku_data = array(
                            'goods_id' => $res,
                            'sku_name' => '',
                            'market_price' => $goodsforedit['market_price'],
                            'price' => $goodsforedit['price'],

                            'group_price' => $goodsforedit['group_price'],
                            'stock' => $goodsforedit['stock'],
                            'picture' => 0,
                            'code' => $goodsforedit['code'],

                            'create_time' => date('Y-m-d H:i:s', time())
                        );
                        $res = $goods_sku->save($sku_data);
                        if (! $res) {
                            $error = 1;
                        }
                        */
                    }

                    //$redis = new Redis();
                    //$redis->lpush("apicheck.getrecommendgoods",$catid);
                    //$redis->lpush("apicheck.getrecommendgoods",0);
                    //$res = $this->goods_edit->save($data_goods);
                    //$goods_id = $this->goods->goods_id;
                    // 添加sku

                } else {
                    $goods_id = $goodsforedit['goodsId'];
                    if($data_goods['state'] == 1)
                    {
                        $data_goods['state'] = 0;
                    }
                    $res = $this->goods->save($data_goods, [
                        'goods_id' => $goods_id
                    ]);

                    $redis = new Redis();


                    $redis->lpush("apicheck.getgoodsdetails",$goodsforedit['goodsId']);

                    /*
                    $goodseditbefore = $this->goods_edit->getInfo(
                        ["goods_id"=> $goodsforedit['goodsId']] ,["id"]
                    );
                    $infochange = false;
                    $data_goods['goods_id'] = $goodsforedit['goodsId'];

                    if($goodseditbefore!=null )
                    {
                        $data_goods['update_time'] = date("Y-m-d H:i:s", time());
                        $res = $this->goods_edit->save($data_goods, [
                            'id' => $goodseditbefore['id']
                        ]);
                    }
                    else
                    {
                        $data_goods['update_time'] = date("Y-m-d H:i:s", time());

                        $data_goods['edit_type'] = 2;
                        $res = $this->goods_edit->save($data_goods);
                    }
*/
                    if (! empty($sku_array)) {
                        $sku_list_array = explode('§', $sku_array);
                        $this->deleteSkuItem($goods_id, $sku_list_array);
                        foreach ($sku_list_array as $k => $v) {
                            $res = $this->addOrUpdateGoodsSkuItem($goods_id, $v);
                            if (! $res) {
                                $error = 1;
                            }
                        }



                    } else {



                    }
                    /*
                    $redis = new Redis();


                    $redis->lpush("apicheck.getgoodsdetails",$goodsforedit['goodsId']);
                    $data_goods['update_time'] = date("Y-m-d H:i:s", time());
                    $res = $this->goods->save($data_goods, [
                        'goods_id' => $goodsforedit['goodsId']
                    ]);
                    */

                }
            }
/*
            else
            {
                //审核编辑
                $data_goods['update_time'] = date("Y-m-d H:i:s", time());
                $data_goods['goods_id'] = $goodsforedit['goodsId'];
                $data_goods['id'] = $goodsforedit['editid'];
                $data_goods['submit_status'] = 0;
                $res = $this->goods_edit->save($data_goods, [
                    'id' =>  $goodsforedit['editid']
                ]);
                $goods_id = $goodsforedit['goodsId'];
                if (! empty($sku_array)) {
                    $sku_list_array = explode('§', $sku_array);
                    $this->deleteSkuItem($goods_id, $sku_list_array);
                    foreach ($sku_list_array as $k => $v) {
                        $res = $this->addOrUpdateGoodsSkuEditItem($goods_id, $v);
                        if (! $res) {
                            $error = 1;
                        }
                    }



                } else {
                    $sku_data = array(
                        'goods_id' => $res,
                        'sku_name' => '',
                        'market_price' => $goodsforedit['market_price'],
                        'price' => $goodsforedit['price'],

                        'group_price' => $goodsforedit['group_price'],
                        'stock' => $goodsforedit['stock'],
                        'picture' => 0,
                        'code' => $goodsforedit['code'],

                        'create_time' => date('Y-m-d H:i:s', time())
                    );
                    $goods_sku = new NsGoodsSkuEditModel();
                    $count = $goods_sku->getCount(['goods_id'=>$goods_id]);//当前SKU没有则添加，否则修改
                    if($count>0){

                        $retval = $goods_sku->destroy([
                            'goods_id' => $goods_id,
                            'attr_value_items' => array(
                                'NEQ',
                                ''
                            )
                        ]);
                        $res = $goods_sku->save($sku_data, [
                            'goods_id' => $goods_id
                        ]);
                    }else{
                        $res = $goods_sku->save($sku_data);
                    }
                }
            }
*/
            // 商品类型保存

            if ($error == 0) {
                $this->goods->commit();

                return 1;
            } else {
                $this->goods->rollback();
                return 0;
            }
        } catch (\Exception $e) {
            $this->goods->rollback();
            return $e->getMessage();
        }
        return 0;
        
        // TODO Auto-generated method stub
    }
    /**
     * 修改 商品的 促销价格
     *
     * @param unknown $goods_id            
     */
    protected function modifyGoodsPromotionPrice($goods_id)
    {
        $discount_goods = new GoodsDiscount();
        $goods = new NsGoodsModel();
        $goods_sku = new NsGoodsSkuModel();
        $discount = $discount_goods->getDiscountByGoodsid($goods_id);
        if ($discount == - 1) {
            // 当前商品没有参加活动
        } else {
            // 当前商品有正在进行的活动
            // 查询出商品的价格进行修改
            $goods_price = $goods->getInfo([
                'goods_id' => $goods_id
            ], 'price');
            $goods->save([
                'promotion_price' => $goods_price['price'] * $discount / 10
            ], [
                'goods_id' => $goods_id
            ]);
            // 查询出所有的商品sku价格进行修改
            $goods_sku_list = $goods_sku->getQuery([
                'goods_id' => $goods_id
            ], 'sku_id, price', '');
            foreach ($goods_sku_list as $k => $v) {
                $goods_sku = new NsGoodsSkuModel();
                $goods_sku->save([
                    'promote_price' => $v['price'] * $discount / 10
                ], [
                    'sku_id' => $v['sku_id']
                ]);
            }
        }
    }

    /**
     * 获取单个商品的sku属性
     *
     * {@inheritdoc}
     *
     * @see \data\api\IGoods::getGoodsSkuAll()
     */
    public function getGoodsAttribute($goods_id)
    {
        // 查询商品主表
        $goods = new NsGoodsModel();
        $goods_detail = $goods->get($goods_id);
        $spec_list = array();
        if (! empty($goods_detail) && ! empty($goods_detail['goods_spec_format']) && $goods_detail['goods_spec_format'] != "[]") {
            $spec_list = json_decode($goods_detail['goods_spec_format'], true);
            if (! empty($spec_list)) {
                foreach ($spec_list as $k => $v) {
                    foreach ($v["value"] as $m => $t) {
                        if (empty($t["spec_show_type"])) {
                            $spec_list[$k]["value"][$m]["spec_show_type"] = 1;
                        }
                    }
                }
            }
        }
        return $spec_list;
    }

    /*
     * (non-PHPdoc)
     * @see \data\api\IGoods::getGoodsSku()
     */
    public function getGoodsSku($goods_id)
    {
        $goods_sku = new NsGoodsSkuModel();
        $list = $goods_sku->get([
            'goods_id' => $goods_id
        ]);
        return $list;
        // TODO Auto-generated method stub
    }

    /*
     * (non-PHPdoc)
     * @see \data\api\IGoods::editGoodsSku()
     */
    public function ModifyGoodsSku($goods_id, $sku_list)
    {
        // TODO Auto-generated method stub
    }

    /*
     * (non-PHPdoc)
     * @see \data\api\IGoods::getGoodsImg()
     */
    public function getGoodsImg($goods_id)
    {
        // TODO Auto-generated method stub
        $goods_info = $this->goods->getInfo([
            'goods_id' => $goods_id
        ], 'picture');
        $pic_info = array();
        if (! empty($goods_info)) {
            $picture = new AlbumPictureModel();
            $pic_info['pic_cover'] = '';
            if (! empty($goods_info['picture'])) {
                $pic_info = $picture->get($goods_info['picture']);
            }
        }
        return $pic_info;
    }

    /*
     * (non-PHPdoc)
     * @see \data\api\IGoods::editGoodsOffline()
     */
    public function ModifyGoodsOffline($condition)
    {
        $data = array(
            "state" => 0,
            'update_time' => date('y-m-d h:i:s', time())
        );
        $result = $this->goods->save($data, "goods_id  in($condition)");
        if ($result > 0) {
            $goodswithcatidlist = $this->goods->getQuery("goods_id  in($condition)",["goods_id","category_id","shop_id"],"");

            $redis = new Redis();

            foreach($goodswithcatidlist as  $value){

                $redis->lpush("apicheck.getrecommendgoods",$value["category_id"]);
                $redis->lpush("apicheck.getgoodsdetails",$value["goods_id"]);
                $redis->lpush("apicheck.getshopgoods",$value["shop_id"]);
            }

            $redis->lpush("apicheck.getrecommendgoods",0);
            return SUCCESS;
        } else {
            return UPDATA_FAIL;
        }
    }

    /*
     * (non-PHPdoc)
     * @see \data\api\IGoods::editGoodsOnline()
     */
    public function ModifyGoodsOnline($condition)
    {
        $data = array(
            "state" => 1,
            'update_time' => date('y-m-d h:i:s', time())
        );
        $result = $this->goods->save($data, "goods_id  in($condition)");
        if ($result > 0) {

            $goodswithcatidlist = $this->goods->getQuery("goods_id  in($condition)",["goods_id","category_id","shop_id"],"");

            $redis = new Redis();

            foreach($goodswithcatidlist as  $value){
                $redis->lpush("apicheck.getrecommendgoods",$value["category_id"]);
                $redis->lpush("apicheck.getgoodsdetails",$value["goods_id"]);

                $redis->lpush("apicheck.getshopgoods",$value["shop_id"]);
            }

            $redis->lpush("apicheck.getrecommendgoods",0);
            return SUCCESS;
        } else {
            return UPDATA_FAIL;
        }
    }


    public function SubmitGoodsEdit($condition)
    {
        $data = array(
            "submit_status" => 1,
            "review_status" => 0,
            "refusemsg" => "无",
            'update_time' => date('y-m-d h:i:s', time())
        );
        $result = $this->goods_edit->save($data, "id  in($condition)");
        if ($result > 0) {
            return SUCCESS;
        } else {
            return UPDATA_FAIL;
        }
    }

    public function UnSubmitGoodsEdit($condition)
    {
        $data = array(
            "submit_status" => 0,
            'update_time' => date('y-m-d h:i:s', time())
        );
        $result = $this->goods_edit->save($data, "id  in($condition)");
        if ($result > 0) {
            return SUCCESS;
        } else {
            return UPDATA_FAIL;
        }
    }

    /*
     * (non-PHPdoc)
     * @see \data\api\IGoods::deleteGoods()
     */
    public function deleteGoods($goods_id)
    {
        $this->goods->startTrans();
        try {
            // 将商品信息添加到商品回收库中
            $this->addGoodsDeleted($goods_id);
            $condition = array(
                'shop_id' => $this->instance_id,
                'goods_id' => $goods_id
            );
            $res = $this->goods->destroy($goods_id);
            
            if ($res > 0) {
                $goods_id_array = explode(',', $goods_id);
                $goods_sku_model = new NsGoodsSkuModel();
                $goods_attribute_model = new NsGoodsAttributeModel();
                foreach ($goods_id_array as $k => $v) {
                    // 删除商品sku
                    $goods_sku_model->destroy([
                        'goods_id' => $v
                    ]);
                    // 删除商品属性
                    $goods_attribute_model->destroy([
                        'goods_id' => $v
                    ]);
                }
            }
            $this->goods->commit();
            if ($res > 0) {

                return SUCCESS;
            } else {
                return DELETE_FAIL;
            }
        } catch (\Exception $e) {
            $this->goods->rollback();
            return DELETE_FAIL;
        }
    }


    public function deleteGoodsEdit($id)
    {
        $this->goods->startTrans();
        try {
            // 将商品信息添加到商品回收库中

            $goodseidt = $this->goods_edit->getInfo(['id'=>$id],'edit_type,goods_id');



            if($goodseidt['edit_type'] == 1)
            {
                //新添
                $goods = $this->goods->getInfo(['goods_id'=>$goodseidt['goods_id']],'newadd');
                if($goods['newadd'] == 1)
                {
                    $this->goods->destroy($goodseidt['goods_id']);
                }
            }
            $condition = array(
                'shop_id' => $this->instance_id,
                'id' => $id
            );
            $res = $this->goods_edit->destroy($id);


            $this->goods->commit();
            if ($res > 0) {

                return SUCCESS;
            } else {
                return DELETE_FAIL;
            }
        } catch (\Exception $e) {
            $this->goods->rollback();
            return DELETE_FAIL;
        }
    }

    /**
     * 商品删除以前 将商品挪到 回收站中
     *
     * @param unknown $goods_ids            
     */
    private function addGoodsDeleted($goods_ids)
    {
        $this->goods->startTrans();
        try {
            $goods_id_array = explode(',', $goods_ids);
            foreach ($goods_id_array as $k => $v) {
                // 得到商品的信息 备份商品
                $goods_info = $this->goods->get($v);
                $goods_delete_model = new NsGoodsDeletedModel();
                $goods_info = json_decode(json_encode($goods_info), true);
                $goods_delete_obj = $goods_delete_model->getInfo([
                    "goods_id" => $v
                ]);
                if (empty($goods_delete_obj)) {
                    $goods_info["update_time"] = date('y-m-d h:i:s', time());
                    $goods_delete_model->save($goods_info);
                    // 商品的sku 信息备份
                    $goods_sku_model = new NsGoodsSkuModel();
                    $goods_sku_list = $goods_sku_model->getQuery([
                        "goods_id" => $v
                    ], "*", "");
                    foreach ($goods_sku_list as $goods_sku_obj) {
                        $goods_sku_deleted_model = new NsGoodsSkuDeletedModel();
                        $goods_sku_obj = json_decode(json_encode($goods_sku_obj), true);
                        $goods_sku_obj["update_date"] = date('y-m-d h:i:s', time());
                        $goods_sku_deleted_model->save($goods_sku_obj);
                    }
                    // 商品的属性 信息备份
                    $goods_attribute_model = new NsGoodsAttributeModel();
                    $goods_attribute_list = $goods_attribute_model->getQuery([
                        'goods_id' => $v
                    ], "*", "");
                    foreach ($goods_attribute_list as $goods_attribute_obj) {
                        $goods_attribute_delete_model = new NsGoodsAttributeDeletedModel();
                        $goods_attribute_obj = json_decode(json_encode($goods_attribute_obj), true);
                        $goods_attribute_delete_model->save($goods_attribute_obj);
                    }
                }
            }
            $this->goods->commit();
            return 1;
        } catch (\Exception $e) {
            $this->goods->rollback();
            return $e->getMessage();
        }
    }

    /*
     * (non-PHPdoc)
     * @see \data\api\IGoods::deleteGoodImages()
     */
    public function deleteGoodImages($goods_id)
    {
        // TODO Auto-generated method stub
    }

    /*
     * (non-PHPdoc)
     * @see \data\api\IGoods::getGoodsDetail()
     */
    public function getGoodsDetail($goods_id)
    {
        // 查询商品主表
        $goods = new NsGoodsModel();
        $goods_detail = $goods->get($goods_id);
        if ($goods_detail == null) {
            return null;
        }
        $goods_preference = new GoodsPreference();


        $spec_list = json_decode($goods_detail['goods_spec_format'], true);
        if (! empty($spec_list)) {
            foreach ($spec_list as $k => $v) {
                foreach ($v["value"] as $m => $t) {
                    if (empty($t["spec_show_type"])) {
                        $spec_list[$k]["value"][$m]["spec_show_type"] = 1;
                    }
                }
            }
        }
        $goods_detail['spec_list'] = $spec_list;
        // 查询图片表
        $goods_img = new AlbumPictureModel();
        $order = "instr('," . $goods_detail['img_id_array'] . ",',CONCAT(',',pic_id,','))"; // 根据 in里边的id 排序
        $goods_img_list = $goods_img->getQuery([
            'pic_id' => [
                "in",
                $goods_detail['img_id_array']
            ]
        ], '*', $order);
        if (trim($goods_detail['img_id_array']) != "") {
            $img_array = array();
            $img_temp_array = array();
            $img_array = explode(",", $goods_detail['img_id_array']);
            foreach ($img_array as $k => $v) {
                if (! empty($goods_img_list)) {
                    foreach ($goods_img_list as $t => $m) {
                        if ($m["pic_id"] == $v) {
                            $img_temp_array[] = $m;
                        }
                    }
                }
            }
        }
        $goods_picture = $goods_img->get($goods_detail['picture']);
        $goods_detail["img_temp_array"] = $img_temp_array;
        $goods_detail['img_list'] = $goods_img_list;
        $goods_detail['picture_detail'] = $goods_picture;
        // 查询分类名称
        $category_name = $this->getCategoryName($goods_detail['category_id']);
        $goods_detail['category_name'] = $category_name;




        $goods_sku = new NsGoodsSkuModel();
        $goods_sku_detail = $goods_sku->where('goods_id=' . $goods_id)->select();



        $goods_detail['sku_list'] = $goods_sku_detail;
        
        // 查询商品类型相关信息
        if ($goods_detail['goods_attribute_id'] != 0) {
            $attribute_model = new NsAttributeModel();
            $attribute_info = $attribute_model->getInfo([
                'class_id' => $goods_detail['goods_attribute_id']
            ], 'class_name');
            $goods_detail['goods_attribute_name'] = $attribute_info['class_name'];
            $goods_attribute_model = new NsGoodsAttributeModel();
            $goods_attribute_list = $goods_attribute_model->getQuery([
                'goods_id' => $goods_id
            ], '*', '');
          
            $goods_detail['goods_attribute_list'] = $goods_attribute_list;
        } else {
            $goods_detail['goods_attribute_name'] = '';
            $goods_detail['goods_attribute_list'] = array();
        }
        

        
        $shop_model = new NsShopModel();
        $shop_name = $shop_model->getInfo(array(
            "shop_id" => $goods_detail["shop_id"]
        ), "shop_name");
        $goods_detail["shop_name"] = $shop_name["shop_name"];
        return $goods_detail;
        // TODO Auto-generated method stub
    }



    public function getGoodsEditDetail($id)
    {
        // 查询商品主表
        $goods = new NsGoodsEditModel();
        $goods_detail = $goods->get($id);
        if ($goods_detail == null) {
            return null;
        }
        $goods_preference = new GoodsPreference();


        $spec_list = json_decode($goods_detail['goods_spec_format'], true);
        if (! empty($spec_list)) {
            foreach ($spec_list as $k => $v) {
                foreach ($v["value"] as $m => $t) {
                    if (empty($t["spec_show_type"])) {
                        $spec_list[$k]["value"][$m]["spec_show_type"] = 1;
                    }
                }
            }
        }
        $goods_detail['spec_list'] = $spec_list;
        // 查询图片表
        $goods_img = new AlbumPictureModel();
        $order = "instr('," . $goods_detail['img_id_array'] . ",',CONCAT(',',pic_id,','))"; // 根据 in里边的id 排序
        $goods_img_list = $goods_img->getQuery([
            'pic_id' => [
                "in",
                $goods_detail['img_id_array']
            ]
        ], '*', $order);
        if (trim($goods_detail['img_id_array']) != "") {
            $img_array = array();
            $img_temp_array = array();
            $img_array = explode(",", $goods_detail['img_id_array']);
            foreach ($img_array as $k => $v) {
                if (! empty($goods_img_list)) {
                    foreach ($goods_img_list as $t => $m) {
                        if ($m["pic_id"] == $v) {
                            $img_temp_array[] = $m;
                        }
                    }
                }
            }
        }
        $goods_picture = $goods_img->get($goods_detail['picture']);
        $goods_detail["img_temp_array"] = $img_temp_array;
        $goods_detail['img_list'] = $goods_img_list;
        $goods_detail['picture_detail'] = $goods_picture;
        // 查询分类名称
        $category_name = $this->getCategoryName($goods_detail['category_id']);
        $goods_detail['category_name'] = $category_name;




        $goods_id = $goods_detail['goods_id'];

        // 查询商品类型相关信息
        if ($goods_detail['goods_attribute_id'] != 0) {
            $attribute_model = new NsAttributeModel();
            $attribute_info = $attribute_model->getInfo([
                'attr_id' => $goods_detail['goods_attribute_id']
            ], 'attr_name');
            $goods_detail['goods_attribute_name'] = $attribute_info['attr_name'];
            $goods_attribute_model = new NsGoodsAttributeModel();
            $goods_attribute_list = $goods_attribute_model->getQuery([
                'goods_id' => $goods_id
            ], '*', '');

            $goods_detail['goods_attribute_list'] = $goods_attribute_list;
        } else {
            $goods_detail['goods_attribute_name'] = '';
            $goods_detail['goods_attribute_list'] = array();
        }



        $shop_model = new NsShopModel();
        $shop_name = $shop_model->getInfo(array(
            "shop_id" => $goods_detail["shop_id"]
        ), "shop_name");
        $goods_detail["shop_name"] = $shop_name["shop_name"];
        return $goods_detail;
        // TODO Auto-generated method stub
    }
    /**
     * 商品规格列表(non-PHPdoc)
     *
     * @see \data\api\IGoods::getGoodsAttributeList()
     */
    public function getGoodsAttributeList($condition, $field, $order)
    {
        $spec = new NsGoodsSpecModel();
        $list = $spec->getQuery($condition, $field, $order);
        return $list;
    }

    /**
     * 商品规格值列表(non-PHPdoc)
     *
     *
     * @see \data\api\IGoods::getGoodsAttributeValueList()
     */
    public function getGoodsAttributeValueList($condition, $field)
    {
        $attribute = new NsGoodsSpecValueModel();
        $list = $attribute->where($condition)->clumn($field);
        return $list;
    }

    /*
     * 添加商品规格
     * (non-PHPdoc)
     * @see \data\api\IGoods::addGoodsSpec()
     */
    public function addGoodsSpec($spec_name, $sort = 0)
    {
        $attribute = new NsGoodsSpecModel();
        $data = array(
            'shop_id' => $this->instance_id,
            'spec_name' => $spec_name,
            'sort' => 0,
            'create_time' => date('y-m-d h:i:s', time())
        );
        $find_id = $attribute->get([
            'spec_name' => $spec_name
        ]);
        if (! empty($find_id)) {
            return $find_id['spec_id'];
        } else {
            $res = $attribute->save($data);
            return $attribute->spec_id;
        }
        
        // TODO Auto-generated method stub
    }

    /*
     * 添加商品规格值
     * (non-PHPdoc)
     * @see \data\api\IGoods::addGoodsSpecValue()
     */
    public function addGoodsSpecValue($spec_id, $spec_value, $sort = 0)
    {
        $spec_value_model = new NsGoodsSpecValueModel();
        $data = array(
            'spec_id' => $spec_id,
            'spec_value_name' => $spec_value,
            'sort' => $sort,
            'create_time' => date('Y-m-d H:i:s', time())
        );
        $find_id = $spec_value_model->get([
            'spec_value_name' => $spec_value,
            'spec_id' => $spec_id
        ]);
        if (! empty($find_id)) {
            return $find_id['spec_value_id'];
        } else {
            $res = $spec_value_model->save($data);
            return $spec_value_model->spec_value_id;
        }
        
        // TODO Auto-generated method stub
    }

    /**
     * 添加商品sku列表
     *
     * @param unknown $goods_id            
     * @param unknown $sku_item_array            
     * @return Ambigous <number, \think\false, boolean, string>
     */
    private function addOrUpdateGoodsSkuItem($goods_id, $sku_item_array)
    {
        $sku_item = explode('¦', $sku_item_array);
        $goods_sku = new NsGoodsSkuModel();
        $sku_name = $this->createSkuName($sku_item[0]);
        $condition = array(
            'goods_id' => $goods_id,
            'attr_value_items' => $sku_item[0]
        );
        $sku_count = $goods_sku->where($condition)->find();
        
        if (empty($sku_count)) {
            $data = array(
                'goods_id' => $goods_id,
                'sku_name' => $sku_name,
                'attr_value_items' => $sku_item[0],
                'attr_value_items_format' => $sku_item[0],
                'price' => $sku_item[1],
                'group_price' => $sku_item[1],
                'market_price' => $sku_item[2],

                'stock' => $sku_item[4],
                'picture' => 0,
                'code' => $sku_item[5],

                'create_time' => date('Y-m-d H:i:s', time())
            );
            $goods_sku->save($data);
            return $goods_sku->sku_id;
        } else {
            $data = array(
                'goods_id' => $goods_id,
                'sku_name' => $sku_name,
                'price' => $sku_item[1],
                'group_price' => $sku_item[1],
                'market_price' => $sku_item[2],
                'stock' => $sku_item[4],
                'code' => $sku_item[5],

                'create_time' => date('Y-m-d H:i:s', time())
            );
            $res = $goods_sku->save($data, [
                'sku_id' => $sku_count['sku_id']
            ]);
            return $res;
        }
    }


    private function addOrUpdateGoodsSkuEditItem($goods_id, $sku_item_array)
    {
        $sku_item = explode('¦', $sku_item_array);
        $goods_sku = new NsGoodsSkuEditModel();
        $sku_name = $this->createSkuName($sku_item[0]);
        $condition = array(
            'goods_id' => $goods_id,
            'attr_value_items' => $sku_item[0]
        );
        $sku_count = $goods_sku->where($condition)->find();

        if (empty($sku_count)) {
            $data = array(
                'goods_id' => $goods_id,
                'sku_name' => $sku_name,
                'attr_value_items' => $sku_item[0],
                'attr_value_items_format' => $sku_item[0],
                'price' => $sku_item[1],
                'promote_price' => $sku_item[1],
                'market_price' => $sku_item[2],
                'cost_price' => $sku_item[3],
                'stock' => $sku_item[4],
                'picture' => 0,
                'code' => $sku_item[5],
                'QRcode' => '',
                'create_date' => date('Y-m-d H:i:s', time())
            );
            $goods_sku->save($data);
            return $goods_sku->sku_id;
        } else {
            $data = array(
                'goods_id' => $goods_id,
                'sku_name' => $sku_name,
                'price' => $sku_item[1],
                'promote_price' => $sku_item[1],
                'market_price' => $sku_item[2],
                'cost_price' => $sku_item[3],
                'stock' => $sku_item[4],
                'code' => $sku_item[5],
                'QRcode' => '',
                'update_date' => date('Y-m-d H:i:s', time())
            );
            $res = $goods_sku->save($data, [
                'sku_id' => $sku_count['sku_id']
            ]);
            return $res;
        }
    }

    private function deleteSkuItem($goods_id, $sku_list_array)
    {
        $sku_item_list_array = array();
        foreach ($sku_list_array as $k => $sku_item_array) {
            $sku_item = explode('¦', $sku_item_array);
            $sku_item_list_array[] = $sku_item[0];
        }
        $goods_sku = new NsGoodsSkuModel();
        $list = $goods_sku->where('goods_id=' . $goods_id)->select();
        if (! empty($list)) {
            foreach ($list as $k => $v) {
                if (! in_array($v['attr_value_items'], $sku_item_list_array)) {
                    $goods_sku->destroy($v['sku_id']);
                }
            }
        }
    }


    private function clearGoodsSku($goods_id)
    {

        $goods_sku = new NsGoodsSkuModel();
        $goods_sku->destroy('goods_id=' . $goods_id);

    }



    /**
     * 组装sku name
     *
     * @param unknown $pvs            
     * @return string
     */
    private function createSkuName($pvs)
    {
        $name = '';
        $pvs_array = explode(';', $pvs);
        foreach ($pvs_array as $k => $v) {
            $value = explode(':', $v);
            $prop_id = $value[0];
            $prop_value = $value[1];
            $goods_spec_value_model = new NsGoodsSpecValueModel();
            $value_name = $goods_spec_value_model->getInfo([
                'spec_value_id' => $prop_value
            ], 'spec_value_name');
            $name = $name . $value_name['spec_value_name'] . ' ';
        }
        return $name;
    }

    /**
     * 根据当前分类ID查询商品分类的三级分类ID
     *
     * @param unknown $category_id            
     */
    private function getGoodsCategoryId($category_id)
    {
        // 获取分类层级
        $goods_category = new NsGoodsCategoryModel();
        $info = $goods_category->get($category_id);
        if ($info['level'] == 1) {
            return array(
                $category_id,
                0,
                0
            );
        }
        if ($info['level'] == 2) {
            // 获取父级
            return array(
                $info['pid'],
                $category_id,
                0
            );
            ;
        }
        if ($info['level'] == 3) {
            $info_parent = $goods_category->get($info['pid']);
            // 获取父级
            return array(
                $info_parent['pid'],
                $info['pid'],
                $category_id
            );
            ;
        }
    }

    /**
     * 根据当前商品分类组装分类名称
     *
     * @param unknown $category_id_1            
     * @param unknown $category_id_2            
     * @param unknown $category_id_3            
     */
    private function getGoodsCategoryName($category_id_1, $category_id_2, $category_id_3)
    {
        $name = '';
        $goods_category = new NsGoodsCategoryModel();
        $info_1 = $goods_category->getInfo([
            'category_id' => $category_id_1
        ], 'category_name');
        $info_2 = $goods_category->getInfo([
            'category_id' => $category_id_2
        ], 'category_name');
        $info_3 = $goods_category->getInfo([
            'category_id' => $category_id_3
        ], 'category_name');
        if (! empty($info_1['category_name'])) {
            $name = $info_1['category_name'] . ' > ';
        }
        if (! empty($info_2['category_name'])) {
            $name = $name . '' . $info_2['category_name'] . ' > ';
        }
        if (! empty($info_3['category_name'])) {
            $name = $name . '' . $info_3['category_name'];
        }
        return $name;
    }


    private function getCategoryName($category_id)
    {
        $name = '';
        $goods_category = new NsGoodsCategoryModel();
        $info_1 = $goods_category->getInfo([
            'category_id' => $category_id
        ], 'category_name');

        if (! empty($info_1['category_name'])) {
            $name = $info_1['category_name'] ;
        }

        return $name;
    }

    /**
     * 获取条件查询出商品
     * (non-PHPdoc)
     *
     * @see \data\api\IGoods::getSearchGoodsList()
     */
    public function getSearchGoodsList($page_index = 1, $page_size = 0, $condition = '', $order = '', $field = '*')
    {
        $result = $this->goods->pageQuery($page_index, $page_size, $condition, $order, $field);
        foreach ($result['data'] as $k => $v) {
            $picture = new AlbumPictureModel();
            $pic_info = array();
            $pic_info['pic_cover'] = '';
            if (! empty($v['picture'])) {
                $pic_info = $picture->get($v['picture']);
            }
            $result['data'][$k]['picture_info'] = $pic_info;
        }
        return $result;
    }

    /**
     * 修改商品分组(non-PHPdoc)
     *
     * @see \data\api\IGoods::ModifyGoodsGroup()
     */
    public function ModifyGoodsGroup($goods_id, $goods_type)
    {
        $data = array(
            "group_id_array" => $goods_type,
            "update_time" => date("Y-m-d H:i:s", time())
        );
        $result = $this->goods->save($data, "goods_id  in($goods_id)");
        if ($result > 0) {
            return SUCCESS;
        } else {
            return UPDATA_FAIL;
        }
    }

    /**
     * 修改商品 推荐 1=热销 2=推荐 3=新品
     */
    public function ModifyGoodsRecommend($goods_ids, $goods_type)
    {
        $goods = new NsGoodsModel();
        $goods->startTrans();
        try {
            $goods_id_array = explode(',', $goods_ids);
            $goods_type = explode(',', $goods_type);
            $data = array(
                "is_new" => $goods_type[0],
                "is_recommend" => $goods_type[1],
                "is_hot" => $goods_type[2]
            );
            foreach ($goods_id_array as $k => $v) {
                $goods = new NsGoodsModel();
                $goods->save($data, [
                    'goods_id' => $v
                ]);
            }
            $goods->commit();
            return 1;
        } catch (\Exception $e) {
            $goods->rollback();
            return $e->getMessage();
        }
    }

    /**
     * 获取商品可得积分
     *
     * @param unknown $goods_id            
     */
    public function getGoodsGivePoint($goods_id)
    {
        $goods = new NsGoodsModel();
        $point_info = $goods->getInfo([
            'goods_id' => $goods_id
        ], 'give_point');
        return $point_info['give_point'];
    }

    /**
     * 通过商品skuid查询goods_id
     *
     * @param unknown $sku_id            
     */
    public function getGoodsId($sku_id)
    {
        $goods_sku = new NsGoodsSkuModel();
        $sku_info = $goods_sku->getInfo([
            'sku_id' => $sku_id
        ], 'goods_id');
        return $sku_info['goods_id'];
    }

    /**
     * 获取购物车中项目，根据cartid
     *
     * @param unknown $carts            
     */
    public function getCartList($carts)
    {
        $cart = new NsCartModel();
        $cart_list = $cart->getQuery([
            'buyer_id' => $this->uid
        ], '*', '');
        $cart_array = explode(',', $carts);
        $list = array();
        foreach ($cart_list as $k => $v) {
            $goods = new NsGoodsModel();
            $goods_info = $goods->getInfo([
                'goods_id' => $v['goods_id']
            ], 'max_buy,state,point_exchange_type,point_exchange');
            // 获取商品sku信息
            $goods_sku = new NsGoodsSkuModel();
            $sku_info = $goods_sku->getInfo([
                'sku_id' => $v['sku_id']
            ], 'stock');
            if (empty($sku_info)) {
                $cart->destroy([
                    'buyer_id' => $this->uid,
                    'sku_id' => $v['sku_id']
                ]);
                continue;
            } else {
                if ($sku_info['stock'] == 0) {
                    $cart->destroy([
                        'buyer_id' => $this->uid,
                        'sku_id' => $v['sku_id']
                    ]);
                    continue;
                }
            }
            
            $v['stock'] = $sku_info['stock'];
            $v['max_buy'] = $goods_info['max_buy'];
            $v['point_exchange_type'] = $goods_info['point_exchange_type'];
            $v['point_exchange'] = $goods_info['point_exchange'];
            if ($goods_info['state'] != 1) {
                $this->cartDelete($v['cart_id']);
                unset($v);
            }
            $num = $v['num'];
            if ($goods_info['max_buy'] != 0 && $goods_info['max_buy'] < $v['num']) {
                $num = $goods_info['max_buy'];
            }
            
            if ($sku_info['stock'] < $num) {
                $num = $sku_info['stock'];
            }
            if ($num != $v['num']) {
                // 更新购物车
                $this->cartAdjustNum($v['cart_id'], $sku_info['stock']);
                $v['num'] = $num;
            }
            // 获取图片信息
            $picture = new AlbumPictureModel();
            $picture_info = $picture->get($v['goods_picture']);
            $v['picture_info'] = $picture_info;
            if (in_array($v['cart_id'], $cart_array)) {
                $list[] = $v;
            }
        }
        return $list;
    }

    /**
     * 获取购物车
     *
     * @param unknown $uid            
     */
    public function getCart($uid, $shop_id = 0)
    {
        if($uid > 0){
            $cart = new NsCartModel();
            $cart_goods_list = null;
            if ($shop_id == 0) {
                $cart_goods_list = $cart->getQuery([
                    'buyer_id' => $this->uid
                ], '*', '');
            } else {
                
                $cart_goods_list = $cart->getQuery([
                    'buyer_id' => $this->uid,
                    'shop_id' => $shop_id
                ], '*', '');
            }
            
        }else{
            $cart_goods_list = cookie('cart_array');
            if(empty($cart_goods_list)){
                $cart_goods_list = array();
            }else{
                $cart_goods_list = json_decode($cart_goods_list,true);
            }
        }
        if (!empty($cart_goods_list)) {
            foreach ($cart_goods_list as $k => $v) {
                $goods = new NsGoodsModel();        
                $goods_info = $goods->getInfo([
                    'goods_id' => $v['goods_id']
                ], 'max_buy,state,point_exchange_type,point_exchange,goods_name,price, picture ');
                // 获取商品sku信息
                $goods_sku = new NsGoodsSkuModel();
                $sku_info = $goods_sku->getInfo([
                    'sku_id' => $v['sku_id']
                ], 'stock, price, sku_name, promote_price');
                //验证商品或sku是否存在,不存在则从购物车移除
                if($uid > 0){
                    if(empty($goods_info)){
                        $cart->destroy([
                            'goods_id' => $v['goods_id'],
                            'buyer_id' => $uid
                        ]);
                        unset($cart_goods_list[$k]);
                        continue;
                    }
                    if(empty($sku_info)) {
                        unset($cart_goods_list[$k]);
                        $cart->destroy([
                            'buyer_id' => $uid,
                            'sku_id' => $v['sku_id']
                        ]);
                        continue;
                    }
                }else{
                    if(empty($goods_info)){
                        unset($cart_goods_list[$k]);
                        $this->cartDelete($v['cart_id']);
                        continue;
                    }
                    if(empty($sku_info)) {
                        unset($cart_goods_list[$k]);
                        $this->cartDelete($v['cart_id']);
                        continue;
                    }
                }
                //为cookie信息完善商品和sku信息
                if($uid > 0){
                    //查看用户会员价
                    $goods_preference = new GoodsPreference();
                    if (!empty($this->uid)) {
                        $member_discount = $goods_preference->getMemberLevelDiscount($uid);
                    } else {
                        $member_discount = 1;
                    }
                    $member_price = $member_discount * $sku_info['price'];
                    if($member_price > $sku_info["promote_price"]){
                        $price = $sku_info["promote_price"];
                    }else{
                        $price = $member_price;
                    }
                     $update_data = array(
                         "goods_name"=>$goods_info["goods_name"], 
                         "sku_name"=>$sku_info["sku_name"],
                         "goods_picture"=>$goods_info["picture"],
                         "price"=>$price
                     ); 
                     //更新数据 
                     $cart->save($update_data, ["cart_id"=>$v["cart_id"]]); 
                     $cart_goods_list[$k]["price"] = $price;
                     $cart_goods_list[$k]["goods_name"] = $goods_info["goods_name"];
                     $cart_goods_list[$k]["sku_name"] = $sku_info["sku_name"];
                     $cart_goods_list[$k]["goods_picture"] = $goods_info["picture"];
                }else{
                     $cart_goods_list[$k]["price"] = $sku_info["promote_price"];
                     $cart_goods_list[$k]["goods_name"] = $goods_info["goods_name"];
                     $cart_goods_list[$k]["sku_name"] = $sku_info["sku_name"];
                     $cart_goods_list[$k]["goods_picture"] = $goods_info["picture"];
                }
                
                
                $cart_goods_list[$k]['stock'] = $sku_info['stock'];
                $cart_goods_list[$k]['max_buy'] = $goods_info['max_buy'];
                $cart_goods_list[$k]['point_exchange_type'] = $goods_info['point_exchange_type'];
                $cart_goods_list[$k]['point_exchange'] = $goods_info['point_exchange'];
                if ($goods_info['state'] != 1) {
                    unset($cart_goods_list[$k]);
                    //更新cookie购物车
                    $this->cartDelete($v['cart_id']); 
                    continue;
                }
                $num = $v['num'];
                if ($goods_info['max_buy'] != 0 && $goods_info['max_buy'] < $v['num']) {
                    $num = $goods_info['max_buy'];
                }                    
                if ($sku_info['stock'] < $num) {
                    $num = $sku_info['stock'];
                }
                if ($num != $v['num']) {
                    // 更新购物车
                    $cart_goods_list[$k]['num'] = $num;
                    $this->cartAdjustNum($v['cart_id'], $sku_info['stock']);                       
                }
            }
            //为购物车图片
            foreach ($cart_goods_list as $k => $v) {
                $picture = new AlbumPictureModel();
                $picture_info = $picture->get($v['goods_picture']);
                $cart_goods_list[$k]['picture_info'] = $picture_info;
            }               
            sort($cart_goods_list);
        }
        return $cart_goods_list;
        
    }

    /**
     * 添加购物车(non-PHPdoc)
     *
     * @see \data\api\IGoods::addCart()
     */
    public function addCart($uid, $shop_id, $shop_name, $goods_id, $goods_name, $sku_id, $sku_name, $price, $num, $picture, $bl_id)
    {
        //多用户版本不用传入店铺ID以及名称不好处理
        // 检测当前购物车中是否存在产品
        if($uid > 0){
            $cart = new NsCartModel();
            $condition = array(
                'buyer_id' => $uid,
                'sku_id' => $sku_id
            );
            //查询商品信息
            $goods_model = new NsGoodsModel();
            $goods_shop = $goods_model->getInfo(['goods_id' => $goods_id], 'shop_id');
            //查询店铺名称
            $shop_model = new NsShopModel();
            $shop_info = $shop_model->getInfo(['shop_id' => $goods_shop['shop_id']], 'shop_id, shop_name');
            $count = $cart->where($condition)->count();
            if ($count == 0 || empty($count)) {
                $data = array(
                    'buyer_id' => $uid,
                    'shop_id' => $shop_info['shop_id'],
                    'shop_name' => $shop_info['shop_name'],
                    'goods_id' => $goods_id,
                    'goods_name' => $goods_name,
                    'sku_id' => $sku_id,
                    'sku_name' => $sku_name,
                    'price' => $price,
                    'num' => $num,
                    'goods_picture' => $picture,
                    'bl_id' => $bl_id
                );
                $cart->save($data);
                $retval = $cart->cart_id;
            } else {
                $cart = new NsCartModel();
                // 查询商品限购
                $goods = new NsGoodsModel();
                $get_num = $cart->getInfo($condition, 'cart_id,num');
                $max_buy = $goods->getInfo([
                    'goods_id' => $goods_id
                ], 'max_buy');
                $new_num = $num + $get_num['num'];
                if ($max_buy['max_buy'] != 0) {
                    
                    if ($new_num > $max_buy['max_buy']) {
                        $new_num = $max_buy['max_buy'];
                    }
                }
                
                $data = array(
                    'num' => $new_num
                );
                $retval = $cart->save($data, $condition);
                if ($retval) {
                    $retval = $get_num['cart_id'];
                }
            }
            
        }else{
            $cart_array = cookie('cart_array');
            $data = array(
                'shop_id' => $shop_id,
                'goods_id' => $goods_id,
                'sku_id' => $sku_id,
                'num' => $num
            );
            
            if(!empty($cart_array)){
                $cart_array = json_decode($cart_array,true);
                $tmp_array = array();
                foreach($cart_array as $k=>$v){
                    $tmp_array[] = $v['cart_id'];
                }
                $cart_id = max($tmp_array) + 1;
                $is_have = true;
                foreach($cart_array as $k=>$v){                      
                   if($v["goods_id"] == $goods_id && $v["sku_id"] == $sku_id){
                       $is_have = false;
                       $cart_array[$k]["num"] = $data["num"] + $v["num"];
                   }
                }
                if($is_have){
                    $data["cart_id"] = $cart_id;
                    $cart_array[] = $data;
                }
            }else{
                $data["cart_id"] = 1;
                $cart_array[] = $data;
            }
            $cart_array_string = json_encode($cart_array);
            try{
                cookie('cart_array', $cart_array_string, 3600);
                return 1;
            }catch(\Exception $e){
                return 0;
            }
            $retval = 1;
        }
        return $retval;
    }

    /**
     * 购物车数量修改(non-PHPdoc)
     *
     * @see \data\api\IGoods::cartAdjustNum()
     */
    public function cartAdjustNum($cart_id, $num)
    {
        if($this->uid > 0){
            $cart = new NsCartModel();
            $data = array(
                'num' => $num
            );
            $retval = $cart->save($data, [
                'cart_id' => $cart_id
            ]);
            return $retval;           
        }else{
            $result = $this->updateCookieCartNum($cart_id, $num);
            return $result;
        }
    }

    /**
     * 购物车项目删除(non-PHPdoc)
     *
     * @see \data\api\IGoods::cartDelete()
     */
    public function cartDelete($cart_id_array)
    {
        if($this->uid > 0){
            $cart = new NsCartModel();
            $retval = $cart->destroy($cart_id_array);
            return $retval;     
        }else{
            $result = $this->deleteCookieCart($cart_id_array);
            return $result;
        }
    }

    /**
     * (non-PHPdoc)
     *
     * @see \data\api\IGoods::getGroupGoodsList()
     */
    public function getGroupGoodsList($goods_group_id, $condition = '', $num = 0, $order = '')
    {
        $goods_list = array();
        $goods = new NsGoodsModel();
        $condition['state'] = 1;
        $list = $goods->getQuery($condition, '*', $order);
        foreach ($list as $k => $v) {
            $picture = new AlbumPictureModel();
            $picture_info = $picture->get($v['picture']);
            $v['picture_info'] = $picture_info;
            $group_id_array = explode(',', $v['group_id_array']);
            if (in_array($goods_group_id, $group_id_array) || $goods_group_id == 0) {
                $goods_list[] = $v;
            }
        }
        foreach ($goods_list as $k => $v) {
            if (! empty($this->uid)) {
                $member = new Member();
                $goods_list[$k]['is_favorite'] = $member->getIsMemberFavorites($this->uid, $v['goods_id'], 'goods');
            } else {
                $goods_list[$k]['is_favorite'] = 0;
            }
            
            $goods_sku = new NsGoodsSkuModel();
            // 获取sku列表
            $sku_list = $goods_sku->where([
                'goods_id' => $v['goods_id']
            ])->select();
            $goods_list[$k]['sku_list'] = $sku_list;
            
            // 查询商品单品活动信息
            $goods_preference = new GoodsPreference();
            $goods_promotion_info = $goods_preference->getGoodsPromote($v['goods_id']);
            $goods_list[$k]['promotion_info'] = $goods_promotion_info;
        }
        if ($num == 0) {
            return $goods_list;
        } else {
            $count_list = count($goods_list);
            if ($count_list > $num) {
                return array_slice($goods_list, 0, $num);
            } else {
                return $goods_list;
            }
        }
    }

    /**
     * 获取限时折扣的商品
     *
     * @param number $page_index            
     * @param number $page_size            
     * @param unknown $condition            
     * @param string $order            
     */
    public function getDiscountGoodsList($page_index = 1, $page_size = 0, $condition = array(), $order = '')
    {
        $goods_discount = new GoodsDiscount();
        $goods_list = $goods_discount->getDiscountGoodsList($page_index, $page_size, $condition, $order);
        return $goods_list;
    }

    /**
     * (non-PHPdoc)
     *
     * @see \data\api\IGoods::getGoodsEvaluate()
     */
    public function getGoodsEvaluate($goods_id)
    {
        $goodsEvaluateModel = new NsGoodsEvaluateModel();
        $condition['goods_id'] = $goods_id;
        $field = 'order_id, orderno, order_goods_id, goods_id, goods_name, goods_price, goods_image, storeid, storename, content, addtime, image, explain_first, member_name, uid, is_anonymous, scores, again_content, again_addtime, again_image, again_explain';
        return $goodsEvaluateModel->getQuery($condition, $field, 'id ASC');
    }

    /**
     * (non-PHPdoc)
     *
     * @see \data\api\IGoods::getGoodsEvaluateList()
     */
    public function getGoodsEvaluateList($page_index = 1, $page_size = 0, $condition = array(), $order = '', $field = '*')
    {
        $goodsEvaluateModel = new NsGoodsEvaluateModel();
        return $goodsEvaluateModel->pageQuery($page_index, $page_size, $condition, $order, $field);
    }

    /**
     * (non-PHPdoc)
     *
     * @see \data\api\IGoods::getGoodsShopid()
     */
    public function getGoodsShopid($goods_id)
    {
        $goods_model = new NsGoodsModel();
        $goods_info = $goods_model->getInfo([
            'goods_id' => $goods_id
        ], 'shop_id');
        return $goods_info['shop_id'];
    }

    /**
     * (non-PHPdoc)
     * @evaluate_count总数量 @imgs_count带图的数量 @praise_count好评数量 @center_count中评数量 bad_count差评数量
     *
     * @see \data\api\IGoods::getGoodsEvaluateCount()
     */
    public function getGoodsEvaluateCount($goods_id)
    {
        $goods_evaluate = new NsGoodsEvaluateModel();
        $evaluate_count_list['evaluate_count'] = $goods_evaluate->where([
            'goods_id' => $goods_id,
            'is_show' => 1
        ])->count();
        
        $evaluate_count_list['imgs_count'] = $goods_evaluate->where([
            'goods_id' => $goods_id,
            'is_show' => 1
        ])
            ->where('image|again_image', 'NEQ', '')
            ->count();
        
        $evaluate_count_list['praise_count'] = $goods_evaluate->where([
            'goods_id' => $goods_id,
            'explain_type' => 1,
            'is_show' => 1
        ])->count();
        $evaluate_count_list['center_count'] = $goods_evaluate->where([
            'goods_id' => $goods_id,
            'explain_type' => 2,
            'is_show' => 1
        ])->count();
        $evaluate_count_list['bad_count'] = $goods_evaluate->where([
            'goods_id' => $goods_id,
            'explain_type' => 3,
            'is_show' => 1
        ])->count();
        return $evaluate_count_list;
    }

    /**
     * 查询商品积分兑换(non-PHPdoc)
     *
     * @see \data\api\IGoods::getGoodsPointExchange()
     */
    public function getGoodsPointExchange($goods_id)
    {
        $goods_model = new NsGoodsModel();
        $goods_info = $goods_model->getInfo([
            'goods_id' => $goods_id
        ], 'point_exchange_type,point_exchange');
        if ($goods_info['point_exchange_type'] == 0) {
            return 0;
        } else {
            return $goods_info['point_exchange'];
        }
    }

    /**
     *
     * {@inheritdoc}
     *
     * @see \data\api\IGoods::getConsultTypeList()
     */
    public function getConsultTypeList($page_index = 1, $page_size = 0, $condition = '', $order = '')
    {
        $consult_type = new NsConsultTypeModel();
        $list = $consult_type->pageQuery($page_index, $page_size, $condition, $order, '');
        return $list;
    }

    /**
     *
     * {@inheritdoc}
     *
     * @see \data\api\IGoods::getConsultList()
     */
    public function getConsultList($page_index = 1, $page_size = 0, $condition = '', $order = '')
    {
        $consult = new NsConsultModel();
        $list = $consult->pageQuery($page_index, $page_size, $condition, $order, '');
        if (! empty($list)) {
            foreach ($list['data'] as $k => $v) {
                $pic_info = $this->getGoodsImg($v['goods_id']);
                $list['data'][$k]['picture_info'] = $pic_info;
            }
        }
        return $list;
    }

    /**
     *
     * {@inheritdoc}
     *
     * @see \data\api\IGoods::addConsult()
     */
    public function addConsult($goods_id, $goods_name, $uid, $member_name, $shop_id, $shop_name, $ct_id, $consult_content)
    {
        $consult = new NsConsultModel();
        $data = array(
            'goods_id' => $goods_id,
            'goods_name' => $goods_name,
            'uid' => $uid,
            'member_name' => $member_name,
            'shop_id' => $shop_id,
            'shop_name' => $shop_name,
            'ct_id' => $ct_id,
            'consult_content' => $consult_content,
            'consult_addtime' => date('Y-m-d H:i:s', time())
        );
        $consult->save($data);
        $res = $consult->consult_id;
        return $res;
    }

    /**
     *
     * {@inheritdoc}
     *
     * @see \data\api\IGoods::replyConsult()
     */
    public function replyConsult($consult_id, $consult_reply)
    {
        $consult = new NsConsultModel();
        $data = array(
            'consult_reply' => $consult_reply,
            'consult_reply_time' => date('Y-m-d H:i:s', time())
        );
        $res = $consult->save($data, [
            'consult_id' => $consult_id
        ]);
        return $res;
    }

    /**
     *
     * {@inheritdoc}
     *
     * @see \data\api\IGoods::addConsultType()
     */
    public function addConsultType($ct_name, $ct_introduce, $ct_sort)
    {}

    /**
     *
     * {@inheritdoc}
     *
     * @see \data\api\IGoods::updateConsultType()
     */
    public function updateConsultType($ct_id, $ct_name, $ct_introduce, $ct_sort)
    {}

    /**
     * (non-PHPdoc)
     *
     * @see \data\api\IGoods::deleteConsult()
     */
    public function deleteConsult($consult_id)
    {
        $consult = new NsConsultModel();
        return $consult->destroy($consult_id);
    }

    /**
     * (non-PHPdoc)
     *
     * @see \data\api\IGoods::deleteConsultType()
     */
    public function deleteConsultType($ct_id)
    {}

    /**
     * (non-PHPdoc)
     *
     * @see \data\api\IGoods::getConsultDetail()
     */
    public function getConsultDetail($ct_id)
    {}

    /**
     * (non-PHPdoc)
     *
     * @see \data\api\IGoods::getGoodsRank()
     */
    public function getGoodsRank($condition)
    {
        $goods = new NsGoodsModel();
        $goods_list = $goods->where($condition)
            ->order(" real_sales desc ")
            ->limit(6)
            ->select();
        return $goods_list;
    }

    /**
     * (non-PHPdoc)
     *
     * @see \data\api\IGoods::getConsultCount()
     */
    public function getConsultCount($condition)
    {
        $consult = new NsConsultModel();
        $count = $consult->where($condition)->count();
        return $count;
    }

    /**
     * (non-PHPdoc)
     *
     * @see \data\api\IGoods::getGoodsExpressTemplate()
     */
    public function getGoodsExpressTemplate($goods_id, $province_id, $city_id)
    {
        $goods_express = new GoodsExpress();
        $retval = $goods_express->getGoodsExpressTemplate($goods_id, $province_id, $city_id);
        return $retval;
    }

    /**
     * (non-PHPdoc)
     *
     * @see \data\api\IGoods::getGoodsSpecList()
     */
    public function getGoodsSpecList($page_index = 1, $page_size = 0, $condition = '', $order = '', $field = '*')
    {
        $goods_spec = new NsGoodsSpecModel();
        $goods_spec_value = new NsGoodsSpecValueModel();
        $goods_spec_list = $goods_spec->pageQuery($page_index, $page_size, $condition, $order, $field);
        if (! empty($goods_spec_list['data'])) {
            foreach ($goods_spec_list['data'] as $ks => $vs) {
                $goods_spec_value_name = '';
                $spec_value_list = $goods_spec_value->getQuery([
                    'spec_id' => $vs['spec_id']
                ], '*', '');
                foreach ($spec_value_list as $kv => $vv) {
                    $goods_spec_value_name = $goods_spec_value_name . ',' . $vv['spec_value_name'];
                }
                $goods_spec_list['data'][$ks]['spec_value_list'] = $spec_value_list;
                $goods_spec_value_name = $goods_spec_value_name == '' ? '' : substr($goods_spec_value_name, 1);
                $goods_spec_list['data'][$ks]['spec_value_name_list'] = $goods_spec_value_name;
            }
        }
        return $goods_spec_list;
    }

    /**
     * (non-PHPdoc)
     *
     * @see \data\api\IGoods::getGoodsSpecDetail()
     */
    public function getGoodsSpecDetail($spec_id)
    {
        $goods_spec = new NsGoodsSpecModel();
        $goods_spec_value = new NsGoodsSpecValueModel();
        $info = $goods_spec->getInfo([
            'spec_id' => $spec_id
        ], '*');
        $goods_spec_value_name = '';
        if (! empty($info)) {
            // 去除规格属性空值
            $goods_spec_value->destroy([
                'spec_id' => $info['spec_id'],
                'spec_value_name' => ''
            ]);
            $spec_value_list = $goods_spec_value->getQuery([
                'spec_id' => $info['spec_id']
            ], '*', '');
            foreach ($spec_value_list as $kv => $vv) {
                $goods_spec_value_name = $goods_spec_value_name . ',' . $vv['spec_value_name'];
            }
        }
        $info['spec_value_name_list'] = substr($goods_spec_value_name, 1);
        $info['spec_value_list'] = $spec_value_list;
        return $info;
    }

    /**
     * (non-PHPdoc)
     *
     * @see \data\api\IGoods::addGoodsSpec()
     */
    public function addGoodsSpecService($shop_id, $spec_name, $show_type, $is_visible, $sort, $spec_value_str, $classid = 0)
    {
        $goods_spec = new NsGoodsSpecModel();
        $goods_spec->startTrans();
        try {
            $data = array(
                'shop_id' => $shop_id,
                'spec_name' => $spec_name,
                'show_type' => $show_type,
                'is_visible' => $is_visible,
                'classid' => $classid,
                'sort' => $sort,
                'create_time' => date('Y-m-d H:i:s', time())
            );
            $goods_spec->save($data);
            $spec_id = $goods_spec->spec_id;
            // 添加规格并修改上级分类关联规格
            if ($classid > 0) {
                $attribute = new NsAttributeModel();
                $attribute_info = $attribute->getInfo([
                    "class_id" => $classid
                ], "*");
                if ($attribute_info["spec_id_array"] == '') {
                    $attribute->save([
                        "spec_id_array" => $spec_id
                    ], [
                        "class_id" => $classid
                    ]);
                } else {
                    $attribute->save([
                        "spec_id_array" => $attribute_info["spec_id_array"] . "," . $spec_id
                    ], [
                        "class_id" => $classid
                    ]);
                }
            }
            $spec_value_array = explode(',', $spec_value_str);
            $spec_value_array = array_filter($spec_value_array); // 去空
            $spec_value_array = array_unique($spec_value_array); // 去重复
            foreach ($spec_value_array as $k => $v) {
                $spec_value = array();
                if ($show_type == 2) {
                    $spec_value = explode(':', $v);
                    $this->addGoodsSpecValueService($spec_id, $spec_value[0], $spec_value[1], 1, 255);
                } else {
                    $this->addGoodsSpecValueService($spec_id, $v, '', 1, 255);
                }
            }
            $goods_spec->commit();
            return $spec_id;
        } catch (\Exception $e) {
            $goods_spec->rollback();
            return $e->getMessage();
        }
    }

    /**
     * (non-PHPdoc)
     *
     * @see \data\api\IGoods::updateGoodsSpecService()
     */
    public function updateGoodsSpecService($spec_id, $shop_id, $spec_name, $show_type, $is_visible, $sort, $spec_value_str,$classid)
    {
        $goods_spec = new NsGoodsSpecModel();
        $goods_spec->startTrans();
        try {
            $data = array(
                'shop_id' => $shop_id,
                'classid' => $classid,
                'spec_name' => $spec_name,
                'show_type' => $show_type,
                'is_visible' => $is_visible,
                'sort' => $sort
            );
            $res = $goods_spec->save($data, [
                'spec_id' => $spec_id
            ]);
            if (! empty($spec_value_str)) {
                $spec_value_array = explode(',', $spec_value_str);
                $spec_value_array = array_filter($spec_value_array); // 去空
                $spec_value_array = array_unique($spec_value_array); // 去重复
                foreach ($spec_value_array as $k => $v) {
                    $spec_value = array();
                    if ($show_type == 2) {
                        $spec_value = explode(':', $v);
                        $this->addGoodsSpecValueService($spec_id, $spec_value[0], $spec_value[1], 1, 255);
                    } else {
                        $this->addGoodsSpecValueService($spec_id, $v, '', 1, 255);
                    }
                }
            }
            $goods_spec->commit();
            return $res;
        } catch (\Exception $e) {
            $goods_spec->rollback();
            return $e->getMessage();
        }
    }

    /**
     * (non-PHPdoc)
     *
     * @see \data\api\IGoods::addGoodsSpecValue()
     */
    public function addGoodsSpecValueService($spec_id, $spec_value_name, $spec_value_data, $is_visible, $sort)
    {
        $goods_spec_value = new NsGoodsSpecValueModel();
        $data = array(
            'spec_id' => $spec_id,
            'spec_value_name' => $spec_value_name,
            'spec_value_data' => $spec_value_data,
            'is_visible' => $is_visible,
            'sort' => $sort,
            'create_time' => date('Y-m-d H:i:s', time())
        );
        $goods_spec_value->save($data);
        return $goods_spec_value->spec_value_id;
    }

    /**
     * (non-PHPdoc)
     *
     * @see \data\api\IGoods::checkGoodsSpecIsUse()
     */
    public function checkGoodsSpecIsUse($spec_id)
    {
        // 1.查询所有当前规格下，所有的商品属性，组成字符串
        $goods_spec_value = new NsGoodsSpecValueModel();
        $goods_sku = new NsGoodsSkuModel();
        $goods_sku_delete = new NsGoodsSkuDeletedModel();
        $spec_value_list = $goods_spec_value->getQuery([
            'spec_id' => $spec_id
        ], '*', '');
        if (! empty($spec_value_list)) {
            $check_str = '';
            $res = 0;
            foreach ($spec_value_list as $k => $v) {
                $check_str = $spec_id . ':' . $v['spec_value_id'] . ';';
                $res += $goods_sku->where(" CONCAT(attr_value_items, ';') like '%" . $check_str . "%'")->count();
                $res += $goods_sku_delete->where(" CONCAT(attr_value_items, ';') like '%" . $check_str . "%'")->count();
                if ($res > 0) {
                    return true;
                    break;
                }
            }
            if ($res == 0) {
                return false;
            }
        } else {
            return false;
        }
    }

    /**
     * (non-PHPdoc)
     *
     * @see \data\api\IGoods::checkGoodsSpecValueIsUse()
     */
    public function checkGoodsSpecValueIsUse($spec_id, $spec_value_id)
    {
        $check_str = $spec_id . ':' . $spec_value_id . ';';
        $goods_sku = new NsGoodsSkuModel();
        $goods_sku_delete = new NsGoodsSkuDeletedModel();
        // 商品sku
        $res = $goods_sku->where(" CONCAT(attr_value_items, ';') like '%" . $check_str . "%'")->count();
        // 商品回收站sku
        $res_delete = $goods_sku_delete->where(" CONCAT(attr_value_items, ';') like '%" . $check_str . "%'")->count();
        if (($res + $res_delete) > 0) {
            return true;
        } else {
            return false;
        }
    }

    public function addGoodsEvaluateReply($id, $replyContent, $replyType)
    {
        $goodsEvaluate = new NsGoodsEvaluateModel();
        if ($replyType == 1) {
            return $goodsEvaluate->save([
                'explain_first' => $replyContent
            ], [
                'id' => $id
            ]);
        } elseif ($replyType == 2) {
            return $goodsEvaluate->save([
                'again_explain' => $replyContent
            ], [
                'id' => $id
            ]);
        }
    }

    public function setEvaluateShowStatu($id)
    {
        $goodsEvaluate = new NsGoodsEvaluateModel();
        $showStatu = $goodsEvaluate->getInfo([
            'id' => $id
        ], 'is_show');
        if ($showStatu['is_show'] == 1) {
            return $goodsEvaluate->save([
                'is_show' => 0
            ], [
                'id' => $id
            ]);
        } elseif ($showStatu['is_show'] == 0) {
            return $goodsEvaluate->save([
                'is_show' => 1
            ], [
                'id' => $id
            ]);
        }
    }

    public function deleteEvaluate($id)
    {
        $goodsEvaluate = new NsGoodsEvaluateModel();
        return $goodsEvaluate->destroy($id);
    }

    /**
     * (non-PHPdoc)
     *
     * @see \data\api\IGoods::deleteGoodsSpecValue()
     */
    public function deleteGoodsSpecValue($spec_id, $spec_value_id)
    {
        // 检测是否使用
        $res = $this->checkGoodsSpecValueIsUse($spec_id, $spec_value_id);
        // 检测规格属性数量
        $result = $this->getGoodsSpecValueCount([
            'spec_id' => $spec_id
        ]);
        if ($res) {
            return - 1;
        } else 
            if ($result == 1) {
                return - 2;
            } else {
                $goods_spec_value = new NsGoodsSpecValueModel();
                return $goods_spec_value->destroy($spec_value_id);
            }
    }

    /**
     * (non-PHPdoc)
     *
     * @see \data\api\IGoods::getGoodsSpecValueCount()
     */
    public function getGoodsSpecValueCount($condition)
    {
        $spec_value = new NsGoodsSpecValueModel();
        $count = $spec_value->where($condition)->count();
        return $count;
    }

    /**
     * (non-PHPdoc)
     *
     * @see \data\api\IGoods::deleteGoodsSpec()
     */
    public function deleteGoodsSpec($spec_id)
    {
        $goods_spec = new NsGoodsSpecModel();
        $goods_spec_value = new NsGoodsSpecValueModel();
        $goods_spec->startTrans();
        try {
            $spec_id_array = explode(',', $spec_id);
            foreach ($spec_id_array as $k => $v) {
                $res = $this->checkGoodsSpecIsUse($v);
                if ($res) {
                    return - 1;
                    $goods_spec->rollback();
                } else {
                    $goods_spec->destroy($v);
                    $goods_spec_value->destroy([
                        'spec_id' => $v
                    ]);
                }
            }
            
            $goods_spec->commit();
            return 1;
        } catch (\Exception $e) {
            $goods_spec->rollback();
            return $e->getMessage();
        }
    }

    /**
     * (non-PHPdoc)
     *
     * @see \data\api\IGoods::modifyGoodsSpecField()
     */
    public function modifyGoodsSpecField($spec_id, $field_name, $field_value)
    {
        $goods_spec = new NsGoodsSpecModel();
        return $goods_spec->save([
            "$field_name" => $field_value
        ], [
            'spec_id' => $spec_id
        ]);
    }

    /**
     * (non-PHPdoc)
     *
     * @see \data\api\IGoods::modifyGoodsSpecValueField()
     */
    public function modifyGoodsSpecValueField($spec_value_id, $field_name, $field_value)
    {
        $goods_spec_value = new NsGoodsSpecValueModel();
        return $goods_spec_value->save([
            "$field_name" => $field_value
        ], [
            'spec_value_id' => $spec_value_id
        ]);
    }

    /**
     * (non-PHPdoc)
     *
     * @see \data\api\IGoods::updateAttributeIsUse()
     */
    public function updateAttributeIsUse($attr_id, $is_use)
    {
        $goods_spec = new NsAttributeModel();
        return $goods_spec->save([
            'is_use' => $is_use
        ], [
            'attr_id' => $attr_id
        ]);
    }

    /**
     * (non-PHPdoc)
     *
     * @see \data\api\IGoods::getGoodsAttributeServiceList()
     */
    public function getAttributeServiceList($page_index = 1, $page_size = 0, $condition = '', $order = '', $field = '*')
    {
        $attribute = new NsAttributeModel();
        $attribute_value = new NsAttributeValueModel();
        $list = $attribute->pageQuery($page_index, $page_size, $condition, $order, $field);
        if (! empty($list['data'])) {
            foreach ($list['data'] as $k => $v) {
                $new_array = $attribute_value->getQuery([
                    'class_id' => $v['class_id']
                ], 'attr_value_name', '');
                $value_str = '';
                foreach ($new_array as $kn => $vn) {
                    $value_str = $value_str . ',' . $vn['attr_value_name'];
                }
                $value_str = substr($value_str, 1);
                $list['data'][$k]['value_str'] = $value_str;
            }
        }
        return $list;
    }


    public function getGoodClassList($page_index = 1, $page_size = 0, $condition = '', $order = '', $field = '*')
    {
        $attribute = new NsAttributeModel();
        $attribute_value = new NsAttributeValueModel();
        $condition["shopid"] = $this->instance_id;
        $list = $attribute->pageQuery($page_index, $page_size, $condition, $order, $field);

        return $list;
    }

    /**
     * (non-PHPdoc)
     *
     * @see \data\api\IGoods::addGoodsAttributeService()
     */
    public function addAttributeService($attr_name, $is_use, $spec_id_array, $sort, $value_string)
    {
        $attribute = new NsAttributeModel();
        $attribute->startTrans();
        try {
            $data = array(
                "class_name" => $attr_name,
                "is_use" => $is_use,
                "spec_id_array" => $spec_id_array,
                "sort" => $sort,
                "shopid" => $this->instance_id,
                "create_time" => date("Y-m-d H:i:s", time())
            );
            $attribute->save($data);
            $attr_id = $attribute->class_id;

            $attribute->commit();
            return $attr_id;
        } catch (\Exception $e) {
            $attribute->rollback();
            return $e->getMessage();
        }
    }

    /**
     * (non-PHPdoc)
     *
     * @see \data\api\IGoods::updateAttributeService()
     */
    public function updateAttributeService($attr_id, $attr_name, $is_use, $spec_id_array, $sort, $value_string)
    {
        $attribute = new NsAttributeModel();
        $attribute->startTrans();
        try {
            $data = array(
                "class_name" => $attr_name,
                "is_use" => $is_use,

                "sort" => $sort,
                "modify_time" => date("Y-m-d H:i:s", time())
            );
            $res = $attribute->save($data, [
                'class_id' => $attr_id
            ]);

            $attribute->commit();
            return $res;
        } catch (\Exception $e) {
            $attribute->rollback();
            return $e->getMessage();
        }
    }

    /**
     * (non-PHPdoc)
     *
     * @see \data\api\IGoods::addAttributeValueService()
     */
    public function addAttributeValueService($attr_id, $attr_value_name, $type, $sort, $is_search, $value)
    {
        $attribute_value = new NsAttributeValueModel();
        $data = array(
            'attr_id' => $attr_id,
            'attr_value_name' => $attr_value_name,
            'type' => $type,
            'sort' => $sort,
            'is_search' => $is_search,
            'value' => $value
        );
        $attribute_value->save($data);
        return $attribute_value->attr_value_id;
    }

    /**
     * (non-PHPdoc)
     *
     * @see \data\api\IGoods::getAttributeServiceDetail()
     */
    public function getAttributeServiceDetail($attr_id, $condition = '')
    {
        $attribute = new NsAttributeModel();
        $info = $attribute->get($attr_id);
        $array = Array();
        $condition =  Array();
        if (! empty($info)) {
            $condition['class_id'] = $attr_id;
            $array = $this->getAttributeValueServiceList(1, 0, $condition, 'sort');
            $info['value_list'] = $array;
        }
        return $info;
    }

    /**
     * (non-PHPdoc)
     *
     * @see \data\api\IGoods::getAttributeValueServiceList()
     */
    public function getAttributeValueServiceList($page_index = 1, $page_size = 0, $condition = '', $order = '', $field = '*')
    {
        $attribute_value = new NsAttributeValueModel();
        return $attribute_value->pageQuery($page_index, $page_size, $condition, $order, $field);
    }

    /**
     * (non-PHPdoc)
     *
     * @see \data\api\IGoods::deleteAttributeService()
     */
    public function deleteAttributeService($attr_id)
    {
        $attribute = new NsAttributeModel();
        $attribute_value = new NsAttributeValueModel();
        $res = $attribute->destroy($attr_id);
        $attribute_value->destroy([
            'attr_id' => $attr_id
        ]);
        return $res;
    }

    /**
     * (non-PHPdoc)
     *
     * @see \data\api\IGoods::deleteAttributeValueService()
     */
    public function deleteAttributeValueService($attr_id, $attr_value_id)
    {
        $attribute_value = new NsAttributeValueModel();
        // 检测类型属性数量
        $result = $this->getGoodsAttrValueCount([
            'attr_id' => $attr_id
        ]);
        if ($result == 1) {
            return - 2;
        } else {
            return $attribute_value->destroy($attr_value_id);
        }
    }

    /**
     * (non-PHPdoc)
     *
     * @see \data\api\IGoods::getGoodsAttrValueCount()
     */
    public function getGoodsAttrValueCount($condition)
    {
        $attr_value = new NsAttributeValueModel();
        $count = $attr_value->where($condition)->count();
        return $count;
    }

    /**
     * (non-PHPdoc)
     *
     * @see \data\api\IGoods::modifyAttributeValueService()
     */
    public function modifyAttributeValueService($attr_value_id, $field_name, $field_value)
    {
        $attribute_value = new NsAttributeValueModel();
        return $attribute_value->save([
            "$field_name" => $field_value
        ], [
            'attr_value_id' => $attr_value_id
        ]);
    }

    /**
     * (non-PHPdoc)
     *
     * @see \data\api\IGoods::modifyAttributeFieldService()
     */
    public function modifyAttributeFieldService($attr_id, $field_name, $field_value)
    {
        $attribute = new NsAttributeModel();
        return $attribute->save([
            "$field_name" => $field_value
        ], [
            'attr_id' => $attr_id
        ]);
    }

    /**
     * (non-PHPdoc)
     *
     * @see \data\api\IGoods::checkGoodsSpecValueNameIsUse()
     */
    public function checkGoodsSpecValueNameIsUse($spec_id, $value_name)
    {
        $goods_spec_value = new NsGoodsSpecValueModel();
        $num = $goods_spec_value->where([
            'spec_id' => $spec_id,
            'spec_value' => $value_name
        ])->count();
        return $num > 0 ? true : false;
    }

    /*
     * (non-PHPdoc)
     * @see \data\api\IGoods::getAttributeInfo()
     */
    public function getAttributeInfo($condition)
    {
        // TODO Auto-generated method stub
        $attribute = new NsAttributeModel();
        $info = $attribute->getInfo($condition, "*");
        return $info;
    }

    /*
     * (non-PHPdoc)
     * @see \data\api\IGoods::getGoodsSpecQuery()
     */
    public function getGoodsSpecQuery($condition)
    {
        // TODO Auto-generated method stub
        $goods_spec = new NsGoodsSpecModel();
        $goods_spec_query = $goods_spec->getQuery($condition, "*", 'sort');
        foreach ($goods_spec_query as $k => $v) {
            $goods_spec_value = new NsGoodsSpecValueModel();
            $goods_spec_value_query = $goods_spec_value->getQuery([
                "spec_id" => $v["spec_id"]
            ], "*", '');
            $goods_spec_query[$k]["values"] = $goods_spec_value_query;
        }
        return $goods_spec_query;
    }

    /*
     * (non-PHPdoc)
     * @see \data\api\IGoods::getGoodsAttrSpecQuery()
     */
    public function getGoodsAttrSpecQuery($condition)
    {
        // TODO Auto-generated method stub
        if ($condition["class_id"] == 0) {
            return - 1;
        }
        $goods_attribute = $this->getAttributeInfo($condition);
        $condition_spec["spec_id"] = array(
            "in",
            $goods_attribute['spec_id_array']
        );
        $condition_spec["is_visible"] = 1;
        $spec_list = $this->getGoodsSpecQuery($condition_spec); // 商品规格
        
        $attribute_detail = $this->getAttributeServiceDetail($condition["attr_id"], [
            'is_search' => 1
        ]);
        $attribute_list = $attribute_detail['value_list']['data'];
        
        foreach ($attribute_list as $k => $v) {
            $value_items = explode(",", $v['value']);
            $attribute_list[$k]['value_items'] = $value_items;
        }
        
        $list["spec_list"] = $spec_list; // 商品规格集合
        $list["attribute_list"] = $attribute_list; // 商品属性集合
        return $list;
    }

    /*
     * (non-PHPdoc)
     * @see \data\api\IGoods::getGoodsAttributeQuery()
     */
    public function getGoodsAttributeQuery($condition)
    {
        // TODO Auto-generated method stub
        $goods_attribute = new NsGoodsAttributeModel();
        $query = $goods_attribute->getQuery($condition, "*", "");
        return $query;
    }

    /**
     * 回收商品的分页查询
     * (non-PHPdoc)
     *
     * @see \data\api\IGoods::getGoodsDeletedList()
     */
    public function getGoodsDeletedList($page_index = 1, $page_size = 0, $condition = '', $order = '')
    {
        // 针对商品分类
        if (! empty($condition['ng.category_id'])) {
            $goods_category = new GoodsCategory();
            $category_list = $goods_category->getCategoryTreeList($condition['ng.category_id']);
            $condition['ng.category_id'] = array(
                'in',
                $category_list
            );
        }
        $goods_view = new NsGoodsDeletedViewModel();
        $list = $goods_view->getGoodsViewList($page_index, $page_size, $condition, $order);
        if (! empty($list['data'])) {
            // 用户针对商品的收藏
            foreach ($list['data'] as $k => $v) {
                if (! empty($this->uid)) {
                    $member = new Member();
                    $list['data'][$k]['is_favorite'] = $member->getIsMemberFavorites($this->uid, $v['goods_id'], 'goods');
                } else {
                    $list['data'][$k]['is_favorite'] = 0;
                }
                // 查询商品单品活动信息
                $goods_preference = new GoodsPreference();
                $goods_promotion_info = $goods_preference->getGoodsPromote($v['goods_id']);
                $list["data"][$k]['promotion_info'] = $goods_promotion_info;
            }
        }
        return $list;
    }

    /**
     * 商品恢复
     * (non-PHPdoc)
     *
     * @see \data\api\IGoods::regainGoodsDeleted()
     */
    public function regainGoodsDeleted($goods_ids)
    {
        $goods_array = explode(",", $goods_ids);
        $this->goods->startTrans();
        try {
            foreach ($goods_array as $goods_id) {
                $goods_delete_model = new NsGoodsDeletedModel();
                $goods_delete_obj = $goods_delete_model->getInfo([
                    "goods_id" => $goods_id
                ]);
                $goods_delete_obj = json_decode(json_encode($goods_delete_obj), true);
                $goods_model = new NsGoodsModel();
                $goods_model->save($goods_delete_obj);
                $goods_delete_model->where("goods_id=$goods_id")->delete();
                // sku 恢复
                $goods_sku_delete_model = new NsGoodsSkuDeletedModel();
                $sku_delete_list = $goods_sku_delete_model->getQuery([
                    "goods_id" => $goods_id
                ], "*", "");
                foreach ($sku_delete_list as $sku_obj) {
                    $sku_obj = json_decode(json_encode($sku_obj), true);
                    $sku_model = new NsGoodsSkuModel();
                    $sku_model->save($sku_obj);
                }
                $goods_sku_delete_model->where("goods_id=$goods_id")->delete();
                // 属性恢复
                $goods_attribute_delete_model = new NsGoodsAttributeDeletedModel();
                $attribute_delete_list = $goods_attribute_delete_model->getQuery([
                    "goods_id" => $goods_id
                ], "*", "");
                foreach ($attribute_delete_list as $attribute_delete_obj) {
                    $attribute_delete_obj = json_decode(json_encode($attribute_delete_obj), true);
                    $attribute_model = new NsGoodsAttributeModel();
                    $attribute_model->save($attribute_delete_obj);
                }
                $goods_attribute_delete_model->where("goods_id=$goods_id")->delete();
            }
            $this->goods->commit();
            return SUCCESS;
        } catch (\Exception $e) {
            $this->goods->rollback();
            return UPDATA_FAIL;
        }
    }

    /**
     * (non-PHPdoc)
     *
     * @see \data\api\IGoods::copyGoodsInfo()
     */
    public function copyGoodsInfo($goods_id)
    {
        $goods_detail = $this->getGoodsDetail($goods_id);
        $goods_attribute = $this->getGoodsAttribute($goods_id);
        $goods_attribute_arr = array();
        foreach ($goods_detail['goods_attribute_list'] as $item) {
            $item_arr = array(
                'attr_value_id' => $item['attr_value_id'],
                'attr_value' => $item['attr_value'],
                'attr_value_name' => $item['attr_value_name'],
                'sort' => $item['sort']
            );
            array_push($goods_attribute_arr, $item_arr);
        }
        $skuArray = '';
        foreach ($goods_detail['sku_list'] as $item) {
            if (! empty($item['attr_value_items'])) {
                $skuArray .= $item['attr_value_items'] . '¦' . $item['price'] . "¦" . $item['market_price'] . "¦" . $item['cost_price'] . "¦" . $item['stock'] . "¦" . $item['code'] . '§';
            }
        }
        $skuArray = rtrim($skuArray, '§');
        $res = $this->addOrEditGoods(0, $goods_detail['goods_name'] . '-副本', $goods_detail['shop_id'], $goods_detail['category_id'], $goods_detail['category_id_1'], $goods_detail['category_id_2'], $goods_detail['category_id_3'], $goods_detail['brand_id'], $goods_detail['group_id_array'], $goods_detail['goods_type'], $goods_detail['market_price'], $goods_detail['price'], $goods_detail['cost_price'], $goods_detail['point_exchange_type'], $goods_detail['point_exchange'], $goods_detail['give_point'], $goods_detail['is_member_discount'], $goods_detail['shipping_fee'], $goods_detail['shipping_fee_id'], $goods_detail['stock'], $goods_detail['max_buy'], $goods_detail['min_stock_alarm'], $goods_detail['clicks'], $goods_detail['sales'], $goods_detail['collects'], $goods_detail['star'], $goods_detail['evaluates'], $goods_detail['shares'], $goods_detail['province_id'], $goods_detail['city_id'], $goods_detail['picture'], $goods_detail['keywords'], $goods_detail['introduction'], $goods_detail['description'], '', $goods_detail['code'], $goods_detail['is_stock_visible'], $goods_detail['is_hot'], $goods_detail['is_recommend'], $goods_detail['is_new'], $goods_detail['sort'], $goods_detail['img_id_array'], $skuArray, 0, $goods_detail['sku_img_array'], $goods_detail['goods_attribute_id'], json_encode($goods_attribute_arr), $goods_detail['goods_spec_format'], $goods_detail['goods_weight'], $goods_detail['goods_volume'], $goods_detail['shipping_fee_type'], $goods_detail['extend_category_id']);
        return $res;
    }

    /**
     * 删除回收站商品
     *
     * @param unknown $goods_id            
     * @return string
     */
    public function deleteRecycleGoods($goods_id)
    {
        $goods_delete = new NsGoodsDeletedModel();
        $goods_delete->startTrans();
        try {
            $res = $goods_delete->where("goods_id in ($goods_id) and shop_id=$this->instance_id ")->delete();
            if ($res > 0) {
                $goods_id_array = explode(',', $goods_id);
                $goods_sku_model = new NsGoodsSkuDeletedModel();
                $goods_attribute_model = new NsGoodsAttributeDeletedModel();
                foreach ($goods_id_array as $k => $v) {
                    // 删除商品sku
                    $goods_sku_model->where("goods_id = $v")->delete();
                    // 删除商品属性
                    $goods_attribute_model->where("goods_id = $v")->delete();
                }
            }
            $goods_delete->commit();
            if ($res > 0) {
                return SUCCESS;
            } else {
                return DELETE_FAIL;
            }
        } catch (\Exception $e) {
            $goods_delete->rollback();
            return DELETE_FAIL;
        }
    }
	/* (non-PHPdoc)
     * @see \data\api\IGoods::deleteCookieCart()删除cookie购物车
     */
    private function deleteCookieCart($cart_id_array)
    {
        // TODO Auto-generated method stub
        //获取删除条件拼装
        $cart_id_array=trim($cart_id_array);
       if(empty($cart_id_array) && $cart_id_array != 0){
           return 0;
       }
        //获取购物车
        $cart_goods_list = cookie('cart_array');
        if(empty($cart_goods_list)){
            $cart_goods_list = array();
        }else{
            $cart_goods_list = json_decode($cart_goods_list,true);
        }
        foreach($cart_goods_list as $k=>$v){
            if(strpos((string)$cart_id_array, (string)$v["cart_id"]) !== false){
                unset($cart_goods_list[$k]);
            }
        }
        if(empty($cart_goods_list)){
            cookie('cart_array', null);
            return 1;       
        }else{
            sort($cart_goods_list);
            try{
                cookie('cart_array', json_encode($cart_goods_list) , 3600);   
                return 1;
            }catch(\Exception $e){
                return 0;
            }            
        }
    }  
    /**
     * 修改cookie购物车的数量
     * @param unknown $cart_id
     * @param unknown $num
     * @return number
     */ 
    private function updateCookieCartNum($cart_id, $num){
        //获取购物车
        $cart_goods_list = cookie('cart_array');
        if(empty($cart_goods_list)){
            $cart_goods_list = array();
        }else{
            $cart_goods_list = json_decode($cart_goods_list,true);
        }
        foreach($cart_goods_list as $k=>$v){
            if($v["cart_id"] == $cart_id){
                $cart_goods_list[$k]["num"] = $num;
            }
        }
        sort($cart_goods_list);
        try{
            cookie('cart_array', json_encode($cart_goods_list) , 3600);
            return 1;
        }catch(\Exception $e){
            return 0;
        }
    }
	/* (non-PHPdoc)
     * @see \data\api\IGoods::syncUserCart()
     */
    public function syncUserCart($uid)
    {
        // TODO Auto-generated method stub
        $cart = new NsCartModel();
        $cart_query = $cart->getQuery(["buyer_id"=>$uid], '*', '');
        //获取购物车
        $cart_goods_list = cookie('cart_array');
        if(empty($cart_goods_list)){
            $cart_goods_list = array();
        }else{
            $cart_goods_list = json_decode($cart_goods_list,true);
        }
        $goodsmodel = new NsGoodsModel();   
        $web_site = new WebSite();
        $goods_sku = new NsGoodsSkuModel();
        
        $web_info = $web_site->getWebSiteInfo();
        //遍历cookie购物车
        if(!empty($cart_goods_list)){
            foreach($cart_goods_list as $k=>$v){
                //商品信息
                $goods_info = $goodsmodel->getInfo(['goods_id' => $v['goods_id']], 'picture, goods_name, price');
                //sku信息
                $sku_info = $goods_sku->getInfo([ 'sku_id' => $v['sku_id']], 'price, sku_name, promote_price');
                if (empty($goods_info)) {
                    break;
                }
                if(empty($sku_info)){
                    break;
                }
                //查看用户会员价
                $goods_preference = new GoodsPreference();
                if (!empty($this->uid)) {
                    $member_discount = $goods_preference->getMemberLevelDiscount($uid);
                } else {
                    $member_discount = 1;
                }
                $member_price = $member_discount * $sku_info['price'];
                if($member_price > $sku_info["promote_price"]){
                    $price = $sku_info["promote_price"];
                }else{
                    $price = $member_price;
                }
                //判断此用户有无购物车
                if(empty($cart_query)){
                    // 获取商品sku信息
                    $this->addCart($uid, $this->instance_id, $web_info['title'], $v["goods_id"], $goods_info["goods_name"], $v["sku_id"], $sku_info["sku_name"], $price,$v["num"], $goods_info["picture"], 0);
                }else{
                    $is_have = true;
                    foreach($cart_query as $t=>$m){
                        if($m["sku_id"] == $v["sku_id"] && $m["goods_id"] == $v["goods_id"]){
                            $is_have = false;
                            $num = $m["num"] + $v["num"];
                            $this->cartAdjustNum($m["cart_id"], $num);
                            break;
                        }
                    }
                    if($is_have){
                        $this->addCart($uid, $this->instance_id, $web_info['title'], $v["goods_id"], $goods_info["goods_name"], $v["sku_id"], $sku_info["sku_name"], $price,$v["num"], $goods_info["picture"], 0);
                    }
                }
            }      
        }
        cookie('cart_array', null);
    }
    /**
     * 更改商品排序
     * @param unknown $goods_id
     * @param unknown $sort
     * @return boolean
     */
    public function updateGoodsSort($goods_id, $sort){
        $goods = new NsGoodsModel();
        return $goods->save(['sort'=>$sort],['goods_id'=>$goods_id]);
    }
}
