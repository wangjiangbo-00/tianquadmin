<?php
/**
 * IConfig.php
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
namespace data\api;
/**
 * 系统配置
 */
interface IConfig
{
    /**
     * 获取微信基本配置(WCHAT)
     */
    function getWchatConfig($instance_id);
    
   /**
    *   开放平台网站应用授权登录
    * @param unknown $appid
    * @param unknown $appsecret
    * @param unknown $url
    * @param unknown $call_back_url
    */
    function setWchatConfig($instance_id, $appid, $appsecret, $url, $call_back_url, $is_use);
    
    /**
     * 获取QQ互联配置(QQ)
     */
    function getQQConfig($instance_id);
    
    /**
     * qq互联
     * @param unknown $appkey
     * @param unknown $appsecret
     * @param unknown $url
     * @param unknown $call_back_url
     */
    function setQQConfig($instance_id, $appkey, $appsecret, $url, $call_back_url, $is_use);
    /**
     * 获取系统登录配置信息
     */
    function getLoginConfig();
    
    /**
     * 获取微信支付参数(WPAY)
     */
    function getWpayConfig($instance_id);
    
    /**
     * 设置微信支付参数(WPAY)
     * @param unknown $appid  微信登录appid
     * @param unknown $appkey  微信登录appkey
     * @param unknown $mch_id  商户账号
     * @param unknown $mch_key  商户支付秘钥
     */
    function setWpayConfig($instanceid, $appid, $appkey, $mch_id, $mch_key, $is_use);
    
    /**
     * 获取支付宝支付参数(ALIPAY)
     */
    function getAlipayConfig($instance_id);
    
    /**
     * 设置支付宝支付配置(ALIPAY)
     * @param unknown $partnerid  商户ID
     * @param unknown $seller    商户账号
     * @param unknown $ali_key   商户秘钥
     */
    function setAlipayConfig($instanceid,$partnerid, $seller, $ali_key, $is_use);
    /**
     * 设置微信和支付宝开关状态
     */
    public function setWpayStatusConfig($instanceid,$is_use,$type);

    /**
     * PC商城热搜关键词获取
     */
    function getHotsearchConfig($instanceid);
    
    /**
     * PC商城热搜关键词设置
     * @param unknown $partnerid
     * @param unknown $seller
     * @param unknown $ali_key
     */
    function setHotsearchConfig($instanceid, $keywords, $is_use);
    
    /**
     * pc 商城获取 默认搜索
     * @param unknown $instanceid
     */
    function getDefaultSearchConfig($instanceid);
    
    /**
     * PC商城热搜关键词设置
     * @param unknown $instanceid
     * @param unknown $keywords
     * @param unknown $is_use
     */
    function setDefaultSearchConfig($instanceid, $keywords, $is_use);
    
    /**
     * 获取 用户通知 
     */
    function getUserNotice($instanceid);
    
    /**
     * 设置 用户通知
     */
    function setUserNotice($instanceid,$keywords, $is_use);
    
    /**
     * 获取 发送邮件接口设置
     */
    function getEmailMessage($instanceid);
    
    /**
     * 设置  发送邮件接口设置
     */
    function setEmailMessage($instanceid, $email_host, $email_port, $email_addr, $email_id, $email_pass, $is_use);
    
    /**
     * 获取 发送短信接口设置
     * @param unknown $instanceid
     */
    function getMobileMessage($instanceid);
    /**
     * 设置    发送短信接口设置
     * @param unknown $instanceid
     * @param unknown $app_key
     * @param unknown $secret_key
     * @param unknown $is_use
     * @param unknown $user_type 用户类型
     */
    function setMobileMessage($instanceid, $app_key, $secret_key, $free_sign_name, $is_use,$user_type);
    /**
     * 获取   微信开放平台接口设置
     * @param unknown $instanceid
     */
    function getWinxinOpenPlatformConfig($instanceid);
    /**
     * 设置   微信开放平台接口设置
     * @param unknown $instanceid
     * @param unknown $appid
     * @param unknown $appsecret
     * @param unknown $encodingAesKey
     * @param unknown $tk
     * @param unknown $is_use
     */
    function setWinxinOpenPlatformConfig($instanceid, $appid, $appsecret, $encodingAesKey, $tk);
    /**
     * 获取     登录验证码
     */
    function getLoginVerifyCodeConfig($instanceid);
    /**
     * 设置       登录验证码是否开启
     * @param unknown $platform
     * @param unknown $admin
     * @param unknown $pc
     */
    function setLoginVerifyCodeConfig($instanceid, $platform, $admin, $pc);
    /**
     * 对于单店铺系统获取微信配置
     * @param unknown $instance_id
     */
    function getInstanceWchatConfig($instance_id);
    /**
     * 对于单店铺系统设置微信配置
     * @param unknown $instance_id
     * @param unknown $appid
     * @param unknown $appsecret
     */
    function setInstanceWchatConfig($instance_id, $appid, $appsecret);
    /**
     * 获取其他支付方式配置
     */
    function getOtherPayTypeConfig();
    /**
     * 设置其他支付方式配置
     * @param unknown $is_coin_pay
     * @param unknown $is_balance_pay
     */
    function setOtherPayTypeConfig($is_coin_pay, $is_balance_pay);

