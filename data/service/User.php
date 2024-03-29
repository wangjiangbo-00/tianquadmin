<?php
/**
 * User.php
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
 * @date : 2015.4.24
 * @version : v1.0.0.0
 */
namespace data\service;

use \think\Session as Session;
use data\service\BaseService as BaseService;
use data\api\IUser as IUser;
use data\model\UserModel as UserModel;
use data\model\AdminUserModel as AdminUserModel;
use data\model\AuthGroupModel as AuthGroupModel;
use data\model\UserLogModel as UserLogModel;
use data\model\InstanceModel;
use data\model\WebSiteModel;
use data\model\ModuleModel;
use data\model\WeixinFansModel;
use data\model\NsShopModel;
use data\model\NsMemberModel;

class User extends BaseService implements IUser
{

    function __construct()
    {
        parent::__construct();
        $this->user = new UserModel();
    }
    /**
     * 
     * @return unknown
     */
    public function getUserInfo()
    {
        $res = $this->user->getInfo('uid=' . $this->uid, 'user_name,user_status,user_headimg');
        return $res;
    }

    public function getUserToken()
    {
        $res = $this->user->getInfo('uid=' . $this->uid, 'wx_openid');
        return $res;
    }
    /**
     * (non-PHPdoc)
     * @see \ata\api\IUser::getUserInfoByUid()
     */
    public function getUserInfoByUid($uid)
    {
        $res = $this->user->getInfo('uid=' . $uid, '*');
         
        return $res;
    }
    /**
     * 根据用户名获取用户信息
     */
    public function getUserInfoByUsername($username)
    {
        $res = $this->user->getInfo(['user_name'=>$username],'*');
         
        return $res;
    }
    /**
     * 根据用户名修改密码
     */
     public function  updateUserInfoByUsername($username,$password){
         
         $data = array(
             'user_password' => md5($password)
         );
         $retval = $this->user->save($data, ['user_name' => $username]);
         return $retval;
     }
     /**
      * 根据用户id修改密码
      */
     public function  updateUserInfoByUserid($userid,$password){
          
         $data = array(
             'user_password' => md5($password)
         );
         $retval = $this->user->save($data, ['uid' => $userid]);
         return $retval;
     }
    /**
     * 获取当前登录用户的uid
     */
    public function getSessionUid()
    {
        return $this->uid;
    }

    /**
     * 获取当前登录用户的实例ID
     */
    public function getSessionInstanceId()
    {
        return $this->instance_id;
    }

    /**
     * 获取当前登录用户是否是总系统管理员
     */
    public function getSessionUserIsAdmin()
    {
        return $this->is_admin;
    }

    /**
     * 获取当前登录用户是否是前台会员
     */
    public function getSessionUserIsMember()
    {
        return $this->is_member;
    }

    public function getSessionUserIsSystem()
    {
        return $this->is_system;
    }

    /**
     * 获取当前登录用户的权限列
     */
    public function getSessionModuleIdArray()
    {
        return $this->module_id_array;
    }

