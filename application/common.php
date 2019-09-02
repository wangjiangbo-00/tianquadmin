<?php


// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 李广
// +----------------------------------------------------------------------
use \data\extend\QRcode as QRcode;
use think\Request;
use think\Config;
use \data\service\Config as ConfigService;
use think\response\Redirect;
use data\extend\alisms\top\TopClient;
use data\extend\alisms\top\request\AlibabaAliqinFcSmsNumSendRequest;
use think\Hook;
use data\extend\email\Email;
//错误级别
//error_reporting(E_ERROR | E_WARNING | E_PARSE);
//去除警告错误
error_reporting(E_ALL ^ E_NOTICE);
define("PAGESIZE", Config::get('paginate.list_rows'));
define("PAGESHOW", Config::get('paginate.list_showpages'));
define("PICTURESIZE", Config::get('paginate.picture_page_size'));
#订单退款状态
define('ORDER_REFUND_STATUS', 11);
#订单完成的状态
define('ORDER_COMPLETE_SUCCESS', 4);
define('ORDER_COMPLETE_SHUTDOWN', 5);
define('ORDER_COMPLETE_REFUND', -2);
    /**
     * 配置pc端缓存
     */
    function getShopCache(){
        
        if(!Request::instance()->isAjax())
        {
            $model = Request::instance()->module();
            $model = strtolower($model);
            $controller = Request::instance()->controller();
            $controller = strtolower($controller);
            $action = Request::instance()->action();
            $action = strtolower($action);
            if($model =='shop' && $controller =='index' && $action="index" )
            {
                if(Request::instance()->isMobile())
                {
                    Redirect::create("wap/index/index");
                }else{
                    Request::instance()->cache('__URL__',1800);
                }
                
            }
            if($model == 'shop' && $controller !='goods' && $controller !='member' )
            {
                Request::instance()->cache('__URL__',1800);
            } 
            if($model == 'shop' && $controller =='goods' && $action =='brandlist' )
            {
                Request::instance()->cache('__URL__',1800);
            }
            
        }
      
    }

function http_post_data($url, $data_string) {

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $data_string);
    curl_setopt($ch, CURLOPT_HEADER, 0);
    curl_setopt($ch, CURLOPT_HTTPHEADER, array(
            'Content-Type: application/json; charset=utf-8',
            'Content-Length: ' . strlen($data_string))
    );
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    $res = curl_exec($ch);
    $errorno = curl_errno($ch);
    $return_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);

    return  $res;
}

function http_do_get($url, $params) {
    $url = "{$url}?" . http_build_query ( $params );
    $ch = curl_init ();
    curl_setopt ( $ch, CURLOPT_URL, $url );
    curl_setopt ( $ch, CURLOPT_RETURNTRANSFER, 1 );
    curl_setopt ( $ch, CURLOPT_CUSTOMREQUEST, 'GET' );
    curl_setopt ( $ch, CURLOPT_TIMEOUT, 60 );
    //curl_setopt ( $ch, CURLOPT_POSTFIELDS, $params );
    $result = curl_exec ( $ch );
    curl_close ( $ch );
    return $result;
}


    /**
     * 关闭站点
     */
    function webClose($reason){
        if(Request::instance()->isMobile())
        {
            echo  "<meta charset='UTF-8'>
                    <div style='width:75%;margin:auto;margin-top:250px;    overflow: hidden;'>
                    	<img src='".__ROOT__."/public/admin/images/error.png' style='display: inline-block;float: left;width:25%;'/>
                    	<span style='font-size: 40px; margin-top: 50px;margin-left: 40px; display: inline-block;width: 68%;color: #666;'>".$reason."</span>
                    	</div>
                ";
        }else{
            echo  "<meta charset='UTF-8'>
                    <div style='width:35%;margin:auto;margin-top:250px;overflow: hidden;'>
                    	<img src='".__ROOT__."/public/admin/images/error.png' style='display: inline-block;float: left;width:20%;'/>
                    	<span style='font-size: 24px; margin-top: 30px;margin-left: 40px; display: inline-block; width:70%;color:#666'>".$reason."</span>
                    	</div>
                ";
        }
        
        exit();
    }
    /**
     * 获取手机端缓存
     */
    function getWapCache(){
        if(!Request::instance()->isAjax())
        {
            $model = Request::instance()->module();
            $model = strtolower($model);
            $controller = Request::instance()->controller();
            $controller = strtolower($controller);
            $action = Request::instance()->action();
            $action = strtolower($action);
            //店铺页面缓存8分钟
            if($model == 'wap' && $controller =='shop' && $action =='index' )
            {
                Request::instance()->cache('__URL__',480);
            }
            if($model == 'wap' && $controller !='goods' && $controller !='member' )
            {
                Request::instance()->cache('__URL__',1800);
            }
            if($model == 'wap' && $controller =='goods' && $action !='brandlist' )
            {
                Request::instance()->cache('__URL__',1800);
            }
            if($model == 'wap' && $controller =='goods' && $action !='goodsGroupList' )
            {
                Request::instance()->cache('__URL__',1800);
            }
        }
    }