    /**
     * 获取公告单条详情
     * @param unknown $id
     */
    function getNotice($shop_id);
    /**
     * 设置公告
     * @param unknown $id
     * @param unknown $is_enable
     */
    function setNotice($shopid, $notice_message, $is_enable);
    
    /**
     * 获取系统设置value值
     * 传入字符串    $key = 'key1,key2,key3,.....'
     * 返回数组    array('key1' => 'value1', 'key2' => 'value2', 'key3' => 'value3', .....)
     * @param unknown $instance_id
     * @param unknown $key
     */
    function getConfig($instance_id, $key);
    /**
     * 设置系统设置
     * 传入数组 格式必须为
     * 例：$array[0] = array(
            'instance_id' => $this->instance_id,
            'key' => 'ORDER_BUY_CLOSE_TIME',
            'value' => '30',
            'desc' => '订单下单之后多少分钟未支付则关闭订单',
            'is_use' => 1
        );
        $array[1] = array(
            'instance_id' => $this->instance_id,
            'key' => 'ORDER_DELIVERY_COMPLETE_TIME',
            'value' => '7',
            'desc' => '订单收货之后多长时间自动完成',
            'is_use' => 1
        );
        ...
     */
    function setConfig($params);
    /**
     * 得到系统通知的详情
     * @param unknown $shop_id
     * @param unknown $template_code
     */
    function getNoticeTemplateDetail($shop_id, $template_code);
    /**
     * 更新通知模板
     * @param unknown $template_id
     * @param unknown $shop_id
     * @param unknown $template_code
     * @param unknown $template
     */
    function updateNoticeTemplate($shop_id, $template_code, $template);
    /**
     * 得到店铺的通知系统项
     * @param unknown $shop_id
     */
    function getNoticeConfig($shop_id);
    /**
     * 得到店铺的发送项
     */
    function getNoticeTemplateItem($template_code);
    /**
     * 得到店铺的模板集合
     * @param unknown $template_type
     */
    function getNoticeTemplateType($template_type);
    /**
     * 支付的通知项
     * @param unknown $shop_id
     */
    public function getPayConfig($shop_id);
    /**
     * 获取会员余额提现设置
     * @param unknown $shop_id
     */
    function getBalanceWithdrawConfig($shop_id);
    /**
     * 设置会员余额设置
     * @param unknown $shop_id
     * @param unknown $key
     * @param unknown $value
     * @param unknown $desc
     * @param unknown $is_use
     */
    function setBalanceWithdrawConfig($shop_id, $key, $value, $is_use);
    /**
     * 获取seo设置
     * @param unknown $shop_id
     */
    function getSeoConfig($shop_id);
    /**
     * 设置 seo设置
     * @param unknown $shop_id
     * @param unknown $seo_title
     * @param unknown $seo_meta
     * @param unknown $seo_desc
     * @param unknown $seo_other
     */
    function SetSeoConfig($shop_id, $seo_title, $seo_meta, $seo_desc, $seo_other);
    
    function updateConfigEnable($id, $is_use);
    /**
     * 获取通知模板单条信息
     * @param unknown $shop_id
     * @param unknown $template_type
     * @param unknown $template_code
     */
    function getNoticeTemplateOneDetail($shop_id, $template_type, $template_code);

    /**
     * 获取注册与访问的设置
     * @param unknown $shop_id
     */
    function getRegisterAndVisit($shop_id);
    function getGiftFreeChance($shop_id);
    /**
     * 设置注册与访问的设置
     * @param unknown $is_register
     * @param unknown $register_info
     * @param unknown $name_keyword
     * @param unknown $pwd_len
     * @param unknown $pwd_complexity
     * @param unknown $terms_of_service
     * @param unknown $is_use
     */
    function setRegisterAndVisit($shop_id,$is_register,$register_info,$name_keyword,$pwd_len,$pwd_complexity,$terms_of_service,$is_use);

    public function setGiftFreeChance($shop_id, $is_open, $chance);
    /**
     * 数据库表信息列表
     */
    function getDatabaseList();
    /**
     * 得到店铺的邮箱配置信息
     * @param unknown $shop_id
     */
    function getNoticeEmailConfig($shop_id);
    /**
     * 得到店铺的短信配置信息
     * @param unknown $shop_id
     */
    function getNoticeMobileConfig($shop_id);
    /**
     * 物流跟踪信息查询
     * @param unknown $shop_id
     */
    function getOrderExpressMessageConfig($shop_id);
    /**
     * 物流跟踪信息修改
     * @param unknown $shop_id
     * @param unknown $appid
     * @param unknown $appkey
     * @param unknown $is_use
     */
    function updateOrderExpressMessageConfig($shop_id, $appid, $appkey, $back_url, $is_use);
}