    public function getInstanceName()
    {
        if(empty($this->instance_name))
        {
            $web_site = new WebSiteModel();
            $info = $web_site->getInfo('', 'title');
            return $info['title'];
        }else{
            return $this->instance_name;
        }
     
    }
    /**
     * 用户登录之后初始化数据
     * @param unknown $user_info
     */
    private function initLoginInfo($user_info)
    {
        Session::set('uid', $user_info['uid']);
        Session::set('is_system', $user_info['is_system']);
        Session::set('is_member', $user_info['is_member']);
        Session::set('instance_id', $user_info['instance_id']);
        $login_model = \think\Request::instance()->module();

        if($user_info['current_login_time'] == null)
        {
            $user_info['current_login_time'] =  date("Y-m-d H:i:s", time());
        }
        //单店版本
        if($login_model != 'admin')
        {
            $website = new WebSiteModel();
            $instance_name = $website->getInfo('', 'title');
            Session::set('instance_name', $instance_name['title']);
        }else{

            //平台化版本设置不同
            $shop_model = new NsShopModel();
            $shop_info = $shop_model->getInfo(['shop_id' => $user_info['instance_id']], 'shop_name');
            Session::set('instance_name', $shop_info['shop_name']);
        }
     
        if ($user_info['is_system']) {
            $admin_info = new AdminUserModel();
            $admin_info = $admin_info->getInfo('uid=' . $user_info['uid'], 'is_admin,group_id_array');
            Session::set('is_admin', $admin_info['is_admin']);
            $auth_group = new AuthGroupModel();
            $auth = $auth_group->get($admin_info['group_id_array']);
            $no_control = $this->getNoControlAuth();
            Session::set('module_id_array', $no_control.$auth['module_id_array']);
        }
        $data = array(
            'last_login_time' => $user_info['current_login_time'],
            'last_login_ip' => $user_info['current_login_ip'],
            'last_login_type' => $user_info['current_login_type'],
            'current_login_ip' => request()->ip(),
            'current_login_time' => date("Y-m-d H:i:s", time()),
            'current_login_type'  => 1
        );
        $retval = $this->user->save($data,['uid' => $user_info['uid']]);
        return $retval;
    }
    /**
     * 系统用户登录
     *
     * @param unknown $user_name            
     * @param unknown $password            
     */
    public function login($user_name, $password = '')
    {
        Session::clear();
        $condition = array(
            'user_name' => $user_name,
            'user_password' => md5($password)
        );
        $user_info = $this->user->getInfo($condition);
        
        if (empty($user_info)) {
            if(empty($password)){
                $condition = array(
                    'user_tel' => $user_name
                );
            }else{
                $condition = array(
                    'user_tel' => $user_name,
                    'user_password' => md5($password)
                );
            }
            
            $user_info = $this->user->getInfo($condition, $field = 'uid,user_status,user_name,is_system,instance_id, is_member, current_login_ip, current_login_time, current_login_type');
        }
        if (empty($user_info)) {
            $condition = array(
                'user_email' => $user_name,
                'user_password' => md5($password)
            );
            $user_info = $this->user->getInfo($condition, $field = 'uid,user_status,user_name,is_system,instance_id, is_member, current_login_ip, current_login_time, current_login_type');
        }
        if (! empty($user_info)) {
            if ($user_info['user_status'] == 0) {
                return USER_LOCK;
           
            } else {
               $this->initLoginInfo($user_info);
                return 1;
            }
        } else
            return USER_ERROR;
    }

    /**
     * 获取不控制权限模块组
     */
    private function getNoControlAuth()
    {
        $moudle = new ModuleModel();
        $list = $moudle->getQuery([
            "is_control_auth" => 0
        ], "module_id",'');
        $str = "";
        foreach ($list as $v) {
            $str .= $v["module_id"] . ",";
        }
        return $str;
    }

    /*
     * qq登录(non-PHPdoc)
     * @see \data\api\IMember::qqLogin()
     */
    public function qqLogin($qq)
    {
        Session::clear();
        $condition = array(
            'qq_openid' => $qq
        );
        $user_info = $this->user->getInfo($condition, $field = 'uid,user_status,user_name,is_system,instance_id,is_member, current_login_ip, current_login_time, current_login_type');
        if (! empty($user_info)) {
            if ($user_info['user_status'] == 0) {
                return USER_LOCK;
            } else {
               $this->initLoginInfo($user_info);
                return 1;
            }
        } else
            return USER_NBUND;
        // TODO Auto-generated method stub
    }

