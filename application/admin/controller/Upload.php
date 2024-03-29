<?php
/**
 * Upload.php
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
require __DIR__ . '/../../../thirdpart/qiniu/QiniuClient.php';

require_once __DIR__ .'/../../../thirdpart/qiniu/autoload.php';
require_once   __DIR__ .'/../../../thirdpart/txoss/autoload.php';


\think\Loader::addNamespace('data', 'data/');


use data\service\Album as Album;
use think\Controller;

define('BASE_PATH',str_replace('\\','/',realpath(dirname(__FILE__).'/'))."/");

define('QINIU_BASEURL',"http://www.imgtqbu.weiruikj.cn/");

define('TXOSS_BASEURL',"https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/");
use Qiniu\Auth;
use Qiniu\Storage\UploadManager;



/**
 * 图片上传控制器
 * goods（文件夹存放商品）
 * goods_id（每个商品的）
 * images（商品主图）
 * sku_img（sku图片）
 *
 * common文件夹（存放公共图）
 *
 * advertising文件夹（存放广告位图）
 *
 * avator文件夹（用户头像）
 *
 * pay文件夹（支付生成的图）
 *
 *
 * @author Administrator
 *        
 */
use think\Config;

// 存放商品图片、主图、sku
define("UPLOAD_GOODS", Config::get('view_replace_str.UPLOAD_GOODS'));
// 存放商品图片、主图、sku
define("UPLOAD_GOODS_SKU", Config::get('view_replace_str.UPLOAD_GOODS_SKU'));

// 存放商品品牌图
define("UPLOAD_GOODS_BRAND", Config::get('view_replace_str.UPLOAD_GOODS_BRAND'));

// 存放商品分组图片
define("UPLOAD_GOODS_GROUP", Config::get('view_replace_str.UPLOAD_GOODS_GROUP'));

// 存放商品分类图片
define("UPLOAD_GOODS_CATEGORY", Config::get('view_replace_str.UPLOAD_GOODS_CATEGORY'));

// 存放公共图片、网站logo、独立图片、没有任何关联的图片
define("UPLOAD_COMMON", Config::get('view_replace_str.UPLOAD_COMMON'));

// 存放用户头像
define("UPLOAD_AVATOR", Config::get('view_replace_str.UPLOAD_AVATOR'));

// 存放支付生成的二维码图片
define("UPLOAD_PAY", Config::get('view_replace_str.UPLOAD_PAY'));

// 存放广告位图片
define("UPLOAD_ADV", Config::get('view_replace_str.UPLOAD_ADV'));

// 存放物流图片
define("UPLOAD_EXPRESS", Config::get('view_replace_str.UPLOAD_EXPRESS'));

class Upload extends Controller
{

    private $return = array();
    
    // 文件路径
    private $file_path = "";
    
    // 重新设置的文件路径
    private $reset_file_path = "";
    
    // 文件名称
    private $file_name = "";
    
    // 文件大小
    private $file_size = 0;
    
    // 文件类型
    private $file_type = "";
    
