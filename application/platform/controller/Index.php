<?php
/**
 * Index.php
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

use data\service\Goods as GoodsService;
use data\service\Order as OrderService;
use data\service\User as User;
use data\service\Weixin;
use think\helper\Time;
use data\service\Shop;
use data\service\Goods;
use data\service\Order;

/**
 * 后台主界面
 *
 * @author Administrator
 *        
 */
class Index extends BaseController
{

    public function __construct()
    {
        parent::__construct();
    }

   public function index()
    {
       
        $debug = config('app_debug') == true ? '开发者模式':'部署模式';
        $this->assign('debug',$debug);
        $main = \think\Request::instance()->domain();
        // var_dump(\think\Request::instance()->header());
        //顶部导航统计数据
        $sale_data = $this->getIndexCount();
        $this->assign("sale_data",$sale_data);
        //订单统计数据
        $order_data = $this->getOrderCount();
        $this->assign("order_data",$order_data);
        return view($this->style.'Index/index');
    }
    /**
     * ajax 加载 店铺 会员 信息
     */
    public function getUserInfo(){
        $auth = new User();
        $user_info = $auth->getUserDetail($this->uid);
        return $user_info;
    }
    /**
     * 获取 商品 数量       全部    出售中  已审核  已下架   
     */
    public function getGoodsCount(){
        $goods_count = new GoodsService();
        $goods_count_array = array();
        //全部
        $goods_count_array['all'] = $goods_count->getGoodsCount(['shop_id'=>$this->instance_id]);
        //出售中
        $goods_count_array['sale'] = $goods_count->getGoodsCount(['shop_id'=>$this->instance_id,'state'=>1]);
        //下架
        $goods_count_array['shelf'] = $goods_count->getGoodsCount(['shop_id'=>$this->instance_id,'state'=>0]);
        return $goods_count_array;
    }
    /**
     * 获取 订单数量     代付款  待发货  已发货    已收货    已完成  已关闭     退款中   已退款
     */
    public function getOrderCount(){
        $order = new OrderService();
        $order_count_array = array();
        $order_count_array['daifukuan'] = $order->getOrderCount(['order_status'=>0]);//代付款
        $order_count_array['daifahuo'] = $order->getOrderCount(['order_status'=>1]);//代发货
        $order_count_array['yifahuo'] = $order->getOrderCount(['order_status'=>2]);//已发货
        $order_count_array['yishouhuo'] = $order->getOrderCount(['order_status'=>3]);//已收货
        $order_count_array['yiwancheng'] = $order->getOrderCount(['order_status'=>4]);//已完成
        $order_count_array['yiguanbi'] = $order->getOrderCount(['order_status'=>5]);//已关闭
        $order_count_array['tuikuanzhong'] = $order->getOrderCount(['order_status'=>-1]);//退款中
        $order_count_array['yituikuan'] = $order->getOrderCount(['order_status'=>-2]);//已退款
        $order_count_array['all'] = $order->getOrderCount('');//全部
        return $order_count_array;
    }
    public function getSalesStatistics(){
        $order = new OrderService();
        $condition['shop_id'] = $this->instance_id;
        $condition['order_status'] = ['>',1];
        
        $data['yesterday_money'] = $order->getPayMoneySum($condition, 'yesterday');
        $data['month_money'] = $order->getPayMoneySum($condition, 'month');
        $data['yesterday_goods'] = $order->getGoodsNumSum($condition, 'yesterday');
        $data['month_goods'] = $order->getGoodsNumSum($condition, 'month');
        return $data;
    }
    /**
     * 订单 图表 数据
     */
    public function getOrderChartCount(){
        $order = new OrderService();
        $data = array(); 
        list($start, $end) = Time::month();
        for($j=0;$j<($end+1-$start)/86400;$j++){
            $date_start = date("Y-m-d H:i:s",$start+86400*$j);
            $date_end = date("Y-m-d H:i:s",$start+86400*($j+1));
            $count = $order->getOrderCount(['shop_id'=>$this->instance_id,'create_time'=>['between',[$date_start,$date_end]]]);
            $data[$j] = array(
                (1+$j).'日',$count
            );
        }
        
        return $data;
    }
    /**
     *销售统计
     */
    public function getIndexCount(){
        $start_date = date('Y-m-d 00:00:00', time());
        $end_date = date('Y-m-d 00:00:00', strtotime('this day + 1 day'));
        $condition = ['create_time' => [[">",$start_date],["<",$end_date]]];
        $order= new OrderService();
        //本日销售额
        $sale_money_day = $order->getShopSaleSum($condition);
        //本日订单量
        $sale_num_day = $order->getShopSaleNumSum($condition);
        $shop = new Shop();
        //入驻店铺数
        $shop_num = $shop->getShopCount('');
        //关注用户数


        $result = array(
            "sale_money_day"=>$sale_money_day,
            "sale_num_day"=>$sale_num_day,
            "shop_num"=>$shop_num,
            "fans_num"=>0,
            "assistant_num"=>0,
            "commission"=>sprintf('%.2f', 0)
        );
        return $result;
    }
    
