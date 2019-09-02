<?php
/**
 * Created by Godlike
 * 推送接收
 */ 
 
class ReceivePushData{
    
    public $allInfo;

    public $jsonmessage;

    public $num;

    public $exp;

    public function __construct(){

        $this->info = json_decode($_POST['trail'], true);
        $this->data = json_encode($this->info['information']['data']);
        $this->num = $this->info['information']['num'];
        $this->exp = $this->info['information']['exp'];
    }  
}