    /**
     * 功能说明：文件(图片)上传(存入相册)
     */
    public function uploadFile()
    {
        $this->file_path = request()->post("file_path", "");
        if ($this->file_path == "") {
            $this->return['message'] = "文件路径不能为空";
            return $this->ajaxFileReturn();
        }

        // 重新设置文件路径
        $this->resetFilePath();
        // 检测文件夹是否存在，不存在则创建文件夹
        if (! file_exists($this->reset_file_path)) {
            mkdir($this->reset_file_path, 0777, true);
        }
        
        $this->file_name = $_FILES["file_upload"]["name"]; // 文件原名
        $this->file_size = $_FILES["file_upload"]["size"]; // 文件大小
        $this->file_type = $_FILES["file_upload"]["type"]; // 文件类型
        
        if ($this->file_size == 0) {
            $this->return['message'] = "文件大小为0MB";
            return $this->ajaxFileReturn();
        }
        
        if ($this->file_size > 5000000) {
            $this->return['message'] = "文件大小不能超过5MB";
            return $this->ajaxFileReturn();
        }
        
        // 验证文件
        if (! $this->validationFile()) {
            return $this->ajaxFileReturn();
        }
        $guid = time();
        $file_name_explode = explode(".", $this->file_name); // 图片名称
        $suffix = count($file_name_explode) - 1;
        $ext = "." . $file_name_explode[$suffix]; // 获取后缀名
        $newfile = $guid . $ext; // 重新命名文件


        $destination = $this->reset_file_path . iconv("UTF-8", "gb2312", $newfile);
        $ok = move_uploaded_file($_FILES["file_upload"]["tmp_name"], $destination);



        if ($ok) {
            // 文件上传成功执行下边的操作




            $image_size = getimagesize($this->reset_file_path . $newfile); // 获取图片尺寸
            if ($image_size) {
                
                $width = $image_size[0];
                $height = $image_size[1];
                $name = $file_name_explode[0];

                switch ($this->file_path) {
                    case UPLOAD_GOODS:
                        // 商品图
                        $type = request()->post("type", "");
                        $pic_name = request()->post("pic_name", $guid);
                        $album_id = request()->post("album_id", 0);
                        $pic_tag = request()->post("pic_tag", $name);
                        $pic_id = request()->post("pic_id", "");
                        $upload_flag = request()->post("upload_flag", "");
                        // 上传到相册管理，生成四张大小不一的图
                        $retval = $this->photoCreate($this->reset_file_path, $destination, "." . $file_name_explode[$suffix], $type, $pic_name, $album_id, $width, $height, $pic_tag, $pic_id);
                        if ($retval > 0) {
                            $this->return['code'] = $retval;
                            $this->return['message'] = "上传成功";
                            $this->return['data'] = $destination;
                        } else {
                            $this->return['message'] = "上传失败";
                        }
                        break;
                    case UPLOAD_GOODS_SKU:
                        // 商品SKU图片
                        $this->return['code'] = 1;
                        $this->return['data'] = $destination;
                        $this->return['message'] = "上传成功";
                        break;
                    case UPLOAD_GOODS_BRAND:
                        $this->return['code'] = 1;
                        $this->return['data'] = $destination;
                        $this->return['message'] = "上传成功";
                        // 商品品牌
                        break;
                    case UPLOAD_GOODS_GROUP:
                        // 商品分组
                        $this->return['code'] = 1;
                        $this->return['data'] = $destination;
                        $this->return['message'] = "上传成功";
                        break;
                    case UPLOAD_GOODS_CATEGORY:
                        // 商品分类
                        $this->return['code'] = 1;
                        $this->return['data'] = $this->reset_file_path . $newfile;
                        $this->return['message'] = "上传成功";
                        break;
                    case UPLOAD_COMMON:

                        $width_need = request()->post("width", 0);
                        $height_need = request()->post("height", 0);

                        $need_compress = false;
                        if($width_need>0 && $height_need>0)
                        {

                            if($width_need!=$width || $height_need!=$height)
                            {
                                $need_compress = true;
                            }
                        }

                        if($need_compress)
                        {
                            $destination = $this->photoCompress($this->reset_file_path, $destination, "." . $file_name_explode[$suffix] , $width_need, $height_need );
                        }

                       // @unlink($_FILES['file_upload']);
                        $accessKey = "goJrpGbTHF2ZRHc3yVJ8kIPqqSHx7M_UzMiIphtR";
                        $secretKey = "22HLpgHF1gKCBrhHmpelsRuMSbd6BYnwxEgq1yOS";
                        $bucket = 'ziyoutechan';
                        $key = "tqxj_img_shop/s_".$this->instance_id."_". time();

                        //$client = new \QiniuClient($accessKey,$secretKey);

                        //list($ret, $err) = $client->uploadFile($destination,$bucket,null);

                        try {
                            $cosClient = new \Qcloud\Cos\Client(array(
                                'region' => 'ap-chengdu', #地域，如ap-guangzhou,ap-beijing-1
                                'credentials' => array(
                                    'secretId' => 'AKID1xQj1SoSq6Hcm5KLqKjULYNJLI4MMEMk',
                                    'secretKey' => 'PUZHoDVccSRIOLBLNlzFLI83bOXejcO8',
                                ),
                            ));
                            $result = $cosClient->putObject(array(
                                'Bucket' => "tqxjbu-1256942653",
                                'Key' => $key,
                                'Body' => fopen($destination, 'rb')));

                            @unlink($destination);
                            $this->return['code'] = 1;
                            $this->return['data'] = TXOSS_BASEURL.$key;
                            $this->return['message'] = "上传成功";
                            return $this->ajaxFileReturn();

                            //print_r($result);
                        } catch (\Exception $e) {
                            echo "$e\n";
                        }



                        // 公共
                        $this->return['code'] = 1;
                        $this->return['data'] = $this->reset_file_path . $newfile;
                        $this->return['message'] = "上传成功";
                        break;
                    case UPLOAD_AVATOR:
                        // 用户头像
                        $this->return['code'] = 1;
                        $this->return['data'] = $this->reset_file_path . $newfile;
                        $this->return['message'] = "上传成功";
                        break;
                    case UPLOAD_PAY:
                        // 支付
                        $this->return['code'] = 1;
                        $this->return['data'] = $this->reset_file_path . $newfile;
                        $this->return['message'] = "上传成功";
                        break;
                    case UPLOAD_ADV:
                        // 广告位
                        $this->return['code'] = 1;
                        $this->return['data'] = $this->reset_file_path . $newfile;
                        $this->return['message'] = "上传成功";
                        break;
                    case UPLOAD_EXPRESS:
                        // 物流
                        $this->return['code'] = 1;
                        $this->return['data'] = $this->reset_file_path . $newfile;
                        $this->return['message'] = "上传成功";
                        break;
                }
            } else {
                
                // 强制将文件后缀改掉，文件流不同会导致上传文件失败
                $this->return['message'] = "请检查您上传的文件是否有误";
            }
        } else {
            // 强制将文件后缀改掉，文件流不同会导致上传文件失败
            $this->return['message'] = "请检查您上传的文件是否有误";
        }
        
        return $this->ajaxFileReturn();
    }