    /*
     * 微信第三方登录(non-PHPdoc)
     * @see \data\api\IMember::wchatLogin()
     */
    public function wchatLogin($openid)
    {
        Session::clear();
        $condition = array(
            'wx_openid' => $openid
        );
        $user_info = $this->user->getInfo($condition, $field = 'uid,user_status,user_name,is_system,instance_id,is_member, current_login_ip, current_login_time, current_login_type');
        if (! empty($user_info)) {
            if ($user_info['user_status'] == 0) {
                return USER_LOCK;
            } else {
               $this->initLoginInfo($user_info);
                return 1;
            }
        } else
            return USER_NBUND;
        // TODO Auto-generated method stub
    }
    /**
     * 微信unionid登录(non-PHPdoc)
     * @see \ata\api\IUser::wchatUnionLogin()
     */
    public function wchatUnionLogin($unionid)
    {
        Session::clear();
        $condition = array(
            'wx_unionid' => $unionid
        );
        $user_info = $this->user->getInfo($condition, $field = 'uid,user_status,user_name,is_system,instance_id,is_member, current_login_ip, current_login_time, current_login_type');
        if (! empty($user_info)) {
            if ($user_info['user_status'] == 0) {
                return USER_LOCK;
            } else {
                $this->initLoginInfo($user_info);
                return 1;
            }
        } else
            return USER_NBUND;
    }
    /**
     * 当前只针对存在unionid不存在openid(non-PHPdoc)
     * @see \ata\api\IUser::modifyUserWxhatLogin()
     */
    public function modifyUserWxhatLogin($wx_openid, $wx_unionid)
    {
        $user_info = $this->user->getInfo(['wx_unionid' => $wx_unionid], 'wx_openid,wx_unionid');
        if(!empty($user_info))
        {
            if(empty($user_info['wx_openid']))
            {
                $data = array(
                    'wx_openid' => $wx_openid
                );
                $retval = $this->user->save($data, ['wx_unionid' => $wx_unionid]);
            }else{
                $retval = 1;
            }
          
        }else{
            $retval = 1;
        }
    }
    /**
     * 检测用户是否具有打开权限(non-PHPdoc)
     *
     * @see \data\api\IAdmin::checkAuth()
     */
    public function checkAuth($module_id)
    {
        if ($this->is_admin) {
            return 1;
        } else {
            $module_id_array = explode(',', $this->module_id_array);
            if (in_array($module_id, $module_id_array)) {
                return 1;
            } else {
                return 0;
            }
        }
    }

    /**
     * 系统用户基础添加方式
     *
     * @param unknown $user_name            
     * @param unknown $password            
     * @param unknown $email            
     * @param unknown $mobile            
     */
    public function add($user_name, $password, $safepw,$email, $mobile, $is_system, $qq_openid, $qq_info, $wx_openid, $wx_info,$wx_unionid, $is_member, $instance_id = 0)
    {
        if (! empty($user_name)) {
           
            $count = $this->user->where([
                'user_name' => $user_name
            ])->count();
            if ($count > 0) {
                return USER_REPEAT;
            }
            $nick_name = $user_name;
        }
        
   
        if (! empty($qq_openid)) {
            $qq_info_array = json_decode($qq_info);
            $nick_name = $qq_info_array->nickname;
            $user_head_img = $qq_info_array->figureurl_qq_2;
        } elseif (! empty($wx_openid) || !empty($wx_unionid)) {
            $wx_info_array = json_decode($wx_info);
            $nick_name = $wx_info_array->nickname;
            $user_head_img = $wx_info_array->headimgurl;
        } else {
            $user_head_img = '';
        }
        $local_path = '';
         if(!empty($user_head_img))
        {
            if(!file_exists('upload/user')){
                mkdir('upload/user');
                if(!file_exists('upload/user'))
                {
                    die('upload/user不可写，请检验读写权限!');
                }
            }
            $local_path = 'upload/user/'.time().rand(111,999).'.png';
            save_weixin_img($local_path, $user_head_img);
        } 
        
        /*
         * if(empty($user_name))
         * {
         * $user_name = $this->createUserName();
         * }
         */
        $data = array(
            'user_name' => $user_name,
            /* 'real_password' => $password, */
            'user_password' => md5($password),
            'user_status' => 1,
            'user_headimg' => $local_path,
            'nick_name' => $nick_name,
            'is_system' => (bool) $is_system,
            'is_member' => (bool) $is_member,
            'user_tel' => $mobile,
            'user_tel_bind' => 0,
            'user_qq' => '',
            'qq_openid' => $qq_openid,
            'qq_info' => $qq_info,
            'reg_time' => date("Y-m-d H:i:s", time()),
            'login_num' => 0,
            'user_email' => $email,
            'user_email_bind' => 0,
            'wx_openid' => $wx_openid,

            'wx_is_sub' => 0,
            'wx_info' => $wx_info,
            'other_info' => '',
            'instance_id' => $instance_id,
            'wx_unionid'  => $wx_unionid,
            'securitypwd'=>$safepw
        );
        $this->user->save($data);
        $uid = $this->user->uid;
        return $uid;
    }
    
