<?php
/**
 * Promotion.php
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

use data\model\NsGroupModel;
use data\model\NsPlatformActivityModel;
use data\model\NsPromotionDiscountGoodsModel;
use data\model\NsPromotionDiscountModel;
use data\model\NsPromotionGiftModel;
use data\model\NsRecommendCodeModel;
use data\service\Config;
use data\service\promotion\PromoteRewardRule;
use data\service\Promotion as PromotionService;

use think\Exception;
use think\Log;

/**
 * 营销控制器
 *
 * @author Administrator
 *
 */
class Promotion extends BaseController
{

    public function __construct()
    {
        parent::__construct();
    }


    public function getRecommendcodeList()
    {
        if (request()->isAjax()) {
            $page_index = request()->post("page_index", 1);
            $page_size = request()->post("page_size", PAGESIZE);
            $status = request()->post('status', -1);


            $gift = new PromotionService();
            if ($status > 0) {
                $condition = array(
                    "status" => $status
                );
            }

            $list = $gift->getRecomendCodeList($page_index, $page_size, $condition);
            return $list;
        }
        return view($this->style . "Promotion/getRecommendcodeList");
    }


    public function sendoutCode()
    {
        if (request()->isAjax()) {
            $codeModel = new NsRecommendCodeModel();
            $id = isset($_POST['id']) ? $_POST['id'] : '';


            $data = array(
                "status" => 1
            );
            $res = $codeModel->save($data, ["id" => $id]);
            return AjaxReturn($res);

        }
    }

    public function delsendoutcode()
    {
        if (request()->isAjax()) {
            $codeModel = new NsRecommendCodeModel();



            $condition = array(
                "status" => 2
            );
            $res = $codeModel->destroy($condition);
            return AjaxReturn($res);

        }
    }


    public function takebackCode()
    {
        if (request()->isAjax()) {
            $codeModel = new NsRecommendCodeModel();
            $id = isset($_POST['id']) ? $_POST['id'] : '';


            $data = array(
                "status" => 0
            );
            $res = $codeModel->save($data, ["id" => $id]);
            return AjaxReturn($res);

        }
    }


    public function deleteCode()
    {
        if (request()->isAjax()) {
            $codeModel = new NsRecommendCodeModel();
            $id = isset($_POST['id']) ? $_POST['id'] : '';


            $res = $codeModel->destroy( $id);
            return AjaxReturn($res);

        }
    }