    public function resetFilePath()
    {
        $file_path = "";
        switch ($this->file_path) {
            case UPLOAD_GOODS:
                $file_path = $this->file_path;
                break;
            case UPLOAD_GOODS_SKU:
                $file_path = $this->file_path . request()->post("goods_path", "") . "/";
                break;
            case UPLOAD_GOODS_BRAND:
                $file_path = $this->file_path;
                // 商品品牌
                break;
            case UPLOAD_GOODS_GROUP:
                // 商品分组
                $file_path = $this->file_path;
                break;
            case UPLOAD_GOODS_CATEGORY:
                // 商品分类
                $file_path = $this->file_path;
                break;
            case UPLOAD_COMMON:
                $file_path = $this->file_path;
                // 公共
                break;
            case UPLOAD_AVATOR:
                $file_path = $this->file_path;
                // 用户头像
                break;
            case UPLOAD_PAY:
                $file_path = $this->file_path;
                // 支付
                break;
            case UPLOAD_ADV:
                $file_path = $this->file_path;
                // 广告位
                break;
            case UPLOAD_EXPRESS:
                // 物流
                $file_path = $this->file_path;
                break;
        }
        $this->reset_file_path = $file_path;
    }

    /**
     * 上传文件后，ajax返回信息
     *
     * 2017年6月9日 19:54:46 王永杰
     *
     * @param array $return            
     */
    private function ajaxFileReturn()
    {
        if (empty($this->return['code']) || null == $this->return['code'] || "" == $this->return['code']) {
            $this->return['code'] = 0; // 错误码
        }
        
        if (empty($this->return['message']) || null == $this->return['message'] || "" == $this->return['message']) {
            $this->return['message'] = ""; // 消息
        }
        
        if (empty($this->return['data']) || null == $this->return['data'] || "" == $this->return['data']) {
            $this->return['data'] = ""; // 数据
        }
        return json_encode($this->return);
    }