    /**
     * 注册会员图表数据
     */
    public function getUserRegChartCount()
    {
        $user = new User();
        $data = array();
        list ($start, $end) = Time::month();
        for ($j = 0; $j < ($end + 1 - $start) / 86400; $j ++) {
                            $date_start = date("Y-m-d H:i:s", $start + 86400 * $j);
                            $date_end = date("Y-m-d H:i:s", $start + 86400 * ($j + 1));
                            $count = $user->getUserCount([
                                'reg_time' => [
                                    'between',
                                    [
                                        $date_start,
                                        $date_end
                                    ]
                                ]
                            ]);
                            $data[0][$j] =  (1 + $j) . '日';
                            $data[1][$j] = $count;
         }                    
         return $data;
    }
    
    /**
     * 商品销售额chart数据
     * @return multitype:multitype:unknown
     */
    public function getGoodsSalesChartCount(){ 
        list ($start, $end) = Time::month();
        $start_date = date("Y-m-d H:i:s", $start);
        $end_date = date("Y-m-d H:i:s", $end);        
        $condition=array();        
        $order = new Order();
        $goods_list= $order->getShopGoodsSalesQuery($this->instance_id, $start_date, $end_date, $condition);    
        $sort_array = array();
            foreach($goods_list as $k=>$v ){
                $sort_array[$v["goods_name"]] = $v["sales_money"];
            }
            arsort($sort_array);
            $sort = array();
            $num = array();
            $i = 0;
            foreach($sort_array as $t=>$b){
                if($i < 30){
                    $sort[] = $t;
                    $num[] = $b;
                    $i++;
    
                }else{
                    break;
                }
            }
            return array($sort,$num );
    }
    /**
     * 入驻店铺数统计
     */
    public function getShopCreateNumChartCount(){
        $shop = new Shop();
        //入驻店铺数
        $data = array();
        list ($start, $end) = Time::month();
        for ($j = 0; $j < ($end + 1 - $start) / 86400; $j ++) {
            $date_start = date("Y-m-d H:i:s", $start + 86400 * $j);
            $date_end = date("Y-m-d H:i:s", $start + 86400 * ($j + 1));
            $count = $shop->getShopCount([
                'shop_create_time' => [
                    'between',
                    [
                        $date_start,
                        $date_end
                    ]
                ]
            ]);
            $data[0][$j] =  (1 + $j) . '日';
            $data[1][$j] = $count;
        }
        return $data;
    }
    /**
     * 商品添加统计
     * @return Ambigous <multitype:, unknown>
     */
    public function getGoodsCreateChartCount(){
        $goods = new Goods();
        $data = array();
        list ($start, $end) = Time::month();
        for ($j = 0; $j < ($end + 1 - $start) / 86400; $j ++) {
            $date_start = date("Y-m-d H:i:s", $start + 86400 * $j);
            $date_end = date("Y-m-d H:i:s", $start + 86400 * ($j + 1));
            $count = $goods->getGoodsCount([
                'create_time' => [
                    'between',
                    [
                        $date_start,
                        $date_end
                    ]
                ]
            ]);
            $data[0][$j] =  (1 + $j) . '日';
            $data[1][$j] = $count;
        }
        return $data;
    }
    /**
     * 商品添加统计详情
     */
    public function getGoodsCreateCount(){
        $goods = new Goods();
        //今日商品添加
        list ($start, $end) = Time::today();
        $start_date = date("Y-m-d H:i:s", $start);
        $end_date = date("Y-m-d H:i:s", $end);
        //本日添加商品数
        $num_day = $goods->getGoodsCount(['create_time' => ['between',[$start_date,$end_date]]]);
        //昨天添加商品数
        list ($start, $end) = Time::yesterday();
        $start_date = date("Y-m-d H:i:s", $start);
        $end_date = date("Y-m-d H:i:s", $end);
        $num_yesterday = $goods->getGoodsCount(['create_time' => ['between',[$start_date,$end_date]]]);
        //本月
        list ($start, $end) = Time::month();
        $start_date = date("Y-m-d H:i:s", $start);
        $end_date = date("Y-m-d H:i:s", $end);
        $num_month = $goods->getGoodsCount(['create_time' => ['between',[$start_date,$end_date]]]);
        //总计
        $num_count = $goods->getGoodsCount('');
        $result = array(
            "num_day"=>$num_day,
            "num_yesterday"=>$num_yesterday,
            "num_month"=>$num_month,
            "num_count"=>$num_count
        );
        return $result;
    }
    /**
     * 会员注册统计详情
     */
    public function getUserRegCount(){
        $user = new User();
        //今日商品添加
        list ($start, $end) = Time::today();
        $start_date = date("Y-m-d H:i:s", $start);
        $end_date = date("Y-m-d H:i:s", $end);
        //本日添加商品数
        $num_day = $user->getUserCount(['reg_time' => ['between',[$start_date,$end_date]]]);
        //昨天添加商品数
        list ($start, $end) = Time::yesterday();
        $start_date = date("Y-m-d H:i:s", $start);
        $end_date = date("Y-m-d H:i:s", $end);
        $num_yesterday = $user->getUserCount(['reg_time' => ['between',[$start_date,$end_date]]]);
        //本月
        list ($start, $end) = Time::month();
        $start_date = date("Y-m-d H:i:s", $start);
        $end_date = date("Y-m-d H:i:s", $end);
        $num_month = $user->getUserCount(['reg_time' => ['between',[$start_date,$end_date]]]);
        //总计
        $num_count = $user->getUserCount('');
        $result = array(
            "user_num_day"=>$num_day,
            "user_num_yesterday"=>$num_yesterday,
            "user_num_month"=>$num_month,
            "user_num_count"=>$num_count
        );
        return $result;
    }
    /**
     * 店铺入驻统计详情
     */
    public function getShopCreateCount(){
        $shop = new Shop();
        //今日商品添加
        list ($start, $end) = Time::today();
        $start_date = date("Y-m-d H:i:s", $start);
        $end_date = date("Y-m-d H:i:s", $end);
        //本日添加商品数
        $shop_num_day = $shop->getShopCount(['shop_create_time' => ['between',[$start_date,$end_date]]]);
        //昨天添加商品数
        list ($start, $end) = Time::yesterday();
        $start_date = date("Y-m-d H:i:s", $start);
        $end_date = date("Y-m-d H:i:s", $end);
        $shop_num_yesterday = $shop->getShopCount(['shop_create_time' => ['between',[$start_date,$end_date]]]);
        //本月
        list ($start, $end) = Time::month();
        $start_date = date("Y-m-d H:i:s", $start);
        $end_date = date("Y-m-d H:i:s", $end);
        $shop_num_month = $shop->getShopCount(['shop_create_time' => ['between',[$start_date,$end_date]]]);
        //总计
        $shop_num_count = $shop->getShopCount('');
        $result = array(
            "shop_num_day"=>$shop_num_day,
            "shop_num_yesterday"=>$shop_num_yesterday,
            "shop_num_month"=>$shop_num_month,
            "shop_num_count"=> $shop_num_count
        );
        return $result;
    }
    
}
