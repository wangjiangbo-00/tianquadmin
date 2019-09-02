<?php

include 'ReceivePushData.php';

$returnData = new ReceivePushData();
//接收推送
$num = $returnData->num;//快递单号
$exp = $returnData->exp;//公司简码
$msg = $returnData->data;//轨迹信息