    /**
     *
     * @param unknown $this->file_path
     *            文件路径
     * @param unknown $this->file_size
     *            文件大小
     * @param unknown $this->file_type
     *            文件类型
     * @return string|unknown|number|\think\false
     */
    private function validationFile()
    {
        $flag = true;
        switch ($this->file_path) {
            case UPLOAD_GOODS:
                // 商品图片
                if ($this->file_type != "image/gif" && $this->file_type != "image/png" && $this->file_type != "image/jpeg" && $this->file_size > 3000000) {
                    $this->return['message'] = '文件上传失败,请检查您上传的文件类型,文件大小不能超过3MB';
                    $flag = false;
                }
                break;
            case UPLOAD_GOODS_SKU:
                // 商品SKU图片
                if ($this->file_type != "image/gif" && $this->file_type != "image/png" && $this->file_type != "image/jpeg" && $this->file_size > 1000000) {
                    $this->return['message'] = '文件上传失败,请检查您上传的文件类型,文件大小不能超过1MB';
                    $flag = false;
                }
                break;
            case UPLOAD_GOODS_BRAND:
                // 商品品牌
                break;
            case UPLOAD_GOODS_GROUP:
                // 商品分组
                break;
            case UPLOAD_GOODS_CATEGORY:
                // 商品分类
                break;
            case UPLOAD_COMMON:
                // 公共
                break;
            case UPLOAD_AVATOR:
                // 用户头像
                if ($this->file_type != "image/gif" && $this->file_type != "image/png" && $this->file_type != "image/jpeg" && $this->file_size > 1000000) {
                    $this->return['message'] = '文件上传失败,请检查您上传的文件类型,文件大小不能超过1MB';
                    $flag = false;
                }
                break;
            case UPLOAD_PAY:
                // 支付
                if ($this->file_type != "image/gif" && $this->file_type != "image/png" && $this->file_type != "image/jpeg" && $this->file_size > 1000000) {
                    $this->return['message'] = '文件上传失败,请检查您上传的文件类型,文件大小不能超过1MB';
                    $flag = false;
                }
                break;
            case UPLOAD_ADV:
                // 广告位
                break;
            case UPLOAD_EXPRESS:
                // 物流
                if ($this->file_type != "image/gif" && $this->file_type != "image/png" && $this->file_type != "image/jpeg" && $this->file_size > 1000000) {
                    $this->return['message'] = '文件上传失败,请检查您上传的文件类型,文件大小不能超过1MB';
                    $flag = false;
                }
                break;
        }
        return $flag;
    }

    /**
     * 删除文件
     * 2017年6月9日 21:17:47 王永杰
     */
    public function removeFile()
    {
        $filename = request()->post("filename", "");
        $res = array();
        $success_count = 0;
        $error_count = 0;
        if ($filename != "") {
            $filename_arr = explode(",", $filename);
            foreach ($filename_arr as $v) {
                if ($v != "") {
                    if (@unlink($v)) {
                        $success_count ++;
                    } else {
                        $error_count ++;
                    }
                }
            }
        }
        $res['success_count'] = $success_count;
        $res['error_count'] = $error_count;
        return $res;
    }