    public function updateUserInfo($uid, $user_name, $email, $sex, $status, $mobile, $nick_name)
    {
        $user_info = $this->user->getInfo(['uid' => $uid], '*');
        //前期判断
        if (! empty($user_name)) {
             if($user_info['user_name'] != $user_name)
             {
                 $count = $this->user->where([
                     'user_name' => $user_name
                 ])->count();
                 if ($count > 0) {
                     return USER_REPEAT;
                 }
             }
           
        }
        if(! empty($mobile))
        {
            if($user_info['user_tel'] != $mobile)
            {
                $count = $this->user->where([
                    'user_tel' => $mobile
                ])->count();
                if ($count > 0) {
                    return USER_MOBILE_REPEAT;
                }
            }
        }
        if(!empty($email))
        {
            if($user_info['user_email'] != $email)
            {
                $count = $this->user->where([
                    'user_email' => $email
                ])->count();
                if ($count > 0) {
                    return USER_EMAIL_REPEAT;
                }
            }
        }
        if(empty($nick_name))
        {
            $nick_name = $user_name;
        }
        $data = array(
            'user_name' => $user_name,
            'user_tel'  => $mobile,
            'user_email'=> $email,
            'sex' => $sex,
            'user_status' => $status,
            'nick_name' => $nick_name
        );
        $retval = $this->user->save($data, ['uid' => $uid]);
        return $retval;
        
    }

    /**
     * 创建生成用户名
     *
     * @return string
     */
    protected function createUserName()
    {
        $user_name = "n" . date("ymdh" . rand(1111, 9999));
        return $user_name;
    }

    /**
     * 系统用户修改密码
     *
     * @param unknown $uid            
     * @param unknown $old_password            
     * @param unknown $new_password            
     */
    public function ModifyUserPassword($uid, $old_password, $new_password)
    {
        $condition = array(
            'uid' => $uid,
            'user_password' => md5($old_password)
        );
        $res = $this->user->getInfo($condition, $field = "uid");
        if (! empty($res['uid'])) {
            $data = array(
                'user_password' => md5($new_password)
            );
            $res = $this->user->save($data, [
                'uid' => $uid
            ]);
            return $res;
        } else
            return PASSWORD_ERROR;
    }
    /**
     * 
     * @param unknown $uid
     * @param unknown $user_name
     * @return number|string|Ambigous <number, \think\false, boolean, string>
     */
    public function ModifyUserName($uid, $user_name)
    
    {
        $info = $this->user->get($uid);
        if ($info['user_name'] == $user_name) {
            return 1;
        }
        $count = $this->user->where([
            'user_name' => $user_name
        ])->count();
        if ($count > 0) {
            return USER_REPEAT;
        }
        $data = array(
            'user_name' => $user_name
        );
        $res = $this->user->save($data, [
            'uid' => $uid
        ]);
        return $res;
    }

    /**
     * 添加用户登录日志
     *
     * @param unknown $uid            
     * @param unknown $url            
     * @param unknown $desc            
     */
    public function addUserLog($uid, $is_system, $controller, $method, $ip, $get_data)
    {
        $data = array(
            'uid' => $uid,
            'is_system' => $is_system,
            'controller' => $controller,
            'method' => $method,
            'ip' => $ip,
            'data' => $get_data,
            'create_time' => date("Y-m-d H:i:s", time())
        );
        $user_log = new UserLogModel();
        $res = $user_log->save($data);
        return $res;
    }

    /**
     * (non-PHPdoc)
     *
     * @see \ata\api\IUser::getUserDetail()
     */
    public function getUserDetail()
    {
        $user_info = $this->user->get($this->uid);
        if (! empty($user_info['qq_openid'])) {
            $qq_info = json_decode($user_info['qq_info'], true);
            $user_info['qq_info_array'] = $qq_info;
        }
        if (! empty($user_info['wx_openid'])) {
            $wx_info = json_decode($user_info['wx_info'], true);
        }
        return $user_info;
    }