    public function generateCode()
    {
        if (request()->isAjax()) {

            $num = 20;



            for($i=0;$i<$num;$i++)
            {
                $codeModel = new NsRecommendCodeModel();
                try
                {
                    if($i != 0)
                    {
                        $seed = time() - time()/($i+37) + $i*$i;
                    }
                    else
                    {
                        $seed = time();
                    }

                    $code = random_string(6);

                    $data = array(
                        'code' => $code,
                        'status' => 0,
                        'createtime' => date("Y-m-d H:i:s", time())
                    );
                    $res = $codeModel->save($data);
                }
                catch (Exception $e)
                {

                }

            }

            return AjaxReturn($res);

        }
    }




/**
 * 赠品列表
 * wzy
 */
public
function giftApplyList()
{
    if (request()->isAjax()) {
        $page_index = request()->post("page_index", 1);
        $page_size = request()->post("page_size", PAGESIZE);
        $search_text = request()->post('search_text');
        $gift = new PromotionService();
        $condition = array(
            "status" => 1


        );
        $list = $gift->getPromotionGiftList($page_index, $page_size, $condition);
        return $list;
    }
    return view($this->style . "Promotion/giftApplyList");
}

public
function platformDiscountApplyList()
{
    if (request()->isAjax()) {
        $page_index = request()->post("page_index", 1);
        $page_size = request()->post("page_size", PAGESIZE);
        $search_text = request()->post('search_text');
        $gift = new PromotionService();
        $condition = array(
            "status" => 1,
            "type" => array('in', [2, 3]),
            "level" => 1,
        );
        $list = $gift->getPromotionDiscountList($page_index, $page_size, $condition);
        return $list;
    }
    return view($this->style . "Promotion/platformDiscountApplyList");
}

public
function agreeGroup()
{
    if (request()->isAjax()) {
        $discount = new NsGroupModel();
        $id = isset($_POST['id']) ? $_POST['id'] : '';

        //todo need notify to settimer
        $is_win = strtoupper(substr(PHP_OS, 0, 3)) === 'WIN' ? 1 : 0;

        //暂时根据环境区分
        if ($is_win) {

            $url = "http://127.0.0.1:8011/ziyoutechan/schedule/groupop";
        } else {
            $url = "https://www.weiruikj.cn/ziyoutechan/schedule/groupop";
        }
        $parm = array(
            "id" => $id,
            "action" => 1,
        );

        $response = http_do_get($url, $parm);

        $res = 0;
        Log::record("agreeGroup with url = " . $url . "responese = " . $response);
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

public
function disagreeGroup()
{
    if (request()->isAjax()) {
        $discount = new NsGroupModel();
        $id = isset($_POST['id']) ? $_POST['id'] : '';

        $data = array(
            "status" => 3
        );
        $res = $discount->save($data, ["group_order_id" => $id]);

        return AjaxReturn($res);
    }
}

public
function groupApplyList()
{
    if (request()->isAjax()) {
        $page_index = request()->post("page_index", 1);
        $page_size = request()->post("page_size", PAGESIZE);
        $search_text = request()->post('search_text');
        $gift = new PromotionService();
        $condition = array(
            "status" => 1,
            "type" => 2,
        );
        $list = $gift->getPromotionGroupList($page_index, $page_size, $condition);
        return $list;
    }
    return view($this->style . "Promotion/groupApplyList");
}

public
function discountApplyList()
{
    if (request()->isAjax()) {
        $page_index = request()->post("page_index", 1);
        $page_size = request()->post("page_size", PAGESIZE);
        $search_text = request()->post('search_text');
        $gift = new PromotionService();
        $condition = array(
            "status" => 1,
            "type" => 1,
        );
        $list = $gift->getPromotionDiscountList($page_index, $page_size, $condition);
        return $list;
    }
    return view($this->style . "Promotion/discountApplyList");
}


public
function agreeGift()
{
    if (request()->isAjax()) {
        $discount = new NsPromotionGiftModel();
        $giftid = isset($_POST['giftid']) ? $_POST['giftid'] : '';

        //todo need notify to settimer

        $is_win = strtoupper(substr(PHP_OS, 0, 3)) === 'WIN' ? 1 : 0;

        //暂时根据环境区分
        if ($is_win) {

            $url = "http://127.0.0.1:8011/ziyoutechan/schedule/giftop";
        } else {
            $url = "https://www.weiruikj.cn/ziyoutechan/schedule/giftop";
        }


        $parm = array(
            "id" => $giftid,
            "action" => 1,
        );

        $response = http_do_get($url, $parm);

        Log::record("agreeGift with url = " . $url . "responese = " . $response);

        $res = 0;

        if ($response) {
            $responsejson = json_decode($response,true);

            if($responsejson && array_key_exists("returncode",$responsejson) && $responsejson["returncode"] == 0  )
            {
                $res = 1;
            }
        }


        return AjaxReturn($res);
    }
}

public
function disagreeGift()
{
    if (request()->isAjax()) {
        $discount = new NsPromotionGiftModel();
        $giftid = isset($_POST['giftid']) ? $_POST['giftid'] : '';

        $data = array(
            "status" => 3
        );
        $res = $discount->save($data, ["gift_id" => $giftid]);

        return AjaxReturn($res);
    }
}


public
function agreeDiscount()
{
    if (request()->isAjax()) {
        $discount = new NsPromotionDiscountModel();
        $id = isset($_POST['id']) ? $_POST['id'] : '';
        //todo need notify to settimer
        $is_win = strtoupper(substr(PHP_OS, 0, 3)) === 'WIN' ? 1 : 0;

        //暂时根据环境区分
        if ($is_win) {

            $url = "http://127.0.0.1:8011/ziyoutechan/schedule/discountop";
        } else {
            $url = "https://www.weiruikj.cn/ziyoutechan/schedule/discountop";
        }
        $parm = array(
            "id" => $id,
            "action" => 1,
        );

        $response = http_do_get($url, $parm);
        $res = 0;
        Log::record("agreeDiscount with url = " . $url . "responese = " . $response);
        if ($response) {
            $responsejson = json_decode($response,true);

            if($responsejson && array_key_exists("returncode",$responsejson) && $responsejson["returncode"] == 0  )
            {
                $res = 1;
            }
        }


        return AjaxReturn($res);
    }
}

public
function disagreeDiscount()
{
    if (request()->isAjax()) {
        $discount = new NsPromotionDiscountModel();
        $id = isset($_POST['id']) ? $_POST['id'] : '';

        $data = array(
            "status" => 3
        );
        $res = $discount->save($data, ["discount_id" => $id]);

        return AjaxReturn($res);
    }
}


public
function agreePlatformDiscount()
{
    if (request()->isAjax()) {
        $discount = new NsPromotionDiscountModel();
        $id = isset($_POST['id']) ? $_POST['id'] : '';


        $discount_data = $discount->getInfo(["discount_id" => $id]);

        if ($discount_data["type"] == 2) {

            $is_win = strtoupper(substr(PHP_OS, 0, 3)) === 'WIN' ? 1 : 0;

            //暂时根据环境区分
            if ($is_win) {

                $url = "http://127.0.0.1:8011/ziyoutechan/schedule/discountop";
            } else {
                $url = "https://www.weiruikj.cn/ziyoutechan/schedule/discountop";
            }
            $parm = array(
                "id" => $id,
                "action" => 1,
            );

            $response = http_do_get($url, $parm);
            $res = 0;
            Log::record("agreeDiscount with url = " . $url . "responese = " . $response);
            if ($response) {
                $responsejson = json_decode($response,true);

                if($responsejson && array_key_exists("returncode",$responsejson) && $responsejson["returncode"] == 0  )
                {
                    $res = 1;
                }
            }
        }

        //todo need notify to settimer


        return AjaxReturn($res);
    }
}

public
function disagreePlatformDiscount()
{
    if (request()->isAjax()) {
        $discount = new NsPromotionDiscountModel();
        $id = isset($_POST['id']) ? $_POST['id'] : '';

        $data = array(
            "status" => 3
        );
        $res = $discount->save($data, ["discount_id" => $id]);

        return AjaxReturn($res);
    }
}

/**
 * 赠品列表
 * wzy
 */
public
function giftList()
{
    if (request()->isAjax()) {
        $page_index = request()->post("page_index", 1);
        $page_size = request()->post("page_size", PAGESIZE);
        $search_text = request()->post('search_text');
        $gift = new PromotionService();
        $condition = array(
            'shop_id' => $this->instance_id,
            'gift_name' => array(
                'like',
                '%' . $search_text . '%'
            )
        );
        $list = $gift->getPromotionGiftList($page_index, $page_size, $condition);
        return $list;
    }
    return view($this->style . "Promotion/giftList");
}

/**
 * 添加赠品
 *
 * @return \think\response\View
 */
public
function addGift()
{
    if (request()->isAjax()) {
        $shop_id = $this->instance_id;
        $gift_name = $_POST['gift_name'];
        $start_time = $_POST['start_time'];
        $end_time = $_POST['end_time'];
        $days = $_POST['days'];
        $max_num = $_POST['max_num'];
        $goods_id_array = $_POST['goods_id_array'];
        $gift = new PromotionService();
        $res = $gift->addPromotionGift($shop_id, $gift_name, $start_time, $end_time, $days, $max_num, $goods_id_array);
        return AjaxReturn($res);
    }
    return view($this->style . "Promotion/addGift");
}

/**
 * 修改赠品
 *
 * @return \think\response\View
 */
public
function updateGift()
{
    $gift = new PromotionService();
    if (request()->isAjax()) {
        $gift_id = $_POST['gift_id'];
        $shop_id = $this->instance_id;
        $gift_name = $_POST['gift_name'];
        $start_time = $_POST['start_time'];
        $end_time = $_POST['end_time'];
        $days = $_POST['days'];
        $max_num = $_POST['max_num'];
        $goods_id_array = $_POST['goods_id_array'];
        $res = $gift->updatePromotionGift($gift_id, $shop_id, $gift_name, $start_time, $end_time, $days, $max_num, $goods_id_array);
        return AjaxReturn($res);
    } else {
        $gift_id = isset($_GET['gift_id']) ? $_GET['gift_id'] : 0;
        $info = $gift->getPromotionGiftDetail($gift_id);
        $this->assign('info', $info);
        return view($this->style . "Promotion/updateGift");
    }
}

/**
 * 获取赠品 详情
 *
 * @param unknown $gift_id
 */
public
function getGiftInfo($gift_id)
{
    $gift = new PromotionService();
    $info = $gift->getPromotionGiftDetail($gift_id);
    return $info;
}


/**
 * 获取限时折扣；列表
 */
public
function getFestivalActivityList()
{
    if (request()->isAjax()) {
        $page_index = request()->post("page_index", 1);
        $page_size = request()->post('page_size', PAGESIZE);
        $promotion_discount = new NsPlatformActivityModel();
        $condition = array(

            "type" => 3
        );
        $list = $promotion_discount->pageQuery($page_index, $page_size, $condition, 'create_time desc', '*');
        return $list;

        return $list;
    }


    return view($this->style . "Promotion/getFestivalActivityList");
}


public
function getAlbumActivityList()
{
    if (request()->isAjax()) {
        $page_index = request()->post("page_index", 1);
        $page_size = request()->post('page_size', PAGESIZE);
        $promotion_discount = new NsPlatformActivityModel();
        $condition = array(
            "type" => 2


        );
        $list = $promotion_discount->pageQuery($page_index, $page_size, $condition, 'create_time desc', '*');
        return $list;

        return $list;
    }


    return view($this->style . "Promotion/getAlbumActivityList");
}

/**
 * 添加限时折扣
 */
public
function addActivityFestival()
{
    if (request()->isAjax()) {
        $discount = new PromotionService();
        $discount_name = isset($_POST['discount_name']) ? $_POST['discount_name'] : '';
        $start_time = isset($_POST['start_time']) ? $_POST['start_time'] : '';
        $end_time = isset($_POST['end_time']) ? $_POST['end_time'] : '';
        $type = isset($_POST['type']) ? $_POST['type'] : '';
        $pic = isset($_POST['pic']) ? $_POST['pic'] : '';
        $is_visible = isset($_POST['is_visible']) ? $_POST['is_visible'] : '';
        $is_open = isset($_POST['is_open']) ? $_POST['is_open'] : '';
        $description = isset($_POST['description']) ? $_POST['description'] : '';
        $sort = isset($_POST['sort']) ? $_POST['sort'] : '';
        $retval = $discount->addPromotionActivity($discount_name, $start_time, $end_time, $description, $type, $pic, $is_visible, $is_open, $sort);
        return AjaxReturn($retval);
    }
    return view($this->style . "Promotion/addActivityFestival");
}

/**
 * 修改限时折扣
 */
public
function updateActivityFestival()
{
    if (request()->isAjax()) {
        $discount = new PromotionService();
        $id = isset($_POST['id']) ? $_POST['id'] : '';
        $discount = new PromotionService();
        $discount_name = isset($_POST['discount_name']) ? $_POST['discount_name'] : '';
        $start_time = isset($_POST['start_time']) ? $_POST['start_time'] : '';
        $end_time = isset($_POST['end_time']) ? $_POST['end_time'] : '';
        $type = isset($_POST['type']) ? $_POST['type'] : '';
        $pic = isset($_POST['pic']) ? $_POST['pic'] : '';
        $is_visible = isset($_POST['is_visible']) ? $_POST['is_visible'] : '';
        $is_open = isset($_POST['is_open']) ? $_POST['is_open'] : '';
        $description = isset($_POST['description']) ? $_POST['description'] : '';
        $sort = isset($_POST['sort']) ? $_POST['sort'] : '';
        $retval = $discount->updatePromotionActivity($id, $description, $pic, $is_visible, $is_open, $sort);
        return AjaxReturn($retval);
    }
    $info = $this->getActivityDetail();

    $this->assign("info", $info);
    return view($this->style . "Promotion/updateActivityFestival");
}


public
function addActivityAlbum()
{
    if (request()->isAjax()) {
        $discount = new PromotionService();
        $discount_name = isset($_POST['discount_name']) ? $_POST['discount_name'] : '';
        $start_time = isset($_POST['start_time']) ? $_POST['start_time'] : '';
        $end_time = isset($_POST['end_time']) ? $_POST['end_time'] : '';
        $type = isset($_POST['type']) ? $_POST['type'] : '';
        $pic = isset($_POST['pic']) ? $_POST['pic'] : '';
        $is_visible = isset($_POST['is_visible']) ? $_POST['is_visible'] : '';
        $is_open = isset($_POST['is_open']) ? $_POST['is_open'] : '';
        $description = isset($_POST['description']) ? $_POST['description'] : '';
        $sort = isset($_POST['sort']) ? $_POST['sort'] : '';
        $retval = $discount->addPromotionActivity($discount_name, $start_time, $end_time, $description, $type, $pic, $is_visible, $is_open, $sort);
        return AjaxReturn($retval);
    }
    return view($this->style . "Promotion/addActivityAlbum");
}

/**
 * 修改限时折扣
 */
public
function updateActivityAlbum()
{
    if (request()->isAjax()) {
        $discount = new PromotionService();
        $id = isset($_POST['id']) ? $_POST['id'] : '';
        $discount = new PromotionService();
        $discount_name = isset($_POST['discount_name']) ? $_POST['discount_name'] : '';
        $start_time = isset($_POST['start_time']) ? $_POST['start_time'] : '';
        $end_time = isset($_POST['end_time']) ? $_POST['end_time'] : '';
        $type = isset($_POST['type']) ? $_POST['type'] : '';
        $pic = isset($_POST['pic']) ? $_POST['pic'] : '';
        $is_visible = isset($_POST['is_visible']) ? $_POST['is_visible'] : '';
        $is_open = isset($_POST['is_open']) ? $_POST['is_open'] : '';
        $description = isset($_POST['description']) ? $_POST['description'] : '';
        $sort = isset($_POST['sort']) ? $_POST['sort'] : '';
        $retval = $discount->updatePromotionActivity($id, $description, $pic, $is_visible, $is_open, $sort);
        return AjaxReturn($retval);
    }
    $info = $this->getActivityDetail();

    $this->assign("info", $info);
    return view($this->style . "Promotion/updateActivityAlbum");
}


/**
 * 获取限时折扣详情
 */
public
function getDiscountDetail()
{
    $discount_id = isset($_GET['discount_id']) ? $_GET['discount_id'] : '';
    if (empty($discount_id)) {
        $this->error("没有获取到折扣信息");
    }
    $discount = new PromotionService();
    $detail = $discount->getPromotionDiscountDetail($discount_id);
    return $detail;
}

public
function getActivityDetail()
{
    $discount_id = isset($_GET['id']) ? $_GET['id'] : '';
    if (empty($discount_id)) {
        $this->error("没有获取到折扣信息");
    }
    $discount = new NsPlatformActivityModel();
    $detail = $discount->getInfo(["id" => $discount_id]);
    return $detail;
}

/**
 * 获取满减送详情
 */
public
function getMansongDetail()
{
    $mansong_id = isset($_GET['mansong_id']) ? $_GET['mansong_id'] : '';
    if (empty($mansong_id)) {
        $this->error("没有获取到满减送信息");
    }
    $mansong = new PromotionService();
    $detail = $mansong->getPromotionMansongDetail($mansong_id);
    return $detail;
}

/**
 * 删除限时折扣
 */
public
function delDiscount()
{
    $discount_id = isset($_POST['discount_id']) ? $_POST['discount_id'] : '';
    if (empty($discount_id)) {
        $this->error("没有获取到折扣信息");
    }
    $discount = new PromotionService();
    $res = $discount->delPromotionDiscount($discount_id);
    return AjaxReturn($res);
}

/**
 * 关闭正在进行的限时折扣
 */


public
function closeActivity()
{
    if (request()->isAjax()) {
        $discount = new NsPromotionDiscountModel();
        $id = isset($_POST['id']) ? $_POST['id'] : '';


        $is_win = strtoupper(substr(PHP_OS, 0, 3)) === 'WIN' ? 1 : 0;

        //暂时根据环境区分
        if ($is_win) {

            $url = "http://127.0.0.1:8011/ziyoutechan/schedule/discountop";
        } else {
            $url = "https://www.weiruikj.cn/ziyoutechan/schedule/discountop";
        }
        $parm = array(
            "id" => $id,
            "action" => 2,
        );

        $response = http_do_get($url, $parm);

        $res = 0;

        if ($response) {
            $responsejson = json_decode($response,true);

            if($responsejson && array_key_exists("returncode",$responsejson) && $responsejson["returncode"] == 0  )
            {
                $data = array(
                    "status" => 0
                );
                $res = $discount->save($data, ["discount_id" => $id]);

                $res = $discount->save($data, ["pid" => $id]);


                $discountgoods = new NsPromotionDiscountGoodsModel();

                $discountgoods->save($data, ["pid" => $id]);
            }
        }


        return AjaxReturn($res);
    }
}
}