    /**
     * 各类型图片生成
     *
     * @param unknown $photoPath            
     * @param unknown $ext            
     * @param number $type            
     */
    public function photoCreate($upFilePath, $photoPath, $ext, $type = 0, $pic_name, $album_id, $width, $height, $pic_tag, $pic_id)
    {
        try {

            $key = "tqxj_img_shop/s_".$this->instance_id."_". time();
            $cosClient = new \Qcloud\Cos\Client(array(
                'region' => 'ap-chengdu', #地域，如ap-guangzhou,ap-beijing-1
                'credentials' => array(
                    'secretId' => 'AKID1xQj1SoSq6Hcm5KLqKjULYNJLI4MMEMk',
                    'secretKey' => 'PUZHoDVccSRIOLBLNlzFLI83bOXejcO8',
                ),
            ));
            $result = $cosClient->putObject(array(
                'Bucket' => "tqxjbu-1256942653",
                'Key' => $key,
                'Body' => fopen($photoPath, 'rb')));
            //print_r($result);
        } catch (\Exception $e) {
            echo "$e\n";
        }

        $cloud_path = TXOSS_BASEURL.$key;
        $image = \think\Image::open($photoPath);
        $photoArray = array(

            "middlePath" => array(
                "path" => $upFilePath . time() . iconv("UTF-8", "gb2312", $pic_tag) . "2" . $ext,
                "width" => 360,
                "height" => 360,
                'type' => '2'
            )
        );
        foreach ($photoArray as &$v) {
            if (stristr($type, $v['type'])) {
                $image->thumb($v["width"], $v["height"], \think\Image::THUMB_CENTER)->save($v["path"]);


                $key = "tqxj_img_shop/s_".$this->instance_id."_". time()."s".$v["width"]."_".$v["height"];
                $cosClient = new \Qcloud\Cos\Client(array(
                    'region' => 'ap-chengdu', #地域，如ap-guangzhou,ap-beijing-1
                    'credentials' => array(
                        'secretId' => 'AKID1xQj1SoSq6Hcm5KLqKjULYNJLI4MMEMk',
                        'secretKey' => 'PUZHoDVccSRIOLBLNlzFLI83bOXejcO8',
                    ),
                ));
                $result = $cosClient->putObject(array(
                    'Bucket' => "tqxjbu-1256942653",
                    'Key' => $key,
                    'Body' => fopen($photoPath, 'rb')));

                //list($ret, $err) = $client->uploadFile($v["path"],$bucket,null);

                $v["cloud_path"] = TXOSS_BASEURL.$key;
            }
        }
        $album = new Album();
        if ($pic_id == "") {
            $retval = $album->addPicture($pic_name, $pic_tag, $album_id, iconv("gb2312", "UTF-8", $cloud_path),
                $width . "," . $height, $width . "," . $height, "", "", "", iconv("gb2312", "UTF-8",
                    $photoArray["middlePath"]["cloud_path"]), $photoArray["middlePath"]["width"] . "," . $photoArray["middlePath"]["height"], $photoArray["middlePath"]["width"] . "," . $photoArray["middlePath"]["height"],
                "","","","","","");
        } else {
            $retval = $album->ModifyAlbumPicture($pic_id, $photoPath, $width . "," . $height, $width . "," . $height,
                $photoArray["bigPath"]["cloud_path"], $photoArray["bigPath"]["width"] . "," . $photoArray["bigPath"]["height"], $photoArray["bigPath"]["width"] . "," . $photoArray["bigPath"]["height"],
                $photoArray["middlePath"]["cloud_path"], $photoArray["middlePath"]["width"] . "," . $photoArray["middlePath"]["height"], $photoArray["middlePath"]["width"] . "," . $photoArray["middlePath"]["height"]);
            $retval = $pic_id;
        }
        return $retval;
    }

    public function photoCompress($upFilePath, $photoPath, $ext,$width_need, $height_need)
    {
        $compresspath = $upFilePath . time() . iconv("UTF-8", "gb2312", "compress") . $ext;
        $image = \think\Image::open($photoPath);
        $image->thumb($width_need, $height_need, \think\Image::THUMB_CENTER)->save($compresspath);

        @unlink($photoPath);
        return $compresspath;
    }



