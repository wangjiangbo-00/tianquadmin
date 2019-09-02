<?php

include 'AddPushSDK.php';

$key = 'bd7da649ee6a08a134819d78c498ba01'; //请填写订阅查询授权码

$kuaidipush = new AddPushSDK();

$kuaidipush->setKey($key);

//订阅订单
$result = $kuaidipush->addPushApi('123456789', 'shunfeng', 'http://www.xxx.com...');//订阅顺丰单号123456789

var_dump($result);



