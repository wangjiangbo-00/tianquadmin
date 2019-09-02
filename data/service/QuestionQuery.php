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
use data\model\NsGoodsSkuModel as NsGoodsSkuModel;
use data\model\NsGoodsSpecModel as NsGoodsSpecModel;
use data\model\NsGoodsSpecValueModel as NsGoodsSpecValueModel;
use data\model\NsGoodsViewModel as NsGoodsViewModel;
use data\model\NsPromotionDiscountModel;
use data\model\NsQueryCategoryModel;
use data\model\NsQueryModel;
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


class QuestionQuery extends BaseService
{

    private $querys;

    private $querycat;
    function __construct()
    {
        parent::__construct();
        $this->querys = new NsQueryModel();
        $this->querycat = new NsQueryCategoryModel();
    }

    /*
     * (non-PHPdoc)
     * @see \data\api\IGoods::getGoodsList()
     */
    public function getQueryList($page_index = 1, $page_size = -1, $condition = '', $order = '')
    {
        // 针对商品分类

        $list = $this->querys->pageQuery($page_index,$page_size,$condition,$order,[]);

        return $list;
        
        // TODO Auto-generated method stub
    }

    public function getQueryCat()
    {
        // 针对商品分类

        $list = $this->querycat->getQuery('','','');

        return $list;

        // TODO Auto-generated method stub
    }

    public function ModifyQuestionShow($condition,$bshow)
    {
        $data = array(
            "show" => $bshow,

        );
        $result = $this->querys->save($data, "id  in($condition)");
        if ($result > 0) {
            return SUCCESS;
        } else {
            return UPDATA_FAIL;
        }
    }

    public function deleteQuerys($id)
    {
        $this->querys->startTrans();
        try {
            // 将商品信息添加到商品回收库中

            $condition = array(

                'id' => $id
            );
            $res = $this->querys->destroy($id);


            $this->querys->commit();
            if ($res > 0) {

                return SUCCESS;
            } else {
                return DELETE_FAIL;
            }
        } catch (\Exception $e) {
            $this->querys->rollback();
            return DELETE_FAIL;
        }
    }

    public function deleteQueryCategory($id)
    {
        $this->querycat->startTrans();
        try {
            // 将商品信息添加到商品回收库中

            $condition = array(

                'id' => $id
            );
            $res = $this->querycat->destroy($id);


            $this->querycat->commit();
            if ($res > 0) {

                return SUCCESS;
            } else {
                return DELETE_FAIL;
            }
        } catch (\Exception $e) {
            $this->querys->rollback();
            return DELETE_FAIL;
        }
    }


    public function AddQuestion($data)
    {

        $result = $this->querys->save($data);
        if ($result > 0) {
            return SUCCESS;
        } else {
            return UPDATA_FAIL;
        }
    }



}
