<?php
namespace app\platform\controller;

use data\service\Platform;
use data\service\Shop;
use data\service\Goods;
use data\service\GoodsCategory;
use data\service\Member;

/**
 * 系统模块控制器
 *
 * @author Administrator
 *        
 */
class Statistics extends BaseController
{

    public function __construct()
    {
        parent::__construct();
    }

    /**
     * 统计 概述
     */
    public function statGeneral()
    {
        if (request()->isAjax()) {
            $pageindex = isset($_POST['pageIndex']) ? $_POST['pageIndex'] : 1;
            $start_date = ! empty($_POST['start_date']) ? $_POST['start_date'] : '2010-1-1';
            $end_date = ! empty($_POST['end_date']) ? $_POST['end_date'] : '2099-1-1';
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
            $platform = new Platform();
            $count_list = $platform->getPlatformCount($start_date, $end_date);
            $list = $platform->getPlatformAccountRecordsList($pageindex, PAGESIZE, $condition, 'create_time desc');
            // $count_list = $platform->getPlatformCount("2017-03-12", "2017-04-12");
            $count = [
                "count_list" => $count_list,
                "page_lsit" => $list
            ];
            // $this->assign("count_list",$count_list);
            // var_dump($count_list);
            return $count;
        } else {
            return view($this->style . 'Statistics/statGeneral');
        }
    }

    /**
     * 会员统计
     *
     * @return \think\response\View
     */
    public function userStat()
    {
        $user = new Member();
        $user_count_num = $user->getMemberCount(array());
        $user_today_num = $user->getMemberCount(array(
            "reg_time" => date("Y-m-d", time())
        ));
        $month_begin = date('Y-m-01', strtotime(date("Y-m-d")));
        $month_end = date('Y-m-d', strtotime("$month_begin +1 month -1 day"));
        $condition["reg_time"] = [
            [
                ">",
                $month_begin
            ],
            [
                "<",
                $month_end
            ]
        ];
        $user_month_num = $user->getMemberCount($condition);
        $this->assign("user_count_num", $user_count_num);
        $this->assign("user_today_num", $user_today_num);
        $this->assign("user_month_num", $user_month_num);
        $this->assign("start_date", $month_begin);
        $this->assign("end_date", $month_end);
        return view($this->style . 'Statistics/userStat');
    }

    /**
     * 店铺统计
     *
     * @return \think\response\View
     */
    public function shopStat()
    {
        $shop = new Shop();
        $condition = array();
        $shop_list = $shop->getShopAll($condition);
        $this->assign("shop_list", $shop_list);
        return view($this->style . 'Statistics/shopStat');
    }

    /**
     * 订单统计
     *
     * @return \think\response\View
     */
    public function orderStat()
    {
        if(request()->isAjax())
        {
            $pageindex = isset($_POST['pageIndex']) ? $_POST['pageIndex'] : 1;
            $start_date = ! empty($_POST['start_date']) ? $_POST['start_date'] : '';
            $end_date = ! empty($_POST['end_date']) ? $_POST['end_date'] : '';
            $condition = array();
            if ($start_date != "") {
                $condition["create_time"][] = [
                    ">",
                    $start_date
                ];
                $count_condition["create_time"][] = [
                    ">",
                    $start_date
                ];
            }
            if ($end_date != "") {
                $condition["create_time"][] = [
                    "<",
                    $end_date
                ];
                $count_condition["create_time"][] = [
                    "<",
                    $end_date
                ];
            }
          
            
            $condition["id"] = [
                ">",
                0
            ];
            $shop = new Shop();
            $list = $shop->getShopOrderReturnList($pageindex, PAGESIZE, $condition, 'create_time desc');
            $count = $shop->getShopAccountSales($count_condition);
            return [
                "list" => $list,
                "count" => $count
            ];
        }
       
        return view($this->style . 'Statistics/orderStat');
    }

    /**
     * 商品分析
     *
     * @return \think\response\View
     */
    public function goodsStat()
    {
        $goods = new Goods();
        $goods_list = $goods->getGoodsRank(array());
        $this->assign("goods_list", $goods_list);
        return view($this->style . 'Statistics/goodsStat');
    }

    /**
     * 售后 分析
     *
     * @return \think\response\View
     */
    public function afterSale()
    {
        return view($this->style . 'Statistics/afterSale');
    }

    /**
     * 商品销售排行
     */
    public function goodsSaleVolumeRanking()
    {
        $platform = new Platform();
        $goods_sale_volume_ranking_array = array();
        $goods_sale_volume_ranking = $platform->getGoodsSalesVolume(array());
        foreach ($goods_sale_volume_ranking as $k => $v) {
            $goods_sale_volume_ranking_array[$v["goods_id"]] = $v;
        }
        var_dump($goods_sale_volume_ranking);
    }

    public function platformAccountRecordsList()
    {
        if (request()->isAjax()) {
            $pageindex = isset($_POST['pageIndex']) ? $_POST['pageIndex'] : 1;
            $start_date = ! empty($_POST['start_date']) ? $_POST['start_date'] : '2010-1-1';
            $end_date = ! empty($_POST['end_date']) ? $_POST['end_date'] : '2099-1-1';
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
            $platform = new Platform();
            $list = $platform->getPlatformAccountRecordsList($pageindex, PAGESIZE, $condition, 'create_time desc');
            return $list;
        } else {
            return view($this->style . 'Statistics/platformAccountRecordsList');
        }
    }

