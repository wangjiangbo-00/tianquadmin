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
namespace app\admin\controller;

use data\model\NsGroupModel;
use data\model\NsPlatformActivityModel;
use data\model\NsPromotionDiscountModel;
use data\model\NsPromotionGiftModel;
use data\service\Config;
use data\service\promotion\PromoteRewardRule;
use data\service\Promotion as PromotionService;
use data\service\Goods as GoodsService;

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

    /**
     * 优惠券类型列表
     *
     * @return multitype:number unknown |Ambigous <\think\response\View, \think\response\$this, \think\response\View>
     */
    public function couponTypeList()
    {
        if (request()->isAjax()) {
            $page_index = request()->post("page_index", 1);
            $page_size = request()->post("page_size", PAGESIZE);
            $search_text = request()->post('search_text', '');
            $coupon = new PromotionService();
            $condition = array(
                'shop_id' => $this->instance_id,
                'coupon_name' => array(
                    'like',
                    '%' . $search_text . '%'
                )
            );
            $list = $coupon->getCouponTypeList($page_index, $page_size, $condition);
            return $list;
        } else {
            return view($this->style . "Promotion/couponTypeList");
        }
    }

    /**
     * 添加优惠券类型
     */
    public function addCouponType()
    {
        if (request()->isAjax()) {
            $coupon_name = $_POST["coupon_name"];
            $money = $_POST["money"];
            $count = $_POST["count"];
            $max_fetch = $_POST["max_fetch"];
            $at_least = $_POST["at_least"];
            $need_user_level = $_POST["need_user_level"];
            $range_type = $_POST["range_type"];
            $start_time = $_POST["start_time"];
            $end_time = $_POST["end_time"];
            $is_show = request()->post('is_show', '');
            $goods_list = $_POST["goods_list"];
            $coupon = new PromotionService();
            $retval = $coupon->addCouponType($coupon_name, $money, $count, $max_fetch, $at_least, $need_user_level, $range_type, $start_time, $end_time, $is_show, $goods_list);
            return AjaxReturn($retval);
        } else {
            return view($this->style . "Promotion/addCouponType");
        }
    }

    public function updateCouponType()
    {
        $coupon = new PromotionService();
        if (request()->isAjax()) {
            $coupon_type_id = $_POST["coupon_type_id"];
            $coupon_name = $_POST["coupon_name"];
            $money = $_POST["money"];
            $count = $_POST["count"];
            $repair_count = $_POST["repair_count"];
            $max_fetch = $_POST["max_fetch"];
            $at_least = $_POST["at_least"];
            $need_user_level = $_POST["need_user_level"];
            $range_type = $_POST["range_type"];
            $start_time = $_POST["start_time"];
            $end_time = $_POST["end_time"];
            $is_show = request()->post('is_show', '');
            $goods_list = $_POST["goods_list"];
            $coupon = new PromotionService();
            $retval = $coupon->updateCouponType($coupon_type_id, $coupon_name, $money, $count, $repair_count, $max_fetch, $at_least, $need_user_level, $range_type, $start_time, $end_time, $is_show, $goods_list);
            return AjaxReturn($retval);
        } else {
            $coupon_type_id = isset($_GET['coupon_type_id']) ? $_GET['coupon_type_id'] : 0;
            if ($coupon_type_id == 0) {
                $this->error("没有获取到类型");
            }
            $shop_id = $this->instance_id;
            $coupon_type_data = $coupon->getCouponTypeDetail($coupon_type_id);
            if(empty($coupon_type_data['coupon_type_id']) || $coupon_type_data['shop_id'] != $this->instance_id)
            {
                $this->error("优惠券活动不存在或者当前用户无权限!");
            }
            $goods_id_array = array();
            foreach ($coupon_type_data['goods_list'] as $k => $v) {
                $goods_id_array[] = $v['goods_id'];
            }
            $coupon_type_data['goods_id_array'] = $goods_id_array;
            $this->assign("coupon_type_info", $coupon_type_data);
            return view($this->style . "Promotion/updateCouponType");
        
//             }else{
//                 $this->error("该优惠券不存在");
//             }
                
           
        }
    }

    /**
     * 获取优惠券详情
     */
    public function getCouponTypeInfo()
    {
        $coupon = new PromotionService();
        $coupon_type_id = $_POST['coupon_type_id'];
        $coupon_type_data = $coupon->getCouponTypeDetail($coupon_type_id);
        return $coupon_type_data;
    }

    /**
     * 功能：积分管理
     * 创建：左骐羽
     * 时间：2016年12月8日15:02:16
     */
    public function pointConfig()
    {
        $pointConfig = new PromotionService();
        if (request()->isAjax()) {
            $convert_rate = isset($_POST['convert_rate']) ? $_POST['convert_rate'] : '';
            $is_open = isset($_POST['is_open']) ? $_POST['is_open'] : 0;
            $desc = isset($_POST['desc']) ? $_POST['desc'] : 0;
            $retval = $pointConfig->setPointConfig($convert_rate, $is_open, $desc);
            return AjaxReturn($retval);
        }
        $child_menu_list = array(
            array(
                'url' => "promotion/pointconfig",
                'menu_name' => "积分管理",
                "active" => 1
            ),
            array(
                'url' => "promotion/integral",
                'menu_name' => "积分奖励",
                "active" => 0
            )
        );
        $this->assign('child_menu_list', $child_menu_list);
        $pointconfiginfo = $pointConfig->getPointConfig();
        $this->assign("pointconfiginfo", $pointconfiginfo);
        return view($this->style . "Promotion/pointConfig");
    }




    public function giftList()
    {
        if (request()->isAjax()) {
            $page_index = request()->post("page_index", 1);
            $page_size = request()->post("page_size", PAGESIZE);
            $search_text = request()->post('search_text');
            $gift = new PromotionService();
            $condition = array(
                'ownerid' => $this->instance_id,
                'giftfrom' => 0,

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
    public function addGift()
    {
        if (request()->isAjax()) {
            $shop_id = $this->instance_id;
            $shopname = $this->instance_name;
            $gift_name = $_POST['gift_name'];
            $start_time = $_POST['start_time'];
            $end_time = $_POST['end_time'];
            $days = $_POST['days'];
            $max_num = $_POST['max_num'];
            $goods_id = $_POST['goods_id'];


            $mode = $_POST['mode'];
            $parms = $_POST['parms'];

            $remarks = isset($_POST['remarks']) ? $_POST['remarks'] : "";
            $gift = new PromotionService();
            $res = $gift->addPromotionGift($shop_id, $gift_name, $start_time, $end_time, $days, $max_num, $goods_id,$shopname,$remarks,$mode,$parms);
            return AjaxReturn($res);
        }
        $page_index = request()->post("page_index", 1);
        $page_size = request()->post("page_size", PAGESIZE);
        $get_condition = isset($_POST['condition'])? $_POST['condition']: '';
        $condition['shop_id'] = $this->instance_id;

        $condition['state'] = 1;
        $condition['shop_state'] = 1;
        $goods_detail = new GoodsService();
        $result = $goods_detail->getSearchGoodsList($page_index, $page_size, $condition);
        $this->assign("goodslist", $result["data"]);
        return view($this->style . "Promotion/addGift");
    }

    /**
     * 修改赠品
     *
     * @return \think\response\View
     */
    public function updateGift()
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
            $goods_id = $_POST['goods_id'];

            $mode = $_POST['mode'];
            $parms = $_POST['parms'];

            $remarks = isset($_POST['remarks']) ? $_POST['remarks'] : "";
            $res = $gift->updatePromotionGift($gift_id, $shop_id, $gift_name, $start_time, $end_time, $days, $max_num,$goods_id ,$remarks,$mode,$parms);
            return AjaxReturn($res);
        } else {
            $gift_id = isset($_GET['gift_id']) ? $_GET['gift_id'] : 0;
            $info = $gift->getPromotionGiftDetail($gift_id);
            $this->assign('info', $info);
            $page_index = request()->post("page_index", 1);
            $page_size = request()->post("page_size", PAGESIZE);
            $get_condition = isset($_POST['condition'])? $_POST['condition']: '';
            $condition['shop_id'] = $this->instance_id;

            $condition['state'] = 1;
            $condition['shop_state'] = 1;
            $goods_detail = new GoodsService();
            $result = $goods_detail->getSearchGoodsList($page_index, $page_size, $condition);
            $this->assign("goodslist", $result["data"]);
            return view($this->style . "Promotion/updateGift");
        }
    }

    /**
     * 获取赠品 详情
     *
     * @param unknown $gift_id            
     */
    public function getGiftDetail()
    {
        $id = isset($_POST['id']) ? $_POST['id'] : '';
        $gift = new PromotionService();
        $info = $gift->getPromotionGiftDetail($id);
        return $info;
    }


    public function deleteGift()
    {
        if (request()->isAjax()) {

            $giftid = isset($_POST['giftid']) ? $_POST['giftid'] : '';

            $gift = new PromotionService();
            $res = $gift->deleteGift($giftid);

            return AjaxReturn($res);
        }
    }

    public function submitGift()
    {
        if (request()->isAjax()) {
            $gift = new NsPromotionGiftModel();
            $giftid = isset($_POST['giftid']) ? $_POST['giftid'] : '';

            $data = array(
                "status" => 1
            );
            $res = $gift->save($data,["gift_id" => $giftid]);

            return AjaxReturn($res);
        }
    }

    public function recallGift()
    {
        if (request()->isAjax()) {
            $gift = new NsPromotionGiftModel();
            $giftid = isset($_POST['giftid']) ? $_POST['giftid'] : '';

            $data = array(
                "status" => 0
            );
            $res = $gift->save($data,["gift_id" => $giftid]);

            return AjaxReturn($res);
        }
    }

    public function closeGift()
    {
        if (request()->isAjax()) {
            $gift = new NsPromotionGiftModel();
            $giftid = isset($_POST['giftid']) ? $_POST['giftid'] : '';


            $is_win =   strtoupper(substr(PHP_OS,0,3))==='WIN'?1:0;

            //暂时根据环境区分
            if($is_win)
            {

                $url = "http://127.0.0.1:8011/ziyoutechan/schedule/giftop";
            }
            else
            {
                $url = "https://www.weiruikj.cn/ziyoutechan/schedule/giftop";
            }
            $parm = array(
                "id"=>$giftid,
                "action"=>2,
            );

            $response = http_do_get($url,$parm);

            $res = 0;

            if ($response) {
                $responsejson = json_decode($response,true);

                if($responsejson && array_key_exists("returncode",$responsejson) && $responsejson["returncode"] == 0  )
                {
                    $data = array(
                        "status" => 0
                    );
                    $res = $gift->save($data,["gift_id" => $giftid]);
                }
            }



            return AjaxReturn($res);
        }
    }



    /**
     * 获取限时折扣；列表
     */
    public function getDiscountList()
    {
        if (request()->isAjax()) {
            $page_index = request()->post("page_index", 1);
            $page_size = request()->post('page_size', PAGESIZE);
            $search_text = isset($_POST['search_text']) ? $_POST['search_text'] : '';
            $status = request()->post('status', '');
            $discount = new PromotionService();
            
            $condition = array(
                'shop_id' => $this->instance_id,
                'type' => 1,
                'discount_name' => array(
                    'like',
                    '%' . $search_text . '%'
                )
            );
            if ($status !== '-1') {
                $condition['status'] = $status;
                $list = $discount->getPromotionDiscountList($page_index, $page_size, $condition);
            } else {
                $list = $discount->getPromotionDiscountList($page_index, $page_size, $condition);
            }
            
            return $list;
        }
        
        $status = request()->get('status', - 1);
        $this->assign("status", $status);
        $child_menu_list = array(
            array(
                'url' => "promotion/getdiscountList",
                'menu_name' => "全部",
                "active" => $status == '-1' ? 1 : 0
            ),
            array(
                'url' => "promotion/getdiscountList?status=0",
                'menu_name' => "未发布",
                "active" => $status == 0 ? 1 : 0
            ),
            array(
                'url' => "promotion/getdiscountList?status=1",
                'menu_name' => "进行中",
                "active" => $status == 1 ? 1 : 0
            ),
            array(
                'url' => "promotion/getdiscountList?status=3",
                'menu_name' => "已关闭",
                "active" => $status == 3 ? 1 : 0
            ),
            array(
                'url' => "promotion/getdiscountList?status=4",
                'menu_name' => "已结束",
                "active" => $status == 4 ? 1 : 0
            )
        );
        $this->assign('child_menu_list', $child_menu_list);
        
        return view($this->style . "Promotion/getDiscountList");
    }

    /**
     * 获取限时折扣；列表
     */
    public function getPlatformDiscountTypes()
    {
        if (request()->isAjax()) {
            $page_index = request()->post("page_index", 1);
            $page_size = request()->post('page_size', PAGESIZE);

            $discount = new NsPlatformActivityModel();

            $condition = array(

                'is_open' =>1,
                'type' =>array(
                    'in',
                    [2,3]
                ),

            );
            $list = $discount->pageQuery($page_index, $page_size, $condition, 'create_time desc',"*");
            return $list;
        }


    }
    /**
     * 获取限时折扣；列表
     */
    public function getPlatformDiscountList()
    {
        if (request()->isAjax()) {
            $page_index = request()->post("page_index", 1);
            $page_size = request()->post('page_size', PAGESIZE);
            $search_text = isset($_POST['search_text']) ? $_POST['search_text'] : '';
            $status = request()->post('status', '');
            $discount = new PromotionService();

            $condition = array(
                'shop_id' =>$this->instance_id,
                'type' =>array(
                    'in',
                    [2,3]
                ),
                'discount_name' => array(
                    'like',
                    '%' . $search_text . '%'
                )
            );
            if ($status !== '-1') {
                $condition['status'] = $status;
                $list = $discount->getPromotionDiscountList($page_index, $page_size, $condition);
            } else {
                $list = $discount->getPromotionDiscountList($page_index, $page_size, $condition);
            }

            return $list;
        }

        $status = request()->get('status', - 1);
        $this->assign("status", $status);
        $child_menu_list = array(
            array(
                'url' => "promotion/getPlatformdiscountList",
                'menu_name' => "全部",
                "active" => $status == '-1' ? 1 : 0
            ),
            array(
                'url' => "promotion/getPlatformdiscountList?status=0",
                'menu_name' => "未发布",
                "active" => $status == 0 ? 1 : 0
            ),
            array(
                'url' => "promotion/getPlatformdiscountList?status=1",
                'menu_name' => "进行中",
                "active" => $status == 1 ? 1 : 0
            ),
            array(
                'url' => "promotion/getPlatformdiscountList?status=3",
                'menu_name' => "已关闭",
                "active" => $status == 3 ? 1 : 0
            ),
            array(
                'url' => "promotion/getPlatformdiscountList?status=4",
                'menu_name' => "已结束",
                "active" => $status == 4 ? 1 : 0
            )
        );
        $this->assign('child_menu_list', $child_menu_list);

        return view($this->style . "Promotion/getPlatformDiscountList");
    }

    /**
     * 添加限时折扣
     */
    public function addDiscount()
    {
        if (request()->isAjax()) {
            $discount = new PromotionService();
            $discount_name = isset($_POST['discount_name']) ? $_POST['discount_name'] : '';
            $start_time = isset($_POST['start_time']) ? $_POST['start_time'] : '';
            $end_time = isset($_POST['end_time']) ? $_POST['end_time'] : '';
            $remark = '';
            $goods_id_array = isset($_POST['goods_id_array']) ? $_POST['goods_id_array'] : '';
            $retval = $discount->addPromotiondiscount($discount_name, $start_time, $end_time, $remark, $goods_id_array,0,1,1);
            return AjaxReturn($retval);
        }


        return view($this->style . "Promotion/addDiscount");
    }


    public function addPlatformDiscount()
    {
        if (request()->isAjax()) {
            $discount = new PromotionService();
            $discount_name = isset($_POST['discount_name']) ? $_POST['discount_name'] : '';
            $start_time = isset($_POST['start_time']) ? $_POST['start_time'] : '';
            $end_time = isset($_POST['end_time']) ? $_POST['end_time'] : '';
            $pid = isset($_POST['pid']) ? $_POST['pid'] : '';

            if(!$pid)
            {
                $this->error("参数出差");
            }

            $discount = new PromotionService();

            $pdiscount = $discount->getPromotionDiscountDetail($pid);

            if($pdiscount["type"] == 3)
            {
                $start_time = $pdiscount["start_time"] ;
                $end_time = $pdiscount["end_time"] ;
            }
            $remark = '';
            $goods_id_array = isset($_POST['goods_id_array']) ? $_POST['goods_id_array'] : '';
            $retval = $discount->addPromotiondiscount($pdiscount["discount_name"], $start_time, $end_time, $remark, $goods_id_array,
                $pid,$pdiscount["type"],1);
            return AjaxReturn($retval);
        }


        return view($this->style . "Promotion/addPlatformDiscount");
    }

    /**
     * 赠品列表
     * wzy
     */


    /**
     * 修改限时折扣
     */
    public function updateDiscount()
    {   
        $discount = new PromotionService();
        if (request()->isAjax()) {
            $discount = new PromotionService();
            $discount_id = isset($_POST['discount_id']) ? $_POST['discount_id'] : '';
            $discount_name = isset($_POST['discount_name']) ? $_POST['discount_name'] : '';
            $start_time = isset($_POST['start_time']) ? $_POST['start_time'] : '';
            $end_time = isset($_POST['end_time']) ? $_POST['end_time'] : '';
            $remark = '';
            $goods_id_array = isset($_POST['goods_id_array']) ? $_POST['goods_id_array'] : '';
            $retval = $discount->updatePromotionDiscount($discount_id, $discount_name, $start_time, $end_time, $remark, $goods_id_array);
            return AjaxReturn($retval);
        }
        $discount_id = request()->get('discount_id','');
        if (empty($discount_id)) {
            $this->error("没有获取到折扣信息");
        }
        $info = $discount->getPromotionDiscountDetail($discount_id);
        if(empty($info['discount_id']) || $info['shop_id'] != $this->instance_id)
        {
            $this->error("限时折扣活动不存在或者当前用户无权限!");
        }
         if (! empty($info['goods_list'])) {
                foreach ($info['goods_list'] as $k => $v) {
                    $goods_id_array[] = $v['goods_id'];
                }
            }
            $info['goods_id_array'] = $goods_id_array;
            $this->assign("info", $info);
            return view($this->style . "Promotion/updateDiscount");
              
        
        
       
    }


    /**
     * 赠品列表
     * wzy
     */


    /**
     * 修改限时折扣
     */
    public function submitDiscount()
    {
        if (request()->isAjax()) {
            $discount = new NsPromotionDiscountModel();
            $discount_id = isset($_POST['id']) ? $_POST['id'] : '';

            $data = array(
                "status" => 1
            );
            $res = $discount->save($data,["discount_id" => $discount_id]);

            return AjaxReturn($res);
        }
    }

    public function recallDiscount()
    {
        if (request()->isAjax()) {
            $discount = new NsPromotionDiscountModel();
            $discount_id = isset($_POST['id']) ? $_POST['id'] : '';

            $data = array(
                "status" => 0
            );
            $res = $discount->save($data,["discount_id" => $discount_id]);

            return AjaxReturn($res);
        }
    }

    public function updatePlatformDiscount()
    {
        $discount = new PromotionService();
        if (request()->isAjax()) {
            $discount = new PromotionService();
            $discount_id = isset($_POST['discount_id']) ? $_POST['discount_id'] : '';
            $discount_name = isset($_POST['discount_name']) ? $_POST['discount_name'] : '';
            $start_time = isset($_POST['start_time']) ? $_POST['start_time'] : '';
            $end_time = isset($_POST['end_time']) ? $_POST['end_time'] : '';
            $remark = '';
            $goods_id_array = isset($_POST['goods_id_array']) ? $_POST['goods_id_array'] : '';
            $retval = $discount->updatePromotionDiscount($discount_id, $discount_name, $start_time, $end_time, $remark, $goods_id_array);
            return AjaxReturn($retval);
        }
        $discount_id = request()->get('discount_id','');
        if (empty($discount_id)) {
            $this->error("没有获取到折扣信息");
        }
        $info = $discount->getPromotionDiscountDetail($discount_id);
        if(empty($info['discount_id']) )
        {
            $this->error("限时折扣活动不存在或者当前用户无权限!");
        }
        $goods_id_array = [];
        if (! empty($info['goods_list'])) {
            foreach ($info['goods_list'] as $k => $v) {
                $goods_id_array[] = $v['goods_id'];
            }
        }
        $info['goods_id_array'] = $goods_id_array;
        $this->assign("info", $info);
        return view($this->style . "Promotion/updatePlatformDiscount");




    }

    /**
     * 获取限时折扣详情
     */
    public function getDiscountDetail()
    {
        $id = isset($_POST['id']) ? $_POST['id'] : '';
        $discount = new PromotionService();
        $detail = $discount->getPromotionDiscountDetail($id);
        return $detail;
    }

    public function getGroupDetail($id)
    {
        $id = isset($_POST['id']) ? $_POST['id'] : '';
        $discount = new PromotionService();
        $detail = $discount->getPromotionGroupDetail($id);


        return $detail;
    }



    public function superGroupList()
    {
        if (request()->isAjax()) {
            $page_index = request()->post("page_index", 1);
            $page_size = request()->post("page_size", PAGESIZE);
            $search_text = request()->post('search_text');
            $status = request()->get('status', - 1);
            $gift = new PromotionService();

            if($status!=-1)
            {
                $condition = array(
                    'shop_id' => $this->instance_id,
                    'type' => 2,
                    "status"=>$status
                );
            }
            else
            {
                $condition = array(
                    'shop_id' => $this->instance_id,
                    'type' => 2,

                );
            }

            $list = $gift->getSuperGroupList($page_index, $page_size, $condition);
            return $list;
        }
        $status = request()->get('status', - 1);
        $this->assign("status", $status);
        $child_menu_list = array(
            array(
                'url' => "promotion/superGroupList",
                'menu_name' => "全部",
                "active" => $status == '-1' ? 1 : 0
            )
        );
        $this->assign('child_menu_list', $child_menu_list);
        return view($this->style . "Promotion/getGroupList");
    }


    /**
     * 添加限时折扣
     */
    public function addGroup()
    {
        if (request()->isAjax()) {
            $discount = new PromotionService();
            $name = isset($_POST['name']) ? $_POST['name'] : '';
            $start_time = isset($_POST['start_time']) ? $_POST['start_time'] : '';
            $end_time = isset($_POST['end_time']) ? $_POST['end_time'] : '';
            $goods_id = isset($_POST['goods_id']) ? $_POST['goods_id'] : '';
            $stage_format = isset($_POST['stage_format']) ? $_POST['stage_format'] : '';
            $require_num = isset($_POST['require_num']) ? $_POST['require_num'] : '';
            $retval = $discount->addPromotionGroup($name, $start_time, $end_time, $goods_id,$stage_format,$require_num);
            return AjaxReturn($retval);
        }

        $page_index = request()->post("page_index", 1);
        $page_size = request()->post("page_size", PAGESIZE);
        $get_condition = isset($_POST['condition'])? $_POST['condition']: '';
        $condition['shop_id'] = $this->instance_id;

        $condition['state'] = 1;

        $condition['shop_state'] = 1;
        $condition['type'] = 0; //团购限定需要时普通商品
        $goods_detail = new GoodsService();
        $result = $goods_detail->getSearchGoodsList($page_index, $page_size, $condition);
        $this->assign("goodslist", $result["data"]);
        return view($this->style . "Promotion/addGroup");
    }

    /**
     * 赠品列表
     * wzy
     */


    /**
     * 修改限时折扣
     */
    public function updateGroup()
    {
        $discount = new PromotionService();
        if (request()->isAjax()) {

            $discount = new PromotionService();
            $id= isset($_POST['id']) ? $_POST['id'] : '';
            $name = isset($_POST['name']) ? $_POST['name'] : '';
            $start_time = isset($_POST['start_time']) ? $_POST['start_time'] : '';
            $end_time = isset($_POST['end_time']) ? $_POST['end_time'] : '';
            $goods_id = isset($_POST['goods_id']) ? $_POST['goods_id'] : '';
            $stage_format = isset($_POST['stage_format']) ? $_POST['stage_format'] : '';
            $require_num = isset($_POST['require_num']) ? $_POST['require_num'] : '';
            $retval = $discount->updatePromotionGroup($id,$name, $start_time, $end_time, $goods_id,$stage_format,$require_num);
            return AjaxReturn($retval);
        }
        $discount_id = request()->get('id','');
        if (empty($discount_id)) {
            $this->error("没有获取到折扣信息");
        }


        $detail = $discount->getPromotionGroupDetail($discount_id);

        $format = $detail["stage_format"];

        $formatlist = explode(",",$format);
        $group_formats = [];
        foreach ($formatlist as $value)
        {
            $value_list = explode(":",$value);
            $group_format["num"] = $value_list[0];
            $group_format["discount"] = $value_list[1];
            $group_formats[] = $group_format;

        }
        $detail["group_formats"] = $group_formats;

        if(empty($info['group_order_id']) || $info['shop_id'] != $this->instance_id)
        {
            $this->error("限时折扣活动不存在或者当前用户无权限!");
        }

        $this->assign("info", $detail);

        $page_index = request()->post("page_index", 1);
        $page_size = request()->post("page_size", PAGESIZE);
        $get_condition = isset($_POST['condition'])? $_POST['condition']: '';
        $condition['shop_id'] = $this->instance_id;

        $condition['state'] = 1;
        $condition['shop_state'] = 1;
        $condition['type'] = 0; //团购限定需要时普通商品
        $goods_detail = new GoodsService();
        $result = $goods_detail->getSearchGoodsList($page_index, $page_size, $condition);
        $this->assign("goodslist", $result["data"]);
        return view($this->style . "Promotion/updateGroup");




    }


    public function deleteGroup()
    {
        if (request()->isAjax()) {

            $id = isset($_POST['id']) ? $_POST['id'] : '';

            $promotion = new PromotionService();
            $res = $promotion->deleteGroup($id);

            return AjaxReturn($res);
        }
    }

    public function submitGroup()
    {
        if (request()->isAjax()) {
            $gift = new NsGroupModel();
            $id = isset($_POST['id']) ? $_POST['id'] : '';

            $data = array(
                "status" => 1
            );
            $res = $gift->save($data,["group_order_id" => $id]);

            return AjaxReturn($res);
        }
    }

    public function recallGroup()
    {
        if (request()->isAjax()) {
            $gift = new NsGroupModel();
            $id = isset($_POST['id']) ? $_POST['id'] : '';

            $data = array(
                "status" => 0
            );
            $res = $gift->save($data,["group_order_id" => $id]);

            return AjaxReturn($res);
        }
    }

    public function closeGroup()
    {
        if (request()->isAjax()) {
            $gift = new NsGroupModel();
            $id = isset($_POST['id']) ? $_POST['id'] : '';

            $is_win =   strtoupper(substr(PHP_OS,0,3))==='WIN'?1:0;

            //暂时根据环境区分
            if($is_win)
            {

                $url = "http://127.0.0.1:8011/ziyoutechan/schedule/groupop";
            }
            else
            {
                $url = "https://www.weiruikj.cn/ziyoutechan/schedule/groupop";
            }

            $parm = array(
                "id"=>$id,
                "action"=>2,
            );

            $response = http_do_get($url,$parm);

            $res = 0;

            if ($response) {
                $responsejson = json_decode($response,true);

                if($responsejson && array_key_exists("returncode",$responsejson) && $responsejson["returncode"] == 0  )
                {

                    $data = array(
                        "status" => 0
                    );
                    $res = $gift->save($data,["group_order_id" => $id]);
                }
            }

            return AjaxReturn($res);
        }
    }

    /**
     * 获取满减送详情
     */
    public function getMansongDetail()
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
    public function delDiscount()
    {
        $discount_id = isset($_POST['id']) ? $_POST['id'] : '';
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
    public function closeDiscount()
    {
        if (request()->isAjax()) {
            $gift = new NsPromotionDiscountModel();
            $id= isset($_POST['id']) ? $_POST['id'] : '';


            $is_win =   strtoupper(substr(PHP_OS,0,3))==='WIN'?1:0;

            //暂时根据环境区分
            if($is_win)
            {

                $url = "http://127.0.0.1:8011/ziyoutechan/schedule/discountop";
            }
            else
            {
                $url = "https://www.weiruikj.cn/ziyoutechan/schedule/discountop";
            }
            $parm = array(
                "id"=>$id,
                "action"=>2,
            );

            $response = http_do_get($url,$parm);

            $res = 0;

            if ($response) {
                $responsejson = json_decode($response,true);

                if($responsejson && array_key_exists("returncode",$responsejson) && $responsejson["returncode"] == 0  )
                {
                    $data = array(
                        "status" => 0
                    );
                    $res = $gift->save($data,["discount_id" => $id]);

                    $discountgoods = new NsPromotionDiscountGoodsModel();

                    $discountgoods->save($data,["discount_id" => $id]);
                }
            }



            return AjaxReturn($res);
        }
    }


    public function closePlatformDiscount()
    {
        if (request()->isAjax()) {
            $gift = new NsPromotionDiscountModel();
            $id= isset($_POST['id']) ? $_POST['id'] : '';


            $discount_data = $gift->getInfo(["discount_id"=>$id]);

            if($discount_data["type"] == 2)
            {
                $is_win =   strtoupper(substr(PHP_OS,0,3))==='WIN'?1:0;

                //暂时根据环境区分
                if($is_win)
                {

                    $url = "http://127.0.0.1:8011/ziyoutechan/schedule/discountop";
                }
                else
                {
                    $url = "https://www.weiruikj.cn/ziyoutechan/schedule/discountop";
                }

                $parm = array(
                    "id"=>$id,
                    "action"=>2,
                );

                $response = http_do_get($url,$parm);
                $res = 0;

                if ($response) {
                    $responsejson = json_decode($response,true);

                    if($responsejson && array_key_exists("returncode",$responsejson) && $responsejson["returncode"] == 0  )
                    {
                        $data = array(
                            "status" => 0
                        );
                        $res = $gift->save($data,["discount_id" => $id]);
                    }
                }
            }



            return AjaxReturn($res);
        }
    }




    /**
     * 删除满减送活动
     *
     * @return unknown[]
     */
    public function delMansong()
    {
        $mansong_id = isset($_POST['mansong_id']) ? $_POST['mansong_id'] : '';
        if (empty($mansong_id)) {
            $this->error("没有获取到满减送信息");
        }
        $mansong = new PromotionService();
        $res = $mansong->delPromotionMansong($mansong_id);
        return AjaxReturn($res);
    }

    /**
     * 关闭满减送活动
     *
     * @return unknown[]
     */
    public function closeMansong()
    {
        $mansong_id = isset($_POST['mansong_id']) ? $_POST['mansong_id'] : '';
        if (empty($mansong_id)) {
            $this->error("没有获取到满减送信息");
        }
        $mansong = new PromotionService();
        $res = $mansong->closePromotionMansong($mansong_id);
        return AjaxReturn($res);
    }

    /**
     * 满额包邮
     */
    public function fullShipping()
    {
        $full = new PromotionService();
        if (request()->isAjax()) {
            $is_open = isset($_POST['is_open']) ? $_POST['is_open'] : '';
            $full_mail_money = isset($_POST['full_mail_money']) ? $_POST['full_mail_money'] : '';
            $res = $full->updatePromotionFullMail($this->instance_id, $is_open, $full_mail_money);
            return AjaxReturn($res);
        } else {
            $info = $full->getPromotionFullMail($this->instance_id);
            $this->assign("info", $info);
            return view($this->style . "Promotion/fullShipping");
        }
    }

    /**
     * 单店基础版积分奖励
     */
    public function integral()
    {
        $child_menu_list = array(
            array(
                'url' => "promotion/pointconfig",
                'menu_name' => "积分管理",
                "active" => 0
            ),
            array(
                'url' => "promotion/integral",
                'menu_name' => "积分奖励",
                "active" => 1
            )
        );
        $this->assign('child_menu_list', $child_menu_list);
        if (request()->isAjax()) {
            $shop_id = $this->instance_id;
            $sign_point = isset($_POST['sign_point']) ? $_POST['sign_point'] : 0;
            $share_point = isset($_POST['share_point']) ? $_POST['share_point'] : 0;
            $reg_member_self_point = isset($_POST['reg_member_self_point']) ? $_POST['reg_member_self_point'] : 0;
            $reg_member_one_point = 0;
            $reg_member_two_point = 0;
            $reg_member_three_point = 0;
            $reg_promoter_self_point = 0;
            $reg_promoter_one_point = 0;
            $reg_promoter_two_point = 0;
            $reg_promoter_three_point = 0;
            $reg_partner_self_point = 0;
            $reg_partner_one_point = 0;
            $reg_partner_two_point = 0;
            $reg_partner_three_point = 0;
            $rewardRule = new PromoteRewardRule();
            $res = $rewardRule->setPointRewardRule($shop_id, $sign_point, $share_point, $reg_member_self_point, $reg_member_one_point, $reg_member_two_point, $reg_member_three_point, $reg_promoter_self_point, $reg_promoter_one_point, $reg_promoter_two_point, $reg_promoter_three_point, $reg_partner_self_point, $reg_partner_one_point, $reg_partner_two_point, $reg_partner_three_point);
            return AjaxReturn($res);
        }
        $rewardRule = new PromoteRewardRule();
        $res = $rewardRule->getRewardRuleDetail($this->instance_id);
        $Config = new Config();
        $integralConfig = $Config->getIntegralConfig($this->instance_id);
        $this->assign("res", $res);
        $this->assign("integralConfig", $integralConfig);
        return view($this->style . "/Promotion/integral");
    }

    /**
     *
     * @return Ambigous <multitype:unknown, multitype:unknown unknown string >
     */
    public function setIntegralAjax()
    {
        $register = $_POST['register'] ? $_POST['register'] : 0;
        $sign = $_POST['sign'] ? $_POST['sign'] : 0;
        $share = $_POST['share'] ? $_POST['share'] : 0;
        $Config = new Config();
        $retval = $Config->SetIntegralConfig($this->instance_id, $register, $sign, $share);
        return AjaxReturn($retval);
    }
}