    /**
     * 会员锁定
     * (non-PHPdoc)
     *
     * @see \ata\api\IUser::userLock()
     */
    public function userLock($uid)
    {
        $retval = $this->user->save([
            'user_status' => 0
        ], [
            'uid' => $uid
        ]);
        return $retval;
    }

    /**
     * 会员解锁
     *
     * @param unknown $uid            
     * @return number|\think\false
     */
    public function userUnlock($uid)
    {
        $retval = $this->user->save([
            'user_status' => 1
        ], [
            'uid' => $uid
        ]);
        return $retval;
    }

    /**
     * 用户退出
     */
    public function Logout()
    {
        Session::clear();
        $_SESSION["user_cart"] = '';
    }

    /**
     * (non-PHPdoc)
     *
     * @see \ata\api\IUser::modifyMobile()
     */
    public function modifyMobile($uid, $mobile)
    {
        $retval = $this->user->save([
            'user_tel' => $mobile
        ], [
            'uid' => $uid
        ]);
        return $retval;
    }

    /**
     * (non-PHPdoc)
     *
     * @see \ata\api\IUser::modifyMobile()
     */
    public function modifyNickName($uid, $nickname)
    {
        $retval = $this->user->save([
            'nick_name' => $nickname
        ], [
            'uid' => $uid
        ]);
        return $retval;
    }

    /**
     * (non-PHPdoc)
     *
     * @see \ata\api\IUser::modifyEmail()
     */
    public function modifyEmail($uid, $email)
    {
        $retval = $this->user->save([
            'user_email' => $email
        ], [
            'uid' => $uid
        ]);
        return $retval;
    }

    /**
     * (non-PHPdoc)
     *
     * @see \ata\api\IUser::modifyQQ()
     */
    public function modifyQQ($uid, $qq)
    {
        $retval = $this->user->save([
            'user_qq' => $qq
        ], [
            'uid' => $uid
        ]);
        return $retval;
    }

    /**
     *
     * {@inheritdoc}
     *
     * @see \ata\api\IUser::resetUserPassword()
     */
    public function resetUserPassword($uid)
    {
        $retval = $this->user->save([
            'user_password' => md5(123456)
        ], [
            'uid' => $uid
        ]);
        return 1;
    }

    /**
     *
     * {@inheritdoc}
     *
     * @see \ata\api\IUser::ModifyUserHeadimg()
     */
    public function ModifyUserHeadimg($uid, $user_headimg)
    {
        $info = $this->user->get($uid);
        if ($info['user_headimg'] == $user_headimg) {
            return 1;
        }
        $data = array(
            'user_headimg' => $user_headimg
        );
        $res = $this->user->save($data, [
            'uid' => $uid
        ]);
        return $res;
    }

    /**
     *
     * {@inheritdoc}
     *
     * @see \ata\api\IUser::userTelBind()
     */
    public function userTelBind($uid)
    {
        return $this->user->save([
            'user_tel_bind' => 1
        ], [
            'uid' => $uid
        ]);
    }

    /**
     *
     * {@inheritdoc}
     *
     * @see \ata\api\IUser::removeUserTelBind()
     */
    public function removeUserTelBind($uid)
    {
        return $this->user->save([
            'user_tel_bind' => 0
        ], [
            'uid' => $uid
        ]);
    }

    /**
     *
     * {@inheritdoc}
     *
     * @see \ata\api\IUser::userTelBind()
     */
    public function userEmailBind($uid)
    {
        return $this->user->save([
            'user_email_bind' => 1
        ], [
            'uid' => $uid
        ]);
    }

    /**
     *
     * {@inheritdoc}
     *
     * @see \ata\api\IUser::removeUserTelBind()
     */
    public function removeUserEmailBind($uid)
    {
        return $this->user->save([
            'user_email_bind' => 0
        ], [
            'uid' => $uid
        ]);
    }

    /**
     *
     * {@inheritdoc}
     *
     * @see \ata\api\IUser::checkUserQQopenid()
     */
    public function checkUserQQopenid($qq_openid)
    {
        $user = new UserModel();
        return $user->where([
            'qq_openid' => $qq_openid
        ])->count();
    }

