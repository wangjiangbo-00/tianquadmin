<?php
/**
 * Created by Godlike
 * 推送API SDK
 */

class AddPushSDK{
    
    private $_APPKEY = ''; 
    
    private $_APIURL = "http://api.56jiekou.com/index.php/openapi-addpushapi.html";
     
    
    /**
     * 订阅查询授权码。
     * @param string $key
     */
    public function setKey($key){
        $this->_APPKEY = $key;
    }

    /**
     * 添加订阅，
     * @param  $num 物流单号
     * @param  $exp 公司简码（详见[56接口]公司-简码对照表1.0.docx）
     * @param  $tokenurl 回调地址
     * @param  $digest 签名
     * @throws Exception
     * @return array 订阅结果信息
     */
    public function addPushApi($num, $exp, $tokenurl,$digest=''){
        if (function_exists('curl_init') == 1) {
            
            $url = $this->_APIURL;

            $param = array(
                'exp'=>$exp,
                'num' => $num,
                'key' => $this->_APPKEY,
                'params'=>array(
                    'tokenurl'=>$tokenurl,
                    'digest'=>$digest
                )
            ); 

            // echo $url;

            $data = json_encode($param); 

            echo "\n\n";
            var_dump("提交订阅的post数据（json格式）：" .$data);
            echo "\n\n";

            $ch = curl_init ();
            $timeout = 5;
            curl_setopt($ch, CURLOPT_NOSIGNAL, 1);
            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_POST, 1);
            curl_setopt($ch, CURLOPT_HEADER, 0);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER,1);
            curl_setopt($ch, CURLOPT_POSTFIELDS,$data);
            curl_setopt($ch, CURLOPT_TIMEOUT, $timeout);
            curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, $timeout);

            $kuaidresult = curl_exec($ch);

            if(curl_errno($ch)){
                return ""; 
            }
            return json_decode($kuaidresult); 
        }else{
            throw new Exception("Please install curl plugin", 1); //请安装curl插件
        }
    }

}