function random_string( $length = 6 )
{
    // 密码字符集，可任意添加你需要的字符
    $chars = array('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h',
        'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's',
        't', 'u', 'v', 'w', 'x', 'y', 'z',
        '0', '1', '2', '3', '4', '5', '6', '7', '8', '9');
    // 在 $chars 中随机取 $length 个数组元素键名
    $keys = array_rand($chars, $length);
    $password = '';
    for ($i = 0; $i < $length; $i++) {
        // 将 $length 个数组元素连接成字符串
        $password .= $chars[$keys[$i]];
    }
    return $password;

}
   
    
    // 应用公共函数库
    /**
     * 循环删除指定目录下的文件及文件夹
     * @param string $dirpath 文件夹路径
     */
    function NiuDelDir($dirpath){
        $dh=opendir($dirpath);
        while (($file=readdir($dh))!==false) {
            if($file!="." && $file!="..") {
                $fullpath=$dirpath."/".$file;
                if(!is_dir($fullpath)) {
                    unlink($fullpath);
                } else {
                    NiuDelDir($fullpath);
                    rmdir($fullpath);
                }
            }
        }
        closedir($dh);
        $isEmpty = true;
        $dh=opendir($dirpath);
        while (($file=readdir($dh))!== false) {
            if($file!="." && $file!="..") {
                $isEmpty = false;
                break;
            }
        }
        return $isEmpty;
    }
    /**
     * 生成数据的返回值
     * @param unknown $msg
     * @param unknown $data
     * @return multitype:unknown
     */
    function AjaxReturn($err_code, $data = []){
//         return $retval;
        $rs = ['code'=>$err_code,'message'=>getErrorInfo($err_code)];
        if(!empty($data))
            $rs['data'] = $data;
            return $rs;
    }
    /**
     * 图片上传函数返回上传的基本信息
     * 传入上传路径
     */
    function uploadImage($path)
    {
        $fileKey = key($_FILES);
        $file = request()->file($fileKey);
        if($file===null){
            return array('error'=>'上传文件不存在或超过服务器限制', 'status'=>'-1');
        }
        $validate = new \think\Validate([
            ['fileMime','fileMime:image/png,image/gif,image/jpeg,image/x-ms-bmp','只允许上传jpg,gif,png,bmp类型的文件'],
            ['fileExt','fileExt:jpg,jpeg,gif,png,bmp','只允许上传后缀为jpg,gif,png,bmp的文件'],
            ['fileSize','fileSize:2097152','文件大小超出限制'],//最大2M
        ]);
        $data = ['fileMime'  => $file,
            'fileSize' => $file,
            'fileExt'=> $file
        ];
        if (!$validate->check($data)) {
            return array('error'=>$validate->getError(),'status'=>-1);
        }
        $save_path = './'.getUploadPath().'/'.$path;
        $info = $file->rule('uniqid')->move($save_path);
        if($info)
        {
            //获取基本信息
            $result['ext'] = $info->getExtension();
            $result['pic_cover'] = $path.'/'.$info->getSaveName();
            $result['pic_name'] = $info->getFilename();
            $result['pic_size'] = $info->getSize();
            $img = \think\Image::open('./'.getUploadPath().'/'.$result['pic_cover']);
            var_dump($img); 
            return $result;
        }
        
    }
    /**
     * 判断当前是否是微信浏览器
     */
    function isWeixin(){
        if ( strpos($_SERVER['HTTP_USER_AGENT'],
        
            'MicroMessenger') !== false ) {
        
            return 1;
        
        }
        
        return 0;
    }
    /**
     * 获取上传根目录
     * @return Ambigous <\think\mixed, NULL, multitype:>
     */
    function getUploadPath(){
        $list = \think\config::get("view_replace_str.__UPLOAD__");
        return $list;
    }
    /**
     * 获取系统根目录
     */
    function getRootPath(){
        return dirname(dirname(dirname(dirname(__File__))));
    }
   /**
    * 通过第三方获取随机用户名
    * @param unknown $type
    */
    function setUserNameOauth($type)
    {
        $time = time();
        $name = $time.rand(100,999);
        return $type.'_'.name;
    }
    /**
     * 获取标准二维码格式
     * @param unknown $url
     * @param unknown $path
     * @param unknown $ext
     */
    function getQRcode($url, $path, $qrcode_name)
    {    
        if(!is_dir($path)){
            mkdir($path,'0777',true);
        }
        $path = $path.'/'.$qrcode_name.'.png';
        QRcode::png($url,$path,'',4,1);
        return $path;
    }

    /**
     * 根据HTTP请求获取用户位置
     */
    function getUserLocation(){
        $key = "16199cf2aca1fb54d0db495a3140b8cb";//高德地图key
        $url = "http://restapi.amap.com/v3/ip?key=$key";
        $json = file_get_contents($url);
        $obj = json_decode($json,true);//转换数组
        $obj["message"] = $obj["status"]==0?"失败":"成功";
        return $obj;
    }
    
    /**
     * 根据 ip 获取 当前城市
     */
     function get_city_by_ip(){
        if(!empty($_SERVER["HTTP_CLIENT_IP"])){
            $cip = $_SERVER["HTTP_CLIENT_IP"];
        }
        elseif(!empty($_SERVER["HTTP_X_FORWARDED_FOR"])){
            $cip = $_SERVER["HTTP_X_FORWARDED_FOR"];
        }
        elseif(!empty($_SERVER["REMOTE_ADDR"])){
            $cip = $_SERVER["REMOTE_ADDR"];
        }
        else{
            $cip = "";
        }
        $url = 'http://restapi.amap.com/v3/ip';
        $data = array(
            'output' => 'json',
            'key' => '16199cf2aca1fb54d0db495a3140b8cb',
            'ip' => $cip
        );
    
        $postdata = http_build_query($data);
        $opts = array('http' =>
            array(
                'method'  => 'POST',
                'header'  => 'Content-type: application/x-www-form-urlencoded',
                'content' => $postdata
            )
        );
    
        $context = stream_context_create($opts);
         
        $result = file_get_contents($url, false, $context);
        $res = json_decode($result,true);
        if(count($res['province'])==0){
            $res['province'] = '北京市';
        }
        if(count($res['city'])==0){
            $res['city'] = '北京市';
        }
        return $res;
    }
    
    
    
    /**
     * 颜色十六进制转化为rgb
     */
    function hColor2RGB($hexColor)
    {
        $color = str_replace('#', '', $hexColor);
        if (strlen($color) > 3) {
            $rgb = array(
                'r' => hexdec(substr($color, 0, 2)),
                'g' => hexdec(substr($color, 2, 2)),
                'b' => hexdec(substr($color, 4, 2))
            );
        } else {
            $color = str_replace('#', '', $hexColor);
            $r = substr($color, 0, 1) . substr($color, 0, 1);
            $g = substr($color, 1, 1) . substr($color, 1, 1);
            $b = substr($color, 2, 1) . substr($color, 2, 1);
            $rgb = array(
                'r' => hexdec($r),
                'g' => hexdec($g),
                'b' => hexdec($b)
            );
        }
        return $rgb;
    }
    

    /**
     * 制作推广二维码
     * @param unknown $path 二维码地址
     * @param unknown $thumb_qrcode中继二维码地址
     * @param unknown $user_headimg 头像
     * @param unknown $shop_logo  店铺logo
     * @param unknown $user_name 用户名
     * @param unknown $data 画布信息  数组
     * @param unknown $create_path 图片创建地址 没有的话不创建图片
     */
    function showUserQecode($upload_path,$path, $thumb_qrcode, $user_headimg, $shop_logo, $user_name,  $data, $create_path){
       
        //暂无法生成
        if(!file_exists($path)){
            $path = "public/static/images/template_qrcode.png";           
        }
        
        if(!file_exists($upload_path)){
            mkdir($upload_path,0777,true);
        }
        
        //定义中继二维码地址

        $image = \think\Image::open($path);
        // 生成一个固定大小为360*360的缩略图并保存为thumb_....jpg
        $image->thumb(288, 288, \think\Image::THUMB_CENTER)->save($thumb_qrcode);
        //背景图片
        $dst = $data["background"];
        if(!file_exists($dst)){
            $dst = "public/static/images/qrcode_bg/shop_qrcode_bg.png";
        }
    
        //$dst = "http://pic107.nipic.com/file/20160819/22733065_150621981000_2.jpg";
        //生成画布
        list ($max_width, $max_height) = getimagesize($dst);
//         $dests = imagecreatetruecolor($max_width, $max_height);
        $dests = imagecreatetruecolor(640, 1134);
        $dst_im = getImgCreateFrom($dst);
        imagecopy($dests, $dst_im, 0, 0, 0, 0, $max_width, $max_height);
        //($dests, $dst_im, 0, 0, 0, 0, 640, 1134, $max_width, $max_height);
        imagedestroy($dst_im);
        // 并入二维码
        //$src_im = imagecreatefrompng($thumb_qrcode);
        $src_im = getImgCreateFrom($thumb_qrcode);
        $src_info = getimagesize($thumb_qrcode);
        //imagecopy($dests, $src_im, $data["code_left"] * 2, $data["code_top"] * 2, 0, 0, $src_info[0], $src_info[1]);
        imagecopy($dests, $src_im, $data["code_left"] * 2, $data["code_top"] * 2, 0, 0, $src_info[0], $src_info[1]);
        imagedestroy($src_im);
        // 并入用户头像
    
        if(!file_exists($user_headimg)){
            $user_headimg = "public/static/images/qrcode_bg/head_img.png";
        }
        $src_im_1 = getImgCreateFrom($user_headimg);
        $src_info_1 = getimagesize($user_headimg);
        //             imagecopy($dests, $src_im_1, $data['header_left'] * 2, $data['header_top'] * 2, 0, 0, $src_info_1[0], $src_info_1[1]);
        //imagecopy($dests, $src_im_1, $data['header_left'] * 2, $data['header_top'] * 2, 0, 0, $src_info_1[0], $src_info_1[1]);
        imagecopyresampled($dests, $src_im_1, $data['header_left'] * 2, $data['header_top'] * 2, 0, 0, 80, 80, $src_info_1[0], $src_info_1[1]);
        imagedestroy($src_im_1);
    
        // 并入网站logo
        if ($data['is_logo_show'] == '1') {
            if(!file_exists($shop_logo)){
                $shop_logo = "public/static/images/logo.png";
            }
            $src_im_2 = getImgCreateFrom($shop_logo);
            $src_info_2 = getimagesize($shop_logo);
            //imagecopy($dests, $src_im_2, $data['logo_left'] * 2, $data['logo_top'] * 2, 0, 0, $src_info_2[0], $src_info_2[1]);
            imagecopyresampled($dests, $src_im_2, $data['logo_left'] * 2, $data['logo_top'] * 2, 0, 0, 200, 80, $src_info_2[0], $src_info_2[1]);
            
            imagedestroy($src_im_2);
        }
        // 并入用户姓名
        if($user_name == ""){
            $user_name ="用户";
        }
        $rgb = hColor2RGB($data['nick_font_color']);
        $bg = imagecolorallocate($dests, $rgb['r'], $rgb['g'], $rgb['b']);
        $name_top_size = $data['name_top'] * 2 + $data['nick_font_size'];
        @imagefttext($dests, $data['nick_font_size'], 0, $data['name_left'] * 2, $name_top_size, $bg, "public/static/font/Microsoft.ttf",$user_name);
        header("Content-type: image/jpeg");
        if($create_path == ""){
            imagejpeg($dests);            
        }else{
            imagejpeg($dests, $create_path);
        }
    }
    /**
     * 把微信生成的图片存入本地
     * @param [type] $username   [用户名]
     * @param [string] $LocalPath  [要存入的本地图片地址]
     * @param [type] $weixinPath [微信图片地址]
     *
     * @return [string] [$LocalPath]失败时返回 FALSE
     */
    function save_weixin_img ($local_path, $weixin_path){
        $weixin_path_a = str_replace("https://", "http://", $weixin_path);
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $weixin_path_a);
        curl_setopt($ch, CURLOPT_TIMEOUT, 5);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        $r = curl_exec($ch);
        curl_close($ch);
        if (!empty($local_path) && !empty($weixin_path_a)) {
            $msg = file_put_contents($local_path, $r);
        }
        return $local_path;
    }
    //分类获取图片对象
    function getImgCreateFrom($img_path){
        $ename=getimagesize($img_path);
        $ename=explode('/',$ename['mime']);
        $ext=$ename[1];
        switch($ext){
            case "png":
    
                $image=imagecreatefrompng($img_path);
                break;
            case "jpeg":
    
                $image=imagecreatefromjpeg($img_path);
                break;
            case "jpg":
    
                $image=imagecreatefromjpeg($img_path);
                break;
            case "gif":
    
                $image=imagecreatefromgif($img_path);
                break;
        }
        return $image;
    }
    /**
     * 生成流水号
     * @return string
     */
    function getSerialNo()
    {
        $no_base = date("ymdhis",time());
        $serial_no = $no_base.rand(111,999);
        return $serial_no;
    }
    /**
     * 删除图片文件
     * @param unknown $img_path
     */
    function removeImageFile($img_path){
        //检查图片文件是否存在
        if(file_exists($img_path))
        { 
            return unlink($img_path);
        }else{
            return false;
        }
    }
    /**
     * 阿里大于短信发送
     * @param unknown $appkey
     * @param unknown $secret
     * @param unknown $signName
     * @param unknown $smsParam
     * @param unknown $send_mobile
     * @param unknown $template_code
     */
    function aliSmsSend($appkey, $secret, $signName, $smsParam, $send_mobile, $template_code, $sms_type=0){
        if($sms_type==0){
            #旧用户发送短信
            return aliSmsSendOld($appkey, $secret, $signName, $smsParam, $send_mobile, $template_code);
        }else{
            #新用户发送短信
            return aliSmsSendNew($appkey, $secret, $signName, $smsParam, $send_mobile, $template_code);
        }
    }
    /**
     * 阿里大于旧用户发送短信
     * @param unknown $appkey
     * @param unknown $secret
     * @param unknown $signName
     * @param unknown $smsParam
     * @param unknown $send_mobile
     * @param unknown $template_code
     * @return Ambigous <unknown, \ResultSet, mixed>
     */
    function aliSmsSendOld($appkey, $secret, $signName, $smsParam, $send_mobile, $template_code){
        include 'data/extend/alisms/TopSdk.php';
        $c = new TopClient();
        $c->appkey = $appkey;
        $c->secretKey = $secret;
        $req = new AlibabaAliqinFcSmsNumSendRequest();
        $req->setExtend("");
        $req->setSmsType("normal");
        $req->setSmsFreeSignName($signName);
        $req->setSmsParam($smsParam);
        $req->setRecNum($send_mobile);
        $req->setSmsTemplateCode($template_code);
        $result=$resp = $c->execute($req);
        return $result;
    }
    /**
     * 阿里大于新用户发送短信
     * @param unknown $appkey
     * @param unknown $secret
     * @param unknown $signName
     * @param unknown $smsParam
     * @param unknown $send_mobile
     * @param unknown $template_code
     */
    function aliSmsSendNew($appkey, $secret, $signName, $smsParam, $send_mobile, $template_code){
        include 'data/extend/alisms_new/aliyun-php-sdk-core/Config.php';
        include 'data/extend/alisms_new/SendSmsRequest.php';
        //短信API产品名
        $product = "Dysmsapi";
        //短信API产品域名
        $domain = "dysmsapi.aliyuncs.com";
        //暂时不支持多Region
        $region = "cn-hangzhou";
        $profile = DefaultProfile::getProfile($region, $appkey, $secret);
        DefaultProfile::addEndpoint("cn-hangzhou", "cn-hangzhou", $product, $domain);
        $acsClient= new DefaultAcsClient($profile);
        
        $request = new SendSmsRequest();
        //必填-短信接收号码
        $request->setPhoneNumbers($send_mobile);
        //必填-短信签名
        $request->setSignName($signName);
        //必填-短信模板Code
        $request->setTemplateCode($template_code);
        //选填-假如模板中存在变量需要替换则为必填(JSON格式)
        $request->setTemplateParam($smsParam);
        //选填-发送短信流水号
        $request->setOutId("0");
        //发起访问请求
        $acsResponse = $acsClient->getAcsResponse($request);
        return $acsResponse;
    }
    /**
     * 发送邮件
     * @param unknown $toemail
     * @param unknown $title
     * @param unknown $content
     * @return boolean
     */
    function emailSend($email_host, $email_id, $email_pass, $email_addr, $toemail, $title, $content){
        $result=false;
        //try {
            $mail = new Email();
            $mail->setServer($email_host, $email_id, $email_pass);
            $mail->setFrom($email_addr);
            $mail->setReceiver($toemail);
            $mail->setMailInfo($title, $content);
            $result=$mail->sendMail();
        //} catch (\Exception $e) {
          //  $result=false;
        //}
        return $result;
    }
    /**
     * 执行钩子
     * @param unknown $hookid
     * @param string $params
     */
    function runhook($class, $tag, $params = null){
        $result=array();
        try {
            $result=Hook::exec("\\data\\extend\\hook\\".$class, $tag, $params);
        } catch (\Exception $e) {
            $result["code"]=-1;
            $result["message"]="请求失败!";
        }
        return $result;
    }
    
    /**
     * 格式化字节大小
     * @param  number $size		字节数
     * @param  string $delimiter 数字和单位分隔符
     * @return string				格式化后的带单位的大小
     * @author
     */
    function format_bytes($size, $delimiter = '') {
        $units = array('B', 'KB', 'MB', 'GB', 'TB', 'PB');
        for ($i = 0; $size >= 1024 && $i < 5; $i++)
            $size /= 1024;
        return round($size, 2) . $delimiter . $units[$i];
    }

function get56code($companyname) {
    $transtable = [
        '申通'=>"shengtong",
        '圆通'=>"yuantong",
        '顺丰'=>"shunfeng",
        '中通'=>"zhongtong",
    ];
}
    
    