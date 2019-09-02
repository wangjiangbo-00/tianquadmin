<?php
/**
 * BaseController.php
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

\think\Loader::addNamespace('data', 'data/');
use data\service\AdminUser as User;
use data\service\Shop;
use data\service\WebSite as WebSite;
use think\Controller;
use think\Config;

class BaseController extends Controller
{

    protected $user = null;

    protected $website = null;

    protected $uid;

    protected $instance_id;

    protected $instance_name;

    protected $user_name;

    protected $user_headimg;

    protected $module = null;

    protected $controller = null;

    protected $action = null;

    protected $module_info = null;

    protected $rootid = null;

    protected $moduleid = null;

    /**
     * 当前版本的路径
     *
     * @var string
     */
    protected $style = null;

    public function __construct()
    {
        parent::__construct();
        if(!request()->isAjax())
        {
            $this->initTemplate();
        }
        $this->user = new User();
        $this->website = new WebSite();
        $this->init();
        $this->assign("pageshow", PAGESHOW);
        $this->assign("pagesize", PAGESIZE);
    }
    public function initTemplate(){
        echo "<link rel='stylesheet' href='".Config::get('view_replace_str.PLATFORM_CSS')."/app.v1.css' type='text/css' />";
        echo "<div style='position:fixed;top:0;left:0;width:100%;height:50px;background:#25313e;z-index:9;'></div>";
        echo "<img src='".Config::get('view_replace_str.PLATFORM_IMG')."/logo1.png' style='position:fixed;width:220px;height:50px;left:0;top:0;z-index:10;>";
        echo "<div style='position:fixed;top:50px;left:0;bottom:0;width:68px;background:#444;' id='back_ground'></div>";
        echo "<div style='position:fixed;top:50px;left:68px;bottom:0;width:152px;background:#fff;'></div>";
    }
    public function initMenu($list){
        $html = '<section class="vbox">';
        $html .= '<div class="left-sidebar" id="sidebar">
			<div id="first-sidebar" class="nav-primary first" >
				<ul class="nav">';
        foreach ($list as $k=>$vo){
            $active = $vo['data']['module_id'] == $this->rootid ? 'active' : '';
            $html .= '<li class="'.$active.'" style="position: relative;text-align:center;height:68px;margin:0;">';
            $html .= '<a href="'.Config::get('view_replace_str.PLATFORM_MAIN').'/'.$vo['data']['url'].'" onclick="show_menu('.$vo['data']['module_id'].')" style="height:68px;">';
            $html .= '<div style="padding-top:15px;padding-left:24px;"><i class="nav-icon '.$vo['data']['icon_class'].'"></i></div>';
            $html .= '<div style="margin:0;height:33px;line-height:22px;">'.$vo['data']['module_name'].'</div><div class="arrow-left"></div></a></li>';
        }
        $html .= '</ul></div><div id="second-sidebar" class="nav-primary second">';
        foreach($list as $k=>$vo){
            if(!empty($vo['sub_menu'])){
                $block_hide = $vo['data']['module_id'] == $this->rootid ? 'block' : 'hide';
                $html .= '<ul class="nav menu-nav '.$block_hide.'" id="menu_'.$vo['data']['module_id'].'" >';
                foreach ($vo['sub_menu'] as $k1=>$v1){
                    $active_li = $v1['module_id'] == $this->second_menu_id ? 'active' : '';
                    $active_a = strtoupper($v1['method']) == strtoupper($this->action) ? 'active' : '';
                    $html .= '<li class="'.$active_li.'" style="position: relative;">';
                    $html .= '<a href="'.Config::get('view_replace_str.PLATFORM_MAIN').'/'.$v1['url'].'" class="'.$active_a.'">';
                    $html .= '<span>'.$v1['module_name'].'</span></a><i class="triangle1"></i></li>';
                }
                $html .= '</ul>';
            }
        }
        $html .= '</div></div>';
        echo $html;
    }
    /**
     * 创建时间：2016-10-27
     * 功能说明：action基类 调用 加载头部数据的方法
     */
    public function init()
    {
        $this->uid = $this->user->getSessionUid();
        $is_system = $this->user->getSessionUserIsSystem();
        
        if (empty($this->uid)) {
            if (request()->isAjax()) {
                echo json_encode(AjaxReturn(NO_LOGIN));
                exit();
                }
                else{
                    $this->redirect(__URL__.'/'. PLATFORM_MODULE . "/login");
                }
         
        }
        if (empty($is_system)) {
            $this->redirect(__URL__.'/'. PLATFORM_MODULE. "/login");
        }
        $this->instance_id = $this->user->getSessionInstanceId();
        $this->instance_name = $this->user->getInstanceName();
        $this->module = \think\Request::instance()->module();
        $this->controller = \think\Request::instance()->controller();
        $this->action = \think\Request::instance()->action();
        $this->module_info = $this->website->getModuleIdByModule($this->controller, $this->action);
        // 过滤控制权限 为0
        if (empty($this->module_info)) {
            $this->moduleid = 0;
            $check_auth = 1;
        } elseif ($this->module_info["is_control_auth"] == 0) {
            $this->moduleid = $this->module_info['module_id'];
            $check_auth = 1;
        } else {
            $this->moduleid = $this->module_info['module_id'];
            $check_auth = $this->user->checkAuth($this->moduleid);
        }
        $shop = new Shop();
        $ShopNavigationData = $shop->ShopNavigationList(1, 6, '', 'sort');
        if ($check_auth) {
            $this->style = 'platform/';
            $this->addUserLog();
            if (! request()->isAjax()) {
                $web_info = $this->website->getWebSiteInfo();
                $user_info = $this->user->getUserInfo();
                $root_array = $this->website->getModuleRootAndSecondMenu($this->moduleid);
                $this->rootid = $root_array[0];
                $this->second_menu_id = $root_array[1];
                $this->getNavigation();
                $root_module_info = $this->website->getSystemModuleInfo($this->rootid, 'module_name,url,controller');
                $first_menu_list = $this->user->getchildModuleQuery(0);
                if ($this->rootid != 0) {
                    $second_menu_list = $this->user->getchildModuleQuery($this->rootid);
                } else {
                    $second_menu_list = '';
                }
                if($this->second_menu_id != 0){
                    $three_menu_list = $this->user->getchildModuleQuery($this->second_menu_id);
                }else{
                    $three_menu_list = '';
                }
                $this->assign('three_menu_list', $three_menu_list);
                $this->user_name = $user_info['user_name'];
                $this->assign("headid", $this->rootid);
                $this->assign("second_menu_id", $this->second_menu_id);
                $this->assign("moduleid", $this->moduleid);
                $this->assign("HeadCode", $this->user_name);
                $this->assign("title_name", $this->instance_name);
                $this->assign("username", $this->user_name);
                $this->assign("headlist", $first_menu_list);
                $this->assign("leftlist", $second_menu_list);
                // 暂时这样写，以后改
                $this->assign("frist_menu", $root_module_info);
                $this->assign("secend_menu", $this->module_info);
                $child_menu_list = array(
                    array(
                        'url' => $this->module_info['url'],
                        'menu_name' => $this->module_info['module_name'],
                        'active' => 1
                    )
                );
                $this->assign('child_menu_list', $child_menu_list);
                $this->assign('ShopNavigationData', $ShopNavigationData['data']);
                $this->assign('first_menu_list', $first_menu_list);
                $this->assign('second_menu_list', $second_menu_list);
                $this->assign('controller', $this->controller);
                $this->assign('action', $this->action);
            }
        } else {
            if (request()->isAjax()) {
                echo json_encode(AjaxReturn(NO_AITHORITY));
                exit();
            } else {
                $this->error("当前用户没有操作权限");
            }
        }
    }

    /**
     * 添加操作日志（当前考虑所有操作），
     */
    private function addUserLog()
    {
        $get_data = '';
        if ($_GET) {
            $res = \think\Request::instance()->get();
            $get_data = json_encode($res);
        }
        if ($_POST) {
            $res = \think\Request::instance()->post();
            if (empty($get_data)) {
                $get_data = json_encode($res);
            } else {
                $get_data = $get_data . ',' . json_encode($res);
            }
        }
        // 建议，调试模式，用于
        // $res = $this->user->addUserLog($this->uid, 1, $this->controller, $this->action, \think\Request::instance()->ip(), $get_data);
    }

    /**
     * 获取导航
     */
    public function getNavigation()
    {
        $first_list = $this->user->getchildModuleQuery(0);
        $list = array();
        foreach ($first_list as $k => $v) {
            $submenu = $this->user->getchildModuleQuery($v['module_id']);
            $list[$k]['data'] = $v;
            $list[$k]['sub_menu'] = $submenu;
        }
        $this->assign("nav_list", $list);
        $this->initMenu($list);
    }
    public function getOperationTips($tips){
        $tips_array = array();
        if(!empty($tips)){
            $tips_array = explode("///", $tips);
        }
        $this->assign("tips", $tips_array);
    }
}