    /**
     * 用于相册多图上传
     * 
     * @return string|multitype:string NULL Ambigous <unknown, boolean, number, \think\false, string>
     */
    public function photoAlbumUpload()
    {
        $data = array();
        $this->file_path = request()->post("file_path", "");
        if ($this->file_path == "") {
            $data['state'] = '0';
            $data['message'] = "文件路径不能为空";
            $data['origin_file_name'] = $this->file_name;
            return $data;
        }
        // var_dump($_FILES["file_upload"]["name"]);
        // 重新设置文件路径
        $this->resetFilePath();
        // 检测文件夹是否存在，不存在则创建文件夹
        if (! file_exists($this->reset_file_path)) {
            mkdir($this->reset_file_path, 0777, true);
        }

        $this->file_name = $_FILES["file_upload"]["name"]; // 文件原名
        $this->file_size = $_FILES["file_upload"]["size"]; // 文件大小
        $this->file_type = $_FILES["file_upload"]["type"]; // 文件类型

        if ($this->file_size == 0) {
            $data['state'] = '0';
            $data['message'] = "文件过大或者无效";
            $data['origin_file_name'] = $this->file_name;
            return $data;
        }
        if ($this->file_size > 5000000) {
            $data['state'] = '0';
            $data['message'] = "文件大小不能超过5MB";
            $data['origin_file_name'] = $this->file_name;
            return $data;
        }

        // 验证文件
        if (! $this->validationFile()) {
            return $this->ajaxFileReturn();
        }
        $guid = time();
        $file_name_explode = explode(".", $this->file_name); // 图片名称
        $suffix = count($file_name_explode) - 1;
        $ext = "." . $file_name_explode[$suffix]; // 获取后缀名
        // 获取原文件名
        $tmp_array = $file_name_explode;
        unset($tmp_array[$suffix]);
        $file_new_name = implode(".", $tmp_array);
        $newfile = $file_new_name . $guid . $ext; // 重新命名文件
        $ok = @move_uploaded_file($_FILES["file_upload"]["tmp_name"], $this->reset_file_path . iconv("UTF-8", "gb2312", $newfile));
        if ($ok) {
            @unlink($_FILES['file_upload']);
            $image_size = @getimagesize($this->reset_file_path . iconv("UTF-8", "gb2312", $newfile)); // 获取图片尺寸
            if ($image_size) {

                $width = $image_size[0];
                $height = $image_size[1];
                $name = $file_name_explode[0];
                $type = request()->post("type", "");
                $pic_name = request()->post("pic_name", $file_new_name . $guid);
                $album_id = request()->post("album_id", 0);
                $pic_tag = request()->post("pic_tag", $file_new_name);
                $pic_id = request()->post("pic_id", "");
                $upload_flag = request()->post("upload_flag", "");
                // 上传到相册管理，生成四张大小不一的图
                $retval = $this->photoCreate($this->reset_file_path, $this->reset_file_path . iconv("UTF-8", "gb2312", $newfile), "." . $file_name_explode[$suffix], $type, $pic_name, $album_id, $width, $height, $pic_tag, $pic_id);
                if ($retval > 0) {
                    $album = new Album();
                    $picture_info = $album->getAlubmPictureDetail([
                        "pic_id" => $retval
                    ]);
                    $data['file_id'] = $retval;
                    $data['file_name'] = $picture_info["pic_cover_mid"];
                    $data['origin_file_name'] = $this->file_name;
                    $data['file_path'] = $picture_info["pic_cover_mid"];
                    $data['state'] = '1';
                    return $data;
                } else {
                    $data['state'] = '0';
                    $data['message'] = "图片上传失败";
                    $data['origin_file_name'] = $this->file_name;
                    return $data;
                }
            } else {
                $data['state'] = '0';
                $data['message'] = "图片上传失败";
                $data['origin_file_name'] = $this->file_name;
                return $data;
            }
        } else {
            $data['state'] = '0';
            $data['message'] = "图片上传失败";
            $data['origin_file_name'] = $this->file_name;
            return $data;
        }
    }
}