    public function checkUserWchatopenid($openid)
    {
        $user = new UserModel();
        return $user->where([
            'wx_openid' => $openid
        ])->count();
    }

    /**
     *
     * {@inheritdoc}
     *
     * @see \ata\api\IUser::bindQQ()
     */
    public function bindQQ($qq_openid, $qq_info)
    {
        $data = array(
            'qq_openid' => $qq_openid,
            'qq_info' => $qq_info
        );
        $res = $this->user->save($data, [
            'uid' => $this->uid
        ]);
        return $res;
    }

    /**
     *
     * {@inheritdoc}
     *
     * @see \ata\api\IUser::removeBindQQ()
     */
    public function removeBindQQ()
    {
        $data = array(
            'qq_openid' => '',
            'qq_info' => ''
        );
        $res = $this->user->save($data, [
            'uid' => $this->uid
        ]);
        return $res;
    }

    /**
     * (non-PHPdoc)
     *
     * @see \data\api\IMember::memberIsMobile()
     */
    public function memberIsMobile($mobile)
    {
        $mobile_info = $this->user->get([
            'user_tel' => $mobile
        ]);
        return ! empty($mobile_info);
    }

    /**
     * (non-PHPdoc)
     *
     * @see \data\api\IMember::memberIsEmail()
     */
    public function memberIsEmail($email)
    {
        $email_info = $this->user->get([
            'user_email' => $email
        ]);
        return ! empty($email_info);
    }
    /**
     * (non-PHPdoc)
     *
     * @see \data\api\IUser::getUserInfoDetail()
     */
    public function getUserInfoDetail($uid){
        $user_info = $this->user->getInfo(array("uid"=>$uid));
        $member = new NsMemberModel();
        $user_info['member'] = $member->getInfo(array("uid"=>$uid));
        return $user_info;
    }
    
    /**
     * (non-PHPdoc)
     * @see \ata\api\IUser::checkUserIsSubscribe()
     */
    public function checkUserIsSubscribe($uid)
    {
        $user_info = $this->user->getInfo(['uid' => $uid], 'openid');
        if(!empty($user_info['openid']))
        {
            $weixin_fans = new WeixinFansModel();
            $count = $weixin_fans->where(['openid' => $user_info['openid'],'is_subscribe' => 1])->count();
            if($count > 0)
            {
                return 1;
            }else{
                return 0;
            }
        } else{
            return 0;
        }
    }
    /**
     * (non-PHPdoc)
     * @see \ata\api\IUser::checkUserIsSubscribeInstance()
     */
    public function checkUserIsSubscribeInstance($uid, $instance_id)
    {
        $user_info = $this->user->getInfo(['uid' => $uid], 'wx_openid');
        if(!empty($user_info['wx_openid']))
        {
            $weixin_fans = new WeixinFansModel();
            $count = $weixin_fans->where(['openid' => $user_info['wx_openid'],'is_subscribe' => 1])->count();
            if($count > 0)
            {
                return 1;
            }else{
                return 0;
            }
        } else{
            return 0;
        }
    
        
    }
	/* (non-PHPdoc)
     * @see \ata\api\IUser::getUserCount()
     */
    public function getUserCount($condition)
    {
        // TODO Auto-generated method stub
        $user= new UserModel();
        $user_list = $user->getQuery($condition, "count(*) as count", '');
        return $user_list[0]["count"];
    }
    
    /**
     * (non-PHPdoc)
     * @see \data\api\IUser::checkMobileIsHas()
     */
    public function checkMobileIsHas($mobile){
        $user= new UserModel();
        $count = $user->getCount(['user_tel' => $mobile]);
        return $count;
    }
    /**
     * 根据用户邮箱更改密码
     */
    public function updateUserPasswordByEmail($userInfo, $password){
        $data = array(
            'user_password' => md5($password)
        );
        $retval = $this->user->save($data, ['user_email' => $userInfo]);
        return $retval;
    }
    /**
     * 根据用户邮箱更改密码
     */
    public function updateUserPasswordByMobile($userInfo, $password){
        $data = array(
            'user_password' => md5($password)
        );
        $retval = $this->user->save($data, ['user_tel' => $userInfo]);
        return $retval;
    }
}