    /**
     * 商品分类销售排行榜
     */
    public function goodsCategorySaleNumRank()
    {
        return view($this->style . "Statistics/goodsCategorySaleNumRank");
    }

    /**
     * 销售分类柱形图数据
     *
     * @return multitype:multitype:unknown multitype:Ambigous <\think\static>
     */
    public function getCategorySaleNumData()
    {
        $goods_category = new GoodsCategory();
        $list = $goods_category->getGoodsCategorySaleNum();
        $category_list = array();
        $sale_num_list = array();
        foreach ($list as $k => $v) {
            $category_list[] = $v["category_name"];
            $sale_num_list[] = $v["sale_num"];
        }
        return [
            "category_list" => $category_list,
            "sale_num_list" => $sale_num_list
        ];
    }

    /**
     * 平台统计
     *
     * @return \think\response\View
     */
    public function platformAccountMonthRecored()
    {
        $platform = new Platform();
        $account_count = $platform->getAccountCount();
        // var_dump($account_count);
        $this->assign('AccountCount', $account_count);
        return view($this->style . 'Statistics/platformAccountMonthRecored');
    }
    
    /**
     * 统计数据
     * @return multitype:Ambigous <string, unknown> Ambigous <string, multitype:multitype: , number>
     */
    public function platformAccountMonthRecoredJson(){
        $platform = new Platform();
        $MonthRecored = $platform->getPlatformAccountMonthRecord();
        $month_string = '';
        $money = '';
        foreach ($MonthRecored as $k => $v){
            $month_string[]=$k;
            $money[]= $v['money'];
        }
    
        $array = [$month_string, $money];
        return $array;
    }
    /**
     * 平台账户记录
     */
    public function platformAccountRecordsCountList()
    {
        if (request()->isAjax()) {
            $pageindex = isset($_POST['pageIndex']) ? $_POST['pageIndex'] : 1;
            $start_date = ! empty($_POST['start_date']) ? $_POST['start_date'] : '2010-1-1';
            $end_date = ! empty($_POST['end_date']) ? $_POST['end_date'] : '2099-1-1';
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
            
            $platform = new Platform();
            // var_dump($commission_calculate);
            $list = $platform->getPlatformAccountRecordsList($pageindex, PAGESIZE, $condition, 'create_time desc');
            $count = $platform->getPlatformCount($start_date, $end_date);
            // var_dump($count);
            // exit();
            return [
                "list" => $list,
                "count" => $count
            ];
        } else {
            return view($this->style . "Statistics/platformAccountRecordsCountList");
        }
    }

    /**
     * 会员统计json
     */
    public function getMemberMonthCount()
    {
        $start_date = $_POST["start_date"];
        $end_date = $_POST["end_date"];
        $member = new Member();
        $member_list = $member->getMemberMonthCount($start_date, $end_date);
        // return $member_list;
        $date_string = array();
        $user_num = array();
        foreach ($member_list as $k => $v) {
            $date_string[] = $k;
            $user_num[] = $v;
        }
        $array = [
            $date_string,
            $user_num
        ];
        // 或区域一段时间内的用户数量
        return $array;
    }

    /**
     * 店铺账户
     */
    public function shopAccountList()
    {
        if (request()->isAjax()) {
            $pageindex = isset($_POST['pageIndex']) ? $_POST['pageIndex'] : 1;
            $shop = new Shop();
            // var_dump($commission_calculate);
            $condition = array();
            $list = $shop->getShopAccountCountList($pageindex, PAGESIZE, $condition, '');
            return $list;
        } else {
            return view($this->style . "Statistics/shopAccountList");
        }
    }

    /**
     * 修改平台提成比率
     * 
     * @return unknown
     */
    public function updateShopPlatformCommissionRate()
    {
        $shop = new Shop();
        $shop_id = request()->post('shop_id','');
        $shop_platform_commission_rate = request()->post('commission_rate','');
        $res = $shop->updateShopPlatformCommissionRate($shop_id, $shop_platform_commission_rate);
        return $res;
    }

    /**
     * 店铺账户明细
     */
    public function shopAccountRecordsList()
    {
        if (request()->isAjax()) {
            
            $pageindex = isset($_POST['pageIndex']) ? $_POST['pageIndex'] : 1;
            $start_date = ! empty($_POST['start_date']) ? $_POST['start_date'] : '';
            $end_date = ! empty($_POST['end_date']) ? $_POST['end_date'] : '';
            $account_type = ! empty($_POST['account_type']) ? $_POST['account_type'] : 0;
            $shop_id = isset($_POST["shop_id"]) ? $_POST["shop_id"] : 0;
            if ($shop_id != 0) {
                $condition["shop_id"] = $shop_id;
            }
            $condition = array();
            if ($account_type != 0) {
                $condition["account_type"] = $account_type;
            }
            if ($start_date != "") {
                $condition["create_time"][] = [
                    ">",
                    $start_date
                ];
            }
            if ($end_date != "") {
                $condition["create_time"][] = [
                    "<",
                    $end_date
                ];
            }
            $shop = new Shop();
            // var_dump($commission_calculate);
            $list = $shop->getShopAccountRecordsList($pageindex, PAGESIZE, $condition, 'create_time desc');
            return $list;
        } else {
            $shop_id = isset($_GET["shop_id"]) ? $_GET["shop_id"] : 0;
            $this->assign("shop_id", $shop_id);
            return view($this->style . "statistics/ShopAccountRecordsList");
        }
    }
}
