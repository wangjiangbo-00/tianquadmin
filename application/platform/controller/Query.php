<?php
/**
 * Goods.php
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

use data\model\AlbumPictureModel;
use data\model\NsQueryCategoryModel;
use data\model\NsQueryModel;
use data\service\Express as Express;
use data\service\Goods as GoodsService;
use data\service\GoodsBrand as GoodsBrand;
use data\service\GoodsCategory as GoodsCategory;
use data\service\GoodsGroup as GoodsGroup;
use data\service\Address;
use data\service\QuestionQuery;
use think\Config;
use think\Request;
use data\service\Platform;
use data\service\Album;

use think\cache\driver\Redis;



/**
 * 商品控制器
 */
class Query extends BaseController
{

    public function __construct()
    {
        parent::__construct();
    }

    /**
     * 根据商品ID查询单个商品，然后进行编辑操作
     *
     * 2016年11月25日 09:42:40
     *
     * @return \data\model\niushop\NsGoodsModel
     */


    /**
     * 商品列表
     */
    
    /**
     * 商品列表
     */
    public function queryList()
    {
        if (request()->isAjax()) {
            $page_index = request()->post('pageIndex',1);
            $goods_name = request()->post('goods_name', '');
            $type = request()->post('type', '');
            $queryservice = new QuestionQuery();
            if ($type != "") {
                $condition["catid"] = $type;
            }

            $result = $queryservice->getQueryList($page_index,20,$condition);

            return $result;
        } else {

            return view($this->style . "Query/queryList");
        }
    }


    public function querycategorylist()
    {
        if (request()->isAjax()) {
            $queryservice = new QuestionQuery();
            $result = $queryservice->getQueryCatList();

            return $result;
        } else {
            $queryservice = new QuestionQuery();
            $one_list = $queryservice->getQueryCat();
            $this->assign("category_list", $one_list);
            return view($this->style . "Query/queryCategoryList");
        }
    }
    public function modifyQuestionShow()
    {
        $condition = $_POST["id"]; // 将商品id用,隔开

        $isshow = $_POST["is_show"]; // 将商品id用,隔开
        $question = new QuestionQuery();
        $result = $question->ModifyQuestionShow($condition,$isshow);
        return AjaxReturn($result);
    }


    public function deleteQuestions()
    {
        $ids = request()->post('id');
        $questionservice = new QuestionQuery();
        $retval = $questionservice->deleteQuerys($ids);
        $this->updateredis();
        return AjaxReturn($retval);
    }

    public function deleteQuestionCategory()
    {
        $ids = request()->post('id');
        $questionservice = new QuestionQuery();
        $retval = $questionservice->deleteQueryCategory($ids);
        $this->updateredis();
        return AjaxReturn($retval);
    }


    public function addQuestion()
    {
        if (request()->isAjax()) {


            $name = request()->post('name','');
            $cid = request()->post('cid', '');
            $answer = request()->post('answer', '');
            $is_visible = request()->post('is_visible', '1');
            $questioncatmodel= new NsQueryCategoryModel();
            $questioncat = $questioncatmodel->getInfo([
                'id'=>$cid
            ]);

            $data = [
                'question' => $name,
                'catid' => $cid,
                'answer' => $answer,
                'show' => $is_visible,
                'catname' => $questioncat['catname'],
            ];


            $queryservice = new QuestionQuery();

            $result = $queryservice->AddQuestion($data);
            $this->updateredis();
             return AjaxReturn($result);;
        } else {
            $queryCatModel = new NsQueryCategoryModel();
            $queryCatList = $queryCatModel->getQuery('','','');

            $list = $queryCatList["data"];
            $this->assign("queryCatList", $queryCatList);
            return view($this->style . "Query/addQuery");
        }
    }


    public function addQuestionCategory()
    {
        if (request()->isAjax()) {


            $name = request()->post('name','');
            $logo= request()->post('logo','');
            $questioncatmodel= new NsQueryCategoryModel();


            $data = [

                'catname' => $name,
                'logo' => $logo,
            ];

            $result = $questioncatmodel->save($data);

            $this->updateredis();
            return AjaxReturn($result);
        } else {


            return view($this->style . "Query/addQueryCategory");
        }
    }


    public function updatequerycategory()
    {
        if (request()->isAjax()) {


            $name = request()->post('category_name','');
            $id = request()->post('category_id','');
            $logo= request()->post('logo','');
            $questioncatmodel= new NsQueryCategoryModel();


            $data = [

                'catname' => $name,
                'logo' => $logo,
            ];

            $result = $questioncatmodel->save($data,[
                'id'=>$id
            ]);


            $this->updateredis();
            return AjaxReturn($result);
        } else {
            $id = request()->get('id','');
            $queryCatModel = new NsQueryCategoryModel();
            $queryCat = $queryCatModel->getInfo(['id'=>$id],'','');


            $this->assign("data", $queryCat);
            return view($this->style . "Query/updateGoodsCategory");
        }
    }


    private function updateredis()
    {
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
        $redis->rm("value.sys.questions");
        $redis->inc("value.sys.question.version");
    }
    public function updatequery()
    {
        if (request()->isAjax()) {

            $question = $_POST["question"];



            $id = $question["id"];
            $name = $question["name"];;
            $cid = $question["cid"];;
            $answer = $question["answer"];;
            $is_visible = $question["is_visible"];
            $questioncatmodel= new NsQueryCategoryModel();
            $questioncat = $questioncatmodel->getInfo([
                'id'=>$cid
            ]);

            $data = [
                'question' => $name,
                'catid' => $cid,
                'answer' => $answer,
                'show' => $is_visible,
                'catname' => $questioncat['catname'],
            ];
            $queryModel = new NsQueryModel();
            $result = $queryModel->save($data,[
                'id'=>$id
            ]);

            $this->updateredis();
            return AjaxReturn($result);
        } else {
            $id = request()->get('id','');
            $queryModel = new NsQueryModel();
            $query = $queryModel->getInfo(['id'=>$id],'','');

            $queryCatModel = new NsQueryCategoryModel();
            $queryCatList = $queryCatModel->getQuery('','','');

            $this->assign("queryCatList", $queryCatList);
            $this->assign("data", $query);
            return view($this->style . "Query/updateQuery");
        }
    }



}