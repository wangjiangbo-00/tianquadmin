<?php
use think\Route;
use think\Cookie;
use think\Request;
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

//检测后台系统模块

    return [
        //pc端商品相关

       '/'=>'admin/login/index',



    ];

//检测伪静态启用
  /*   if(getRouteConfig('GOODS'))
    {
        /* Route::group('goods_:goodsid',[
            '' => ['shop/goods/goodsinfo', ['method' => 'get'], ['goodsid' => '\d+']],
            ]);
       // Route::get('goods/:goodsid','shop/goods/goodsinfo');
        Route::any('goods-:goodsid','shop/goods/goodsinfo/hoods',['method'=>'get']);



    }

/* return [
     //pc端商品相关
     '[pcg]'     => [

        //商品列表
        'list'         => ['wap/goods/goodslist',['method' => 'get']],
        //商品详情
        '/'            => ['shop/goods/goodsinfo', ['method' => 'get']],
     ],
     //wap端商品相关
     '[wapg]'     => [

        //商品列表
        'list'         => ['wap/goods/goodslist'],
        //商品详情
        '/'            => ['wap/goods/goodsDetail', ['method' => 'get']],
        'point'        => ['wap/goods/integralcenter'],
        'classlist'    => ['wap/goods/goodsClassificationList'],
    ],
    //pc端会员相关
    '[pcm]'     => [
        //会员中心
        'index'        => ['shop/member/index'],
        //会员余额
        'balance'      => ['shop/member/balancelist'],
        //会员积分
        'person'       => ['shop/member/person'],
        //会员地址
        'address'      => ['shop/member/addresslist'],
        //会员优惠券
        'vouchers'     => ['shop/member/vouchers'],
        //会员积分
        'point'        => ['shop/member/integrallist'],
        //订单列表
        'orders'       => ['shop/member/orderlist'],
        //退款与售后
        'refunds'      => ['shop/member/backlist'],
        ],



    '[login]'      => [
        //登录页面
        ''=> ['shop/login/index']
        ],



]; */

