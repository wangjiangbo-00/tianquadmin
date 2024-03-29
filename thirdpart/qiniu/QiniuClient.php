<?php

require_once __DIR__ .'/autoload.php';

use Qiniu\Auth;
use Qiniu\Storage\UploadManager;

class QiniuClient
{
	const UP_HOST = 'http://up.qiniu.com';
	const RS_HOST = 'http://rs.qbox.me';
	const RSF_HOST = 'http://rsf.qbox.me';

	public $accessKey;
	public $secretKey;

	function __construct($accessKey='',$secretKey='')
	{
		$this->accessKey = $accessKey;
		$this->secretKey = $secretKey;
	}

	public function uploadFile($filePath,$bucket,$key=null)
	{
        $auth = new Auth($this->accessKey, $this->secretKey);


// 在七牛保存的文件名
        $uploadMgr = new UploadManager();

        $token = $auth->uploadToken($bucket, null, 3600, null);

        return $uploadMgr->putFile($token, null, $filePath);

	}

	public function upload($content,$bucket,$key=null)
	{
		$filePath = tempnam(sys_get_temp_dir(), 'UPLOAD');
		file_put_contents($filePath, $content);
		$result = $this->uploadFile($filePath,$bucket,$key);
		unlink($filePath);
		return $result;
	}

	public function uploadRemote($url,$bucket,$key=null)
	{
		$filePath = tempnam(sys_get_temp_dir(), 'UPLOAD');
		copy($url,$filePath);
		$result = $this->uploadFile($filePath,$bucket,$key);
		unlink($filePath);
		return $result;
	}

	public function stat($bucket,$key)
	{
		$encodedEntryURI = self::urlsafe_base64_encode("{$bucket}:{$key}");
		$url = "/stat/{$encodedEntryURI}";
		return $this->fileHandle($url);
	}

	public function move($bucket,$key,$bucket2,$key2=false)
	{
		if(!$key2) {
			$key2 = $bucket2;
			$bucket2 = $bucket;
		}
		$encodedEntryURISrc = self::urlsafe_base64_encode("{$bucket}:{$key}");
		$encodedEntryURIDest = self::urlsafe_base64_encode("{$bucket2}:{$key2}");
		$url = "/move/{$encodedEntryURISrc}/{$encodedEntryURIDest}";
		return $this->fileHandle($url);
	}

	public function copy($bucket,$key,$bucket2,$key2=false)
	{
		if(!$key2) {
			$key2 = $bucket2;
			$bucket2 = $bucket;
		}
		$encodedEntryURISrc = self::urlsafe_base64_encode("{$bucket}:{$key}");
		$encodedEntryURIDest = self::urlsafe_base64_encode("{$bucket2}:{$key2}");
		$url = "/copy/{$encodedEntryURISrc}/{$encodedEntryURIDest}";
		return $this->fileHandle($url);
	}

	public function delete($bucket,$key)
	{
		$encodedEntryURI = self::urlsafe_base64_encode("{$bucket}:{$key}");
		$url = "/delete/{$encodedEntryURI}";
		return $this->fileHandle($url);
	}

	// $operator = stat|move|copy|delete 
	// $client->batch('stat',array('square:test/test5.txt','square:test/test13.png'));
	public function batch($operator,$files)
	{
		$data = '';
		foreach ($files as $file) {
			if(!is_array($file)) {
				$encodedEntryURI = self::urlsafe_base64_encode($file);
				$data.="op=/{$operator}/{$encodedEntryURI}&";
			}else{
				$encodedEntryURI = self::urlsafe_base64_encode($file[0]);
				$encodedEntryURIDest = self::urlsafe_base64_encode($file[1]);
				$data.="op=/{$operator}/{$encodedEntryURI}/{$encodedEntryURIDest}&";
			}
		}
		return $this->fileHandle('/batch',$data);
	}

	public function listFiles($bucket,$limit='',$prefix='',$marker='')
	{
		$params = array_filter(compact('bucket','limit','prefix','marker'));
		$url = self::RSF_HOST.'/list?'.http_build_query($params);
		return $this->fileHandle($url);
	}

	public function fileHandle($url,$data=array())
	{
		if(strpos($url, 'http://')!==0) $url = self::RS_HOST.$url;

		if(is_array($data)) $accessToken = $this->accessToken($url);
		else $accessToken = $this->accessToken($url,$data);

		$ch = curl_init();
		curl_setopt($ch, CURLOPT_HTTPHEADER, array(
		    'Authorization: QBox '.$accessToken,
	    ));
		
	    curl_setopt($ch, CURLOPT_URL, $url);
	    curl_setopt($ch, CURLOPT_POST, true);
	    // If $data is an array, the Content-Type header will be set to multipart/form-data
	    curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
	    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	    $result = curl_exec($ch);
	    $info = curl_getinfo($ch);
		curl_close($ch);

		if($info['http_code']>=300)
			throw new Exception($info['http_code'].': '.$result);
		if($info['content_type']=='application/json')
			return json_decode($result,true);

		return $result;
	}

	public function uploadToken($flags)
	{
		if(!isset($flags['deadline']))
			$flags['deadline'] = 3600 + time();
		$encodedFlags = self::urlsafe_base64_encode(json_encode($flags));
		$sign = hash_hmac('sha1', $encodedFlags, $this->secretKey, true);
		$encodedSign = self::urlsafe_base64_encode($sign);
	    $token = $this->accessKey.':'.$encodedSign. ':' . $encodedFlags;
	    return $token;
	}

	public function accessToken($url,$body=false){
	    $parsed_url = parse_url($url);
	    $path = $parsed_url['path'];
	    $access = $path;
	    if (isset($parsed_url['query'])) {
	        $access .= "?" . $parsed_url['query'];
	    }
	    $access .= "\n";
	    if($body) $access .= $body;
	    $digest = hash_hmac('sha1', $access, $this->secretKey, true);
	    return $this->accessKey.':'.self::urlsafe_base64_encode($digest);
	}

	public static function urlsafe_base64_encode($str){
	    $find = array("+","/");
	    $replace = array("-", "_");
	    return str_replace($find, $replace, base64_encode($str));
	}
}