-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: 45.40.199.157    Database: zxtc
-- ------------------------------------------------------
-- Server version	5.7.22-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `platform_activity`
--

DROP TABLE IF EXISTS `platform_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `platform_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discount_id` int(11) DEFAULT NULL,
  `discount_name` varchar(45) DEFAULT NULL,
  `start_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `end_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `type` int(11) DEFAULT '1' COMMENT '1. 店铺折扣  2.平台长期活动 3.平台限时活动',
  `is_visible` int(11) NOT NULL DEFAULT '0' COMMENT '0未申请 1 已申请 2 申请通过 3申请未通过 4 可展示 5 已经开始 6已经出奖 7已经结束',
  `img` varchar(256) DEFAULT NULL,
  `desp` varchar(1024) DEFAULT NULL,
  `is_open` int(11) NOT NULL DEFAULT '1' COMMENT '0未申请 1 已申请 2 申请通过 3申请未通过 4 可展示 5 已经开始 6已经出奖 7已经结束',
  `sort` int(11) DEFAULT '10',
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platform_activity`
--

LOCK TABLES `platform_activity` WRITE;
/*!40000 ALTER TABLE `platform_activity` DISABLE KEYS */;
INSERT INTO `platform_activity` VALUES (2,11,'双11特惠','2018-09-30 15:45:00','2018-10-08 15:45:00','2018-09-28 15:46:01','2018-09-28 15:51:04',3,1,'http://www.imgtqcommon.weiruikj.cn/double11.png','大大',1,1,0),(3,12,'惠农专区','2018-01-01 00:00:00','2999-01-01 00:00:00','2018-10-01 16:08:58','2018-10-01 16:08:58',2,1,'http://www.imgtqcommon.weiruikj.cn/huinong.png','哈哈哈',1,9,0),(4,0,'公共抽奖','2018-09-30 15:45:00','2018-10-08 15:45:00','2018-09-28 15:46:01','2018-09-28 15:51:04',4,1,'http://www.imgtqcommon.weiruikj.cn/rewards-red.png','大大',1,4,0),(5,0,'超值团购','2018-09-30 15:45:00','2018-10-08 15:45:00','2018-09-28 15:46:01','2018-09-28 15:51:04',5,1,'http://www.imgtqcommon.weiruikj.cn/group_activity.png','大大',1,5,0),(6,0,'送礼免单','2018-09-30 15:45:00','2018-10-08 15:45:00','2018-09-28 15:46:01','2018-09-28 15:51:04',6,1,'http://www.imgtqcommon.weiruikj.cn/freeorder.png','大大',1,5,0),(7,13,'超值清仓','2018-01-01 00:00:00','2999-01-01 00:00:00','2018-10-01 16:08:58','2018-10-01 16:08:58',2,1,'http://www.imgtqcommon.weiruikj.cn/qingcang.png','哈哈哈',1,9,0);
/*!40000 ALTER TABLE `platform_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platform_banner`
--

DROP TABLE IF EXISTS `platform_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `platform_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT '0' COMMENT '1:商品 2商店 3平台折扣 4 抽奖 5 团购',
  `refid` int(11) DEFAULT '0' COMMENT 'group/gift的情况下 0表示集合',
  `poster` varchar(256) DEFAULT NULL,
  `remarks` varchar(256) DEFAULT NULL,
  `is_show` int(11) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `sort` int(11) DEFAULT '10',
  `name` varchar(45) DEFAULT '',
  `is_valid` int(11) DEFAULT '0' COMMENT 'dicount/group/gift 等失效时该值设置为0失效',
  `refdetails` varchar(256) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platform_banner`
--

LOCK TABLES `platform_banner` WRITE;
/*!40000 ALTER TABLE `platform_banner` DISABLE KEYS */;
INSERT INTO `platform_banner` VALUES (3,1,407,'https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547625955','',1,'2019-01-16 16:05:58','2019-01-16 16:05:58',3,'阿克苏苹果',1,'商品:苹果 团购价:99.00 简介:新疆 阿克苏 冰甜糖心苹果 20斤一箱装 个个好果子'),(4,2,48,'https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547625998','',1,'2019-01-16 16:06:43','2019-01-16 16:06:43',4,'许昌特产',1,'店铺:undefined'),(5,999,0,'https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547626072','',1,'2019-01-16 16:07:54','2019-01-16 16:07:54',1,'开业',1,'商品:undefined 团购价:undefined 简介:undefined'),(6,4,0,'https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547626288','',1,'2019-01-16 16:11:31','2019-01-16 16:11:31',6,'去抽奖',1,'抽奖信息:undefined');
/*!40000 ALTER TABLE `platform_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_album_class`
--

DROP TABLE IF EXISTS `sys_album_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_album_class` (
  `album_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '相册id',
  `shop_id` int(10) NOT NULL DEFAULT '1' COMMENT '店铺id',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '上级相册ID',
  `album_name` varchar(100) NOT NULL COMMENT '相册名称',
  `album_cover` varchar(255) NOT NULL DEFAULT '' COMMENT '相册封面',
  `is_default` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为默认相册,1代表默认',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`album_id`),
  KEY `INDEX_SHOPID` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='相册表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_album_class`
--

LOCK TABLES `sys_album_class` WRITE;
/*!40000 ALTER TABLE `sys_album_class` DISABLE KEYS */;
INSERT INTO `sys_album_class` VALUES (30,1,0,'默认相册','1609',1,'2017-06-10 11:20:31',4),(31,1,0,'连衣裙','1588',0,'2017-06-10 14:28:53',1),(33,1,0,'默认相册','',1,'2017-07-14 10:07:40',0),(34,1,0,'默认相册','',1,'2017-07-17 20:03:00',0),(35,48,0,'测试','',0,'2018-07-19 14:48:58',1),(39,0,0,'ggg','',1,'2018-08-29 16:39:31',0),(40,0,0,'ppp','',0,'2018-08-29 16:40:08',1),(41,0,0,'ask_answer','',0,'2018-12-04 20:58:03',2),(42,48,0,'红薯粉条','',1,'2019-01-02 14:59:34',1),(43,48,0,'小米','',0,'2019-01-09 12:01:35',1),(44,53,0,'苹果','',1,'2019-01-17 22:15:16',1);
/*!40000 ALTER TABLE `sys_album_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_album_picture`
--

DROP TABLE IF EXISTS `sys_album_picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_album_picture` (
  `pic_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '相册图片表id',
  `shop_id` int(10) unsigned DEFAULT '1' COMMENT '所属实例id',
  `album_id` int(10) unsigned NOT NULL COMMENT '相册id',
  `is_wide` int(11) NOT NULL DEFAULT '0' COMMENT '是否宽屏',
  `pic_name` varchar(100) NOT NULL COMMENT '图片名称',
  `pic_tag` varchar(255) NOT NULL DEFAULT '' COMMENT '图片标签',
  `pic_cover` varchar(255) NOT NULL COMMENT '原图图片路径',
  `pic_size` varchar(255) DEFAULT NULL COMMENT '原图大小',
  `pic_spec` varchar(100) DEFAULT NULL COMMENT '原图规格',
  `pic_cover_big` varchar(255) DEFAULT '' COMMENT '大图路径',
  `pic_size_big` varchar(255) DEFAULT '0' COMMENT '大图大小',
  `pic_spec_big` varchar(100) DEFAULT '' COMMENT '大图规格',
  `pic_cover_mid` varchar(255) DEFAULT '' COMMENT '中图路径',
  `pic_size_mid` varchar(255) DEFAULT '0' COMMENT '中图大小',
  `pic_spec_mid` varchar(100) DEFAULT '' COMMENT '中图规格',
  `pic_cover_small` varchar(255) DEFAULT '' COMMENT '小图路径',
  `pic_size_small` varchar(255) DEFAULT '0' COMMENT '小图大小',
  `pic_spec_small` varchar(255) DEFAULT '' COMMENT '小图规格',
  `pic_cover_micro` varchar(255) DEFAULT '' COMMENT '微图路径',
  `pic_size_micro` varchar(255) DEFAULT '0' COMMENT '微图大小',
  `pic_spec_micro` varchar(255) DEFAULT '' COMMENT '微图规格',
  `upload_time` datetime DEFAULT NULL COMMENT '图片上传时间',
  PRIMARY KEY (`pic_id`),
  KEY `INDEX_ALBUM` (`album_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2005 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=204 COMMENT='相册图片表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_album_picture`
--

LOCK TABLES `sys_album_picture` WRITE;
/*!40000 ALTER TABLE `sys_album_picture` DISABLE KEYS */;
INSERT INTO `sys_album_picture` VALUES (1966,0,35,0,'80cb39dbb6fd5266a0b16df7a318972bd50736be1531982962','80cb39dbb6fd5266a0b16df7a318972bd50736be','http://www.imgtqbu.weiruikj.cn/FtdNZQgcgsBibdYNp4Qyj29GMk6o','480,260','480,260','http://www.imgtqbu.weiruikj.cn/Fo8uFVmZvnjlyPdtQMbTSAbUlxfy','700,350','700,350','http://www.imgtqbu.weiruikj.cn/FnwlV1qFvz_jTBiMv11PBBnAtN2k','360,360','360,360','http://p4wgvxk6d.bkt.clouddn.com/FpULQ4TV_x7-Ay-Rn0SGNzqq_ft7','240,240','240,240','http://p4wgvxk6d.bkt.clouddn.com/Ft48C3mwvmoocOBZYls1oUcX7GsL','60,60','60,60','2018-07-19 14:49:26'),(1967,0,36,0,'9db3e8b5432804e73dd1918959e094741535509934','9db3e8b5432804e73dd1918959e09474','http://www.imgtqbu.weiruikj.cn/FgQF4vW15lEVLt6ddGwz6UuACuzC','750,352','750,352','http://www.imgtqbu.weiruikj.cn/FqQoaa71d13-NAluAsznzUf7MFld','700,350','700,350','http://www.imgtqbu.weiruikj.cn/Fv6vxaLKYSaC3jCnWuxJ5bRN1Fbi','360,360','360,360','http://p4wgvxk6d.bkt.clouddn.com/FmCKkP3g1HE0uPeBCydHQS43j7iu','240,240','240,240','http://p4wgvxk6d.bkt.clouddn.com/Fmo9a-1AS-RAhHT2XSzc4DlW8K7t','60,60','60,60','2018-08-29 10:32:16'),(1968,0,36,0,'groups1535528181','groups','http://www.imgtqbu.weiruikj.cn/FguKl6wyYIJhcVFZE8L_CZ1JvdVx','64,64','64,64','http://www.imgtqbu.weiruikj.cn/FsTc7WOFwXd-MXQGKKdjt27GEYK4','700,350','700,350','http://www.imgtqbu.weiruikj.cn/Fg_FLdrwM3lUCN8zJk62rAQz8uF4','360,360','360,360','http://p4wgvxk6d.bkt.clouddn.com/FqgBA6vy71t_ukTSLid0XKT5rKKN','240,240','240,240','http://p4wgvxk6d.bkt.clouddn.com/FnfP3oSW_SCSOOrpGge8wX5qhS0d','60,60','60,60','2018-08-29 15:36:23'),(1969,0,36,0,'地址1535530597','地址','http://www.imgtqbu.weiruikj.cn/FpIPKNiOsjSlLSu2lFW4tkOqoqYm','64,64','64,64','','0','0','http://www.imgtqbu.weiruikj.cn/FlD1XSCte8L-N9e-_so4KQDPB3Hl','360,360','360,360','','0','0','','0','0','2018-08-29 16:16:42'),(1970,0,0,0,'rightarrow1535530646','rightarrow','http://www.imgtqbu.weiruikj.cn/FlnMB6kWhefkpnV4FW6PGT4uY_qK','64,64','64,64','','0','0','http://www.imgtqbu.weiruikj.cn/FirGEtNPsrQQ7yTIKeM7cXA-MEW1','360,360','360,360','','0','0','','0','0','2018-08-29 16:18:00'),(1971,0,39,0,'80cb39dbb6fd5266a0b16df7a318972bd50736be1535532017','80cb39dbb6fd5266a0b16df7a318972bd50736be','http://www.imgtqbu.weiruikj.cn/FtdNZQgcgsBibdYNp4Qyj29GMk6o','480,260','480,260','','0','0','http://www.imgtqbu.weiruikj.cn/Fsdmwqi_xdFzvl_lk2aNFtLe_OxV','360,360','360,360','','0','0','','0','0','2018-08-29 16:40:29'),(1972,0,35,0,'3a1709a514c9341db29b077ef5d6c1b71535621069','3a1709a514c9341db29b077ef5d6c1b7','http://www.imgtqbu.weiruikj.cn/Fntz2Jkjlk0wDj6nTIHpdD6yWY0r','1024,683','1024,683','','0','0','http://www.imgtqbu.weiruikj.cn/Fvx6PZFbrDe4_h1qalIpTyWZ9uXj','360,360','360,360','','0','0','','0','0','2018-08-30 17:24:30'),(1973,0,35,0,'32fa828ba61ea8d3bca03071970a304e241f58c01537167656','32fa828ba61ea8d3bca03071970a304e241f58c0','http://www.imgtqbu.weiruikj.cn/FgVbtfSW8yqgY4prB1DDuWlaU0r4','500,375','500,375','','0','0','http://www.imgtqbu.weiruikj.cn/Fv5__TLp1Y2zcrSehvomPIzGUCrK','360,360','360,360','','0','0','','0','0','2018-09-17 15:00:57'),(1974,0,35,0,'21b0dd2c651b759513556696a142e4b51537167731','21b0dd2c651b759513556696a142e4b5','http://www.imgtqbu.weiruikj.cn/Fl1xEtIOeDgMJDOMlcOYnht3heGf','800,480','800,480','','0','0','http://www.imgtqbu.weiruikj.cn/FrYW154wTUL9kR1fnoUhOWGTKawX','360,360','360,360','','0','0','','0','0','2018-09-17 15:02:12'),(1975,0,35,0,'d1d72c122ab008605839b1c11c0c72b81537167739','d1d72c122ab008605839b1c11c0c72b8','http://www.imgtqbu.weiruikj.cn/FtdBz9jj5RfQ4XpZG56ygVoxI_gS','500,440','500,440','','0','0','http://www.imgtqbu.weiruikj.cn/Fg4tpyp0Cls1lUyQbNQqyjm-odmS','360,360','360,360','','0','0','','0','0','2018-09-17 15:02:20'),(1976,0,0,0,'code1540974657','code','http://www.imgtqbu.weiruikj.cn/FlqoyFImp7YxXGC0o3o_Sqy7IWk5','64,64','64,64','','0','0','http://www.imgtqbu.weiruikj.cn/Fi4yUAY5L96O4UdoV7dfinxpTsuw','360,360','360,360','','0','0','','0','0','2018-10-31 16:30:58'),(1977,0,0,0,'activity-active1540975266','activity-active','http://www.imgtqbu.weiruikj.cn/FmyvJTK5jWNoPlUNtlSDVMuA6mUk','64,64','64,64','','0','0','http://www.imgtqbu.weiruikj.cn/Fmq1BqSihyjDV5C7RtN538fcDWNF','360,360','360,360','','0','0','','0','0','2018-10-31 16:41:07'),(1978,0,0,0,'pingguo1541337867','pingguo','http://www.imgtqbu.weiruikj.cn/FtfdQIarBcHtVsmP4_NLLHGFcbCX','682,681','682,681','','0','0','http://www.imgtqbu.weiruikj.cn/FvdxB0UpVKM8pUoQK3paoFI-Ga5Q','360,360','360,360','','0','0','','0','0','2018-11-04 21:24:28'),(1979,0,0,0,'fuzhu1541338538','fuzhu','http://www.imgtqbu.weiruikj.cn/Fkdtlzx3djw_htcRHYJwvkV32S4x','338,336','338,336','','0','0','http://www.imgtqbu.weiruikj.cn/FjBwfph-7ktxBEgf9g9x9orVn01J','360,360','360,360','','0','0','','0','0','2018-11-04 21:35:39'),(1980,0,0,0,'fuzhu1541338636','fuzhu','http://www.imgtqbu.weiruikj.cn/FpG8pTIUA4iUJ44Ls4QkiE2t0MUC','338,328','338,328','','0','0','http://www.imgtqbu.weiruikj.cn/Fjy8LmfbuDk4fgil_LGxnbxVk8lL','360,360','360,360','','0','0','','0','0','2018-11-04 21:37:17'),(1981,0,41,0,'fixaddr_giveup1543928290','fixaddr_giveup','http://www.imgtqbu.weiruikj.cn/FuyDUioRBZQ9gTVTqdCFhsspOKQZ','319,342','319,342','','0','0','http://www.imgtqbu.weiruikj.cn/FrkRno1er4I6P2eo4wFtH0fzE8CF','360,360','360,360','','0','0','','0','0','2018-12-04 20:58:11'),(1982,0,0,0,'pingguo1545895505','pingguo','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1545895505','682,681','682,681','','0','0','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1545895505s360_360','360,360','360,360','','0','0','','0','0','2018-12-27 15:25:06'),(1983,0,35,0,'11546172469','1','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1546172469','375,3797','375,3797','','0','0','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1546172469s360_360','360,360','360,360','','0','0','','0','0','2018-12-30 20:21:09'),(1984,0,42,0,'53025a2d68166af6953564a1ce3ff4c41546412669','53025a2d68166af6953564a1ce3ff4c4','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1546412669','700,723','700,723','','0','0','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1546412670s360_360','360,360','360,360','','0','0','','0','0','2019-01-02 15:04:30'),(1985,0,42,0,'51752736d9894744ace7e8fbab5d12371546412676','51752736d9894744ace7e8fbab5d1237','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1546412676','750,750','750,750','','0','0','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1546412676s360_360','360,360','360,360','','0','0','','0','0','2019-01-02 15:04:36'),(1986,0,42,0,'d145d6968ce8cc0c202045b1a0e0a5da1546412839','d145d6968ce8cc0c202045b1a0e0a5da','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1546412839','500,300','500,300','','0','0','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1546412839s360_360','360,360','360,360','','0','0','','0','0','2019-01-02 15:07:19'),(1987,0,42,0,'e85b00163e126b6eaabb79826febe7b51546412848','e85b00163e126b6eaabb79826febe7b5','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1546412848','1024,683','1024,683','','0','0','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1546412848s360_360','360,360','360,360','','0','0','','0','0','2019-01-02 15:07:28'),(1988,0,42,0,'11546413008','1','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1546413008','375,3797','375,3797','','0','0','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1546413008s360_360','360,360','360,360','','0','0','','0','0','2019-01-02 15:10:08'),(1989,0,43,0,'7e3ced08492c2ab949bec7209d0e125e1547006504','7e3ced08492c2ab949bec7209d0e125e','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547006504','484,263','484,263','','0','0','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547006504s360_360','360,360','360,360','','0','0','','0','0','2019-01-09 12:01:44'),(1990,0,43,0,'b64ea4dbaf51f8048847561044c924b71547006510','b64ea4dbaf51f8048847561044c924b7','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547006510','750,690','750,690','','0','0','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547006510s360_360','360,360','360,360','','0','0','','0','0','2019-01-09 12:01:50'),(1991,0,42,0,'b64ea4dbaf51f8048847561044c924b71547008371','b64ea4dbaf51f8048847561044c924b7','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371','750,690','750,690','','0','0','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371s360_360','360,360','360,360','','0','0','','0','0','2019-01-09 12:32:51'),(1992,0,42,0,'360t1547191692','360t','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547191692','360,3645','360,3645','','0','0','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547191692s360_360','360,360','360,360','','0','0','','0','0','2019-01-11 15:28:12'),(1993,0,43,0,'11547193940','1','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547193940','375,3797','375,3797','','0','0','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547193940s360_360','360,360','360,360','','0','0','','0','0','2019-01-11 16:05:40'),(1994,0,44,0,'testp11547734523','testp1','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547734523','375,600','375,600','','0','0','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547734523s360_360','360,360','360,360','','0','0','','0','0','2019-01-17 22:15:23'),(1995,0,44,0,'testpic21547734530','testpic2','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547734530','451,600','451,600','','0','0','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547734530s360_360','360,360','360,360','','0','0','','0','0','2019-01-17 22:15:30'),(1996,0,42,0,'tiao1547885047','tiao','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547885047','420,419','420,419','','0','0','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547885047s360_360','360,360','360,360','','0','0','','0','0','2019-01-19 16:04:07'),(1997,0,42,0,'box1547885047','box','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547885047','375,375','375,375','','0','0','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547885047s360_360','360,360','360,360','','0','0','','0','0','2019-01-19 16:04:07'),(1998,0,42,0,'daizi1547885047','daizi','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547885047','375,375','375,375','','0','0','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547885047s360_360','360,360','360,360','','0','0','','0','0','2019-01-19 16:04:08'),(1999,0,42,0,'box1547885108','box','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547885108','375,375','375,375','','0','0','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547885108s360_360','360,360','360,360','','0','0','','0','0','2019-01-19 16:05:08'),(2000,0,42,0,'daizi1547885112','daizi','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547885112','375,375','375,375','','0','0','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547885112s360_360','360,360','360,360','','0','0','','0','0','2019-01-19 16:05:12'),(2001,0,42,0,'tiao1547885115','tiao','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547885115','420,419','420,419','','0','0','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547885115s360_360','360,360','360,360','','0','0','','0','0','2019-01-19 16:05:15'),(2002,0,42,0,'feitiaodetails1548164217','feitiaodetails','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1548164217','375,2567','375,2567','','0','0','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1548164217s360_360','360,360','360,360','','0','0','','0','0','2019-01-22 21:36:57'),(2003,0,42,0,'feitiaodetails1548299653','feitiaodetails','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1548299653','375,2567','375,2567','','0','0','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1548299653s360_360','360,360','360,360','','0','0','','0','0','2019-01-24 11:14:13'),(2004,0,42,0,'shbz1548299677','shbz','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1548299677','375,375','375,375','','0','0','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1548299677s360_360','360,360','360,360','','0','0','','0','0','2019-01-24 11:14:37');
/*!40000 ALTER TABLE `sys_album_picture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_area`
--

DROP TABLE IF EXISTS `sys_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_area` (
  `area_id` int(11) NOT NULL AUTO_INCREMENT,
  `area_name` varchar(50) NOT NULL DEFAULT '',
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`area_id`),
  KEY `INDEX_NAME` (`area_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=2048 COMMENT='全部区域表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_area`
--

LOCK TABLES `sys_area` WRITE;
/*!40000 ALTER TABLE `sys_area` DISABLE KEYS */;
INSERT INTO `sys_area` VALUES (1,'华东',0),(2,'华北',0),(3,'华南',0),(4,'华中',0),(5,'东北',0),(6,'西北',0),(7,'西南',0),(8,'港澳台',0),(9,'其他',0);
/*!40000 ALTER TABLE `sys_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_city`
--

DROP TABLE IF EXISTS `sys_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_city` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `province_id` int(11) NOT NULL DEFAULT '0',
  `city_name` varchar(255) NOT NULL DEFAULT '',
  `zipcode` varchar(6) NOT NULL DEFAULT '',
  `sort` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`city_id`),
  KEY `IDX_g_city_CityName` (`city_name`),
  KEY `INDEX_PROVINCEID` (`province_id`)
) ENGINE=InnoDB AUTO_INCREMENT=362 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=135;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_city`
--

LOCK TABLES `sys_city` WRITE;
/*!40000 ALTER TABLE `sys_city` DISABLE KEYS */;
INSERT INTO `sys_city` VALUES (1,1,'北京市','100000',1),(2,2,'天津市','100000',0),(3,3,'石家庄市','050000',0),(4,3,'唐山市','063000',0),(5,3,'秦皇岛市','066000',0),(6,3,'邯郸市','056000',0),(7,3,'邢台市','054000',0),(8,3,'保定市','071000',0),(9,3,'张家口市','075000',0),(10,3,'承德市','067000',0),(11,3,'沧州市','061000',0),(12,3,'廊坊市','065000',0),(13,3,'衡水市','053000',0),(14,4,'太原市','030000',0),(15,4,'大同市','037000',0),(16,4,'阳泉市','045000',0),(17,4,'长治市','046000',0),(18,4,'晋城市','048000',0),(19,4,'朔州市','036000',0),(20,4,'晋中市','030600',0),(21,4,'运城市','044000',0),(22,4,'忻州市','034000',0),(23,4,'临汾市','041000',0),(24,4,'吕梁市','030500',0),(25,5,'呼和浩特市','010000',0),(26,5,'包头市','014000',0),(27,5,'乌海市','016000',0),(28,5,'赤峰市','024000',0),(29,5,'通辽市','028000',0),(30,5,'鄂尔多斯市','010300',0),(31,5,'呼伦贝尔市','021000',0),(32,5,'巴彦淖尔市','014400',0),(33,5,'乌兰察布市','011800',0),(34,5,'兴安盟','137500',0),(35,5,'锡林郭勒盟','011100',0),(36,5,'阿拉善盟','016000',0),(37,6,'沈阳市','110000',0),(38,6,'大连市','116000',0),(39,6,'鞍山市','114000',0),(40,6,'抚顺市','113000',0),(41,6,'本溪市','117000',0),(42,6,'丹东市','118000',0),(43,6,'锦州市','121000',0),(44,6,'营口市','115000',0),(45,6,'阜新市','123000',0),(46,6,'辽阳市','111000',0),(47,6,'盘锦市','124000',0),(48,6,'铁岭市','112000',0),(49,6,'朝阳市','122000',0),(50,6,'葫芦岛市','125000',0),(51,7,'长春市','130000',0),(52,7,'吉林市','132000',0),(53,7,'四平市','136000',0),(54,7,'辽源市','136200',0),(55,7,'通化市','134000',0),(56,7,'白山市','134300',0),(57,7,'松原市','131100',0),(58,7,'白城市','137000',0),(59,7,'延边朝鲜族自治州','133000',0),(60,8,'哈尔滨市','150000',0),(61,8,'齐齐哈尔市','161000',0),(62,8,'鸡西市','158100',0),(63,8,'鹤岗市','154100',0),(64,8,'双鸭山市','155100',0),(65,8,'大庆市','163000',0),(66,8,'伊春市','152300',0),(67,8,'佳木斯市','154000',0),(68,8,'七台河市','154600',0),(69,8,'牡丹江市','157000',0),(70,8,'黑河市','164300',0),(71,8,'绥化市','152000',0),(72,8,'大兴安岭地区','165000',0),(73,9,'上海市','200000',0),(74,10,'南京市','210000',0),(75,10,'无锡市','214000',0),(76,10,'徐州市','221000',0),(77,10,'常州市','213000',0),(78,10,'苏州市','215000',0),(79,10,'南通市','226000',0),(80,10,'连云港市','222000',0),(81,10,'淮安市','223200',0),(82,10,'盐城市','224000',0),(83,10,'扬州市','225000',0),(84,10,'镇江市','212000',0),(85,10,'泰州市','225300',0),(86,10,'宿迁市','223800',0),(87,11,'杭州市','310000',0),(88,11,'宁波市','315000',0),(89,11,'温州市','325000',0),(90,11,'嘉兴市','314000',0),(91,11,'湖州市','313000',0),(92,11,'绍兴市','312000',0),(93,11,'金华市','321000',0),(94,11,'衢州市','324000',0),(95,11,'舟山市','316000',0),(96,11,'台州市','318000',0),(97,11,'丽水市','323000',0),(98,12,'合肥市','230000',0),(99,12,'芜湖市','241000',0),(100,12,'蚌埠市','233000',0),(101,12,'淮南市','232000',0),(102,12,'马鞍山市','243000',0),(103,12,'淮北市','235000',0),(104,12,'铜陵市','244000',0),(105,12,'安庆市','246000',0),(106,12,'黄山市','242700',0),(107,12,'滁州市','239000',0),(108,12,'阜阳市','236100',0),(109,12,'宿州市','234100',0),(110,12,'巢湖市','238000',0),(111,12,'六安市','237000',0),(112,12,'亳州市','236800',0),(113,12,'池州市','247100',0),(114,12,'宣城市','366000',0),(115,13,'福州市','350000',0),(116,13,'厦门市','361000',0),(117,13,'莆田市','351100',0),(118,13,'三明市','365000',0),(119,13,'泉州市','362000',0),(120,13,'漳州市','363000',0),(121,13,'南平市','353000',0),(122,13,'龙岩市','364000',0),(123,13,'宁德市','352100',0),(124,14,'南昌市','330000',0),(125,14,'景德镇市','333000',0),(126,14,'萍乡市','337000',0),(127,14,'九江市','332000',0),(128,14,'新余市','338000',0),(129,14,'鹰潭市','335000',0),(130,14,'赣州市','341000',0),(131,14,'吉安市','343000',0),(132,14,'宜春市','336000',0),(133,14,'抚州市','332900',0),(134,14,'上饶市','334000',0),(135,15,'济南市','250000',0),(136,15,'青岛市','266000',0),(137,15,'淄博市','255000',0),(138,15,'枣庄市','277100',0),(139,15,'东营市','257000',0),(140,15,'烟台市','264000',0),(141,15,'潍坊市','261000',0),(142,15,'济宁市','272100',0),(143,15,'泰安市','271000',0),(144,15,'威海市','265700',0),(145,15,'日照市','276800',0),(146,15,'莱芜市','271100',0),(147,15,'临沂市','276000',0),(148,15,'德州市','253000',0),(149,15,'聊城市','252000',0),(150,15,'滨州市','256600',0),(151,15,'荷泽市','255000',0),(152,16,'郑州市','450000',0),(153,16,'开封市','475000',0),(154,16,'洛阳市','471000',0),(155,16,'平顶山市','467000',0),(156,16,'安阳市','454900',0),(157,16,'鹤壁市','456600',0),(158,16,'新乡市','453000',0),(159,16,'焦作市','454100',0),(160,16,'濮阳市','457000',0),(161,16,'许昌市','461000',0),(162,16,'漯河市','462000',0),(163,16,'三门峡市','472000',0),(164,16,'南阳市','473000',0),(165,16,'商丘市','476000',0),(166,16,'信阳市','464000',0),(167,16,'周口市','466000',0),(168,16,'驻马店市','463000',0),(169,17,'武汉市','430000',0),(170,17,'黄石市','435000',0),(171,17,'十堰市','442000',0),(172,17,'宜昌市','443000',0),(173,17,'襄樊市','441000',0),(174,17,'鄂州市','436000',0),(175,17,'荆门市','448000',0),(176,17,'孝感市','432100',0),(177,17,'荆州市','434000',0),(178,17,'黄冈市','438000',0),(179,17,'咸宁市','437000',0),(180,17,'随州市','441300',0),(181,17,'恩施土家族苗族自治州','445000',0),(182,17,'神农架','442400',0),(183,18,'长沙市','410000',0),(184,18,'株洲市','412000',0),(185,18,'湘潭市','411100',0),(186,18,'衡阳市','421000',0),(187,18,'邵阳市','422000',0),(188,18,'岳阳市','414000',0),(189,18,'常德市','415000',0),(190,18,'张家界市','427000',0),(191,18,'益阳市','413000',0),(192,18,'郴州市','423000',0),(193,18,'永州市','425000',0),(194,18,'怀化市','418000',0),(195,18,'娄底市','417000',0),(196,18,'湘西土家族苗族自治州','416000',0),(197,19,'广州市','510000',0),(198,19,'韶关市','521000',0),(199,19,'深圳市','518000',0),(200,19,'珠海市','519000',0),(201,19,'汕头市','515000',0),(202,19,'佛山市','528000',0),(203,19,'江门市','529000',0),(204,19,'湛江市','524000',0),(205,19,'茂名市','525000',0),(206,19,'肇庆市','526000',0),(207,19,'惠州市','516000',0),(208,19,'梅州市','514000',0),(209,19,'汕尾市','516600',1),(210,19,'河源市','517000',0),(211,19,'阳江市','529500',0),(212,19,'清远市','511500',0),(213,19,'东莞市','511700',0),(214,19,'中山市','528400',0),(215,19,'潮州市','515600',0),(216,19,'揭阳市','522000',0),(217,19,'云浮市','527300',0),(218,20,'南宁市','530000',0),(219,20,'柳州市','545000',0),(220,20,'桂林市','541000',0),(221,20,'梧州市','543000',0),(222,20,'北海市','536000',0),(223,20,'防城港市','538000',0),(224,20,'钦州市','535000',0),(225,20,'贵港市','537100',0),(226,20,'玉林市','537000',0),(227,20,'百色市','533000',0),(228,20,'贺州市','542800',0),(229,20,'河池市','547000',0),(230,20,'来宾市','546100',0),(231,20,'崇左市','532200',0),(232,21,'海口市','570000',0),(233,21,'三亚市','572000',0),(234,22,'重庆市','400000',0),(235,23,'成都市','610000',0),(236,23,'自贡市','643000',0),(237,23,'攀枝花市','617000',0),(238,23,'泸州市','646100',0),(239,23,'德阳市','618000',0),(240,23,'绵阳市','621000',0),(241,23,'广元市','628000',0),(242,23,'遂宁市','629000',0),(243,23,'内江市','641000',0),(244,23,'乐山市','614000',0),(245,23,'南充市','637000',0),(246,23,'眉山市','612100',0),(247,23,'宜宾市','644000',0),(248,23,'广安市','638000',0),(249,23,'达州市','635000',0),(250,23,'雅安市','625000',0),(251,23,'巴中市','635500',0),(252,23,'资阳市','641300',0),(253,23,'阿坝藏族羌族自治州','624600',0),(254,23,'甘孜藏族自治州','626000',0),(255,23,'凉山彝族自治州','615000',0),(256,24,'贵阳市','55000',0),(257,24,'六盘水市','553000',0),(258,24,'遵义市','563000',0),(259,24,'安顺市','561000',0),(260,24,'铜仁地区','554300',0),(261,24,'黔西南布依族苗族自治州','551500',0),(262,24,'毕节地区','551700',0),(263,24,'黔东南苗族侗族自治州','551500',0),(264,24,'黔南布依族苗族自治州','550100',0),(265,25,'昆明市','650000',0),(266,25,'曲靖市','655000',0),(267,25,'玉溪市','653100',0),(268,25,'保山市','678000',0),(269,25,'昭通市','657000',0),(270,25,'丽江市','674100',0),(271,25,'思茅市','665000',0),(272,25,'临沧市','677000',0),(273,25,'楚雄彝族自治州','675000',0),(274,25,'红河哈尼族彝族自治州','654400',0),(275,25,'文山壮族苗族自治州','663000',0),(276,25,'西双版纳傣族自治州','666200',0),(277,25,'大理白族自治州','671000',0),(278,25,'德宏傣族景颇族自治州','678400',0),(279,25,'怒江傈僳族自治州','671400',0),(280,25,'迪庆藏族自治州','674400',0),(281,26,'拉萨市','850000',0),(282,26,'昌都地区','854000',0),(283,26,'山南地区','856000',0),(284,26,'日喀则地区','857000',0),(285,26,'那曲地区','852000',0),(286,26,'阿里地区','859100',0),(287,26,'林芝地区','860100',0),(288,27,'西安市','710000',0),(289,27,'铜川市','727000',0),(290,27,'宝鸡市','721000',0),(291,27,'咸阳市','712000',0),(292,27,'渭南市','714000',0),(293,27,'延安市','716000',0),(294,27,'汉中市','723000',0),(295,27,'榆林市','719000',0),(296,27,'安康市','725000',0),(297,27,'商洛市','711500',0),(298,28,'兰州市','730000',0),(299,28,'嘉峪关市','735100',0),(300,28,'金昌市','737100',0),(301,28,'白银市','730900',0),(302,28,'天水市','741000',0),(303,28,'武威市','733000',0),(304,28,'张掖市','734000',0),(305,28,'平凉市','744000',0),(306,28,'酒泉市','735000',0),(307,28,'庆阳市','744500',0),(308,28,'定西市','743000',0),(309,28,'陇南市','742100',0),(310,28,'临夏回族自治州','731100',0),(311,28,'甘南藏族自治州','747000',0),(312,29,'西宁市','810000',0),(313,29,'海东地区','810600',0),(314,29,'海北藏族自治州','810300',0),(315,29,'黄南藏族自治州','811300',0),(316,29,'海南藏族自治州','813000',0),(317,29,'果洛藏族自治州','814000',0),(318,29,'玉树藏族自治州','815000',0),(319,29,'海西蒙古族藏族自治州','817000',0),(320,30,'银川市','750000',0),(321,30,'石嘴山市','753000',0),(322,30,'吴忠市','751100',0),(323,30,'固原市','756000',0),(324,30,'中卫市','751700',0),(325,31,'乌鲁木齐市','830000',0),(326,31,'克拉玛依市','834000',0),(327,31,'吐鲁番地区','838000',0),(328,31,'哈密地区','839000',0),(329,31,'昌吉回族自治州','831100',0),(330,31,'博尔塔拉蒙古自治州','833400',0),(331,31,'巴音郭楞蒙古自治州','841000',0),(332,31,'阿克苏地区','843000',0),(333,31,'克孜勒苏柯尔克孜自治州','835600',0),(334,31,'喀什地区','844000',0),(335,31,'和田地区','848000',0),(336,31,'伊犁哈萨克自治州','833200',0),(337,31,'塔城地区','834700',0),(338,31,'阿勒泰地区','836500',0),(339,31,'石河子市','832000',0),(340,31,'阿拉尔市','843300',0),(341,31,'图木舒克市','843900',0),(342,31,'五家渠市','831300',0),(343,32,'香港特别行政区','000000',0),(344,33,'澳门特别行政区','000000',0),(345,34,'台北','000000',0),(356,34,'高雄','000021',1),(358,0,'qq2','',0),(359,357,'22','22',0),(360,0,'gqgqg','',0),(361,0,'qwr','',0);
/*!40000 ALTER TABLE `sys_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `instance_id` int(11) NOT NULL DEFAULT '1' COMMENT '实例ID',
  `key` varchar(255) NOT NULL DEFAULT '' COMMENT '配置项WCHAT,QQ,WPAY,ALIPAY...',
  `value` varchar(1000) NOT NULL DEFAULT '' COMMENT '配置值json',
  `create_time` datetime NOT NULL DEFAULT '2017-07-17 17:39:11' COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT '2017-07-17 17:39:11' COMMENT '修改时间',
  `desc` varchar(1000) NOT NULL DEFAULT '' COMMENT '描述',
  `is_use` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否启用 1启用 0不启用',
  PRIMARY KEY (`id`),
  KEY `INDEX_SHOPID` (`instance_id`),
  KEY `INDEX_KEY` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=963 COMMENT='第三方配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (12,0,'USERNOTICE','\"\\u611f\\u8c22\\u8bbf\\u95eeniushop\\u5546\\u57ce\"','2017-02-23 14:08:01','2017-07-14 10:19:20','',1),(13,0,'HOTKEY','[\"\\u8863\\u670d\\uff0c\\u978b\\u5b50\"]','2017-02-23 14:35:49','2017-07-17 18:07:04','',1),(14,0,'DEFAULTKEY','\"1231231231\"','2017-02-23 14:36:28','2017-07-11 11:35:43','',1),(17,0,'QQLOGIN','{\"APP_KEY\":\"jggg\",\"APP_SECRET\":\"uu\",\"AUTHORIZE\":\"http:\\/\\/localhost\",\"CALLBACK\":\"http:\\/\\/localhost\\/niushop_b2b2c\\/wap\\/login\\/callback\"}','2017-03-01 14:48:45','2017-07-04 18:03:44','qq',1),(18,0,'WCHAT','{\"APP_KEY\":\"6\",\"APP_SECRET\":\"11116677\",\"AUTHORIZE\":\"http:\\/\\/localhost\",\"CALLBACK\":\"http:\\/\\/localhost\\/niushop_b2b2c\\/wap\\/Login\\/callback\"}','2017-03-01 14:49:07','2017-07-10 19:18:16','微信',1),(21,0,'ALIPAY','{\"ali_partnerid\":\"23123sdfsdfsdfsdfsdf\",\"ali_seller\":\"2222222255\",\"ali_key\":\"2222266\"}','2017-03-02 16:18:17','2017-07-15 11:47:44','',1),(22,0,'EMAILMESSAGE','{\"email_host\":\"smtp.163.com\",\"email_port\":\"587\",\"email_addr\":\"liguang2567@163.com\",\"email_id\":\"admin\",\"email_pass\":\"123456\"}','2017-03-03 15:00:50','2017-07-11 15:19:17','',0),(27,0,'WXOPENPLATFORM','','2017-03-30 11:52:59','2017-06-08 14:34:32','',1),(28,0,'LOGINVERIFYCODE','{\"platform\":\"0\",\"admin\":\"0\",\"pc\":\"0\"}','2017-04-01 10:48:19','2017-07-11 14:13:39','',1),(31,0,'COIN_CONFIG','','2017-04-17 10:36:33','2017-06-08 14:34:32','购物币现金转化关系',1),(38,0,'ORDER_BUY_CLOSE_TIME','600','0000-00-00 00:00:00','2017-07-14 11:39:21','订单自动关闭时间',1),(39,0,'ORDER_DELIVERY_COMPLETE_TIME','3','0000-00-00 00:00:00','2017-07-14 11:39:20','收货后多长时间自动完成',1),(40,0,'ORDER_AUTO_DELIVERY','100','0000-00-00 00:00:00','2017-07-14 11:39:20','订单多长时间自动完成',1),(41,0,'ORDER_BALANCE_PAY','1','0000-00-00 00:00:00','2017-07-14 11:39:20','是否开启余额支付',1),(42,0,'ORDER_INVOICE_TAX','10','0000-00-00 00:00:00','2017-07-14 11:39:20','发票税率',1),(43,0,'ORDER_INVOICE_CONTENT','办公,建材','0000-00-00 00:00:00','2017-07-14 11:39:21','发票内容',1),(44,0,'ORDER_SHOW_BUY_RECORD','0','0000-00-00 00:00:00','2017-07-14 11:39:20','是否显示购买记录',1),(107,0,'ORDER_DELIVERY_PAY','1','2017-06-07 16:51:06','2017-07-14 11:39:21','是否开启货到付款',1),(108,0,'WITHDRAW_BALANCE','{\"withdraw_cash_min\":\"0.01\",\"withdraw_multiple\":\"1\",\"withdraw_poundage\":0,\"withdraw_message\":\"\\u53ef\\u63d0\\u73b0\\u91d1\\u989d\\u4e3a\\u4ea4\\u6613\\u6210\\u529f\\u540e7\\u5929\\u4e14\\u672a\\u63d0\\u73b0\\u7684\\u91d1\\u989d!\"}','2017-06-07 18:18:36','2017-07-13 09:47:11','会员余额提现设置',1),(109,0,'REGISTER_INTEGRAL','1','2017-06-09 12:17:57','2017-07-04 19:24:56','注册送积分',1),(111,0,'SHARE_INTEGRAL','0','2017-06-09 12:17:57','2017-07-04 19:24:56','分享送积分',1),(112,0,'SIGN_INTEGRAL','0','2017-06-09 12:42:50','2017-07-04 19:24:56','签到送积分',1),(113,0,'MOBILEMESSAGE','{\"appKey\":\"LTAIlauazm5VpsfJ\",\"secretKey\":\"r2r4NCU2gmWsis3AcDI5h3NjddMGHT\",\"freeSignName\":\"\\u963f\\u91cc\\u4e91\\u77ed\\u4fe1\\u6d4b\\u8bd5\\u4e13\\u7528\",\"user_type\":\"0\"}','2017-06-10 15:35:08','2017-07-11 09:17:32','',1),(116,0,'LOGINVERIFYCODE','{\"platform\":\"0\",\"admin\":\"0\",\"pc\":\"0\"}','2017-06-10 17:02:51','2017-07-11 14:13:39','',1),(122,0,'HOTKEY','[\"\\u8863\\u670d\\uff0c\\u978b\\u5b50\"]','2017-06-10 17:39:26','2017-07-17 18:07:04','',1),(123,0,'DEFAULTKEY','\"1231231231\"','2017-06-10 17:39:42','2017-07-11 11:35:43','',1),(125,0,'WPAY','{\"appid\":\"324234234234\",\"appkey\":\"11111111111\",\"mch_id\":\"111111\",\"mch_key\":\"11111111111\"}','2017-06-10 17:32:03','2017-07-11 11:36:35','',1),(127,0,'SHOPWCHAT','{\"appid\":\"\",\"appsecret\":\"\"}','2017-06-10 17:48:10','2017-07-21 17:41:50','',1),(129,0,'BUYER_SELF_LIFTING','0','2017-06-20 18:29:56','2017-07-14 11:39:21','是否开启买家自提',1),(132,0,'ORDER_EXPRESS_MESSAGE','{\"appid\":\"1292843\",\"appkey\":\"9a2a7c02-1e14-42f2-b3d0-fb131eb47692\",\"back_url\":\"http:\\/\\/\\u57df\\u540d\\/\"}','2017-06-21 16:36:30','2017-06-21 18:40:12','物流跟踪配置信息',1),(134,0,'ORDER_SELLER_DISPATCHING','1','2017-06-27 11:50:56','2017-07-14 11:39:21','是否开启商家配送',1),(135,0,'SHOPPING_BACK_POINTS','2','2017-06-28 10:33:33','2017-07-14 11:39:21','购物返积分设置',1),(137,0,'REGISTERANDVISIT','{\"is_register\":\"1\",\"register_info\":\"plain,email\",\"name_keyword\":\"q,e,k\",\"pwd_len\":\"6\",\"pwd_complexity\":\"number\",\"terms_of_service\":\"\"}','2017-07-01 15:21:12','2017-07-12 14:52:11','',1),(138,0,'GIFTFREECHANCE','{\"isopen\":\"1\",\"chance\":\"100\"}','2017-07-01 15:21:12','2018-12-28 17:59:38','',1),(139,0,'SEO_TITLE','','2019-01-30 23:25:14','2017-07-17 17:39:11','标题附加字',1),(140,0,'SEO_META','','2019-01-30 23:25:14','2017-07-17 17:39:11','商城关键词',1),(141,0,'SEO_DESC','','2019-01-30 23:25:14','2017-07-17 17:39:11','关键词描述',1),(142,0,'SEO_OTHER','','2019-01-30 23:25:14','2017-07-17 17:39:11','其他页头信息',1),(143,0,'SEO_TITLE','','2019-01-30 23:25:30','2017-07-17 17:39:11','标题附加字',1),(144,0,'SEO_META','','2019-01-30 23:25:30','2017-07-17 17:39:11','商城关键词',1),(145,0,'SEO_DESC','','2019-01-30 23:25:30','2017-07-17 17:39:11','关键词描述',1),(146,0,'SEO_OTHER','','2019-01-30 23:25:30','2017-07-17 17:39:11','其他页头信息',1),(147,0,'SEO_TITLE','','2019-01-30 23:25:37','2017-07-17 17:39:11','标题附加字',1),(148,0,'SEO_META','','2019-01-30 23:25:37','2017-07-17 17:39:11','商城关键词',1),(149,0,'SEO_DESC','','2019-01-30 23:25:38','2017-07-17 17:39:11','关键词描述',1),(150,0,'SEO_OTHER','','2019-01-30 23:25:38','2017-07-17 17:39:11','其他页头信息',1),(151,0,'SEO_TITLE','','2019-01-30 23:25:44','2017-07-17 17:39:11','标题附加字',1),(152,0,'SEO_META','','2019-01-30 23:25:44','2017-07-17 17:39:11','商城关键词',1),(153,0,'SEO_DESC','','2019-01-30 23:25:44','2017-07-17 17:39:11','关键词描述',1),(154,0,'SEO_OTHER','','2019-01-30 23:25:44','2017-07-17 17:39:11','其他页头信息',1),(155,0,'SEO_TITLE','','2019-02-09 20:24:19','2017-07-17 17:39:11','标题附加字',1),(156,0,'SEO_META','','2019-02-09 20:24:19','2017-07-17 17:39:11','商城关键词',1),(157,0,'SEO_DESC','','2019-02-09 20:24:19','2017-07-17 17:39:11','关键词描述',1),(158,0,'SEO_OTHER','','2019-02-09 20:24:19','2017-07-17 17:39:11','其他页头信息',1),(159,0,'SEO_TITLE','','2019-02-09 20:24:42','2017-07-17 17:39:11','标题附加字',1),(160,0,'SEO_META','','2019-02-09 20:24:42','2017-07-17 17:39:11','商城关键词',1),(161,0,'SEO_DESC','','2019-02-09 20:24:42','2017-07-17 17:39:11','关键词描述',1),(162,0,'SEO_OTHER','','2019-02-09 20:24:42','2017-07-17 17:39:11','其他页头信息',1),(163,0,'SEO_TITLE','','2019-02-09 20:24:50','2017-07-17 17:39:11','标题附加字',1),(164,0,'SEO_META','','2019-02-09 20:24:50','2017-07-17 17:39:11','商城关键词',1),(165,0,'SEO_DESC','','2019-02-09 20:24:50','2017-07-17 17:39:11','关键词描述',1),(166,0,'SEO_OTHER','','2019-02-09 20:24:50','2017-07-17 17:39:11','其他页头信息',1),(167,0,'SEO_TITLE','','2019-03-22 18:11:13','2017-07-17 17:39:11','标题附加字',1),(168,0,'SEO_META','','2019-03-22 18:11:13','2017-07-17 17:39:11','商城关键词',1),(169,0,'SEO_DESC','','2019-03-22 18:11:13','2017-07-17 17:39:11','关键词描述',1),(170,0,'SEO_OTHER','','2019-03-22 18:11:13','2017-07-17 17:39:11','其他页头信息',1),(171,0,'SEO_TITLE','','2019-03-22 18:11:47','2017-07-17 17:39:11','标题附加字',1),(172,0,'SEO_META','','2019-03-22 18:11:47','2017-07-17 17:39:11','商城关键词',1),(173,0,'SEO_DESC','','2019-03-22 18:11:47','2017-07-17 17:39:11','关键词描述',1),(174,0,'SEO_OTHER','','2019-03-22 18:11:47','2017-07-17 17:39:11','其他页头信息',1),(175,0,'SEO_TITLE','','2019-03-22 18:19:26','2017-07-17 17:39:11','标题附加字',1),(176,0,'SEO_META','','2019-03-22 18:19:26','2017-07-17 17:39:11','商城关键词',1),(177,0,'SEO_DESC','','2019-03-22 18:19:26','2017-07-17 17:39:11','关键词描述',1),(178,0,'SEO_OTHER','','2019-03-22 18:19:26','2017-07-17 17:39:11','其他页头信息',1),(179,0,'SEO_TITLE','','2019-03-22 18:19:38','2017-07-17 17:39:11','标题附加字',1),(180,0,'SEO_META','','2019-03-22 18:19:38','2017-07-17 17:39:11','商城关键词',1),(181,0,'SEO_DESC','','2019-03-22 18:19:38','2017-07-17 17:39:11','关键词描述',1),(182,0,'SEO_OTHER','','2019-03-22 18:19:38','2017-07-17 17:39:11','其他页头信息',1),(183,0,'SEO_TITLE','','2019-04-22 16:59:23','2017-07-17 17:39:11','标题附加字',1),(184,0,'SEO_TITLE','','2019-04-22 16:59:23','2017-07-17 17:39:11','标题附加字',1),(185,0,'SEO_META','','2019-04-22 16:59:23','2017-07-17 17:39:11','商城关键词',1),(186,0,'SEO_META','','2019-04-22 16:59:23','2017-07-17 17:39:11','商城关键词',1),(187,0,'SEO_DESC','','2019-04-22 16:59:23','2017-07-17 17:39:11','关键词描述',1),(188,0,'SEO_DESC','','2019-04-22 16:59:23','2017-07-17 17:39:11','关键词描述',1),(189,0,'SEO_OTHER','','2019-04-22 16:59:23','2017-07-17 17:39:11','其他页头信息',1),(190,0,'SEO_OTHER','','2019-04-22 16:59:23','2017-07-17 17:39:11','其他页头信息',1),(191,0,'SEO_TITLE','','2019-04-22 16:59:27','2017-07-17 17:39:11','标题附加字',1),(192,0,'SEO_TITLE','','2019-04-22 16:59:27','2017-07-17 17:39:11','标题附加字',1),(193,0,'SEO_META','','2019-04-22 16:59:27','2017-07-17 17:39:11','商城关键词',1),(194,0,'SEO_META','','2019-04-22 16:59:27','2017-07-17 17:39:11','商城关键词',1),(195,0,'SEO_DESC','','2019-04-22 16:59:27','2017-07-17 17:39:11','关键词描述',1),(196,0,'SEO_DESC','','2019-04-22 16:59:27','2017-07-17 17:39:11','关键词描述',1),(197,0,'SEO_OTHER','','2019-04-22 16:59:27','2017-07-17 17:39:11','其他页头信息',1),(198,0,'SEO_OTHER','','2019-04-22 16:59:27','2017-07-17 17:39:11','其他页头信息',1),(199,0,'SEO_TITLE','','2019-04-26 13:03:06','2017-07-17 17:39:11','标题附加字',1),(200,0,'SEO_META','','2019-04-26 13:03:06','2017-07-17 17:39:11','商城关键词',1),(201,0,'SEO_TITLE','','2019-04-26 13:03:06','2017-07-17 17:39:11','标题附加字',1),(202,0,'SEO_DESC','','2019-04-26 13:03:06','2017-07-17 17:39:11','关键词描述',1),(203,0,'SEO_META','','2019-04-26 13:03:06','2017-07-17 17:39:11','商城关键词',1),(204,0,'SEO_OTHER','','2019-04-26 13:03:06','2017-07-17 17:39:11','其他页头信息',1),(205,0,'SEO_DESC','','2019-04-26 13:03:06','2017-07-17 17:39:11','关键词描述',1),(206,0,'SEO_OTHER','','2019-04-26 13:03:06','2017-07-17 17:39:11','其他页头信息',1),(207,0,'SEO_TITLE','','2019-04-26 13:03:10','2017-07-17 17:39:11','标题附加字',1),(208,0,'SEO_TITLE','','2019-04-26 13:03:10','2017-07-17 17:39:11','标题附加字',1),(209,0,'SEO_META','','2019-04-26 13:03:10','2017-07-17 17:39:11','商城关键词',1),(210,0,'SEO_META','','2019-04-26 13:03:10','2017-07-17 17:39:11','商城关键词',1),(211,0,'SEO_DESC','','2019-04-26 13:03:10','2017-07-17 17:39:11','关键词描述',1),(212,0,'SEO_DESC','','2019-04-26 13:03:10','2017-07-17 17:39:11','关键词描述',1),(213,0,'SEO_OTHER','','2019-04-26 13:03:10','2017-07-17 17:39:11','其他页头信息',1),(214,0,'SEO_OTHER','','2019-04-26 13:03:10','2017-07-17 17:39:11','其他页头信息',1);
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_district`
--

DROP TABLE IF EXISTS `sys_district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_district` (
  `district_id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) DEFAULT '0',
  `district_name` varchar(255) NOT NULL DEFAULT '',
  `sort` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`district_id`),
  KEY `IDX_g_district_DistrictName` (`district_name`),
  KEY `INDEX_CITYID` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2877 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=50;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_district`
--

LOCK TABLES `sys_district` WRITE;
/*!40000 ALTER TABLE `sys_district` DISABLE KEYS */;
INSERT INTO `sys_district` VALUES (1,1,'东城区',0),(2,1,'西城区',0),(3,1,'崇文区',0),(4,1,'宣武区',0),(5,1,'朝阳区',0),(6,1,'丰台区',0),(7,1,'石景山区',0),(8,1,'海淀区',0),(9,1,'门头沟区',0),(10,1,'房山区',0),(11,1,'通州区',0),(12,1,'顺义区',0),(13,1,'昌平区',0),(14,1,'大兴区',0),(15,1,'怀柔区',0),(16,1,'平谷区',0),(17,1,'密云县',0),(18,1,'延庆县',0),(19,2,'和平区',0),(20,2,'河东区',0),(21,2,'河西区',0),(22,2,'南开区',0),(23,2,'河北区',0),(24,2,'红桥区',0),(25,2,'塘沽区',0),(26,2,'汉沽区',0),(27,2,'大港区',0),(28,2,'东丽区',0),(29,2,'西青区',0),(30,2,'津南区',0),(31,2,'北辰区',0),(32,2,'武清区',0),(33,2,'宝坻区',0),(34,2,'宁河县',0),(35,2,'静海县',0),(36,2,'蓟县',0),(37,3,'长安区',0),(38,3,'桥东区',0),(39,3,'桥西区',0),(40,3,'新华区',0),(41,3,'井陉矿区',0),(42,3,'裕华区',0),(43,3,'井陉县',0),(44,3,'正定县',0),(45,3,'栾城县',0),(46,3,'行唐县',0),(47,3,'灵寿县',0),(48,3,'高邑县',0),(49,3,'深泽县',0),(50,3,'赞皇县',0),(51,3,'无极县',0),(52,3,'平山县',0),(53,3,'元氏县',0),(54,3,'赵县',0),(55,3,'辛集市',0),(56,3,'藁城市',0),(57,3,'晋州市',0),(58,3,'新乐市',0),(59,3,'鹿泉市',0),(60,4,'路南区',0),(61,4,'路北区',0),(62,4,'古冶区',0),(63,4,'开平区',0),(64,4,'丰南区',0),(65,4,'丰润区',0),(66,4,'滦县',0),(67,4,'滦南县',0),(68,4,'乐亭县',0),(69,4,'迁西县',0),(70,4,'玉田县',0),(71,4,'唐海县',0),(72,4,'遵化市',0),(73,4,'迁安市',0),(74,5,'海港区',0),(75,5,'山海关区',0),(76,5,'北戴河区',0),(77,5,'青龙满族自治县',0),(78,5,'昌黎县',0),(79,5,'抚宁县',0),(80,5,'卢龙县',0),(81,6,'邯山区',0),(82,6,'丛台区',0),(83,6,'复兴区',0),(84,6,'峰峰矿区',0),(85,6,'邯郸县',0),(86,6,'临漳县',0),(87,6,'成安县',0),(88,6,'大名县',0),(89,6,'涉县',0),(90,6,'磁县',0),(91,6,'肥乡县',0),(92,6,'永年县',0),(93,6,'邱县',0),(94,6,'鸡泽县',0),(95,6,'广平县',0),(96,6,'馆陶县',0),(97,6,'魏县',0),(98,6,'曲周县',0),(99,6,'武安市',0),(100,7,'桥东区',0),(101,7,'桥西区',0),(102,7,'邢台县',0),(103,7,'临城县',0),(104,7,'内丘县',0),(105,7,'柏乡县',0),(106,7,'隆尧县',0),(107,7,'任县',0),(108,7,'南和县',0),(109,7,'宁晋县',0),(110,7,'巨鹿县',0),(111,7,'新河县',0),(112,7,'广宗县',0),(113,7,'平乡县',0),(114,7,'威县',0),(115,7,'清河县',0),(116,7,'临西县',0),(117,7,'南宫市',0),(118,7,'沙河市',0),(119,8,'新市区',0),(120,8,'北市区',0),(121,8,'南市区',0),(122,8,'满城县',0),(123,8,'清苑县',0),(124,8,'涞水县',0),(125,8,'阜平县',0),(126,8,'徐水县',0),(127,8,'定兴县',0),(128,8,'唐县',0),(129,8,'高阳县',0),(130,8,'容城县',0),(131,8,'涞源县',0),(132,8,'望都县',0),(133,8,'安新县',0),(134,8,'易县',0),(135,8,'曲阳县',0),(136,8,'蠡县',0),(137,8,'顺平县',0),(138,8,'博野县',0),(139,8,'雄县',0),(140,8,'涿州市',0),(141,8,'定州市',0),(142,8,'安国市',0),(143,8,'高碑店市',0),(144,9,'桥东区',0),(145,9,'桥西区',0),(146,9,'宣化区',0),(147,9,'下花园区',0),(148,9,'宣化县',0),(149,9,'张北县',0),(150,9,'康保县',0),(151,9,'沽源县',0),(152,9,'尚义县',0),(153,9,'蔚县',0),(154,9,'阳原县',0),(155,9,'怀安县',0),(156,9,'万全县',0),(157,9,'怀来县',0),(158,9,'涿鹿县',0),(159,9,'赤城县',0),(160,9,'崇礼县',0),(161,10,'双桥区',0),(162,10,'双滦区',0),(163,10,'鹰手营子矿区',0),(164,10,'承德县',0),(165,10,'兴隆县',0),(166,10,'平泉县',0),(167,10,'滦平县',0),(168,10,'隆化县',0),(169,10,'丰宁满族自治县',0),(170,10,'宽城满族自治县',0),(171,10,'围场满族蒙古族自治县',0),(172,11,'新华区',0),(173,11,'运河区',0),(174,11,'沧县',0),(175,11,'青县',0),(176,11,'东光县',0),(177,11,'海兴县',0),(178,11,'盐山县',0),(179,11,'肃宁县',0),(180,11,'南皮县',0),(181,11,'吴桥县',0),(182,11,'献县',0),(183,11,'孟村回族自治县',0),(184,11,'泊头市',0),(185,11,'任丘市',0),(186,11,'黄骅市',0),(187,11,'河间市',0),(188,12,'安次区',0),(189,12,'广阳区',0),(190,12,'固安县',0),(191,12,'永清县',0),(192,12,'香河县',0),(193,12,'大城县',0),(194,12,'文安县',0),(195,12,'大厂回族自治县',0),(196,12,'霸州市',0),(197,12,'三河市',0),(198,13,'桃城区',0),(199,13,'枣强县',0),(200,13,'武邑县',0),(201,13,'武强县',0),(202,13,'饶阳县',0),(203,13,'安平县',0),(204,13,'故城县',0),(205,13,'景县',0),(206,13,'阜城县',0),(207,13,'冀州市',0),(208,13,'深州市',0),(209,14,'小店区',0),(210,14,'迎泽区',0),(211,14,'杏花岭区',0),(212,14,'尖草坪区',0),(213,14,'万柏林区',0),(214,14,'晋源区',0),(215,14,'清徐县',0),(216,14,'阳曲县',0),(217,14,'娄烦县',0),(218,14,'古交市',0),(219,15,'城区',0),(220,15,'矿区',0),(221,15,'南郊区',0),(222,15,'新荣区',0),(223,15,'阳高县',0),(224,15,'天镇县',0),(225,15,'广灵县',0),(226,15,'灵丘县',0),(227,15,'浑源县',0),(228,15,'左云县',0),(229,15,'大同县',0),(230,16,'城区',0),(231,16,'矿区',0),(232,16,'郊区',0),(233,16,'平定县',0),(234,16,'盂县',0),(235,17,'城区',0),(236,17,'郊区',0),(237,17,'长治县',0),(238,17,'襄垣县',0),(239,17,'屯留县',0),(240,17,'平顺县',0),(241,17,'黎城县',0),(242,17,'壶关县',0),(243,17,'长子县',0),(244,17,'武乡县',0),(245,17,'沁县',0),(246,17,'沁源县',0),(247,17,'潞城市',0),(248,18,'城区',0),(249,18,'沁水县',0),(250,18,'阳城县',0),(251,18,'陵川县',0),(252,18,'泽州县',0),(253,18,'高平市',0),(254,19,'朔城区',0),(255,19,'平鲁区',0),(256,19,'山阴县',0),(257,19,'应县',0),(258,19,'右玉县',0),(259,19,'怀仁县',0),(260,20,'榆次区',0),(261,20,'榆社县',0),(262,20,'左权县',0),(263,20,'和顺县',0),(264,20,'昔阳县',0),(265,20,'寿阳县',0),(266,20,'太谷县',0),(267,20,'祁县',0),(268,20,'平遥县',0),(269,20,'灵石县',0),(270,20,'介休市',0),(271,21,'盐湖区',0),(272,21,'临猗县',0),(273,21,'万荣县',0),(274,21,'闻喜县',0),(275,21,'稷山县',0),(276,21,'新绛县',0),(277,21,'绛县',0),(278,21,'垣曲县',0),(279,21,'夏县',0),(280,21,'平陆县',0),(281,21,'芮城县',0),(282,21,'永济市',0),(283,21,'河津市',0),(284,22,'忻府区',0),(285,22,'定襄县',0),(286,22,'五台县',0),(287,22,'代县',0),(288,22,'繁峙县',0),(289,22,'宁武县',0),(290,22,'静乐县',0),(291,22,'神池县',0),(292,22,'五寨县',0),(293,22,'岢岚县',0),(294,22,'河曲县',0),(295,22,'保德县',0),(296,22,'偏关县',0),(297,22,'原平市',0),(298,23,'尧都区',0),(299,23,'曲沃县',0),(300,23,'翼城县',0),(301,23,'襄汾县',0),(302,23,'洪洞县',0),(303,23,'古县',0),(304,23,'安泽县',0),(305,23,'浮山县',0),(306,23,'吉县',0),(307,23,'乡宁县',0),(308,23,'大宁县',0),(309,23,'隰县',0),(310,23,'永和县',0),(311,23,'蒲县',0),(312,23,'汾西县',0),(313,23,'侯马市',0),(314,23,'霍州市',0),(315,24,'离石区',0),(316,24,'文水县',0),(317,24,'交城县',0),(318,24,'兴县',0),(319,24,'临县',0),(320,24,'柳林县',0),(321,24,'石楼县',0),(322,24,'岚县',0),(323,24,'方山县',0),(324,24,'中阳县',0),(325,24,'交口县',0),(326,24,'孝义市',0),(327,24,'汾阳市',0),(328,25,'新城区',0),(329,25,'回民区',0),(330,25,'玉泉区',0),(331,25,'赛罕区',0),(332,25,'土默特左旗',0),(333,25,'托克托县',0),(334,25,'和林格尔县',0),(335,25,'清水河县',0),(336,25,'武川县',0),(337,26,'东河区',0),(338,26,'昆都仑区',0),(339,26,'青山区',0),(340,26,'石拐区',0),(341,26,'白云矿区',0),(342,26,'九原区',0),(343,26,'土默特右旗',0),(344,26,'固阳县',0),(345,26,'达尔罕茂明安联合旗',0),(346,27,'海勃湾区',0),(347,27,'海南区',0),(348,27,'乌达区',0),(349,28,'红山区',0),(350,28,'元宝山区',0),(351,28,'松山区',0),(352,28,'阿鲁科尔沁旗',0),(353,28,'巴林左旗',0),(354,28,'巴林右旗',0),(355,28,'林西县',0),(356,28,'克什克腾旗',0),(357,28,'翁牛特旗',0),(358,28,'喀喇沁旗',0),(359,28,'宁城县',0),(360,28,'敖汉旗',0),(361,29,'科尔沁区',0),(362,29,'科尔沁左翼中旗',0),(363,29,'科尔沁左翼后旗',0),(364,29,'开鲁县',0),(365,29,'库伦旗',0),(366,29,'奈曼旗',0),(367,29,'扎鲁特旗',0),(368,29,'霍林郭勒市',0),(369,30,'东胜区',0),(370,30,'达拉特旗',0),(371,30,'准格尔旗',0),(372,30,'鄂托克前旗',0),(373,30,'鄂托克旗',0),(374,30,'杭锦旗',0),(375,30,'乌审旗',0),(376,30,'伊金霍洛旗',0),(377,31,'海拉尔区',0),(378,31,'阿荣旗',0),(379,31,'莫力达瓦达斡尔族自治旗',0),(380,31,'鄂伦春自治旗',0),(381,31,'鄂温克族自治旗',0),(382,31,'陈巴尔虎旗',0),(383,31,'新巴尔虎左旗',0),(384,31,'新巴尔虎右旗',0),(385,31,'满洲里市',0),(386,31,'牙克石市',0),(387,31,'扎兰屯市',0),(388,31,'额尔古纳市',0),(389,31,'根河市',0),(390,32,'临河区',0),(391,32,'五原县',0),(392,32,'磴口县',0),(393,32,'乌拉特前旗',0),(394,32,'乌拉特中旗',0),(395,32,'乌拉特后旗',0),(396,32,'杭锦后旗',0),(397,33,'集宁区',0),(398,33,'卓资县',0),(399,33,'化德县',0),(400,33,'商都县',0),(401,33,'兴和县',0),(402,33,'凉城县',0),(403,33,'察哈尔右翼前旗',0),(404,33,'察哈尔右翼中旗',0),(405,33,'察哈尔右翼后旗',0),(406,33,'四子王旗',0),(407,33,'丰镇市',0),(408,34,'乌兰浩特市',0),(409,34,'阿尔山市',0),(410,34,'科尔沁右翼前旗',0),(411,34,'科尔沁右翼中旗',0),(412,34,'扎赉特旗',0),(413,34,'突泉县',0),(414,35,'二连浩特市',0),(415,35,'锡林浩特市',0),(416,35,'阿巴嘎旗',0),(417,35,'苏尼特左旗',0),(418,35,'苏尼特右旗',0),(419,35,'东乌珠穆沁旗',0),(420,35,'西乌珠穆沁旗',0),(421,35,'太仆寺旗',0),(422,35,'镶黄旗',0),(423,35,'正镶白旗',0),(424,35,'正蓝旗',0),(425,35,'多伦县',0),(426,36,'阿拉善左旗',0),(427,36,'阿拉善右旗',0),(428,36,'额济纳旗',0),(429,37,'和平区',0),(430,37,'沈河区',0),(431,37,'大东区',0),(432,37,'皇姑区',0),(433,37,'铁西区',0),(434,37,'苏家屯区',0),(435,37,'东陵区',0),(436,37,'新城子区',0),(437,37,'于洪区',0),(438,37,'辽中县',0),(439,37,'康平县',0),(440,37,'法库县',0),(441,37,'新民市',0),(442,38,'中山区',0),(443,38,'西岗区',0),(444,38,'沙河口区',0),(445,38,'甘井子区',0),(446,38,'旅顺口区',0),(447,38,'金州区',0),(448,38,'长海县',0),(449,38,'瓦房店市',0),(450,38,'普兰店市',0),(451,38,'庄河市',0),(452,39,'铁东区',0),(453,39,'铁西区',0),(454,39,'立山区',0),(455,39,'千山区',0),(456,39,'台安县',0),(457,39,'岫岩满族自治县',0),(458,39,'海城市',0),(459,40,'新抚区',0),(460,40,'东洲区',0),(461,40,'望花区',0),(462,40,'顺城区',0),(463,40,'抚顺县',0),(464,40,'新宾满族自治县',0),(465,40,'清原满族自治县',0),(466,41,'平山区',0),(467,41,'溪湖区',0),(468,41,'明山区',0),(469,41,'南芬区',0),(470,41,'本溪满族自治县',0),(471,41,'桓仁满族自治县',0),(472,42,'元宝区',0),(473,42,'振兴区',0),(474,42,'振安区',0),(475,42,'宽甸满族自治县',0),(476,42,'东港市',0),(477,42,'凤城市',0),(478,43,'古塔区',0),(479,43,'凌河区',0),(480,43,'太和区',0),(481,43,'黑山县',0),(482,43,'义县',0),(483,43,'凌海市',0),(484,43,'北宁市',0),(485,44,'站前区',0),(486,44,'西市区',0),(487,44,'鲅鱼圈区',0),(488,44,'老边区',0),(489,44,'盖州市',0),(490,44,'大石桥市',0),(491,45,'海州区',0),(492,45,'新邱区',0),(493,45,'太平区',0),(494,45,'清河门区',0),(495,45,'细河区',0),(496,45,'阜新蒙古族自治县',0),(497,45,'彰武县',0),(498,46,'白塔区',0),(499,46,'文圣区',0),(500,46,'宏伟区',0),(501,46,'弓长岭区',0),(502,46,'太子河区',0),(503,46,'辽阳县',0),(504,46,'灯塔市',0),(505,47,'双台子区',0),(506,47,'兴隆台区',0),(507,47,'大洼县',0),(508,47,'盘山县',0),(509,48,'银州区',0),(510,48,'清河区',0),(511,48,'铁岭县',0),(512,48,'西丰县',0),(513,48,'昌图县',0),(514,48,'调兵山市',0),(515,48,'开原市',0),(516,49,'双塔区',0),(517,49,'龙城区',0),(518,49,'朝阳县',0),(519,49,'建平县',0),(520,49,'喀喇沁左翼蒙古族自治县',0),(521,49,'北票市',0),(522,49,'凌源市',0),(523,50,'连山区',0),(524,50,'龙港区',0),(525,50,'南票区',0),(526,50,'绥中县',0),(527,50,'建昌县',0),(528,50,'兴城市',0),(529,51,'南关区',0),(530,51,'宽城区',0),(531,51,'朝阳区',0),(532,51,'二道区',0),(533,51,'绿园区',0),(534,51,'双阳区',0),(535,51,'农安县',0),(536,51,'九台市',0),(537,51,'榆树市',0),(538,51,'德惠市',0),(539,52,'昌邑区',0),(540,52,'龙潭区',0),(541,52,'船营区',0),(542,52,'丰满区',0),(543,52,'永吉县',0),(544,52,'蛟河市',0),(545,52,'桦甸市',0),(546,52,'舒兰市',0),(547,52,'磐石市',0),(548,53,'铁西区',0),(549,53,'铁东区',0),(550,53,'梨树县',0),(551,53,'伊通满族自治县',0),(552,53,'公主岭市',0),(553,53,'双辽市',0),(554,54,'龙山区',0),(555,54,'西安区',0),(556,54,'东丰县',0),(557,54,'东辽县',0),(558,55,'东昌区',0),(559,55,'二道江区',0),(560,55,'通化县',0),(561,55,'辉南县',0),(562,55,'柳河县',0),(563,55,'梅河口市',0),(564,55,'集安市',0),(565,56,'八道江区',0),(566,56,'抚松县',0),(567,56,'靖宇县',0),(568,56,'长白朝鲜族自治县',0),(569,56,'江源县',0),(570,56,'临江市',0),(571,57,'宁江区',0),(572,57,'前郭尔罗斯蒙古族自治县',0),(573,57,'长岭县',0),(574,57,'乾安县',0),(575,57,'扶余县',0),(576,58,'洮北区',0),(577,58,'镇赉县',0),(578,58,'通榆县',0),(579,58,'洮南市',0),(580,58,'大安市',0),(581,59,'延吉市',0),(582,59,'图们市',0),(583,59,'敦化市',0),(584,59,'珲春市',0),(585,59,'龙井市',0),(586,59,'和龙市',0),(587,59,'汪清县',0),(588,59,'安图县',0),(589,60,'道里区',0),(590,60,'南岗区',0),(591,60,'道外区',0),(592,60,'香坊区',0),(593,60,'动力区',0),(594,60,'平房区',0),(595,60,'松北区',0),(596,60,'呼兰区',0),(597,60,'依兰县',0),(598,60,'方正县',0),(599,60,'宾县',0),(600,60,'巴彦县',0),(601,60,'木兰县',0),(602,60,'通河县',0),(603,60,'延寿县',0),(604,60,'阿城市',0),(605,60,'双城市',0),(606,60,'尚志市',0),(607,60,'五常市',0),(608,61,'龙沙区',0),(609,61,'建华区',0),(610,61,'铁锋区',0),(611,61,'昂昂溪区',0),(612,61,'富拉尔基区',0),(613,61,'碾子山区',0),(614,61,'梅里斯达斡尔族区',0),(615,61,'龙江县',0),(616,61,'依安县',0),(617,61,'泰来县',0),(618,61,'甘南县',0),(619,61,'富裕县',0),(620,61,'克山县',0),(621,61,'克东县',0),(622,61,'拜泉县',0),(623,61,'讷河市',0),(624,62,'鸡冠区',0),(625,62,'恒山区',0),(626,62,'滴道区',0),(627,62,'梨树区',0),(628,62,'城子河区',0),(629,62,'麻山区',0),(630,62,'鸡东县',0),(631,62,'虎林市',0),(632,62,'密山市',0),(633,63,'向阳区',0),(634,63,'工农区',0),(635,63,'南山区',0),(636,63,'兴安区',0),(637,63,'东山区',0),(638,63,'兴山区',0),(639,63,'萝北县',0),(640,63,'绥滨县',0),(641,64,'尖山区',0),(642,64,'岭东区',0),(643,64,'四方台区',0),(644,64,'宝山区',0),(645,64,'集贤县',0),(646,64,'友谊县',0),(647,64,'宝清县',0),(648,64,'饶河县',0),(649,65,'萨尔图区',0),(650,65,'龙凤区',0),(651,65,'让胡路区',0),(652,65,'红岗区',0),(653,65,'大同区',0),(654,65,'肇州县',0),(655,65,'肇源县',0),(656,65,'林甸县',0),(657,65,'杜尔伯特蒙古族自治县',0),(658,66,'伊春区',0),(659,66,'南岔区',0),(660,66,'友好区',0),(661,66,'西林区',0),(662,66,'翠峦区',0),(663,66,'新青区',0),(664,66,'美溪区',0),(665,66,'金山屯区',0),(666,66,'五营区',0),(667,66,'乌马河区',0),(668,66,'汤旺河区',0),(669,66,'带岭区',0),(670,66,'乌伊岭区',0),(671,66,'红星区',0),(672,66,'上甘岭区',0),(673,66,'嘉荫县',0),(674,66,'铁力市',0),(675,67,'永红区',0),(676,67,'向阳区',0),(677,67,'前进区',0),(678,67,'东风区',0),(679,67,'郊区',0),(680,67,'桦南县',0),(681,67,'桦川县',0),(682,67,'汤原县',0),(683,67,'抚远县',0),(684,67,'同江市',0),(685,67,'富锦市',0),(686,68,'新兴区',0),(687,68,'桃山区',0),(688,68,'茄子河区',0),(689,68,'勃利县',0),(690,69,'东安区',0),(691,69,'阳明区',0),(692,69,'爱民区',0),(693,69,'西安区',0),(694,69,'东宁县',0),(695,69,'林口县',0),(696,69,'绥芬河市',0),(697,69,'海林市',0),(698,69,'宁安市',0),(699,69,'穆棱市',0),(700,70,'爱辉区',0),(701,70,'嫩江县',0),(702,70,'逊克县',0),(703,70,'孙吴县',0),(704,70,'北安市',0),(705,70,'五大连池市',0),(706,71,'北林区',0),(707,71,'望奎县',0),(708,71,'兰西县',0),(709,71,'青冈县',0),(710,71,'庆安县',0),(711,71,'明水县',0),(712,71,'绥棱县',0),(713,71,'安达市',0),(714,71,'肇东市',0),(715,71,'海伦市',0),(716,72,'呼玛县',0),(717,72,'塔河县',0),(718,72,'漠河县',0),(719,73,'黄浦区',0),(720,73,'卢湾区',0),(721,73,'徐汇区',0),(722,73,'长宁区',0),(723,73,'静安区',0),(724,73,'普陀区',0),(725,73,'闸北区',0),(726,73,'虹口区',0),(727,73,'杨浦区',0),(728,73,'闵行区',0),(729,73,'宝山区',0),(730,73,'嘉定区',0),(731,73,'浦东新区',0),(732,73,'金山区',0),(733,73,'松江区',0),(734,73,'青浦区',0),(735,73,'南汇区',0),(736,73,'奉贤区',0),(737,73,'崇明县',0),(738,74,'玄武区',0),(739,74,'白下区',0),(740,74,'秦淮区',0),(741,74,'建邺区',0),(742,74,'鼓楼区',0),(743,74,'下关区',0),(744,74,'浦口区',0),(745,74,'栖霞区',0),(746,74,'雨花台区',0),(747,74,'江宁区',0),(748,74,'六合区',0),(749,74,'溧水县',0),(750,74,'高淳县',0),(751,75,'崇安区',0),(752,75,'南长区',0),(753,75,'北塘区',0),(754,75,'锡山区',0),(755,75,'惠山区',0),(756,75,'滨湖区',0),(757,75,'江阴市',0),(758,75,'宜兴市',0),(759,76,'鼓楼区',0),(760,76,'云龙区',0),(761,76,'九里区',0),(762,76,'贾汪区',0),(763,76,'泉山区',0),(764,76,'丰县',0),(765,76,'沛县',0),(766,76,'铜山县',0),(767,76,'睢宁县',0),(768,76,'新沂市',0),(769,76,'邳州市',0),(770,77,'天宁区',0),(771,77,'钟楼区',0),(772,77,'戚墅堰区',0),(773,77,'新北区',0),(774,77,'武进区',0),(775,77,'溧阳市',0),(776,77,'金坛市',0),(777,78,'沧浪区',0),(778,78,'平江区',0),(779,78,'金阊区',0),(780,78,'虎丘区',0),(781,78,'吴中区',0),(782,78,'相城区',0),(783,78,'常熟市',0),(784,78,'张家港市',0),(785,78,'昆山市',0),(786,78,'吴江市',0),(787,78,'太仓市',0),(788,79,'崇川区',0),(789,79,'港闸区',0),(790,79,'海安县',0),(791,79,'如东县',0),(792,79,'启东市',0),(793,79,'如皋市',0),(794,79,'通州市',0),(795,79,'海门市',0),(796,80,'连云区',0),(797,80,'新浦区',0),(798,80,'海州区',0),(799,80,'赣榆县',0),(800,80,'东海县',0),(801,80,'灌云县',0),(802,80,'灌南县',0),(803,81,'清河区',0),(804,81,'楚州区',0),(805,81,'淮阴区',0),(806,81,'清浦区',0),(807,81,'涟水县',0),(808,81,'洪泽县',0),(809,81,'盱眙县',0),(810,81,'金湖县',0),(811,82,'亭湖区',0),(812,82,'盐都区',0),(813,82,'响水县',0),(814,82,'滨海县',0),(815,82,'阜宁县',0),(816,82,'射阳县',0),(817,82,'建湖县',0),(818,82,'东台市',0),(819,82,'大丰市',0),(820,83,'广陵区',0),(821,83,'邗江区',0),(822,83,'维扬区',0),(823,83,'宝应县',0),(824,83,'仪征市',0),(825,83,'高邮市',0),(826,83,'江都市',0),(827,84,'京口区',0),(828,84,'润州区',0),(829,84,'丹徒区',0),(830,84,'丹阳市',0),(831,84,'扬中市',0),(832,84,'句容市',0),(833,85,'海陵区',0),(834,85,'高港区',0),(835,85,'兴化市',0),(836,85,'靖江市',0),(837,85,'泰兴市',0),(838,85,'姜堰市',0),(839,86,'宿城区',0),(840,86,'宿豫区',0),(841,86,'沭阳县',0),(842,86,'泗阳县',0),(843,86,'泗洪县',0),(844,87,'上城区',0),(845,87,'下城区',0),(846,87,'江干区',0),(847,87,'拱墅区',0),(848,87,'西湖区',0),(849,87,'滨江区',0),(850,87,'萧山区',0),(851,87,'余杭区',0),(852,87,'桐庐县',0),(853,87,'淳安县',0),(854,87,'建德市',0),(855,87,'富阳市',0),(856,87,'临安市',0),(857,88,'海曙区',0),(858,88,'江东区',0),(859,88,'江北区',0),(860,88,'北仑区',0),(861,88,'镇海区',0),(862,88,'鄞州区',0),(863,88,'象山县',0),(864,88,'宁海县',0),(865,88,'余姚市',0),(866,88,'慈溪市',0),(867,88,'奉化市',0),(868,89,'鹿城区',0),(869,89,'龙湾区',0),(870,89,'瓯海区',0),(871,89,'洞头县',0),(872,89,'永嘉县',0),(873,89,'平阳县',0),(874,89,'苍南县',0),(875,89,'文成县',0),(876,89,'泰顺县',0),(877,89,'瑞安市',0),(878,89,'乐清市',0),(879,90,'秀城区',0),(880,90,'秀洲区',0),(881,90,'嘉善县',0),(882,90,'海盐县',0),(883,90,'海宁市',0),(884,90,'平湖市',0),(885,90,'桐乡市',0),(886,91,'吴兴区',0),(887,91,'南浔区',0),(888,91,'德清县',0),(889,91,'长兴县',0),(890,91,'安吉县',0),(891,92,'越城区',0),(892,92,'绍兴县',0),(893,92,'新昌县',0),(894,92,'诸暨市',0),(895,92,'上虞市',0),(896,92,'嵊州市',0),(897,93,'婺城区',0),(898,93,'金东区',0),(899,93,'武义县',0),(900,93,'浦江县',0),(901,93,'磐安县',0),(902,93,'兰溪市',0),(903,93,'义乌市',0),(904,93,'东阳市',0),(905,93,'永康市',0),(906,94,'柯城区',0),(907,94,'衢江区',0),(908,94,'常山县',0),(909,94,'开化县',0),(910,94,'龙游县',0),(911,94,'江山市',0),(912,95,'定海区',0),(913,95,'普陀区',0),(914,95,'岱山县',0),(915,95,'嵊泗县',0),(916,96,'椒江区',0),(917,96,'黄岩区',0),(918,96,'路桥区',0),(919,96,'玉环县',0),(920,96,'三门县',0),(921,96,'天台县',0),(922,96,'仙居县',0),(923,96,'温岭市',0),(924,96,'临海市',0),(925,97,'莲都区',0),(926,97,'青田县',0),(927,97,'缙云县',0),(928,97,'遂昌县',0),(929,97,'松阳县',0),(930,97,'云和县',0),(931,97,'庆元县',0),(932,97,'景宁畲族自治县',0),(933,97,'龙泉市',0),(934,98,'瑶海区',0),(935,98,'庐阳区',0),(936,98,'蜀山区',0),(937,98,'包河区',0),(938,98,'长丰县',0),(939,98,'肥东县',0),(940,98,'肥西县',0),(941,99,'镜湖区',0),(942,99,'马塘区',0),(943,99,'新芜区',0),(944,99,'鸠江区',0),(945,99,'芜湖县',0),(946,99,'繁昌县',0),(947,99,'南陵县',0),(948,100,'龙子湖区',0),(949,100,'蚌山区',0),(950,100,'禹会区',0),(951,100,'淮上区',0),(952,100,'怀远县',0),(953,100,'五河县',0),(954,100,'固镇县',0),(955,101,'大通区',0),(956,101,'田家庵区',0),(957,101,'谢家集区',0),(958,101,'八公山区',0),(959,101,'潘集区',0),(960,101,'凤台县',0),(961,102,'金家庄区',0),(962,102,'花山区',0),(963,102,'雨山区',0),(964,102,'当涂县',0),(965,103,'杜集区',0),(966,103,'相山区',0),(967,103,'烈山区',0),(968,103,'濉溪县',0),(969,104,'铜官山区',0),(970,104,'狮子山区',0),(971,104,'郊区',0),(972,104,'铜陵县',0),(973,105,'迎江区',0),(974,105,'大观区',0),(975,105,'郊区',0),(976,105,'怀宁县',0),(977,105,'枞阳县',0),(978,105,'潜山县',0),(979,105,'太湖县',0),(980,105,'宿松县',0),(981,105,'望江县',0),(982,105,'岳西县',0),(983,105,'桐城市',0),(984,106,'屯溪区',0),(985,106,'黄山区',0),(986,106,'徽州区',0),(987,106,'歙县',0),(988,106,'休宁县',0),(989,106,'黟县',0),(990,106,'祁门县',0),(991,107,'琅琊区',0),(992,107,'南谯区',0),(993,107,'来安县',0),(994,107,'全椒县',0),(995,107,'定远县',0),(996,107,'凤阳县',0),(997,107,'天长市',0),(998,107,'明光市',0),(999,108,'颍州区',0),(1000,108,'颍东区',0),(1001,108,'颍泉区',0),(1002,108,'临泉县',0),(1003,108,'太和县',0),(1004,108,'阜南县',0),(1005,108,'颍上县',0),(1006,108,'界首市',0),(1007,109,'埇桥区',0),(1008,109,'砀山县',0),(1009,109,'萧县',0),(1010,109,'灵璧县',0),(1011,109,'泗县',0),(1012,110,'居巢区',0),(1013,110,'庐江县',0),(1014,110,'无为县',0),(1015,110,'含山县',0),(1016,110,'和县',0),(1017,111,'金安区',0),(1018,111,'裕安区',0),(1019,111,'寿县',0),(1020,111,'霍邱县',0),(1021,111,'舒城县',0),(1022,111,'金寨县',0),(1023,111,'霍山县',0),(1024,112,'谯城区',0),(1025,112,'涡阳县',0),(1026,112,'蒙城县',0),(1027,112,'利辛县',0),(1028,113,'贵池区',0),(1029,113,'东至县',0),(1030,113,'石台县',0),(1031,113,'青阳县',0),(1032,114,'宣州区',0),(1033,114,'郎溪县',0),(1034,114,'广德县',0),(1035,114,'泾县',0),(1036,114,'绩溪县',0),(1037,114,'旌德县',0),(1038,114,'宁国市',0),(1039,115,'鼓楼区',0),(1040,115,'台江区',0),(1041,115,'仓山区',0),(1042,115,'马尾区',0),(1043,115,'晋安区',0),(1044,115,'闽侯县',0),(1045,115,'连江县',0),(1046,115,'罗源县',0),(1047,115,'闽清县',0),(1048,115,'永泰县',0),(1049,115,'平潭县',0),(1050,115,'福清市',0),(1051,115,'长乐市',0),(1052,116,'思明区',0),(1053,116,'海沧区',0),(1054,116,'湖里区',0),(1055,116,'集美区',0),(1056,116,'同安区',0),(1057,116,'翔安区',0),(1058,117,'城厢区',0),(1059,117,'涵江区',0),(1060,117,'荔城区',0),(1061,117,'秀屿区',0),(1062,117,'仙游县',0),(1063,118,'梅列区',0),(1064,118,'三元区',0),(1065,118,'明溪县',0),(1066,118,'清流县',0),(1067,118,'宁化县',0),(1068,118,'大田县',0),(1069,118,'尤溪县',0),(1070,118,'沙县',0),(1071,118,'将乐县',0),(1072,118,'泰宁县',0),(1073,118,'建宁县',0),(1074,118,'永安市',0),(1075,119,'鲤城区',0),(1076,119,'丰泽区',0),(1077,119,'洛江区',0),(1078,119,'泉港区',0),(1079,119,'惠安县',0),(1080,119,'安溪县',0),(1081,119,'永春县',0),(1082,119,'德化县',0),(1083,119,'金门县',0),(1084,119,'石狮市',0),(1085,119,'晋江市',0),(1086,119,'南安市',0),(1087,120,'芗城区',0),(1088,120,'龙文区',0),(1089,120,'云霄县',0),(1090,120,'漳浦县',0),(1091,120,'诏安县',0),(1092,120,'长泰县',0),(1093,120,'东山县',0),(1094,120,'南靖县',0),(1095,120,'平和县',0),(1096,120,'华安县',0),(1097,120,'龙海市',0),(1098,121,'延平区',0),(1099,121,'顺昌县',0),(1100,121,'浦城县',0),(1101,121,'光泽县',0),(1102,121,'松溪县',0),(1103,121,'政和县',0),(1104,121,'邵武市',0),(1105,121,'武夷山市',0),(1106,121,'建瓯市',0),(1107,121,'建阳市',0),(1108,122,'新罗区',0),(1109,122,'长汀县',0),(1110,122,'永定县',0),(1111,122,'上杭县',0),(1112,122,'武平县',0),(1113,122,'连城县',0),(1114,122,'漳平市',0),(1115,123,'蕉城区',0),(1116,123,'霞浦县',0),(1117,123,'古田县',0),(1118,123,'屏南县',0),(1119,123,'寿宁县',0),(1120,123,'周宁县',0),(1121,123,'柘荣县',0),(1122,123,'福安市',0),(1123,123,'福鼎市',0),(1124,124,'东湖区',0),(1125,124,'西湖区',0),(1126,124,'青云谱区',0),(1127,124,'湾里区',0),(1128,124,'青山湖区',0),(1129,124,'南昌县',0),(1130,124,'新建县',0),(1131,124,'安义县',0),(1132,124,'进贤县',0),(1133,125,'昌江区',0),(1134,125,'珠山区',0),(1135,125,'浮梁县',0),(1136,125,'乐平市',0),(1137,126,'安源区',0),(1138,126,'湘东区',0),(1139,126,'莲花县',0),(1140,126,'上栗县',0),(1141,126,'芦溪县',0),(1142,127,'庐山区',0),(1143,127,'浔阳区',0),(1144,127,'九江县',0),(1145,127,'武宁县',0),(1146,127,'修水县',0),(1147,127,'永修县',0),(1148,127,'德安县',0),(1149,127,'星子县',0),(1150,127,'都昌县',0),(1151,127,'湖口县',0),(1152,127,'彭泽县',0),(1153,127,'瑞昌市',0),(1154,128,'渝水区',0),(1155,128,'分宜县',0),(1156,129,'月湖区',0),(1157,129,'余江县',0),(1158,129,'贵溪市',0),(1159,130,'章贡区',0),(1160,130,'赣县',0),(1161,130,'信丰县',0),(1162,130,'大余县',0),(1163,130,'上犹县',0),(1164,130,'崇义县',0),(1165,130,'安远县',0),(1166,130,'龙南县',0),(1167,130,'定南县',0),(1168,130,'全南县',0),(1169,130,'宁都县',0),(1170,130,'于都县',0),(1171,130,'兴国县',0),(1172,130,'会昌县',0),(1173,130,'寻乌县',0),(1174,130,'石城县',0),(1175,130,'瑞金市',0),(1176,130,'南康市',0),(1177,131,'吉州区',0),(1178,131,'青原区',0),(1179,131,'吉安县',0),(1180,131,'吉水县',0),(1181,131,'峡江县',0),(1182,131,'新干县',0),(1183,131,'永丰县',0),(1184,131,'泰和县',0),(1185,131,'遂川县',0),(1186,131,'万安县',0),(1187,131,'安福县',0),(1188,131,'永新县',0),(1189,131,'井冈山市',0),(1190,132,'袁州区',0),(1191,132,'奉新县',0),(1192,132,'万载县',0),(1193,132,'上高县',0),(1194,132,'宜丰县',0),(1195,132,'靖安县',0),(1196,132,'铜鼓县',0),(1197,132,'丰城市',0),(1198,132,'樟树市',0),(1199,132,'高安市',0),(1200,133,'临川区',0),(1201,133,'南城县',0),(1202,133,'黎川县',0),(1203,133,'南丰县',0),(1204,133,'崇仁县',0),(1205,133,'乐安县',0),(1206,133,'宜黄县',0),(1207,133,'金溪县',0),(1208,133,'资溪县',0),(1209,133,'东乡县',0),(1210,133,'广昌县',0),(1211,134,'信州区',0),(1212,134,'上饶县',0),(1213,134,'广丰县',0),(1214,134,'玉山县',0),(1215,134,'铅山县',0),(1216,134,'横峰县',0),(1217,134,'弋阳县',0),(1218,134,'余干县',0),(1219,134,'鄱阳县',0),(1220,134,'万年县',0),(1221,134,'婺源县',0),(1222,134,'德兴市',0),(1223,135,'历下区',0),(1224,135,'市中区',0),(1225,135,'槐荫区',0),(1226,135,'天桥区',0),(1227,135,'历城区',0),(1228,135,'长清区',0),(1229,135,'平阴县',0),(1230,135,'济阳县',0),(1231,135,'商河县',0),(1232,135,'章丘市',0),(1233,136,'市南区',0),(1234,136,'市北区',0),(1235,136,'四方区',0),(1236,136,'黄岛区',0),(1237,136,'崂山区',0),(1238,136,'李沧区',0),(1239,136,'城阳区',0),(1240,136,'胶州市',0),(1241,136,'即墨市',0),(1242,136,'平度市',0),(1243,136,'胶南市',0),(1244,136,'莱西市',0),(1245,137,'淄川区',0),(1246,137,'张店区',0),(1247,137,'博山区',0),(1248,137,'临淄区',0),(1249,137,'周村区',0),(1250,137,'桓台县',0),(1251,137,'高青县',0),(1252,137,'沂源县',0),(1253,138,'市中区',0),(1254,138,'薛城区',0),(1255,138,'峄城区',0),(1256,138,'台儿庄区',0),(1257,138,'山亭区',0),(1258,138,'滕州市',0),(1259,139,'东营区',0),(1260,139,'河口区',0),(1261,139,'垦利县',0),(1262,139,'利津县',0),(1263,139,'广饶县',0),(1264,140,'芝罘区',0),(1265,140,'福山区',0),(1266,140,'牟平区',0),(1267,140,'莱山区',0),(1268,140,'长岛县',0),(1269,140,'龙口市',0),(1270,140,'莱阳市',0),(1271,140,'莱州市',0),(1272,140,'蓬莱市',0),(1273,140,'招远市',0),(1274,140,'栖霞市',0),(1275,140,'海阳市',0),(1276,141,'潍城区',0),(1277,141,'寒亭区',0),(1278,141,'坊子区',0),(1279,141,'奎文区',0),(1280,141,'临朐县',0),(1281,141,'昌乐县',0),(1282,141,'青州市',0),(1283,141,'诸城市',0),(1284,141,'寿光市',0),(1285,141,'安丘市',0),(1286,141,'高密市',0),(1287,141,'昌邑市',0),(1288,142,'市中区',0),(1289,142,'任城区',0),(1290,142,'微山县',0),(1291,142,'鱼台县',0),(1292,142,'金乡县',0),(1293,142,'嘉祥县',0),(1294,142,'汶上县',0),(1295,142,'泗水县',0),(1296,142,'梁山县',0),(1297,142,'曲阜市',0),(1298,142,'兖州市',0),(1299,142,'邹城市',0),(1300,143,'泰山区',0),(1301,143,'岱岳区',0),(1302,143,'宁阳县',0),(1303,143,'东平县',0),(1304,143,'新泰市',0),(1305,143,'肥城市',0),(1306,144,'环翠区',0),(1307,144,'文登市',0),(1308,144,'荣成市',0),(1309,144,'乳山市',0),(1310,145,'东港区',0),(1311,145,'岚山区',0),(1312,145,'五莲县',0),(1313,145,'莒县',0),(1314,146,'莱城区',0),(1315,146,'钢城区',0),(1316,147,'兰山区',0),(1317,147,'罗庄区',0),(1318,147,'河东区',0),(1319,147,'沂南县',0),(1320,147,'郯城县',0),(1321,147,'沂水县',0),(1322,147,'苍山县',0),(1323,147,'费县',0),(1324,147,'平邑县',0),(1325,147,'莒南县',0),(1326,147,'蒙阴县',0),(1327,147,'临沭县',0),(1328,148,'德城区',0),(1329,148,'陵县',0),(1330,148,'宁津县',0),(1331,148,'庆云县',0),(1332,148,'临邑县',0),(1333,148,'齐河县',0),(1334,148,'平原县',0),(1335,148,'夏津县',0),(1336,148,'武城县',0),(1337,148,'乐陵市',0),(1338,148,'禹城市',0),(1339,149,'东昌府区',0),(1340,149,'阳谷县',0),(1341,149,'莘县',0),(1342,149,'茌平县',0),(1343,149,'东阿县',0),(1344,149,'冠县',0),(1345,149,'高唐县',0),(1346,149,'临清市',0),(1347,150,'滨城区',0),(1348,150,'惠民县',0),(1349,150,'阳信县',0),(1350,150,'无棣县',0),(1351,150,'沾化县',0),(1352,150,'博兴县',0),(1353,150,'邹平县',0),(1354,151,'牡丹区',0),(1355,151,'曹县',0),(1356,151,'单县',0),(1357,151,'成武县',0),(1358,151,'巨野县',0),(1359,151,'郓城县',0),(1360,151,'鄄城县',0),(1361,151,'定陶县',0),(1362,151,'东明县',0),(1363,152,'中原区',0),(1364,152,'二七区',0),(1365,152,'管城回族区',0),(1366,152,'金水区',0),(1367,152,'上街区',0),(1368,152,'惠济区',0),(1369,152,'中牟县',0),(1370,152,'巩义市',0),(1371,152,'荥阳市',0),(1372,152,'新密市',0),(1373,152,'新郑市',0),(1374,152,'登封市',0),(1375,153,'龙亭区',0),(1376,153,'顺河回族区',0),(1377,153,'鼓楼区',0),(1378,153,'南关区',0),(1379,153,'郊区',0),(1380,153,'杞县',0),(1381,153,'通许县',0),(1382,153,'尉氏县',0),(1383,153,'开封县',0),(1384,153,'兰考县',0),(1385,154,'老城区',0),(1386,154,'西工区',0),(1387,154,'廛河回族区',0),(1388,154,'涧西区',0),(1389,154,'吉利区',0),(1390,154,'洛龙区',0),(1391,154,'孟津县',0),(1392,154,'新安县',0),(1393,154,'栾川县',0),(1394,154,'嵩县',0),(1395,154,'汝阳县',0),(1396,154,'宜阳县',0),(1397,154,'洛宁县',0),(1398,154,'伊川县',0),(1399,154,'偃师市',0),(1400,155,'新华区',0),(1401,155,'卫东区',0),(1402,155,'石龙区',0),(1403,155,'湛河区',0),(1404,155,'宝丰县',0),(1405,155,'叶县',0),(1406,155,'鲁山县',0),(1407,155,'郏县',0),(1408,155,'舞钢市',0),(1409,155,'汝州市',0),(1410,156,'文峰区',0),(1411,156,'北关区',0),(1412,156,'殷都区',0),(1413,156,'龙安区',0),(1414,156,'安阳县',0),(1415,156,'汤阴县',0),(1416,156,'滑县',0),(1417,156,'内黄县',0),(1418,156,'林州市',0),(1419,157,'鹤山区',0),(1420,157,'山城区',0),(1421,157,'淇滨区',0),(1422,157,'浚县',0),(1423,157,'淇县',0),(1424,158,'红旗区',0),(1425,158,'卫滨区',0),(1426,158,'凤泉区',0),(1427,158,'牧野区',0),(1428,158,'新乡县',0),(1429,158,'获嘉县',0),(1430,158,'原阳县',0),(1431,158,'延津县',0),(1432,158,'封丘县',0),(1433,158,'长垣县',0),(1434,158,'卫辉市',0),(1435,158,'辉县市',0),(1436,159,'解放区',0),(1437,159,'中站区',0),(1438,159,'马村区',0),(1439,159,'山阳区',0),(1440,159,'修武县',0),(1441,159,'博爱县',0),(1442,159,'武陟县',0),(1443,159,'温县',0),(1444,159,'济源市',0),(1445,159,'沁阳市',0),(1446,159,'孟州市',0),(1447,160,'华龙区',0),(1448,160,'清丰县',0),(1449,160,'南乐县',0),(1450,160,'范县',0),(1451,160,'台前县',0),(1452,160,'濮阳县',0),(1453,161,'魏都区',0),(1454,161,'许昌县',0),(1455,161,'鄢陵县',0),(1456,161,'襄城县',0),(1457,161,'禹州市',0),(1458,161,'长葛市',0),(1459,162,'源汇区',0),(1460,162,'郾城区',0),(1461,162,'召陵区',0),(1462,162,'舞阳县',0),(1463,162,'临颍县',0),(1464,163,'市辖区',0),(1465,163,'湖滨区',0),(1466,163,'渑池县',0),(1467,163,'陕县',0),(1468,163,'卢氏县',0),(1469,163,'义马市',0),(1470,163,'灵宝市',0),(1471,164,'宛城区',0),(1472,164,'卧龙区',0),(1473,164,'南召县',0),(1474,164,'方城县',0),(1475,164,'西峡县',0),(1476,164,'镇平县',0),(1477,164,'内乡县',0),(1478,164,'淅川县',0),(1479,164,'社旗县',0),(1480,164,'唐河县',0),(1481,164,'新野县',0),(1482,164,'桐柏县',0),(1483,164,'邓州市',0),(1484,165,'梁园区',0),(1485,165,'睢阳区',0),(1486,165,'民权县',0),(1487,165,'睢县',0),(1488,165,'宁陵县',0),(1489,165,'柘城县',0),(1490,165,'虞城县',0),(1491,165,'夏邑县',0),(1492,165,'永城市',0),(1493,166,'浉河区',0),(1494,166,'平桥区',0),(1495,166,'罗山县',0),(1496,166,'光山县',0),(1497,166,'新县',0),(1498,166,'商城县',0),(1499,166,'固始县',0),(1500,166,'潢川县',0),(1501,166,'淮滨县',0),(1502,166,'息县',0),(1503,167,'川汇区',0),(1504,167,'扶沟县',0),(1505,167,'西华县',0),(1506,167,'商水县',0),(1507,167,'沈丘县',0),(1508,167,'郸城县',0),(1509,167,'淮阳县',0),(1510,167,'太康县',0),(1511,167,'鹿邑县',0),(1512,167,'项城市',0),(1513,168,'驿城区',0),(1514,168,'西平县',0),(1515,168,'上蔡县',0),(1516,168,'平舆县',0),(1517,168,'正阳县',0),(1518,168,'确山县',0),(1519,168,'泌阳县',0),(1520,168,'汝南县',0),(1521,168,'遂平县',0),(1522,168,'新蔡县',0),(1523,169,'江岸区',0),(1524,169,'江汉区',0),(1525,169,'硚口区',0),(1526,169,'汉阳区',0),(1527,169,'武昌区',0),(1528,169,'青山区',0),(1529,169,'洪山区',0),(1530,169,'东西湖区',0),(1531,169,'汉南区',0),(1532,169,'蔡甸区',0),(1533,169,'江夏区',0),(1534,169,'黄陂区',0),(1535,169,'新洲区',0),(1536,170,'黄石港区',0),(1537,170,'西塞山区',0),(1538,170,'下陆区',0),(1539,170,'铁山区',0),(1540,170,'阳新县',0),(1541,170,'大冶市',0),(1542,171,'茅箭区',0),(1543,171,'张湾区',0),(1544,171,'郧县',0),(1545,171,'郧西县',0),(1546,171,'竹山县',0),(1547,171,'竹溪县',0),(1548,171,'房县',0),(1549,171,'丹江口市',0),(1550,172,'西陵区',0),(1551,172,'伍家岗区',0),(1552,172,'点军区',0),(1553,172,'猇亭区',0),(1554,172,'夷陵区',0),(1555,172,'远安县',0),(1556,172,'兴山县',0),(1557,172,'秭归县',0),(1558,172,'长阳土家族自治县',0),(1559,172,'五峰土家族自治县',0),(1560,172,'宜都市',0),(1561,172,'当阳市',0),(1562,172,'枝江市',0),(1563,173,'襄城区',0),(1564,173,'樊城区',0),(1565,173,'襄阳区',0),(1566,173,'南漳县',0),(1567,173,'谷城县',0),(1568,173,'保康县',0),(1569,173,'老河口市',0),(1570,173,'枣阳市',0),(1571,173,'宜城市',0),(1572,174,'梁子湖区',0),(1573,174,'华容区',0),(1574,174,'鄂城区',0),(1575,175,'东宝区',0),(1576,175,'掇刀区',0),(1577,175,'京山县',0),(1578,175,'沙洋县',0),(1579,175,'钟祥市',0),(1580,176,'孝南区',0),(1581,176,'孝昌县',0),(1582,176,'大悟县',0),(1583,176,'云梦县',0),(1584,176,'应城市',0),(1585,176,'安陆市',0),(1586,176,'汉川市',0),(1587,177,'沙市区',0),(1588,177,'荆州区',0),(1589,177,'公安县',0),(1590,177,'监利县',0),(1591,177,'江陵县',0),(1592,177,'石首市',0),(1593,177,'洪湖市',0),(1594,177,'松滋市',0),(1595,178,'黄州区',0),(1596,178,'团风县',0),(1597,178,'红安县',0),(1598,178,'罗田县',0),(1599,178,'英山县',0),(1600,178,'浠水县',0),(1601,178,'蕲春县',0),(1602,178,'黄梅县',0),(1603,178,'麻城市',0),(1604,178,'武穴市',0),(1605,179,'咸安区',0),(1606,179,'嘉鱼县',0),(1607,179,'通城县',0),(1608,179,'崇阳县',0),(1609,179,'通山县',0),(1610,179,'赤壁市',0),(1611,180,'曾都区',0),(1612,180,'广水市',0),(1613,181,'恩施市',0),(1614,181,'利川市',0),(1615,181,'建始县',0),(1616,181,'巴东县',0),(1617,181,'宣恩县',0),(1618,181,'咸丰县',0),(1619,181,'来凤县',0),(1620,181,'鹤峰县',0),(1621,182,'仙桃市',0),(1622,182,'潜江市',0),(1623,182,'天门市',0),(1624,182,'神农架林区',0),(1625,183,'芙蓉区',0),(1626,183,'天心区',0),(1627,183,'岳麓区',0),(1628,183,'开福区',0),(1629,183,'雨花区',0),(1630,183,'长沙县',0),(1631,183,'望城县',0),(1632,183,'宁乡县',0),(1633,183,'浏阳市',0),(1634,184,'荷塘区',0),(1635,184,'芦淞区',0),(1636,184,'石峰区',0),(1637,184,'天元区',0),(1638,184,'株洲县',0),(1639,184,'攸县',0),(1640,184,'茶陵县',0),(1641,184,'炎陵县',0),(1642,184,'醴陵市',0),(1643,185,'雨湖区',0),(1644,185,'岳塘区',0),(1645,185,'湘潭县',0),(1646,185,'湘乡市',0),(1647,185,'韶山市',0),(1648,186,'珠晖区',0),(1649,186,'雁峰区',0),(1650,186,'石鼓区',0),(1651,186,'蒸湘区',0),(1652,186,'南岳区',0),(1653,186,'衡阳县',0),(1654,186,'衡南县',0),(1655,186,'衡山县',0),(1656,186,'衡东县',0),(1657,186,'祁东县',0),(1658,186,'耒阳市',0),(1659,186,'常宁市',0),(1660,187,'双清区',0),(1661,187,'大祥区',0),(1662,187,'北塔区',0),(1663,187,'邵东县',0),(1664,187,'新邵县',0),(1665,187,'邵阳县',0),(1666,187,'隆回县',0),(1667,187,'洞口县',0),(1668,187,'绥宁县',0),(1669,187,'新宁县',0),(1670,187,'城步苗族自治县',0),(1671,187,'武冈市',0),(1672,188,'岳阳楼区',0),(1673,188,'云溪区',0),(1674,188,'君山区',0),(1675,188,'岳阳县',0),(1676,188,'华容县',0),(1677,188,'湘阴县',0),(1678,188,'平江县',0),(1679,188,'汨罗市',0),(1680,188,'临湘市',0),(1681,189,'武陵区',0),(1682,189,'鼎城区',0),(1683,189,'安乡县',0),(1684,189,'汉寿县',0),(1685,189,'澧县',0),(1686,189,'临澧县',0),(1687,189,'桃源县',0),(1688,189,'石门县',0),(1689,189,'津市市',0),(1690,190,'永定区',0),(1691,190,'武陵源区',0),(1692,190,'慈利县',0),(1693,190,'桑植县',0),(1694,191,'资阳区',0),(1695,191,'赫山区',0),(1696,191,'南县',0),(1697,191,'桃江县',0),(1698,191,'安化县',0),(1699,191,'沅江市',0),(1700,192,'北湖区',0),(1701,192,'苏仙区',0),(1702,192,'桂阳县',0),(1703,192,'宜章县',0),(1704,192,'永兴县',0),(1705,192,'嘉禾县',0),(1706,192,'临武县',0),(1707,192,'汝城县',0),(1708,192,'桂东县',0),(1709,192,'安仁县',0),(1710,192,'资兴市',0),(1711,193,'芝山区',0),(1712,193,'冷水滩区',0),(1713,193,'祁阳县',0),(1714,193,'东安县',0),(1715,193,'双牌县',0),(1716,193,'道县',0),(1717,193,'江永县',0),(1718,193,'宁远县',0),(1719,193,'蓝山县',0),(1720,193,'新田县',0),(1721,193,'江华瑶族自治县',0),(1722,194,'鹤城区',0),(1723,194,'中方县',0),(1724,194,'沅陵县',0),(1725,194,'辰溪县',0),(1726,194,'溆浦县',0),(1727,194,'会同县',0),(1728,194,'麻阳苗族自治县',0),(1729,194,'新晃侗族自治县',0),(1730,194,'芷江侗族自治县',0),(1731,194,'靖州苗族侗族自治县',0),(1732,194,'通道侗族自治县',0),(1733,194,'洪江市',0),(1734,195,'娄星区',0),(1735,195,'双峰县',0),(1736,195,'新化县',0),(1737,195,'冷水江市',0),(1738,195,'涟源市',0),(1739,196,'吉首市',0),(1740,196,'泸溪县',0),(1741,196,'凤凰县',0),(1742,196,'花垣县',0),(1743,196,'保靖县',0),(1744,196,'古丈县',0),(1745,196,'永顺县',0),(1746,196,'龙山县',0),(1747,197,'东山区',0),(1748,197,'荔湾区',0),(1749,197,'越秀区',0),(1751,197,'天河区',0),(1752,197,'芳村区',0),(1753,197,'白云区',0),(1754,197,'黄埔区',0),(1755,197,'番禺区',0),(1756,197,'花都区',0),(1757,197,'增城市',0),(1759,198,'武江区',0),(1760,198,'浈江区',0),(1761,198,'曲江区',0),(1762,198,'始兴县',0),(1763,198,'仁化县',0),(1764,198,'翁源县',0),(1765,198,'乳源瑶族自治县',0),(1766,198,'新丰县',0),(1767,198,'乐昌市',0),(1768,198,'南雄市',0),(1769,199,'罗湖区',0),(1770,199,'福田区',0),(1771,199,'南山区',0),(1772,199,'宝安区',0),(1773,199,'龙岗区',0),(1774,199,'盐田区',0),(1775,200,'香洲区',0),(1776,200,'斗门区',0),(1777,200,'金湾区',0),(1778,201,'龙湖区',0),(1779,201,'金平区',0),(1780,201,'濠江区',0),(1781,201,'潮阳区',0),(1782,201,'潮南区',0),(1783,201,'澄海区',0),(1784,201,'南澳县',0),(1785,202,'禅城区',0),(1786,202,'南海区',0),(1787,202,'顺德区',0),(1788,202,'三水区',0),(1789,202,'高明区',0),(1790,203,'蓬江区',0),(1791,203,'江海区',0),(1792,203,'新会区',0),(1793,203,'台山市',0),(1794,203,'开平市',0),(1795,203,'鹤山市',0),(1796,203,'恩平市',0),(1797,204,'赤坎区',0),(1798,204,'霞山区',0),(1799,204,'坡头区',0),(1800,204,'麻章区',0),(1801,204,'遂溪县',0),(1802,204,'徐闻县',0),(1803,204,'廉江市',0),(1804,204,'雷州市',0),(1805,204,'吴川市',0),(1806,205,'茂南区',0),(1807,205,'茂港区',0),(1808,205,'电白县',0),(1809,205,'高州市',0),(1810,205,'化州市',0),(1811,205,'信宜市',0),(1812,206,'端州区',0),(1813,206,'鼎湖区',0),(1814,206,'广宁县',0),(1815,206,'怀集县',0),(1816,206,'封开县',0),(1817,206,'德庆县',0),(1818,206,'高要市',0),(1819,206,'四会市',0),(1820,207,'惠城区',0),(1821,207,'惠阳区',0),(1822,207,'博罗县',0),(1823,207,'惠东县',0),(1824,207,'龙门县',0),(1825,208,'梅江区',0),(1826,208,'梅县',0),(1827,208,'大埔县',0),(1828,208,'丰顺县',0),(1829,208,'五华县',0),(1830,208,'平远县',0),(1831,208,'蕉岭县',0),(1832,208,'兴宁市',0),(1833,209,'城区',0),(1834,209,'海丰县',0),(1835,209,'陆河县',0),(1836,209,'陆丰市',0),(1837,210,'源城区',0),(1838,210,'紫金县',0),(1839,210,'龙川县',0),(1840,210,'连平县',0),(1841,210,'和平县',0),(1842,210,'东源县',0),(1843,211,'江城区',0),(1844,211,'阳西县',0),(1845,211,'阳东县',0),(1846,211,'阳春市',0),(1847,212,'清城区',0),(1848,212,'佛冈县',0),(1849,212,'阳山县',0),(1850,212,'连山壮族瑶族自治县',0),(1851,212,'连南瑶族自治县',0),(1852,212,'清新县',0),(1853,212,'英德市',0),(1854,212,'连州市',0),(1855,215,'湘桥区',0),(1856,215,'潮安县',0),(1857,215,'饶平县',0),(1858,216,'榕城区',0),(1859,216,'揭东县',0),(1860,216,'揭西县',0),(1861,216,'惠来县',0),(1862,216,'普宁市',0),(1863,217,'云城区',0),(1864,217,'新兴县',0),(1865,217,'郁南县',0),(1866,217,'云安县',0),(1867,217,'罗定市',0),(1868,218,'兴宁区',0),(1869,218,'青秀区',0),(1870,218,'江南区',0),(1871,218,'西乡塘区',0),(1872,218,'良庆区',0),(1873,218,'邕宁区',0),(1874,218,'武鸣县',0),(1875,218,'隆安县',0),(1876,218,'马山县',0),(1877,218,'上林县',0),(1878,218,'宾阳县',0),(1879,218,'横县',0),(1880,219,'城中区',0),(1881,219,'鱼峰区',0),(1882,219,'柳南区',0),(1883,219,'柳北区',0),(1884,219,'柳江县',0),(1885,219,'柳城县',0),(1886,219,'鹿寨县',0),(1887,219,'融安县',0),(1888,219,'融水苗族自治县',0),(1889,219,'三江侗族自治县',0),(1890,220,'秀峰区',0),(1891,220,'叠彩区',0),(1892,220,'象山区',0),(1893,220,'七星区',0),(1894,220,'雁山区',0),(1895,220,'阳朔县',0),(1896,220,'临桂县',0),(1897,220,'灵川县',0),(1898,220,'全州县',0),(1899,220,'兴安县',0),(1900,220,'永福县',0),(1901,220,'灌阳县',0),(1902,220,'龙胜各族自治县',0),(1903,220,'资源县',0),(1904,220,'平乐县',0),(1905,220,'荔蒲县',0),(1906,220,'恭城瑶族自治县',0),(1907,221,'万秀区',0),(1908,221,'蝶山区',0),(1909,221,'长洲区',0),(1910,221,'苍梧县',0),(1911,221,'藤县',0),(1912,221,'蒙山县',0),(1913,221,'岑溪市',0),(1914,222,'海城区',0),(1915,222,'银海区',0),(1916,222,'铁山港区',0),(1917,222,'合浦县',0),(1918,223,'港口区',0),(1919,223,'防城区',0),(1920,223,'上思县',0),(1921,223,'东兴市',0),(1922,224,'钦南区',0),(1923,224,'钦北区',0),(1924,224,'灵山县',0),(1925,224,'浦北县',0),(1926,225,'港北区',0),(1927,225,'港南区',0),(1928,225,'覃塘区',0),(1929,225,'平南县',0),(1930,225,'桂平市',0),(1931,226,'玉州区',0),(1932,226,'容县',0),(1933,226,'陆川县',0),(1934,226,'博白县',0),(1935,226,'兴业县',0),(1936,226,'北流市',0),(1937,227,'右江区',0),(1938,227,'田阳县',0),(1939,227,'田东县',0),(1940,227,'平果县',0),(1941,227,'德保县',0),(1942,227,'靖西县',0),(1943,227,'那坡县',0),(1944,227,'凌云县',0),(1945,227,'乐业县',0),(1946,227,'田林县',0),(1947,227,'西林县',0),(1948,227,'隆林各族自治县',0),(1949,228,'八步区',0),(1950,228,'昭平县',0),(1951,228,'钟山县',0),(1952,228,'富川瑶族自治县',0),(1953,229,'金城江区',0),(1954,229,'南丹县',0),(1955,229,'天峨县',0),(1956,229,'凤山县',0),(1957,229,'东兰县',0),(1958,229,'罗城仫佬族自治县',0),(1959,229,'环江毛南族自治县',0),(1960,229,'巴马瑶族自治县',0),(1961,229,'都安瑶族自治县',0),(1962,229,'大化瑶族自治县',0),(1963,229,'宜州市',0),(1964,230,'兴宾区',0),(1965,230,'忻城县',0),(1966,230,'象州县',0),(1967,230,'武宣县',0),(1968,230,'金秀瑶族自治县',0),(1969,230,'合山市',0),(1970,231,'江洲区',0),(1971,231,'扶绥县',0),(1972,231,'宁明县',0),(1973,231,'龙州县',0),(1974,231,'大新县',0),(1975,231,'天等县',0),(1976,231,'凭祥市',0),(1977,232,'秀英区',0),(1978,232,'龙华区',0),(1979,232,'琼山区',0),(1980,232,'美兰区',0),(1981,233,'五指山市',0),(1982,233,'琼海市',0),(1983,233,'儋州市',0),(1984,233,'文昌市',0),(1985,233,'万宁市',0),(1986,233,'东方市',0),(1987,233,'定安县',0),(1988,233,'屯昌县',0),(1989,233,'澄迈县',0),(1990,233,'临高县',0),(1991,233,'白沙黎族自治县',0),(1992,233,'昌江黎族自治县',0),(1993,233,'乐东黎族自治县',0),(1994,233,'陵水黎族自治县',0),(1995,233,'保亭黎族苗族自治县',0),(1996,233,'琼中黎族苗族自治县',0),(1997,233,'西沙群岛',0),(1998,233,'南沙群岛',0),(1999,233,'中沙群岛的岛礁及其海域',0),(2000,234,'万州区',0),(2001,234,'涪陵区',0),(2002,234,'渝中区',0),(2003,234,'大渡口区',0),(2004,234,'江北区',0),(2005,234,'沙坪坝区',0),(2006,234,'九龙坡区',0),(2007,234,'南岸区',0),(2008,234,'北碚区',0),(2009,234,'万盛区',0),(2010,234,'双桥区',0),(2011,234,'渝北区',0),(2012,234,'巴南区',0),(2013,234,'黔江区',0),(2014,234,'长寿区',0),(2015,234,'綦江县',0),(2016,234,'潼南县',0),(2017,234,'铜梁县',0),(2018,234,'大足县',0),(2019,234,'荣昌县',0),(2020,234,'璧山县',0),(2021,234,'梁平县',0),(2022,234,'城口县',0),(2023,234,'丰都县',0),(2024,234,'垫江县',0),(2025,234,'武隆县',0),(2026,234,'忠县',0),(2027,234,'开县',0),(2028,234,'云阳县',0),(2029,234,'奉节县',0),(2030,234,'巫山县',0),(2031,234,'巫溪县',0),(2032,234,'石柱土家族自治县',0),(2033,234,'秀山土家族苗族自治县',0),(2034,234,'酉阳土家族苗族自治县',0),(2035,234,'彭水苗族土家族自治县',0),(2036,234,'江津市',0),(2037,234,'合川市',0),(2038,234,'永川市',0),(2039,234,'南川市',0),(2040,235,'锦江区',0),(2041,235,'青羊区',0),(2042,235,'金牛区',0),(2043,235,'武侯区',0),(2044,235,'成华区',0),(2045,235,'龙泉驿区',0),(2046,235,'青白江区',0),(2047,235,'新都区',0),(2048,235,'温江区',0),(2049,235,'金堂县',0),(2050,235,'双流县',0),(2051,235,'郫县',0),(2052,235,'大邑县',0),(2053,235,'蒲江县',0),(2054,235,'新津县',0),(2055,235,'都江堰市',0),(2056,235,'彭州市',0),(2057,235,'邛崃市',0),(2058,235,'崇州市',0),(2059,236,'自流井区',0),(2060,236,'贡井区',0),(2061,236,'大安区',0),(2062,236,'沿滩区',0),(2063,236,'荣县',0),(2064,236,'富顺县',0),(2065,237,'东区',0),(2066,237,'西区',0),(2067,237,'仁和区',0),(2068,237,'米易县',0),(2069,237,'盐边县',0),(2070,238,'江阳区',0),(2071,238,'纳溪区',0),(2072,238,'龙马潭区',0),(2073,238,'泸县',0),(2074,238,'合江县',0),(2075,238,'叙永县',0),(2076,238,'古蔺县',0),(2077,239,'旌阳区',0),(2078,239,'中江县',0),(2079,239,'罗江县',0),(2080,239,'广汉市',0),(2081,239,'什邡市',0),(2082,239,'绵竹市',0),(2083,240,'涪城区',0),(2084,240,'游仙区',0),(2085,240,'三台县',0),(2086,240,'盐亭县',0),(2087,240,'安县',0),(2088,240,'梓潼县',0),(2089,240,'北川羌族自治县',0),(2090,240,'平武县',0),(2091,240,'江油市',0),(2092,241,'市中区',0),(2093,241,'元坝区',0),(2094,241,'朝天区',0),(2095,241,'旺苍县',0),(2096,241,'青川县',0),(2097,241,'剑阁县',0),(2098,241,'苍溪县',0),(2099,242,'船山区',0),(2100,242,'安居区',0),(2101,242,'蓬溪县',0),(2102,242,'射洪县',0),(2103,242,'大英县',0),(2104,243,'市中区',0),(2105,243,'东兴区',0),(2106,243,'威远县',0),(2107,243,'资中县',0),(2108,243,'隆昌县',0),(2109,244,'市中区',0),(2110,244,'沙湾区',0),(2111,244,'五通桥区',0),(2112,244,'金口河区',0),(2113,244,'犍为县',0),(2114,244,'井研县',0),(2115,244,'夹江县',0),(2116,244,'沐川县',0),(2117,244,'峨边彝族自治县',0),(2118,244,'马边彝族自治县',0),(2119,244,'峨眉山市',0),(2120,245,'顺庆区',0),(2121,245,'高坪区',0),(2122,245,'嘉陵区',0),(2123,245,'南部县',0),(2124,245,'营山县',0),(2125,245,'蓬安县',0),(2126,245,'仪陇县',0),(2127,245,'西充县',0),(2128,245,'阆中市',0),(2129,246,'东坡区',0),(2130,246,'仁寿县',0),(2131,246,'彭山县',0),(2132,246,'洪雅县',0),(2133,246,'丹棱县',0),(2134,246,'青神县',0),(2135,247,'翠屏区',0),(2136,247,'宜宾县',0),(2137,247,'南溪县',0),(2138,247,'江安县',0),(2139,247,'长宁县',0),(2140,247,'高县',0),(2141,247,'珙县',0),(2142,247,'筠连县',0),(2143,247,'兴文县',0),(2144,247,'屏山县',0),(2145,248,'广安区',0),(2146,248,'岳池县',0),(2147,248,'武胜县',0),(2148,248,'邻水县',0),(2149,248,'华蓥市',0),(2150,249,'通川区',0),(2151,249,'达县',0),(2152,249,'宣汉县',0),(2153,249,'开江县',0),(2154,249,'大竹县',0),(2155,249,'渠县',0),(2156,249,'万源市',0),(2157,250,'雨城区',0),(2158,250,'名山县',0),(2159,250,'荥经县',0),(2160,250,'汉源县',0),(2161,250,'石棉县',0),(2162,250,'天全县',0),(2163,250,'芦山县',0),(2164,250,'宝兴县',0),(2165,251,'巴州区',0),(2166,251,'通江县',0),(2167,251,'南江县',0),(2168,251,'平昌县',0),(2169,252,'雁江区',0),(2170,252,'安岳县',0),(2171,252,'乐至县',0),(2172,252,'简阳市',0),(2173,253,'汶川县',0),(2174,253,'理县',0),(2175,253,'茂县',0),(2176,253,'松潘县',0),(2177,253,'九寨沟县',0),(2178,253,'金川县',0),(2179,253,'小金县',0),(2180,253,'黑水县',0),(2181,253,'马尔康县',0),(2182,253,'壤塘县',0),(2183,253,'阿坝县',0),(2184,253,'若尔盖县',0),(2185,253,'红原县',0),(2186,254,'康定县',0),(2187,254,'泸定县',0),(2188,254,'丹巴县',0),(2189,254,'九龙县',0),(2190,254,'雅江县',0),(2191,254,'道孚县',0),(2192,254,'炉霍县',0),(2193,254,'甘孜县',0),(2194,254,'新龙县',0),(2195,254,'德格县',0),(2196,254,'白玉县',0),(2197,254,'石渠县',0),(2198,254,'色达县',0),(2199,254,'理塘县',0),(2200,254,'巴塘县',0),(2201,254,'乡城县',0),(2202,254,'稻城县',0),(2203,254,'得荣县',0),(2204,255,'西昌市',0),(2205,255,'木里藏族自治县',0),(2206,255,'盐源县',0),(2207,255,'德昌县',0),(2208,255,'会理县',0),(2209,255,'会东县',0),(2210,255,'宁南县',0),(2211,255,'普格县',0),(2212,255,'布拖县',0),(2213,255,'金阳县',0),(2214,255,'昭觉县',0),(2215,255,'喜德县',0),(2216,255,'冕宁县',0),(2217,255,'越西县',0),(2218,255,'甘洛县',0),(2219,255,'美姑县',0),(2220,255,'雷波县',0),(2221,256,'南明区',0),(2222,256,'云岩区',0),(2223,256,'花溪区',0),(2224,256,'乌当区',0),(2225,256,'白云区',0),(2226,256,'小河区',0),(2227,256,'开阳县',0),(2228,256,'息烽县',0),(2229,256,'修文县',0),(2230,256,'清镇市',0),(2231,257,'钟山区',0),(2232,257,'六枝特区',0),(2233,257,'水城县',0),(2234,257,'盘县',0),(2235,258,'红花岗区',0),(2236,258,'汇川区',0),(2237,258,'遵义县',0),(2238,258,'桐梓县',0),(2239,258,'绥阳县',0),(2240,258,'正安县',0),(2241,258,'道真仡佬族苗族自治县',0),(2242,258,'务川仡佬族苗族自治县',0),(2243,258,'凤冈县',0),(2244,258,'湄潭县',0),(2245,258,'余庆县',0),(2246,258,'习水县',0),(2247,258,'赤水市',0),(2248,258,'仁怀市',0),(2249,259,'西秀区',0),(2250,259,'平坝县',0),(2251,259,'普定县',0),(2252,259,'镇宁布依族苗族自治县',0),(2253,259,'关岭布依族苗族自治县',0),(2254,259,'紫云苗族布依族自治县',0),(2255,260,'铜仁市',0),(2256,260,'江口县',0),(2257,260,'玉屏侗族自治县',0),(2258,260,'石阡县',0),(2259,260,'思南县',0),(2260,260,'印江土家族苗族自治县',0),(2261,260,'德江县',0),(2262,260,'沿河土家族自治县',0),(2263,260,'松桃苗族自治县',0),(2264,260,'万山特区',0),(2265,261,'兴义市',0),(2266,261,'兴仁县',0),(2267,261,'普安县',0),(2268,261,'晴隆县',0),(2269,261,'贞丰县',0),(2270,261,'望谟县',0),(2271,261,'册亨县',0),(2272,261,'安龙县',0),(2273,262,'毕节市',0),(2274,262,'大方县',0),(2275,262,'黔西县',0),(2276,262,'金沙县',0),(2277,262,'织金县',0),(2278,262,'纳雍县',0),(2279,262,'威宁彝族回族苗族自治县',0),(2280,262,'赫章县',0),(2281,263,'凯里市',0),(2282,263,'黄平县',0),(2283,263,'施秉县',0),(2284,263,'三穗县',0),(2285,263,'镇远县',0),(2286,263,'岑巩县',0),(2287,263,'天柱县',0),(2288,263,'锦屏县',0),(2289,263,'剑河县',0),(2290,263,'台江县',0),(2291,263,'黎平县',0),(2292,263,'榕江县',0),(2293,263,'从江县',0),(2294,263,'雷山县',0),(2295,263,'麻江县',0),(2296,263,'丹寨县',0),(2297,264,'都匀市',0),(2298,264,'福泉市',0),(2299,264,'荔波县',0),(2300,264,'贵定县',0),(2301,264,'瓮安县',0),(2302,264,'独山县',0),(2303,264,'平塘县',0),(2304,264,'罗甸县',0),(2305,264,'长顺县',0),(2306,264,'龙里县',0),(2307,264,'惠水县',0),(2308,264,'三都水族自治县',0),(2309,265,'五华区',0),(2310,265,'盘龙区',0),(2311,265,'官渡区',0),(2312,265,'西山区',0),(2313,265,'东川区',0),(2314,265,'呈贡县',0),(2315,265,'晋宁县',0),(2316,265,'富民县',0),(2317,265,'宜良县',0),(2318,265,'石林彝族自治县',0),(2319,265,'嵩明县',0),(2320,265,'禄劝彝族苗族自治县',0),(2321,265,'寻甸回族彝族自治县',0),(2322,265,'安宁市',0),(2323,266,'麒麟区',0),(2324,266,'马龙县',0),(2325,266,'陆良县',0),(2326,266,'师宗县',0),(2327,266,'罗平县',0),(2328,266,'富源县',0),(2329,266,'会泽县',0),(2330,266,'沾益县',0),(2331,266,'宣威市',0),(2332,267,'红塔区',0),(2333,267,'江川县',0),(2334,267,'澄江县',0),(2335,267,'通海县',0),(2336,267,'华宁县',0),(2337,267,'易门县',0),(2338,267,'峨山彝族自治县',0),(2339,267,'新平彝族傣族自治县',0),(2340,267,'元江哈尼族彝族傣族自治县',0),(2341,268,'隆阳区',0),(2342,268,'施甸县',0),(2343,268,'腾冲县',0),(2344,268,'龙陵县',0),(2345,268,'昌宁县',0),(2346,269,'昭阳区',0),(2347,269,'鲁甸县',0),(2348,269,'巧家县',0),(2349,269,'盐津县',0),(2350,269,'大关县',0),(2351,269,'永善县',0),(2352,269,'绥江县',0),(2353,269,'镇雄县',0),(2354,269,'彝良县',0),(2355,269,'威信县',0),(2356,269,'水富县',0),(2357,270,'古城区',0),(2358,270,'玉龙纳西族自治县',0),(2359,270,'永胜县',0),(2360,270,'华坪县',0),(2361,270,'宁蒗彝族自治县',0),(2362,271,'翠云区',0),(2363,271,'普洱哈尼族彝族自治县',0),(2364,271,'墨江哈尼族自治县',0),(2365,271,'景东彝族自治县',0),(2366,271,'景谷傣族彝族自治县',0),(2367,271,'镇沅彝族哈尼族拉祜族自治县',0),(2368,271,'江城哈尼族彝族自治县',0),(2369,271,'孟连傣族拉祜族佤族自治县',0),(2370,271,'澜沧拉祜族自治县',0),(2371,271,'西盟佤族自治县',0),(2372,272,'临翔区',0),(2373,272,'凤庆县',0),(2374,272,'云县',0),(2375,272,'永德县',0),(2376,272,'镇康县',0),(2377,272,'双江拉祜族佤族布朗族傣族自治县',0),(2378,272,'耿马傣族佤族自治县',0),(2379,272,'沧源佤族自治县',0),(2380,273,'楚雄市',0),(2381,273,'双柏县',0),(2382,273,'牟定县',0),(2383,273,'南华县',0),(2384,273,'姚安县',0),(2385,273,'大姚县',0),(2386,273,'永仁县',0),(2387,273,'元谋县',0),(2388,273,'武定县',0),(2389,273,'禄丰县',0),(2390,274,'个旧市',0),(2391,274,'开远市',0),(2392,274,'蒙自县',0),(2393,274,'屏边苗族自治县',0),(2394,274,'建水县',0),(2395,274,'石屏县',0),(2396,274,'弥勒县',0),(2397,274,'泸西县',0),(2398,274,'元阳县',0),(2399,274,'红河县',0),(2400,274,'金平苗族瑶族傣族自治县',0),(2401,274,'绿春县',0),(2402,274,'河口瑶族自治县',0),(2403,275,'文山县',0),(2404,275,'砚山县',0),(2405,275,'西畴县',0),(2406,275,'麻栗坡县',0),(2407,275,'马关县',0),(2408,275,'丘北县',0),(2409,275,'广南县',0),(2410,275,'富宁县',0),(2411,276,'景洪市',0),(2412,276,'勐海县',0),(2413,276,'勐腊县',0),(2414,277,'大理市',0),(2415,277,'漾濞彝族自治县',0),(2416,277,'祥云县',0),(2417,277,'宾川县',0),(2418,277,'弥渡县',0),(2419,277,'南涧彝族自治县',0),(2420,277,'巍山彝族回族自治县',0),(2421,277,'永平县',0),(2422,277,'云龙县',0),(2423,277,'洱源县',0),(2424,277,'剑川县',0),(2425,277,'鹤庆县',0),(2426,278,'瑞丽市',0),(2427,278,'潞西市',0),(2428,278,'梁河县',0),(2429,278,'盈江县',0),(2430,278,'陇川县',0),(2431,279,'泸水县',0),(2432,279,'福贡县',0),(2433,279,'贡山独龙族怒族自治县',0),(2434,279,'兰坪白族普米族自治县',0),(2435,280,'香格里拉县',0),(2436,280,'德钦县',0),(2437,280,'维西傈僳族自治县',0),(2438,281,'城关区',0),(2439,281,'林周县',0),(2440,281,'当雄县',0),(2441,281,'尼木县',0),(2442,281,'曲水县',0),(2443,281,'堆龙德庆县',0),(2444,281,'达孜县',0),(2445,281,'墨竹工卡县',0),(2446,282,'昌都县',0),(2447,282,'江达县',0),(2448,282,'贡觉县',0),(2449,282,'类乌齐县',0),(2450,282,'丁青县',0),(2451,282,'察雅县',0),(2452,282,'八宿县',0),(2453,282,'左贡县',0),(2454,282,'芒康县',0),(2455,282,'洛隆县',0),(2456,282,'边坝县',0),(2457,283,'乃东县',0),(2458,283,'扎囊县',0),(2459,283,'贡嘎县',0),(2460,283,'桑日县',0),(2461,283,'琼结县',0),(2462,283,'曲松县',0),(2463,283,'措美县',0),(2464,283,'洛扎县',0),(2465,283,'加查县',0),(2466,283,'隆子县',0),(2467,283,'错那县',0),(2468,283,'浪卡子县',0),(2469,284,'日喀则市',0),(2470,284,'南木林县',0),(2471,284,'江孜县',0),(2472,284,'定日县',0),(2473,284,'萨迦县',0),(2474,284,'拉孜县',0),(2475,284,'昂仁县',0),(2476,284,'谢通门县',0),(2477,284,'白朗县',0),(2478,284,'仁布县',0),(2479,284,'康马县',0),(2480,284,'定结县',0),(2481,284,'仲巴县',0),(2482,284,'亚东县',0),(2483,284,'吉隆县',0),(2484,284,'聂拉木县',0),(2485,284,'萨嘎县',0),(2486,284,'岗巴县',0),(2487,285,'那曲县',0),(2488,285,'嘉黎县',0),(2489,285,'比如县',0),(2490,285,'聂荣县',0),(2491,285,'安多县',0),(2492,285,'申扎县',0),(2493,285,'索县',0),(2494,285,'班戈县',0),(2495,285,'巴青县',0),(2496,285,'尼玛县',0),(2497,286,'普兰县',0),(2498,286,'札达县',0),(2499,286,'噶尔县',0),(2500,286,'日土县',0),(2501,286,'革吉县',0),(2502,286,'改则县',0),(2503,286,'措勤县',0),(2504,287,'林芝县',0),(2505,287,'工布江达县',0),(2506,287,'米林县',0),(2507,287,'墨脱县',0),(2508,287,'波密县',0),(2509,287,'察隅县',0),(2510,287,'朗县',0),(2511,288,'新城区',0),(2512,288,'碑林区',0),(2513,288,'莲湖区',0),(2514,288,'灞桥区',0),(2515,288,'未央区',0),(2516,288,'雁塔区',0),(2517,288,'阎良区',0),(2518,288,'临潼区',0),(2519,288,'长安区',0),(2520,288,'蓝田县',0),(2521,288,'周至县',0),(2522,288,'户县',0),(2523,288,'高陵县',0),(2524,289,'王益区',0),(2525,289,'印台区',0),(2526,289,'耀州区',0),(2527,289,'宜君县',0),(2528,290,'渭滨区',0),(2529,290,'金台区',0),(2530,290,'陈仓区',0),(2531,290,'凤翔县',0),(2532,290,'岐山县',0),(2533,290,'扶风县',0),(2534,290,'眉县',0),(2535,290,'陇县',0),(2536,290,'千阳县',0),(2537,290,'麟游县',0),(2538,290,'凤县',0),(2539,290,'太白县',0),(2540,291,'秦都区',0),(2541,291,'杨凌区',0),(2542,291,'渭城区',0),(2543,291,'三原县',0),(2544,291,'泾阳县',0),(2545,291,'乾县',0),(2546,291,'礼泉县',0),(2547,291,'永寿县',0),(2548,291,'彬县',0),(2549,291,'长武县',0),(2550,291,'旬邑县',0),(2551,291,'淳化县',0),(2552,291,'武功县',0),(2553,291,'兴平市',0),(2554,292,'临渭区',0),(2555,292,'华县',0),(2556,292,'潼关县',0),(2557,292,'大荔县',0),(2558,292,'合阳县',0),(2559,292,'澄城县',0),(2560,292,'蒲城县',0),(2561,292,'白水县',0),(2562,292,'富平县',0),(2563,292,'韩城市',0),(2564,292,'华阴市',0),(2565,293,'宝塔区',0),(2566,293,'延长县',0),(2567,293,'延川县',0),(2568,293,'子长县',0),(2569,293,'安塞县',0),(2570,293,'志丹县',0),(2571,293,'吴旗县',0),(2572,293,'甘泉县',0),(2573,293,'富县',0),(2574,293,'洛川县',0),(2575,293,'宜川县',0),(2576,293,'黄龙县',0),(2577,293,'黄陵县',0),(2578,294,'汉台区',0),(2579,294,'南郑县',0),(2580,294,'城固县',0),(2581,294,'洋县',0),(2582,294,'西乡县',0),(2583,294,'勉县',0),(2584,294,'宁强县',0),(2585,294,'略阳县',0),(2586,294,'镇巴县',0),(2587,294,'留坝县',0),(2588,294,'佛坪县',0),(2589,295,'榆阳区',0),(2590,295,'神木县',0),(2591,295,'府谷县',0),(2592,295,'横山县',0),(2593,295,'靖边县',0),(2594,295,'定边县',0),(2595,295,'绥德县',0),(2596,295,'米脂县',0),(2597,295,'佳县',0),(2598,295,'吴堡县',0),(2599,295,'清涧县',0),(2600,295,'子洲县',0),(2601,296,'汉滨区',0),(2602,296,'汉阴县',0),(2603,296,'石泉县',0),(2604,296,'宁陕县',0),(2605,296,'紫阳县',0),(2606,296,'岚皋县',0),(2607,296,'平利县',0),(2608,296,'镇坪县',0),(2609,296,'旬阳县',0),(2610,296,'白河县',0),(2611,297,'商州区',0),(2612,297,'洛南县',0),(2613,297,'丹凤县',0),(2614,297,'商南县',0),(2615,297,'山阳县',0),(2616,297,'镇安县',0),(2617,297,'柞水县',0),(2618,298,'城关区',0),(2619,298,'七里河区',0),(2620,298,'西固区',0),(2621,298,'安宁区',0),(2622,298,'红古区',0),(2623,298,'永登县',0),(2624,298,'皋兰县',0),(2625,298,'榆中县',0),(2626,300,'金川区',0),(2627,300,'永昌县',0),(2628,301,'白银区',0),(2629,301,'平川区',0),(2630,301,'靖远县',0),(2631,301,'会宁县',0),(2632,301,'景泰县',0),(2633,302,'秦城区',0),(2634,302,'北道区',0),(2635,302,'清水县',0),(2636,302,'秦安县',0),(2637,302,'甘谷县',0),(2638,302,'武山县',0),(2639,302,'张家川回族自治县',0),(2640,303,'凉州区',0),(2641,303,'民勤县',0),(2642,303,'古浪县',0),(2643,303,'天祝藏族自治县',0),(2644,304,'甘州区',0),(2645,304,'肃南裕固族自治县',0),(2646,304,'民乐县',0),(2647,304,'临泽县',0),(2648,304,'高台县',0),(2649,304,'山丹县',0),(2650,305,'崆峒区',0),(2651,305,'泾川县',0),(2652,305,'灵台县',0),(2653,305,'崇信县',0),(2654,305,'华亭县',0),(2655,305,'庄浪县',0),(2656,305,'静宁县',0),(2657,306,'肃州区',0),(2658,306,'金塔县',0),(2659,306,'安西县',0),(2660,306,'肃北蒙古族自治县',0),(2661,306,'阿克塞哈萨克族自治县',0),(2662,306,'玉门市',0),(2663,306,'敦煌市',0),(2664,307,'西峰区',0),(2665,307,'庆城县',0),(2666,307,'环县',0),(2667,307,'华池县',0),(2668,307,'合水县',0),(2669,307,'正宁县',0),(2670,307,'宁县',0),(2671,307,'镇原县',0),(2672,308,'安定区',0),(2673,308,'通渭县',0),(2674,308,'陇西县',0),(2675,308,'渭源县',0),(2676,308,'临洮县',0),(2677,308,'漳县',0),(2678,308,'岷县',0),(2679,309,'武都区',0),(2680,309,'成县',0),(2681,309,'文县',0),(2682,309,'宕昌县',0),(2683,309,'康县',0),(2684,309,'西和县',0),(2685,309,'礼县',0),(2686,309,'徽县',0),(2687,309,'两当县',0),(2688,310,'临夏市',0),(2689,310,'临夏县',0),(2690,310,'康乐县',0),(2691,310,'永靖县',0),(2692,310,'广河县',0),(2693,310,'和政县',0),(2694,310,'东乡族自治县',0),(2695,310,'积石山保安族东乡族撒拉族自治县',0),(2696,311,'合作市',0),(2697,311,'临潭县',0),(2698,311,'卓尼县',0),(2699,311,'舟曲县',0),(2700,311,'迭部县',0),(2701,311,'玛曲县',0),(2702,311,'碌曲县',0),(2703,311,'夏河县',0),(2704,312,'城东区',0),(2705,312,'城中区',0),(2706,312,'城西区',0),(2707,312,'城北区',0),(2708,312,'大通回族土族自治县',0),(2709,312,'湟中县',0),(2710,312,'湟源县',0),(2711,313,'平安县',0),(2712,313,'民和回族土族自治县',0),(2713,313,'乐都县',0),(2714,313,'互助土族自治县',0),(2715,313,'化隆回族自治县',0),(2716,313,'循化撒拉族自治县',0),(2717,314,'门源回族自治县',0),(2718,314,'祁连县',0),(2719,314,'海晏县',0),(2720,314,'刚察县',0),(2721,315,'同仁县',0),(2722,315,'尖扎县',0),(2723,315,'泽库县',0),(2724,315,'河南蒙古族自治县',0),(2725,316,'共和县',0),(2726,316,'同德县',0),(2727,316,'贵德县',0),(2728,316,'兴海县',0),(2729,316,'贵南县',0),(2730,317,'玛沁县',0),(2731,317,'班玛县',0),(2732,317,'甘德县',0),(2733,317,'达日县',0),(2734,317,'久治县',0),(2735,317,'玛多县',0),(2736,318,'玉树县',0),(2737,318,'杂多县',0),(2738,318,'称多县',0),(2739,318,'治多县',0),(2740,318,'囊谦县',0),(2741,318,'曲麻莱县',0),(2742,319,'格尔木市',0),(2743,319,'德令哈市',0),(2744,319,'乌兰县',0),(2745,319,'都兰县',0),(2746,319,'天峻县',0),(2747,320,'兴庆区',0),(2748,320,'西夏区',0),(2749,320,'金凤区',0),(2750,320,'永宁县',0),(2751,320,'贺兰县',0),(2752,320,'灵武市',0),(2753,321,'大武口区',0),(2754,321,'惠农区',0),(2755,321,'平罗县',0),(2756,322,'利通区',0),(2757,322,'盐池县',0),(2758,322,'同心县',0),(2759,322,'青铜峡市',0),(2760,323,'原州区',0),(2761,323,'西吉县',0),(2762,323,'隆德县',0),(2763,323,'泾源县',0),(2764,323,'彭阳县',0),(2765,324,'沙坡头区',0),(2766,324,'中宁县',0),(2767,324,'海原县',0),(2768,325,'天山区',0),(2769,325,'沙依巴克区',0),(2770,325,'新市区',0),(2771,325,'水磨沟区',0),(2772,325,'头屯河区',0),(2773,325,'达坂城区',0),(2774,325,'东山区',0),(2775,325,'乌鲁木齐县',0),(2776,326,'独山子区',0),(2777,326,'克拉玛依区',0),(2778,326,'白碱滩区',0),(2779,326,'乌尔禾区',0),(2780,327,'吐鲁番市',0),(2781,327,'鄯善县',0),(2782,327,'托克逊县',0),(2783,328,'哈密市',0),(2784,328,'巴里坤哈萨克自治县',0),(2785,328,'伊吾县',0),(2786,329,'昌吉市',0),(2787,329,'阜康市',0),(2788,329,'米泉市',0),(2789,329,'呼图壁县',0),(2790,329,'玛纳斯县',0),(2791,329,'奇台县',0),(2792,329,'吉木萨尔县',0),(2793,329,'木垒哈萨克自治县',0),(2794,330,'博乐市',0),(2795,330,'精河县',0),(2796,330,'温泉县',0),(2797,331,'库尔勒市',0),(2798,331,'轮台县',0),(2799,331,'尉犁县',0),(2800,331,'若羌县',0),(2801,331,'且末县',0),(2802,331,'焉耆回族自治县',0),(2803,331,'和静县',0),(2804,331,'和硕县',0),(2805,331,'博湖县',0),(2806,332,'阿克苏市',0),(2807,332,'温宿县',0),(2808,332,'库车县',0),(2809,332,'沙雅县',0),(2810,332,'新和县',0),(2811,332,'拜城县',0),(2812,332,'乌什县',0),(2813,332,'阿瓦提县',0),(2814,332,'柯坪县',0),(2815,333,'阿图什市',0),(2816,333,'阿克陶县',0),(2817,333,'阿合奇县',0),(2818,333,'乌恰县',0),(2819,334,'喀什市',0),(2820,334,'疏附县',0),(2821,334,'疏勒县',0),(2822,334,'英吉沙县',0),(2823,334,'泽普县',0),(2824,334,'莎车县',0),(2825,334,'叶城县',0),(2826,334,'麦盖提县',0),(2827,334,'岳普湖县',0),(2828,334,'伽师县',0),(2829,334,'巴楚县',0),(2830,334,'塔什库尔干塔吉克自治县',0),(2831,335,'和田市',0),(2832,335,'和田县',0),(2833,335,'墨玉县',0),(2834,335,'皮山县',0),(2835,335,'洛浦县',0),(2836,335,'策勒县',0),(2837,335,'于田县',0),(2838,335,'民丰县',0),(2839,336,'伊宁市',0),(2840,336,'奎屯市',0),(2841,336,'伊宁县',0),(2842,336,'察布查尔锡伯自治县',0),(2843,336,'霍城县',0),(2844,336,'巩留县',0),(2845,336,'新源县',0),(2846,336,'昭苏县',0),(2847,336,'特克斯县',0),(2848,336,'尼勒克县',0),(2849,337,'塔城市',0),(2850,337,'乌苏市',0),(2851,337,'额敏县',0),(2852,337,'沙湾县',0),(2853,337,'托里县',0),(2854,337,'裕民县',0),(2855,337,'和布克赛尔蒙古自治县',0),(2856,338,'阿勒泰市',0),(2857,338,'布尔津县',0),(2858,338,'富蕴县',0),(2859,338,'福海县',0),(2860,338,'哈巴河县',0),(2861,338,'青河县',0),(2862,338,'吉木乃县',0),(2865,345,'台北',0),(2866,356,'高雄',0),(2875,197,'海珠区',0),(2876,73,'饱宝宝',0);
/*!40000 ALTER TABLE `sys_district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_instance`
--

DROP TABLE IF EXISTS `sys_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_instance` (
  `instance_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `instance_name` varchar(50) NOT NULL DEFAULT '' COMMENT '实例名',
  `instance_typeid` int(11) NOT NULL DEFAULT '2' COMMENT '实例类型ID',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `qrcode` varchar(255) NOT NULL DEFAULT '' COMMENT '实例二维码',
  `remark` text COMMENT '实例简介',
  PRIMARY KEY (`instance_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1365 COMMENT='系统实例表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_instance`
--

LOCK TABLES `sys_instance` WRITE;
/*!40000 ALTER TABLE `sys_instance` DISABLE KEYS */;
INSERT INTO `sys_instance` VALUES (45,'安阳旗舰店',1,'2018-04-28 10:18:29','',NULL),(46,'周口特产店',1,'2018-05-07 19:35:48','',NULL),(47,'安康特产店',1,'2018-05-19 15:57:38','',NULL),(48,'许昌特产店',1,'2018-05-19 16:34:28','',NULL),(53,'新疆阿克苏',1,'2019-01-04 15:40:59','',NULL);
/*!40000 ALTER TABLE `sys_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_instance_type`
--

DROP TABLE IF EXISTS `sys_instance_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_instance_type` (
  `instance_typeid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '实例类型ID',
  `type_name` varchar(50) NOT NULL DEFAULT '' COMMENT '实例类型名称',
  `type_module_array` text NOT NULL COMMENT '实例类型权限',
  `type_desc` text NOT NULL COMMENT '实例类型说明',
  `type_sort` int(11) NOT NULL DEFAULT '1' COMMENT '排序号',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`instance_typeid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='实例类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_instance_type`
--

LOCK TABLES `sys_instance_type` WRITE;
/*!40000 ALTER TABLE `sys_instance_type` DISABLE KEYS */;
INSERT INTO `sys_instance_type` VALUES (1,'直营店铺','120,121,122,123,129,126,127,144,360,128,133,149,139,169,151,171,172,210,334,478,516,517,179,180,186,187,195,196,197,198,199,200,201,202,203,446,469,184,185,190,194,189,191,192,487,533,534,471,472,528,529,530,218,418,474,678,679,680,10006,409,403,405,454,457,459,462,463,460,684,726,727,729,730,732,467,515','',1,'0000-00-00 00:00:00','2017-07-10 14:49:04'),(2,'加盟店铺','120,121,122,123,129,126,127,144,360,128,133,149,139,169,151,171,172,210,334,478,516,517,179,180,186,187,195,196,197,198,199,200,201,202,203,446,469,184,185,190,194,189,191,192,487,533,534,471,472,528,529,530,218,418,474,678,679,680,10006,409,403,405,454,457,459,462,463,460,684,726,727,729,730,732,467,515','',2,'2017-07-10 14:48:28','2017-07-13 11:58:23');
/*!40000 ALTER TABLE `sys_instance_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_module`
--

DROP TABLE IF EXISTS `sys_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_module` (
  `module_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模块ID',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT '模块标题',
  `module` varchar(255) NOT NULL DEFAULT 'admin' COMMENT '项目名',
  `controller` varchar(255) NOT NULL DEFAULT '' COMMENT '控制器名',
  `method` varchar(255) NOT NULL DEFAULT '' COMMENT '方法名',
  `pid` int(10) NOT NULL DEFAULT '0' COMMENT '上级模块ID',
  `level` int(11) NOT NULL DEFAULT '1' COMMENT '深度等级',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `is_menu` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是菜单',
  `is_dev` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL,
  `desc` text COMMENT '模块描述',
  `module_picture` varchar(255) NOT NULL DEFAULT '' COMMENT '模块图片',
  `icon_class` varchar(255) NOT NULL DEFAULT '' COMMENT '矢量图class',
  `is_control_auth` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否控制权限',
  PRIMARY KEY (`module_id`),
  KEY `INDEX_PID` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=795 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=606 COMMENT='系统模块表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_module`
--

LOCK TABLES `sys_module` WRITE;
/*!40000 ALTER TABLE `sys_module` DISABLE KEYS */;
INSERT INTO `sys_module` VALUES (120,'系统','admin','system','modulelist',0,1,'system/modulelist',0,0,999,'2016-10-26 11:55:52','2017-06-30 15:53:50','\'\'','','',1),(121,'模块列表','admin','system','modulelist',120,2,'system/modulelist',1,1,2,'0000-00-00 00:00:00',NULL,'\'\'','','',1),(122,'添加模块','admin','system','addmodule',121,3,'system/addmodule',0,1,1,'0000-00-00 00:00:00','2016-11-24 16:36:37','添加模块','','',1),(123,'修改模块','admin','system','editmodule',121,3,'system/editmodule',0,1,2,'0000-00-00 00:00:00','2016-11-24 16:37:26','修改模块','','',1),(126,'用户','admin','auth','userlist',0,1,'auth/userlist',0,0,9,'0000-00-00 00:00:00','2017-01-17 18:57:43','','','',1),(127,'用户列表','admin','auth','userlist',126,2,'auth/userlist',1,0,0,'0000-00-00 00:00:00',NULL,NULL,'','',1),(128,'用户组列表','admin','auth','authgrouplist',126,2,'auth/authgrouplist',1,0,0,'0000-00-00 00:00:00','2016-11-24 16:41:59','用户组','','',1),(129,'删除模块','admin','system','delmodule',121,3,'system/delmodule',0,0,0,'2016-10-28 09:32:30','2016-11-24 16:38:43','模块列表','','',1),(133,'添加用户组','admin','auth','addusergroup',128,3,'auth/addusergroup',0,0,2,'2016-10-28 12:22:24','2016-11-24 16:43:28','用户组','','',1),(144,'编辑用户','admin','auth','edituser',127,3,'auth/edituser',0,0,5,'2016-11-11 12:10:47','2016-11-24 16:42:43','用户','','',1),(149,'商品','admin','goods','goodslist',0,1,'goods/goodslist',1,0,1,'2016-11-16 11:49:08','2017-05-05 16:32:47','商品模块','','',1),(150,'商品管理','admin','goods','goodslist',149,2,'goods/goodslist',1,0,1,'2016-11-16 11:50:36','2017-04-11 16:18:45','商品列表','','',0),(169,'图片管理','admin','system','albumpicturelist',139,3,'system/albumpicturelist',0,0,5,'2016-11-18 18:25:08','2016-11-24 16:39:50','sfgsdf','','',1),(172,'添加商品分组','admin','goods','addgoodsgroup',171,3,'goods/addgoodsgroup',0,0,6,'2016-11-23 11:57:04','2016-11-24 12:04:03','添加商品分组','','',1),(179,'营销','admin','promotion','coupontypelist',0,1,'promotion/coupontypelist',1,0,3,'2016-11-30 15:40:52','2016-11-30 15:42:05','优惠券类型列表','','',1),(180,'优惠券','admin','promotion','coupontypelist',179,2,'promotion/coupontypelist',0,0,1,'2016-11-30 15:44:06',NULL,'优惠券类型列表','','',1),(184,'订单','admin','order','orderlist',0,1,'order/orderlist',1,0,2,'2016-12-01 11:32:17',NULL,'订单列表','','',1),(185,'订单列表','admin','order','orderlist',184,2,'order/orderlist',1,0,1,'2016-12-01 11:33:30',NULL,'订单列表','','',1),(186,'添加优惠券','admin','promotion','addcoupontype',180,3,'promotion/addcoupontype',1,0,2,'2016-12-01 14:19:31',NULL,'添加优惠券类型','','',1),(187,'修改优惠券','admin','promotion','updatecoupontype',180,3,'promotion/updatecoupontype',1,0,3,'2016-12-05 10:29:03',NULL,'修改优惠券类型','','',1),(189,'运费设置','admin','express','freighttemplatelist',184,2,'express/freighttemplatelist',1,0,4,'2016-12-09 11:41:06','2017-01-20 14:39:04','物流公司','','',1),(190,'订单详情','admin','order','orderdetail',185,3,'order/orderdetail',0,0,1,'2016-12-09 12:36:13',NULL,'订单详情','','',1),(191,'添加物流公司','admin','express','addexpresscompany',189,3,'express/addexpresscompany',1,0,3,'2016-12-09 15:17:08',NULL,'添加物流公司','','',1),(192,'物流公司修改','admin','express','updateexpresscompany',189,3,'express/updateexpresscompany',1,0,4,'2016-12-09 16:23:28',NULL,'物流公司修改排序','','',1),(194,'退款详情','admin','order','orderrefunddetail',185,3,'order/orderrefunddetail',0,0,2,'2016-12-16 15:07:54',NULL,'退款详情','','',1),(195,'平台抽奖','admin','promotion','giftlist',179,2,'promotion/giftlist',1,0,3,'2016-12-19 10:04:34','2017-05-08 11:59:48','','','',1),(196,'添加赠品','admin','promotion','addgift',195,3,'promotion/addgift',1,0,0,'2016-12-19 10:14:24','2016-12-19 11:18:59','添加赠品','','',1),(197,'修改赠品','admin','promotion','updategift',195,3,'promotion/updategift',1,0,0,'2016-12-19 10:15:15','2016-12-19 11:19:18','修改赠品','','',1),(198,'超级团购','admin','promotion','supergrouplist',179,2,'promotion/supergrouplist',1,0,4,'2016-12-19 17:09:40','2016-12-19 17:09:57','满减送','','',0),(199,'添加团购','admin','promotion','addgroup',198,3,'promotion/addgroup',1,0,0,'2016-12-19 17:38:31',NULL,'满减送','','',0),(200,'编辑团购','admin','promotion','updategroup',198,3,'promotion/updategroup',1,0,1,'2016-12-28 14:37:39',NULL,'编辑满减送','','',0),(201,'限时折扣','admin','promotion','getdiscountlist',179,2,'promotion/getdiscountlist',1,0,5,'2017-01-09 16:08:03',NULL,'限时折扣','','',1),(202,'添加限时折扣','admin','promotion','adddiscount',201,3,'promotion/adddiscount',1,0,0,'2017-01-09 16:38:24',NULL,'添加限时折扣','','',1),(203,'修改限时折扣','admin','promotion','updatediscount',201,3,'promotion/updatediscount',1,0,1,'2017-01-09 16:39:11','2017-01-09 18:40:51','修改限时折扣','','',1),(210,'修改商品分组','admin','goods','updategoodsgroup',171,3,'goods/updategoodsgroup',0,0,2,'2017-01-11 15:38:18','2017-01-11 17:11:57','修改商品分组','','',1),(218,'店铺','admin','shop','shopconfig',0,1,'shop/shopconfig',1,0,6,'2017-01-17 09:42:35','2017-07-04 11:35:19','店铺设置','','',1),(360,'添加用户','admin','auth','adduser',127,3,'auth/adduser',0,0,1,'2017-03-23 10:38:51',NULL,'添加用户','','',1),(398,'个人资料','admin','auth','userdetail',126,2,'auth/userdetail',1,0,0,'2017-04-01 14:59:55','2017-05-09 10:54:50','个人资料','','',0),(403,'销售排行','admin','account','shopgoodssalesrank',409,2,'account/shopgoodssalesrank',1,0,9,'2017-04-01 17:48:10','2017-06-07 15:15:01','商品销售排行','','',1),(405,'商品销售统计','admin','account','shopgoodsaccountlist',403,3,'account/shopgoodsaccountlist',0,0,6,'2017-04-01 18:32:22',NULL,'商品销售统计','','',1),(409,'资产','admin','account','shopaccount',0,1,'account/shopsalesaccount',1,0,11,'2017-04-27 16:24:48','2017-05-05 16:53:32','资产','','',1),(418,'店铺设置','admin','shop','shopconfig',218,2,'shop/shopconfig',1,0,1,'2017-04-21 14:10:47','2017-07-04 11:34:48','','','',1),(430,'友情链接','admin','config','linklist',477,2,'config/linklist',1,0,13,'2017-04-21 17:01:09','2017-06-01 20:39:10','友情链接','','',1),(445,'用户通知','admin','config','usernotice',477,2,'config/usernotice',1,0,19,'2017-04-26 19:30:56','2017-06-01 20:45:21','userNotice','','',1),(446,'积分管理','admin','promotion','pointconfig',179,2,'promotion/pointconfig',0,0,1,'2017-04-26 19:35:30','2017-07-20 16:04:04','1','','',1),(447,'粉丝列表','admin','member','weixinfanslist',137,2,'member/weixinfanslist',1,0,2,'2017-04-27 15:38:22',NULL,'粉丝列表','','',1),(450,'修改消息素材','admin','wchat','updatemedia',342,3,'wchat/updatemedia',1,0,1,'2017-04-27 16:34:38','2017-04-27 16:38:17','','','',1),(451,'添加消息素材','admin','wchat','addmedia',342,3,'wchat/addmedia',1,0,1,'2017-04-27 16:39:31',NULL,'','','',1),(454,'销售统计','admin','account','orderaccountcount',409,2,'account/orderaccountcount',0,0,6,'2017-04-27 18:46:01','2017-05-05 18:55:04','','','',1),(457,'销售明细','admin','account','orderrecordslist',454,3,'account/orderrecordslist',0,0,2,'2017-05-02 14:04:40','2017-05-02 14:10:19','','','',1),(459,'销售概况','admin','account','shopsalesaccount',409,2,'account/shopsalesaccount',1,0,1,'2017-05-03 09:46:41','2017-05-05 16:52:01','','','',1),(460,'热卖商品','admin','account','bestsellergoods',463,3,'account/bestsellergoods',0,0,1,'2017-05-04 11:05:20','2017-05-05 16:16:30','','','',1),(461,'同行热卖','admin','account','shopgoodsgroupsalecount',409,2,'account/shopgoodsgroupsalecount',0,0,4,'2017-05-05 09:10:58','2017-06-17 14:08:57','','','',0),(462,'运营报告','admin','account','shopreport',409,2,'account/shopreport',1,0,5,'2017-05-05 09:23:32',NULL,'','','',1),(463,'商品分析','admin','account','shopgoodssaleslist',409,2,'account/shopgoodssaleslist',1,0,2,'2017-05-05 10:03:19',NULL,'','','',1),(467,'首页','admin','index','index',0,1,'index/index',1,0,0,'2017-05-11 14:53:32','2017-06-24 10:13:42','','','',1),(469,'满额包邮','admin','promotion','fullshipping',179,2,'promotion/fullshipping',0,0,6,'2017-05-16 17:49:22',NULL,'满额包邮设置','','',1),(471,'商家地址','admin','order','returnsetting',184,2,'order/returnsetting',1,0,5,'2017-05-31 15:29:20','2017-05-31 15:34:06','退货设置','','',1),(472,'添加或修改','admin','order','addreturn',471,3,'order/addreturn',1,0,1,'2017-05-31 15:31:32','2017-05-31 15:34:27','添加退货','','',1),(474,'首页公告','admin','config','updatenotice',218,2,'config/updatenotice',1,0,15,'2017-06-01 12:32:47','2017-06-01 20:39:26','公告','','',1),(487,'模板编辑','admin','express','expresstemplate',189,3,'express/expresstemplate',0,1,1,'2017-06-03 11:19:53',NULL,'','','',1),(506,'模板管理','admin','config','notifytemplate',439,3,'config/notifytemplate',0,1,0,'2017-06-08 09:48:59','2017-06-09 10:11:08','','','',1),(508,'积分奖励','admin','promotion','integral',446,3,'promotion/integral',0,0,0,'2017-06-08 12:30:01','2017-07-20 11:05:44','','','',0),(509,'积分管理','admin','member','pointlist',137,2,'member/pointlist',1,1,5,'2017-06-08 15:13:27','2017-06-08 15:17:02','','','',1),(515,'欢迎页','admin','index','index',467,2,'index/index',1,0,0,'2017-06-09 11:31:02',NULL,'欢迎页','','',1),(517,'回收站列表','admin','goods','recyclelist',516,3,'goods/recyclelist',0,1,0,'2017-06-14 10:35:26','2017-06-14 10:41:52','','','',1),(528,'自提点管理','admin','shop','pickuppointlist',184,2,'shop/pickuppointlist',1,0,6,'2017-06-20 14:33:51','2017-06-20 16:37:40','','','',0),(529,'添加自提点','admin','shop','addpickuppoint',528,3,'shop/addpickuppoint',0,1,0,'2017-06-20 14:51:26','2017-06-20 20:20:29','','','',1),(530,'修改自提点','admin','shop','updatepickuppoint',528,3,'shop/updatepickuppoint',0,1,0,'2017-06-20 17:39:37',NULL,'','','',1),(532,'在线更新','admin','upgrade','onlineupdate',477,2,'upgrade/onlineupdate',1,0,30,'2017-06-26 19:22:24','2017-06-27 09:24:14','在线更新','','',1),(533,'运费模板列表','admin','express','freighttemplatelist',189,3,'express/freighttemplatelist',0,0,0,'2017-06-27 14:19:23',NULL,'','','',1),(534,'编辑运费模板','admin','express','freighttemplateedit',189,3,'express/freighttemplateedit',0,0,2,'2017-06-27 14:22:36',NULL,'','','',1),(535,'系统','platform','system','modulelist',0,1,'system/modulelist',1,1,166,'2016-10-26 11:55:52','2017-05-01 12:52:41','\'\'','upload/admin/common/1486625826.png','icon-system',0),(536,'修改模块','platform','system','editmodule',537,3,'system/editmodule',0,0,2,'0000-00-00 00:00:00','2017-05-09 10:47:02','修改模块','','',1),(537,'模块列表','platform','system','modulelist',535,2,'system/modulelist',1,0,2,'0000-00-00 00:00:00',NULL,'\'\'','','',1),(538,'添加模块','platform','system','addmodule',537,3,'system/addmodule',0,0,2,'2017-02-06 12:21:57',NULL,'添加模块','','',1),(539,'用户','platform','auth','userlist',0,1,'auth/userlist',1,0,2,'0000-00-00 00:00:00','2017-05-10 18:10:11','该页面显示所有用户的相关信息。///可以对用户进行添加、修改操作。','upload/admin/1484650661.jpg','icon-user',1),(540,'用户列表','platform','auth','userlist',539,2,'auth/userlist',1,0,0,'0000-00-00 00:00:00',NULL,NULL,'','',1),(541,'用户组列表','platform','auth','authgrouplist',539,2,'auth/authgrouplist',1,0,0,'0000-00-00 00:00:00','2017-05-10 18:11:30','该页面显示所有用户组的相关信息。///可以对用户组进行添加、修改等操作。','','',1),(542,'添加用户组','platform','Auth','addAuthGroup',541,3,'Auth/addAuthGroup',0,0,0,'2016-10-28 12:22:24','2017-07-15 10:26:53','用户组','','',1),(543,'编辑用户','platform','auth','edituser',540,3,'auth/edituser',0,0,5,'2016-11-11 12:10:47','2017-07-07 14:57:20','标识“&lt;em&gt;*&lt;/em&gt;”的选项为必填项，其余为选填项。','','',1),(545,'会员列表','platform','member','memberlist',544,2,'member/memberlist',1,0,0,'2016-11-11 14:35:13','2016-11-11 14:36:43','','','',1),(546,'文章','platform','cms','articlelist',0,1,'cms/articlelist',0,0,11,'2017-01-10 10:08:48','2017-05-10 19:05:07','该页面显示所有文章列表。///可以对文章进行添加、修改、删除操作。///可以通过关键字进行搜索。<br>','','icon-cms',1),(547,'平台','platform','index','index',0,1,'index/index',1,0,0,'2016-11-02 10:20:32','2017-05-08 18:49:20','','','icon-mall',1),(548,'第三方登录','platform','config','partylogin',652,3,'config/partylogin',0,1,3,'2016-11-03 18:28:59','2017-07-04 15:16:44','','','',1),(549,'微信登录设置','platform','config','loginweixinconfig',243,3,'config/loginweixinconfig',0,1,2,'2016-11-15 15:44:17','2017-04-18 10:22:38','微信登录配置','','',1),(550,'添加广告位','platform','config','addplatformadvposition',659,3,'config/addplatformadvposition',0,0,0,'2017-01-14 13:54:35','2017-02-08 16:41:21','添加广告','','',1),(551,'编辑广告位','platform','config','updateplatformadvposition',659,3,'config/updateplatformadvposition',0,0,1,'2017-01-14 13:55:20','2017-02-09 14:37:00','编辑广告','','',1),(552,'导航管理','platform','config','shopnavigationlist',547,2,'config/shopnavigationlist',0,1,6,'2017-01-18 17:08:52',NULL,'导航管理','','',1),(553,'添加导航','platform','config','addshopnavigation',552,3,'config/addshopnavigation',0,1,3,'2017-01-18 17:29:39',NULL,'添加导航','','',1),(554,'修改导航','platform','config','updateshopnavigation',552,3,'config/updateshopnavigation',0,1,3,'2017-01-18 18:48:32',NULL,'修改导航','','',1),(555,'网站设置','platform','config','webconfig',652,3,'config/webconfig',1,0,0,'2016-11-02 10:20:32','2017-05-09 11:18:15','网站设置网站二维码设置，网站logo，网站基础设置。///网站提示测试查询','','',1),(556,'店铺','platform','shop','shoplist',0,1,'shop/shoplist',1,0,4,'2017-02-06 17:09:40','2017-05-10 17:53:19','展示了所有店铺的相关信息。///可以根据店铺的关键字搜索店铺。///可以修改店铺信息。','','icon-shop',1),(557,'文章列表','platform','cms','articlelist',546,2,'cms/articlelist',1,0,1,'2017-02-08 15:25:33','2017-05-10 19:07:55','该页面显示所有文章列表。///可以对文章进行添加、修改、删除操作。///可以通过关键字进行搜索。','','',1),(558,'商品管理','platform','goods','goodslist',590,2,'goods/goodslist',1,0,0,'2017-02-08 15:31:54','2017-05-10 17:13:28','该页面展示了商城所有的商品信息，可对商品进行编辑修改操作。///可输入商品名称关键字进行搜索，侧边栏进行高级搜索。','upload/admin/common/1487124888.png','icon-goods',1),(559,'商品分类','platform','goods','goodscategorylist',558,3,'goods/goodscategorylist',1,0,1,'2017-02-08 15:33:20','2017-05-10 17:28:47','展示了平台所有的商品分类。///可在列表直接增加下一级分类。///可在商品分类列表进行转移分类下的商品。///鼠标移动“设置”位置，可新增下一级分类、查看下一级分类、转移商品等操作。<br>','','',1),(560,'添加商品分类','platform','goods','addgoodscategory',558,3,'goods/addgoodscategory',0,0,3,'2017-02-08 15:35:04',NULL,'添加商品分类','','',1),(561,'修改商品分类','platform','goods','updategoodscategory',558,3,'goods/updategoodscategory',0,0,1,'2017-02-08 15:37:12','2017-02-08 15:37:27','修改商品分类','','',1),(562,'商品品牌','platform','goods','goodsbrandlist',558,3,'goods/goodsbrandlist',0,0,1,'2017-02-08 15:40:11','2017-05-10 17:29:56','展示了商城自营品牌的相关信息。///可以通过品牌关键字搜索相关品牌信息。','','',1),(563,'添加商品品牌','platform','goods','addgoodsbrand',558,3,'goods/addgoodsbrand',0,0,1,'2017-02-08 15:41:17','2017-05-10 19:15:45','带*为必填项，其余为选填项。','','',1),(564,'修改商品品牌','platform','goods','updategoodsbrand',259,3,'goods/updategoodsbrand',0,0,3,'2017-02-08 15:42:37','2017-02-21 14:19:48','修改品牌','','',1),(565,'店铺列表','platform','shop','shoplist',556,2,'shop/shoplist',1,0,1,'2017-02-08 15:45:55','2017-05-10 17:40:39','展示了所有店铺的相关信息。///可以根据店铺的关键字搜索店铺。','','',1),(566,'店铺审核','platform','shop','shopapplylist',556,2,'shop/shopapplylist',0,0,2,'2017-02-08 15:47:23','2017-05-10 17:45:42','该页面展示了所有店铺的信息。///可对店铺进行审核操作。','','',1),(567,'店铺等级','platform','shop','shoplevellist',556,2,'shop/shoplevellist',0,0,1,'2017-02-08 15:51:31','2017-05-10 18:00:07','该页面展示所有店铺等级的信息。///可以添加店铺等级、编辑店铺等级。','','',1),(568,'店铺分组','platform','shop','shopgrouplist',556,2,'shop/shopgrouplist',0,0,3,'2017-02-08 15:52:27','2017-05-10 18:02:46','该页面展示所有的店铺的分组。///可以通过关键字对分组进行查询。///可以添加、修改、删除分组。','','',1),(569,'友情链接','platform','config','linklist',547,2,'config/linklist',0,0,7,'2017-02-10 12:26:22',NULL,'友情链接','','',1),(570,'添加友情链接','platform','config','addlink',569,3,'config/addlink',0,0,0,'2017-02-10 12:28:16',NULL,'添加友情链接','','',1),(571,'修改友情链接','platform','config','updatelink',569,3,'config/updatelink',0,0,2,'2017-02-10 14:25:59',NULL,'修改友情链接','','',1),(572,'搜索设置','platform','config','searchconfig',547,2,'config/searchconfig',0,0,8,'2017-02-10 14:51:34','2017-02-22 17:24:24','搜索设置','','',1),(575,'分类列表','platform','cms','articleclasslist',546,2,'cms/articleclasslist',1,0,2,'2017-02-10 18:09:36','2017-05-10 19:13:58','该页面显示所有文章分类列表。///可以对文章进行添加、修改、删除操作。///可以通过关键字进行搜索。','','',1),(577,'首页版块','platform','config','blocklist',656,3,'config/blocklist',1,1,0,'2017-02-14 11:34:41','2017-05-08 18:39:25','首页版块','','',1),(580,'商品管理','platform','goods','goodslist',558,3,'goods/goodslist',1,0,0,'2017-02-15 16:59:33','2017-05-10 17:11:36','该页面展示了商城所有的商品信息，可对商品进行编辑修改操作。///可输入商品名称关键字进行搜索，侧边栏进行高级搜索。','','',1),(581,'支付配置','platform','config','paymentconfig',652,3,'config/paymentconfig',0,1,2,'2017-02-16 10:17:41','2017-07-04 12:19:50','支付配置，微信，支付宝','','',1),(582,'订单','platform','order','orderlist',0,1,'order/orderlist',1,0,1,'2017-02-16 16:38:00','2017-05-10 17:30:58','商城所有的订单列表，包括平台自营和入驻商家的订单。///点击订单号即可进入详情页面对订单进行操作。///Tab切换不同状态下的订单，便于分类订单。','','icon-order',1),(583,'订单列表','platform','order','orderlist',582,2,'order/orderlist',1,0,3,'2017-02-16 16:38:41',NULL,'订单列表','','',1),(584,'添加店铺分组','platform','shop','addshopgroup',556,2,'shop/addshopgroup',0,0,1,'2017-02-17 10:56:17','2017-05-10 18:04:54','标识“<em>*</em>”的选项为必填项，其余为选填项。','upload/admin/common/1487300169.jpg','',1),(585,'修改店铺分组','platform','shop','updateshopgroup',556,2,'shop/updateshopgroup',0,0,1,'2017-02-17 10:57:33','2017-05-10 18:04:29','标识“<em>*</em>”的选项为必填项，其余为选填项。','upload/admin/common/1487300248.jpg','',1),(586,'添加店铺等级','platform','shop','addshoplevel',556,2,'shop/addshoplevel',0,0,1,'2017-02-17 12:18:32','2017-05-10 17:58:24','标识“<em>*</em>”的选项为必填项，其余为选填项。','','',1),(587,'审核详情','platform','shop','shopverify',566,3,'shop/shopverify',0,0,1,'2017-02-17 16:33:21','2017-02-17 16:34:33','店铺审核详情','','',1),(588,'帮助类型','platform','config','helpclass',653,3,'config/helpclass',1,0,2,'2017-02-17 16:59:26','2017-05-08 18:32:31','','','',1),(589,'帮助内容','platform','config','helpdocument',653,3,'config/helpdocument',1,0,1,'2017-02-17 17:08:42','2017-05-08 18:33:03','','','',1),(590,'商城','platform','goods','goodslist',0,1,'goods/goodslist',1,0,1,'2017-02-21 10:54:59','2017-05-08 18:47:54','控制台，首页','','icon-index',1),(591,'促销版块','platform','config','goodsrecommendclass',656,3,'config/goodsrecommendclass',1,0,1,'2017-02-22 09:44:35','2017-05-08 18:39:59','促销版块','','',1),(592,'用户通知','platform','config','usernotice',547,2,'config/usernotice',0,0,19,'2017-02-23 14:10:30',NULL,'用户通知，显示在商城前台个人中心','','',1),(593,'统计','platform','statistics','platformaccountmonthrecored',0,1,'statistics/platformaccountmonthrecored',0,0,10,'2017-02-24 11:37:07','2017-07-21 12:30:10','统计，包括会员统计，店铺统计，销量统计，商品分析','','',1),(594,'会员统计','platform','statistics','userstat',593,2,'statistics/userstat',1,0,1,'2017-02-24 11:38:27','2017-05-10 19:18:32','会员统计并用走势图直观呈现','','',1),(595,'店铺统计','platform','statistics','shopaccountlist',593,2,'statistics/shopaccountlist',1,0,1,'2017-02-24 11:40:34','2017-05-10 19:18:18','店铺统计并用走势图直观呈现','','',1),(596,'订单统计','platform','statistics','orderstat',593,2,'statistics/orderstat',1,0,2,'2017-02-24 11:45:00','2017-05-10 19:19:17','订单统计并用走势图直观呈现','','',1),(597,'商品分析','platform','statistics','goodsstat',593,2,'statistics/goodsstat',0,0,3,'2017-02-24 11:46:48','2017-07-21 17:41:09','商品分析统计并用走势图直观呈现','','',1),(598,'售后分析','platform','statistics','aftersale',593,2,'statistics/aftersale',0,0,4,'2017-02-24 11:50:03','2017-05-10 19:20:19','售后分析统计并用走势图直观呈现','','',1),(599,'统计概述','platform','statistics','statgeneral',593,2,'statistics/statgeneral',0,0,0,'2017-02-24 11:53:07','2017-07-21 12:29:38','统计并用走势图直观呈现','','',0),(605,'积分设置','platform','config','pointconfig',652,3,'config/pointconfig',0,0,9,'2017-03-01 10:24:47','2017-07-04 18:39:33','积分设置','','',1),(606,'添加用户','platform','auth','adduser',540,3,'auth/adduser',0,0,0,'2017-03-02 14:24:00','2017-05-10 18:08:31','标识“<em>*</em>”的选项为必填项，其余为选填项。','','',1),(607,'修改用户组','platform','Auth','updateAuthGroup',541,3,'Auth/updateAuthGroup',0,0,3,'2017-03-02 14:35:18','2017-07-15 10:27:27','修改用户组','','',1),(608,'邮箱短信','platform','config','notifyindex',652,3,'config/notifyindex',0,0,7,'2017-03-03 14:06:10','2017-07-04 16:41:53','邮箱设置，短信设置','','',1),(636,'微信','platform','wchat','config',0,1,'wchat/config',0,0,3,'2017-03-27 10:17:48','2017-05-10 18:15:16','该页面显示微信公众号的相关配置信息。','','icon-weixin',1),(637,'公众号管理','platform','wchat','config',636,2,'wchat/config',1,0,0,'2017-03-27 16:04:58','2017-05-10 18:16:04','该页面显示微信公众号的相关配置信息。','','',1),(638,'微信菜单','platform','wchat','menu',636,2,'wchat/menu',1,0,0,'2017-03-27 16:11:22','2017-05-10 18:17:18','该页面显示微信菜单的全部信息。','','',1),(639,'推广二维码','platform','wchat','weixinqrcodetemplate',636,2,'wchat/weixinqrcodetemplate',1,0,0,'2017-03-27 16:15:55','2017-05-10 18:18:54','该页面显示已推广的所有二维码。///可以添加、修改、删除以及设为默认二维码。','','',1),(640,'回复设置','platform','wchat','replayconfig',636,2,'wchat/replayconfig',1,0,0,'2017-03-27 16:16:58','2017-05-10 18:22:10','该页面展示了所有的回复设置信息。///可以对回复进行添加、修改、删除操作。<br>','','',1),(641,'消息素材','platform','wchat','materialmessage',636,2,'wchat/materialmessage',1,0,0,'2017-03-27 16:17:50','2017-05-10 18:24:29','该页面展示了所有素材消息。//可以对素材进行添加、修改、删除操作。///可以通过关键字进行搜索。','','',1),(643,'分享内容','platform','wchat','shareconfig',636,2,'wchat/shareconfig',1,0,0,'2017-03-27 16:19:37','2017-05-10 18:28:02','该页面展示了分享内容的流程。','','',1),(644,'账务统计','platform','statistics','platformaccountrecordscountlist',593,2,'statistics/platformaccountrecordscountlist',0,0,7,'2017-03-29 11:40:43','2017-05-10 19:20:34','账务统计并用走势图直观呈现','upload/admin/common/1490758817.jpg','',1),(645,'店铺提现','platform','shop','shopaccountwithdrawlist',556,2,'shop/shopaccountwithdrawlist',1,0,4,'2017-03-29 11:59:09','2017-05-10 18:07:05','显示所有提现的店铺的相关信息以及提现信息。///可以对体现店铺进行查看等操作。','upload/admin/common/1490759924.jpg','',1),(646,'开放平台','platform','wchat','weixinopenplatformconfig',636,2,'wchat/weixinopenplatformconfig',0,1,0,'2017-03-30 11:17:32','2017-07-04 10:34:09','该页面显示了微信开放平台的相关信息。','','',0),(647,'验证码设置','platform','config','codeconfig',652,3,'config/codeconfig',0,1,6,'2017-04-01 09:28:19','2017-05-08 18:28:23','','','',1),(648,'店铺销售明细','platform','account','shoporderaccountrecordslist',297,3,'account/shoporderaccountrecordslist',0,0,1,'2017-04-01 16:17:39','2017-05-10 19:18:47','店铺销售明细统计并用走势图直观呈现','upload/admin/common/1491034653.png','',1),(649,'商品销售明细','platform','account','shopordergoodsaccountrecordslist',597,3,'account/shopordergoodsaccountrecordslist',0,0,1,'2017-04-01 16:18:58','2017-05-10 19:20:00','商品销售明细统计并用走势图直观呈现','upload/admin/common/1491034733.png','',1),(650,'商品分类销售','platform','statistics','goodscategorysalenumrank',593,2,'statistics/goodscategorysalenumrank',1,0,8,'2017-04-02 14:34:58','2017-05-10 19:20:53','商品分类销售分销统计并用走势图直观呈现','upload/admin/common/1491114893.png','',1),(651,'平台统计','platform','statistics','platformaccountmonthrecored',593,2,'statistics/platformaccountmonthrecored',1,0,1,'2017-04-02 14:58:12','2017-05-10 19:19:04','平台统计并用走势图直观呈现','','',1),(652,'基础设置','platform','config','webconfig',547,2,'config/webconfig',1,0,1,'2017-05-08 18:24:12',NULL,'基础设置','','',1),(653,'帮助设置','platform','config','helpdocument',547,2,'config/helpdocument',0,0,3,'2017-05-08 18:31:58','2017-05-08 18:33:36','','','',1),(654,'添加内容','platform','config','adddocument',653,3,'config/adddocument',0,0,0,'2017-05-08 18:35:13',NULL,'','','',1),(655,'编辑内容','platform','config','updatedocument',653,3,'config/updatedocument',0,0,0,'2017-05-08 18:36:17',NULL,'','','',1),(656,'版块设置','platform','config','blocklist',547,2,'config/blocklist',0,0,4,'2017-05-08 18:38:58',NULL,'','','',1),(657,'控制台','platform','index','index',547,2,'index/index',1,0,0,'2017-05-08 18:48:53',NULL,'','','',1),(658,'添加帮助类型','platform','config','addhelpclass',653,3,'config/addhelpclass',0,0,11,'2017-05-09 09:42:10',NULL,'','','',1),(659,'广告设置','platform','config','platformadvpositionlist',547,2,'config/platformadvpositionlist',0,0,5,'2017-05-09 10:02:51',NULL,'','','',1),(660,'广告管理','platform','config','platformadvlist',659,3,'config/platformadvlist',0,0,4,'2017-05-09 10:11:02',NULL,'','','',1),(661,'添加广告','platform','config','addplatformadv',659,3,'config/addplatformadv',0,0,5,'2017-05-09 10:11:56',NULL,'','','',1),(662,'编辑广告','platform','config','updateplatformadv',659,3,'config/updateplatformadv',0,0,6,'2017-05-09 10:13:09',NULL,'','','',1),(663,'订单详情','platform','order','orderdetail',582,2,'order/orderdetail',0,0,0,'2017-05-09 10:19:53',NULL,'','','',1),(664,'修改店铺','platform','shop','updateshop',556,2,'shop/updateshop',0,0,0,'2017-05-09 10:26:55','2017-05-10 17:48:27','<br>','','',1),(665,'修改店铺等级','platform','shop','updateshoplevel',556,2,'shop/updateshoplevel',0,0,0,'2017-05-09 10:30:01','2017-05-10 17:51:25','展示了对应等级下的所有权限。//勾选操作可以对该等级设置权限。','','',1),(666,'添加自定义模板','platform','wchat','qrcode',639,3,'wchat/qrcode',0,0,0,'2017-05-09 10:33:25',NULL,'','','',1),(671,'商品规格','platform','goods','goodsspeclist',558,1,'goods/goodsspeclist',0,0,6,'2017-06-01 18:47:58','2017-07-12 12:09:30','商品规格','','',1),(673,'添加商品规格','platform','goods','addgoodsspec',671,3,'goods/addgoodsspec',0,1,1,'2017-06-02 10:01:35',NULL,'','','',1),(674,'修改商品规格','platform','goods','updategoodsspec',671,3,'goods/updategoodsspec',0,1,0,'2017-06-02 15:02:35',NULL,'','','',1),(679,'添加广告','admin','config','addshopad',678,3,'config/addshopad',1,0,1,'2017-07-04 11:52:26',NULL,'','','',1),(680,'修改广告','admin','config','updateshopad',678,3,'config/updateshopad',1,0,0,'2017-07-04 11:54:01',NULL,'','','',1),(681,'seo设置','platform','config','seoConfig',652,3,'config/seoconfig',0,0,1,'2017-07-04 12:14:06',NULL,'','','',1),(682,'支付宝支付','platform','config','payaliconfig',652,3,'config/payaliconfig',0,0,3,'2017-07-04 12:24:10','2017-07-04 14:52:21','','','',1),(683,'微信支付','platform','config','payconfig',652,3,'config/payconfig',0,0,4,'2017-07-04 14:09:42','2017-07-04 14:53:12','','','',1),(684,'店铺收入','admin','account','shopaccount',409,2,'account/shopaccount',1,0,0,'2017-07-04 14:14:57',NULL,'','','',1),(687,'微信登录','platform','config','loginwchatconfig',652,3,'config/loginwchatconfig',0,0,5,'2017-07-04 16:33:27','2017-07-04 17:54:32','','','',1),(689,'邮件通知','platform','config','messageemailconfig',652,3,'config/messageemailconfig',0,0,0,'2017-07-04 16:54:52','2017-07-04 17:22:45','','','',1),(690,'短信通知','platform','config','messagesmsconfig',652,3,'config/messagesmsconfig',0,0,0,'2017-07-04 17:23:24',NULL,'','','',1),(691,'qq登录','platform','config','loginqqsetconfig',652,3,'config/loginqqsetconfig',0,0,0,'2017-07-04 17:55:49',NULL,'','','',1),(695,'积分管理','platform','config','pointConfig',652,3,'config/pointconfig',0,0,0,'2017-07-04 18:22:27',NULL,'','','',1),(696,'积分奖励','platform','config','integral',652,3,'config/integral',0,0,0,'2017-07-04 18:23:00',NULL,'','','',1),(697,'邮件模板','platform','config','notifyemailtemplate',652,3,'config/notifyemailtemplate',0,0,0,'2017-07-05 09:19:10',NULL,'','','',1),(698,'短信模板','platform','config','notifysmstemplate',652,3,'config/notifysmstemplate',0,0,0,'2017-07-05 09:19:46',NULL,'','','',1),(699,'首页公告','platform','config','updatenotice',547,2,'config/updatenotice',1,0,9,'2017-07-05 16:08:02',NULL,'','','',1),(701,'修改版块','platform','config','updateBlock',656,3,'config/updateblock',0,0,0,'2017-07-05 17:57:48',NULL,'','','',1),(702,'积分明细','platform','member','pointdetail',544,3,'member/pointdetail',0,0,0,'2017-07-07 14:32:44',NULL,'','','',1),(703,'余额明细','platform','member','accountdetail',544,3,'member/accountdetail',0,0,0,'2017-07-07 14:33:27','2017-07-15 15:17:28','余额明细','','',1),(705,'会员等级','platform','Member','memberLevelList',544,3,'member/memberlevellist',1,0,1,'2017-07-07 15:20:52',NULL,'会员等级管理','','',1),(706,'购物设置','platform','config','shopset',590,2,'config/shopset',0,0,5,'2017-07-07 15:22:38','2017-07-07 15:23:04','','','',1),(707,'会员提现','platform','Member','userCommissionWithdrawList',544,3,'member/usercommissionwithdrawlist',1,0,2,'2017-07-07 15:22:15',NULL,'会员提现列表','','',1),(708,'粉丝列表','platform','member','weixinfanslist',544,3,'member/weixinfanslist',1,0,6,'2017-07-07 17:38:54',NULL,'','','',1),(709,'积分管理','platform','member','pointlist',544,3,'member/pointlist',1,0,4,'2017-07-07 18:17:50',NULL,'','','',1),(710,'专题列表','platform','Cms','topicList',546,2,'cms/topiclist',1,0,3,'2017-07-07 18:16:00',NULL,'专题列表','','',1),(711,'余额管理','platform','member','accountlist',544,3,'member/accountlist',1,0,5,'2017-07-07 18:18:26',NULL,'','','',1),(713,'问询设置','platform','query','queryList',590,2,'query/queryList',1,0,7,'2017-07-10 10:51:04','2017-07-10 11:08:04','','','',1),(714,'送礼免单','platform','Config','giftfreechance',547,2,'config/giftfreechance',1,0,2,'2017-07-10 11:41:26','2017-07-12 19:35:08','注册与访问','','',1),(715,'模板消息设置','platform','Wchat','messageTemplate',636,2,'wchat/messagetemplate',1,0,7,'2017-07-10 14:58:24',NULL,'模板消息设置','','',1),(717,'添加版块','platform','config','addblock',656,3,'config/addblock',0,0,0,'2017-07-11 17:56:41',NULL,'添加版块','','',1),(720,'商品类型','platform','goods','attributelist',558,3,'goods/attributelist',0,0,3,'2017-07-12 12:12:50','2017-07-12 12:13:51','','','',1),(723,'添加商品类型','platform','goods','addattributeservice',558,3,'goods/addattributeservice',0,0,3,'2017-07-12 18:19:01',NULL,'','','',1),(725,'修改商品类型','platform','goods','updategoodsattribute',558,3,'goods/updategoodsattribute',0,0,3,'2017-07-12 18:20:38',NULL,'','','',1),(726,'提现','admin','Account','applyshopaccountwithdraw',684,3,'Account/applyShopAccountWithdraw',1,1,0,'2017-07-13 16:19:01',NULL,'提现','','',1),(727,'添加账户','admin','Account','addShopAccountBank',684,3,'Account/addShopAccountBank',1,1,1,'2017-07-13 16:24:24',NULL,'添加账户','','',1),(729,'账户列表','admin','Account','shopBankAccountList',684,3,'Account/shopBankAccountList',1,1,0,'2017-07-13 16:26:49',NULL,'账户列表','','',1),(730,'修改账户','admin','Account','updateBankAccount',684,3,'Account/updateBankAccount',1,1,0,'2017-07-13 16:36:46',NULL,'修改账户','','',1),(732,'提现列表','admin','account','shopAccountWithdrawList',684,3,'account/shopAccountWithdrawList',1,1,0,'2017-07-13 16:51:49',NULL,'提现列表','','',1),(733,'地区管理','platform','Config','areaManagement',590,2,'Config/areaManagement',0,0,8,'2017-07-13 18:00:52',NULL,'地区管理','','',1),(734,'添加等级','platform','Member','addMemberLevel',544,3,'Member/addMemberLevel',0,0,6,'2017-07-15 10:17:05',NULL,'添加等级','','',1),(735,'修改等级','platform','Member','updateMemberLevel',544,3,'Member/updateMemberLevel',0,0,9,'2017-07-15 10:18:26',NULL,'修改等级','','',1),(737,'添加素材','platform','Wchat','addMedia',641,3,'Wchat/addMedia',0,0,0,'2017-07-15 10:44:44',NULL,'添加素材','','',1),(738,'修改素材','platform','Wchat','updateMedia',641,3,'Wchat/updateMedia',0,0,0,'2017-07-15 10:45:25',NULL,'修改素材','','',1),(739,'添加文章','platform','Cms','addArticle',557,3,'Cms/addArticle',0,0,0,'2017-07-15 10:49:47',NULL,'添加文章','','',1),(740,'修改文章','platform','Cms','updateArticle',557,3,'Cms/updateArticle',0,0,0,'2017-07-15 10:50:30',NULL,'修改文章','','',1),(741,'添加分类','platform','Cms','addArticleClass',575,3,'Cms/addArticleClass',0,0,1,'2017-07-15 10:51:17',NULL,'添加分类','','',1),(742,'修改分类','platform','Cms','updateArticleClass',575,3,'Cms/updateArticleClass',0,0,1,'2017-07-15 10:50:54',NULL,'修改分类','','',1),(743,'添加专题','platform','Cms','addTopic',710,3,'Cms/addTopic',0,0,2,'2017-07-15 10:51:58',NULL,'添加专题','','',1),(744,'修改专题','platform','Cms','updateTopic',710,3,'Cms/updateTopic',0,0,2,'2017-07-15 10:52:33',NULL,'修改专题','','',1),(745,'添加回复','platform','Wchat','addOrUpdateKeyReplay',640,3,'Wchat/addOrUpdateKeyReplay',0,0,0,'2017-07-15 11:40:02',NULL,'添加回复或修改','','',1),(755,'审核列表','admin','goods','goodseditlist',149,2,'goods/goodseditlist',0,0,1,'2016-11-16 11:50:36','2017-04-11 16:18:45','审核列表','','',0),(756,'问题列表','platform','query','queryList',713,3,'query/queryList',1,0,1,'2017-07-10 10:51:04','2017-07-10 11:08:04','','','',1),(758,'问题分类','platform','query','querycategorylist',713,3,'query/querycategorylist',1,0,1,'2017-02-08 15:33:20','2017-05-10 17:28:47','展示了平台所有的商品分类。///可在列表直接增加下一级分类。///可在商品分类列表进行转移分类下的商品。///鼠标移动“设置”位置，可新增下一级分类、查看下一级分类、转移商品等操作。<br>','','',1),(759,'商品类型','admin','goods','attributelist',149,2,'goods/attributelist',1,0,1,'2017-07-12 12:12:50','2017-07-12 12:13:51','','','',0),(760,'商品规格','admin','goods','goodsspeclist',149,2,'goods/goodsspeclist',1,0,6,'2017-06-01 18:47:58','2017-07-12 12:09:30','商品规格','','',0),(761,'平台活动','admin','promotion','getplatformdiscountlist',179,2,'promotion/getplatformdiscountlist',1,0,5,'2017-01-09 16:08:03',NULL,'限时折扣','','',0),(762,'修改限时折扣','admin','promotion','updateplatformdiscount',761,3,'promotion/updateplatformdiscount',1,0,1,'2017-01-09 16:39:11','2017-01-09 18:40:51','修改限时折扣','','',0),(763,'营销','platform','promotion','getfestivalactivitylist',0,1,'promotion/getfestivalactivitylist',1,0,3,'2016-11-30 15:40:52','2016-11-30 15:42:05','优惠券类型列表','','',1),(764,'活动管理','platform','promotion','getfestivalactivitylist',763,2,'promotion/getfestivalactivitylist',1,0,3,'2016-12-19 10:04:34','2017-05-08 11:59:48','','','',1),(765,'申请管理','platform','promotion','giftapplylist',763,2,'promotion/giftapplylist',1,0,3,'2016-12-19 10:04:34','2017-05-08 11:59:48','','','',1),(766,'添加限时折扣','admin','promotion','addplatformdiscount',761,3,'promotion/addplatformdiscount',1,0,1,'2017-01-09 16:39:11','2017-01-09 18:40:51','修改限时折扣','','',0),(767,'抽奖申请','platform','promotion','giftapplylist',765,3,'promotion/giftapplylist',1,0,1,'2016-12-19 10:04:34','2017-05-08 11:59:48','','','',1),(768,'团购申请','platform','promotion','groupapplylist',765,3,'promotion/groupapplylist',1,0,3,'2016-12-19 10:04:34','2017-05-08 11:59:48','','','',1),(769,'店铺折扣','platform','promotion','discountapplylist',765,3,'promotion/discountapplylist',1,0,3,'2016-12-19 10:04:34','2017-05-08 11:59:48','','','',1),(770,'平台活动','platform','promotion','platformdiscountapplylist',765,3,'promotion/platformdiscountapplylist',1,0,3,'2016-12-19 10:04:34','2017-05-08 11:59:48','','','',1),(771,'添加活动节日','platform','promotion','addactivityfestival',773,3,'promotion/addactivityfestival',0,0,1,'2017-01-09 16:39:11','2017-01-09 18:40:51','修改限时折扣','','',0),(772,'修改活动节日','platform','promotion','updateactivityfestival',773,3,'promotion/updateactivityfestival',0,0,1,'2017-01-09 16:39:11','2017-01-09 18:40:51','修改限时折扣','','',0),(773,'节日活动','platform','promotion','getfestivalactivitylist',764,3,'promotion/getfestivalactivitylist',1,0,3,'2016-12-19 10:04:34','2017-05-08 11:59:48','','','',1),(774,'专辑活动','platform','promotion','getalbumactivitylist',764,3,'promotion/getalbumactivitylist',1,0,3,'2016-12-19 10:04:34','2017-05-08 11:59:48','','','',1),(775,'添加活动专辑','platform','promotion','addactivityalbum',774,3,'promotion/addactivityalbum',0,0,1,'2017-01-09 16:39:11','2017-01-09 18:40:51','修改限时折扣','','',0),(776,'修改活动专辑','platform','promotion','updateactivityalbum',774,3,'promotion/updateactivityalbum',0,0,1,'2017-01-09 16:39:11','2017-01-09 18:40:51','修改限时折扣','','',0),(777,'店铺横幅','platform','shop','getshopbannerlist',590,2,'shop/getshopbannerlist',1,0,3,'2016-12-19 10:04:34','2017-05-08 11:59:48','','','',1),(778,'横幅列表','platform','shop','getshopbannerlist',777,3,'shop/getshopbannerlist',1,0,3,'2016-12-19 10:04:34','2017-05-08 11:59:48','','','',1),(779,'修改横幅','platform','shop','updateshopbanner',777,3,'shop/updateshopbanner',0,0,1,'2017-01-09 16:39:11','2017-01-09 18:40:51','修改限时折扣','','',0),(780,'添加横幅','platform','shop','addshopbanner',777,3,'shop/addshopbanner',0,1,1,'2017-01-09 16:39:11','2017-01-09 18:40:51','修改限时折扣','','',0),(781,'激活码管理','platform','promotion','getrecommendcodelist',590,2,'promotion/getrecommendcodelist',1,0,2,'2016-12-19 10:04:34','2017-05-08 11:59:48','','','',1),(782,'售后列表','admin','order','refundprocesslist',184,2,'order/refundprocesslist',1,0,3,'2017-02-16 16:38:41',NULL,'订单列表','','',0),(783,'供货商','admin','member','supplierlist',137,2,'member/supplierlist',1,0,7,'2017-07-12 17:52:00','2017-07-12 17:52:00','','','',1),(784,'修改供货商','admin','member','updatesupplier',783,3,'member/updatesupplier',1,0,1,'2017-07-12 17:52:00','2017-07-12 17:52:00','','','',1),(785,'添加供货商','admin','member','addsupplier',783,3,'member/addsupplier',1,0,0,'2017-07-12 17:52:00','2017-07-12 17:52:00','','','',1),(786,'店铺统计详情','platform','account','shopaccountrecordslist',595,3,'account/shopaccountrecordslist',0,0,0,'2017-07-18 15:40:41','2017-07-18 15:45:13','','','',1),(787,'非包邮区域','platform','config','distributionareamanagement',590,2,'config/distributionareamanagement',0,0,9,'2017-07-19 11:51:40','2017-07-19 19:02:47','','','',1),(789,'添加店铺','platform','shop','addshop',565,3,'shop/addshop',0,0,1,'2017-02-17 10:56:17','2017-05-10 18:04:54','标识“<em>*</em>”的选项为必填项，其余为选填项。','upload/admin/common/1487300169.jpg','',0),(790,'添加商品','admin','goods','addgoods',150,3,'goods/addgoods',0,1,0,'2017-06-20 14:51:26','2017-06-20 20:20:29','','','',0),(791,'添加商品类型','admin','goods','addattributeservice',759,3,'goods/addattributeservice',0,1,0,'2017-06-20 14:51:26','2017-06-20 20:20:29','','','',0),(792,'修改商品类型','admin','goods','updategoodsattribute',759,3,'goods/updategoodsattribute',0,1,0,'2017-06-20 14:51:26','2017-06-20 20:20:29','','','',0),(793,'添加商品规格','admin','goods','addgoodsspec',760,3,'goods/addgoodsspec',0,1,0,'2017-06-20 14:51:26','2017-06-20 20:20:29','','','',0),(794,'修改商品规格','admin','goods','updategoodsspec',760,3,'goods/updategoodsspec',0,1,0,'2017-06-20 14:51:26','2017-06-20 20:20:29','','','',0);
/*!40000 ALTER TABLE `sys_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shopid` int(11) NOT NULL COMMENT '店铺ID（单店版为0）',
  `notice_message` varchar(255) DEFAULT '' COMMENT '公告内容',
  `is_enable` tinyint(1) DEFAULT '0' COMMENT '是否启用（0：隐藏，1：显示）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE_SHOPID` (`shopid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='网站公告';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (7,0,'田趣小集即将开始小范围公测，敬请期待。',1),(11,48,'店铺正在内测，欢迎提出意见',1);
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice_template`
--

DROP TABLE IF EXISTS `sys_notice_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_notice_template` (
  `template_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '模板id',
  `template_type` varchar(50) NOT NULL DEFAULT '' COMMENT '模板类型',
  `instance_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `template_code` varchar(50) NOT NULL DEFAULT '' COMMENT '模板编号',
  `template_title` varchar(50) NOT NULL DEFAULT '' COMMENT '模板编号',
  `template_content` text NOT NULL COMMENT '模板名称',
  `sign_name` varchar(50) NOT NULL DEFAULT '' COMMENT '签名',
  `is_enable` int(11) NOT NULL DEFAULT '0' COMMENT '是否开启',
  `modify_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1170 COMMENT='通知模版设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice_template`
--

LOCK TABLES `sys_notice_template` WRITE;
/*!40000 ALTER TABLE `sys_notice_template` DISABLE KEYS */;
INSERT INTO `sys_notice_template` VALUES (41,'sms',0,'after_register','2嘎嘎嘎','','2222拒绝',1,'2017-07-14 18:17:48'),(42,'sms',0,'register_validate','SMS_75080025','','阿里云短信测试专用',0,'2017-07-14 18:17:48'),(43,'sms',0,'recharge_success','1112','','1112',0,'2017-07-14 18:17:48'),(44,'sms',0,'confirm_order','','','',0,'2017-07-14 18:17:48'),(45,'sms',0,'pay_success','2','','2222',0,'2017-07-14 18:17:48'),(46,'sms',0,'create_order','ww','','ww',0,'2017-07-14 18:17:48'),(47,'sms',0,'order_deliver','11','','111',0,'2017-07-14 18:17:48'),(48,'email',0,'after_register','111','注册\n','',1,'2017-07-15 16:54:40'),(49,'email',0,'register_validate','商场验证','注册苏烟{验证码}\n','',0,'2017-07-15 16:54:40'),(50,'email',0,'recharge_success','hhh','hhh\n','',1,'2017-07-15 16:54:40'),(51,'email',0,'confirm_order','','hhhhhh\n','',0,'2017-07-15 16:54:40'),(52,'email',0,'pay_success','','\n','',0,'2017-07-15 16:54:41'),(53,'email',0,'create_order','','\n','',0,'2017-07-15 16:54:41'),(54,'email',0,'order_deliver','','\n','',0,'2017-07-15 16:54:41'),(55,'email',0,'forgot_password','niushop找回密码','找回密码{验证码}\n','',0,'2017-07-15 16:54:41'),(56,'sms',0,'forgot_password','SMS_70250233','','NiuShop开源商城',1,'2017-07-14 18:17:48'),(57,'sms',0,'bind_mobile','SMS_70250233','','NiuShop开源商城',1,'2017-07-14 18:17:48'),(58,'email',0,'bind_email','niushop商城邮箱绑定','尊敬的{用户名称}，您正在进行niusho商城绑定邮箱操作，您的验证码为{验证码}。\n','',0,'2017-07-15 16:54:41');
/*!40000 ALTER TABLE `sys_notice_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice_template_item`
--

DROP TABLE IF EXISTS `sys_notice_template_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_notice_template_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(50) NOT NULL DEFAULT '' COMMENT '项名称',
  `show_name` varchar(50) NOT NULL DEFAULT '' COMMENT '显示名称',
  `replace_name` varchar(50) NOT NULL DEFAULT '' COMMENT '替换字段名字',
  `type_ids` varchar(255) NOT NULL COMMENT '关联type类型',
  `order` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1820 COMMENT='通知模板项';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice_template_item`
--

LOCK TABLES `sys_notice_template_item` WRITE;
/*!40000 ALTER TABLE `sys_notice_template_item` DISABLE KEYS */;
INSERT INTO `sys_notice_template_item` VALUES (1,'商场名称','{商场名称}','shop_name','after_register,recharge_success,create_order,pay_success,confirm_order,order_deliver',0),(2,'用户名称','{用户名称}','user_name','after_register,recharge_success,create_order,pay_success,confirm_order,order_deliver,bind_mobile,bind_email',1),(5,'商品名称','{商品名称}','goods_name','order_deliver',4),(6,'商品规格','{商品规格}','goods_sku','order_deliver',5),(7,'主订单号','{主订单号}','order_no','create_order,pay_success,confirm_order,order_deliver',6),(8,'订单金额','{订单金额}','order_money','create_order,pay_success,confirm_order,order_deliver',7),(9,'商品金额','{商品金额}','goods_money','create_order,pay_success,order_deliver',8),(10,'验证码','{验证码}','number','register_validate,forgot_password,bind_mobile,bind_email',9),(11,'充值金额','{充值金额}','recharge_money','recharge_success',0),(12,'物流公司','{物流公司}','express_company','order_deliver',0),(14,'快递编号','{快递编号}','express_no','order_deliver',0);
/*!40000 ALTER TABLE `sys_notice_template_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice_template_type`
--

DROP TABLE IF EXISTS `sys_notice_template_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_notice_template_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(50) NOT NULL DEFAULT '' COMMENT '模板名称',
  `template_code` varchar(50) NOT NULL DEFAULT '' COMMENT '模板编号',
  `template_type` varchar(50) NOT NULL DEFAULT '' COMMENT '模板类型',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=2340 COMMENT='通知模板类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice_template_type`
--

LOCK TABLES `sys_notice_template_type` WRITE;
/*!40000 ALTER TABLE `sys_notice_template_type` DISABLE KEYS */;
INSERT INTO `sys_notice_template_type` VALUES (1,'注册成功','after_register','all'),(2,'注册验证','register_validate','all'),(3,'充值成功','recharge_success','all'),(4,'确认订单','confirm_order','all'),(5,'付款成功','pay_success','all'),(6,'下单成功','create_order','all'),(7,'订单发货','order_deliver','all'),(8,'找回密码','forgot_password','all'),(10,'手机绑定','bind_mobile','sms'),(11,'邮箱绑定','bind_email','email');
/*!40000 ALTER TABLE `sys_notice_template_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_province`
--

DROP TABLE IF EXISTS `sys_province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_province` (
  `province_id` int(11) NOT NULL AUTO_INCREMENT,
  `area_id` tinyint(4) NOT NULL DEFAULT '0',
  `province_name` varchar(255) NOT NULL DEFAULT '',
  `sort` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`province_id`),
  KEY `IDX_g_province_ProvinceName` (`province_name`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=481;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_province`
--

LOCK TABLES `sys_province` WRITE;
/*!40000 ALTER TABLE `sys_province` DISABLE KEYS */;
INSERT INTO `sys_province` VALUES (1,2,'北京市',1),(2,2,'天津市',0),(3,2,'河北省',0),(4,2,'山西省',0),(5,2,'内蒙古自治区',0),(6,5,'辽宁省',0),(7,5,'吉林省',0),(8,5,'黑龙江省',0),(9,1,'上海市',0),(10,1,'江苏省',0),(11,1,'浙江省',0),(12,1,'安徽省',0),(13,3,'福建省',0),(14,1,'江西省',0),(15,2,'山东省',0),(16,4,'河南省',0),(17,4,'湖北省',0),(18,4,'湖南省',0),(19,3,'广东省',0),(20,3,'广西壮族自治区',0),(21,3,'海南省',0),(22,7,'重庆市',0),(23,7,'四川省',0),(24,7,'贵州省',0),(25,7,'云南省',0),(26,7,'西藏自治区',0),(27,6,'陕西省',0),(28,6,'甘肃省',0),(29,6,'青海省',0),(30,6,'宁夏回族自治区',0),(31,6,'新疆维吾尔自治区',0),(32,8,'香港特别行政区',0),(33,8,'澳门特别行政区',0),(34,8,'台湾省',0);
/*!40000 ALTER TABLE `sys_province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_question`
--

DROP TABLE IF EXISTS `sys_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catid` int(11) DEFAULT NULL,
  `catname` varchar(45) DEFAULT NULL,
  `question` varchar(45) DEFAULT NULL,
  `answer` text,
  `show` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `INDEX_CATID` (`catid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_question`
--

LOCK TABLES `sys_question` WRITE;
/*!40000 ALTER TABLE `sys_question` DISABLE KEYS */;
INSERT INTO `sys_question` VALUES (8,3,'团购问题','成团失败，款项问题','<p>成团失败后，您的付款将按原路退还，您可以在订单详情的“退款纪录”中查看退款情况。<br/></p>',1),(9,7,'推广返利','成为推广员有什么好处','<p><br/></p><h1 label=\"标题居中\" style=\"font-size: 32px; font-weight: bold; border-bottom: 2px solid rgb(204, 204, 204); padding: 0px 4px 0px 0px; text-align: center; margin: 0px 0px 20px;\"><span style=\"font-size: 24px;\">返利说明</span></h1><p><br/></p><ol class=\" list-paddingleft-2\" style=\"list-style-type: decimal;\"><li><p><span style=\"font-size: 14px;\">成为推广员后，自身购买商品时，能获取4.8%的佣金返现。</span></p></li><li><p><span style=\"font-size: 14px;\">用户通过推广员分享的页面或者扫描推广员推广码购买商品时，推广员能获取订单金额4.8%的佣金返现。</span></p></li><li><p><span style=\"font-size: 14px;\">用户通过推广员分享页面，或者扫描推广员推广码成为平台新用户后，推广员可以获得用户购买活动的1.2%返现。</span></p></li></ol><p><br/></p><p><span style=\"font-size: 14px;\"><br/></span></p><p><span style=\"font-size: 14px;\"><br/></span></p><p><span style=\"font-size: 14px;\"><br/></span></p><p><span style=\"font-size: 14px;\"><br/></span></p><p><br/></p><p><br/></p><p><br/></p>',1),(10,8,'订单相关','卖家还未发货,不想要了,如何退款？','<p style=\"text-align: center;\">&nbsp; 订单支付后，可以在订单详情页面选择“申请退款”来放弃订单</p><p><br/></p><p style=\"text-align:center\"><img src=\"http://www.imgtqbu.weiruikj.cn/FuyDUioRBZQ9gTVTqdCFhsspOKQZ\"/></p><p><br/></p><p style=\"text-align: center;\">特别提示:由于发货更新可能存在延迟，建议您在申请退款前首先与卖家联系，确认是否发货。<br/></p>',1),(11,8,'订单相关','如何修改地址？','<p style=\"text-align: center;\">创建订单或者接受礼物时地址不小心填写错误的情况下，可以在订单详情界面选择&quot;修改地址&quot;来进行地址修改申请。</p><p><br/></p><p style=\"text-align: center;\"><br/></p><p><img src=\"http://www.imgtqbu.weiruikj.cn/FuyDUioRBZQ9gTVTqdCFhsspOKQZ\"/><br/></p><p><br/></p><p style=\"text-align: center;\">&nbsp; 在申请前请联系卖家说明情况，并添加正确的收货地址或者修改收货地址，并告知卖家，卖家可在后台为您完成地址的修改。</p><p style=\"text-align: center;\">特别提示：因发货信息录入存在时间差或者其他原因导致的费用问题请与卖家协商解决。</p>',1),(12,7,'推广返利','推广细则','<ol class=\" list-paddingleft-2\" style=\"list-style-type: decimal;\"><li><p>推广员购买直接返利，他人分享不再有效。</p></li><li><p>分享有效期为24个小时。</p></li><li><p>一个订单最多只有一个推广员获得返现，后来的分享会覆盖之前的。</p></li><li><p>推广员编写的商品评价或者发起的个人抽奖被非推广员用户分享同样获得分享效果。</p></li><li><p>退款（包括部分和全部退款），送礼免单订单不享受推广返利。为了鼓励更低折扣开展超级团购活动，超级团购订单不享受推广返利，请谅解。</p></li><li><p>系统为推广员生成的推广码卡片被任何人分享都被视为推广员的分享，请不要分享其他推广员的推广码哦。</p></li><li><p>推广收益在订单收货确认后7日结算，请耐心等候。</p><p><br/></p></li></ol>',1),(13,4,'送礼问题','礼物接受者不是想送的人？','<p>礼物被接受后，发现订单中收礼人并不是送给的人，存在这种情况，可能是一下原因：</p><ol class=\" list-paddingleft-2\" style=\"list-style-type: decimal;\"><li><p>送出卡片时，发送给多人或者群里的话，礼物会被第一个人领取。</p></li><li><p>您送出的礼物，收礼人可能会将该礼品转发给自己的朋友。<br/></p></li></ol>',1),(14,4,'送礼问题','礼物不要送出或者收礼人不想要怎么办？','<p>如果下单后，收礼人不喜欢这个礼物，可以选择不送出或者收礼人不接受，在等待48个小时后，系统会因礼物送出超时自动给您全额退款。</p>',1),(15,4,'送礼问题','送礼预付运费是怎么回事？','<p>当您购买用来送礼的商品不是全国包邮的，需要您在购买时支付邮费模板对应的邮费，最终系统会根据收礼者实际的邮寄地址来判断是否返回预付运费。</p>',1),(16,1,'活动问题','超级团购购买时没有按照显示的折扣计费？','<p>超级团购收费方式为参团时按照商品的团购价支付，最后系统按照实际成团折扣对差价进行退款</p>',1),(17,1,'活动问题','抽奖奖品与活动图片不符？','<p>参加抽奖活动的商品如果是多种规格商品的话，可能存在展示图片跟最终送出奖品不一样的情况，请您注意奖品备注信息的说明。</p>',1),(18,8,'订单相关','未支付的订单系统中找不到了？','<p>订单创建后，可在30分钟内支付，超时未支付的订单将继续保留24个小时后系统将会删除，在此期间，你想要继续购买的话，可以在订单选择重新购买。如果订单已经被删除，您可以在足迹中找到自己的商品浏览记录。</p><p>如果遇到自己喜欢的商品，不妨收藏一下哦。</p>',1),(19,7,'推广返利','如何成为推广员？','<p>成为平台推广员有两种途径：</p><ol class=\" list-paddingleft-2\" style=\"list-style-type: decimal;\"><li><p>消费满698元后即可自动申请成为推广员。</p></li><li><p>平台会在线下或者线上活动放出部分激活码，使用激活码可以直接成为推广员。</p></li></ol>',1),(20,8,'订单相关','为什么我不能评价订单？','<p>目前订单的评价只开放给推广员，敬请谅解。</p>',1),(21,6,'售后退款','送礼订单为什么退款给送礼人？','<p>平台整个支付体系依赖微信支付完成，目前微信支付的退款操作只能按照原路径退还，所以目前礼物订单退款售后实际退款只能退款给送礼人。</p>',1),(22,1,'活动问题','不同方式的抽奖有什么规则？','<p><strong>定时开奖:</strong><br/></p><p><span style=\"color: rgb(191, 191, 191);\">定时开奖会在抽奖活动结束时间从所有参与者中随机选取礼品分数的中奖者，并会将中奖者展示在开奖区域。</span></p><p><strong>手气抽奖:</strong></p><p><span style=\"color: rgb(191, 191, 191);\">手气抽奖是一种即时参与的抽奖，用户每次参与按照发起者设定概率判定中奖，抽奖结果后台即时计算，直接展示抽奖结果。如果看到自己喜欢的抽奖奖品记得预约哦，不然奖品就被别人抢走啦。</span></p><p><strong>助力抽奖:</strong></p><p><span style=\"color: rgb(191, 191, 191);\">助力抽奖是在手气抽奖的基础上，用户在参与之后，通过邀请助力的方式邀请好友帮你试试手气的方式中奖，开奖逻辑跟手气抽奖一致。不同在于帮你助力的好友越多，你将获得更多的中奖概率，遇到喜欢的奖品，参与后记得邀请好友帮忙哦。</span></p><p><strong>满人开奖:</strong></p><p><span style=\"color: rgb(191, 191, 191);\">满人开奖是在参与抽奖人数达到设定的人数后，后台自动根据随机算法计算中奖用户，并公布抽奖结果。</span></p><p><strong>手动开奖:</strong></p><p><span style=\"color: rgb(191, 191, 191);\">手动开奖为发起者人为操作触发开奖行为，开奖同样为后台根据随机算法计算中奖用户，并公布抽奖结果。</span></p>',1),(23,8,'订单相关','支付成功订单仍然显示待支付？','<p>因支付完毕后，后台需要跟微信支付系统确认您支付的订单，所以会存在一定的时间差。</p><p>如果出现您已经支付成功，跳转的订单状态仍然为未支付，请您过一小段时间，重新进入订单详情查看状态，如果还是未支付，您可以点击支付查询按钮发起订单支付的查询，如果仍有异常，请及时联系客服。</p>',1),(24,7,'推广返利','成为推广员后如何推广？','<ol class=\" list-paddingleft-2\" style=\"list-style-type: decimal;\"><li><p>推广员所有分享的页面都能为您带来推广收益，建议你经常转发抽奖，超级团购，优惠，免单等活动UI。</p></li><li><p>推广员可以点击推广码生成各种各种风格的推广码，您可以展示在朋友圈，张贴在经营场所等。</p></li><li><p>推广员发起的抽奖被非推广用户分享时，发起者同样能获得分享奖励，发起抽奖不仅能给您带来宣传效果，还可能给您带来可观的推广收益哦。<br/></p></li></ol>',1),(25,1,'活动问题','中奖领奖相关说明','<p>如果为平台发起的抽奖，中奖后需要选择地址领取，平台将会在您填写完地址后，尽快为您配送。</p><p>如果是个人发起的抽奖，根据发起人设置的配送模式，如果为线上配送的话，也需要您填写地址，由发起者根据您填写的地址为您配送，其他配送模式，您可以通过拨打中奖下方的发起者联系方式，自行约定领取。</p>',1);
/*!40000 ALTER TABLE `sys_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_question_category`
--

DROP TABLE IF EXISTS `sys_question_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_question_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catname` varchar(45) DEFAULT NULL,
  `logo` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_question_category`
--

LOCK TABLES `sys_question_category` WRITE;
/*!40000 ALTER TABLE `sys_question_category` DISABLE KEYS */;
INSERT INTO `sys_question_category` VALUES (1,'活动问题','http://www.imgtqbu.weiruikj.cn/FsF93A4Xq1OUldiu8eBcEKBdVxBa'),(3,'团购问题','http://www.imgtqbu.weiruikj.cn/Fq0rN16Ht0CP5USSuohpjDNDHRnA'),(4,'送礼问题','http://www.imgtqbu.weiruikj.cn/Ftmzq1Afls2mXnu9V2YrVn2pFsU-'),(6,'售后退款','http://www.imgtqbu.weiruikj.cn/Frn2hwpumkSNduYjN-2KNaZDIDPm'),(7,'推广返利','http://www.imgtqbu.weiruikj.cn/FiStvVT2OXWu-o3ZshQXD6NCSkl8'),(8,'订单相关','http://www.imgtqbu.weiruikj.cn/Fq3OAdmQqVnte1UkcRfCNSHn9qzl');
/*!40000 ALTER TABLE `sys_question_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_user` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `instance_id` int(11) NOT NULL DEFAULT '0' COMMENT '实例信息',
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_password` varchar(255) NOT NULL DEFAULT '' COMMENT '用户密码（MD5）',
  `user_status` int(11) NOT NULL DEFAULT '1' COMMENT '用户状态  用户状态默认为1',
  `user_headimg` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `is_system` int(1) NOT NULL DEFAULT '0' COMMENT '是否是系统后台用户 0 不是 1 是',
  `is_member` int(11) NOT NULL DEFAULT '0' COMMENT '是否是前台会员',
  `user_tel` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `user_tel_bind` int(1) DEFAULT '0' COMMENT '手机号是否绑定 0 未绑定 1 绑定 ',
  `user_qq` varchar(255) DEFAULT '' COMMENT 'qq号',
  `qq_openid` varchar(255) DEFAULT '' COMMENT 'qq互联id',
  `qq_info` varchar(2000) DEFAULT '' COMMENT 'qq账号相关信息',
  `user_email` varchar(50) DEFAULT '' COMMENT '邮箱',
  `user_email_bind` int(1) DEFAULT '0' COMMENT '是否邮箱绑定',
  `wx_openid` varchar(255) DEFAULT NULL COMMENT '微信用户openid',
  `wx_sub_time` datetime DEFAULT NULL COMMENT '微信用户关注时间',
  `wx_notsub_time` datetime DEFAULT NULL COMMENT '微信用户取消关注时间',
  `wx_is_sub` int(1) NOT NULL DEFAULT '0' COMMENT '微信用户是否关注',
  `wx_info` varchar(2000) DEFAULT NULL COMMENT '微信用户信息',
  `other_info` varchar(255) DEFAULT NULL COMMENT '附加信息',
  `reg_time` datetime DEFAULT NULL COMMENT '注册时间',
  `current_login_ip` varchar(255) DEFAULT NULL COMMENT '当前登录ip',
  `current_login_time` datetime DEFAULT NULL COMMENT '当前登录时间',
  `current_login_type` int(11) DEFAULT NULL COMMENT '当前登录的操作终端类型',
  `last_login_time` datetime DEFAULT NULL COMMENT '上次登录时间',
  `last_login_ip` varchar(255) DEFAULT NULL COMMENT '上次登录ip',
  `last_login_type` int(11) DEFAULT NULL COMMENT '上次登录的操作终端类型',
  `login_num` int(11) NOT NULL DEFAULT '0' COMMENT '登录次数',
  `real_name` varchar(50) DEFAULT '' COMMENT '真实姓名',
  `sex` smallint(6) DEFAULT '0' COMMENT '性别 0保密 1男 2女',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `location` varchar(255) DEFAULT '' COMMENT '所在地',
  `nick_name` varchar(50) DEFAULT '牛酷用户' COMMENT '用户昵称',
  `wx_unionid` varchar(255) NOT NULL DEFAULT '' COMMENT '微信unionid',
  `qrcode_template_id` int(11) NOT NULL DEFAULT '0' COMMENT '模板id',
  `securitypwd` varchar(45) DEFAULT NULL,
  `token` varchar(128) DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `INDEX_SHOPID` (`instance_id`),
  KEY `INDEX_USER` (`user_name`),
  KEY `INDEX_TOKEN` (`wx_openid`)
) ENGINE=InnoDB AUTO_INCREMENT=307 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=372 COMMENT='系统用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (87,0,'wjbtqxj','e10adc3949ba59abbe56e057f20f883e',1,'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIrFAmYNMgbqGTrzEyfPrEclDFHJbRAy9DRu19ZibAQ4hcISicjXUpSLM6ia6FKQicNPk0iaiaicaeUJicLHQ/132',1,1,'18735102769',0,'','','','',0,'','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'','','2017-06-14 17:16:40','101.36.81.190','2019-06-20 11:56:30',1,'2019-06-20 11:55:42','101.36.81.190',1,0,'',0,'1996-06-22','','admin','',79,'123456',''),(293,45,'hulinzong','e10adc3949ba59abbe56e057f20f883e',1,'',1,0,'',0,'','','','',0,'',NULL,NULL,0,'','','2018-04-28 10:13:00','123.13.253.21','2018-06-18 18:52:29',1,'2018-05-20 21:54:39','123.9.138.16',1,0,'',0,NULL,'','hulinzong','',0,'123456',''),(294,46,'hongyanzong','e10adc3949ba59abbe56e057f20f883e',1,'',1,0,'',0,'','','','',0,'',NULL,NULL,0,'','','2018-05-07 19:35:48','115.53.115.150','2018-05-19 16:35:05',1,'2018-05-15 16:25:42','218.28.73.69',1,0,'',0,NULL,'','hongyanzong','',0,'123456',''),(295,47,'dawanjun','e10adc3949ba59abbe56e057f20f883e',1,'',1,0,'',0,'','','','',0,'',NULL,NULL,0,'','','2018-05-19 15:57:38',NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,NULL,'','dawanjun','',0,'123456',''),(296,48,'huiminxiaodian','e10adc3949ba59abbe56e057f20f883e',1,'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIrFAmYNMgbqGTrzEyfPrEclDFHJbRAy9DRu19ZibAQ4hcISicjXUpSLM6ia6FKQicNPk0iaiaicaeUJicLHQ/132',1,0,'',0,'','','','',0,'oLYBW46tqnyUFV4mqcIP4ALKxkLE',NULL,NULL,0,'','','2018-05-19 16:34:28','123.9.163.100','2019-03-03 19:34:15',1,'2019-02-20 15:34:11','42.227.89.161',1,0,'',0,NULL,'','huiminxiaodian','',0,'123456','4AF6CC62E2942AABAD465C82DE11E927'),(306,53,'tqxjakshongyan','e10adc3949ba59abbe56e057f20f883e',1,'',1,0,'',0,'','','','',0,'',NULL,NULL,0,'','','2019-01-04 15:40:59','101.36.81.190','2019-06-20 11:57:07',1,'2019-01-24 14:17:33','123.9.162.243',1,0,'',0,NULL,'','tqxjakswjb','',0,'123456','');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_admin`
--

DROP TABLE IF EXISTS `sys_user_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_user_admin` (
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'user用户ID',
  `admin_name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户姓名',
  `group_id_array` int(11) NOT NULL DEFAULT '0' COMMENT '系统用户组',
  `is_admin` int(1) NOT NULL DEFAULT '0' COMMENT '是否是系统管理员组',
  `admin_status` int(11) DEFAULT '1' COMMENT '状态 默认为1',
  `desc` text COMMENT '附加信息',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=910 COMMENT='后台管理员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_admin`
--

LOCK TABLES `sys_user_admin` WRITE;
/*!40000 ALTER TABLE `sys_user_admin` DISABLE KEYS */;
INSERT INTO `sys_user_admin` VALUES (63,'lg',54,0,1,NULL),(87,'admin',10,1,1,NULL),(290,'',55,0,1,NULL),(292,'',56,0,1,NULL),(293,'',57,0,1,NULL),(294,'',58,0,1,NULL),(295,'',59,0,1,NULL),(296,'',60,0,1,NULL),(299,'',62,0,1,NULL),(300,'',63,0,1,NULL),(301,'',64,0,1,NULL),(306,'',69,0,1,NULL);
/*!40000 ALTER TABLE `sys_user_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_group`
--

DROP TABLE IF EXISTS `sys_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_user_group` (
  `group_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `instance_id` int(11) NOT NULL DEFAULT '1' COMMENT '实例ID',
  `group_name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户组名称',
  `group_status` int(11) NOT NULL DEFAULT '1' COMMENT '用户组状态',
  `is_system` int(1) NOT NULL DEFAULT '0' COMMENT '是否是系统用户组',
  `module_id_array` text NOT NULL COMMENT '系统模块ID组，用，隔开',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `desc` text COMMENT '描述',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=963 COMMENT='系统用户组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_group`
--

LOCK TABLES `sys_user_group` WRITE;
/*!40000 ALTER TABLE `sys_user_group` DISABLE KEYS */;
INSERT INTO `sys_user_group` VALUES (9,0,'普通用户',1,0,'535,537,536,538,539,540,543,606,541,542,607,546,557,575,710,547,552,553,554,569,570,571,572,592,652,548,555,581,605,608,647,681,682,683,687,689,690,691,695,696,697,698,653,588,589,654,655,658,656,577,591,700,701,657,659,550,551,660,661,662,699,590,544,545,702,703,705,707,709,711,556,565,566,567,568,584,585,586,645,664,665,558,559,562,563,580,671,675,582,583,663,706,708,713,714,593,594,595,596,597,598,599,644,650,651,636,637,638,639,640,641,643,646,715','2017-06-14 09:36:51','2017-07-11 15:46:10',''),(10,0,'管理员',1,0,'120,121,122,123,129,126,127,144,360,128,133,149,139,169,151,171,172,210,334,478,516,517,179,180,186,187,195,196,197,198,199,200,201,202,203,446,469,184,185,190,194,189,191,192,487,533,534,471,472,528,529,530,218,418,474,678,679,680,10006,409,403,405,454,457,459,462,463,460,684,726,727,729,730,732,467,515','2017-06-14 15:59:08','2017-07-21 11:39:29',''),(54,1,'管理员组',1,1,'120,121,122,123,129,126,127,144,360,128,133,149,139,169,151,171,172,210,334,478,516,517,179,180,186,187,195,196,197,198,199,200,201,202,203,446,469,184,185,190,194,189,191,192,487,533,534,471,472,528,529,530,218,418,474,678,679,680,10006,409,403,405,454,457,459,462,463,460,684,726,727,729,730,732,467,515','2017-07-13 12:02:15','0000-00-00 00:00:00',NULL),(55,41,'管理员组',1,1,'120,121,122,123,129,126,127,144,360,128,133,149,139,169,151,171,172,210,334,478,516,517,179,180,186,187,195,196,197,198,199,200,201,202,203,446,469,184,185,190,194,189,191,192,487,533,534,471,472,528,529,530,218,418,474,678,679,680,10006,409,403,405,454,457,459,462,463,460,684,726,727,729,730,732,467,515','2017-07-14 10:07:39','0000-00-00 00:00:00',NULL),(56,42,'管理员组',1,1,'120,121,122,123,129,126,127,144,360,128,133,149,139,169,151,171,172,210,334,478,516,517,179,180,186,187,195,196,197,198,199,200,201,202,203,446,469,184,185,190,194,189,191,192,487,533,534,471,472,528,529,530,218,418,474,678,679,680,10006,409,403,405,454,457,459,462,463,460,684,726,727,729,730,732,467,515','2017-07-17 20:02:59','0000-00-00 00:00:00',NULL),(57,45,'管理员组',1,1,'120,121,122,123,129,126,127,144,360,128,133,149,139,169,151,171,172,210,334,478,516,517,179,180,186,187,195,196,197,198,199,200,201,202,203,446,469,184,185,190,194,189,191,192,487,533,534,471,472,528,529,530,218,418,474,678,679,680,10006,409,403,405,454,457,459,462,463,460,684,726,727,729,730,732,467,515','2018-04-28 10:20:03',NULL,NULL),(58,46,'管理员组',1,1,'120,121,122,123,129,126,127,144,360,128,133,149,139,169,151,171,172,210,334,478,516,517,179,180,186,187,195,196,197,198,199,200,201,202,203,446,469,184,185,190,194,189,191,192,487,533,534,471,472,528,529,530,218,418,474,678,679,680,10006,409,403,405,454,457,459,462,463,460,684,726,727,729,730,732,467,515','2018-05-07 19:35:48',NULL,NULL),(59,47,'管理员组',1,1,'120,121,122,123,129,126,127,144,360,128,133,149,139,169,151,171,172,210,334,478,516,517,179,180,186,187,195,196,197,198,199,200,201,202,203,446,469,184,185,190,194,189,191,192,487,533,534,471,472,528,529,530,218,418,474,678,679,680,10006,409,403,405,454,457,459,462,463,460,684,726,727,729,730,732,467,515','2018-05-19 15:57:38',NULL,NULL),(60,48,'管理员组',1,1,'120,121,122,123,129,126,127,144,360,128,133,149,139,169,151,171,172,210,334,478,516,517,179,180,186,187,195,196,197,198,199,200,201,202,203,446,469,184,185,190,194,189,191,192,487,533,534,471,472,528,529,530,218,418,474,678,679,680,10006,409,403,405,454,457,459,462,463,460,684,726,727,729,730,732,467,515','2018-05-19 16:34:28',NULL,NULL),(61,49,'管理员组',1,1,'120,121,122,123,129,126,127,144,360,128,133,149,139,169,151,171,172,210,334,478,516,517,179,180,186,187,195,196,197,198,199,200,201,202,203,446,469,184,185,190,194,189,191,192,487,533,534,471,472,528,529,530,218,418,474,678,679,680,10006,409,403,405,454,457,459,462,463,460,684,726,727,729,730,732,467,515','2018-06-14 20:41:14',NULL,NULL),(62,50,'管理员组',1,1,'120,121,122,123,129,126,127,144,360,128,133,149,139,169,151,171,172,210,334,478,516,517,179,180,186,187,195,196,197,198,199,200,201,202,203,446,469,184,185,190,194,189,191,192,487,533,534,471,472,528,529,530,218,418,474,678,679,680,10006,409,403,405,454,457,459,462,463,460,684,726,727,729,730,732,467,515','2018-06-14 20:42:40',NULL,NULL),(63,51,'管理员组',1,1,'120,121,122,123,129,126,127,144,360,128,133,149,139,169,151,171,172,210,334,478,516,517,179,180,186,187,195,196,197,198,199,200,201,202,203,446,469,184,185,190,194,189,191,192,487,533,534,471,472,528,529,530,218,418,474,678,679,680,10006,409,403,405,454,457,459,462,463,460,684,726,727,729,730,732,467,515','2018-06-14 20:45:32',NULL,NULL),(64,52,'管理员组',1,1,'120,121,122,123,129,126,127,144,360,128,133,149,139,169,151,171,172,210,334,478,516,517,179,180,186,187,195,196,197,198,199,200,201,202,203,446,469,184,185,190,194,189,191,192,487,533,534,471,472,528,529,530,218,418,474,678,679,680,10006,409,403,405,454,457,459,462,463,460,684,726,727,729,730,732,467,515','2018-06-14 20:49:20',NULL,NULL),(69,53,'管理员组',1,1,'120,121,122,123,129,126,127,144,360,128,133,149,139,169,151,171,172,210,334,478,516,517,179,180,186,187,195,196,197,198,199,200,201,202,203,446,469,184,185,190,194,189,191,192,487,533,534,471,472,528,529,530,218,418,474,678,679,680,10006,409,403,405,454,457,459,462,463,460,684,726,727,729,730,732,467,515','2019-01-04 15:41:00',NULL,NULL);
/*!40000 ALTER TABLE `sys_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_log`
--

DROP TABLE IF EXISTS `sys_user_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_user_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '操作用户ID',
  `is_system` int(11) NOT NULL DEFAULT '1' COMMENT '是否是后台操作',
  `controller` varchar(255) NOT NULL DEFAULT '' COMMENT '操作控制器',
  `method` varchar(255) NOT NULL DEFAULT '' COMMENT '操作方案',
  `data` text COMMENT '传输数据',
  `ip` varchar(255) DEFAULT NULL COMMENT 'ip地址',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=82 COMMENT='用户操作日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_log`
--

LOCK TABLES `sys_user_log` WRITE;
/*!40000 ALTER TABLE `sys_user_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_user_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_web_style`
--

DROP TABLE IF EXISTS `sys_web_style`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_web_style` (
  `style_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `style_name` varchar(50) NOT NULL DEFAULT '' COMMENT '样式名称',
  `style_path` varchar(255) NOT NULL DEFAULT '' COMMENT '样式路径',
  `stye_img` varchar(255) NOT NULL DEFAULT '' COMMENT '样式图片路径',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `desc` text COMMENT '备注',
  PRIMARY KEY (`style_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='网站前台样式表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_web_style`
--

LOCK TABLES `sys_web_style` WRITE;
/*!40000 ALTER TABLE `sys_web_style` DISABLE KEYS */;
INSERT INTO `sys_web_style` VALUES (1,'热情洋溢','default','','0000-00-00 00:00:00','2017-07-07 17:16:15','2017/7/7 星期五 下午 5:16:19'),(2,'蓝色清爽','blue','','2017-07-07 17:16:15','2017-07-07 17:16:19',NULL);
/*!40000 ALTER TABLE `sys_web_style` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_website`
--

DROP TABLE IF EXISTS `sys_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_website` (
  `website_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '网站标题',
  `logo` varchar(255) NOT NULL DEFAULT '' COMMENT '网站logo',
  `web_desc` varchar(1000) NOT NULL DEFAULT '' COMMENT '网站描述',
  `key_words` varchar(255) NOT NULL DEFAULT '' COMMENT '网站关键字',
  `web_icp` varchar(255) NOT NULL DEFAULT '' COMMENT '网站备案号',
  `style_id` int(10) NOT NULL DEFAULT '0' COMMENT '网站风格',
  `web_address` varchar(255) NOT NULL DEFAULT '' COMMENT '网站联系地址',
  `web_qrcode` varchar(255) NOT NULL DEFAULT '' COMMENT '网站公众号二维码',
  `web_url` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺网址',
  `web_email` varchar(255) NOT NULL DEFAULT '' COMMENT '网站邮箱',
  `web_phone` varchar(255) NOT NULL DEFAULT '' COMMENT '网站联系方式',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '网站创建时间',
  `modify_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '网站修改时间',
  `web_qq` varchar(255) NOT NULL DEFAULT '' COMMENT '网站qq号',
  `web_weixin` varchar(255) NOT NULL DEFAULT '' COMMENT '网站微信号',
  `web_status` int(10) NOT NULL DEFAULT '1' COMMENT '网站运营状态1.开启 2.关闭 ',
  `third_count` text NOT NULL COMMENT '第三方统计',
  `close_reason` varchar(255) NOT NULL DEFAULT '' COMMENT '站点关闭原因',
  `wap_status` int(10) NOT NULL DEFAULT '1' COMMENT '手机端运营状态 1.开启2.关闭',
  PRIMARY KEY (`website_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='网站信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_website`
--

LOCK TABLES `sys_website` WRITE;
/*!40000 ALTER TABLE `sys_website` DISABLE KEYS */;
INSERT INTO `sys_website` VALUES (1,'niushop开源商城','upload/common/1497923663.jpg','','keywords2','0300259',2,'山西省太原市','upload/common/1500630330.jpg','http://demo.niushop.com.cn/shop/index/index.html','1518079521@qq.com','400-886-7993','2016-10-26 11:21:52','2017-07-21 17:45:32','1518079521','y159753',1,'wu855热女','对不起，牛酷商城维护中，大家敬请期待...',1);
/*!40000 ALTER TABLE `sys_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_account`
--

DROP TABLE IF EXISTS `zytc_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_account` (
  `account_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '账户ID',
  `account_order_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单入账总额',
  `account_return` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '平台抽取利润总额',
  `account_withdraw` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商家提现总额',
  `account_deposit` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '保证金总额',
  `account_assistant` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '招商员支付总额',
  `account_user_withdraw` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '会员提现金额',
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='商城资金统计';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_account`
--

LOCK TABLES `zytc_account` WRITE;
/*!40000 ALTER TABLE `zytc_account` DISABLE KEYS */;
INSERT INTO `zytc_account` VALUES (1,3760.00,188.00,0.00,0.00,0.00,0.00);
/*!40000 ALTER TABLE `zytc_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_account_order_records`
--

DROP TABLE IF EXISTS `zytc_account_order_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_account_order_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `serial_no` varchar(50) NOT NULL DEFAULT '' COMMENT '流水号',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '对应金额',
  `account_type` tinyint(1) NOT NULL COMMENT '账户类型',
  `type_alis_id` int(11) NOT NULL COMMENT '关联ID',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '简介',
  PRIMARY KEY (`id`),
  KEY `INDEX_SHOPID` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='金额账户记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_account_order_records`
--

LOCK TABLES `zytc_account_order_records` WRITE;
/*!40000 ALTER TABLE `zytc_account_order_records` DISABLE KEYS */;
INSERT INTO `zytc_account_order_records` VALUES (1,'170721052056113',1,3760.00,1,2,'2017-07-21 17:20:56','店铺订单支付金额3760元, 订单号为：20170721172001000000001, 支付方式【在线支付】。');
/*!40000 ALTER TABLE `zytc_account_order_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_account_period`
--

DROP TABLE IF EXISTS `zytc_account_period`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_account_period` (
  `period_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '账户ID',
  `period_year` int(10) NOT NULL COMMENT '账期年份',
  `period_month` int(10) NOT NULL COMMENT '账期月份',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `account_profit` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '账期总营业额',
  `account_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '账期总发生余额',
  `account_return` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '账期利润总额',
  `account_deposit` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '账期保证金总额',
  `account_order` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '账期订单总额',
  `account_withdraw` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '账期店铺提现总额',
  `account_shop` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '账期店铺总发生额',
  `account_shop_withdraw` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '账期店铺总提现额',
  PRIMARY KEY (`period_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='商城账期结算表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_account_period`
--

LOCK TABLES `zytc_account_period` WRITE;
/*!40000 ALTER TABLE `zytc_account_period` DISABLE KEYS */;
/*!40000 ALTER TABLE `zytc_account_period` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_account_records`
--

DROP TABLE IF EXISTS `zytc_account_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_account_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `serial_no` varchar(50) NOT NULL DEFAULT '' COMMENT '流水号',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '对应金额',
  `account_type` tinyint(1) NOT NULL COMMENT '账户类型',
  `type_alis_id` int(11) NOT NULL COMMENT '关联ID',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '平台余额',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1092 COMMENT='金额账户记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_account_records`
--

LOCK TABLES `zytc_account_records` WRITE;
/*!40000 ALTER TABLE `zytc_account_records` DISABLE KEYS */;
INSERT INTO `zytc_account_records` VALUES (1,'170721052056542',1,0,'商场订单支付成功!',3760.00,1,2,3760.00,'2017-07-21 17:20:56','商场订单在线支付!');
/*!40000 ALTER TABLE `zytc_account_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_account_return_records`
--

DROP TABLE IF EXISTS `zytc_account_return_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_account_return_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `serial_no` varchar(50) NOT NULL DEFAULT '' COMMENT '流水号',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `account_type` int(11) NOT NULL DEFAULT '0' COMMENT '提成类型',
  `type_alis_id` int(11) NOT NULL DEFAULT '0' COMMENT '关联id',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `remark` varchar(255) NOT NULL DEFAULT '0' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=910 COMMENT='平台的利润的记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_account_return_records`
--

LOCK TABLES `zytc_account_return_records` WRITE;
/*!40000 ALTER TABLE `zytc_account_return_records` DISABLE KEYS */;
INSERT INTO `zytc_account_return_records` VALUES (1,'180316063215373',1,188.00,1,1,'2018-03-16 18:32:15','订单号为：20170721172001000000001的订单交易完成，订单实际付款金额为：3760.00元，平台抽取188.00');
/*!40000 ALTER TABLE `zytc_account_return_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_account_withdraw_records`
--

DROP TABLE IF EXISTS `zytc_account_withdraw_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_account_withdraw_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '对应金额',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '简介',
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=3276 COMMENT='金额账户记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_account_withdraw_records`
--

LOCK TABLES `zytc_account_withdraw_records` WRITE;
/*!40000 ALTER TABLE `zytc_account_withdraw_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `zytc_account_withdraw_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_account_withdraw_user_records`
--

DROP TABLE IF EXISTS `zytc_account_withdraw_user_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_account_withdraw_user_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `serial_no` varchar(50) NOT NULL DEFAULT '' COMMENT '流水号',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '对应金额',
  `account_type` tinyint(1) NOT NULL COMMENT '账户类型',
  `type_alis_id` int(11) NOT NULL COMMENT '关联ID',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员提现记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_account_withdraw_user_records`
--

LOCK TABLES `zytc_account_withdraw_user_records` WRITE;
/*!40000 ALTER TABLE `zytc_account_withdraw_user_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `zytc_account_withdraw_user_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_attribute_value`
--

DROP TABLE IF EXISTS `zytc_attribute_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_attribute_value` (
  `attr_value_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '属性值ID',
  `attr_value_name` varchar(50) NOT NULL DEFAULT '' COMMENT '属性值名称',
  `class_id` int(11) NOT NULL COMMENT '属性ID',
  `value` varchar(1000) NOT NULL DEFAULT '' COMMENT '属性对应相关数据',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '属性对应输入类型1.直接2.单选3.多选',
  `sort` int(11) NOT NULL DEFAULT '1999' COMMENT '排序号',
  `is_search` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否使用',
  PRIMARY KEY (`attr_value_id`),
  KEY `INDEX_CID` (`class_id`),
  KEY `INDEX_TYPE` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=4096 COMMENT='商品属性值';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_attribute_value`
--

LOCK TABLES `zytc_attribute_value` WRITE;
/*!40000 ALTER TABLE `zytc_attribute_value` DISABLE KEYS */;
INSERT INTO `zytc_attribute_value` VALUES (74,'风格',28,'',1,0,1),(76,'裙长',28,'短款,中款,长款',3,2,0),(77,'款式',28,'韩版,休闲,欧美,复古,传统',3,3,1),(83,'内存',30,'2G,4G,8G',2,1,1),(84,'操作系统',30,'',2,2,0),(85,'尺寸',30,'4寸,4.2寸,5寸,5.5寸',2,2,1),(87,'鞋跟高度',32,'1-2cm,5-8cm,8-10cm,大于10cm',2,2,1),(93,'男女款式',32,'',1,2,1),(96,'鞋头款式',32,'平头,尖头',3,4,1),(104,'材质',32,'皮鞋,布鞋',2,255,1),(120,'',28,'',1,255,1);
/*!40000 ALTER TABLE `zytc_attribute_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_customer_account`
--

DROP TABLE IF EXISTS `zytc_customer_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_customer_account` (
  `c_id` int(11) NOT NULL,
  `profit` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '店铺总营业额',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '店铺当前余额',
  `proceeds` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '店铺收益总额',
  `withdraw` decimal(10,2) NOT NULL DEFAULT '1.00' COMMENT '店铺提现总额',
  `money_lock` decimal(10,2) DEFAULT '0.00' COMMENT '提现过程的绑定金额',
  `dayincome` decimal(10,2) DEFAULT '0.00',
  `ordercount` int(11) DEFAULT '0',
  `consume` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=2340 COMMENT='用户账户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_customer_account`
--

LOCK TABLES `zytc_customer_account` WRITE;
/*!40000 ALTER TABLE `zytc_customer_account` DISABLE KEYS */;
INSERT INTO `zytc_customer_account` VALUES (10,679.00,15.77,22.97,7.20,0.00,0.00,25,350.20),(13,0.00,0.00,0.00,0.00,0.00,0.00,0,0.00),(14,3.90,0.19,0.19,0.00,0.00,0.00,2,36.90),(16,0.00,0.00,0.00,0.00,0.00,0.00,0,0.00),(22,0.00,0.00,0.00,0.00,0.00,0.00,0,0.00),(24,0.00,0.00,0.00,0.00,0.00,0.00,0,0.00),(40,234.00,11.23,11.23,0.00,0.00,0.00,3,234.00),(41,0.00,0.00,0.00,0.00,0.00,0.00,0,0.00),(43,0.00,0.00,0.00,0.00,0.00,0.00,0,0.00),(44,0.00,0.00,0.00,0.00,0.00,0.00,0,0.00),(45,0.00,0.00,0.00,0.00,0.00,0.00,0,0.00),(46,0.00,0.00,0.00,0.00,0.00,0.00,0,0.00),(47,0.00,0.00,0.00,0.00,0.00,0.00,0,0.00),(48,0.00,0.00,0.00,0.00,0.00,0.00,0,0.00),(50,0.00,0.00,0.00,0.00,0.00,0.00,0,0.00),(52,0.00,0.00,0.00,0.00,0.00,0.00,0,0.00),(57,0.00,0.00,0.00,0.00,0.00,0.00,0,0.00),(58,0.00,0.00,0.00,0.00,0.00,0.00,0,0.00),(60,0.00,0.00,0.00,0.00,0.00,0.00,0,0.00),(63,0.00,0.00,0.00,0.00,0.00,0.00,2,27.90),(70,0.00,0.00,0.00,0.00,0.00,0.00,0,0.00),(73,0.00,0.00,0.00,0.00,0.00,0.00,0,0.00);
/*!40000 ALTER TABLE `zytc_customer_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_customer_account_proceeds_records`
--

DROP TABLE IF EXISTS `zytc_customer_account_proceeds_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_customer_account_proceeds_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户  0标识平台',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '相关金额',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '简单描述',
  `order_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `INDEX_CID` (`c_id`),
  KEY `INDEX_OID` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='用户收益总额的记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_customer_account_proceeds_records`
--

LOCK TABLES `zytc_customer_account_proceeds_records` WRITE;
/*!40000 ALTER TABLE `zytc_customer_account_proceeds_records` DISABLE KEYS */;
INSERT INTO `zytc_customer_account_proceeds_records` VALUES (1,1,0.80,'2018-08-19 15:59:55','消费返现',150),(2,1,0.43,'2018-08-19 15:59:55','会敏购物返利',151),(3,1,0.43,'2018-08-19 15:59:55','会敏购物返利',150);
/*!40000 ALTER TABLE `zytc_customer_account_proceeds_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_customer_account_records`
--

DROP TABLE IF EXISTS `zytc_customer_account_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_customer_account_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL COMMENT '店铺ID  0标识平台',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '相关金额',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '发生方式 1 入账 2提现',
  `refid` int(11) NOT NULL COMMENT '相关ID号 orderid withdrewid',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '店铺的可用余额',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '简单描述',
  `status` int(11) DEFAULT '0' COMMENT '结算状态 0 刚发起 1已结算 2退款等不结算\n提现状态 0',
  `extra` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `INDEX_CID` (`c_id`),
  KEY `INDEX_REFID` (`refid`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=5461 COMMENT='用户记录管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_customer_account_records`
--

LOCK TABLES `zytc_customer_account_records` WRITE;
/*!40000 ALTER TABLE `zytc_customer_account_records` DISABLE KEYS */;
INSERT INTO `zytc_customer_account_records` VALUES (53,10,0.47,1,410,7.25,'2019-01-13 21:25:57','null购买原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满,订单金额 9.8,获得推荐人消费分成0.47040000000000004元',2,'取消返利'),(54,10,0.19,1,413,12.48,'2019-02-04 21:55:36','王江波购买原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满,订单金额 3.9,获得推广返利0.19元',1,NULL),(55,10,3.74,1,367,10.52,'2019-01-13 22:04:04','分享返现',1,NULL),(56,10,0.19,1,414,12.67,'2019-02-05 08:54:02','王江波购买原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满,订单金额 3.9,获得推广返利0.19元',1,NULL),(57,10,0.19,1,417,11.86,'2019-02-05 23:00:33','王江波购买原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满,订单金额 3.9,获得推广返利0.19元',1,NULL),(58,10,0.19,1,418,12.05,'2019-02-06 09:49:12','王江波购买原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满,订单金额 3.9,获得推广返利0.19元',1,NULL),(59,10,0.28,1,419,10.80,'2019-01-15 21:53:57','王江波购买原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满,订单金额 5.9,获得推广返利0.28元',0,NULL),(60,10,0.43,1,420,10.95,'2019-01-16 10:38:48','王江波购买原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满,订单金额 8.9,获得推广返利0.43元',0,NULL),(61,10,0.19,1,422,8.67,'2019-01-23 21:24:16','王江波购买原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满,订单金额 3.9,获得推广返利0.19元',1,NULL),(62,10,0.19,1,423,12.24,'2019-02-08 10:47:53','王江波购买原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满,订单金额 3.9,获得推广返利0.19元',1,NULL),(63,10,0.28,1,425,10.80,'2019-01-17 15:19:08','王江波购买榆林小米,订单金额 5.9,获得消费返现0.28元',0,NULL),(64,10,0.28,1,426,10.80,'2019-01-17 16:43:32','王江波购买榆林小米,订单金额 5.9,获得消费返现0.28元',0,NULL),(65,10,0.19,1,427,12.43,'2019-02-09 09:12:31','王江波购买榆林小米,订单金额 3.9,获得消费返现0.19元',1,NULL),(66,10,0.28,1,428,10.80,'2019-01-18 17:51:54','王江波购买榆林小米,订单金额 5.9,获得消费返现0.28元',0,NULL),(67,10,0.19,1,405,10.71,'2019-01-19 10:42:47','分享返现',1,NULL),(68,10,1.20,1,338,11.91,'2019-01-19 11:10:34','分享返现',1,NULL),(69,10,1.58,1,331,13.49,'2019-01-19 11:10:55','分享返现',1,NULL),(70,10,0.28,1,429,13.77,'2019-01-19 11:29:13','王江波购买榆林小米,订单金额 5.9,获得消费返现0.28元',0,NULL),(71,10,0.19,1,430,8.86,'2019-01-26 18:24:44','王江波购买榆林小米,订单金额 3.9,获得消费返现0.19元',1,NULL),(72,10,0.19,1,432,12.62,'2019-02-11 09:22:20','王江波购买榆林小米,订单金额 3.9,获得消费返现0.19元',1,NULL),(73,10,0.11,2,433,13.60,'2019-01-20 11:03:46','会敏购买原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满,订单金额 8.9,获得推荐人消费分成0.11元',0,NULL),(74,10,0.11,2,435,13.60,'2019-01-20 11:30:21','会敏购买原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满,订单金额 8.9,获得推荐人消费分成0.11元',0,NULL),(75,10,0.43,1,442,13.92,'2019-01-20 11:56:13','王江波购买榆林小米,订单金额 8.9,获得消费返现0.43元',0,NULL),(76,10,0.19,1,408,13.68,'2019-01-20 16:33:36','分享返现',1,NULL),(77,10,2.00,3,0,11.68,'2019-01-21 13:00:52','提现（在途）',0,NULL),(78,10,0.19,1,444,9.33,'2019-01-29 20:24:18','王江波购买榆林小米,订单金额 3.9,获得消费返现0.19元',1,NULL),(79,10,1.00,3,0,12.68,'2019-01-21 16:15:23','提现成功',1,NULL),(80,10,1.00,3,0,11.68,'2019-01-21 16:32:23','提现成功',1,NULL),(81,10,1.10,3,16,10.58,'2019-01-21 16:39:49','提现成功',1,NULL),(82,10,1.00,3,17,9.58,'2019-01-21 16:44:00','提现成功',1,NULL),(83,10,0.28,1,446,9.14,'2019-01-28 18:26:49','王江波购买榆林小米,订单金额 8.9,获得消费返现0.43元',1,NULL),(84,10,0.38,1,448,9.96,'2019-01-22 10:38:01','王江波购买榆林小米,订单金额 7.9,获得消费返现0.38元',0,NULL),(85,10,1.10,3,18,8.48,'2019-01-22 18:47:05','提现成功',1,NULL),(86,14,0.19,1,450,0.19,'2019-01-29 20:15:09','胡林林购买榆林小米,订单金额 3.9,获得消费返现0.19元',1,NULL),(87,10,0.28,1,452,15.21,'2019-02-19 10:21:23','王江波购买榆林小米,订单金额 5.9,获得消费返现0.28元',1,NULL),(88,10,0.19,1,454,12.81,'2019-02-16 11:19:08','王江波购买榆林小米,订单金额 3.9,获得消费返现0.19元',1,NULL),(89,10,3.12,1,456,14.93,'2019-02-19 10:12:04','王江波购买禹州红薯粉条,订单金额 72.0,获得消费返现3.46元',1,NULL),(90,10,0.28,1,457,15.49,'2019-02-19 11:04:00','王江波购买榆林小米,订单金额 5.9,获得消费返现0.28元',1,NULL),(91,10,0.28,1,458,15.77,'2019-02-19 11:18:56','王江波购买榆林小米,订单金额 5.9,获得消费返现0.28元',1,NULL),(92,10,3.46,1,459,15.75,'2019-02-04 19:06:47','王江波购买禹州红薯粉条,订单金额 72.0,获得消费返现3.46元',0,NULL),(93,10,1.00,3,19,11.67,'2019-02-05 22:21:14','提现（在途）',0,'提现撤回'),(94,10,1.00,3,20,11.67,'2019-02-05 22:25:53','提现成功',1,NULL),(95,10,1.00,3,21,11.81,'2019-02-16 11:46:46','提现成功',1,NULL);
/*!40000 ALTER TABLE `zytc_customer_account_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_customer_account_withdraw_records`
--

DROP TABLE IF EXISTS `zytc_customer_account_withdraw_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_customer_account_withdraw_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL COMMENT '店铺ID  0标识平台',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '相关金额',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '相关ID号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `remark` varchar(255) DEFAULT '' COMMENT '简单描述',
  `openid` varchar(45) DEFAULT NULL,
  `ownername` varchar(45) DEFAULT NULL,
  `wxpayid` varchar(256) DEFAULT NULL,
  `withdrewtime` datetime DEFAULT CURRENT_TIMESTAMP,
  `failstr` varchar(256) DEFAULT NULL,
  `errcode` varchar(45) DEFAULT NULL,
  `formid` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `INDEX_CID` (`c_id`),
  KEY `INDEX_STATUS` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='用户提现的记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_customer_account_withdraw_records`
--

LOCK TABLES `zytc_customer_account_withdraw_records` WRITE;
/*!40000 ALTER TABLE `zytc_customer_account_withdraw_records` DISABLE KEYS */;
INSERT INTO `zytc_customer_account_withdraw_records` VALUES (10,13,5.00,0,'2018-12-14 22:04:01','提现(在途)','os-eG5OdCs81jK5hXumZEja2kKEM','会敏',NULL,'2019-01-21 12:47:08',NULL,NULL,NULL),(12,13,2.00,0,'2018-12-14 22:04:01','提现(在途)','os-eG5ElFTan2n1fg2WrPf2RRT7I','会敏',NULL,'2019-01-21 12:47:08',NULL,NULL,NULL),(13,10,2.00,2,'2019-01-21 13:00:52',NULL,'os-eG5ElFTan2n1fg2WrPf2RRT7I',NULL,NULL,NULL,'该用户今日付款次数超过限制,如有需要请登录微信支付商户平台更改API安全配置.','SENDNUM_LIMIT',NULL),(14,10,1.00,1,'2019-01-21 16:15:22',NULL,'os-eG5ElFTan2n1fg2WrPf2RRT7I',NULL,NULL,'2019-01-21 16:15:24',NULL,NULL,NULL),(15,10,1.00,1,'2019-01-21 16:32:23',NULL,'os-eG5ElFTan2n1fg2WrPf2RRT7I',NULL,NULL,'2019-01-21 16:32:25',NULL,NULL,NULL),(16,10,1.10,1,'2019-01-21 16:39:49',NULL,'os-eG5ElFTan2n1fg2WrPf2RRT7I','王江波',NULL,'2019-01-21 16:39:52',NULL,NULL,'undefined'),(17,10,1.00,1,'2019-01-21 16:44:00',NULL,'os-eG5ElFTan2n1fg2WrPf2RRT7I','王江波',NULL,'2019-01-21 16:44:01',NULL,NULL,'the formId is a mock one'),(18,10,1.10,1,'2019-01-22 18:47:05',NULL,'os-eG5ElFTan2n1fg2WrPf2RRT7I','王江波',NULL,'2019-01-22 18:47:06',NULL,NULL,'1548154025852'),(19,10,1.00,3,'2019-02-05 22:21:13',NULL,'os-eG5ElFTan2n1fg2WrPf2RRT7I','王江波',NULL,NULL,'','','the formId is a mock one'),(20,10,1.00,1,'2019-02-05 22:25:52',NULL,'os-eG5ElFTan2n1fg2WrPf2RRT7I','王江波',NULL,'2019-02-05 22:25:54',NULL,NULL,'98277dbc0fb2488a102398e974143100'),(21,10,1.00,1,'2019-02-16 11:46:46',NULL,'os-eG5ElFTan2n1fg2WrPf2RRT7I','王江波',NULL,'2019-02-16 12:04:26','此IP地址不允许调用接口，如有需要请登录微信支付商户平台更改配置','NO_AUTH','the formId is a mock one');
/*!40000 ALTER TABLE `zytc_customer_account_withdraw_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_customer_article`
--

DROP TABLE IF EXISTS `zytc_customer_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_customer_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  `shopid` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT '1',
  `content` text,
  `modifytime` datetime DEFAULT CURRENT_TIMESTAMP,
  `ispublic` int(11) DEFAULT '1',
  `title` varchar(45) DEFAULT NULL,
  `coverpic` varchar(256) DEFAULT NULL,
  `isban` int(11) DEFAULT '0',
  `collect` int(11) DEFAULT '0',
  `readcount` int(11) DEFAULT '0',
  `nikename` varchar(45) DEFAULT '',
  `headpic` varchar(256) DEFAULT '',
  `bgstyle` int(11) DEFAULT '0' COMMENT '0 默认白色背景',
  `orderid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `INDEX_GOODSID` (`goodsid`,`type`),
  KEY `INDEX_SHOPID` (`shopid`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_customer_article`
--

LOCK TABLES `zytc_customer_article` WRITE;
/*!40000 ALTER TABLE `zytc_customer_article` DISABLE KEYS */;
INSERT INTO `zytc_customer_article` VALUES (21,7,403,0,1,'undefined','2018-08-09 21:53:04',0,'看了看','http://pd6kxroy6.bkt.clouddn.com/tmp_213caeccde1159549164a3abc4f7457f.jpg',0,0,0,'碗豆','https://wx.qlogo.cn/mmopen/vi_32/x6UMhSPxd34UP9VIfy2pITecb7tL9BpPw5ywLKbON7nPvnmHiabGaGzFVXhQfFZw2o5kW1zz0HHecicSGia4xqrTA/132',0,0),(22,7,403,0,1,'[{\"type\":1,\"content\":\"可口可乐了可口可乐了了\"},{\"type\":2,\"content\":\"http://pd6kxroy6.bkt.clouddn.com/tmp_84df67452503cc148644be9e814a40ad.jpg\"}]','2018-08-10 10:53:00',0,'看了看','http://pd6kxroy6.bkt.clouddn.com/tmp_75c17c2f2b96d433208f40f99af773af.jpg',0,0,0,'碗豆','https://wx.qlogo.cn/mmopen/vi_32/x6UMhSPxd34UP9VIfy2pITecb7tL9BpPw5ywLKbON7nPvnmHiabGaGzFVXhQfFZw2o5kW1zz0HHecicSGia4xqrTA/132',0,0),(31,10,403,0,1,'[{\"type\":1,\"content\":\"这里是第一段\"},{\"type\":2,\"content\":\"http://pd6kxroy6.bkt.clouddn.com/tmp/wxdd41e6a63c02c5f0.o6zAJs7ovNRM1nCfIURMX8URcbI8.u7ptLmujvYHG2c935ad759beb651378127edfbd47d4b.png\"}]','2018-08-11 14:44:49',1,'ddd','http://pd6kxroy6.bkt.clouddn.com/tmp/wxdd41e6a63c02c5f0.o6zAJs7ovNRM1nCfIURMX8URcbI8.xwzQTAcBbMARc8ef96b89b0d5f0d65df02f916707de3.png',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJic27dia65Z8OQteuuLLKOX9hF82F0RiaDZeicpAbjzp1KgQ4bFJrNcIg44Bhiaxjibx6yP6sz5F079rRg/132',1,0),(32,10,403,0,1,'[{\"type\":2,\"content\":\"http://pd6kxroy6.bkt.clouddn.com/tmp/wxdd41e6a63c02c5f0.o6zAJs7ovNRM1nCfIURMX8URcbI8.LES4I7uuwiuC2c935ad759beb651378127edfbd47d4b.png\"},{\"type\":1,\"content\":\"写个结尾吧\"}]','2018-08-12 10:56:36',0,'给它写一篇看看','http://pd6kxroy6.bkt.clouddn.com/tmp/wxdd41e6a63c02c5f0.o6zAJs7ovNRM1nCfIURMX8URcbI8.Z6g6AbOHtZ5p087750d35699036aebafaf541342bd44.jpg',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJic27dia65Z8OQteuuLLKOX9hF82F0RiaDZeicpAbjzp1KgQ4bFJrNcIg44Bhiaxjibx6yP6sz5F079rRg/132',0,0),(33,10,0,48,2,'[{\"type\":1,\"content\":\"哈哈哈，没事来玩玩啊\"},{\"type\":2,\"content\":\"https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_userarticle/u10_1550498396249\"}]','2019-02-18 22:00:11',0,'d写个店铺文章吧','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_userarticle/u10_1550498317838',0,0,1,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJic27dia65Z8OQteuuLLKOX9hF82F0RiaDZeicpAbjzp1KgQ4bFJrNcIg44Bhiaxjibx6yP6sz5F079rRg/132',1,0),(35,10,404,0,0,'[{\"type\":1,\"content\":\"啦啦啦\"},{\"type\":2,\"content\":\"http://www.imgtqcu.weiruikj.cn/tmp/wxacdc9acc9937a90b.o6zAJs7ovNRM1nCfIURMX8URcbI8.tsVpwgE3IHVg7bcafa214b95410b8c55bb6a0b6ec674.png\"},{\"type\":2,\"content\":\"https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_userarticle/u10_1551324125503\"}]','2019-02-28 11:22:15',1,'再写一个试试','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_userarticle/u10_1550496615489',0,0,2,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJic27dia65Z8OQteuuLLKOX9hF82F0RiaDZeicpAbjzp1KgQ4bFJrNcIg44Bhiaxjibx6yP6sz5F079rRg/132',1,168),(36,25,407,0,1,'undefined','2018-11-05 10:53:39',0,'undefined','undefined',0,0,0,NULL,NULL,0,0),(37,44,0,48,2,'undefined','2018-12-14 20:38:13',0,'undefined','undefined',0,0,0,NULL,NULL,0,0),(38,47,0,48,2,'undefined','2018-12-17 14:05:22',0,'undefined','undefined',0,0,0,NULL,NULL,0,0),(39,48,0,48,2,'undefined','2018-12-22 21:02:49',0,'undefined','undefined',0,0,0,'朱奕发','https://wx.qlogo.cn/mmhead/y8JI2LH9X0EfpicxbMGWiczD1HB19LNS4OG1WFejTrxibY/132',0,0),(40,50,0,48,2,'undefined','2018-12-23 12:50:18',0,'undefined','undefined',0,0,0,'陈思博','https://wx.qlogo.cn/mmhead/bQwWS3vscpDKl1Oq67hWib8qFr4tNE2aKuAcKTicKiathE/132',0,0),(41,49,0,48,2,'undefined','2018-12-23 17:20:36',0,'undefined','undefined',0,0,0,'沈嘉玲','https://wx.qlogo.cn/mmhead/S4hqPXo1jhJXO93CrSnZwwEpGy5SErdSsibJyM2gib9vk/132',0,0);
/*!40000 ALTER TABLE `zytc_customer_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_customer_recommender_activecode`
--

DROP TABLE IF EXISTS `zytc_customer_recommender_activecode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_customer_recommender_activecode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) DEFAULT '',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT '0' COMMENT '0 未使用 1已发出 2已使用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_customer_recommender_activecode`
--

LOCK TABLES `zytc_customer_recommender_activecode` WRITE;
/*!40000 ALTER TABLE `zytc_customer_recommender_activecode` DISABLE KEYS */;
INSERT INTO `zytc_customer_recommender_activecode` VALUES (2,'ixicqg','2018-11-01 22:29:13',0),(3,'coxw48','2018-11-01 22:31:58',0),(4,'grz950','2018-11-01 22:32:24',0),(24,'xobe3p','2018-11-01 22:32:57',0),(25,'ngshma','2018-11-01 22:33:54',0),(26,'3lnbjc','2018-11-01 22:41:41',0),(27,'qqks4m','2018-11-01 22:41:54',0),(28,'q6s05l','2018-11-01 22:42:11',0),(29,'dwesqt','2018-11-01 22:47:46',0),(30,'gmiymk','2018-11-01 22:48:01',0),(31,'ntvhrk','2018-11-01 22:49:06',0),(32,'4xi4xe','2018-11-01 22:56:55',0),(33,'apu146','2018-11-01 22:56:57',0),(34,'bdh457','2018-11-01 22:56:59',0),(35,'gmrvy7','2018-11-01 22:57:02',0),(36,'dknpt1','2018-11-01 22:57:08',0),(37,'jmorv5','2018-11-01 22:59:23',0),(38,'adhjz6','2018-11-01 23:02:19',0),(39,'abku19','2018-11-01 23:02:39',0),(40,'ahkpy8','2018-11-01 23:02:39',0),(41,'bdefp2','2018-11-01 23:02:39',0),(42,'ciowyz','2018-11-01 23:02:39',0),(43,'ajknr9','2018-11-01 23:02:39',0),(44,'cjop13','2018-11-01 23:02:39',0),(45,'bruz09','2018-11-01 23:02:39',0),(46,'deksx1','2018-11-01 23:02:39',0),(47,'ckorsw','2018-11-01 23:02:39',0),(48,'bglnqu','2018-11-01 23:02:39',0),(49,'cgijwx','2018-11-01 23:02:39',0),(50,'elov38','2018-11-01 23:02:39',0),(51,'b36789','2018-11-01 23:02:40',1);
/*!40000 ALTER TABLE `zytc_customer_recommender_activecode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_customer_recommendimg`
--

DROP TABLE IF EXISTS `zytc_customer_recommendimg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_customer_recommendimg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL COMMENT '关联的customerid',
  `tid` int(11) DEFAULT NULL COMMENT '特别将普通抽奖和助力抽奖分开 1 普通抽奖的推广员  2.助力抽奖 普通用户+推广员 3 超级团购 4 限时折扣 5普通团-预留 6 送礼返现',
  `pic` varchar(256) DEFAULT '',
  `refid` int(11) DEFAULT NULL COMMENT '活动对应id',
  PRIMARY KEY (`id`),
  KEY `INDEX_CID` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_customer_recommendimg`
--

LOCK TABLES `zytc_customer_recommendimg` WRITE;
/*!40000 ALTER TABLE `zytc_customer_recommendimg` DISABLE KEYS */;
INSERT INTO `zytc_customer_recommendimg` VALUES (30,40,3,'http://www.imgtqbu.weiruikj.cn/FuZxLzn4Tp7qU8rY8Z-Em4QFm-al',66),(31,10,1,'http://www.imgtqbu.weiruikj.cn/FkVKEylP7KWQzR8SnIC2GI7mzCcO',35),(32,10,1,'http://www.imgtqbu.weiruikj.cn/Fn3H-ggMtPBpZPfzmVboRg0yUX7z',46),(33,10,1,'https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_user/u10_t1_r51_1545884568737',51),(34,10,3,'https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_user/u10_t3_r66_1545893365513',66),(35,10,2,'https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_user/u10_t2_r52_1545897898190',52),(36,10,1,'https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_user/u10_t1_r53_1545900526763',53),(37,14,2,'https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_user/u14_t2_r52_1545900750948',52),(38,40,3,'https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_user/u40_t3_r85_1546052559239',85),(39,10,3,'https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_user/u10_t3_r85_1546054293390',85),(40,40,2,'https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_user/u40_t2_r54_1546061268167',54),(41,10,2,'https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_user/u10_t2_r54_1546568401567',54),(42,10,1,'https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_user/u10_t1_r55_1546586460259',55),(43,40,1,'https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_user/u40_t1_r55_1546588850994',55),(44,10,2,'https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_user/u10_t2_r56_1547112177712',56),(45,10,3,'https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_user/u10_t3_r90_1547113028937',90),(46,10,2,'https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_user/u10_t2_r60_1548669132971',60),(47,10,2,'https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_user/u10_t2_r61_1548670669359',61),(48,13,2,'https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_user/u13_t2_r61_1548670731842',61),(49,17,2,'https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_user/u17_t2_r61_1548674934819',61),(50,14,2,'https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_user/u14_t2_r61_1548679157379',61),(51,76,2,'https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_user/u76_t2_r61_1548681316560',61),(52,46,2,'https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_user/u46_t2_r61_1548690098648',61),(53,10,1,'https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_user/u10_t1_r61_1548733240835',61),(54,52,2,'https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_user/u52_t2_r61_1548744711771',61),(55,40,2,'https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_user/u40_t2_r61_1548758110676',61),(56,108,2,'https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_user/u108_t2_r61_1548772128922',61),(57,216,2,'https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_user/u216_t2_r61_1548773091799',61),(58,47,2,'https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_user/u47_t2_r61_1548908087613',61),(59,48,2,'https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_user/u48_t2_r61_1548922071548',61),(60,45,2,'https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_user/u45_t2_r61_1548996688900',61);
/*!40000 ALTER TABLE `zytc_customer_recommendimg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_customers`
--

DROP TABLE IF EXISTS `zytc_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weixin` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `sessionkey` varchar(45) DEFAULT NULL,
  `balance` decimal(10,2) DEFAULT '0.00',
  `headpic` varchar(256) DEFAULT NULL,
  `nickname` varchar(45) DEFAULT NULL,
  `token` varchar(45) DEFAULT NULL,
  `updatetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `shopcollect` varchar(1024) DEFAULT '',
  `goodscollect` varchar(1024) DEFAULT '',
  `recommender` int(11) DEFAULT '0',
  `isrecommender` int(11) DEFAULT '0',
  `articlecollect` varchar(4096) DEFAULT '',
  `qrpic` varchar(256) DEFAULT NULL COMMENT '推广二维码',
  `configflag` int(11) DEFAULT '0' COMMENT '0是否展示推广',
  `recommendcount` int(11) DEFAULT '0',
  `recommendertime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `INDEX_TOKEN` (`token`),
  KEY `INDEX_WEIXIN` (`weixin`),
  KEY `INDEX_RECOMMENDER` (`recommender`)
) ENGINE=InnoDB AUTO_INCREMENT=261 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_customers`
--

LOCK TABLES `zytc_customers` WRITE;
/*!40000 ALTER TABLE `zytc_customers` DISABLE KEYS */;
INSERT INTO `zytc_customers` VALUES (10,'os-eG5ElFTan2n1fg2WrPf2RRT7I',NULL,'rAJAzeDjIXTR8/Nf5rMYhQ==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132','王江波','0CFB58A777891ADECA1CB5AA1EA63B2D','2018-12-14 22:04:01','48,53','408,404,',0,1,'0','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_user/u10_1545892070884',1,29,NULL),(11,'os-eG5PMjg0ZFTU5Z9ilClUqn3bo',NULL,'vBiJ1DPP/w9C9jA/yxDENw==',0.00,NULL,NULL,'22995C597380C7C7F75854B5A0B13580',NULL,'48','404',0,0,'0',NULL,0,0,NULL),(12,'os-eG5Ab2KtNPPl-req8fyZZ1vTY',NULL,'SRQsmZpI6e791nNt5eKaIQ==',0.00,NULL,NULL,'8BE9B105D490FB8F3BDEC8C4AD0AD980',NULL,NULL,NULL,0,0,'0',NULL,0,0,NULL),(13,'os-eG5OdCs81jK5hXumZEja2kKEM',NULL,'8ds9G0UtaIymrTtTcC5l2w==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJkribhRyDNNmIA9gibbXEus80nqGvexn9zKUtYos8OWY30AB8VgyU2MArZA7tHwpbPlUKkFGdkNqdw/132','会敏','3D4C82D586D12AA6C2A48FCC2533D524','2018-12-27 20:34:26',NULL,NULL,10,0,NULL,NULL,0,0,NULL),(14,'os-eG5JBAaXcc6wqUtJGoG-bBNzw',NULL,'mVAkAK9PzFAL2YdveExSkg==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/ajNVdqHZLLBPWYY8zd1Mq59HA2xZu1M7WMELVl6yJFhq8pf5nBNyG2IJdkqobCMlpCibQgMictn8nCSo71HWRpMg/132','胡林林','84463505ECB87DA9B85E43C15C5FE7E8','2018-11-23 08:53:26','48,48','408,404',0,1,'0','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_user/u14_1548077451568',1,25,NULL),(15,'os-eG5PATE5BiKlz1Jhshu0FuN5s',NULL,'Nj9ttQr/04kg3t+nAg54yw==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLGqibUOngLiboEkODsNG7u7vfaB6DkXqour6o85GmteGj8oA4SPjUyP3ROQtsXk9mqaicrI5qcG1JoQ/132','安徒生','C31528F5D84691441C263C4E5F0EE2A6','2019-01-11 12:09:35',NULL,NULL,0,0,'0',NULL,0,0,NULL),(16,'os-eG5KIzCyGyJl6wWVmFahZdt4A',NULL,'XtYdPAZU7kfV3XEEDPg0Jw==',0.00,NULL,NULL,'89CAFBE75B40C6945A429F0966021375',NULL,NULL,'409',0,0,'0',NULL,0,0,NULL),(17,'os-eG5Bg71cBTOH3lGTcZRxPctlY',NULL,'WXdtCTzYJfKuYcEJtK68pw==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEL1yOaichkJ9z54MXMjRcRwDSPZ2gia3ck4dvVRhvpemvX7esSSbwOtOrEgdMYicM4RXHwUMUINjWEOw/132','在路上（海龙）','474771C27CB89C3FABBA721683C5A1C5','2018-12-18 22:05:42',NULL,NULL,0,0,'0',NULL,0,0,NULL),(18,'os-eG5DCNV0RysQyA_YBXsBProfU',NULL,'BOxfPn3tKgIzebY2EfhTrQ==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erbhxK539me9m1eM4pQwOSe7icskUk5bkhUviaQ72mJicXSl7ujMbS5rd6GZqvd0SFWWOGf08KhkFQnA/132','押宁博','26ECBEAC4818AAAD6FCEB36C1220E6F4','2018-12-18 22:24:58',NULL,NULL,0,0,'0',NULL,0,0,NULL),(21,'os-eG5B3qzUuB2rA8oniw49Uct78',NULL,'T3q751IB8TwPYA0bByfrug==',0.00,NULL,NULL,'0FC4B097781AA392A6E0BE77A1F6D367',NULL,'48','',0,0,'33',NULL,0,0,NULL),(22,'os-eG5LvksUcS4sARUcuL2Lo-jLc',NULL,'yrAmgfdCn3XjLNLKbWODjQ==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/IDDicA7apW2Kic82l9RHzSxS1I5QHQ7d5L2qnROYsQQHCHvBYyP8tnOaXSVDUTyDIsUULYtUwhteTpAfnciaMvUNg/132','碗豆','BBE9DF168DC4638F648E2A82D2B10511','2018-12-22 17:30:09',NULL,'409',0,1,NULL,'https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_user/u22_1548075866492',0,0,NULL),(23,'os-eG5Oyup-lJoP1B8j2nkXjofoc',NULL,'e2+IEsN1JAQogjlWRkToaA==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/DVCr1ajsA648zc5ZIhzGqVh9IewDibbKgRlxKianpMEp3e0IlKES3ke0ZBSArr1nwbmKxwlWq7IzoU8wH5tx5v4Q/132','厉害中国～','32344F268D71052E64B5F86DED510E2D','2018-12-14 21:50:26',NULL,NULL,10,0,NULL,NULL,0,0,NULL),(24,'os-eG5FT3hopFIOOhNGN8ZIQOzG4',NULL,'ToGVxcddKuLELGT1qZrF7Q==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJGmJJSxWepjfldr56lk5a2vH8PmwPgemDnY8zOJLzkOZWzkkve6OD3na5p7oCaCkY7Us279LgYQQ/132','stone','01EB09FCA9046DD4976C351EF34B6002','2018-12-05 21:31:39',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(25,'os-eG5CgxIA0oIDdYhIfiApcVdqE',NULL,'qly+NQTLwGYUe0KiBaNb6A==',0.00,NULL,NULL,'120E2199B400796B683A9196E6D5096E',NULL,'48','',0,0,NULL,NULL,0,0,NULL),(26,'os-eG5GDjqVo898lmfEN1FVgXHNY',NULL,'vITqRQoxw5/21DbgMwqLHg==',0.00,NULL,NULL,'B01788E3662CAD21F6277D00DC6F74BD',NULL,NULL,NULL,0,0,NULL,NULL,0,0,NULL),(27,'os-eG5C9_TFLqHGjKgVf0pIVHgL0',NULL,'7d+oN+nQ+neCWSGZxZEsPQ==',0.00,NULL,NULL,'09146FEDFD9C843B289E44DCAFDBBCFC',NULL,NULL,NULL,0,0,NULL,NULL,0,0,NULL),(28,'os-eG5KE4vRRHqUSLCiPh_kYL_cg',NULL,'SJD1/5edViis3ED+0/Y+jA==',0.00,NULL,NULL,'A39D025AC6BEA199A470B557CEF200DD',NULL,NULL,NULL,0,0,NULL,NULL,0,0,NULL),(29,'os-eG5Gp3oH43H7QPai4DblqlMKo',NULL,'IAfxHHWP5G2W8LNw/li3Qg==',0.00,NULL,NULL,'901673DAA2408C97097C1FC284118A8C',NULL,NULL,NULL,0,0,NULL,NULL,0,0,NULL),(30,'os-eG5LHvpuPvwnCBB03yz-oMjIk',NULL,'r9Xv8KVTgnRXrZzwUG7iLQ==',0.00,NULL,NULL,'418CC77789FBEF0B3F3A43624E5AC776',NULL,NULL,NULL,0,0,NULL,NULL,0,0,NULL),(31,'os-eG5FPRnTWQOLXo9kq8hpIW0Ng',NULL,'PpielTQZD3oUBlxhJFmlsA==',0.00,NULL,NULL,'AE4C376FBF2DDFD3782FCF6551DE4808',NULL,NULL,NULL,0,0,NULL,NULL,0,0,NULL),(32,'os-eG5LWNy_TQQ0-iEGksnRMR6pY',NULL,'OPj+HuxbZJNEIdtEhFDr9A==',0.00,NULL,NULL,'E7398A346C9CBD172DA6CC1E8B07854E',NULL,NULL,NULL,0,0,NULL,NULL,0,0,NULL),(33,'os-eG5DoVz0XhDfnhstvDSdHtAuQ',NULL,'ke0DQNLL8Gcca/jHi231kQ==',0.00,NULL,NULL,'8A0B7E740C2A11E64B3D640338FF53A8',NULL,NULL,NULL,0,0,NULL,NULL,0,0,NULL),(34,'os-eG5LSsGlWoMJdyQMODIFulFrs',NULL,'TW3v7V1MTiU4XGlQf7tw0g==',0.00,NULL,NULL,'58AA5C923ADB4A69DB2671FF8CB40D76',NULL,NULL,NULL,0,0,NULL,NULL,0,0,NULL),(35,'os-eG5EZMSpTBzvE3CIAUvcHQBe4',NULL,'Z+hBRrjxYrnrtLuelyravw==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKs57XQXP2ic3wwCVOOBzlTJpvJg17AEHVkC4og4fLngtKticy48FZaTOqL1n2FBibajibmyb6NotesXA/132','杨志','07F9E94A4A0286E19199E58788C84050','2018-11-18 21:23:23','48','',0,0,NULL,NULL,0,0,NULL),(36,'os-eG5Kuliq-Y9eJQ6PK2rNcZpmw',NULL,'DCpcqok3Z05CwcTNOrhSVA==',0.00,NULL,NULL,'54B0767304B4426E28DBB5334994CCA7',NULL,NULL,NULL,0,0,NULL,NULL,0,0,NULL),(37,'os-eG5IO7kb3iNLKHxGlnCb4FD-w',NULL,'RVnKwjfJ7fq3FzKrz4kSEQ==',0.00,NULL,NULL,'94F0ABC7414982A38CD33A9FE1F683A2',NULL,NULL,NULL,0,0,NULL,NULL,0,0,NULL),(38,'os-eG5LM9n630fYFKXa5bdDBBGUM',NULL,'6W/wkP++R0sEbNiowa5Cmw==',0.00,NULL,NULL,'26A9A88D2E7CDD6E22510876A34749DD',NULL,NULL,NULL,0,0,NULL,NULL,0,0,NULL),(39,'os-eG5D8lUiCEI51I7i3oRRB37_Y',NULL,'gE4ov7PLV4f/rjlEdF+Lyg==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/BeGIP6S39amwpsv3ibWK5DmHVpsiaaPjUpYRZenYEKuJFmClCNzNMEFwXzuVjeQrvjDJ3Vdia4paGcX9IvwXL9HOQ/132','浅','AEFD451F424DF2C8A1477C2915418C5A','2018-12-05 17:35:42',NULL,'404',10,0,NULL,NULL,0,0,NULL),(40,'os-eG5JzIloDWWLlXh9vbVaa_cSw',NULL,'GIhrpS8+Q021KKNYQgYksg==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIX88FOcCENjuB272faID1GpFRE77nMXN6Pm43Z4IVnFXxc0sPiaXZtmxZQPmwvy8slaWZ57pNMLmQ/132','高华','7AB275F1035D4089370D9B2DE8CF0E7E','2018-12-02 22:42:15',NULL,NULL,10,1,NULL,'http://www.imgtqbu.weiruikj.cn/FiquT56b6srPYtDwnlAnhD2yqSY_',0,1,NULL),(41,'os-eG5MgrwON-oiuZNAyHVdgWbUU',NULL,'LGPUqHLWSlKV7E5dD8CMLg==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/eAXOa0O1reTrpI2zZUqiaP2oeqhiayc5JB3gkF9MicdYndItmIboaSHKuR1mO31hvGfocjRJwxTUbeIwicMMx6jb1g/132','lin','889ABC80CBDB193AF1C21D3FA5CA5D01','2018-12-18 17:36:35',NULL,'404',10,0,NULL,NULL,0,0,NULL),(42,'os-eG5Kzf_Ls3dQfq9XZ4cuP0At0',NULL,'9wCR0saeZt/F80OAWcLeUQ==',0.00,NULL,NULL,'FEA429D125DA28283E2304C35D7ED3B9',NULL,NULL,NULL,0,0,NULL,NULL,0,0,NULL),(43,'os-eG5K_wPEEzxkz_nMMRAo_ywgE',NULL,'RDo211vT+j3v0RBICEYPWw==',0.00,'https://wx.qlogo.cn/mmhead/Xiarz4Ie8iaUgXXJd2UicZBCAWSMawn62fvRMhwRaHa1vM/132','刘馨合','934215FCA30FDB8DD1BCC80E2E4324B6','2019-02-01 17:38:21',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(44,'os-eG5AfvIxp8mmjKXhgm_2b74kg',NULL,'Or9km2UqSr7kPT0ZYCl5hQ==',0.00,'https://wx.qlogo.cn/mmhead/OVJEDAwWWKkGrzcSZt1ZK5PqrPqUYlwlNjFhBJllRjk/132','卢晓达','38B8ABA3D87B6EFB51FC60D78B4E55AC','2019-01-27 19:28:38','','407',0,0,'37','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_user/u44_1548327869356',0,0,NULL),(45,'os-eG5C2K4qGcehHcYTsX6Vwkf4M',NULL,'7zbMOHe4FMjg9xl1X/wJdQ==',0.00,'https://wx.qlogo.cn/mmhead/b4IVtguzpFswy7WNhZ5DZ97NFhqfC1NXZiblVjvMrib0Y/132','林威绿','553989C15D16F8E1426051E2B3E00FD4','2019-02-01 12:52:34',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(46,'os-eG5M-rn-8fDPISowp0unhDAJk',NULL,'iLk/CbHSvP8NLh/UYBmXJQ==',0.00,'https://wx.qlogo.cn/mmhead/uT3eXc6ibIwBQOxKJoibyTqicNGbHle6cLL7cOZwWdjT4Y/132','蔡湘婷','65CBEA7C01F5EBD6280D1571B4EB04DE','2019-01-30 19:01:57',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(47,'os-eG5JQ4u3LV1nhB0x9eJ_2hh6M',NULL,'cuTBvyAIO2ByCThaZSZ0ng==',0.00,'https://wx.qlogo.cn/mmhead/kFqwnRZxAZwvuqYVpCE5c22qhJvredjFkEpD59k7HvE/132','彭懿坚','3B01A14AE81AE29A6036A4D3D6739A5A','2019-02-07 18:40:16','','407',0,0,'37',NULL,0,0,NULL),(48,'os-eG5PwBdiZQUswTGL70uYEwbag',NULL,'o8qOAfBtvYy35HCvzuJnlw==',0.00,'https://wx.qlogo.cn/mmhead/y8JI2LH9X0EfpicxbMGWiczD1HB19LNS4OG1WFejTrxibY/132','朱奕发','585AA8CFD8616364F327D0C2D4B71583','2019-02-02 18:12:27','48','',0,0,'38',NULL,0,0,NULL),(49,'os-eG5JCs_3l_TS4UBLqNHISi704',NULL,'6fduRx7gL2EjLj3rE+mLsA==',0.00,'https://wx.qlogo.cn/mmhead/S4hqPXo1jhJXO93CrSnZwwEpGy5SErdSsibJyM2gib9vk/132','沈嘉玲','E05A6ACDF075BD6A3FE7898BC632A581','2018-12-21 15:56:42','48','',0,0,'40',NULL,0,0,NULL),(50,'os-eG5DnG-M_Ho6lXy8ZBO4mlvhc',NULL,'DALe9iRdrFFe0lWqofd99w==',0.00,'https://wx.qlogo.cn/mmhead/bQwWS3vscpDKl1Oq67hWib8qFr4tNE2aKuAcKTicKiathE/132','陈思博','93BEE5B7E681CB08F49C89D8A7768A1A','2019-01-28 12:18:35','48','409',0,0,'39',NULL,0,0,NULL),(51,'os-eG5CvAFBuVnGHP4RO3Rqi6E3U',NULL,'rW3OYLzJVp4EcHmfziAW6g==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJB69JIo372lRWjGNliabll4VCmI96P6Vfc1Ng4aX6DyHqomwRkl5NeoAfKtXGCicG8gFMA7rExNttw/132','Agoni°','DEA32DE98AA892282CA1971D2AD963F7','2018-12-18 22:05:39',NULL,NULL,10,0,NULL,NULL,0,0,NULL),(52,'os-eG5Gmd-IK5o4-hQlmaK1cqcEw',NULL,'XRyeY5ahsBUZwmYMYldZnQ==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqv6ru3oR6d2N6yO6kqgXOGAaGk6KuGA3QO5fTcSBLYTHicpftaZjNI7RRQR8eMpPqQfNZGoicB7djg/132','♥夲❦仐♥','3F0C15E8A0A825626D13FB23A01AEC15','2019-01-29 14:51:24',NULL,NULL,10,0,NULL,NULL,0,0,NULL),(53,'os-eG5LLmGlXd3wr57OChoSjUifY',NULL,'rppf6NBQT9Kx/GewWEiyVw==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTK72vY4e503XphDFHvwgwtrHAZHuKgt27IQIMD6ThobSuwA6oljGIgF4hEbp7FGDkK4ibB52hYm3yw/132','yw','65C49FBDCAA3F78BF0D485242E3A1A30','2018-12-18 22:11:38',NULL,NULL,10,0,NULL,NULL,0,0,NULL),(54,'os-eG5Fey-K_qvW6piwd67eJh4I4',NULL,'9p0DTrif3KM7Srt38d5fhw==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJkPUQ3lDUmKQGWf31WY5AFsKBBWM0qZLYp94UHpECzu8kicPPUz4QGibRCr67YetH0ZWZicHPicRcdKg/132','李晓远','AC855CB3F90EE74DF521DC1D71D5083B','2018-12-18 22:32:38',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(55,'os-eG5EPAog7EEylT0jy320lDgc4',NULL,'fHarweTmSCCWIrEqqzfLkg==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/ajNVdqHZLLBF871cfFnsiaShcNnEObtMFI8rFsx0lCGYWu88ia3xFEOpJlvmYZhkdcLI70sN8wFAqLnfcpicsEHww/132','贪睡的熊二','09B00235BD6530D42B1A73FA3C226A7C','2018-12-19 07:01:54',NULL,NULL,10,0,NULL,NULL,0,0,NULL),(56,'os-eG5LYR4cs8O1Tmyhk7MmeQJgM',NULL,'K8gou5IynXDSER2A0bkXpg==',0.00,NULL,NULL,'3B94E9E6BC7342DAD99A227301080AE7',NULL,NULL,NULL,0,0,NULL,NULL,0,0,NULL),(57,'os-eG5GrvEepzYBwLI0ILYR-GFaw',NULL,'5l7c8QHYbARVG42i9snPdQ==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/micazF5XVdsQ3mQdVW7KvMgcjGvKcTvPD6BcJP0dnqYyz17Q1jwt5l6YhTnsmmHxcKM0jQVBJHpyVEvOo4PRMbA/132','徒文','B3613B3AB22C55BF6BC33F90DB6D691A','2018-12-19 12:01:42',NULL,NULL,10,0,NULL,NULL,0,0,NULL),(58,'os-eG5NdEKGhgDJ1dza9fZe_D8P0',NULL,'dlfj0YQnRBemrgJEqc/7nQ==',0.00,'https://wx.qlogo.cn/mmhead/Lg6fhYf0Xic8QaOibXuHOt9QWWpOudPgNIiaz4xEIVW2t8/132','李吟珊','F2F231D23DB9EDF9A0F6A03815A4C3BD','2019-01-30 12:54:11','48','404',0,0,NULL,NULL,0,0,NULL),(59,'os-eG5BMBfcQ-Hhbu9vibJtrL23A',NULL,'8+tBBZmXFBBX8GPRiQoqYg==',0.00,NULL,NULL,'018127B9C4EB7D07C29549EC0DF23A82',NULL,NULL,NULL,10,0,NULL,NULL,0,0,NULL),(60,'os-eG5J_yPWvfV3044-eM2nAHUfo',NULL,'6g7mQaXzdNifDI+XVmy2cg==',0.00,'https://wx.qlogo.cn/mmhead/bzBnavkQmCOS9lR11vLS9FL3oMnBqrHJp2aQVqhGrs0/132','林财洁','A4F1EC9223136DC904079A9FC4DB3FC4','2019-01-26 19:14:23',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(61,'os-eG5DvJCCrzEnC_QRZjzmZZ03k',NULL,'wiYtXdUx3SO9OfQoE7zxUA==',0.00,NULL,NULL,'2F78742D93E9BCD4960F8B8B5213EA85',NULL,NULL,NULL,0,0,NULL,NULL,0,0,NULL),(62,'os-eG5IXknQQsxtlVqVFkvQjDIc0',NULL,'Q4EAexC08qhfg3tfDI8W2w==',0.00,NULL,NULL,'AA5522014783076FDDAA4A17DFB897E8',NULL,NULL,NULL,0,0,NULL,NULL,0,0,NULL),(63,'os-eG5H7hXJxJzhRZ5LJ6d9ygTxE',NULL,'fIKZtcIMTiTnue3RNp01kw==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/ekFWm6NDQzRicibSFGfWMgHS2jaiaTTOdg1jBzJk7NR3VwT9cibqRia1FdHTt3fsTD0PWA9AyyzsibvwPs98RgNfyPOA/132','老魏特产','8DD09013F73C9DA8609F8F5ACCE3D66B','2018-12-28 16:59:11',NULL,NULL,10,0,NULL,NULL,0,0,NULL),(64,'os-eG5PwQcZEAqKcDP9sIC4cjzHM',NULL,'dyHCtT7cn62qVW4rmwk+Fg==',0.00,NULL,NULL,'FB930D65C6E92284DB367BA356CB6146',NULL,NULL,NULL,10,0,NULL,NULL,0,0,NULL),(65,'os-eG5F_5HRCexIrk7WlpauBNbuI',NULL,'DmdH0oF1LYxb/mz64UEYfw==',0.00,NULL,NULL,'9919351CB236002EC64D8F11AF8E3CE2','2019-01-07 15:46:37',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(66,'os-eG5CPsz-1dkbPM3y8yw_SfBPQ',NULL,'YersC4jYkMeguwJDarsIhw==',0.00,NULL,NULL,'5B3414832F647B81850767F53813BC09','2019-01-11 12:15:41',NULL,NULL,10,0,NULL,NULL,0,0,NULL),(67,'os-eG5CPsz-1dkbPM3y8yw_SfBPQ',NULL,'YersC4jYkMeguwJDarsIhw==',0.00,NULL,NULL,'5B3414832F647B81850767F53813BC09','2019-01-11 12:15:41',NULL,NULL,10,0,NULL,NULL,0,0,NULL),(68,'os-eG5DCr6bkaJGyLOXMjcuTaCmE',NULL,'9kv9SxAsre63wVboSoRqeA==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJYXopQ9OQjVeoUnNBRxkDibAShO4KMneJJA4hFvzar9ZtQXsOia70H2G6CibdXhJ2ke6e8ksHckSGWg/132','花未眠','54D41FF3268DD4433AB18A12222A6690','2019-01-28 18:42:16',NULL,NULL,10,0,NULL,NULL,0,0,NULL),(69,'os-eG5MUG5seK6kvthynbptiI0yw',NULL,'H932Bo3GQrWV/4nnLS41kQ==',0.00,NULL,NULL,'38A62B0D68A5B0E7B4D5BC40329C78C8','2019-01-23 18:23:26',NULL,NULL,10,0,NULL,NULL,0,0,NULL),(70,'os-eG5O8RllmccMiCx-CyxSaq0vw',NULL,'7Pt8jmlCXxGeRrWWpU0Y4A==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/pZsdUQ2ZokIdd5BEu2PiaqjGV00XBsxHKrTr4kbt3PyPDktAJeRMwrNHhlrprqP0E6gJSgw7D49O7NkQfIe8YgQ/132','暴风雨','408668B9CDDBA2F8D649EAA8B1CBB59B','2019-01-28 20:58:04',NULL,NULL,14,0,NULL,NULL,0,0,NULL),(71,'os-eG5KhtcuZpinKtFcgb2w6PEtE',NULL,'AFbqrg1ojAA+Kh/CVXpUbg==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/37ia2979KWbtdK5s1IE9a2eCeKU1hhGkpSrAMQHUCBBIviayZ2Yy7wDoK9BJfJKnwIS4FrekcxkiblCRfxAicsP5HA/132','余谦','EF03B25441A322A00F96A714853D6125','2019-01-27 16:45:50',NULL,NULL,10,0,NULL,NULL,0,0,NULL),(72,'os-eG5DVtPBz4Nc2nW0vItSwD_k0',NULL,'nYNPWx7ogAEydBPkCMghqw==',0.00,NULL,NULL,'BFF5B4EEADEAF924213A568E95814FD9','2019-01-27 16:47:11',NULL,NULL,10,0,NULL,NULL,0,0,NULL),(73,'os-eG5IsF0vGcFUgsjc71tGMQjSM',NULL,'V00MBSnnxqud7vTn/lw8cw==',0.00,NULL,NULL,'E0521C4D9CB1A5245FC15E3DC18E5552','2019-01-27 17:14:46',NULL,NULL,10,0,NULL,NULL,0,0,NULL),(74,'os-eG5L2p5ReCxN8ohIfooXRzZ0g',NULL,'GuW/f+7eguew+UDw0GtkdA==',0.00,NULL,NULL,'DE14722A0FF945FE1F2C799B1F5A13E7','2019-01-27 18:54:58',NULL,NULL,10,0,NULL,NULL,0,0,NULL),(75,'os-eG5A0i8yypTWZy6qk1zimgHIU',NULL,'/bfpOJuzlEcvHarHPTMPug==',0.00,NULL,NULL,'011B9ED925C2D23C433D0FD497D4A249','2019-01-27 22:05:25',NULL,NULL,10,0,NULL,NULL,0,0,NULL),(76,'os-eG5Ml_SXpsbGnpEB9PbqbU6c8',NULL,'Ubf93aWZb1/581ZLIIvbZg==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/dj6y1GZ3oGd9bNhxYCjibMJuDQ3tnah4SOhjlQIAttXLD4TON4Dn3Rsl4ViccwicTTKJQBSs2CsOyosoeQ43Y8uMw/132','王振林','2BCFE0B90E7D2DC0D1BF4D6B596A6F3E','2019-01-28 17:59:41',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(77,'os-eG5FevFAGzkNcAjpU0wTJP17E',NULL,'Djl3KVjWZpEAH5ESFkFulw==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLzDNrFK130rabq4txzoaicP3210RMSPGywh0wrXlSNHOkj4fxAKmc3HPFudObTGn6icfutRuicRRarg/132','tsunami','0EF0D112D62935FDCEBD3D1A899D2B26','2019-01-28 21:38:24',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(78,'os-eG5HwC45ItCbwOpWI_clyM_L8',NULL,'Flr2cjwi0yHfO9OzVU2S0w==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJroJCdic3Itv1J26rHSPgiaNdGcT6CEKGAmhAuBV4Ak1JvOwplnLKniczicxMy4AB1sEUe98LO0YIfrA/132','一叶知秋','549A49C47D70F992434023C59552D884','2019-01-28 18:46:48',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(79,'os-eG5NudXD8CGwtHPLcGnf3bJ4g',NULL,'ZntzqGldBPd81DKaKgXDTA==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLCrPE9ViaAibhXctMyIShzzBjNPF76u5kaicDibKQGfuQr8N81xq333NPDRP11NobGghVmYHWia03L3lw/132','诗文嘉语','598FF77980F1CA96A2890AE3EE91FBDD','2019-01-28 18:28:07',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(80,'os-eG5GOhtSWRSVc9YA1UqPcs4BA',NULL,'C9unFfefP0XKfg/DARu2SQ==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/dLR8AZEnEXCglITQJrhjUElxviaF5UbS45vYO5ibv2RrQzJUMicBAgvC4BCMhk5LodrTUQabsVXt0oRzNfTh6Pa2A/132','阿敏','1B7549ECD040086BA7593375AA06DB01','2019-01-28 18:28:15',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(81,'os-eG5Mth5TMWeLcsmI36Twb0Pfc',NULL,'PPd7YRdY6hcT1vRtrWogdw==',0.00,NULL,NULL,'C729B20C46499F17C326F009EF07E8A3','2019-01-28 18:28:46',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(82,'os-eG5EmUnj_o5lFxqdiJs0ovmVs',NULL,'Y4wZoXiZDx4WKLUdeyFhyw==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI4GB0dE2WT9wdibohqicB3AqvQDot07pFibESnvMqgelQEB0zokeVOHTE5dAjvvtvm3hpKmibVpx5fpg/132','旁观者清i','F68A2D7B5F1F036E7793F08336923ACD','2019-01-28 18:30:15',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(83,'os-eG5L1jUx-c7h4n2HQa5eQwpAk',NULL,'SLii5ZWX1x0c95vVNACB/w==',0.00,NULL,NULL,'3FBD1E76B09A6FFEAB1B87E9E3894795','2019-01-28 18:31:52',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(84,'os-eG5MUY4UqbC-7Oc0cQAeAr4cM',NULL,'wnkfp+7rL34jHOtCh9Zvbg==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/orATsMN8N2q7DEfhsK5ib3icHwGRCGBX8z5ZdRhttstkGLq26Ia3HicBBVe5xLqvrQAMxjxbYJbmhyiasSvewT64sw/132','静','55F2F51F9DF46E9651BCE4CD7488D2C8','2019-01-28 18:37:53',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(85,'os-eG5PsJRwONuQoA-9jUcsRTTi8',NULL,'izQFidgxgRkmJZOVJSSJKQ==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/S8nvIn95GAwuENjsYwOkMKdP3Sicbh9vdicNyzpcmcFpic7reSb9brs8VDCbNRkkGLmwea2q13QsbHNLlhXowo2tw/132','你是年少的欢喜','E84B00AC5BBE832D81D8512B4F1B9E1F','2019-01-29 12:36:13',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(86,'os-eG5I7nomlldNc_J0G6cB_mpFo',NULL,'kAiMb91+kmYE5nOiiGFlIw==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/5avicPjvWNMJOkfCXut1iapBkprdicH5JgoTGfAcQz0HBluDILODdPvljeiaVtNUXc3Vg2ibYFDtpSM4UfZjuULpwyA/132','辛爽','0D6908B230310B343F64AF325BC5ACA5','2019-01-28 18:35:22',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(87,'os-eG5DKaMMfMS8yNilhNsDvzppY',NULL,'Nvued1U/99OSiwteLoNwbQ==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJkJM4BwLulF7dJLYySTVZVlLRNlzWJIT8g8eQbkWGzJbGdz7AI30ELt1FFMyUB76ggFF7K5LHJuw/132','angel','6DFE59A7FCC5D685036DFD9E581F16EA','2019-01-28 18:37:03',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(88,'os-eG5BdZYhPkOI9F_MnmOhqA6_8',NULL,'MXMfxcmxgvYLT/1WoqU5tA==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erCV2r5kODvwyvuxbRa5zsq3PI6DBthFiaD1P63aDRZZTia7LVzG944ukPianEuuE1qOMXdvXwg1YWtQ/132','梅兰','27F2C66764E49400E6E2308F22AF0789','2019-01-28 18:36:54',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(89,'os-eG5P64r4tHtfsvO4jIHKtwAm4',NULL,'jqL0dQ6oF5+m1cOQBuWSOw==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoqEia9PY8bJtZy9pfN723iayy7npiaGJ8BVQEU95kg1w42FGMpmg5BhbfnBwwJWZA3QCx1tUGGibOicicA/132','幸福','EA8214A7DF492423D0463DCA2CE170B8','2019-01-28 18:40:05',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(90,'os-eG5DRRR0oysS_S94PujbtOELo',NULL,'HViVxq/Zs3qf07AwDGYElw==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epRHgl2Kuuu8MWw26bcJuHo2tZdwNSYibOfj2XbGk0ibhbD0zzmkw8ZF6rv6BLz1OGUibiaYYLZguhpWA/132','A朱广利15136853215','ECAD015728C725E9788EFF0FA6675342','2019-01-28 18:40:53',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(91,'os-eG5IbQgtoaq20YDSrd5m26LNs',NULL,'o5nJSnmH7d3z5POCycTobg==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKSAn0iaAv2aEwLEk6Hr9Eg0b5pUa4Q53Gy9g0ZBg35RbRrK0q3jyPHlBSEEu0AAgaResliavmGytIQ/132','赵胜楠','EE97F9DD6814EA47B9D7F1FFABFB8476','2019-01-28 18:42:37',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(92,'os-eG5LcWLXe3Kl_X5cYVlU-fkfo',NULL,'ltqugnsxeC/eOmjQse4+dQ==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/ySIUhLibBgdGsnBVsPeFppD1ge9VjpzvhWYSUtmWvQOgaHYAP20M28Nmg0uQhA3heWF1UErMzBDfKVjyhQ8j9Jw/132','春暖花开','15594097DC46A622C86A06E0A79DB1A1','2019-01-28 18:43:15',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(93,'os-eG5AJjR0FZvfgIsGaBaTYXvWU',NULL,'GJevlOOUCSVXsGTzs3ClTw==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/Miafgj4SLdOianpZa0jqMOUOOHIlO0QibCFKDfrZ0TDTkYSictaiatzQ9wYnmxaGY1STWVFqsqrYx6d3icKIsXLu6dkA/132','海心','33767FC3B1E62DD47987D61EBD2F72EF','2019-01-29 10:10:18',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(94,'os-eG5NN8FEpoK5x0m4i6_FPFl9A',NULL,'+uf/C1r+mQwK9xCGUxdhmg==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLcic0Lv68KM9icyOlcVkVrVd1Ym9ibd2KXh42DpSkhMB3vNUt18hnDibIe5PD0ZicEh5ibpDMLqWRheezw/132','SY','1E4530E58E354B32978E07D0CAD0E35F','2019-01-28 18:47:56',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(95,'os-eG5DgIQ0m8k6_3eRj3TTo5c8M',NULL,'lnmPE7PFicOo0X4zt+BMFw==',0.00,NULL,NULL,'F22317742AFD1F5E704E8F5F3F2D33A7','2019-01-28 18:47:39',NULL,NULL,10,0,NULL,NULL,0,0,NULL),(96,'os-eG5BdybCNeDaAWWc6LD_Jqyrc',NULL,'yQpBDkU531jfbNDIAXFBUg==',0.00,NULL,NULL,'A76087D5FABE8253A79439E801F42B34','2019-01-28 18:51:23',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(97,'os-eG5E4UrDRI_KyfnmCX4i-2qA0',NULL,'Z41ET2sNGQ4Pch+Z9LvX5Q==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/AXAK1B0dk3AwSGl4TdbG2ic52Xjb86vLnz2voYwOGwJpvu59QxjvSbs3NEXzEew8BH3fbNVMYwPiczapsKh7dp0w/132','郭晟伟','CF0C8D188C174E861F7A66DAC9D5C5D8','2019-01-28 18:56:57',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(98,'os-eG5KOviq5lrGOcDj8Db9fGOCo',NULL,'+lD1ljQPnPLYJPHWIcI4dw==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJCPzz8TBd6vITTq32jHP9jaN8picm0teKlDJs615m05EM3DGSxic2R0FZg02aD9jL2VyONNibdSUfoA/132',' 菁菁','CF78F65E4813049D74B29FAC81AE49DD','2019-01-28 18:59:18',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(99,'os-eG5ChkoqdSh9uX4oX-vbODRwA',NULL,'a8HsbQGU7VQjnF88U7TauA==',0.00,NULL,NULL,'5EFA4A9C800F56644F5E1AE115E98496','2019-01-28 18:59:57',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(100,'os-eG5PNr0mJMhxcAVE6vSGMRqWM',NULL,'KvwrZscUnBdJz7D2L/YAfA==',0.00,NULL,NULL,'C0E5F664D276F5A71E3F5C5E6484769E','2019-01-28 19:01:55',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(101,'os-eG5NWS48OAuKyokFohnwSdCIQ',NULL,'ipRsoJbxhXlWi8FugeKUoA==',0.00,NULL,NULL,'B24D7D652C592AECAD8F40CEE44EE054','2019-01-28 19:04:38',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(102,'os-eG5M9cYpSDiN0Q5vt3FWGD04o',NULL,'yAS5pfPiEB1YPgysIt9BQA==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/MGNeDjJibkT8XFrUR0re4vWx7R3qI4X4TriagDV2qczX30ZdrksNZ5LHvxDicjT5edDxTkib133icSpF6W2qIoCnqPA/132','周春','6FDC5EB4354421CBCCE548426063AAEC','2019-01-28 19:05:11',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(103,'os-eG5MumAQEBwFbuaRsVJZ6fU2A',NULL,'Smz4/GRyxn5WqrQvbTr4IA==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/vUCcicGEhIic6myVFnC8L5nV8rB5DrJvm1utQUWEqAqnQT8dTYGsbibJWFyXGnbT6cnaadKjyeWYp0dd4lu3M9qtA/132','丹','4DAEC42E42F478033E3C4FD0AAABDCE2','2019-01-29 18:51:57',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(104,'os-eG5I5BtpwWBZwPCATFdo3iTo0',NULL,'NLHtSO7fxpFUYOHupvw5rQ==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLU7AAZsf7SNl2DZcWshq8O33SWLgp8kSkhsc9IOkOTGibMIMTAPfUQXDEx1fDf2Ajw7Ic4ib5icOEOw/132','a00000萧伟哲','6592A9300FE6FDDD6C2F381BB75E4B5E','2019-01-28 21:26:31',NULL,NULL,10,0,NULL,NULL,0,0,NULL),(105,'os-eG5Jo0C0-KQ3APrFXiMsqYafY',NULL,'LvMLoh7/yMWxkZ37+gvxTA==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKHOwkz9FvwTmg0AGJvkvHuuVEGp4x323dtwVL8MFGZHoSHIkUgLHC5OZFUOf4HRicl2A71gJ7ZzMQ/132','吴虹丽','C752C59E1AC1F9BDA91F23FADB58D89F','2019-01-28 19:13:17',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(106,'os-eG5EgLsunWceNo8wycwj4mtEE',NULL,'ba86IuMcXVle8tUmimi8hw==',0.00,NULL,NULL,'FC4F5CF8ED8CCEA90596278EC26D72DE','2019-01-28 19:13:55',NULL,NULL,10,0,NULL,NULL,0,0,NULL),(107,'os-eG5LfZrVKJ5WvKglq_wmvmQTk',NULL,'k2kDHFDmgYPJlNCM11Sk6g==',0.00,NULL,NULL,'5D8B0F3A46F9A7BE5BA22255AF671DFC','2019-01-28 19:19:25',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(108,'os-eG5CAv1ks5CJfE_eL3_Z2ryP8',NULL,'jeGUNCBNFu9XM1fIxbLNbQ==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIr73nuXImBd78kcKSMzrCIXfZXB5TT3kiaiarFr9kK4Day98xAGVL8mu2MKzkDWnjx0icicnEdWicNUbg/132','静','FC259FF64D3B3059A7239B113564C71F','2019-01-28 19:20:17',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(109,'os-eG5PcuA6T_7pDX9HpCcu4mg5I',NULL,'qvSm9lC/khYYYvZocq/J+w==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLrEa19I3aQkdKtuu4dPFAEXXHzWRWkyghtfM8ONNzxYMCpiah5Je3HvKJf2c891WlB1EVibsGcictkg/132','莲叶何田田','BFF57181EE25262F5374CA40A8777156','2019-01-28 19:20:56',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(110,'os-eG5LhM9TVArrW8047o2XyB9V0',NULL,'P/7FbvrM1DRaaqwB30fsXw==',0.00,NULL,NULL,'9D7AD76C7B5F444446F7ECCF505453C5','2019-01-28 19:20:37',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(111,'os-eG5JtNiY_yqRr1fmjs-FYTTLE',NULL,'XYpVb1i6owjPWgpTdFFfag==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqle9AkHluRd0o4wGhuIzwQicAkpIGmibe9OIGPYiaslC4ibibBicZDuGf8viaAwwZmZkHxs6Mwg9oe3VyXg/132','玉沛','71B2A19E6C2E5B3BC4005003E460F844','2019-01-28 19:23:14',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(112,'os-eG5Gt4gDlU8SkzYaYteBaXrCE',NULL,'9f2khQBr4xTPtqsA8QaIZw==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIQXqfswS1ntwxu4rUGOBfqQmibSKjNb64Zn6rYoKX2q7Bicp6wOuQhPEFJSD77BVbX1Cf1rS7TjFIg/132','陈颜秋','E3344CCF549D83839554ED4D6389B1A6','2019-01-28 19:30:40',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(113,'os-eG5Jpzwmr-wrO3S2h9kvml_TU',NULL,'6zsNSIZuXyFqiMvSO2JUcA==',0.00,NULL,NULL,'C25BC69B7C3E050D1EB8AD04A6703A22','2019-01-28 19:31:27',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(114,'os-eG5InIIBSyiMfoln2XLo8X7BA',NULL,'KNkzt0qWQVjs7TE0iXwPdQ==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/iaNPNiauvjBfkDlR71Ad5WIHq7Pp5hmSQqPy5RRicwFpUPmJDYUDtNOS7JWMhTdN5vicXGVHbNGvqPoCoSHVXyf4pA/132','书阳张','3B732ADEC0666EF4340FC73AB0CFA964','2019-01-28 19:33:12',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(115,'os-eG5MyxcuOPKtsjft3NLm3AxOY',NULL,'cJ4Q+cotoLFGzn0VTfdohA==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq4KA61ia12DFl7xfKqTUqIZhbGfZTZ1YYRoDfwqichItrJicsdzLHfsabicFooeF6ttBoyPYjx9DVAAA/132','盼盼','D814F0A06ACF29100997AB3C90B6E0E7','2019-01-28 19:33:19',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(116,'os-eG5MsDMgYrSU_vPA6ekDW3v1Y',NULL,'kA3bF3z/mHJFB7CBQ6BfQA==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/YclPrQlxLUciamockmeIHyxVI2JiaCe7ddCoQnWJ4mjt5cYEaYNAap404VxUiaBwoVxZEKXuicBryR0PlgbqJBRlJA/132','.....','E8115B8A045A09315983F5235D2FA515','2019-01-28 19:33:31',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(117,'os-eG5COfUSrqmL5CbJrupa3Jpt4',NULL,'VcjUbs5Sw4Ax42oL/GHeXA==',0.00,NULL,NULL,'E15C1C676E41F5D6D7269C5AF1281EC8','2019-01-28 19:33:16',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(118,'os-eG5NAWURtzCh31rmV46HvlUSY',NULL,'vExRAVJZxB2VNM8qsApn4Q==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIibticIBly5jCVEfHsPsJylIPI2DpBbIdPzvz8Ut2925AuZIzxW0E9wBddIoBWn0icLEftTz7JuIrVQ/132','shine Lee ','628C3456C0E624C54022E48892DF1BB9','2019-01-28 19:35:55',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(119,'os-eG5B1pbAh21nJ_455PmPprIyU',NULL,'68kAD1LA5WCKkL8WE8/nPA==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLXdy3WrrCgHuf0wyIZuoUw6cCf4Bbhhjo2vbSqdsUxOEO3Dc7TACGicSqVnt1TJV3lg3VTrSSWBiaQ/132','岩','1015B4B279493554F9751F64E6DC69AF','2019-01-28 19:37:27',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(120,'os-eG5CXAWr6fXldg8O-nRaGSDZA',NULL,'QcULjTfFfsEIy1AiD0vq7g==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epECdC9douTJSfRsHc0RWAkmPgrNtkWibeiakR4XfJYHRn8p8TES1gyyOkicCibCTHyEMPKvt2uZSHKUQ/132','꯭一꯭蓑꯭烟꯭雨꯭','30332BE49644CA19E24B5D592FBC58C0','2019-01-28 19:39:23',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(121,'os-eG5AYVDp7zAkzLaLDaSbEfoGY',NULL,'Kefg9v3fWNuAneCP9GR9lw==',0.00,NULL,NULL,'B25458CBEC0A179DF0B23A424CC5285E','2019-01-28 19:41:48',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(122,'os-eG5Ntha-PTTAvP9CT1UjP_tcA',NULL,'LjM3/VFJcD3EKrREFp77wQ==',0.00,NULL,NULL,'C622A2C32273AEBDDA8A8DE99E7B3F42','2019-01-28 19:50:43',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(123,'os-eG5M4i8yZN9ISE0R_nIbzT0wg',NULL,'dH+4r4CGJHqMuMqASFu8Uw==',0.00,NULL,NULL,'8962EE0B1A91FA17E505BA85E10F1D17','2019-01-28 19:56:26',NULL,NULL,10,0,NULL,NULL,0,0,NULL),(124,'os-eG5Bm7DqprxsNwSkA4x-9cc6A',NULL,'8L1bPINkYY0dUM/pqMPSUg==',0.00,NULL,NULL,'28AAC0E86F5AB31A870299C612ED1750','2019-01-28 19:58:43',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(125,'os-eG5P5GGnlJfueYTzjejDEq1R8',NULL,'9WP2zHuFyhCXbIiaYqf8dg==',0.00,NULL,NULL,'A562624C1FCFEAD2C1914907D2577464','2019-01-28 20:02:34',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(126,'os-eG5FqSh_IBtTh04V6HfW0wtLw',NULL,'Yw6Q3lyvYPUThsD3XE5nqA==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLOWRiaXcjicmYicje6WmFWu4KdLHvlYicic9mcwSpapniayGQBdpWiaOhQ0ORKhZ5cgdot9ZFBDTCtyWttA/132','丹','DABD4F6CB1F42029C8D4D5A4B3EE4C1B','2019-01-28 20:04:06',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(127,'os-eG5LA3EshWGpbRkyGbwe98zQg',NULL,'oUaShr6FWZrwLVD3igGUKg==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEJiaGgn5nZBqsWpeB0XGJaxnCaiclHSaHiapyXdpjEhF5FHqsHG5lSyVjvxw8dvQI0T9fIx7xBRhxp0Q/132','任识广','A99C6B659FE396F55108BE445331E891','2019-01-28 20:12:15',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(128,'os-eG5D6qT5MYc1lUlSPyRKwhHWM',NULL,'YgfxgMJUU71ByF0uoRjymQ==',0.00,NULL,NULL,'322C69F44113C6ABA03D940B218CCC88','2019-01-28 20:17:35',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(129,'os-eG5B6qfErinVfriBDki0IVMlw',NULL,'N4C73UazDeHoKvCHzNXR2w==',0.00,NULL,NULL,'80E07DEB0669FC9B91E85D0E7CF0EAD1','2019-01-28 20:25:48',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(130,'os-eG5M_vAy3AwqNEpy0Um1rRa1A',NULL,'419DF8LhmaKmBsaJFL7ERQ==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIstR9CfEytdemuuWp78nG6U5qVQJbH2X7kK2ysQvdIkjKvHKibFjhj33dMc21NHafolRRLW9xAJrA/132','小苹果','329CF0277B1559A1A8F32337D94A81A6','2019-01-28 20:38:57',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(131,'os-eG5P8b5SU6G4JUULu6WKdQ8No',NULL,'nwoob4LSjXNAdDXGyhgO6w==',0.00,NULL,NULL,'5DD3A4969C51AEDE73080E497262E5E1','2019-01-28 20:41:26',NULL,NULL,14,0,NULL,NULL,0,0,NULL),(132,'os-eG5F1eMdN8hBiQgjQY2lBiejY',NULL,'YJGtE3u5pr3K/brdnlNiQQ==',0.00,NULL,NULL,'5194D89C59DF0E46ED27902684598833','2019-01-28 20:41:50',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(133,'os-eG5NjF2zQQ1gmztN5slkFKdbY',NULL,'NLROA6rTuD2XJgtyDAVFeg==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqoDmNEJkLqquPCeDQgxicnU3Jy5UqwesibfGs758vB5ATTVs4Mk7HxhX3ics9aDQ4z5tbS7SW2Q5e4A/132','蹦跶兔子〜','83AAF9007AC7F965171E9D2A0964D190','2019-01-28 20:44:44',NULL,NULL,14,0,NULL,NULL,0,0,NULL),(134,'os-eG5JCpWfH4bGfE-WlEqRbJVWQ',NULL,'Kh38FzYG+NZESLp6p3WsBQ==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqGGYe1DYI0YcVs1sr8UnRUkIGibIGWYDBthC6uDSj6EWT3JeSlV0QS1zibKpIMmxYDqpYX4yteExRA/132','郭程刚','4E004277C64C1887E306A015BBC7C911','2019-01-28 20:46:40',NULL,NULL,14,0,NULL,NULL,0,0,NULL),(135,'os-eG5LOimFM49YccjO71DQGaexU',NULL,'kW0IDof85I+TX4ZQlGN7HQ==',0.00,NULL,NULL,'1311BAC35CF73D55402309DE1246CE8D','2019-01-28 20:55:29',NULL,NULL,14,0,NULL,NULL,0,0,NULL),(136,'os-eG5H-vWLX3RzX_E_4DlsoEOJg',NULL,'r+fXxm+SB8JqvxLkbOn2Kw==',0.00,NULL,NULL,'647F367C2C98A3BE1E1809EBB7F1BAF5','2019-01-28 21:01:50',NULL,NULL,14,0,NULL,NULL,0,0,NULL),(137,'os-eG5NfNoh2TvvidxecyIAtjnoQ',NULL,'pHCgLACd3p3Ha8Aki499QA==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/1sFf5Uc2KmUpQCaCCzic3U9mekPGh9m9pEtfj17JQpAacG0fbzmySqZWAiabPlAk3Mdlhu01RZdHYHonlT1tPBCQ/132','橙眼圈','602FD268D4EAFE64F00A5639D11F648A','2019-01-28 21:05:09',NULL,NULL,14,0,NULL,NULL,0,0,NULL),(138,'os-eG5EZH85nwZy0NpjwV5Mf4GvE',NULL,'yvZ7amtmT+KYn5N+RWH9KA==',0.00,NULL,NULL,'AE5C3AAFD1E59AC38F98EFF2D32938E5','2019-01-28 21:06:42',NULL,NULL,14,0,NULL,NULL,0,0,NULL),(139,'os-eG5ItF32495-YYhBBW55z_7HY',NULL,'iQObZ7ga7Fj07DGebsuW1g==',0.00,NULL,NULL,'D0E80754604586AB675EA45834BF2C5B','2019-01-28 21:07:14',NULL,NULL,14,0,NULL,NULL,0,0,NULL),(140,'os-eG5EZNc8Jwi04GPGrSAY5SKk4',NULL,'8oaLZV8yMArhK4Jb4B0Ukg==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/T47ep9TMicuHicslCj6tBj7SyYNccFoB7hS8hO8Vl2fA6zytqLonl4PMqviaO46HDzxhTmpDV9CaAS1AkeseuS78Q/132','小盛','9EBB6B9EE7928C8D0C56B58A58050788','2019-01-28 21:16:12',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(141,'os-eG5BswLs1xGOm1RYJElD1y3vo',NULL,'ZMUe7sOt2if1YGUQy8caCQ==',0.00,NULL,NULL,'F5D89E9C060253CF648FB193156DE75E','2019-01-28 21:15:12',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(142,'os-eG5L3EyQuZt5mL18kcw020Jf0',NULL,'8EwrQBx5T5TsG+C9qY68yQ==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ8yRAUMxjzMzfYlBcsEGmp3Ew7sgXlPGpxMxCEOSozRiaqVicNjxFAKbIaZd7ZiaXcIzMmBBC1dPicxg/132','小川','749887960BFC48CFC129ED9E3885CA46','2019-01-28 21:15:42',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(143,'os-eG5A7ZFac8Krs20NYllU9YEBA',NULL,'ZgI29hoVGWdkasNsHbjZSw==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJaumFIXfWKWpQF99icOvOjWHNJkzSvrPNdKU8QFUTGKwuy3lpGqet5ZzmiavBZxEk4t0iamkLNKERicg/132','Tina','382F84E661A061B35DD2480C09095023','2019-01-28 21:18:45',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(144,'os-eG5IinhPeFPc2TIZqoRe5u2o4',NULL,'yxX4d4V1HdqFCi9sq0UlKg==',0.00,NULL,NULL,'FB398C32EA6AA4CFBCC9CB289383B3E5','2019-01-28 21:17:58',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(145,'os-eG5BLq1Gz8aq2Bm_2RQpKTHzo',NULL,'68roGDvtPkNJJiR1GrHdZQ==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/bJnPibUhzcdNfgGt3nB2JehMrr4jnA2QAYwpQKYVGJ1NPPF4gA7z1fI1IAAdhXR1GibFicVG798IoYiaq0ONXBKEEg/132','李晓伟','5B118A3BF98BF8EA66C8278F07486B73','2019-01-28 21:18:58',NULL,NULL,14,0,NULL,NULL,0,0,NULL),(146,'os-eG5KcYvGxSFcmnpi_5PxIdf1Y',NULL,'8L0AcqGlZ5ErgCw6tNI3Rw==',0.00,NULL,NULL,'3580B6EA893ABC243EE8977291A567D1','2019-01-28 21:24:30',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(147,'os-eG5CX6ccKF3xWu0p3UX-HW2b0',NULL,'znqyWGGMfl1d6p4D4nSS7Q==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9ibyyPPVwxDjopNCFdHh5e4SqSQN7v3S2lk4DQNwdR03SmLBAUsib7Ro9nfpjnk2NjoMUYYzZwjrw/132','軓寶貝','DC756500BF953AC7395B1CBC763E47C7','2019-01-28 21:26:23',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(148,'os-eG5AcTgSbN8_tFdxHbOqZAoJI',NULL,'jCPyrofZhYx+TwLNreDpXA==',0.00,NULL,NULL,'34AD78278C2BE342A339DAA562716310','2019-01-28 21:28:27',NULL,NULL,14,0,NULL,NULL,0,0,NULL),(149,'os-eG5IvJvZvsTWMibm9f_WrLCjU',NULL,'0gGgl1r2bSzd25xMx3l+Dg==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/5NGX2jRjmppyTcS1ia0LwErx7X1BBYZiaOUP4CEtvzTn9RNSRTwlJVURlEJIhuvKdFhrKo3pcCt7YlZISTj5623g/132','贺丽莉','D06D548947653EC9B67868B65EBFF94C','2019-01-28 21:36:33',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(150,'os-eG5OhaqygjSuGvaSu4-YBdTiw',NULL,'gV2i3fwc0j4azJbGuRaDcA==',0.00,NULL,NULL,'CEA90EC585C1446BD1614B71B5E73CCA','2019-01-28 21:38:01',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(151,'os-eG5B7VjtsoEOXIVgswHEbR9ao',NULL,'AxyfyuE+j62M/j7g/0Rp0Q==',0.00,NULL,NULL,'BDDD512C6B30985D0A13CC87874DE37B','2019-01-28 21:41:35',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(152,'os-eG5Cj7C0dkclSWGN1fpouB-Ls',NULL,'9ofvjg7adO3z87PjYO0zuw==',0.00,NULL,NULL,'B2DD8B363B1C4E0920894F8E73C8E097','2019-01-28 21:43:19',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(153,'os-eG5PktIahvzWBu-rX8WbwAcFI',NULL,'Uhu2ntCRpuai5LZ29PxcLg==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eofWcibpzKG7HRmHuN8rED1exZNDHxQvvIcLC3U5P3ZM9VzN1apBibKKr7a7icxhaLBYmr6MJEhWiaDdA/132','阿庆','A33BBED0A3965F26CB71F636482A78D8','2019-01-29 15:24:13',NULL,NULL,14,0,NULL,NULL,0,0,NULL),(154,'os-eG5J7zXdT_99Y50hlIO53Iq9k',NULL,'F/Hl0by65wZ6kPasFliN4Q==',0.00,NULL,NULL,'C1480EBFD7D78338576BFA65E8376068','2019-01-28 21:46:14',NULL,NULL,14,0,NULL,NULL,0,0,NULL),(155,'os-eG5Cj1EcP0Vb3aVXrbsEKFCQw',NULL,'n/GohG7jf8MNGymJUDjZyQ==',0.00,NULL,NULL,'FFD51F9B7AC35C79F2A55804124C0302','2019-01-28 21:46:33',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(156,'os-eG5HGt0Mbd8XK170VoouvPuSs',NULL,'2USK0apqT9JFVQgDhYnnCg==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/e3jGPp6lPOQ16MmiaSgWM1wJkIz5ibxWYW6zV3OaHicqvusKyfS5xsCjicJsGeIcOib6amaL0NrJPjheRMrJT8mQ0bQ/132','sophia.','6FD58F056D01BA121F13ACDDB475F118','2019-01-28 21:47:29',NULL,NULL,14,0,NULL,NULL,0,0,NULL),(157,'os-eG5CTJLKLuCM0ow_GqOTMCixA',NULL,'aNJJ36GRmAw4Z1HaYL5VTw==',0.00,NULL,NULL,'6269F343DA873114EFE419816C29346A','2019-01-28 21:49:19',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(158,'os-eG5M0ysvQHi6K-jLDYbgg6hsI',NULL,'SLCgIEy42IOQaQF4O8t17A==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKGF6BdubSaUIXZw7hb7x9SrB3p2eHNKDfOrmWOEaExj4cJlWJCnI7NXYVBbicmPRTPhc1dF2EErvg/132','微笑','92843F62BE280DAD68C048D58ABD7400','2019-01-28 21:50:13',NULL,NULL,10,0,NULL,NULL,0,0,NULL),(159,'os-eG5BpBEy3QYeiMRQlEayKKIZY',NULL,'wqMusOYGoHeBYkI/9fAoxw==',0.00,NULL,NULL,'46825B5E7947FA78F6E43E15CCA41FFC','2019-01-28 21:55:33',NULL,NULL,14,0,NULL,NULL,0,0,NULL),(160,'os-eG5HXiYurUzZF2-qvjW5d_VlY',NULL,'zio1pI5xZJ4sRTHdSqSJqA==',0.00,NULL,NULL,'DC008D4FED666EA9E7F2DBEA95CE6BEE','2019-01-28 22:00:35',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(161,'os-eG5NfYmXNU_fbGACiQJWYFGaY',NULL,'e9jvkgPh78/k3TARIVZTtQ==',0.00,NULL,NULL,'4EE83E4EC90B56551CF016101F2CA9F0','2019-01-28 22:02:20',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(162,'os-eG5IcJ6Vexn73cqKUNwkoCNe4',NULL,'yd7hFp4a9mqDdZyjSW8zUQ==',0.00,NULL,NULL,'2D081BE1E5582EFCCB98438F39A6ECF3','2019-01-28 22:03:53',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(163,'os-eG5F_dp-AuEPFZUp4OpCnSKdM',NULL,'LHk08jeL4Tunx2ulxp/RHw==',0.00,NULL,NULL,'C371D103EE500F83513A5C5DE1256A03','2019-01-28 22:05:17',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(164,'os-eG5LAwPOfulkR4g-Zfo9DYIaA',NULL,'8/bIA0+0PFhRf8ux7AFEgA==',0.00,NULL,NULL,'BA147E1A22E796D18BDC651CF0E459AC','2019-01-28 22:18:36',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(165,'os-eG5AjgLtJG1rFhxi1AwebCRzs',NULL,'3bbAju+zgS3VOTbq3IRq6w==',0.00,NULL,NULL,'6EBB0648A5822300FFB4887574468FA5','2019-01-28 22:18:57',NULL,NULL,14,0,NULL,NULL,0,0,NULL),(166,'os-eG5LmzKnnCEMGJUYYMpn1RBWs',NULL,'YzLqXbM7TtOwYWrzqPvkrg==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaELJvG3M0IQBGOicmUq05fSueT6g4IE1RgibqrmcB8QNvmTmDY9Hfe5c0J0BuP7hL2bicUUwoJLzINzUQ/132','韩红','8F4EE0100899A4066D804C93D9E74EC5','2019-01-28 22:24:10',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(167,'os-eG5NEWoerbDBscfjrVzqPgUUk',NULL,'HPPlIXmHqh2rm3RXUWrLZA==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/iahL1a4fuyBRYol32Lr09muMDUichLBhb2aSr5iaaagm0WgnwBBW7tiaghXRAdUk6qKtGGlElQiblaz5Sibl4XVSVBwQ/132','你若安好便是晴天','D6F2B6004914ED57CD7737B88948CB95','2019-01-28 22:28:36',NULL,NULL,10,0,NULL,NULL,0,0,NULL),(168,'os-eG5AkhXUJ2yVgLuv6UE2bTFYk',NULL,'n3eVZg1d0GexZ2tWUyY6mw==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJINwfLJnygyYjRISruYnt26Vfhc3BNzryBtOSibiaHAeJdBJ0s51BQJtdZIQmGpCs5zgvx6NNQDHsg/132','婷婷','CA17AD4D98730AC5BF3B03D790523E15','2019-01-28 22:32:27',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(169,'os-eG5I95pc_GzbVBgmQsSfkz_LQ',NULL,'nmvhaMhKoWGX2jdDL4SFPg==',0.00,NULL,NULL,'B051E70031340D2108F54FF7D2AFC219','2019-01-28 22:35:59',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(170,'os-eG5NsQsHF71CyXFgVD9cX56Ew',NULL,'0NuGKG4/ySW1ykamqMvzmw==',0.00,NULL,NULL,'545606EF1E67A17B0C2F7E0871D5D2F9','2019-01-28 22:48:01',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(171,'os-eG5OUWPHUEdooUSbCTm9sS85A',NULL,'DtyJ/QAYEe+uRbrtptEMgw==',0.00,NULL,NULL,'7A9EE3D66EBDD76492BB0769A1F91419','2019-01-28 22:56:16',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(172,'os-eG5ELARSNkH424lRVX7SHVtgE',NULL,'YYxAy8q2KnoVzdgZUZReZw==',0.00,NULL,NULL,'A7FAE6A3E6D6746DA7805AE835A847F5','2019-01-28 23:03:10',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(173,'os-eG5AZDns1g30N4vUiQDHeMuCQ',NULL,'6CZ6Kwd4NfxdVdjwSL/UUQ==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/5Iu87jvDEdMPQs301Oox2nrStfavlc5u9YRURggYqDRic5Dva1KTRoh1XKAicuP1KTLSe8icia1IMFI6rvHMmtCMWg/132','katherine','574A8FF6B065930D9984E7466964E131','2019-01-28 23:09:48',NULL,NULL,14,0,NULL,NULL,0,0,NULL),(174,'os-eG5GE1xHHGtqB7A3mavBqEaEE',NULL,'J9PiBEenV83u/Kz49Ippkg==',0.00,NULL,NULL,'141B23EC25D20F545C1558EE0F04467B','2019-01-28 23:19:37',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(175,'os-eG5GQYHSonrKvwLB5N_Q-iegQ',NULL,'6lm/HXrQ23JL7oLjRA2VQw==',0.00,NULL,NULL,'8AD9B4D5B6A902598882502F9649C460','2019-01-28 23:35:24',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(176,'os-eG5JOmIBAkirJVmrpj5X0IpIo',NULL,'d6T6iZXeJkDH2nZwhZrRSA==',0.00,NULL,NULL,'834850A3C7BA129DAA8A30A583C5505F','2019-01-28 23:45:13',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(177,'os-eG5CtDJ2xIW1Tp-CKll2KNR2A',NULL,'AImODMwfNHlBsAJC+PmVOA==',0.00,NULL,NULL,'1A561A161E82B57923D20C018AEB829F','2019-01-28 23:48:18',NULL,NULL,14,0,NULL,NULL,0,0,NULL),(178,'os-eG5Ln74aSsl5LEqIS8Hqo3UG4',NULL,'Gvrn2dut2/TotME/v5RC0g==',0.00,NULL,NULL,'C678930BAA00D693281E2536C2F2D3EE','2019-01-28 23:50:16',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(179,'os-eG5D6aiw_-rLXTjmeEwdZ0gRg',NULL,'h2RoIGcUxeWrJ0SiDmAEmw==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLBibKcpFUVQqIG2Dd8icTcejdt5n44mpeXPavOTBjOeUcckNGt0Cvqfh3frqQQxhCSoN4YfO296hEA/132','省','E758AA196862F5624BB356FD534E9FE3','2019-01-28 23:52:55',NULL,NULL,14,0,NULL,NULL,0,0,NULL),(180,'os-eG5E_YBlYc40dUGPPoxIrnfNk',NULL,'eK+xVuY19FVV6EdeWxjotw==',0.00,NULL,NULL,'8D158439389C6109C985FAD2C4EEC636','2019-01-29 00:48:50',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(181,'os-eG5LUM06DBYxZ5cOCB0i3YMdQ',NULL,'EmitN8YfhlOgDEH1Oa1HMQ==',0.00,NULL,NULL,'B01E40ECC2FB9C70109803A6E655A00C','2019-01-29 00:52:42',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(182,'os-eG5Lo4CNhZxdcJYZx-QwPxja4',NULL,'2wz46+/a//mW6brSKNXByQ==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTwoaHq3OWX8dsKyjmcejGwxyKNuk6nricCayXfQXWjfuHibibDFcic8gpMQbSXiaDtvAlW71aMSuVHLg/132','','EB8BBA5979301250D05027457301647F','2019-01-29 01:28:59',NULL,NULL,14,0,NULL,NULL,0,0,NULL),(183,'os-eG5BuaqxNgsWe28_8mWZHgmd0',NULL,'LchQUR0zX6ro51D4c3/ndg==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLNMoXfvZA04exwKynu0etr5OSXo4pZ0Lx1mDnOnfhjsNbv8nA2jJIGMVG2QTz3hcqEj6WLulVibEQ/132','teemo','9FA68F94063498209A83DE9B4D6BE030','2019-01-29 04:44:07',NULL,NULL,14,0,NULL,NULL,0,0,NULL),(184,'os-eG5P3hQUeRabtLHZIFlx8bUAo',NULL,'WDhFz8l7UJm8z0OdCCn5uA==',0.00,NULL,NULL,'0F629A73AB949EA31AE2546DD70838F7','2019-01-29 06:20:52',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(185,'os-eG5Hw_LWkDDLAS9KKbHBa-fKc',NULL,'S6khJGG0zJ5d0iVGLsVAWQ==',0.00,NULL,NULL,'2D25EBD9BB173B202448BC210FD28913','2019-01-29 06:36:18',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(186,'os-eG5AnlbxeeXjJwPoLWlwoytcQ',NULL,'RKj1z8gxBotdqvj+U03ItQ==',0.00,NULL,NULL,'E175B0FFB2AE7779752FE331FF8751F3','2019-01-29 07:15:02',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(187,'os-eG5AF_TVnFhPrI7BbdQP8NKyM',NULL,'l6oc00MZi9fzQEk5/plIkQ==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/KhbkQf1NI4BlL6qcyf4VahH7wSnqMNuP3icUD7okJzP1HQ0Ph7F50EViccALYOrUfquniaIBUtAoc3siaEmhfMdTIQ/132','月下听风','C4032A748BB2748C72D1987A3D512163','2019-01-29 08:30:58',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(188,'os-eG5MPjEJcc_jYleTZmT4XbXHI',NULL,'B/C1PvU3TCLi4EMGx/IQnQ==',0.00,NULL,NULL,'F0FF73DB02DB08C28709446F004B65F9','2019-01-29 08:46:12',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(189,'os-eG5Fk7Pn5rUDWuEAtK64uFpac',NULL,'usFnqRCbXCMmu3B7wPz4oA==',0.00,NULL,NULL,'3BCF97FB673D67A32E2B7369975B04BD','2019-01-29 09:04:03',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(190,'os-eG5Fk7Pn5rUDWuEAtK64uFpac',NULL,'usFnqRCbXCMmu3B7wPz4oA==',0.00,NULL,NULL,'3BCF97FB673D67A32E2B7369975B04BD','2019-01-29 09:04:03',NULL,NULL,10,0,NULL,NULL,0,0,NULL),(191,'os-eG5E7XalZ_gilCjyU5KrTggO8',NULL,'1F0742AdsmchU+S8hfiGVQ==',0.00,NULL,NULL,'0D65704501F9B7FA97675B7A90C8096B','2019-01-29 09:05:11',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(192,'os-eG5HyRkp6WMoV-5gyxFbMooJ0',NULL,'UHbV6vCgXVfaiqzsnlGmDg==',0.00,NULL,NULL,'91FE3C58FEF4FC751C1AF7D553CCD2C7','2019-01-29 09:08:25',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(193,'os-eG5HC0uoU54WtYmkJDYuOPWZE',NULL,'H47Qi7NF7uZgXxwzq1KLSw==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKG6nZXNOaobK0FhydJdh4LUYcnA9njfD7WGcN0N6AWGDPhU0HicgBouL7xJ4UMyyk3R5bnBlwBLzA/132','Liu-小芳～','24236A085D78C379678679FE7664A52E','2019-01-29 09:31:28',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(194,'os-eG5J3zt2kVpbM1HqNghCpSgyQ',NULL,'HXZ/zY2abziQNQhlcwp61Q==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/zyyiboUtgxyhBPTYlkQRA0r3l2QZaVtJujDVdiaLkLMj7WHS0MibvHVJhSicdFMtVSaXDgArwk5v90JjHHwTLqmG0w/132','Xyi.','548DB5BD06C64DB8D0F98A38738FE5F2','2019-01-29 09:47:03',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(195,'os-eG5AUDkNf8a-m3TxMR1WHg9WY',NULL,'MLM8CDHUhwL9tzxIvrRtEg==',0.00,NULL,NULL,'2BA331EDE359858CC0679025EEC77521','2019-01-29 09:51:40',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(196,'os-eG5O-qjD358gf2oBvsMbqW8WI',NULL,'DLPr6AD3mqOi+oNoVJBhBw==',0.00,NULL,NULL,'46F1B4EEAA7B2AD491ABE3CB9111FD1F','2019-01-29 09:54:56',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(197,'os-eG5HFKc6VwjpIi85dq2GsnmoU',NULL,'aJhYXgsCjpGbdUzkE8zcIw==',0.00,NULL,NULL,'0DC0BB4A80D60D8D9F635D6C6597D128','2019-01-29 10:48:19',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(198,'os-eG5I_BDYn0MFQDd-7Rsp3a39Y',NULL,'SxUZG0sAcKqdMQ3rYahpnQ==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIHCOwemq2SBTcAg1Hd2icSsqYgLH0WlOibPPtA0JicJ4gFBRWAEwYQErg6gfHBnc4YrHyDbmQA7zoLQ/132','香夏','FCC0C6F5E80BF5D565584C48B9A534D7','2019-01-29 11:22:30',NULL,NULL,10,0,NULL,NULL,0,0,NULL),(199,'os-eG5I-tiJaSv4feQPJCQ7FyBd0',NULL,'EJRMa3AGjyJ6hq76VGxxaQ==',0.00,NULL,NULL,'A8CC0E1FB9D5D75213B93255DF1EBE2E','2019-01-29 11:43:32',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(200,'os-eG5LuFM8dSMQ615TGOyU-O3KA',NULL,'MtJI4eHlhnCLoJ30qLnpqw==',0.00,NULL,NULL,'7971CBE70B604E8DE50248092FE954A2','2019-01-29 11:59:12',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(201,'os-eG5JWElFKgOzydgrufSF4uogo',NULL,'sT6oI8uLidqHCVKfjyDuEA==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/eGeTJoMXlqiafRkePAX2YsRZ1L0rSrgFMAQ7TlVU8ALicn69VHictJkEWuYAUnwiclHPibibb6AIPvwkKl6P8iauhAa5Q/132','子在川上岳','BE97A7C0042E98C74E07D53362A5E50A','2019-01-29 12:24:15',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(202,'os-eG5PaWvxwnMCI18xCoypMKnm4',NULL,'CXy8Z08bTk5FAtBYyAoIyg==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJsdnliaPgbibA9pgxccD80ibJdgPrlAZpjRv89h6nLPURwS9H5iaRZN67ibqg2DO6A4kxRQ0rVHvGExqw/132','妮妮','6F861EC1DBADD7B15391DC9DEB07A934','2019-01-29 13:11:23',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(203,'os-eG5AP3_qQkJ2rNPAcYgQN8Czo',NULL,'yPsD6toaKw47mNB3P+QXug==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKCAzhvv56mQr3Nicsa154hEU57LE0g6uquMNd8AeicAu2r6OUYYCZo7mdpN8oveDQfrUdYKibw1c3gg/132','学无止境','F3B43FDC6E30B5B74F01935FA2EBFFA7','2019-01-29 13:20:09',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(204,'os-eG5DOXAneKt-NXuMklYvY4vrM',NULL,'mOhPREHFngjxOVNY0iaARg==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/4VKQ8UlUu9qO9Z0ge4sStX6JeibNeQNTfUuTKQawbialKnKL9hF5Hf5aMUygE25Ukqcia0bNkWSonD5jQlV89K2Pg/132','心飞扬','E21DC3188EA73C2ED69D5523447B83C7','2019-01-29 15:20:54',NULL,NULL,14,0,NULL,NULL,0,0,NULL),(205,'os-eG5EhNWEg8F6Xw9MKn2OXFfiM',NULL,'V0hJxNBD6u/08CKDL4wVNA==',0.00,NULL,NULL,'7ED1F354A8E305505BB19E69EDD01A5A','2019-01-29 15:20:43',NULL,NULL,14,0,NULL,NULL,0,0,NULL),(206,'os-eG5EhNWEg8F6Xw9MKn2OXFfiM',NULL,'V0hJxNBD6u/08CKDL4wVNA==',0.00,NULL,NULL,'7ED1F354A8E305505BB19E69EDD01A5A','2019-01-29 15:20:43',NULL,NULL,14,0,NULL,NULL,0,0,NULL),(207,'os-eG5KE2g5QPOxUdlQsnxmKQbac',NULL,'K/iQqS7q71E29anPqgk73w==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoJV7SlQTomwUTQOMia4NnibEEMzqCoORIG6kSrpU1tDIQkibzkMuT613zDpVZFjTRrkDnlibWOtkvdjg/132','赵泽铭','5F0AA525884D68BD10296CCBC4DA96BF','2019-01-29 15:23:22',NULL,NULL,14,0,NULL,NULL,0,0,NULL),(208,'os-eG5BNTk8zx-N0nJAMgzGjxGwo',NULL,'B4Tb1RplbgncER7aMiMMyA==',0.00,NULL,NULL,'20A0B770D72AA33BC51836E2C42522C2','2019-01-29 17:03:24',NULL,NULL,14,0,NULL,NULL,0,0,NULL),(209,'os-eG5CVeEyBg7bHp9HZWlz1-m1c',NULL,'BZpaGdi5Ui1ogQdEmECEWw==',0.00,NULL,NULL,'F638712DDB38AC79E9A4B68938E26CEE','2019-01-29 18:39:26',NULL,NULL,40,0,NULL,NULL,0,0,NULL),(210,'os-eG5Mtw5GYTNZHFQyy9y9pF5To',NULL,'FOeDAlNuMF9cFHJkB8IkpA==',0.00,NULL,NULL,'EB5DF87C7DA31586445528F0A7F36D4D','2019-01-29 18:52:34',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(211,'os-eG5CRwukx4NBFTIwvhuERjt_k',NULL,'Blb2Sa2KboOYGxgu4tI1Aw==',0.00,NULL,NULL,'C4DAADD2312F076B88F40C62EE1CE940','2019-01-29 21:48:24',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(212,'os-eG5Ldu0XJLvF8GYqyC01QPPYM',NULL,'nuE8s8Do0YbWfbBlQ3nykg==',0.00,NULL,NULL,'D66C46CFA580C73BAF53B897B363DFD4','2019-01-29 22:28:37',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(213,'os-eG5H3Pv849r-JwUJ81R7KQ1r4',NULL,'8yG24oAES/zgTuRcgjwJww==',0.00,NULL,NULL,'3D2FE4CA2F864CA252728A62F7DA4FFF','2019-01-29 22:33:38',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(214,'os-eG5O-FZLkXYuA2m_5X0TsbiXc',NULL,'W9dwMgdQGE4jo9SJ5Bk07g==',0.00,NULL,NULL,'151508379C31A55027B082003E7C8BD9','2019-01-29 22:37:46',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(215,'os-eG5O0Kdvm4B64bwGAjKaxlXTI',NULL,'+JZZ/suLW7An1l8SelTqmA==',0.00,NULL,NULL,'2859AC072804B285535B247D1C7E166C','2019-01-29 22:40:17',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(216,'os-eG5DZ5w9tvd03fo3Dq7tvAotk',NULL,'OYhXBe4TPkpsWCKe5enniQ==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/r5cib9ibMR7QKXgDfsOUQrga1vE4a2L8yPKkkAdI7FDSGVbQmpmfFmAZjXtJ9iawTIXAJNcTXprXCaYW3IN7YZVXg/132','做永远的快乐天使(^з^)','FC1508849744E8CD467BEA4929C9D890','2019-01-29 22:44:26',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(217,'os-eG5OrTbmEjZ1J_vftBF2r3vds',NULL,'3GArur10QmaZBN2+DFEhUQ==',0.00,NULL,NULL,'C0A7CC2228EF8D8D087BBE2E56A0A8C4','2019-01-29 22:43:50',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(218,'os-eG5MVhrXRosKe4AGjnmixYfJ4',NULL,'shXgUJ8PX+T3KII4Uk1GUg==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/oVamJ1eYxlEHic1fpwTtEL9zuP1YDehTH1Xe3kibFQDtPGP2hSMC5a3VRQiax9ePicjCZtExFIfHRKpUVRZCV40hQg/132','奶糖.','0238019418D90040065BDA225CAE7731','2019-01-30 11:18:04',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(219,'os-eG5DpIta292KoQNWebECCVKFk',NULL,'WmcQUa/IT6ZA2iDCClw9sg==',0.00,NULL,NULL,'496E56AC458280FA2962F3139424F4B9','2019-01-29 22:45:46',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(220,'os-eG5INfXfI5CyaH4sl-WUUiEVA',NULL,'epa6e2t7v910h4j1wfuoVw==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJFvgDmzCbh5l47eINic2pUa9jMPlkzJuQw5DgrdSeZy16icoorrOrEoCgSJ1lUc2C6h3niadMtSZIiaw/132','有什么没什么','CFF725A2272A1EE8B515BFF1F52E3872','2019-01-29 22:48:26',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(221,'os-eG5IoqfLFJyAJ5dbYILkGLK4Q',NULL,'otd3kbJNUS13/pGcgPXOiw==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/icQicGJcerap4Oe8cN1Yibs7eUFLIV6a3kkHpAMic6XnHOGUcqV1Xicstevl5icoo24FiahMalZUeiaTu433ibmH1WXmicDg/132','小可爱₁₀₁₁⁵²⁰₅₁₉','3A446C53512F6D1B8F5D2A5969BE1009','2019-01-29 23:06:01',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(222,'os-eG5G1vvLXzCuK6FU-oCMlDzkk',NULL,'9Z6lw2LKbL6orCfzd9TasA==',0.00,NULL,NULL,'608B93CBED519C607A4A40E714A61FFF','2019-01-29 23:07:19',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(223,'os-eG5K0x5RbQAZ0M6QM8WdJJ02U',NULL,'oN7fZPcwhmepeT2TUar8JQ==',0.00,NULL,NULL,'0CAB88A818E6A1AE742458A1F37F1DDA','2019-01-29 23:36:31',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(224,'os-eG5LOYudM6VbSDw7oaYyAChAg',NULL,'xndpGNtSvu76rSrC0qLKMQ==',0.00,NULL,NULL,'BDFF8B93252EE8B391C93CD4CC4EB597','2019-01-30 04:59:21',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(225,'os-eG5HTfXHCVir--4D0aciRBrbw',NULL,'y/68Cjsui9hEclvfCupxYQ==',0.00,NULL,NULL,'3D82711EFA7860A2B8F8C0009B8F2E3D','2019-01-30 06:12:06',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(226,'os-eG5Aia5CjbB7PhKP1DcKOPGTI',NULL,'l3cSFb0zEjrm+SfpIVDXLg==',0.00,NULL,NULL,'63D8E73E141D61CF74FEC064199883DC','2019-01-30 06:25:11',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(227,'os-eG5FHvB0fTxxtBMw29gPWLYmc',NULL,'ySdpBTDmxXNB/mXv2O+B6Q==',0.00,'https://wx.qlogo.cn/mmopen/vi_32/HptaZvLx7XQ6OM72f51L6b1uZsmaX2F7ic50v1YYlbAjZcVSJrYc7uOLsjR9AMAg9Mx6Aa18OZLa4y1z37RySOw/132','小景','86FC4BE315B01BC3105AA777E8C51FB7','2019-01-30 07:36:05',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(228,'os-eG5G2t6UuJY_i_WH644nqTaR8',NULL,'byPilyac4AbJuhgaP7Ls8A==',0.00,NULL,NULL,'FDF11D0DCA4130ED7A10F614C02DFBE2','2019-01-30 16:16:39',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(229,'os-eG5L-_9kOd_D_qbSb06ZC4c10',NULL,'b2Zkipo7ZmZZXJztFdALhw==',0.00,NULL,NULL,'C5DCFF5B3DE52EE51B3D63E3A8D3C2CD','2019-01-30 17:32:54',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(230,'os-eG5A-QmSq-ZzKpXSl_c1nL_4w',NULL,'P1/nmPZbXTw/1MEYc86dsg==',0.00,NULL,NULL,'58BAFB7162CD15A5F479CB6EFDB85333','2019-01-31 10:12:55',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(231,'os-eG5KiwbeF-6GhZQobRUNuxcT0',NULL,'nm157+tvtBzL26vKSstAcA==',0.00,NULL,NULL,'098672E84618BFBBC396AD88501531B5','2019-01-31 14:20:07',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(232,'os-eG5JtlVesCkBFdikzdWszR6U0',NULL,'6N0yR1bHIqhoI9sL4ReQnQ==',0.00,NULL,NULL,'41B420E694315B0DC10D2068382C6922','2019-02-09 12:01:43',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(233,'os-eG5LZMKa9HOWmrs_nicjQKB_g',NULL,'A7qLaTtH8+5e57rdL3qRIQ==',0.00,NULL,NULL,'98E5960D94E7AE3DE42678D24F7949F3','2019-02-09 15:06:02',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(234,'os-eG5Gsw6MXXOIhK8kGyE3ELo7Y',NULL,'Mp5SOnLlq9wRVC5SdTprIQ==',0.00,NULL,NULL,'5E388A513699EE539B24558116832A3E','2019-02-09 15:34:20',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(235,'os-eG5KavK_ndvM-hSqSxN9IGvuk',NULL,'wo68fIjvPFKoZwTXkFZ9vQ==',0.00,NULL,NULL,'6A67B2BD76304A6FDE28338D9B15BAFE','2019-02-10 12:31:31',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(236,'os-eG5Km3VNYqsWOSySft4dPNm9c',NULL,'LKNGCf8ztPxHYWI0O1YOfg==',0.00,NULL,NULL,'345959EE9AB5E673C277820D90AE8953','2019-02-10 22:23:44',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(237,'os-eG5OCoSEEqz6t08JI_2xMJ_oM',NULL,'OxjBwD0AobgIUoQteootjw==',0.00,NULL,NULL,'125C55AFCE077647B3D8308016AE2A3A','2019-03-09 05:03:15',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(238,'os-eG5PheLXEqS3r0zLDcUfrfkyY',NULL,'eGTvGNM9XdILy4nvQ/ohRw==',0.00,NULL,NULL,'329B951C43EA7A777C5D8F753E42EC9F','2019-03-16 03:38:30',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(239,'os-eG5O3cmmH0VSZWX9Bhdd9-Q9M',NULL,'GSmeC2rvZnxYc/VTRgtk9Q==',0.00,NULL,NULL,'9498600804BBA1C9FB6CE6D32FE2E65F','2019-03-23 13:49:02',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(240,'os-eG5OgVIdvevKi6EtlJrfYiuF4',NULL,'4j3/+177uUoKuLKKKA+fmQ==',0.00,NULL,NULL,'E294E36BA9F596B0F1CD315C8BC7E480','2019-03-30 17:19:39',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(241,'os-eG5C3Wq2bAq3rYGOL2xylQxdY',NULL,'gc+qXrXqp9YxijXcY1kohw==',0.00,NULL,NULL,'E3328111F20502329D5139824BC98074','2019-04-06 04:00:03',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(242,'os-eG5HvHN4M9L429g6W9PUHu7qM',NULL,'XmbqsW68AXb95ig0Y/wZAg==',0.00,NULL,NULL,'AA876DB4287E30B96F817619263591B1','2019-04-13 02:09:43',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(243,'os-eG5LrX85Vpa8xNejl0lXKmtvA',NULL,'+TVHp1LEI8eXU++kKf1jtw==',0.00,NULL,NULL,'4D6B82F7329AA010E401E27F499F04D1','2019-04-27 02:33:06',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(244,'os-eG5OTf95VwczBBuWxCu_eq6p0',NULL,'X0y1TpppWu6fHrehEWc6tw==',0.00,NULL,NULL,'4B8031F0F9F5B4CA2193EA45DDD5D10B','2019-05-04 04:46:59',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(245,'os-eG5BCSok4A-2RezeE44e7rzUM',NULL,'RlhgjIoPgQwgV+shiyBAqw==',0.00,NULL,NULL,'465837BA839220F4E96A2581D662EF94','2019-05-11 05:11:22',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(246,'os-eG5EpzoKyaGcn6AxuPfaKE9QU',NULL,'kl3DlNBp9y8s65fMUpvvgw==',0.00,NULL,NULL,'1EC9CB32AD8DA54EB9E777C5802410FB','2019-05-25 07:00:04',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(247,'os-eG5Ch2bXlTcuyyXtQDNEdX9d0',NULL,'ShFXJ1fCJNsISMBeSnOD9w==',0.00,NULL,NULL,'68E630D952CDE7E5794D5168FD421BB7','2019-06-01 06:04:25',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(248,'os-eG5BkrHTw2ERQb1TZ-og1hU-8',NULL,'OQ3+yGYYx15W5jYT5wa7Iw==',0.00,NULL,NULL,'5371658D6CCA6D461AF7902C3F65756F','2019-06-15 03:41:49',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(249,'os-eG5Jh3NHsyMZDnNzdhUUSsk94',NULL,'THwsv8qmIxQB7VhXUEP/bA==',0.00,NULL,NULL,'40AACEE2C8E8AC0476398D8482E5EDF8','2019-06-22 03:28:55',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(250,'os-eG5Fcxx8WbqEYLb57BZ067QSA',NULL,'P0myfRXP5fHwuQUHkGa59A==',0.00,NULL,NULL,'7722858F207D7B350DE78AF194BE9D88','2019-06-29 04:36:11',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(251,'os-eG5CZDOYJ4DEnROQSOPwqvAXY',NULL,'RYt4t6AMRQitazrl32RjSQ==',0.00,NULL,NULL,'7B5282C7B941610BDC974FBF42332948','2019-07-06 02:26:02',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(252,'os-eG5NGd-aBDfOVy5hel-4bzmqE',NULL,'AfvIL3iunjRvyvgvdlcHbA==',0.00,NULL,NULL,'20D216ABC84B8035A4B3F997214A8716','2019-07-13 03:24:22',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(253,'os-eG5P6Gu0g8CzY6YUgqLJnH230',NULL,'MGug68sg9kAzvv0n0x+gLQ==',0.00,NULL,NULL,'9EFB0BB96763F980ED0816EB70A5747A','2019-07-20 16:43:44',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(254,'os-eG5C1VqUkOH1YrU_kIr8b0GVo',NULL,'hwsIb6NrEnx8EqydjzhrTQ==',0.00,NULL,NULL,'C866B91119DF8FE4BD7EC54826B9010D','2019-07-27 03:56:46',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(255,'os-eG5BBEFedVfu0XswV3WbZlS7M',NULL,'2CMw3ByrpESMyLiJJdx8cQ==',0.00,NULL,NULL,'86B8B5E6999DA78747BE99343969CBE4','2019-08-02 17:59:34',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(256,'os-eG5AZYBRJaWw27YnxLGeiig54',NULL,'C3AUcGxVkhlZ89VFIvfopw==',0.00,NULL,NULL,'21EFFEBBC018CFC2DD4C8CBB29BDD2B2','2019-08-03 08:38:13',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(257,'os-eG5DQJU7JH3fIAScgcHi815i0',NULL,'fJ4KVEPesgMHz9qVOhTMZg==',0.00,NULL,NULL,'C613D09F34B27D9785D75266ED0C3258','2019-08-10 08:36:33',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(258,'os-eG5N8xLX0J6f87Oib_Pe4FY7M',NULL,'J8jdR9Z9xFTTOj5KQt8ceA==',0.00,NULL,NULL,'4740922E522581E40E2D6B13BD276411','2019-08-17 10:46:07',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(259,'os-eG5G3EDCPrNMcxV6-gd6OnOS0',NULL,'x3x9SRF8+DaEpOvQXS5Niw==',0.00,NULL,NULL,'031A92843E85CF44082B81C39A0483F3','2019-08-24 04:57:02',NULL,NULL,0,0,NULL,NULL,0,0,NULL),(260,'os-eG5ETH_RA6PlqvCgegdFP0TuQ',NULL,'AYAIT5nqD4K/ynr8hwmMSQ==',0.00,NULL,NULL,'7EF104885D556F5E163F997ED996BC28','2019-08-31 09:25:00',NULL,NULL,0,0,NULL,NULL,0,0,NULL);
/*!40000 ALTER TABLE `zytc_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_express_company`
--

DROP TABLE IF EXISTS `zytc_express_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_express_company` (
  `co_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表序号',
  `shop_id` int(11) DEFAULT NULL COMMENT '商铺id',
  `company_name` varchar(50) NOT NULL DEFAULT '' COMMENT '物流公司名称',
  `express_no` varchar(20) NOT NULL DEFAULT '' COMMENT '物流编号',
  `is_enabled` int(11) DEFAULT '1' COMMENT '使用状态',
  `image` varchar(255) DEFAULT '' COMMENT '物流公司模版图片',
  `phone` varchar(50) DEFAULT '' COMMENT '联系电话',
  `orders` int(11) DEFAULT NULL,
  `express_logo` varchar(255) DEFAULT '' COMMENT '公司logo',
  `is_default` int(11) DEFAULT '0' COMMENT '是否设置为默认 0未设置 1 默认',
  `56code` varchar(45) DEFAULT NULL,
  `kdncode` varchar(45) DEFAULT NULL,
  `shiptype` int(11) DEFAULT '0',
  PRIMARY KEY (`co_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=420 COMMENT='物流公司';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_express_company`
--

LOCK TABLES `zytc_express_company` WRITE;
/*!40000 ALTER TABLE `zytc_express_company` DISABLE KEYS */;
INSERT INTO `zytc_express_company` VALUES (1,0,'圆通速递','YT',1,'1','1',1,'1',1,'D','yuantong',0),(2,0,'中通快递','ZT',1,'1','1',1,'1',1,'3','zhongtong',0),(3,0,'申通快递','ST',1,'1','1',1,'1',1,'3','shentong',0),(4,0,'天天快递','TT',1,'1','1',1,'1',1,'3','tiantian',0),(5,0,'韵达快运','YD',1,'1','1',1,'1',1,'3','yunda',0),(6,0,'顺丰速递','SF',1,'1','1',1,'1',1,'2','shunfeng',0),(7,0,'线下配送','SD',1,'1','1',1,'1',1,'1','',1),(8,0,'百世快递','BS',1,'1','1',1,'1',1,'1','huitongkuaidi',0);
/*!40000 ALTER TABLE `zytc_express_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_express_shipping`
--

DROP TABLE IF EXISTS `zytc_express_shipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_express_shipping` (
  `sid` int(11) NOT NULL AUTO_INCREMENT COMMENT '运单模版id',
  `shop_id` int(11) NOT NULL COMMENT '店铺id',
  `template_name` varchar(255) NOT NULL DEFAULT '' COMMENT '模版名称',
  `co_id` int(11) NOT NULL DEFAULT '0' COMMENT '物流公司 id',
  `size_type` smallint(6) NOT NULL DEFAULT '1' COMMENT '尺寸类型 1像素px  2毫米mm',
  `width` smallint(6) NOT NULL DEFAULT '0' COMMENT '宽度',
  `height` smallint(6) NOT NULL DEFAULT '0' COMMENT '长度',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '快递单图片',
  PRIMARY KEY (`sid`),
  KEY `IDX_express_shipping_co_id` (`co_id`),
  KEY `IDX_express_shipping_shopId` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11231 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=5461 COMMENT='运单模板';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_express_shipping`
--

LOCK TABLES `zytc_express_shipping` WRITE;
/*!40000 ALTER TABLE `zytc_express_shipping` DISABLE KEYS */;
INSERT INTO `zytc_express_shipping` VALUES (11218,0,'申通',7405,1,869,480,'upload/express/1497094431.JPG'),(11219,0,'京东物流',7406,1,869,480,'upload/express/1497354985.png'),(11220,0,'安达',7407,1,0,0,''),(11221,0,'安达',7408,1,0,0,''),(11222,0,'圆通',7407,1,0,0,''),(11223,0,'1',7408,1,0,0,''),(11224,0,'11',7409,1,0,0,''),(11225,0,'11',7410,1,0,0,''),(11226,0,'111',7417,1,0,0,''),(11227,0,'22',7418,1,0,0,''),(11228,0,'测试物流公司',7419,1,0,0,''),(11229,41,'韵达',7407,1,0,0,''),(11230,1,'菜鸟',7408,1,0,0,'');
/*!40000 ALTER TABLE `zytc_express_shipping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_express_shipping_items`
--

DROP TABLE IF EXISTS `zytc_express_shipping_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_express_shipping_items` (
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '运单模版id',
  `field_name` varchar(30) NOT NULL COMMENT '字段名称',
  `field_display_name` varchar(255) NOT NULL COMMENT '打印项名称',
  `is_print` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否打印',
  `x` int(11) NOT NULL DEFAULT '0' COMMENT 'x',
  `y` int(11) NOT NULL DEFAULT '0' COMMENT 'y',
  PRIMARY KEY (`sid`,`field_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=420 COMMENT='物流模板打印项';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_express_shipping_items`
--

LOCK TABLES `zytc_express_shipping_items` WRITE;
/*!40000 ALTER TABLE `zytc_express_shipping_items` DISABLE KEYS */;
INSERT INTO `zytc_express_shipping_items` VALUES (11218,'A1','订单编号',1,146,67),(11218,'A10','收件人邮编',1,445,226),(11218,'A11','货到付款物流编号',1,338,164),(11218,'A12','代收金额',1,698,13),(11218,'A13','备注',1,583,253),(11218,'A2','发件人公司',1,84,131),(11218,'A3','发件人地址',1,263,307),(11218,'A4','发件人姓名',1,87,183),(11218,'A5','发件人电话',1,378,248),(11218,'A6','发件人邮编',1,369,85),(11218,'A7','收件人地址',1,405,345),(11218,'A8','收件人姓名',1,579,154),(11218,'A9','收件人电话',1,127,301),(11219,'A1','订单编号',0,-3,94),(11219,'A10','收件人邮编',1,4,56),(11219,'A11','货到付款物流编号',1,10,297),(11219,'A12','代收金额',1,10,197),(11219,'A13','备注',1,0,246),(11219,'A2','发件人公司',1,350,146),(11219,'A3','发件人地址',1,410,194),(11219,'A4','发件人姓名',1,0,158),(11219,'A5','发件人电话',1,337,263),(11219,'A6','发件人邮编',1,342,251),(11219,'A7','收件人地址',1,1,367),(11219,'A8','收件人姓名',1,499,232),(11219,'A9','收件人电话',1,280,245),(11220,'A1','订单编号',1,10,11),(11220,'A10','收件人邮编',1,10,86),(11220,'A11','货到付款物流编号',1,10,286),(11220,'A12','代收金额',1,10,186),(11220,'A13','备注',1,10,311),(11220,'A2','发件人公司',1,10,36),(11220,'A3','发件人地址',1,10,136),(11220,'A4','发件人姓名',1,10,111),(11220,'A5','发件人电话',1,10,211),(11220,'A6','发件人邮编',1,10,236),(11220,'A7','收件人地址',1,10,261),(11220,'A8','收件人姓名',1,10,61),(11220,'A9','收件人电话',1,10,161),(11221,'A1','订单编号',1,10,11),(11221,'A10','收件人邮编',1,10,86),(11221,'A11','货到付款物流编号',1,10,286),(11221,'A12','代收金额',1,10,186),(11221,'A13','备注',1,10,311),(11221,'A2','发件人公司',1,10,36),(11221,'A3','发件人地址',1,10,136),(11221,'A4','发件人姓名',1,10,111),(11221,'A5','发件人电话',1,10,211),(11221,'A6','发件人邮编',1,10,236),(11221,'A7','收件人地址',1,10,261),(11221,'A8','收件人姓名',1,10,61),(11221,'A9','收件人电话',1,10,161),(11222,'A1','订单编号',1,10,11),(11222,'A10','收件人邮编',1,10,86),(11222,'A11','货到付款物流编号',1,10,286),(11222,'A12','代收金额',1,10,186),(11222,'A13','备注',1,10,311),(11222,'A2','发件人公司',1,10,36),(11222,'A3','发件人地址',1,10,136),(11222,'A4','发件人姓名',1,10,111),(11222,'A5','发件人电话',1,10,211),(11222,'A6','发件人邮编',1,10,236),(11222,'A7','收件人地址',1,10,261),(11222,'A8','收件人姓名',1,10,61),(11222,'A9','收件人电话',1,10,161),(11223,'A1','订单编号',1,10,11),(11223,'A10','收件人邮编',1,10,86),(11223,'A11','货到付款物流编号',1,10,286),(11223,'A12','代收金额',1,10,186),(11223,'A13','备注',1,10,311),(11223,'A2','发件人公司',1,10,36),(11223,'A3','发件人地址',1,10,136),(11223,'A4','发件人姓名',1,10,111),(11223,'A5','发件人电话',1,10,211),(11223,'A6','发件人邮编',1,10,236),(11223,'A7','收件人地址',1,10,261),(11223,'A8','收件人姓名',1,10,61),(11223,'A9','收件人电话',1,10,161),(11224,'A1','订单编号',1,10,11),(11224,'A10','收件人邮编',1,10,86),(11224,'A11','货到付款物流编号',1,10,286),(11224,'A12','代收金额',1,10,186),(11224,'A13','备注',1,10,311),(11224,'A2','发件人公司',1,10,36),(11224,'A3','发件人地址',1,10,136),(11224,'A4','发件人姓名',1,10,111),(11224,'A5','发件人电话',1,10,211),(11224,'A6','发件人邮编',1,10,236),(11224,'A7','收件人地址',1,10,261),(11224,'A8','收件人姓名',1,10,61),(11224,'A9','收件人电话',1,10,161),(11225,'A1','订单编号',1,10,11),(11225,'A10','收件人邮编',1,10,86),(11225,'A11','货到付款物流编号',1,10,286),(11225,'A12','代收金额',1,10,186),(11225,'A13','备注',1,10,311),(11225,'A2','发件人公司',1,10,36),(11225,'A3','发件人地址',1,10,136),(11225,'A4','发件人姓名',1,10,111),(11225,'A5','发件人电话',1,10,211),(11225,'A6','发件人邮编',1,10,236),(11225,'A7','收件人地址',1,10,261),(11225,'A8','收件人姓名',1,10,61),(11225,'A9','收件人电话',1,10,161),(11226,'A1','订单编号',1,10,11),(11226,'A10','收件人邮编',1,10,86),(11226,'A11','货到付款物流编号',1,10,286),(11226,'A12','代收金额',1,10,186),(11226,'A13','备注',1,10,311),(11226,'A2','发件人公司',1,10,36),(11226,'A3','发件人地址',1,10,136),(11226,'A4','发件人姓名',1,10,111),(11226,'A5','发件人电话',1,10,211),(11226,'A6','发件人邮编',1,10,236),(11226,'A7','收件人地址',1,10,261),(11226,'A8','收件人姓名',1,10,61),(11226,'A9','收件人电话',1,10,161),(11227,'A1','订单编号',1,10,11),(11227,'A10','收件人邮编',1,10,86),(11227,'A11','货到付款物流编号',1,10,286),(11227,'A12','代收金额',1,10,186),(11227,'A13','备注',1,10,311),(11227,'A2','发件人公司',1,10,36),(11227,'A3','发件人地址',1,10,136),(11227,'A4','发件人姓名',1,10,111),(11227,'A5','发件人电话',1,10,211),(11227,'A6','发件人邮编',1,10,236),(11227,'A7','收件人地址',1,10,261),(11227,'A8','收件人姓名',1,10,61),(11227,'A9','收件人电话',1,10,161),(11228,'A1','订单编号',1,10,11),(11228,'A10','收件人邮编',1,10,86),(11228,'A11','货到付款物流编号',1,10,286),(11228,'A12','代收金额',1,10,186),(11228,'A13','备注',1,10,311),(11228,'A2','发件人公司',1,10,36),(11228,'A3','发件人地址',1,10,136),(11228,'A4','发件人姓名',1,10,111),(11228,'A5','发件人电话',1,10,211),(11228,'A6','发件人邮编',1,10,236),(11228,'A7','收件人地址',1,10,261),(11228,'A8','收件人姓名',1,10,61),(11228,'A9','收件人电话',1,10,161);
/*!40000 ALTER TABLE `zytc_express_shipping_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_express_shipping_items_library`
--

DROP TABLE IF EXISTS `zytc_express_shipping_items_library`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_express_shipping_items_library` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '物流模版打印项库ID',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `field_name` varchar(50) NOT NULL COMMENT '字段名',
  `field_display_name` varchar(50) NOT NULL COMMENT '字段显示名',
  `is_enabled` bit(1) NOT NULL DEFAULT b'1' COMMENT '是否启用',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1260 COMMENT='物流模版打印项库';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_express_shipping_items_library`
--

LOCK TABLES `zytc_express_shipping_items_library` WRITE;
/*!40000 ALTER TABLE `zytc_express_shipping_items_library` DISABLE KEYS */;
INSERT INTO `zytc_express_shipping_items_library` VALUES (1,0,'A1','订单编号',_binary ''),(2,0,'A2','发件人公司',_binary ''),(3,0,'A8','收件人姓名',_binary ''),(4,0,'A10','收件人邮编',_binary ''),(5,0,'A4','发件人姓名',_binary ''),(6,0,'A3','发件人地址',_binary ''),(7,0,'A9','收件人电话',_binary ''),(8,0,'A12','代收金额',_binary ''),(9,0,'A5','发件人电话',_binary ''),(10,0,'A6','发件人邮编',_binary ''),(11,0,'A7','收件人地址',_binary ''),(12,0,'A11','货到付款物流编号',_binary ''),(13,0,'A13','备注',_binary '');
/*!40000 ALTER TABLE `zytc_express_shipping_items_library` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_free_orders`
--

DROP TABLE IF EXISTS `zytc_free_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_free_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` int(11) DEFAULT '0',
  `goodsid` int(11) DEFAULT '0',
  `goodsname` varchar(256) DEFAULT '',
  `money` decimal(19,2) DEFAULT '0.00',
  `num` int(11) DEFAULT '0',
  `goodspic` varchar(256) DEFAULT '0',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `userid` varchar(45) DEFAULT '0',
  `nikename` varchar(45) DEFAULT NULL,
  `headpic` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `INDEX_CID` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='免单订单记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_free_orders`
--

LOCK TABLES `zytc_free_orders` WRITE;
/*!40000 ALTER TABLE `zytc_free_orders` DISABLE KEYS */;
INSERT INTO `zytc_free_orders` VALUES (1,204,48,'许昌质源腐竹 3KG特惠装 限时特价',28.00,1,'http://p4wgvxk6d.bkt.clouddn.com/Fvx6PZFbrDe4_h1qalIpTyWZ9uXj','2018-08-30 18:09:31','10','王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132'),(2,5,404,'许昌质源腐竹 3KG特惠装 限时特价 过时不候 速速来抢',22.00,1,'http://p4wgvxk6d.bkt.clouddn.com/FpG8pTIUA4iUJ44Ls4QkiE2t0MUC','2018-11-22 15:22:09','10','王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132'),(3,278,404,'许昌质源腐竹 3KG特惠装 限时特价 过时不候 速速来抢',33.00,1,'http://p4wgvxk6d.bkt.clouddn.com/FpG8pTIUA4iUJ44Ls4QkiE2t0MUC','2018-11-22 16:06:37','10','王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132'),(4,279,404,'许昌质源腐竹 3KG特惠装 限时特价 过时不候 速速来抢',33.00,1,'http://p4wgvxk6d.bkt.clouddn.com/FpG8pTIUA4iUJ44Ls4QkiE2t0MUC','2018-11-22 16:35:00','10','王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132'),(5,319,407,'礼品苹果 12个',25.00,1,'http://www.imgtqbu.weiruikj.cn/FtfdQIarBcHtVsmP4_NLLHGFcbCX','2018-12-18 23:28:32','10','王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132'),(6,332,407,'礼品苹果 12个',50.00,2,'http://www.imgtqbu.weiruikj.cn/FtfdQIarBcHtVsmP4_NLLHGFcbCX','2018-12-23 12:32:48','10','王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132'),(7,333,404,'许昌质源腐竹 3KG特惠装 限时特价 过时不候 速速来抢',33.00,1,'http://www.imgtqbu.weiruikj.cn/FpG8pTIUA4iUJ44Ls4QkiE2t0MUC','2018-12-23 17:18:14','10','王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132'),(8,351,404,'许昌质源腐竹 3KG特惠装 限时特价 过时不候 速速来抢',33.00,1,'http://www.imgtqbu.weiruikj.cn/FpG8pTIUA4iUJ44Ls4QkiE2t0MUC','2018-12-30 14:41:58','63','老魏特产','https://wx.qlogo.cn/mmopen/vi_32/ekFWm6NDQzRicibSFGfWMgHS2jaiaTTOdg1jBzJk7NR3VwT9cibqRia1FdHTt3fsTD0PWA9AyyzsibvwPs98RgNfyPOA/132'),(9,352,407,'礼品苹果 12个',25.00,1,'https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1545895505','2018-12-31 10:38:45','10','王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132'),(10,360,408,'禹州名产 红薯粉条 传统配方 现代工艺 高端礼品2.5KG装',78.00,1,'https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1546412669','2019-01-03 11:31:08','10','王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132'),(11,387,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满',5.90,1,'https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371','2019-01-09 20:03:28','10','王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132'),(12,411,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满',5.90,1,'https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371','2019-01-13 21:50:34','10','王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132'),(13,412,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满',5.90,1,'https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371','2019-01-13 21:54:11','10','王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132'),(14,421,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满',11.80,2,'https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371','2019-01-16 22:13:05','10','王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132'),(15,434,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满',5.90,1,'https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371','2019-01-20 11:23:51','13','会敏','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJkribhRyDNNmIA9gibbXEus80nqGvexn9zKUtYos8OWY30AB8VgyU2MArZA7tHwpbPlUKkFGdkNqdw/132'),(16,443,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满',5.90,1,'https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371','2019-01-20 12:05:58','10','王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132');
/*!40000 ALTER TABLE `zytc_free_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_gift_participate`
--

DROP TABLE IF EXISTS `zytc_gift_participate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_gift_participate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `giftid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `result` int(11) DEFAULT NULL,
  `formid` varchar(45) DEFAULT NULL,
  `status` int(11) DEFAULT '0' COMMENT '1预约 2正式参与',
  `mynumber` int(11) DEFAULT '0',
  `participatetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `relayuserid` int(11) DEFAULT '0',
  `relaycount` int(11) DEFAULT '0',
  `relayname` varchar(45) DEFAULT NULL,
  `relaystatus` int(11) DEFAULT '0',
  `giftname` varchar(45) DEFAULT '田趣免费抽奖',
  PRIMARY KEY (`id`),
  KEY `INDEX_GIFT` (`giftid`),
  KEY `INDEX_GIFTUSER` (`giftid`,`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_gift_participate`
--

LOCK TABLES `zytc_gift_participate` WRITE;
/*!40000 ALTER TABLE `zytc_gift_participate` DISABLE KEYS */;
INSERT INTO `zytc_gift_participate` VALUES (136,61,13,0,'1548670778654',2,1841,'2019-01-28 19:47:43',17,38,'在路上（海龙）',2,'买特产找我吧'),(137,61,10,0,'1548670811834',0,7,'2019-01-29 11:16:47',76,0,'王振林',2,'买特产找我吧'),(138,61,63,0,'1548670861492',2,463,'2019-01-28 18:21:02',13,0,'会敏',2,'买特产找我吧'),(139,61,40,0,'2c46b4b267325fafa9574ab7196e7dee',2,448,'2019-01-28 18:40:15',13,0,'会敏',2,'买特产找我吧'),(140,61,79,0,'1548671293758',0,1145,'2019-01-28 18:28:13',13,0,'会敏',2,'买特产找我吧'),(141,61,80,0,'1548687304162',2,1185,'2019-01-28 22:55:07',13,0,'会敏',2,'买特产找我吧'),(142,61,82,0,'1548671414407',0,588,'2019-01-28 18:30:16',13,0,'会敏',2,'买特产找我吧'),(143,61,86,0,'1548671748402',2,0,'2019-01-28 18:35:49',0,0,NULL,0,'买特产找我吧'),(144,61,88,0,'1548671826008',0,1823,'2019-01-28 18:37:24',13,0,'会敏',2,'买特产找我吧'),(145,61,87,0,'05b560367ea44737db8c9a308f8b0e46',2,109,'2019-01-28 18:38:07',13,0,'会敏',2,'买特产找我吧'),(146,61,84,0,'1548671912300',2,382,'2019-01-28 18:38:36',13,0,'会敏',2,'买特产找我吧'),(147,61,90,0,'1548672055754',0,559,'2019-01-28 18:40:58',13,0,'会敏',2,'买特产找我吧'),(148,61,68,0,'2b7edbf6bc317557fec3d695a6d62863',0,1363,'2019-01-28 18:42:23',13,0,'会敏',2,'买特产找我吧'),(149,61,92,0,'1548672202144',0,1122,'2019-01-28 18:43:26',13,0,'会敏',2,'买特产找我吧'),(150,61,91,0,'1548672252743',2,0,'2019-01-28 18:44:18',0,0,NULL,0,'买特产找我吧'),(151,61,78,0,'1548672412040',2,0,'2019-01-28 18:47:00',0,0,NULL,0,'买特产找我吧'),(152,61,17,0,'1548672478345',2,0,'2019-01-28 18:48:03',0,3,NULL,0,'买特产找我吧'),(153,61,94,0,'1548686205129',2,1516,'2019-01-28 22:36:48',13,0,'会敏',2,'买特产找我吧'),(154,61,41,0,'1548672561640',2,1677,'2019-01-28 18:49:29',13,0,'会敏',2,'买特产找我吧'),(155,61,98,0,'1548673159559',0,111,'2019-01-28 18:59:22',13,0,'会敏',2,'买特产找我吧'),(156,61,102,0,'1548673515161',0,981,'2019-01-28 19:05:19',13,0,'会敏',2,'买特产找我吧'),(157,61,55,0,'3bd5c36d49152e95fb418982556ef1c6',0,19,'2019-01-28 19:10:31',13,0,'会敏',2,'买特产找我吧'),(158,61,105,0,'1548674010110',0,1823,'2019-01-28 19:13:35',13,0,'会敏',2,'买特产找我吧'),(159,61,108,0,'64b0362285d965d4232136512c174a9c',2,19,'2019-01-29 11:15:39',13,2,'会敏',2,'买特产找我吧'),(160,61,112,0,'1548675043228',0,1635,'2019-01-28 19:30:46',13,0,'会敏',2,'买特产找我吧'),(161,61,115,0,'1548675202858',0,1057,'2019-01-28 19:33:25',17,0,'在路上（海龙）',2,'买特产找我吧'),(162,61,116,0,'1548675213136',0,2016,'2019-01-28 19:33:35',13,0,'会敏',2,'买特产找我吧'),(163,61,126,0,'1548677051116',2,0,'2019-01-28 20:04:13',0,0,NULL,0,'买特产找我吧'),(164,61,127,0,'1548677546772',2,894,'2019-01-28 20:12:32',17,0,'在路上（海龙）',2,'买特产找我吧'),(165,61,23,0,'1548677773023',0,1275,'2019-01-28 20:16:16',13,0,'会敏',2,'买特产找我吧'),(166,61,14,0,'053fa21317c9a30a8cee007fce2a5ffe',2,1434,'2019-01-28 20:38:36',13,9,'会敏',2,'买特产找我吧'),(167,61,130,0,'1548679139018',2,0,'2019-01-28 20:39:07',0,0,NULL,0,'买特产找我吧'),(168,61,134,0,'1548679617843',0,1717,'2019-01-28 20:46:59',14,0,'胡林林',2,'买特产找我吧'),(169,61,137,0,'1548680714549',0,358,'2019-01-28 21:05:20',14,0,'胡林林',2,'买特产找我吧'),(170,61,76,0,'1548681312447',2,29,'2019-01-28 21:15:08',13,1,'会敏',2,'买特产找我吧'),(171,61,140,0,'1548681377914',2,0,'2019-01-28 21:16:24',0,0,NULL,0,'买特产找我吧'),(172,61,143,0,'1548681533283',2,0,'2019-01-28 21:19:00',0,0,NULL,0,'买特产找我吧'),(173,61,147,0,'18dc65e4f79a4602b697d946d2e4eeca',2,488,'2019-01-28 21:27:36',13,0,'会敏',2,'买特产找我吧'),(174,61,104,0,'1548681993610',2,0,'2019-01-28 21:26:37',0,0,NULL,0,'买特产找我吧'),(175,61,149,0,'1548682595182',0,732,'2019-01-28 21:36:40',13,0,'会敏',2,'买特产找我吧'),(176,61,77,0,'9d768b749d66623896e2d998751bb5ba',0,427,'2019-01-28 21:38:30',13,0,'会敏',2,'买特产找我吧'),(177,61,156,0,'1548683251677',0,1667,'2019-01-28 21:47:35',14,0,'胡林林',2,'买特产找我吧'),(178,61,158,0,'d6cd631de06fbc56b58e7425cf94455c',0,352,'2019-01-28 21:51:59',13,0,'会敏',2,'买特产找我吧'),(179,61,166,0,'1548685456172',0,1344,'2019-01-28 22:24:18',13,0,'会敏',2,'买特产找我吧'),(180,61,167,0,'641b550a1da428e3808ec68314c47bae',0,1048,'2019-01-28 22:28:45',13,0,'会敏',2,'买特产找我吧'),(181,61,173,0,'166c130ac35d79b75301ec9b8b3f8d05',0,1982,'2019-01-28 23:09:54',14,0,'胡林林',2,'买特产找我吧'),(182,61,183,0,'e949f1ceb8152e3f3d0940814449adaa',0,1883,'2019-01-29 04:44:13',14,0,'胡林林',2,'买特产找我吧'),(183,61,187,0,'1548721861023',0,96,'2019-01-29 08:31:06',13,0,'会敏',2,'买特产找我吧'),(184,61,194,0,'dd4be15904ed11223e08fb201a861e58',2,0,'2019-01-29 09:47:08',0,0,NULL,0,'买特产找我吧'),(185,61,89,0,'1548726671111',0,37,'2019-01-29 09:51:13',13,0,'会敏',2,'买特产找我吧'),(186,61,93,0,'1548727819620',0,84,'2019-01-29 10:10:23',13,0,'会敏',2,'买特产找我吧'),(187,61,22,0,'834fe4baec8684b67f9cb8d71fccc58a',2,45,'2019-01-29 11:10:39',13,0,'会敏',2,'买特产找我吧'),(188,61,198,0,'7bf8ecf8a2fdfb81d0307a4a0e6d9081',2,0,'2019-01-29 11:23:02',0,0,NULL,0,'买特产找我吧'),(189,61,201,0,'1548735863196',2,0,'2019-01-29 12:24:28',0,0,NULL,0,'买特产找我吧'),(190,61,85,0,'1548736581254',2,51,'2019-01-29 12:37:19',13,0,'会敏',2,'买特产找我吧'),(191,61,202,0,'1548738706478',2,111,'2019-01-29 13:11:50',13,0,'会敏',2,'买特产找我吧'),(192,61,203,0,'1548739212062',0,118,'2019-01-29 13:20:13',13,0,'会敏',2,'买特产找我吧'),(193,61,52,0,'1548744698784',2,9,'2019-01-29 14:51:41',13,0,'会敏',2,'买特产找我吧'),(194,61,204,0,'1548746458393',0,137,'2019-01-29 15:21:04',14,0,'胡林林',2,'买特产找我吧'),(195,61,207,0,'0d5afd5d363e467de52175d5582c0ff5',0,114,'2019-01-29 15:23:28',14,0,'胡林林',2,'买特产找我吧'),(196,61,153,0,'1548746659700',0,2,'2019-01-29 15:24:22',14,0,'胡林林',2,'买特产找我吧'),(197,61,24,0,'1548746980682',2,16,'2019-01-29 15:29:44',14,0,'胡林林',2,'买特产找我吧'),(198,61,216,0,'1548773081197',2,73,'2019-01-29 22:46:19',108,0,'静',2,'买特产找我吧'),(199,61,220,0,'1548773311747',0,41,'2019-01-29 22:48:33',108,0,'静',2,'买特产找我吧'),(200,64,10,1,'the formId is a mock one',2,0,'2019-02-18 16:05:26',0,0,NULL,0,'榆林小米'),(201,65,14,1,'9e35e6e434f414b0877f359b687dd4be',2,0,'2019-02-18 22:28:10',0,0,NULL,0,'继续测试');
/*!40000 ALTER TABLE `zytc_gift_participate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_gift_winner`
--

DROP TABLE IF EXISTS `zytc_gift_winner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_gift_winner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `giftid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `giftname` varchar(45) NOT NULL,
  `wintime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_gift_winner`
--

LOCK TABLES `zytc_gift_winner` WRITE;
/*!40000 ALTER TABLE `zytc_gift_winner` DISABLE KEYS */;
INSERT INTO `zytc_gift_winner` VALUES (5,37,10,'测试满人','2018-12-13 15:12:28'),(6,37,10,'测试满人','2018-12-13 15:15:06'),(7,39,10,'测试不换图片','2018-12-13 16:29:05'),(8,42,13,'测试助力','2018-12-17 12:19:53'),(9,43,10,'测试截图','2018-12-19 12:04:59'),(10,44,39,'测试手动开奖','2018-12-23 17:29:28'),(11,44,10,'测试手动开奖','2018-12-23 17:29:28'),(12,45,13,'测试满人开奖','2018-12-23 17:54:44'),(13,51,10,'测试生成朋友圈','2018-12-28 12:06:00'),(14,53,13,'测试图片','2018-12-28 21:09:24'),(15,55,10,'再次测下满人','2019-01-04 17:44:40'),(16,60,10,'再测一下','2019-01-28 18:04:10'),(17,65,14,'继续测试','2019-02-18 22:51:00'),(18,64,10,'榆林小米','2019-02-19 10:57:00'),(19,64,10,'榆林小米','2019-02-19 20:19:35'),(20,64,10,'榆林小米','2019-02-19 20:21:41'),(21,64,10,'榆林小米','2019-02-19 20:24:21'),(22,64,10,'榆林小米','2019-02-19 20:32:07'),(23,64,10,'榆林小米','2019-02-19 20:32:42'),(24,64,10,'榆林小米','2019-02-19 20:40:00'),(25,64,10,'榆林小米','2019-02-19 20:40:39'),(26,64,10,'榆林小米','2019-02-19 20:48:05'),(27,64,10,'榆林小米','2019-02-19 20:48:41'),(28,64,10,'榆林小米','2019-02-19 20:49:53'),(29,64,10,'榆林小米','2019-02-19 20:50:25'),(30,64,10,'榆林小米','2019-02-19 20:58:18'),(31,64,10,'榆林小米','2019-02-19 21:00:48'),(32,64,10,'榆林小米','2019-02-19 21:04:27'),(33,64,10,'榆林小米','2019-02-19 21:51:39');
/*!40000 ALTER TABLE `zytc_gift_winner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_goods`
--

DROP TABLE IF EXISTS `zytc_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_goods` (
  `goods_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品id(SKU)',
  `goods_name` varchar(255) NOT NULL DEFAULT '' COMMENT '商品名称',
  `shop_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '店铺id',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品分类id',
  `price` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '商品原价格',
  `group_price` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '商品促销价格',
  `stock` int(10) NOT NULL DEFAULT '0' COMMENT '商品库存',
  `real_sales` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '销售数量',
  `group_number` int(11) NOT NULL DEFAULT '0' COMMENT '团购人数',
  `picture` int(11) NOT NULL DEFAULT '0' COMMENT '商品主图',
  `introduction` varchar(255) NOT NULL DEFAULT '' COMMENT '商品简介，促销语',
  `description` text NOT NULL COMMENT '商品详情',
  `code` varchar(50) NOT NULL DEFAULT '' COMMENT '产品编号',
  `is_recommend` int(1) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `state` tinyint(3) NOT NULL DEFAULT '1' COMMENT '商品状态 0下架，1正常，2,申请上架中 3 已拒绝 4 违规下架 5 违规申请上架',
  `create_time` datetime NOT NULL COMMENT '商品添加时间',
  `update_time` datetime DEFAULT NULL COMMENT '商品编辑时间',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `img_id_array` varchar(1000) DEFAULT NULL COMMENT '商品图片序列',
  `goods_attribute_id` int(11) DEFAULT '0' COMMENT '商品类型',
  `goods_spec_format` text COMMENT '商品规格',
  `goods_weight` decimal(8,2) DEFAULT '0.00' COMMENT '商品重量',
  `openselflift` int(1) DEFAULT '0',
  `shop_state` int(11) DEFAULT '1' COMMENT '商品对应商店状态  0下架，1正常，',
  `shipping_fee_id` int(11) DEFAULT '0',
  `type` varchar(45) DEFAULT '0' COMMENT '0 正常商品 1 礼品/非卖品',
  `pictureurl` varchar(256) DEFAULT '',
  `bannerurl` varchar(256) DEFAULT '',
  `shortdesp` varchar(128) DEFAULT NULL,
  `selfliftreturn` int(11) DEFAULT '0',
  `formid` varchar(256) DEFAULT NULL,
  `extra` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`goods_id`),
  KEY `SHOPSTATE` (`shop_state`),
  KEY `INDEX_SHOPID` (`shop_id`),
  KEY `INDEX_CATID` (`category_id`),
  KEY `INDEX_STATE` (`state`),
  KEY `INDEX_GOODS_TYPE` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=412 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16554 COMMENT='商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_goods`
--

LOCK TABLES `zytc_goods` WRITE;
/*!40000 ALTER TABLE `zytc_goods` DISABLE KEYS */;
INSERT INTO `zytc_goods` VALUES (404,'许昌腐竹',48,7,32.00,29.90,55,774,3,1980,'许昌质源腐竹 3KG特惠装 限时特价 过时不候 速速来抢','<p style=\"text-align: left;\"><span style=\"font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; color: rgb(216, 216, 216);\">腐竹的颜色金黄，色泽亮丽，蜂窝均匀，发泡之后再经过煎、炒、煮等加工方法，吃起来口感筋道、味道鲜美，很受人们的喜爱。把大豆磨浆烧煮后，凝结干制而成，因其中空似竹，故名腐竹，又因其主产于河南许昌颍河、清潩河沿线，故名许昌腐竹。从腐竹的这层定义，足以说明许昌腐竹之深入民心。在许昌乃至整个河南，只要提起许昌县河街乡，人们首先想到的就是腐竹。几十年来，河街生产的腐竹摆上了千家万户的餐桌，人们在品尝着凉拌腐竹、红烧腐竹、清炒腐竹等一道道用豆演变而来的美味时，就会不由得问一声：“这是不是河街的腐竹？”于是，河街这个地名便伴随着腐竹而深入民心，成为腐竹不可分割的一个代名词。</span><span style=\"background-color: rgb(198, 217, 240); font-size: 14px; text-indent: 28px; font-family: 楷体, 楷体_GB2312, SimKai; color: rgb(219, 229, 241);\"></span></p><p style=\"text-align: left;\"><span style=\"font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; color: rgb(216, 216, 216);\"><br/></span></p><p><img src=\"https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1546172469\"/></p>','zt3878999',0,1,'2018-07-04 17:45:54','2019-01-24 11:16:57',0,'1980',0,NULL,2.00,1,1,7,'0','http://www.imgtqbu.weiruikj.cn/FpG8pTIUA4iUJ44Ls4QkiE2t0MUC','http://www.imgtqbu.weiruikj.cn/FpGOcIzreoJXdcWegmJ3lKioQG4E','30年工艺沉淀 优选品质大豆 长久品质考验 是您自用送礼首选',5,NULL,'价格错误'),(407,'苹果',53,2,108.00,99.00,20,64,2,1982,'新疆 阿克苏 冰甜糖心苹果 20斤一箱装 个个好果子','<p><span style=\"color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);\">&nbsp; </span><span style=\"font-size: 14px; text-indent: 28px; font-family: 楷体, 楷体_GB2312, SimKai; color: rgb(196, 189, 151);\">新疆阿克苏地区位于世界最大的内流河塔里木河腹地。水资源充沛，是新疆重要的绿洲带，古代丝绸之路的必经之地。阿克苏地处中纬度，位于塔里木盆地西北部，主要受西风带上天气系统影响，但是西、北两面分别有海拔在4000m以上的帕米尔高原和天山阻隔，东面距塔里木盆地向东的缺口500km以上，冷空气不易直接人侵。而在我国东北、西北东部等苹果产区，冷空气人侵的频率和影响程度都大的多。阿克苏地区北高南低，日照丰富，热量适宜，盆地边缘绿洲区斜坡地形又增加了光能的有效利用率，浅山区以及绿洲都是灌溉农业。阿克苏地区的光、热、水等气候条件适合晚熟和中晚熟品。</span></p><p><br/></p><table><tbody><tr class=\"firstRow\"><td width=\"240\" valign=\"top\" style=\"word-break: break-all;\">重量</td><td width=\"240\" valign=\"top\" style=\"word-break: break-all;\">品质</td><td width=\"240\" valign=\"top\" style=\"word-break: break-all;\">包装</td></tr><tr><td width=\"240\" valign=\"top\" style=\"word-break: break-all;\">约10kg</td><td width=\"240\" valign=\"top\" style=\"word-break: break-all;\">中品果</td><td width=\"240\" valign=\"top\" style=\"word-break: break-all;\">3层礼品装</td></tr></tbody></table><p><br/></p><p>特别说明：</p><ol class=\" list-paddingleft-2\" style=\"list-style-type: decimal;\"><li><p>产品为阿克苏中品果，所以价格比较实惠，因果子生长过程，无打药，无装袋，所以果子都是自然形状</p></li><li><p>物流说明</p><p>&nbsp;</p></li></ol><p><img src=\"https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547734530\"/></p><p><br/></p><p>中间继续写点东西</p><p><img src=\"https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547734523\"/></p>','dadas',0,0,'2018-09-10 09:47:23','2019-01-24 02:18:00',0,'1982',0,NULL,1.00,1,1,0,'0','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1545895505','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1545895534','沙漠中的绿洲 最大的昼夜温差 最长的生成周期 最后的成熟 只为给您一口糖心',2,NULL,NULL),(408,'禹州红薯粉条',48,7,85.00,78.00,14,10,2,1999,'禹州名产 红薯粉条 传统手工 现代工艺 高端礼品5斤装','<p><span style=\"font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; text-indent: 28px; background-color: rgb(255, 255, 255);\">&nbsp; &nbsp;粉条里富含碳水化合物、膳食纤维、蛋白质、烟酸和钙、镁、铁、钾、磷、钠等矿物质</span>。</span><span style=\"background-color: rgb(255, 255, 255); color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px;\">粉条有良好的附味性，它能吸收各种鲜美汤料的味道，再加上粉条本身的柔润嫩滑，更加爽口宜人。真正的绿色粉条具备红薯的多数养身功能。</span></p><p><span style=\"text-align: justify; color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; text-indent: 28px; background-color: rgb(255, 255, 255); font-size: 14px;\">&nbsp; 由于禹州的手工粉条品相好，种植规模大，制作粉条粉丝粉皮的也多。一直都有三粉之乡的称号，远近驰名。本店遍访禹州各地，最终结合原料，生产工艺，口感从众多具备生产资质厂家产品中为大家找出这款高品质好口感的手工红薯粉。</span></p><p><br/></p><p><br/></p><p><img src=\"https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1548164217\"/></p>','QS411023010518',0,1,'2018-10-31 16:41:30','2019-01-24 11:17:39',0,'1999,2000,2001',0,NULL,3.00,1,1,0,'0','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547885108','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1546412892','从种植到产品，采用纯手工作坊精制而成，让您步步走向健康之路。',8,'the formId is a mock one',NULL),(409,'榆林小米',48,1,5.90,4.90,24,56,2,1991,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','<p>特别说明:该商品为少量存货试吃测试商品，性价比较低，建议勿拍</p><p><span style=\"color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);\">小米，原名：</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%B2%9F/354868\" data-lemmaid=\"354868\" style=\"color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);\">粟</a><span style=\"color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);\">，也称作粱、</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%8B%97%E5%B0%BE%E8%8D%89/1360051\" data-lemmaid=\"1360051\" style=\"color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);\">狗尾草</a><span style=\"color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);\">、黄</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%B2%9F/354868\" data-lemmaid=\"354868\" style=\"color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);\">粟</a><span style=\"color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);\">、粟米，拉丁文名：Setaria italica (L.) Beauv. var. germanica (Mill.) Schrad.&nbsp;</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%A6%BE%E6%9C%AC%E7%A7%91\" style=\"color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);\">禾本科</a><span style=\"color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);\">、</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%8B%97%E5%B0%BE%E8%8D%89/1360051\" data-lemmaid=\"1360051\" style=\"color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);\">狗尾草</a><span style=\"color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);\">属一年生草本，须根粗大，秆粗壮，</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%B2%9F/354868\" data-lemmaid=\"354868\" style=\"color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);\">粟</a><span style=\"color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);\">是谷子去皮后的结果，</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%B0%B7%E5%AD%90/1195518\" data-lemmaid=\"1195518\" style=\"color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);\">谷子</a><span style=\"color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);\">是谷类植物，禾木本的一种，</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%B2%9F/354868\" data-lemmaid=\"354868\" style=\"color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);\">粟</a><span style=\"color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);\">的营养价值很高，含丰富的蛋白质和脂肪和维生素，它不仅供食用，入药有清热、清渴，滋阴，补脾肾和肠胃，利小便、治水泻等功效，又可酿酒。其茎叶又是牲畜的优等饲料，它含粗蛋白质5-7%，超过一般牧草的含量1.5-2倍，而且纤维素少，质地较柔软，为骡、马所喜食；其谷糠又是猪、鸡的良好饲料。</span></p><p><img src=\"https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547193940\"/></p>','DS4444',0,0,'2019-01-09 12:33:12','2019-01-25 11:18:08',0,'1991',0,NULL,1.00,1,1,7,'0','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008376','治反胃热痢，煮粥食，益丹田，补虚损，开肠胃',2,NULL,NULL),(411,'禹州红薯粉条',48,7,65.00,59.90,28,2,2,2004,'禹州名产 红薯粉条 传统手工 现代工艺 特惠5斤盒装','<p style=\"white-space: normal;\"><span style=\"font-size: 14px;\"><span style=\"font-size: 14px; color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; text-indent: 28px; background-color: rgb(255, 255, 255);\">&nbsp;粉条里富含碳水化合物、膳食纤维、蛋白质、烟酸和钙、镁、铁、钾、磷、钠等矿物质</span>。<span style=\"background-color: rgb(255, 255, 255); color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px;\">粉条有良好的附味性，它能吸收各种鲜美汤料的味道，再加上粉条本身的柔润嫩滑，更加爽口宜人。真正的绿色粉条具备红薯的多数养身功能。</span></span></p><p style=\"white-space: normal;\"><span style=\"text-align: justify; color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; text-indent: 28px; background-color: rgb(255, 255, 255); font-size: 14px;\">&nbsp; 由于禹州的手工粉条品相好，种植规模大，制作粉条粉丝粉皮的也多。一直都有三粉之乡的称号，远近驰名。本店遍访禹州各地，最终结合原料，生产工艺，口感从众多具备生产资质厂家产品中为大家找出这款高品质好口感的手工红薯粉。</span></p><p><span style=\"font-size: 14px;\"></span><br/></p><p><img src=\"https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1548299653\"/></p>','QS411023010518',0,1,'2019-01-24 11:16:01','2019-01-24 01:56:25',0,'2004',0,NULL,3.00,1,1,7,'0','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1548299677','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1548300715','从种植到产品，采用纯手工作坊精制而成，让您步步走向健康之路。',8,NULL,NULL);
/*!40000 ALTER TABLE `zytc_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_goods_attribute`
--

DROP TABLE IF EXISTS `zytc_goods_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_goods_attribute` (
  `attr_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `attr_value_id` int(11) NOT NULL COMMENT '属性值id',
  `attr_value` varchar(255) NOT NULL DEFAULT '' COMMENT '属性值名称',
  `attr_value_name` varchar(255) NOT NULL DEFAULT '' COMMENT '属性值对应数据值',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` varchar(255) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  PRIMARY KEY (`attr_id`),
  KEY `INDEX_GOODSID` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=315 COMMENT='商品属性表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_goods_attribute`
--

LOCK TABLES `zytc_goods_attribute` WRITE;
/*!40000 ALTER TABLE `zytc_goods_attribute` DISABLE KEYS */;
INSERT INTO `zytc_goods_attribute` VALUES (1,380,0,74,'风格','',0,'2017-07-21 09:29:51'),(2,380,0,76,'裙长','短款',0,'2017-07-21 09:29:51'),(3,380,0,76,'裙长','中款',0,'2017-07-21 09:29:51'),(4,380,0,76,'裙长','长款',0,'2017-07-21 09:29:51'),(5,380,0,77,'款式','韩版',0,'2017-07-21 09:29:51'),(6,380,0,77,'款式','休闲',0,'2017-07-21 09:29:51'),(7,380,0,77,'款式','欧美',0,'2017-07-21 09:29:51'),(8,381,0,74,'风格','',0,'2017-07-21 09:31:32'),(9,381,0,76,'裙长','短款',0,'2017-07-21 09:31:32'),(10,381,0,76,'裙长','中款',0,'2017-07-21 09:31:32'),(11,381,0,77,'款式','韩版',0,'2017-07-21 09:31:32'),(12,381,0,77,'款式','休闲',0,'2017-07-21 09:31:32'),(13,381,0,77,'款式','欧美',0,'2017-07-21 09:31:32'),(14,382,0,74,'风格','',0,'2017-07-21 09:32:55'),(15,382,0,76,'裙长','中款',0,'2017-07-21 09:32:55'),(16,382,0,76,'裙长','长款',0,'2017-07-21 09:32:55'),(17,382,0,77,'款式','休闲',0,'2017-07-21 09:32:55'),(18,382,0,77,'款式','复古',0,'2017-07-21 09:32:55'),(19,382,0,77,'款式','传统',0,'2017-07-21 09:32:55'),(20,383,41,93,'男女款式','',0,'2017-07-21 09:40:23'),(21,383,41,87,'鞋跟高度','8-10cm',0,'2017-07-21 09:40:23'),(22,383,41,104,'材质','布鞋',0,'2017-07-21 09:40:23'),(23,383,41,96,'鞋头款式','平头',0,'2017-07-21 09:40:23'),(24,383,41,96,'鞋头款式','尖头',0,'2017-07-21 09:40:23'),(25,384,41,93,'男女款式','',0,'2017-07-21 09:42:00'),(26,384,41,87,'鞋跟高度','8-10cm',0,'2017-07-21 09:42:00'),(27,384,41,104,'材质','皮鞋',0,'2017-07-21 09:42:00'),(28,384,41,96,'鞋头款式','尖头',0,'2017-07-21 09:42:00'),(29,385,41,93,'男女款式','',0,'2017-07-21 09:43:19'),(30,385,41,87,'鞋跟高度','8-10cm',0,'2017-07-21 09:43:19'),(31,385,41,96,'鞋头款式','尖头',0,'2017-07-21 09:43:19');
/*!40000 ALTER TABLE `zytc_goods_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_goods_attribute_deleted`
--

DROP TABLE IF EXISTS `zytc_goods_attribute_deleted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_goods_attribute_deleted` (
  `attr_id` int(10) NOT NULL,
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `attr_value_id` int(11) NOT NULL COMMENT '属性值id',
  `attr_value` varchar(255) NOT NULL DEFAULT '' COMMENT '属性值名称',
  `attr_value_name` varchar(255) NOT NULL DEFAULT '' COMMENT '属性值对应数据值',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` varchar(255) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=315 COMMENT='被删除的商品属性表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_goods_attribute_deleted`
--

LOCK TABLES `zytc_goods_attribute_deleted` WRITE;
/*!40000 ALTER TABLE `zytc_goods_attribute_deleted` DISABLE KEYS */;
/*!40000 ALTER TABLE `zytc_goods_attribute_deleted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_goods_attribute_value`
--

DROP TABLE IF EXISTS `zytc_goods_attribute_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_goods_attribute_value` (
  `attr_value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品属性值ID',
  `attr_id` int(11) NOT NULL COMMENT '商品属性ID',
  `attr_value` varchar(255) NOT NULL DEFAULT '' COMMENT '值名称',
  `is_visible` bit(1) NOT NULL DEFAULT b'1' COMMENT '是否可视',
  `sort` int(11) DEFAULT NULL,
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`attr_value_id`),
  KEY `IDX_category_propvalues_c_pId` (`attr_id`),
  KEY `IDX_category_propvalues_orders` (`sort`),
  KEY `IDX_category_propvalues_value` (`attr_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1092 COMMENT='商品规格值模版表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_goods_attribute_value`
--

LOCK TABLES `zytc_goods_attribute_value` WRITE;
/*!40000 ALTER TABLE `zytc_goods_attribute_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `zytc_goods_attribute_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_goods_category`
--

DROP TABLE IF EXISTS `zytc_goods_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_goods_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `category_name` varchar(50) NOT NULL DEFAULT '' COMMENT '分类名称',
  `short_name` varchar(50) NOT NULL DEFAULT '' COMMENT '商品分类简称 ',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父级id',
  `level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '分类等级',
  `is_visible` int(11) DEFAULT '1' COMMENT '是否显示  1 显示 0 不显示',
  `attr_id` int(11) NOT NULL DEFAULT '0' COMMENT '关联商品类型ID',
  `attr_name` varchar(255) NOT NULL DEFAULT '' COMMENT '关联类型名称',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键词',
  `description` varchar(255) DEFAULT '' COMMENT '描述',
  `sort` int(11) DEFAULT NULL,
  `category_pic` varchar(255) NOT NULL DEFAULT '' COMMENT '商品分类图片',
  PRIMARY KEY (`category_id`),
  KEY `INDEX_PID` (`pid`),
  KEY `INDEX_LEVEL` (`level`),
  KEY `INDEX_SHOW` (`is_visible`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=244 COMMENT='商品分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_goods_category`
--

LOCK TABLES `zytc_goods_category` WRITE;
/*!40000 ALTER TABLE `zytc_goods_category` DISABLE KEYS */;
INSERT INTO `zytc_goods_category` VALUES (1,'谷粮','女装',0,1,1,28,'衣服','衣服','',12,'http://p4wgvxk6d.bkt.clouddn.com/FtdNZQgcgsBibdYNp4Qyj29GMk6o'),(2,'水果','配饰',0,1,1,32,'鞋子','鞋靴/箱包/配件','',55,'upload/common/1500621005.jpg'),(3,'干果','手机数码',0,1,1,30,'手机','手机，数码，印象制品','手机，数码，印象制品',123,'upload/common/1500620960.jpg'),(4,'调味','家用电器',0,1,1,0,'','家用电器','家用电器',123,'upload/common/1500620884.jpg'),(5,'生鲜','家用电器',0,1,1,0,'','家用电器','家用电器',123,'upload/common/1500620884.jpg'),(6,'糕点','家用电器',0,1,1,0,'','家用电器','家用电器',123,'upload/common/1500620884.jpg'),(7,'干货','家用电器',0,1,1,0,'','家用电器','家用电器',123,'upload/common/1500620884.jpg'),(8,'熟食','家用电器',0,1,1,0,'','家用电器','家用电器',123,'upload/common/1500620884.jpg'),(9,'茶饮','饮料茶叶',0,1,1,0,'','','',0,'https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547817359');
/*!40000 ALTER TABLE `zytc_goods_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_goods_class`
--

DROP TABLE IF EXISTS `zytc_goods_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_goods_class` (
  `class_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品属性ID',
  `class_name` varchar(255) NOT NULL DEFAULT '' COMMENT '属性名称',
  `is_use` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否使用',
  `spec_id_array` varchar(255) NOT NULL DEFAULT '' COMMENT '关联规格',
  `sort` int(11) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `shopid` int(11) DEFAULT '0',
  PRIMARY KEY (`class_id`),
  KEY `INDEX_SHOPID` (`shopid`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='商品类别';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_goods_class`
--

LOCK TABLES `zytc_goods_class` WRITE;
/*!40000 ALTER TABLE `zytc_goods_class` DISABLE KEYS */;
INSERT INTO `zytc_goods_class` VALUES (28,'衣服',1,'110,137,126,125,115,170,9',255,'2017-06-10 14:03:46','2017-06-22 15:18:34',48),(30,'手机',1,'111,110,115,2,3,4',255,'2017-06-12 15:12:20','2017-06-16 16:08:51',0),(32,'鞋子',1,'112,113,117',255,'2017-06-12 18:29:04','2017-06-13 12:00:11',0),(34,'箱装粉条',1,'5,12',1,'2018-09-12 15:47:21','2018-11-12 11:10:30',48);
/*!40000 ALTER TABLE `zytc_goods_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_goods_edit`
--

DROP TABLE IF EXISTS `zytc_goods_edit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_goods_edit` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编辑id',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品id(SKU)',
  `goods_name` varchar(255) NOT NULL DEFAULT '' COMMENT '商品名称',
  `shop_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '店铺id',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品分类id',
  `market_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `price` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '商品原价格',
  `group_price` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '商品促销价格',
  `stock` int(10) NOT NULL DEFAULT '0' COMMENT '商品库存',
  `min_stock_alarm` int(11) DEFAULT '0' COMMENT '库存预警值',
  `real_sales` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '销售数量',
  `group_number` int(11) NOT NULL DEFAULT '0' COMMENT '团购人数',
  `picture` int(11) NOT NULL DEFAULT '0' COMMENT '商品主图',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '商品关键词',
  `introduction` varchar(255) NOT NULL DEFAULT '' COMMENT '商品简介，促销语',
  `description` text NOT NULL COMMENT '商品详情',
  `code` varchar(50) NOT NULL DEFAULT '' COMMENT '产品编号',
  `is_recommend` int(1) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `state` tinyint(3) NOT NULL DEFAULT '1' COMMENT '商品状态 0下架，1正常，10违规（禁售）',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '商品添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '商品编辑时间',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `img_id_array` varchar(1000) DEFAULT NULL COMMENT '商品图片序列',
  `goods_attribute_id` int(11) DEFAULT '0' COMMENT '商品类型',
  `goods_spec_format` text COMMENT '商品规格',
  `goods_weight` decimal(8,2) DEFAULT '0.00' COMMENT '商品重量',
  `opengroup` int(1) DEFAULT '0',
  `edit_type` int(11) DEFAULT '0' COMMENT '1 新增 2 修改',
  `refusemsg` varchar(256) DEFAULT '无',
  `submit_status` int(11) DEFAULT '0' COMMENT '0 未提交 1 已提交',
  `review_status` int(11) DEFAULT '0' COMMENT '0 未审核 1通过 2未通过',
  `shipping_fee_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=424 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16554 COMMENT='商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_goods_edit`
--

LOCK TABLES `zytc_goods_edit` WRITE;
/*!40000 ALTER TABLE `zytc_goods_edit` DISABLE KEYS */;
INSERT INTO `zytc_goods_edit` VALUES (423,404,'许昌腐竹',48,7,11.00,11.00,29.81,11,40,0,3,1972,'','许昌质源腐竹 3KG特惠装 限时特价','<p>手动修改试试a</p>','zt3878999',0,0,'2018-09-07 09:31:14','2018-09-07 15:42:23',0,'1972',30,'[{\"spec_name\":\"试试\",\"spec_id\":2,\"value\":[{\"spec_value_name\":\"15\",\"spec_name\":\"试试\",\"spec_id\":2,\"spec_value_id\":1,\"spec_show_type\":1,\"spec_value_data\":\"\"}]}]',2.00,1,2,'无',0,0,7);
/*!40000 ALTER TABLE `zytc_goods_edit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_goods_sku`
--

DROP TABLE IF EXISTS `zytc_goods_sku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_goods_sku` (
  `sku_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表序号',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品编号',
  `sku_name` varchar(500) NOT NULL DEFAULT '' COMMENT 'SKU名称',
  `attr_value_items` varchar(255) NOT NULL DEFAULT '' COMMENT '属性和属性值 id串 attribute + attribute value 表ID分号分隔',
  `attr_value_items_format` varchar(500) NOT NULL DEFAULT '' COMMENT '属性和属性值id串组合json格式',
  `group_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `market_price` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '成本价',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '库存',
  `picture` int(11) NOT NULL DEFAULT '0' COMMENT '如果是第一个sku编码, 可以加图片',
  `code` varchar(255) NOT NULL DEFAULT '' COMMENT '商家编码',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`sku_id`),
  KEY `INDEX_GOODSID` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1507 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=481 COMMENT='商品skui规格价格库存信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_goods_sku`
--

LOCK TABLES `zytc_goods_sku` WRITE;
/*!40000 ALTER TABLE `zytc_goods_sku` DISABLE KEYS */;
/*!40000 ALTER TABLE `zytc_goods_sku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_goods_sku_deleted`
--

DROP TABLE IF EXISTS `zytc_goods_sku_deleted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_goods_sku_deleted` (
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '表序号',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品编号',
  `sku_name` varchar(500) NOT NULL DEFAULT '' COMMENT 'SKU名称',
  `attr_value_items` varchar(255) NOT NULL DEFAULT '' COMMENT '属性和属性值 id串 attribute + attribute value 表ID分号分隔',
  `attr_value_items_format` varchar(500) NOT NULL DEFAULT '' COMMENT '属性和属性值id串组合json格式',
  `market_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `promote_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '促销价格',
  `cost_price` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '成本价',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '库存',
  `picture` int(11) NOT NULL DEFAULT '0' COMMENT '如果是第一个sku编码, 可以加图片',
  `code` varchar(255) NOT NULL DEFAULT '' COMMENT '商家编码',
  `QRcode` varchar(255) NOT NULL DEFAULT '' COMMENT '商品二维码',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=372 COMMENT='商品skui规格价格库存信息回收站表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_goods_sku_deleted`
--

LOCK TABLES `zytc_goods_sku_deleted` WRITE;
/*!40000 ALTER TABLE `zytc_goods_sku_deleted` DISABLE KEYS */;
/*!40000 ALTER TABLE `zytc_goods_sku_deleted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_goods_sku_edit`
--

DROP TABLE IF EXISTS `zytc_goods_sku_edit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_goods_sku_edit` (
  `sku_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表序号',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品编号',
  `sku_name` varchar(500) NOT NULL DEFAULT '' COMMENT 'SKU名称',
  `attr_value_items` varchar(255) NOT NULL DEFAULT '' COMMENT '属性和属性值 id串 attribute + attribute value 表ID分号分隔',
  `attr_value_items_format` varchar(500) NOT NULL DEFAULT '' COMMENT '属性和属性值id串组合json格式',
  `group_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `market_price` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '成本价',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '库存',
  `picture` int(11) NOT NULL DEFAULT '0' COMMENT '如果是第一个sku编码, 可以加图片',
  `code` varchar(255) NOT NULL DEFAULT '' COMMENT '商家编码',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`sku_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1496 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=481 COMMENT='商品skui规格价格库存信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_goods_sku_edit`
--

LOCK TABLES `zytc_goods_sku_edit` WRITE;
/*!40000 ALTER TABLE `zytc_goods_sku_edit` DISABLE KEYS */;
INSERT INTO `zytc_goods_sku_edit` VALUES (1495,1,'','','',29.81,11.00,11.00,11,0,'zt3878999','2018-09-07 15:42:24','2018-09-07 15:47:40');
/*!40000 ALTER TABLE `zytc_goods_sku_edit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_goods_spec`
--

DROP TABLE IF EXISTS `zytc_goods_spec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_goods_spec` (
  `spec_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '属性ID',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `spec_name` varchar(255) NOT NULL DEFAULT '' COMMENT '属性名称',
  `is_visible` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否可视',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` datetime NOT NULL COMMENT '创建日期',
  `show_type` int(11) NOT NULL DEFAULT '1' COMMENT '展示方式 1 文字 2 颜色 3 图片',
  `classid` int(11) DEFAULT '0',
  PRIMARY KEY (`spec_id`),
  KEY `IDX_category_props_categoryId` (`shop_id`),
  KEY `IDX_category_props_orders` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=3276 COMMENT='商品属性（规格）表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_goods_spec`
--

LOCK TABLES `zytc_goods_spec` WRITE;
/*!40000 ALTER TABLE `zytc_goods_spec` DISABLE KEYS */;
INSERT INTO `zytc_goods_spec` VALUES (2,48,'试试',1,1,'2018-09-06 22:09:25',1,0),(4,48,'颜色',1,1,'2018-09-09 22:38:23',1,0),(5,48,'美美',1,1,'2018-09-12 16:12:46',1,28);
/*!40000 ALTER TABLE `zytc_goods_spec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_goods_spec_value`
--

DROP TABLE IF EXISTS `zytc_goods_spec_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_goods_spec_value` (
  `spec_value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品属性值ID',
  `spec_id` int(11) NOT NULL COMMENT '商品属性ID',
  `spec_value_name` varchar(255) NOT NULL DEFAULT '' COMMENT '商品属性值名称',
  `spec_value_data` varchar(255) NOT NULL DEFAULT '' COMMENT '商品属性值数据',
  `is_visible` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否可视',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`spec_value_id`),
  KEY `IDX_category_propvalues_c_pId` (`spec_id`),
  KEY `IDX_category_propvalues_orders` (`sort`),
  KEY `IDX_category_propvalues_value` (`spec_value_name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1092 COMMENT='商品规格值模版表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_goods_spec_value`
--

LOCK TABLES `zytc_goods_spec_value` WRITE;
/*!40000 ALTER TABLE `zytc_goods_spec_value` DISABLE KEYS */;
INSERT INTO `zytc_goods_spec_value` VALUES (1,2,'15','',1,0,'2018-09-06 22:09:35'),(2,2,'18','',1,0,'2018-09-07 21:38:20'),(3,2,'18','',1,0,'2018-09-07 22:44:40'),(5,2,'dd','',1,0,'2018-09-08 08:39:35'),(7,4,'浅绿色','',1,0,'2018-09-09 22:38:31'),(8,4,'深红色','',1,0,'2018-09-09 22:38:39'),(9,5,'112','',1,0,'2018-09-12 16:36:17'),(11,5,'333','',1,255,'2018-09-12 21:24:31');
/*!40000 ALTER TABLE `zytc_goods_spec_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_group`
--

DROP TABLE IF EXISTS `zytc_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_group` (
  `group_order_id` int(11) NOT NULL AUTO_INCREMENT,
  `require_num` int(5) NOT NULL DEFAULT '0',
  `people` int(5) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `expire_time` datetime DEFAULT NULL,
  `success_time` datetime DEFAULT NULL,
  `owner_id` int(10) NOT NULL DEFAULT '0',
  `goodsid` int(11) DEFAULT NULL,
  `nickname` varchar(45) DEFAULT NULL,
  `headpic` varchar(256) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `stage_format` varchar(1024) DEFAULT '',
  `shop_id` int(11) DEFAULT '0',
  `name` varchar(45) DEFAULT '',
  `groupresult` int(11) DEFAULT '0',
  `type` int(11) DEFAULT '0',
  `qrpic` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`group_order_id`),
  KEY `owner_id` (`owner_id`),
  KEY `INDEX_GOODSID` (`goodsid`),
  KEY `INDEX_TYPE` (`type`),
  KEY `INDEX_STATUS` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=98 DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_group`
--

LOCK TABLES `zytc_group` WRITE;
/*!40000 ALTER TABLE `zytc_group` DISABLE KEYS */;
INSERT INTO `zytc_group` VALUES (28,2,1,2,'2018-06-29 16:11:23','2018-06-30 16:11:23',NULL,1,403,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJic27dia65Z8OQteuuLLKOX9hF82F0RiaDZeicpAbjzp1KgQ4bFJrNcIg44Bhiaxjibx6yP6sz5F079rRg/132',NULL,'',0,'',0,0,NULL),(24,2,2,1,'2018-05-19 15:00:37','2018-05-20 15:00:37',NULL,1,393,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJic27dia65Z8OQteuuLLKOX9hF82F0RiaDZeicpAbjzp1KgQ4bFJrNcIg44Bhiaxjibx6yP6sz5F079rRg/132',NULL,'',0,'',0,0,NULL),(25,2,1,2,'2018-06-14 10:43:53','2018-06-15 10:43:53',NULL,1,403,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJic27dia65Z8OQteuuLLKOX9hF82F0RiaDZeicpAbjzp1KgQ4bFJrNcIg44Bhiaxjibx6yP6sz5F079rRg/132',NULL,'',0,'',0,0,NULL),(26,2,1,2,'2018-06-23 16:51:00','2018-06-24 16:51:00',NULL,1,403,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJic27dia65Z8OQteuuLLKOX9hF82F0RiaDZeicpAbjzp1KgQ4bFJrNcIg44Bhiaxjibx6yP6sz5F079rRg/132',NULL,'',0,'',0,1,NULL),(27,2,1,2,'2018-06-23 22:00:52','2018-06-24 22:00:52',NULL,1,403,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJic27dia65Z8OQteuuLLKOX9hF82F0RiaDZeicpAbjzp1KgQ4bFJrNcIg44Bhiaxjibx6yP6sz5F079rRg/132',NULL,'',0,'',0,1,NULL),(29,3,1,2,'2018-07-16 21:00:03','2018-07-17 21:00:03',NULL,1,406,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJic27dia65Z8OQteuuLLKOX9hF82F0RiaDZeicpAbjzp1KgQ4bFJrNcIg44Bhiaxjibx6yP6sz5F079rRg/132',NULL,'',0,'',0,1,NULL),(30,3,1,2,'2018-07-19 19:15:05','2018-07-20 19:15:05',NULL,3,405,'会敏','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKxQa2B58Ls3mPXuoCHbgEg0I2fSajwVHnPoibBpUmwLN0KYEpUIjs5HC6G2g2OT7GBYvT9WqaxTfA/0',NULL,'',0,'',0,1,NULL),(31,3,1,2,'2018-08-12 14:41:20','2018-08-13 14:41:20',NULL,1,406,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJic27dia65Z8OQteuuLLKOX9hF82F0RiaDZeicpAbjzp1KgQ4bFJrNcIg44Bhiaxjibx6yP6sz5F079rRg/132',NULL,'',0,'',0,1,NULL),(32,3,1,2,'2018-08-14 22:20:33','2018-08-15 22:20:33',NULL,1,406,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJic27dia65Z8OQteuuLLKOX9hF82F0RiaDZeicpAbjzp1KgQ4bFJrNcIg44Bhiaxjibx6yP6sz5F079rRg/132',NULL,'',0,'',0,1,NULL),(33,3,2,2,'2018-08-17 14:10:22','2018-08-18 14:10:22',NULL,1,405,'guagua1','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJic27dia65Z8OQteuuLLKOX9hF82F0RiaDZeicpAbjzp1KgQ4bFJrNcIg44Bhiaxjibx6yP6sz5F079rRg/132',NULL,'',0,'',0,1,NULL),(34,3,1,2,'2018-08-25 08:17:31','2018-08-26 08:17:31',NULL,6,406,'胡林林','https://wx.qlogo.cn/mmopen/vi_32/ajNVdqHZLLBOCDkbZG0WRiaibZCUlum62kVBzZrIthZ3U95Jfg9FdcL5B30Q0xZxBQ50bLgSVLxwxAI7wNApAJmQ/132',NULL,'',48,'',0,1,NULL),(35,3,1,2,'2018-08-25 08:18:30','2018-08-26 08:18:30',NULL,6,405,'胡林林','https://wx.qlogo.cn/mmopen/vi_32/ajNVdqHZLLBOCDkbZG0WRiaibZCUlum62kVBzZrIthZ3U95Jfg9FdcL5B30Q0xZxBQ50bLgSVLxwxAI7wNApAJmQ/132',NULL,'',48,'',0,1,NULL),(36,3,1,2,'2018-08-31 15:03:58','2018-09-01 15:03:58',NULL,1,404,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJic27dia65Z8OQteuuLLKOX9hF82F0RiaDZeicpAbjzp1KgQ4bFJrNcIg44Bhiaxjibx6yP6sz5F079rRg/132',NULL,'',48,'',0,1,NULL),(37,3,1,0,'2018-08-31 15:07:47','2018-09-01 15:07:47',NULL,1,404,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJic27dia65Z8OQteuuLLKOX9hF82F0RiaDZeicpAbjzp1KgQ4bFJrNcIg44Bhiaxjibx6yP6sz5F079rRg/132',NULL,'',48,'',0,1,NULL),(38,3,1,2,'2018-09-10 16:32:43','2018-09-11 16:32:43',NULL,1,404,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJic27dia65Z8OQteuuLLKOX9hF82F0RiaDZeicpAbjzp1KgQ4bFJrNcIg44Bhiaxjibx6yP6sz5F079rRg/132',NULL,'',48,'',0,1,NULL),(40,20,8,3,'2018-09-27 21:57:45','2018-09-29 20:47:08',NULL,0,404,NULL,NULL,'2018-09-28 20:47:05','5:9.8,10:9.2,1500:9.0,200:8.8,2560:8.5',48,'许昌特产',0,2,NULL),(43,3,1,0,'2018-10-09 21:30:34','2018-10-10 21:30:34',NULL,10,404,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,48,NULL,2,1,NULL),(51,10,3,6,'2018-10-22 15:55:27','2018-10-24 15:54:00',NULL,0,404,NULL,NULL,'2018-10-23 15:54:00','5:9.5,10:9.0',48,'许昌特产',0,2,NULL),(52,3,1,0,'2018-10-24 12:13:01','2018-10-25 12:13:01',NULL,10,404,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,2,1,NULL),(53,3,3,0,'2018-10-30 19:56:32','2018-10-31 19:56:32',NULL,10,404,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,1,1,NULL),(54,3,3,0,'2018-10-30 20:19:45','2018-10-31 20:19:45',NULL,13,404,'会敏','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJkribhRyDNNmIA9gibbXEus80nqGvexn9zKUtYos8OWY30AB8VgyU2MArZA7tHwpbPlUKkFGdkNqdw/132',NULL,NULL,NULL,NULL,1,1,NULL),(55,3,3,0,'2018-10-31 19:13:35','2018-11-01 19:13:35',NULL,10,404,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,1,1,NULL),(56,3,2,0,'2018-10-31 20:17:50','2018-11-01 20:17:50',NULL,13,404,'会敏','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJkribhRyDNNmIA9gibbXEus80nqGvexn9zKUtYos8OWY30AB8VgyU2MArZA7tHwpbPlUKkFGdkNqdw/132',NULL,NULL,NULL,NULL,2,1,NULL),(57,8,3,6,'2018-11-04 10:01:20','2018-11-04 20:05:00',NULL,0,407,NULL,NULL,'2018-11-04 13:10:00','3:9.5,5:9.2,8:9',48,'许昌特产',0,2,NULL),(58,3,1,0,'2018-11-04 19:51:18','2018-11-05 19:51:18',NULL,22,404,'碗豆','https://wx.qlogo.cn/mmopen/vi_32/IDDicA7apW2Kic82l9RHzSxS1I5QHQ7d5L2qnROYsQQHCHvBYyP8tnOaXSVDUTyDIsUULYtUwhteTpAfnciaMvUNg/132',NULL,NULL,NULL,NULL,2,1,NULL),(59,2,1,0,'2018-11-04 20:02:28','2018-11-05 20:02:28',NULL,22,407,'碗豆','https://wx.qlogo.cn/mmopen/vi_32/IDDicA7apW2Kic82l9RHzSxS1I5QHQ7d5L2qnROYsQQHCHvBYyP8tnOaXSVDUTyDIsUULYtUwhteTpAfnciaMvUNg/132',NULL,NULL,NULL,NULL,2,1,NULL),(60,3,1,0,'2018-11-04 21:07:58','2018-11-05 21:07:58',NULL,22,404,'碗豆','https://wx.qlogo.cn/mmopen/vi_32/IDDicA7apW2Kic82l9RHzSxS1I5QHQ7d5L2qnROYsQQHCHvBYyP8tnOaXSVDUTyDIsUULYtUwhteTpAfnciaMvUNg/132',NULL,NULL,NULL,NULL,2,1,NULL),(61,3,1,0,'2018-11-07 17:39:59','2018-11-08 17:39:59',NULL,10,404,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,2,1,NULL),(62,3,1,0,'2018-11-08 22:36:06','2018-11-09 22:36:06',NULL,14,404,'胡林林','https://wx.qlogo.cn/mmopen/vi_32/ajNVdqHZLLBPWYY8zd1Mq59HA2xZu1M7WMELVl6yJFhq8pf5nBNyG2IJdkqobCMlpCibQgMictn8nCSo71HWRpMg/132',NULL,NULL,NULL,NULL,2,1,NULL),(63,10,1,6,'2018-11-12 21:29:09','2018-11-14 14:20:00',NULL,0,404,NULL,NULL,'2018-11-13 08:20:00','3:9.5,5:9.2,7:8.8,10:8.5',48,'许昌特产',0,2,NULL),(64,5,7,6,'2018-11-19 20:40:25','2018-11-19 22:33:00',NULL,0,407,NULL,NULL,'2018-11-19 21:32:00','3:9.5,5:9.2',48,'许昌特产',0,2,NULL),(65,5,0,6,'2018-11-20 12:02:21','2018-11-22 11:54:00',NULL,0,407,NULL,NULL,'2018-11-21 11:54:00','3:9.5,5:9',48,'许昌特产',0,2,NULL),(66,5,3,6,'2018-11-20 14:12:43','2018-12-28 14:05:00',NULL,0,407,NULL,NULL,'2018-12-27 19:05:00','3:9,5:8',48,'许昌特产',0,2,'https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_supergroup/id_66_1545893142556'),(67,3,1,0,'2018-11-22 14:52:15','2018-11-23 14:52:15',NULL,10,404,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,2,1,NULL),(68,3,1,0,'2018-11-23 09:55:40','2018-11-24 09:55:40',NULL,10,404,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,2,1,NULL),(69,2,1,0,'2018-11-23 11:06:58','2018-11-24 11:06:58',NULL,10,407,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,2,1,NULL),(70,3,2,0,'2018-11-25 11:02:31','2018-11-26 11:02:31',NULL,10,404,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,2,1,NULL),(71,2,1,0,'2018-12-02 20:13:38','2018-12-03 20:13:38',NULL,14,407,'胡林林','https://wx.qlogo.cn/mmopen/vi_32/ajNVdqHZLLBPWYY8zd1Mq59HA2xZu1M7WMELVl6yJFhq8pf5nBNyG2IJdkqobCMlpCibQgMictn8nCSo71HWRpMg/132',NULL,NULL,NULL,NULL,2,1,NULL),(72,3,1,0,'2018-12-02 20:15:19','2018-12-03 20:15:19',NULL,14,404,'胡林林','https://wx.qlogo.cn/mmopen/vi_32/ajNVdqHZLLBPWYY8zd1Mq59HA2xZu1M7WMELVl6yJFhq8pf5nBNyG2IJdkqobCMlpCibQgMictn8nCSo71HWRpMg/132',NULL,NULL,NULL,NULL,2,1,NULL),(73,3,1,0,'2018-12-02 22:55:05','2018-12-03 22:55:05',NULL,40,404,'高华','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIX88FOcCENjuB272faID1GpFRE77nMXN6Pm43Z4IVnFXxc0sPiaXZtmxZQPmwvy8slaWZ57pNMLmQ/132',NULL,NULL,NULL,NULL,2,1,NULL),(74,3,1,0,'2018-12-14 18:32:20','2018-12-15 18:32:20',NULL,40,404,'高华','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIX88FOcCENjuB272faID1GpFRE77nMXN6Pm43Z4IVnFXxc0sPiaXZtmxZQPmwvy8slaWZ57pNMLmQ/132',NULL,NULL,NULL,NULL,2,1,NULL),(75,2,1,0,'2018-12-14 19:59:29','2018-12-15 19:59:29',NULL,14,407,'胡林林','https://wx.qlogo.cn/mmopen/vi_32/ajNVdqHZLLBPWYY8zd1Mq59HA2xZu1M7WMELVl6yJFhq8pf5nBNyG2IJdkqobCMlpCibQgMictn8nCSo71HWRpMg/132',NULL,NULL,NULL,NULL,0,1,NULL),(76,3,1,0,'2018-12-14 20:09:59','2018-12-15 20:09:59',NULL,10,404,'王 ','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,0,1,NULL),(77,3,1,0,'2018-12-15 23:15:09','2018-12-16 23:15:09',NULL,40,404,'高华','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIX88FOcCENjuB272faID1GpFRE77nMXN6Pm43Z4IVnFXxc0sPiaXZtmxZQPmwvy8slaWZ57pNMLmQ/132',NULL,NULL,NULL,NULL,2,1,NULL),(78,2,2,0,'2018-12-17 16:37:48','2018-12-18 16:37:48',NULL,14,407,'胡林林','https://wx.qlogo.cn/mmopen/vi_32/ajNVdqHZLLBPWYY8zd1Mq59HA2xZu1M7WMELVl6yJFhq8pf5nBNyG2IJdkqobCMlpCibQgMictn8nCSo71HWRpMg/132',NULL,NULL,NULL,NULL,1,1,NULL),(79,2,1,0,'2018-12-17 19:29:27','2018-12-18 19:29:27',NULL,22,407,'碗豆','https://wx.qlogo.cn/mmopen/vi_32/IDDicA7apW2Kic82l9RHzSxS1I5QHQ7d5L2qnROYsQQHCHvBYyP8tnOaXSVDUTyDIsUULYtUwhteTpAfnciaMvUNg/132',NULL,NULL,NULL,NULL,2,1,NULL),(80,2,2,0,'2018-12-22 16:41:05','2018-12-23 16:41:05',NULL,13,407,'会敏','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJkribhRyDNNmIA9gibbXEus80nqGvexn9zKUtYos8OWY30AB8VgyU2MArZA7tHwpbPlUKkFGdkNqdw/132',NULL,NULL,NULL,NULL,1,1,NULL),(81,2,2,0,'2018-12-22 16:53:41','2018-12-23 16:53:41',NULL,22,407,'碗豆','https://wx.qlogo.cn/mmopen/vi_32/IDDicA7apW2Kic82l9RHzSxS1I5QHQ7d5L2qnROYsQQHCHvBYyP8tnOaXSVDUTyDIsUULYtUwhteTpAfnciaMvUNg/132',NULL,NULL,NULL,NULL,1,1,NULL),(82,2,2,0,'2018-12-22 17:19:12','2018-12-23 17:19:12',NULL,17,407,'在路上（海龙）','https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEL1yOaichkJ9z54MXMjRcRwDSPZ2gia3ck4dvVRhvpemvX7esSSbwOtOrEgdMYicM4RXHwUMUINjWEOw/132',NULL,NULL,NULL,NULL,1,1,NULL),(83,3,3,0,'2018-12-22 17:26:59','2018-12-23 17:26:59',NULL,40,404,'高华','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIX88FOcCENjuB272faID1GpFRE77nMXN6Pm43Z4IVnFXxc0sPiaXZtmxZQPmwvy8slaWZ57pNMLmQ/132',NULL,NULL,NULL,NULL,1,1,NULL),(84,2,2,0,'2018-12-23 19:50:25','2018-12-24 19:50:25',NULL,24,407,'stone','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJGmJJSxWepjfldr56lk5a2vH8PmwPgemDnY8zOJLzkOZWzkkve6OD3na5p7oCaCkY7Us279LgYQQ/132',NULL,NULL,NULL,NULL,1,1,NULL),(85,10,3,6,'2018-12-28 17:34:31','2018-12-29 12:00:00',NULL,0,407,NULL,NULL,'2018-12-28 19:00:00','3:9.6,5:9.2,10:8.8',48,'许昌特产',0,2,'https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_supergroup/id_85_1545990311381'),(86,2,1,0,'2018-12-29 13:15:43','2018-12-30 13:15:43',NULL,10,407,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,2,1,NULL),(87,2,1,0,'2019-01-01 11:47:00','2019-01-02 11:47:00',NULL,22,407,'碗豆','https://wx.qlogo.cn/mmopen/vi_32/IDDicA7apW2Kic82l9RHzSxS1I5QHQ7d5L2qnROYsQQHCHvBYyP8tnOaXSVDUTyDIsUULYtUwhteTpAfnciaMvUNg/132',NULL,NULL,NULL,NULL,2,1,NULL),(88,2,2,0,'2019-01-02 21:03:34','2019-01-03 21:03:34',NULL,10,408,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,1,1,NULL),(89,2,1,0,'2019-01-09 16:39:05','2019-01-10 16:39:05',NULL,10,409,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,2,1,NULL),(90,6,5,0,'2019-01-10 17:30:23','2019-02-16 16:30:00',NULL,0,404,NULL,NULL,'2019-02-16 15:33:00','2:10.0,4:9.2,6:8.8',48,'许昌特产',0,2,'https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_supergroup/id_90_1547112944999'),(91,2,1,0,'2019-01-10 18:17:55','2019-01-11 18:17:55',NULL,22,408,'碗豆','https://wx.qlogo.cn/mmopen/vi_32/IDDicA7apW2Kic82l9RHzSxS1I5QHQ7d5L2qnROYsQQHCHvBYyP8tnOaXSVDUTyDIsUULYtUwhteTpAfnciaMvUNg/132',NULL,NULL,NULL,NULL,2,1,NULL),(97,3,0,6,'2019-02-15 22:59:23','2019-02-16 16:59:00',NULL,0,404,NULL,NULL,'2019-02-15 22:59:05','1:10,3:9',48,NULL,0,2,'https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_supergroup/id_97_1550238785607'),(92,2,2,0,'2019-01-11 16:41:35','2019-01-12 16:41:35',NULL,63,409,'老魏特产','https://wx.qlogo.cn/mmopen/vi_32/ekFWm6NDQzRicibSFGfWMgHS2jaiaTTOdg1jBzJk7NR3VwT9cibqRia1FdHTt3fsTD0PWA9AyyzsibvwPs98RgNfyPOA/132',NULL,NULL,NULL,NULL,1,1,NULL),(93,2,1,0,'2019-01-11 20:58:43','2019-01-12 20:58:43',NULL,10,409,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,2,1,NULL),(94,2,1,0,'2019-01-14 15:50:48','2019-01-15 15:50:48',NULL,10,409,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,2,1,NULL),(95,2,1,0,'2019-01-17 10:48:55','2019-01-18 10:48:55',NULL,10,409,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,2,1,NULL),(96,2,2,0,'2019-01-21 21:03:02','2019-01-22 21:03:02',NULL,22,409,'碗豆','https://wx.qlogo.cn/mmopen/vi_32/IDDicA7apW2Kic82l9RHzSxS1I5QHQ7d5L2qnROYsQQHCHvBYyP8tnOaXSVDUTyDIsUULYtUwhteTpAfnciaMvUNg/132',NULL,NULL,NULL,NULL,1,1,NULL);
/*!40000 ALTER TABLE `zytc_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_member_express_address`
--

DROP TABLE IF EXISTS `zytc_member_express_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_member_express_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '会员基本资料表ID',
  `consigner` varchar(255) NOT NULL DEFAULT '' COMMENT '收件人',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机',
  `phone` varchar(20) NOT NULL DEFAULT '' COMMENT '固定电话',
  `province` int(11) NOT NULL DEFAULT '0' COMMENT '省',
  `city` int(11) NOT NULL DEFAULT '0' COMMENT '市',
  `district` int(11) NOT NULL DEFAULT '0' COMMENT '区县',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '详细地址',
  `zip_code` varchar(6) NOT NULL DEFAULT '' COMMENT '邮编',
  `alias` varchar(50) NOT NULL DEFAULT '' COMMENT '地址别名',
  `is_default` int(11) NOT NULL DEFAULT '0' COMMENT '默认收货地址',
  `provincename` varchar(45) DEFAULT NULL,
  `cityname` varchar(45) DEFAULT NULL,
  `districtname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_member_express_address_uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=2340 COMMENT='会员收货地址管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_member_express_address`
--

LOCK TABLES `zytc_member_express_address` WRITE;
/*!40000 ALTER TABLE `zytc_member_express_address` DISABLE KEYS */;
INSERT INTO `zytc_member_express_address` VALUES (181,13,'王会敏','15939938235','',16,161,1453,'龙湖西苑(塑料厂街南) 龙湖西苑','','',1,'河南省','许昌市','魏都区'),(182,14,'胡林林','18637471928','',16,161,1453,'御萃花园','','',1,'河南省','许昌市','魏都区'),(183,22,'王婉君','13716206495','',27,296,2607,'长安镇枣园村2组','','',1,'陕西省','安康市','平利县'),(193,40,'高华','15910394793','',1,1,5,'三里屯西六街','','',0,'北京市','北京市','朝阳区'),(194,40,'高华','15910394793','',1,1,1,'木木木','','',0,'北京市','北京市','东城区'),(195,40,'高华','15910394793','',1,1,8,'旗胜家园','','',1,'北京市','北京市','海淀区'),(204,39,'hm','15310929786','',22,234,2011,'双子座A(渝北区青枫北路10号3幢)','','',1,'重庆市','重庆市','渝北区'),(205,24,'李红岩','18839932552','',16,161,1453,'空港新城','','',1,'河南省','许昌市','魏都区'),(206,17,'押海龙','15936397266','',16,161,1453,'工行小区','','',1,'河南省','许昌市','魏都区'),(207,63,'魏','18637468680','',16,161,1453,'龙湖西苑(魏都区龙湖西苑塑料厂街南)','','',1,'河南省','许昌市','魏都区'),(209,10,'王波','18637468680','',16,161,1453,'龙湖西苑(魏都区龙湖西苑塑料厂街南)','','',1,'河南省','许昌市','魏都区'),(214,63,'魏秀芬','18637468680','',1,1,6,'龙居处\n','','',0,'北京市','北京市','丰台区'),(215,71,'余谦','15527238320','',17,169,1527,'中北路知音广场15楼天风天成资产管理有限公司','','',1,'湖北省','武汉市','武昌区'),(216,76,'王振林','15939965186','',16,161,1453,'龙湖西苑(魏都区龙湖西苑塑料厂街南)','','',1,'河南省','许昌市','魏都区'),(217,15,'杨哲','15669058183','',11,87,846,'下沙幸福南路东海柠檬郡7栋2603','','',1,'浙江省','杭州市','江干区'),(218,10,'王江波','18637468680','',1,1,2,'北新华街29号 北京昌盛大厦','','',0,'北京市','北京市','西城区'),(221,10,'王王','18637468680','',9,73,729,'测试一下','','',0,'上海市','上海市','宝山区'),(222,18,'押宁博','13564334855','',9,73,729,'罗东路1555号','','',1,'上海市','上海市','宝山区');
/*!40000 ALTER TABLE `zytc_member_express_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_offpay_area`
--

DROP TABLE IF EXISTS `zytc_offpay_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_offpay_area` (
  `shop_id` int(11) DEFAULT NULL COMMENT '店铺Id',
  `province_id` text COMMENT '省Id组合',
  `city_id` text COMMENT '市Id组合',
  `district_id` text COMMENT '县Id组合'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='货到付款支持地区表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_offpay_area`
--

LOCK TABLES `zytc_offpay_area` WRITE;
/*!40000 ALTER TABLE `zytc_offpay_area` DISABLE KEYS */;
INSERT INTO `zytc_offpay_area` VALUES (0,'34,19,23,24,25,4','345,356,197,198,199,200,201,202,203,204,205,206,207,208,210,211,212,213,214,215,216,217,209,235,238,241,256,259,262,265,14,15,16,17,18,19,20,21,22,23,24','209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,2319,2320,2322,2040,2041,2042,2043,2044,2045,2046,2047,2048,2049,2050,2051,2052,2053,2054,2055,2056,2057,2058,2070,2071,2072,2073,2074,2075,2076,2092,2093,2094,2095,2096,2097,2098,2221,2222,2223,2224,2225,2226,2227,2228,2229,2230,2249,2250,2251,2252,2253,2254,2273,2274,2275,2276,2277,2278,2279,2280,2309,2311,2314,2317,1747,1748,1749,1750,1751,1752,1753,1754,1755,1756,1757,1759,1760,1761,1762,1763,1764,1765,1766,1767,1768,1769,1770,1771,1772,1773,1774,1775,1776,1777,1778,1779,1780,1781,1782,1783,1784,1785,1786,1787,1788,1789,1790,1791,1792,1793,1794,1795,1796,1797,1798,1799,1800,1801,1802,1803,1804,1805,1806,1807,1808,1809,1810,1811,1812,1813,1814,1815,1816,1817,1818,1819,1820,1821,1822,1823,1824,1825,1826,1827,1828,1829,1830,1831,1832,1833,1834,1835,1836,1837,1838,1839,1840,1841,1842,1843,1844,1845,1846,1847,1848,1849,1850,1851,1852,1853,1854,1855,1856,1857,1858,1859,1860,1861,1862,1863,1864,1865,1866,1867'),(1,'34,19','345,356,197,198,199,200,201,202,203,204,205,206,207,208,210,211,212,213,214,215,216,217,209','1747,1748,1749,1750,1751,1752,1753,1754,1755,1756,1757,1759,1760,1761,1762,1763,1764,1765,1766,1767,1768,1769,1770,1771,1772,1773,1774,1775,1776,1777,1778,1779,1780,1781,1782,1783,1784,1785,1786,1787,1788,1789,1790,1791,1792,1793,1794,1795,1796,1797,1798,1799,1800,1801,1802,1803,1804,1805,1806,1807,1808,1809,1810,1811,1812,1813,1814,1815,1816,1817,1818,1819,1820,1821,1822,1823,1824,1825,1826,1827,1828,1829,1830,1831,1832,1833,1834,1835,1836,1837,1838,1839,1840,1841,1842,1843,1844,1845,1846,1847,1848,1849,1850,1851,1852,1853,1854,1855,1856,1857,1858,1859,1860,1861,1862,1863,1864,1865,1866,1867');
/*!40000 ALTER TABLE `zytc_offpay_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_order`
--

DROP TABLE IF EXISTS `zytc_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `out_trade_no` varchar(100) DEFAULT '0' COMMENT '外部交易号',
  `buyer_id` int(11) DEFAULT NULL COMMENT '买家id',
  `pay_time` datetime DEFAULT NULL COMMENT '订单付款时间',
  `shipping_time` datetime DEFAULT NULL COMMENT '买家要求配送时间',
  `sign_time` datetime DEFAULT NULL COMMENT '买家签收时间',
  `order_price` decimal(19,2) DEFAULT '0.00' COMMENT '商品价格',
  `order_money` decimal(10,2) DEFAULT '0.00' COMMENT '订单总价 平台团购的情况下该值为退款后的值',
  `shipping_money` decimal(10,2) DEFAULT '0.00' COMMENT '订单运费',
  `pay_money` decimal(10,2) DEFAULT '0.00' COMMENT '订单实付金额,',
  `refund_money` decimal(10,2) DEFAULT '0.00' COMMENT '订单退款金额',
  `order_status` tinyint(4) DEFAULT '0' COMMENT '订单状态',
  `pay_status` tinyint(4) DEFAULT '0' COMMENT '订单付款状态',
  `shipping_status` tinyint(4) DEFAULT '0' COMMENT '订单配送状态',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '订单创建时间',
  `finish_time` datetime DEFAULT NULL COMMENT '订单完成时间',
  `transaction_id` varchar(45) DEFAULT '',
  `profit_status` tinyint(4) DEFAULT '0',
  `group_order_id` int(11) DEFAULT '0',
  `group_buy` int(11) DEFAULT '0' COMMENT '0正常订单 1用户团 2 平台团',
  `group_header` int(11) DEFAULT '0',
  `user_name` varchar(45) DEFAULT '',
  `refund_process_status` int(11) DEFAULT '0',
  `prepay_id` varchar(128) DEFAULT '',
  `form_id` varchar(128) DEFAULT '',
  `giver_id` int(11) DEFAULT '0',
  `ordertype` int(11) DEFAULT '0' COMMENT '0 正常订单(包括团购,超级团购,折扣) 1 普通送礼 2平台抽奖 ',
  `is_selflift` int(11) DEFAULT '0',
  `given_token` varchar(45) DEFAULT NULL COMMENT '用于简单验证是否伪造',
  `given_status` int(11) DEFAULT '0' COMMENT '0 未被领取 1已领取 2过期',
  `preshippfee` int(11) DEFAULT '0',
  `sharefrom` int(11) DEFAULT '0',
  `canrefund` int(11) DEFAULT '1',
  `shop_id` int(11) DEFAULT '0' COMMENT '卖家店铺id',
  `refund_flag` int(11) DEFAULT '0' COMMENT ' 按位区分占2位理论支持16种以上 默认为0表示该位置无退款 1表示成功 2表示失败   1 团购失败 2 无用 3 正常退款 4 送礼超时 5 无用 6 平台团购退折扣',
  `discount` decimal(10,2) DEFAULT '1.00' COMMENT '实际的折扣 平台团购需要在开奖时设定该值 以及价格',
  `discount_goods_id` int(11) DEFAULT '0',
  `isfree` int(11) DEFAULT '0' COMMENT '是否免单',
  `finish_reason` int(11) DEFAULT '0' COMMENT '0 评价结束 1 开团失败 2 送礼超时',
  `fixaddr` int(11) DEFAULT '0',
  `tryrefund` int(11) DEFAULT '0',
  PRIMARY KEY (`order_id`),
  KEY `INDEX_GROUP_ID` (`group_order_id`),
  KEY `INDEX_BUYERID` (`buyer_id`),
  KEY `INDEX_GIVERID` (`giver_id`),
  KEY `INDEX_SHOPID` (`shop_id`),
  KEY `INDEX_STATUS` (`order_status`)
) ENGINE=InnoDB AUTO_INCREMENT=478 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=440 COMMENT='订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_order`
--

LOCK TABLES `zytc_order` WRITE;
/*!40000 ALTER TABLE `zytc_order` DISABLE KEYS */;
INSERT INTO `zytc_order` VALUES (2,'JW141542853934530-48404',14,'2018-11-22 10:32:21','2018-12-05 10:01:26',NULL,22.00,31.00,0.00,0.00,0.00,1,2,1,'2018-11-22 10:32:15',NULL,'4200000238201811225964717488',0,0,0,0,'胡林林',0,'wx221032151568943494af665a2009665776',NULL,10,1,0,'DC4FDAE64D7744F0FE15FEFCA0FC02A5',1,9,1,0,48,4,1.00,0,0,0,0,0),(278,'JW101542873941748-48404',10,'2018-11-22 16:05:48','2018-11-26 15:50:38','2018-11-26 20:22:29',33.00,42.00,0.00,0.00,0.00,6,2,1,'2018-11-22 16:05:42',NULL,'4200000219201811228298331430',0,0,0,0,'王江波',6,'wx221605424040184cafc177000489951576',NULL,10,1,0,'2FCADF2EE32B8A4A7AE1DDEDBDB3FFE6',1,9,10,0,48,-2147475424,1.00,0,0,0,0,0),(281,'JW101542938132697-48404',10,'2018-11-23 09:55:40',NULL,NULL,22.00,31.00,0.00,0.00,0.00,4,2,0,'2018-11-23 09:55:33',NULL,'4200000225201811239739381592',0,68,1,1,'王江波',0,'wx230955334369330149a28d6f0485702379',NULL,0,1,0,'5A340BD1AE4289352F5959F142265EBF',0,9,10,0,48,1,1.00,0,0,1,0,0),(283,'JW101542941969048-48407',10,'2018-11-23 11:06:58',NULL,NULL,11.00,11.00,0.00,0.00,0.00,4,2,0,'2018-11-23 10:59:29',NULL,'4200000225201811236074724149',0,69,1,1,'王江波',0,'wx231106380701106413b247551885212935',NULL,0,1,0,'30DC0633649DBA20DB3113BCD445624F',0,0,10,0,48,1,1.00,0,0,1,0,0),(284,'JW101543114916990-48404',10,'2018-11-25 11:02:04',NULL,NULL,33.00,42.00,0.00,0.00,0.00,4,2,0,'2018-11-25 11:01:57',NULL,'4200000216201811255306844180',0,0,0,0,'王江波',0,'wx251101577035644baed4af0a2646819075',NULL,0,1,0,'C6E2433E0CF5A9924A7E40D4F978E51F',2,9,10,0,48,64,1.00,0,0,2,0,0),(285,'JW101543114944712-48404',10,'2018-11-25 11:02:31',NULL,NULL,22.00,31.00,0.00,0.00,0.00,4,2,0,'2018-11-25 11:02:25',NULL,'4200000234201811251570733236',0,70,1,1,'王江波',0,'wx251102253643279904e3b8711096543442',NULL,0,1,0,'6E7553C32BBDD32A1D5EF49257C24A7D',0,9,10,0,48,1,1.00,0,0,1,0,0),(286,'JW141543116328877-48404',14,'2018-11-25 11:25:35',NULL,NULL,22.00,22.00,0.00,0.00,0.00,4,2,0,'2018-11-25 11:25:29',NULL,'4200000212201811257357298262',0,70,1,0,'胡林林',0,'wx25112529490047c390ba6cf43869018114',NULL,0,0,0,NULL,0,0,10,0,48,1,1.00,0,0,1,0,0),(287,'JW101543576397885-48407',10,'2018-11-30 19:13:56','2018-11-30 19:07:11','2018-11-30 19:16:49',25.00,25.00,0.00,0.00,0.00,6,2,1,'2018-11-30 19:13:18',NULL,'4200000218201811305864046092',1,0,0,0,'王江波',7,'wx301913188534819575a9b0183650889209',NULL,0,0,0,NULL,0,0,10,0,48,16,1.00,0,0,0,0,0),(288,'JW141543752792482-48407',14,'2018-12-02 20:13:38',NULL,NULL,11.00,99.00,0.00,0.00,0.00,4,2,0,'2018-12-02 20:13:12',NULL,'4200000210201812023408547694',0,71,1,1,'胡林林',0,'wx02201313472815ddedd9c8a11023296023',NULL,0,0,0,NULL,0,0,10,0,48,1,1.00,0,0,1,0,0),(289,'JW141543752902987-48404',14,'2018-12-02 20:15:19',NULL,NULL,22.00,22.00,0.00,0.00,0.00,4,2,0,'2018-12-02 20:15:03',NULL,'4200000230201812024035143731',0,72,1,1,'胡林林',0,'wx022015137308667f61faf3ab0626369325',NULL,0,0,0,NULL,0,0,10,0,48,1,1.00,0,0,1,0,0),(290,'JW401543761747396-48407',40,'2018-12-02 22:42:39','2018-12-05 10:18:15',NULL,25.00,125.00,0.00,0.00,0.00,3,2,1,'2018-12-02 22:42:27',NULL,'4200000233201812029134334059',1,0,0,0,'高华',0,'wx022242282812568453aca0d60576982327',NULL,0,0,0,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(291,'JW401543762499644-48404',40,'2018-12-02 22:55:05',NULL,NULL,33.00,84.00,18.00,0.00,0.00,4,2,0,'2018-12-02 22:55:00',NULL,'4200000213201812021049134466',0,73,1,1,'高华',0,'wx02225500234220d2a95dc0200240280873',NULL,0,0,0,NULL,0,0,10,0,48,1,1.00,0,0,1,0,0),(292,'JW131543762906191-48404',13,'2018-12-02 23:01:55',NULL,NULL,33.00,42.00,0.00,0.00,0.00,4,2,0,'2018-12-02 23:01:46',NULL,'4200000229201812023840455400',0,0,0,0,'会敏',0,'wx02230146872534c6830716962643358493',NULL,0,1,0,'D7C2128806FE445779C0E61A4E3AB644',2,9,0,0,48,64,1.00,0,0,2,0,0),(294,'JW401543826622521-48407',40,'2018-12-03 16:43:50','2018-12-05 10:16:44',NULL,25.00,25.00,0.00,0.00,0.00,3,2,1,'2018-12-03 16:43:43',NULL,'4200000233201812036640708208',1,0,0,0,'高华',0,'wx03164343181824ad4adc22f24147534004',NULL,0,0,0,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(295,'JW101543924174725-48407',10,'2018-12-04 19:49:57','2018-12-05 10:05:15','2018-12-15 15:29:03',25.00,25.00,0.00,0.00,0.00,3,2,1,'2018-12-04 19:49:35',NULL,'4200000221201812042693949134',1,0,0,0,'王江波',0,'wx041949356908102de431d1423071036585',NULL,0,0,0,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(298,'JW401543938489915-48404',40,'2018-12-04 23:48:17','2018-12-05 10:01:48',NULL,33.00,84.00,18.00,0.00,0.00,3,2,1,'2018-12-04 23:48:10',NULL,'4200000212201812042135139795',1,0,0,0,'高华',0,'wx042348106088398448a629013542719958',NULL,0,0,0,NULL,0,0,40,0,48,0,1.00,0,0,0,0,0),(299,'JW101544759542561-48407',10,'2018-12-14 11:52:47',NULL,NULL,25.00,25.00,0.00,0.00,0.00,1,2,0,'2018-12-14 11:52:23',NULL,'4200000220201812140917790910',0,0,0,0,'王 ',0,'wx14115223361321267e6eed613488002835',NULL,10,1,0,'2509E7A58C34947D11DACEC005C8A577',1,0,10,0,48,0,1.00,0,0,0,0,0),(300,'JW401544783492572-48404',40,'2018-12-14 18:31:41',NULL,NULL,33.00,84.00,18.00,0.00,0.00,1,2,0,'2018-12-14 18:31:33',NULL,'4200000227201812140135569074',0,0,0,0,'高华',0,'wx14183133196318caadc70b3b0036382375',NULL,0,0,0,NULL,0,0,40,0,48,0,1.00,0,0,0,0,0),(301,'JW401544783535604-48404',40,'2018-12-14 18:32:20',NULL,NULL,33.00,84.00,0.00,0.00,0.00,4,2,0,'2018-12-14 18:32:16',NULL,'4200000232201812144944459820',0,74,1,1,'高华',0,'wx14183216165179d81d6efeb81831751828',NULL,0,1,0,'CAFF7BF3D7C367CF7A4E16973E457FCB',0,18,40,0,48,1,1.00,0,0,1,0,0),(302,'JW131544786528409-48404',13,'2018-12-14 19:22:25',NULL,NULL,22.00,22.00,0.00,0.00,0.00,1,2,0,'2018-12-14 19:22:08',NULL,'4200000211201812144114005359',0,0,0,0,'会敏',0,'wx1419220915509838cb588b650972763639',NULL,0,0,0,NULL,0,0,13,0,48,0,1.00,0,0,0,0,0),(303,'JW401544786643923-48404',40,'2018-12-14 19:24:10',NULL,NULL,33.00,84.00,18.00,0.00,0.00,1,2,0,'2018-12-14 19:24:04',NULL,'4200000237201812144451615166',0,0,0,0,'高华',0,'wx141924048166127864738ca42327191221',NULL,0,0,0,NULL,0,0,40,0,48,0,1.00,0,0,0,0,0),(304,'JW401544788738469-48404',40,'2018-12-14 19:59:06',NULL,NULL,33.00,42.00,9.00,0.00,0.00,1,2,0,'2018-12-14 19:58:58',NULL,'4200000232201812149656300483',0,0,0,0,'高华',0,'wx14195859410093bb8d2ed9d03884592633',NULL,0,0,0,NULL,0,0,40,0,48,0,1.00,0,0,0,0,0),(305,'JW141544788762539-48407',14,'2018-12-14 19:59:29',NULL,NULL,11.00,11.00,0.00,0.00,0.00,4,2,0,'2018-12-14 19:59:23',NULL,'4200000213201812149877278311',0,75,1,1,'胡林林',0,'wx14195923127961e53da625700542741589',NULL,0,0,0,NULL,0,0,10,0,48,2,1.00,0,0,2,0,0),(306,'JW401544788779744-48407',40,'2018-12-14 19:59:48',NULL,NULL,25.00,25.00,0.00,0.00,0.00,1,2,0,'2018-12-14 19:59:40',NULL,'4200000237201812145855884693',0,0,0,0,'高华',0,'wx141959406472599fc096f93d3834287654',NULL,0,0,0,NULL,0,0,40,0,48,0,1.00,0,0,0,0,0),(307,'JW101544789391756-48404',10,'2018-12-14 20:09:59',NULL,NULL,22.00,31.00,0.00,0.00,0.00,7,2,0,'2018-12-14 20:09:52',NULL,'4200000230201812148126900392',0,76,1,1,'王 ',0,'wx1420095246688122585cd5281152821478',NULL,0,1,0,'7C5318AE3FB46CA02C1A185029F52451',0,9,10,0,48,0,1.00,0,0,0,0,0),(308,'JW141544790082253-48404',14,'2018-12-14 20:21:27',NULL,NULL,33.00,33.00,0.00,0.00,0.00,1,2,0,'2018-12-14 20:21:22',NULL,'4200000226201812141602761006',0,0,0,0,'胡林林',0,'wx142021228457193a992f4bfc2672479829',NULL,0,0,0,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(309,'JW401544795403823-48407',40,'2018-12-14 21:50:10',NULL,NULL,25.00,25.00,0.00,0.00,0.00,1,2,0,'2018-12-14 21:50:04',NULL,'4200000237201812145276135655',0,0,0,0,'高华',0,'wx142150043795621aff0a71de1559998110',NULL,0,0,0,NULL,0,0,40,0,48,0,1.00,0,0,0,0,0),(310,'JW401544849146737-48404',40,'2018-12-15 12:46:00',NULL,NULL,33.00,42.00,9.00,0.00,0.00,1,2,0,'2018-12-15 12:45:47',NULL,'4200000221201812155102445463',0,0,0,0,'高华',0,'wx151245475897954d5da3514b3838172225',NULL,0,0,0,NULL,0,0,40,0,48,0,1.00,0,0,0,0,0),(311,'JW401544859750539-48404',40,NULL,NULL,NULL,33.00,42.00,9.00,0.00,0.00,1,2,0,'2018-12-15 15:42:31',NULL,NULL,0,0,0,0,'高华',0,'wx1515423126635419d915ea622082121205',NULL,0,0,0,NULL,0,0,40,0,48,0,1.00,0,0,0,0,0),(312,'JW401544886826478-48404',40,'2018-12-15 23:14:09',NULL,NULL,33.00,42.00,9.00,0.00,0.00,1,2,0,'2018-12-15 23:13:46',NULL,'4200000220201812155649799554',0,0,0,0,'高华',0,'wx15231347087255088152e2b43063291948',NULL,0,0,0,NULL,0,0,40,0,48,0,1.00,0,0,0,0,0),(313,'JW401544886874661-48404',40,'2018-12-15 23:14:41',NULL,NULL,33.00,42.00,9.00,0.00,0.00,1,2,0,'2018-12-15 23:14:35',NULL,'4200000212201812151737259922',0,0,0,0,'高华',0,'wx1523143526189885e258cf943102614989',NULL,0,0,0,NULL,0,0,40,0,48,0,1.00,0,0,0,0,0),(314,'JW401544886901593-48404',40,'2018-12-15 23:15:09',NULL,NULL,33.00,42.00,9.00,0.00,0.00,4,2,0,'2018-12-15 23:15:02',NULL,'4200000213201812153838048580',0,77,1,1,'高华',0,'wx1523150216202199928bde8a1472448169',NULL,0,0,0,NULL,0,0,40,0,48,1,1.00,0,0,1,0,0),(315,'JW101545020392668-0407',0,NULL,NULL,NULL,0.00,0.00,0.00,0.00,0.00,1,0,0,'2018-12-17 12:19:53',NULL,NULL,0,0,0,0,'王江波',0,NULL,NULL,13,2,0,'9062353F09D7BCF24189C11B6F28BF61',1,0,0,0,48,0,0.00,0,0,0,0,0),(316,'JW141545035846245-48407',14,'2018-12-17 16:37:48',NULL,NULL,11.00,11.00,0.00,0.00,0.00,1,2,0,'2018-12-17 16:37:26',NULL,'4200000213201812173148195345',0,78,1,1,'胡林林',0,'wx171637269438826cf5305ba91715666381',NULL,0,0,0,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(317,'JW391545037600115-48407',39,'2018-12-17 17:07:10',NULL,NULL,11.00,11.00,0.00,0.00,0.00,1,2,0,'2018-12-17 17:06:40',NULL,'4200000234201812173205775535',0,78,1,0,'浅',0,'wx1717070375569452e856a3c92474761910',NULL,0,0,0,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(318,'JW221545046158061-48407',22,'2018-12-17 19:29:27',NULL,NULL,11.00,11.00,0.00,0.00,0.00,4,2,0,'2018-12-17 19:29:18',NULL,'4200000218201812172702952989',0,79,1,1,'碗豆',0,'wx1719291863759061dcc0ae322154464452',NULL,0,0,0,NULL,0,0,0,0,48,1,1.00,0,0,1,0,0),(319,'JW101545142412971-48407',10,'2018-12-18 22:13:39',NULL,NULL,25.00,25.00,0.00,0.00,0.00,1,2,0,'2018-12-18 22:13:33',NULL,'4200000226201812184546909879',0,0,0,0,'王江波',0,'wx182213337133588cc69267b23697674045',NULL,40,1,0,'0EC74B2EEEC409A6E7CC019B9A48CA50',1,0,10,0,48,8192,1.00,0,1,0,0,0),(320,'JW401545146920713-48407',40,'2018-12-18 23:29:02',NULL,NULL,25.00,25.00,0.00,0.00,0.00,1,2,0,'2018-12-18 23:28:41',NULL,'4200000218201812182192913912',0,0,0,0,'高华',0,'wx18232841348930736afb1f682421632252',NULL,0,0,0,NULL,0,0,40,0,48,0,1.00,0,0,0,0,0),(321,'JW141545275041812-48407',14,'2018-12-20 11:04:08',NULL,NULL,22.50,25.00,0.00,0.00,0.00,1,2,0,'2018-12-20 11:04:02',NULL,'4200000229201812205044936938',0,66,2,0,'胡林林',0,'wx20110402558165d51e0772c43900005142',NULL,0,0,0,NULL,0,0,13,0,48,1024,0.90,0,0,0,0,0),(322,'JW131545468055737-48407',13,'2018-12-22 16:41:05',NULL,NULL,11.00,11.00,0.00,0.00,0.00,1,2,0,'2018-12-22 16:40:56',NULL,'4200000232201812226351165968',0,80,1,1,'会敏',0,'wx22164056573658f13a7da9232460606623',NULL,0,0,0,NULL,0,0,13,0,48,0,1.00,0,0,0,0,0),(323,'JW101545468290187-48407',10,'2018-12-22 16:44:57',NULL,NULL,11.00,11.00,0.00,0.00,0.00,4,2,0,'2018-12-22 16:44:50',NULL,'4200000227201812223987650656',0,80,1,0,'王江波',0,'wx2216445087063067f512143b2041297242',NULL,0,1,0,'870AF94D09F2A0A76CCCE4292662CEDF',2,0,10,0,48,64,1.00,0,0,2,0,0),(324,'JW131545468701718-48404',13,'2018-12-22 16:52:05',NULL,NULL,22.00,31.00,0.00,0.00,0.00,4,2,0,'2018-12-22 16:51:42',NULL,'4200000233201812225294296550',0,0,0,0,'会敏',0,'wx22165142350734105b01309e1837190507',NULL,0,1,0,'1FA8B235800E491E41D535E90815A02C',2,9,13,0,48,64,1.00,0,0,0,0,0),(325,'JW131545468755388-48404',13,'2018-12-22 16:52:44',NULL,NULL,22.00,31.00,0.00,0.00,0.00,1,2,0,'2018-12-22 16:52:35',NULL,'4200000210201812223928574482',0,0,0,0,'会敏',0,'wx22165236062854b4a8baaad74086246916',NULL,22,1,0,'B63CD9121AD55B48F4048B9D2E0D6258',1,9,13,0,48,4,1.00,0,0,0,0,0),(326,'JW221545468811969-48407',22,'2018-12-22 16:53:42',NULL,NULL,11.00,11.00,0.00,0.00,0.00,1,2,0,'2018-12-22 16:53:32',NULL,'4200000210201812224329007535',0,81,1,1,'碗豆',0,'wx22165332635226e8045176b30183307763',NULL,0,0,0,NULL,0,0,13,0,48,0,1.00,0,0,0,0,0),(327,'JW401545468853981-48407',40,'2018-12-22 16:54:23',NULL,NULL,11.00,11.00,0.00,0.00,0.00,1,2,0,'2018-12-22 16:54:14',NULL,'4200000209201812225795513500',0,81,1,0,'高华',0,'wx221654145069311f450a59760148230803',NULL,0,0,0,NULL,0,0,40,0,48,0,1.00,0,0,0,0,0),(328,'JW171545470343823-48407',17,'2018-12-22 17:19:12',NULL,NULL,11.00,11.00,0.00,0.00,0.00,1,2,0,'2018-12-22 17:19:04',NULL,'4200000211201812226844279749',0,82,1,1,'在路上（海龙）',0,'wx22171904674755ea6c4a01901479898011',NULL,0,0,0,NULL,0,0,13,0,48,0,1.00,0,0,0,0,0),(329,'JW401545470813492-48404',40,'2018-12-22 17:26:59',NULL,NULL,33.00,84.00,18.00,0.00,0.00,1,2,0,'2018-12-22 17:26:53',NULL,'4200000214201812221042921731',0,83,1,1,'高华',0,'wx22172653957616f458cd5e110137975060',NULL,0,0,0,NULL,0,0,40,0,48,0,1.00,0,0,0,0,0),(330,'JW221545470831799-48407',22,'2018-12-22 17:27:20',NULL,NULL,11.00,11.00,0.00,0.00,0.00,1,2,0,'2018-12-22 17:27:12',NULL,'4200000233201812221704644227',0,82,1,0,'碗豆',0,'wx22172712307753f62c4ac3262681876458',NULL,0,0,0,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(331,'JW141545473466176-48404',14,NULL,NULL,NULL,33.00,33.00,0.00,0.00,0.00,3,2,0,'2018-12-22 18:11:06',NULL,NULL,1,83,1,0,'胡林林',0,'wx22181106668944e535117a140672844735',NULL,0,0,0,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(332,'JW101545532300661-48407',10,'2018-12-23 10:31:48',NULL,NULL,25.00,50.00,0.00,0.00,0.00,1,2,0,'2018-12-23 10:31:41',NULL,'4200000231201812238889569206',0,0,0,0,'王江波',0,'wx23103141342114e91b8a6be23595217372',NULL,17,1,0,'23623479EF4C674660D4E6416343C404',1,0,10,0,48,8192,1.00,0,1,0,0,0),(333,'JW101545556621297-48404',10,'2018-12-23 17:17:09',NULL,NULL,33.00,42.00,0.00,0.00,0.00,1,2,0,'2018-12-23 17:17:01',NULL,'4200000219201812230597439800',0,83,1,0,'王江波',0,'wx23171702021310fb9cc550613542327549',NULL,39,1,0,'C2861C5C58BA9C7CAF4E8815EEB35B6F',1,9,10,0,48,8196,1.00,0,1,0,0,0),(334,'JW241545565819463-48407',24,'2018-12-23 19:50:25',NULL,NULL,11.00,11.00,0.00,0.00,0.00,1,2,0,'2018-12-23 19:50:19',NULL,'4200000223201812239025297796',0,84,1,1,'stone',0,'wx2319502030846677ea21afea1571667506',NULL,0,0,0,NULL,0,0,0,0,48,0,1.00,0,0,0,0,0),(335,'JW141545565957046-48407',14,'2018-12-23 19:52:46',NULL,NULL,11.00,55.00,0.00,0.00,0.00,1,2,0,'2018-12-23 19:52:37',NULL,'4200000217201812234144968427',0,84,1,0,'胡林林',0,'wx23195237562902202de05a7f1127727891',NULL,0,0,0,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(336,'JW101545616562366-48407',10,'2018-12-24 09:56:10',NULL,NULL,25.00,25.00,0.00,0.00,0.00,1,2,0,'2018-12-24 09:56:02',NULL,'4200000227201812241884796953',0,0,0,0,'王江波',0,'wx240956031071263004637beb1878614991',NULL,0,0,0,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(337,'JW101545750552676-48407',10,'2018-12-25 23:09:19',NULL,NULL,25.00,25.00,0.00,0.00,0.00,1,2,0,'2018-12-25 23:09:13',NULL,'4200000221201812252250156033',0,0,0,0,'王江波',0,'wx25230913375120c056e9e8921477010280',NULL,0,0,0,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(338,'JW101545783344935-48407',10,'2018-12-26 08:15:52',NULL,NULL,25.00,25.00,0.00,0.00,0.00,3,2,0,'2018-12-26 08:15:45',NULL,'4200000213201812260139716605',1,0,0,0,'王江波',0,'wx260815456498850013776d323457148952',NULL,0,0,0,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(339,'JW101545872929735-48407',10,'2018-12-27 09:08:58',NULL,'2018-12-28 11:07:11',25.00,25.00,0.00,0.00,0.00,3,2,0,'2018-12-27 09:08:50',NULL,'4200000212201812278810759803',1,0,0,0,'王江波',0,'wx27090850561396909939cd453281239021',NULL,0,0,0,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(340,'JW101545910428077-48407',10,'2018-12-27 19:33:55',NULL,NULL,22.50,25.00,0.00,0.00,0.00,1,2,0,'2018-12-27 19:33:48',NULL,'4200000225201812274467495458',0,66,2,0,'王江波',0,'wx27193348816259e2c4d349180613074451',NULL,0,0,0,NULL,0,0,10,0,48,1024,0.90,0,0,0,0,0),(341,'JW131545919364043-48407',13,'2018-12-27 22:02:59',NULL,NULL,22.50,25.00,0.00,0.00,0.00,1,2,0,'2018-12-27 22:02:44',NULL,'4200000232201812275201746757',0,66,2,0,'会敏',0,'wx2722024506541504b61863030047325123',NULL,0,0,0,NULL,0,0,10,0,48,1024,0.90,0,0,0,0,0),(342,'JW101545966525760-48407',10,'2018-12-28 11:08:52',NULL,NULL,25.00,25.00,0.00,0.00,0.00,1,2,0,'2018-12-28 11:08:46',NULL,'4200000227201812286158509131',0,0,0,0,'王江波',0,'wx28110846460041e30a11a4a01128462580',NULL,0,0,0,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(343,'JW101545998139008-48407',10,'2018-12-28 19:55:47',NULL,NULL,24.00,25.00,0.00,0.00,0.00,1,2,0,'2018-12-28 19:55:39',NULL,'4200000221201812289532880104',0,85,2,0,'王江波',0,'wx28195539693100de0cf75ba82340031678',NULL,0,0,0,NULL,0,0,10,0,48,1024,0.96,0,0,0,0,0),(344,'JW631545999438620-48407',63,'2018-12-28 20:17:25',NULL,NULL,24.00,25.00,0.00,0.00,0.00,1,2,0,'2018-12-28 20:17:19',NULL,'4200000229201812287705309143',0,85,2,0,'老魏特产',0,'wx2820171928310522e4f0830b4138179868',NULL,0,0,0,NULL,0,0,10,0,48,1024,0.96,0,0,0,0,0),(345,'JW101546042218687-48407',10,'2018-12-29 08:10:26',NULL,NULL,25.00,25.00,0.00,0.00,0.00,1,2,0,'2018-12-29 08:10:19',NULL,'4200000225201812297476124640',0,0,0,0,'王江波',0,'wx2908101949507427a8663c050564773312',NULL,0,0,0,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(346,'JW221546050801079-48407',22,'2018-12-29 10:33:29',NULL,NULL,24.00,25.00,0.00,0.00,0.00,1,2,0,'2018-12-29 10:33:21',NULL,'4200000232201812296222063668',0,85,2,0,'碗豆',0,'wx291033216143080f197e21521218955477',NULL,0,0,0,NULL,0,0,10,0,48,1024,0.96,0,0,0,0,0),(347,'JW101546056245586-48407',10,'2018-12-29 12:10:45',NULL,NULL,25.00,25.00,0.00,0.00,0.00,1,2,0,'2018-12-29 12:04:06',NULL,'4200000209201812295540743574',0,0,0,0,'王江波',0,'wx29120848448172189554f74e3108797975',NULL,0,0,0,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(348,'JW101546060536849-48407',10,'2018-12-29 13:15:43',NULL,NULL,11.00,11.00,0.00,0.00,0.00,4,2,0,'2018-12-29 13:15:37',NULL,'4200000219201812293397555747',0,86,1,1,'王江波',0,'wx29131537589446adfa2357074101741155',NULL,0,1,0,'4B59086463A4016B75C95FBD1B7BFB14',0,0,10,0,48,1,1.00,0,0,1,0,0),(349,'JW401546091516674-48404',40,'2018-12-29 21:52:02',NULL,NULL,33.00,42.00,9.00,0.00,0.00,1,2,0,'2018-12-29 21:51:57',NULL,'4200000222201812292649415079',0,0,0,0,'高华',0,'wx292151574076983be82bae9c1734014095',NULL,0,0,0,NULL,0,0,40,0,48,0,1.00,0,0,0,0,0),(350,'JW631546150836840-48404',63,'2018-12-30 14:21:08',NULL,NULL,33.00,42.00,9.00,0.00,0.00,1,2,0,'2018-12-30 14:20:37',NULL,'4200000220201812306933107748',0,0,0,0,'老魏特产',0,'wx301420374931334e33ab725f0421976855',NULL,10,1,0,'AC00D06ADEF3E3BBB5ABB7163BD9312A',1,9,10,0,48,0,1.00,0,0,0,0,0),(351,'JW631546152071343-48404',63,'2018-12-30 14:41:18',NULL,NULL,33.00,42.00,0.00,0.00,0.00,1,2,0,'2018-12-30 14:41:11',NULL,'4200000227201812300633252911',0,0,0,0,'老魏特产',0,'wx30144112047604b8eb8e535a3191641857',NULL,10,1,0,'690A05C8C2DCDD58D2C9FCBAF59AAF30',1,9,10,0,48,8196,1.00,0,1,0,0,0),(352,'JW101546223865931-48407',10,'2018-12-31 10:37:52',NULL,NULL,25.00,25.00,0.00,0.00,0.00,1,2,0,'2018-12-31 10:37:46',NULL,'4200000222201812315190875464',0,0,0,0,'王江波',0,'wx31103746581747cec5007c644114918515',NULL,63,1,0,'B21FE8BB7CC85A1ADDEA1DB574433DAB',1,0,10,0,48,8192,1.00,0,1,0,0,0),(353,'JW101546223980980-48407',10,'2018-12-31 10:39:48',NULL,NULL,25.00,25.00,0.00,0.00,0.00,1,2,0,'2018-12-31 10:39:41',NULL,'4200000209201812319676204374',0,0,0,0,'王江波',0,'wx31103942131911d1c3e7cc9a1544042947',NULL,0,0,0,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(354,'JW631546267886307-48407',63,'2018-12-31 22:51:33',NULL,'2018-12-31 22:54:37',25.00,25.00,0.00,0.00,0.00,3,2,0,'2018-12-31 22:51:26',NULL,'4200000218201812318149987051',1,0,0,0,'老魏特产',0,'wx312251271404739462cf18d31603901207',NULL,0,0,0,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(355,'JW631546307775099-48407',63,'2019-01-01 09:56:22',NULL,NULL,25.00,50.00,0.00,0.00,0.00,1,2,0,'2019-01-01 09:56:15',NULL,'4200000236201901017719215430',0,0,0,0,'老魏特产',0,'wx010956157979755281c3c95d1034709369',NULL,10,1,0,'805EAFF4DEF62121283F65876705A65B',1,0,10,0,48,0,1.00,0,0,0,0,0),(356,'JW101546313491798-48407',10,'2019-01-01 11:31:39',NULL,NULL,25.00,25.00,0.00,0.00,0.00,1,2,0,'2019-01-01 11:31:32',NULL,'4200000216201901017236524551',0,0,0,0,'王江波',0,'wx011131325670962738651ac22860849062',NULL,0,0,0,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(357,'JW221546314410065-48407',22,'2019-01-01 11:47:00',NULL,NULL,11.00,11.00,0.00,0.00,0.00,4,2,0,'2019-01-01 11:46:50',NULL,'4200000214201901019990637973',0,87,1,1,'碗豆',0,'wx0111465140894813148308e92031546961',NULL,0,0,0,NULL,0,0,0,0,48,1,1.00,0,0,1,0,0),(358,'JW101546389875090-48407',10,'2019-01-02 08:44:43',NULL,NULL,25.00,25.00,0.00,0.00,0.00,1,2,0,'2019-01-02 08:44:35',NULL,'4200000219201901027191777989',0,0,0,0,'王江波',0,'wx020844358761958132f49fed2423405621',NULL,0,0,0,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(359,'JW101546433952067-48408',10,'2019-01-02 21:03:34',NULL,NULL,75.00,75.00,0.00,0.00,0.00,1,2,0,'2019-01-02 20:59:12',NULL,'4200000238201901024707828867',0,88,1,1,'王江波',0,'wx0221032774978065722c64113351676680',NULL,0,0,0,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(360,'JW101546484132054-48408',10,'2019-01-03 10:55:39',NULL,NULL,78.00,78.00,0.00,0.00,0.00,1,2,0,'2019-01-03 10:55:32',NULL,'4200000214201901038649247289',0,0,0,0,'王江波',0,'wx031055327389623667aa31b13069052563',NULL,40,1,0,'9393E55CA97ADB49560169C54233BBF6',1,0,10,0,48,8192,1.00,0,1,0,0,0),(361,'JW631546484287446-48408',63,'2019-01-03 10:58:15',NULL,NULL,75.00,75.00,0.00,0.00,0.00,1,2,0,'2019-01-03 10:58:07',NULL,'4200000212201901034762764414',0,88,1,0,'老魏特产',0,'wx03105808100307e50142743b2154231705',NULL,0,0,0,NULL,0,0,0,0,48,0,1.00,0,0,0,0,0),(362,'JW401546486274506-48407',40,'2019-01-03 11:31:42',NULL,NULL,25.00,25.00,0.00,0.00,0.00,4,2,0,'2019-01-03 11:31:15',NULL,'4200000229201901037839792656',0,0,0,0,'高华',0,'wx031131347158203fe6b7a4a70053281690',NULL,0,0,0,NULL,0,0,40,0,48,256,1.00,0,0,4,0,0),(363,'JW101546562019502-48408',10,'2019-01-04 08:33:46',NULL,NULL,78.00,78.00,0.00,0.00,0.00,1,2,0,'2019-01-04 08:33:40',NULL,'4200000232201901049567090363',0,0,0,0,'王江波',0,'wx0408334026992704fae6cc560820218911',NULL,0,0,0,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(364,'JW101546650411838-48408',10,'2019-01-05 09:06:59',NULL,NULL,78.00,78.00,0.00,0.00,0.00,4,2,0,'2019-01-05 09:06:52',NULL,'4200000235201901056592040088',0,0,0,0,'王江波',0,'wx05090652605742ac6836b87d3891785704',NULL,0,1,0,'FBD86C34C18D17603832A045B33AA7AB',2,0,10,0,48,64,1.00,0,0,2,0,0),(365,'JW101546703781798-48408',10,'2019-01-05 23:56:28',NULL,NULL,78.00,78.00,0.00,0.00,0.00,1,2,0,'2019-01-05 23:56:22',NULL,'4200000220201901051941751021',0,0,0,0,'王江波',0,'wx05235622466968c8fa0feb203749945722',NULL,0,0,0,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(366,'JW101546736041333-53407',10,'2019-01-06 08:54:08',NULL,NULL,108.00,108.00,0.00,0.00,0.00,1,2,0,'2019-01-06 08:54:01',NULL,'4200000234201901064272771703',0,0,0,0,'王江波',0,'wx06085402027032c2b6f82f3d2187584798',NULL,0,0,0,NULL,0,0,10,0,53,0,1.00,0,0,0,0,0),(367,'JW101546781574720-48408',10,'2019-01-06 21:33:02',NULL,'2019-01-06 22:04:04',78.00,78.00,0.00,0.00,0.00,3,2,0,'2019-01-06 21:32:55',NULL,'4200000233201901064925705021',1,0,0,0,'王江波',0,'wx06213255543559395e20ef511316549646',NULL,0,0,0,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(368,'JW101546819693766-53407',10,'2019-01-07 08:08:20',NULL,NULL,108.00,108.00,0.00,0.00,0.00,1,2,0,'2019-01-07 08:08:14',NULL,'4200000224201901078938626057',0,0,0,0,'王江波',0,'wx07080814460215be024a89902908086621',NULL,0,0,0,NULL,0,0,10,0,53,0,1.00,0,0,0,0,0),(370,'JW101546907722344-48408',10,'2019-01-08 08:35:29',NULL,NULL,78.00,78.00,0.00,0.00,0.00,1,2,0,'2019-01-08 08:35:22',NULL,'4200000225201901086648869405',0,0,0,0,'王江波',0,'wx08083523088475f156c32ae40743024075',NULL,0,0,0,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(371,'JW101546916145717-48408',10,'2019-01-08 10:57:28',NULL,NULL,78.00,78.00,0.00,0.00,0.00,1,2,0,'2019-01-08 10:55:46',NULL,'4200000231201901084392043356',0,0,0,0,'王江波',0,'wx081055485894055ee60f196f4271001321',NULL,0,0,0,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(373,'JW101546931185354-48404',10,'2019-01-08 15:10:07',NULL,NULL,32.00,27.00,-5.00,0.00,0.00,1,2,0,'2019-01-08 15:06:25',NULL,'4200000229201901085179128201',0,0,0,0,'王江波',0,'wx081507011838790e9ceb9acd4233932442',NULL,0,0,1,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(374,'JW101546951905413-48404',10,'2019-01-08 20:51:52',NULL,NULL,32.00,27.00,-5.00,0.00,0.00,3,2,0,'2019-01-08 20:51:45',NULL,'4200000230201901087002707262',1,0,0,0,'王江波',0,'wx0820514626237114886ddd471869616744',NULL,0,0,1,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(376,'JW101546999547730-48404',10,'2019-01-09 10:05:54',NULL,NULL,32.00,32.00,0.00,0.00,0.00,1,2,0,'2019-01-09 10:05:48',NULL,'4200000231201901097423573923',0,0,0,0,'王江波',0,'wx09100548401868f6b5fc54b43803797531',NULL,0,0,0,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(378,'JW101547004521198-48404',10,'2019-01-09 11:29:02',NULL,NULL,32.00,27.00,-5.00,0.00,0.00,3,2,0,'2019-01-09 11:28:41',NULL,'4200000220201901095145595670',1,0,0,0,'王江波',0,'wx09112841723551bce0ef6ce83090592244',NULL,0,0,1,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(382,'JW101547010689904-48409',10,'2019-01-09 13:11:38',NULL,NULL,12.90,12.90,0.00,0.00,0.00,1,2,0,'2019-01-09 13:11:30',NULL,'4200000233201901097999467568',0,0,0,0,'王江波',0,'wx09131130568313d0481dabff2713731105',NULL,0,0,0,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(384,'JW101547023138489-48409',10,'2019-01-09 16:39:05',NULL,NULL,4.90,4.90,0.00,0.00,0.00,4,2,0,'2019-01-09 16:38:58',NULL,'4200000259201901097964308210',0,89,1,1,'王江波',0,'wx09163859295658ac1778d37d2208849232',NULL,0,1,0,'3C2971DC1ACD958BA777D00F4F084BAD',0,0,10,0,48,1,1.00,0,0,1,0,0),(387,'JW101547034823283-48409',10,'2019-01-09 19:53:50',NULL,NULL,5.90,8.90,0.00,0.00,0.00,1,2,0,'2019-01-09 19:53:43',NULL,'4200000265201901093740924116',0,0,0,0,'王江波',0,'wx09195343918869cd785206583245829220',NULL,13,1,0,'C59C833DD9C86999761E12D67CC2DA58',1,3,10,0,48,8196,1.00,0,1,0,0,0),(389,'JW101547041820435-48409',10,'2019-01-09 21:50:27',NULL,NULL,5.90,5.90,0.00,0.00,0.00,1,2,0,'2019-01-09 21:50:20',NULL,'4200000261201901093570050282',0,0,0,0,'王江波',0,'wx09215021100140f46155e98e3839650659',NULL,0,0,0,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(390,'JW101547092733001-48409',10,'2019-01-10 12:01:55',NULL,NULL,5.90,3.90,-2.00,0.00,0.00,3,2,0,'2019-01-10 11:58:53',NULL,'4200000261201901107445210170',1,0,0,0,'王江波',0,'wx1011585355217373f38189711312148008',NULL,0,0,1,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(391,'JW221547115466782-48408',22,'2019-01-10 18:17:55',NULL,NULL,75.00,75.00,0.00,0.00,0.00,4,2,0,'2019-01-10 18:17:47',NULL,'4200000280201901106848427680',0,91,1,1,'碗豆',0,'wx10181747433610e58e70af3a3595383887',NULL,0,0,0,NULL,0,0,22,0,48,2,1.00,0,0,1,0,0),(395,'JW631547117391853-48409',63,'2019-01-10 18:51:53',NULL,NULL,4.51,4.90,0.00,0.00,0.00,1,2,0,'2019-01-10 18:49:52',NULL,'4200000281201901100892607055',0,90,2,0,'老魏特产',0,'wx1018514330343602b6f5bf470241783886',NULL,0,0,0,NULL,0,0,0,0,48,1024,0.92,0,0,0,0,0),(396,'JW401547119399189-48409',40,'2019-01-10 19:23:25',NULL,NULL,5.90,8.90,3.00,0.00,0.00,1,2,0,'2019-01-10 19:23:19',NULL,'4200000272201901102837772208',0,0,0,0,'高华',0,'wx10192319883924b74a5f450c2689296402',NULL,0,0,0,NULL,0,0,40,0,48,0,1.00,0,0,0,0,0),(397,'JW101547134738357-48409',10,'2019-01-10 23:39:06',NULL,NULL,5.90,5.90,0.00,0.00,0.00,1,2,0,'2019-01-10 23:38:58',NULL,'4200000269201901109372798427',0,0,0,0,'王江波',0,'wx1023385901266094912febd72573912563',NULL,0,0,0,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(398,'JW101547163727945-48409',10,'2019-01-11 07:42:14',NULL,NULL,5.90,5.90,0.00,0.00,0.00,1,2,0,'2019-01-11 07:42:08',NULL,'4200000272201901117252837888',0,0,0,0,'王江波',0,'wx110742086165052dc4f9ded33206972145',NULL,0,0,0,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(399,'JW131547182790978-48409',13,'2019-01-11 13:00:05',NULL,NULL,4.51,4.90,0.00,0.00,0.00,1,2,0,'2019-01-11 12:59:51',NULL,'4200000282201901118173518659',0,90,2,0,'会敏',0,'wx11125951706860839a1ecd203313668848',NULL,0,0,0,NULL,0,0,10,0,48,1024,0.92,0,0,0,0,0),(401,'JW101547195907876-48409',10,'2019-01-11 16:38:52',NULL,NULL,4.51,2.90,-2.00,0.00,0.00,3,2,0,'2019-01-11 16:38:28',NULL,'4200000285201901112629688819',1,90,2,0,'王江波',0,'wx111638284463669c646fb96d3690379527',NULL,0,0,1,NULL,0,0,10,0,48,1024,0.92,0,0,0,0,0),(402,'JW631547196088752-48409',63,'2019-01-11 16:41:35',NULL,NULL,4.90,2.90,-2.00,0.00,0.00,3,2,0,'2019-01-11 16:41:29',NULL,'4200000262201901119921917993',1,92,1,1,'老魏特产',0,'wx11164129460318e4f531a2db1544685930',NULL,0,0,1,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(403,'JW101547196813950-48409',10,'2019-01-11 16:53:40',NULL,NULL,4.90,7.90,0.00,0.00,0.00,4,2,0,'2019-01-11 16:53:34',NULL,'4200000267201901115639584992',0,92,1,0,'王江波',0,'wx1116533464134074756135521126967131',NULL,0,1,0,'C3C2D6A0F37A59E808A8BEDCD3B1ABAD',2,3,10,0,48,64,1.00,0,0,2,0,0),(404,'JW101547211487157-48409',10,'2019-01-11 20:58:43',NULL,NULL,4.90,4.90,0.00,0.00,0.00,4,2,0,'2019-01-11 20:58:07',NULL,'4200000279201901117875377716',0,93,1,1,'王江波',0,'wx11205807734823f8dac408ae4218136361',NULL,0,0,0,NULL,0,0,10,0,48,1,1.00,0,0,1,0,0),(405,'JW101547260943554-48409',10,'2019-01-12 10:42:30',NULL,'2019-01-12 10:42:47',5.90,3.90,-2.00,0.00,0.00,3,2,0,'2019-01-12 10:42:24',NULL,'4200000274201901120748684804',1,0,0,0,'王江波',0,'wx12104224272149e668e060194054173882',NULL,0,0,1,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(406,'JW101547283389821-48409',10,'2019-01-12 16:56:36',NULL,NULL,5.90,5.90,0.00,0.00,0.00,1,2,0,'2019-01-12 16:56:30',NULL,'4200000279201901128570897038',0,0,0,0,'王江波',0,'wx121656304768525a4b01cf983163422924',NULL,0,0,0,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(407,'JW101547342714012-48409',10,'2019-01-13 09:25:21',NULL,NULL,5.90,5.90,0.00,0.00,0.00,1,2,0,'2019-01-13 09:25:14',NULL,'4200000280201901132885895845',0,0,0,0,'王江波',0,'wx13092514736967071059d7923592181380',NULL,0,0,0,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(408,'JW101547368398027-48409',10,'2019-01-13 16:33:25',NULL,'2019-01-13 16:33:36',5.90,3.90,-2.00,0.00,0.00,3,2,0,'2019-01-13 16:33:18',NULL,'4200000260201901139646292620',1,0,0,0,'王江波',0,'wx13163318927540d266e774103820381555',NULL,0,0,1,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(410,'JW101547385941486-48409',10,'2019-01-13 21:25:57',NULL,'2019-01-13 21:33:45',5.90,9.80,-2.00,0.00,0.00,6,2,0,'2019-01-13 21:25:41',NULL,'4200000259201901135076980891',1,0,0,0,'王江波',7,'wx13212541977632515421822a3125747108',NULL,0,0,1,NULL,0,0,10,0,48,16,1.00,0,0,0,0,0),(411,'JW101547387356530-48409',10,'2019-01-13 21:49:23',NULL,NULL,5.90,8.90,0.00,0.00,0.00,1,2,0,'2019-01-13 21:49:17',NULL,'4200000267201901137981879621',0,0,0,0,'王江波',0,'wx13214917363297e592e9ceea2420024953',NULL,63,1,0,'291A15BEB29D302E76668164CDF1A7AE',1,3,10,0,48,8196,1.00,0,1,0,0,0),(412,'JW101547387598642-48409',10,'2019-01-13 21:53:25',NULL,NULL,5.90,8.90,0.00,0.00,0.00,1,2,0,'2019-01-13 21:53:19',NULL,'4200000287201901136248052396',0,0,0,0,'王江波',0,'wx132153193479110f1ed68e1e3919751345',NULL,63,1,0,'66944E395E8BD3CF309DB54B7226391A',1,3,10,0,48,8196,1.00,0,1,0,0,0),(413,'JW101547387730405-48409',10,'2019-01-13 21:55:36',NULL,NULL,5.90,3.90,-2.00,0.00,0.00,3,2,0,'2019-01-13 21:55:30',NULL,'4200000263201901136588457467',1,0,0,0,'王江波',0,'wx13215531111569a798931bb20873196632',NULL,0,0,1,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(414,'JW101547427234327-48409',10,'2019-01-14 08:54:01',NULL,NULL,5.90,3.90,-2.00,0.00,0.00,3,2,0,'2019-01-14 08:53:54',NULL,'4200000272201901149784092177',1,0,0,0,'王江波',0,'wx14085354952248c1681435e13560380018',NULL,0,0,1,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(415,'JW101547452241432-48409',10,'2019-01-14 15:50:48',NULL,NULL,4.90,2.90,-2.00,0.00,0.00,4,2,0,'2019-01-14 15:50:41',NULL,'4200000268201901148614716238',0,94,1,1,'王江波',0,'wx141550422130652330033de02558895389',NULL,0,0,1,NULL,0,0,10,0,48,1,1.00,0,0,1,0,0),(416,'JW101547470722216-48409',10,'2019-01-14 20:58:49',NULL,NULL,5.90,8.90,0.00,0.00,0.00,4,2,0,'2019-01-14 20:58:42',NULL,'4200000267201901148402783907',0,0,0,0,'王江波',0,'wx14205842919600dc61bc6be61091967025',NULL,0,1,0,'91836D1D20E128748DB333D3B95F375E',2,3,10,0,48,64,1.00,0,0,2,0,0),(417,'JW101547478024237-48409',10,'2019-01-14 23:00:32',NULL,NULL,5.90,3.90,-2.00,0.00,0.00,3,2,0,'2019-01-14 23:00:24',NULL,'4200000272201901141763618442',1,0,0,0,'王江波',0,'wx142300257873452ceeddc2da0757008240',NULL,0,0,1,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(418,'JW101547516943268-48409',10,'2019-01-15 09:49:12',NULL,NULL,5.90,3.90,-2.00,0.00,0.00,3,2,0,'2019-01-15 09:49:03',NULL,'4200000273201901151967148476',1,0,0,0,'王江波',0,'wx15094903922250ce8c042b172569157788',NULL,0,0,1,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(419,'JW101547560428732-48409',10,'2019-01-15 21:53:57',NULL,NULL,5.90,5.90,0.00,0.00,0.00,1,2,0,'2019-01-15 21:53:49',NULL,'4200000284201901150816968589',0,0,0,0,'王江波',0,'wx15215349376713fe0fae5d4e2321399145',NULL,0,0,0,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(420,'JW101547606320105-48409',10,'2019-01-16 10:38:48',NULL,NULL,5.90,8.90,3.00,0.00,0.00,1,2,0,'2019-01-16 10:38:40',NULL,'4200000285201901166761028486',0,0,0,0,'王江波',0,'wx16103840775553bfeaee55a01377563222',NULL,0,0,0,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(421,'JW101547644897984-48409',10,'2019-01-16 21:21:44',NULL,NULL,5.90,17.80,0.00,0.00,0.00,1,2,0,'2019-01-16 21:21:38',NULL,'4200000272201901167169464832',0,0,0,0,'王江波',0,'wx16212138623826a9812531080691695872',NULL,13,1,0,'9619A8A1BB69C9E8B5F94816D1E9F6A9',1,6,10,0,48,8196,1.00,0,1,0,0,0),(422,'JW101547645037398-48409',10,'2019-01-16 21:24:04',NULL,'2019-01-16 21:24:15',5.90,3.90,-2.00,0.00,0.00,3,2,0,'2019-01-16 21:23:57',NULL,'4200000283201901161401215724',1,0,0,0,'王江波',0,'wx16212358009126226fb4eea92747235226',NULL,0,0,1,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(423,'JW101547693262599-48409',10,'2019-01-17 10:47:52',NULL,NULL,5.90,3.90,-2.00,0.00,0.00,3,2,0,'2019-01-17 10:47:43',NULL,'4200000270201901170971319270',1,0,0,0,'王江波',0,'wx17104743297785e71fbb0a9d1598825314',NULL,0,0,1,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(424,'JW101547693328062-48409',10,'2019-01-17 10:48:55',NULL,NULL,4.90,2.90,-2.00,0.00,0.00,4,2,0,'2019-01-17 10:48:48',NULL,'4200000279201901174828521311',0,95,1,1,'王江波',0,'wx17104848697834e022eb705c1457666784',NULL,0,0,1,NULL,0,0,10,0,48,1,1.00,0,0,1,0,0),(425,'JW101547709541351-48409',10,'2019-01-17 15:19:08',NULL,NULL,5.90,5.90,0.00,0.00,0.00,1,2,0,'2019-01-17 15:19:01',NULL,'4200000261201901178613475489',0,0,0,0,'王江波',0,'wx17151902242783ce9bcc58b01742589503',NULL,0,0,0,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(426,'JW101547714603896-48409',10,'2019-01-17 16:43:32',NULL,NULL,5.90,5.90,0.00,0.00,0.00,1,2,0,'2019-01-17 16:43:24',NULL,'4200000269201901173551003085',0,0,0,0,'王江波',0,'wx17164325219833981f6da39a1172139525',NULL,0,0,0,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(427,'JW101547773943564-48409',10,'2019-01-18 09:12:31',NULL,NULL,5.90,3.90,-2.00,0.00,0.00,3,2,0,'2019-01-18 09:12:24',NULL,'4200000263201901183485602077',1,0,0,0,'王江波',0,'wx18091224200129f0af1777af3456652077',NULL,0,0,1,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(428,'JW101547805107731-48409',10,'2019-01-18 17:51:54',NULL,NULL,5.90,5.90,0.00,0.00,0.00,1,2,0,'2019-01-18 17:51:48',NULL,'4200000266201901180210686289',0,0,0,0,'王江波',0,'wx18175148447310a1334be1a91771517859',NULL,0,0,0,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(429,'JW101547868545107-48409',10,'2019-01-19 11:29:13',NULL,NULL,5.90,5.90,0.00,0.00,0.00,1,2,0,'2019-01-19 11:29:05',NULL,'4200000281201901194495245565',0,0,0,0,'王江波',0,'wx19112905791494b24c90b63e3104369073',NULL,0,0,0,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(430,'JW101547893424230-48409',10,'2019-01-19 18:23:51',NULL,'2019-01-19 18:24:44',5.90,3.90,-2.00,0.00,0.00,3,2,0,'2019-01-19 18:23:44',NULL,'4200000282201901199518738627',1,0,0,0,'王江波',0,'wx1918234504835707207763381223781130',NULL,0,0,1,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(432,'JW101547947333348-48409',10,'2019-01-20 09:22:20',NULL,NULL,5.90,3.90,-2.00,0.00,0.00,3,2,0,'2019-01-20 09:22:13',NULL,'4200000262201901201624704311',1,0,0,0,'王江波',0,'wx200922140344224fb6b8c4a83759799268',NULL,0,0,1,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(433,'JW131547947853166-48409',13,'2019-01-20 09:31:01',NULL,NULL,5.90,8.90,3.00,0.00,0.00,1,2,0,'2019-01-20 09:30:53',NULL,'4200000270201901203577488604',0,0,0,0,'会敏',0,'wx20093053824131aabf17f8ae3813496399',NULL,10,1,0,'9EA94B93927AB08A23318DB6BE9E1775',1,3,0,0,48,0,1.00,0,0,0,0,0),(434,'JW131547954193180-48409',13,'2019-01-20 11:16:46',NULL,NULL,5.90,8.90,0.00,0.00,0.00,1,2,0,'2019-01-20 11:16:33',NULL,'4200000266201901208344013095',0,0,0,0,'会敏',0,'wx20111633877097223bfab14a1322767957',NULL,10,1,0,'A4C72FC05A39E5509A7F2E8A4A7B39FE',1,3,0,0,48,8196,1.00,0,1,0,0,0),(435,'JW131547954980244-48409',13,'2019-01-20 11:29:54',NULL,NULL,5.90,8.90,0.00,0.00,0.00,1,2,0,'2019-01-20 11:29:40',NULL,'4200000284201901206716944632',0,0,0,0,'会敏',0,'wx201129410392867a0d0dc6a50886853192',NULL,10,1,0,'C3DA1D8C71B604AE52C1F54CA7B00BCD',1,3,0,0,48,4,1.00,0,0,0,0,0),(442,'JW101547956349240-48409',10,'2019-01-20 11:52:57',NULL,NULL,5.90,8.90,0.00,0.00,0.00,1,2,0,'2019-01-20 11:52:29',NULL,'4200000285201901200820688277',0,0,0,0,'王江波',0,'wx2011525166974154913e33101505528035',NULL,13,1,0,'FC5393353EC709B0864B8FFE04E725AF',1,3,10,0,48,4,1.00,0,0,0,0,0),(443,'JW101547957077452-48409',10,'2019-01-20 12:05:03',NULL,NULL,5.90,8.90,0.00,0.00,0.00,1,2,0,'2019-01-20 12:04:37',NULL,'4200000284201901207114279865',0,0,0,0,'王江波',0,'wx20120438166356ff9f51649d3443235721',NULL,13,1,0,'5776989A4DFBC3B17010AD0320366B77',1,3,10,0,48,8196,1.00,0,1,0,0,0),(444,'JW101548049350697-48409',10,'2019-01-21 13:42:37',NULL,'2019-01-22 20:24:18',5.90,3.90,-2.00,0.00,0.00,3,2,0,'2019-01-21 13:42:31',NULL,'4200000262201901215404067702',1,0,0,0,'王江波',0,'wx21134231409098c165bb937a3370536260',NULL,0,0,1,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(446,'JW101548065864431-48409',10,'2019-01-21 18:17:54',NULL,'2019-01-21 18:26:49',5.90,8.90,0.00,0.00,0.00,3,2,0,'2019-01-21 18:17:44',NULL,'4200000266201901215198665070',1,0,0,0,'王江波',0,'wx21181745138490af32c0160a3429992236',NULL,63,1,0,'CFF4A7C47D6824E248D0E3D3610DE2C3',1,3,10,0,48,4,1.00,0,0,0,0,0),(447,'JW221548075773899-48409',22,'2019-01-21 21:03:02',NULL,NULL,4.90,4.90,0.00,0.00,0.00,1,2,0,'2019-01-21 21:02:54',NULL,'4200000277201901219381852453',0,96,1,1,'碗豆',0,'wx21210254455105528c57e7451090257683',NULL,0,0,0,NULL,0,0,22,0,48,0,1.00,0,0,0,0,0),(448,'JW101548124674365-48409',10,'2019-01-22 10:38:01',NULL,NULL,4.90,7.90,0.00,0.00,0.00,1,2,0,'2019-01-22 10:37:54',NULL,'4200000268201901228197437069',0,96,1,0,'王江波',0,'wx22103755035753f0493861933779649264',NULL,22,1,0,'B073DFA6E0B40A919EB22C11636AC10B',1,3,10,0,48,4,1.00,0,0,0,0,0),(450,'JW141548159261380-48409',14,'2019-01-22 20:14:27',NULL,'2019-01-22 20:15:09',5.90,3.90,-2.00,0.00,0.00,3,2,0,'2019-01-22 20:14:21',NULL,'4200000279201901229938619552',1,0,0,0,'胡林林',0,'wx22201421870128e2eb2fca423490947024',NULL,0,0,1,NULL,0,0,14,0,48,0,1.00,0,0,0,0,0),(451,'JW141548165684025-48409',14,'2019-01-22 22:03:15',NULL,NULL,4.90,4.90,0.00,0.00,0.00,7,2,0,'2019-01-22 22:01:24',NULL,'4200000288201901222291346606',0,90,2,0,'胡林林',0,'wx22220310249775136f5bd8c93700335634',NULL,0,0,0,NULL,0,0,14,0,48,0,1.00,0,0,0,0,0),(452,'JW101548237798050-48409',10,'2019-01-23 18:03:25',NULL,NULL,5.90,5.90,0.00,0.00,0.00,3,2,0,'2019-01-23 18:03:18',NULL,'4200000278201901235868272523',1,0,0,0,'王江波',0,'wx23180318873282d75f02b4810285988140',NULL,0,0,0,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(454,'JW101548386322231-48409',10,'2019-01-25 11:19:08',NULL,NULL,5.90,3.90,-2.00,0.00,0.00,3,2,0,'2019-01-25 11:18:42',NULL,'4200000272201901250488169290',1,0,0,0,'王江波',0,'wx25111842708795c06a84892c2753410911',NULL,0,0,1,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(456,'JW101548578392947-48411',10,'2019-01-27 16:40:01',NULL,NULL,65.00,72.00,0.00,0.00,0.00,3,2,0,'2019-01-27 16:39:53',NULL,'4200000274201901275401628058',1,0,0,0,'王江波',0,'wx27163953729347294ca0f9660456034838',NULL,71,1,0,'B19E08082F2F47AC376D57B691DAE443',1,7,10,0,48,4,1.00,0,0,0,0,0),(457,'JW101548644576783-48409',10,'2019-01-28 11:03:05',NULL,NULL,5.90,5.90,0.00,0.00,0.00,3,2,0,'2019-01-28 11:02:57',NULL,'4200000286201901285197396735',1,0,0,0,'王江波',0,'wx28110257495049e403751d2a1121381145',NULL,0,0,0,NULL,0,0,10,0,48,0,1.00,0,0,0,0,0),(458,'JW101548645491607-48409',10,'2019-01-28 11:18:20',NULL,NULL,5.90,5.90,0.00,0.00,0.00,3,2,0,'2019-01-28 11:18:12',NULL,'4200000269201901288425938794',1,0,0,0,'王江波',0,'wx2811181364333789b65ec94c1386607019',NULL,0,0,0,NULL,0,0,10,0,48,0,1.00,0,0,0,2,2),(459,'JW101549277187863-48411',10,'2019-02-04 18:46:35',NULL,NULL,65.00,72.00,0.00,0.00,0.00,1,2,0,'2019-02-04 18:46:28',NULL,'4200000263201902045845630720',0,0,0,0,'王江波',0,'wx04184628957486b43b0a615c1555528468',NULL,15,1,0,'123FBDBB58F344E708D5E38EEF365F41',1,7,10,0,48,4,1.00,0,0,0,0,0),(460,'JW141550501460095-0404',0,NULL,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0,0,0,'2019-02-18 22:51:00',NULL,NULL,0,0,0,0,'胡林林',0,NULL,NULL,0,2,0,'05E74315438AE44441E823C77345DE55',0,0,0,0,48,0,0.00,0,0,0,0,0),(461,'JW101550545020174-0411',0,NULL,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0,0,0,'2019-02-19 10:57:00',NULL,NULL,0,0,0,0,'王江波',0,NULL,NULL,0,2,0,'1A0ED8F1CB7CC60A25A83FFFF415828E',0,0,0,0,48,0,0.00,0,0,0,0,0),(475,'JW101550581248194-0411',0,NULL,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0,0,0,'2019-02-19 21:00:48',NULL,NULL,0,0,0,0,'王江波',0,NULL,NULL,0,2,0,'E55A71AE288D13C2DCF654A53235FBEF',0,0,0,0,48,0,0.00,0,0,0,0,0),(476,'JW101550581467516-0411',0,NULL,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0,0,0,'2019-02-19 21:04:28',NULL,NULL,0,0,0,0,'王江波',0,NULL,NULL,0,2,0,'F15C30B7FFC3DE9C4B05E62EA0F930C4',0,0,0,0,48,0,0.00,0,0,0,0,0),(477,'JW101550584299016-0411',0,NULL,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0,0,0,'2019-02-19 21:51:39',NULL,NULL,0,0,0,0,'王江波',0,NULL,NULL,0,2,0,'912016710C716DE295CDFA99C7CE3CF8',0,0,0,0,48,0,0.00,0,0,0,0,0);
/*!40000 ALTER TABLE `zytc_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_order_addr`
--

DROP TABLE IF EXISTS `zytc_order_addr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_order_addr` (
  `order_id` int(11) NOT NULL,
  `receiver_mobile` varchar(20) DEFAULT '',
  `receiver_province` int(11) DEFAULT NULL,
  `receiver_city` int(11) DEFAULT '0' COMMENT '收货人所在城市',
  `receiver_district` int(11) DEFAULT '0' COMMENT '收货人所在街道',
  `receiver_address` varchar(255) DEFAULT '' COMMENT '收货人详细地址',
  `receiver_zip` varchar(6) DEFAULT '' COMMENT '收货人邮编',
  `receiver_name` varchar(50) DEFAULT '' COMMENT '收货人姓名',
  `provincename` varchar(45) DEFAULT '',
  `cityname` varchar(45) DEFAULT '',
  `districtname` varchar(45) DEFAULT '',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_order_addr`
--

LOCK TABLES `zytc_order_addr` WRITE;
/*!40000 ALTER TABLE `zytc_order_addr` DISABLE KEYS */;
INSERT INTO `zytc_order_addr` VALUES (1,'18637468680',16,161,1453,'河南省许昌市魏都区龙湖西苑(塑料厂街南) 龙湖西苑',NULL,'王江波','河南省','许昌市','魏都区'),(2,'18637468680',16,161,1453,'河南省许昌市魏都区龙湖西苑(塑料厂街南) 龙湖西苑',NULL,'王江波','河南省','许昌市','魏都区'),(3,'18637471928',16,161,1453,'御萃花园',NULL,'胡林林','河南省','许昌市','魏都区'),(4,'18637468680',16,161,1453,'河南省许昌市魏都区龙湖西苑(塑料厂街南) 龙湖西苑',NULL,'王江波','河南省','许昌市','魏都区'),(5,'18637468680',16,161,1453,'河南省许昌市魏都区龙湖西苑(塑料厂街南) 龙湖西苑',NULL,'王江波','河南省','许昌市','魏都区'),(278,'18637468680',16,161,1453,'河南省许昌市魏都区龙湖西苑(塑料厂街南) 龙湖西苑',NULL,'王江波','河南省','许昌市','魏都区'),(279,'18637468680',16,161,1453,'河南省许昌市魏都区龙湖西苑(塑料厂街南) 龙湖西苑',NULL,'王江波','河南省','许昌市','魏都区'),(280,'18637468680',16,161,1453,'河南省许昌市魏都区龙湖西苑(塑料厂街南) 龙湖西苑','','王江波','河南省','许昌市','魏都区'),(286,'18637471928',16,161,1453,'御萃花园',NULL,'胡林林','河南省','许昌市','魏都区'),(287,'18637468680',16,161,1453,'河南省许昌市魏都区龙湖西苑(塑料厂街南) 龙湖西苑',NULL,'王江波','河南省','许昌市','魏都区'),(288,'18637471928',16,161,1453,'御萃花园',NULL,'胡林林','河南省','许昌市','魏都区'),(289,'18637471928',16,161,1453,'御萃花园',NULL,'胡林林','河南省','许昌市','魏都区'),(290,'15910394793',1,1,5,'三里屯西六街',NULL,'高华','北京市','北京市','朝阳区'),(291,'15910394793',1,1,8,'旗胜家园',NULL,'高华','北京市','北京市','海淀区'),(294,'15910394793',1,1,5,'三里屯西六街',NULL,'高华','北京市','北京市','朝阳区'),(295,'18637468680',16,161,1453,'河南省许昌市魏都区龙湖西苑(塑料厂街南) 龙湖西苑',NULL,'王江波','河南省','许昌市','魏都区'),(298,'15910394793',1,1,5,'三里屯西六街',NULL,'高华','北京市','北京市','朝阳区'),(299,'18637468680',16,161,1453,'龙湖西苑(魏都区龙湖西苑塑料厂街南)',NULL,'王波','河南省','许昌市','魏都区'),(300,'15910394793',1,1,1,'木木木',NULL,'高华','北京市','北京市','东城区'),(302,'15939938235',16,161,1453,'龙湖西苑(塑料厂街南) 龙湖西苑',NULL,'王会敏','河南省','许昌市','魏都区'),(303,'15910394793',1,1,8,'旗胜家园',NULL,'高华','北京市','北京市','海淀区'),(304,'15910394793',1,1,8,'旗胜家园',NULL,'高华','北京市','北京市','海淀区'),(305,'18637471928',16,161,1453,'御萃花园',NULL,'胡林林','河南省','许昌市','魏都区'),(306,'15910394793',1,1,8,'旗胜家园',NULL,'高华','北京市','北京市','海淀区'),(308,'18637471928',16,161,1453,'御萃花园',NULL,'胡林林','河南省','许昌市','魏都区'),(309,'15910394793',1,1,8,'旗胜家园',NULL,'高华','北京市','北京市','海淀区'),(310,'15910394793',1,1,8,'旗胜家园',NULL,'高华','北京市','北京市','海淀区'),(311,'15910394793',1,1,8,'旗胜家园',NULL,'高华','北京市','北京市','海淀区'),(312,'15910394793',1,1,8,'旗胜家园',NULL,'高华','北京市','北京市','海淀区'),(313,'15910394793',1,1,8,'旗胜家园',NULL,'高华','北京市','北京市','海淀区'),(314,'15910394793',1,1,8,'旗胜家园',NULL,'高华','北京市','北京市','海淀区'),(315,'15939938235',16,161,1453,'龙湖西苑(塑料厂街南) 龙湖西苑',NULL,'王会敏','河南省','许昌市','魏都区'),(316,'18637471928',16,161,1453,'御萃花园',NULL,'胡林林','河南省','许昌市','魏都区'),(317,'15310929786',22,234,2011,'双子座A(渝北区青枫北路10号3幢)',NULL,'hm','重庆市','重庆市','渝北区'),(318,'13716206495',27,296,2607,'长安镇枣园村2组',NULL,'王婉君','陕西省','安康市','平利县'),(319,'15910394793',1,1,8,'旗胜家园',NULL,'高华','北京市','北京市','海淀区'),(320,'15910394793',1,1,8,'旗胜家园',NULL,'高华','北京市','北京市','海淀区'),(321,'18637471928',16,161,1453,'御萃花园',NULL,'胡林林','河南省','许昌市','魏都区'),(322,'15939938235',16,161,1453,'龙湖西苑(塑料厂街南) 龙湖西苑',NULL,'王会敏','河南省','许昌市','魏都区'),(325,'13716206495',27,296,2607,'长安镇枣园村2组',NULL,'王婉君','陕西省','安康市','平利县'),(326,'13716206495',27,296,2607,'长安镇枣园村2组',NULL,'王婉君','陕西省','安康市','平利县'),(327,'15910394793',1,1,8,'旗胜家园',NULL,'高华','北京市','北京市','海淀区'),(328,'15936397266',16,161,1453,'工行小区',NULL,'押海龙','河南省','许昌市','魏都区'),(329,'15910394793',1,1,8,'旗胜家园',NULL,'高华','北京市','北京市','海淀区'),(330,'13716206495',27,296,2607,'长安镇枣园村2组',NULL,'王婉君','陕西省','安康市','平利县'),(331,'18637471928',16,161,1453,'御萃花园',NULL,'胡林林','河南省','许昌市','魏都区'),(332,'15936397266',16,161,1453,'工行小区',NULL,'押海龙','河南省','许昌市','魏都区'),(333,'15310929786',22,234,2011,'双子座A(渝北区青枫北路10号3幢)',NULL,'hm','重庆市','重庆市','渝北区'),(334,'18839932552',16,161,1453,'空港新城',NULL,'李红岩','河南省','许昌市','魏都区'),(335,'18637471928',16,161,1453,'御萃花园',NULL,'胡林林','河南省','许昌市','魏都区'),(336,'18637468680',16,161,1453,'河南省许昌市魏都区龙湖西苑(塑料厂街南) 龙湖西苑',NULL,'王江波','河南省','许昌市','魏都区'),(337,'18637468680',16,161,1453,'河南省许昌市魏都区龙湖西苑(塑料厂街南) 龙湖西苑',NULL,'王江波','河南省','许昌市','魏都区'),(338,'18637468680',16,161,1453,'河南省许昌市魏都区龙湖西苑(塑料厂街南) 龙湖西苑',NULL,'王江波','河南省','许昌市','魏都区'),(339,'18637468680',16,161,1453,'河南省许昌市魏都区龙湖西苑(塑料厂街南) 龙湖西苑',NULL,'王江波','河南省','许昌市','魏都区'),(340,'18637468680',16,161,1453,'河南省许昌市魏都区龙湖西苑(塑料厂街南) 龙湖西苑',NULL,'王江波','河南省','许昌市','魏都区'),(341,'15939938235',16,161,1453,'龙湖西苑(塑料厂街南) 龙湖西苑',NULL,'王会敏','河南省','许昌市','魏都区'),(342,'18637468680',16,161,1453,'河南省许昌市魏都区龙湖西苑(塑料厂街南) 龙湖西苑',NULL,'王江波','河南省','许昌市','魏都区'),(343,'18637468680',16,161,1453,'河南省许昌市魏都区龙湖西苑(塑料厂街南) 龙湖西苑',NULL,'王江波','河南省','许昌市','魏都区'),(344,'18637468680',16,161,1453,'龙湖西苑(魏都区龙湖西苑塑料厂街南)',NULL,'魏','河南省','许昌市','魏都区'),(345,'18637468680',16,161,1453,'河南省许昌市魏都区龙湖西苑(塑料厂街南) 龙湖西苑',NULL,'王江波','河南省','许昌市','魏都区'),(346,'13716206495',27,296,2607,'长安镇枣园村2组',NULL,'王婉君','陕西省','安康市','平利县'),(347,'18637468680',16,161,1453,'河南省许昌市魏都区龙湖西苑(塑料厂街南) 龙湖西苑',NULL,'王江波','河南省','许昌市','魏都区'),(349,'15910394793',1,1,8,'旗胜家园',NULL,'高华','北京市','北京市','海淀区'),(350,'18637468680',1,1,2,'北新华街29号 北京昌盛大厦',NULL,'王江波','北京市','北京市','西城区'),(351,'18637468680',16,161,1453,'河南省许昌市魏都区龙湖西苑(塑料厂街南) 龙湖西苑',NULL,'王江波','河南省','许昌市','魏都区'),(352,'18637468680',16,161,1453,'龙湖西苑(魏都区龙湖西苑塑料厂街南)',NULL,'魏','河南省','许昌市','魏都区'),(353,'18637468680',16,161,1453,'河南省许昌市魏都区龙湖西苑(塑料厂街南) 龙湖西苑',NULL,'王江波','河南省','许昌市','魏都区'),(354,'18637468680',16,161,1453,'龙湖西苑(魏都区龙湖西苑塑料厂街南)',NULL,'魏','河南省','许昌市','魏都区'),(355,'18637468680',16,161,1453,'河南省许昌市魏都区龙湖西苑(塑料厂街南) 龙湖西苑',NULL,'王江波','河南省','许昌市','魏都区'),(356,'18637468680',16,161,1453,'河南省许昌市魏都区龙湖西苑(塑料厂街南) 龙湖西苑',NULL,'王江波','河南省','许昌市','魏都区'),(357,'13716206495',27,296,2607,'长安镇枣园村2组',NULL,'王婉君','陕西省','安康市','平利县'),(358,'18637468680',16,161,1453,'河南省许昌市魏都区龙湖西苑(塑料厂街南) 龙湖西苑',NULL,'王江波','河南省','许昌市','魏都区'),(359,'18637468680',16,161,1453,'河南省许昌市魏都区龙湖西苑(塑料厂街南) 龙湖西苑',NULL,'王江波','河南省','许昌市','魏都区'),(360,'15910394793',1,1,8,'旗胜家园',NULL,'高华','北京市','北京市','海淀区'),(361,'18637468680',16,161,1453,'龙湖西苑(魏都区龙湖西苑塑料厂街南)',NULL,'魏','河南省','许昌市','魏都区'),(362,'15910394793',1,1,8,'旗胜家园',NULL,'高华','北京市','北京市','海淀区'),(363,'18637468680',16,161,1453,'河南省许昌市魏都区龙湖西苑(塑料厂街南) 龙湖西苑',NULL,'王江波','河南省','许昌市','魏都区'),(365,'18637468680',16,161,1453,'河南省许昌市魏都区龙湖西苑(塑料厂街南) 龙湖西苑',NULL,'王江波','河南省','许昌市','魏都区'),(366,'18637468680',16,161,1453,'河南省许昌市魏都区龙湖西苑(塑料厂街南) 龙湖西苑',NULL,'王江波','河南省','许昌市','魏都区'),(367,'18637468680',16,161,1453,'河南省许昌市魏都区龙湖西苑(塑料厂街南) 龙湖西苑',NULL,'王江波','河南省','许昌市','魏都区'),(368,'18637468680',16,161,1453,'河南省许昌市魏都区龙湖西苑(塑料厂街南) 龙湖西苑',NULL,'王江波','河南省','许昌市','魏都区'),(370,'18637468680',16,161,1453,'河南省许昌市魏都区龙湖西苑(塑料厂街南) 龙湖西苑',NULL,'王江波','河南省','许昌市','魏都区'),(371,'18637468680',16,161,1453,'龙湖西苑(魏都区龙湖西苑塑料厂街南)',NULL,'王波','河南省','许昌市','魏都区'),(376,'18637468680',16,161,1453,'龙湖西苑(魏都区龙湖西苑塑料厂街南)',NULL,'王波','河南省','许昌市','魏都区'),(382,'18637468680',16,161,1453,'龙湖西苑(魏都区龙湖西苑塑料厂街南)',NULL,'王波','河南省','许昌市','魏都区'),(387,'15939938235',16,161,1453,'龙湖西苑(塑料厂街南) 龙湖西苑',NULL,'王会敏','河南省','许昌市','魏都区'),(389,'18637468680',16,161,1453,'龙湖西苑(魏都区龙湖西苑塑料厂街南)',NULL,'王波','河南省','许昌市','魏都区'),(391,'13716206495',27,296,2607,'长安镇枣园村2组',NULL,'王婉君','陕西省','安康市','平利县'),(395,'18637468680',16,161,1453,'龙湖西苑(魏都区龙湖西苑塑料厂街南)',NULL,'魏','河南省','许昌市','魏都区'),(396,'15910394793',1,1,8,'旗胜家园',NULL,'高华','北京市','北京市','海淀区'),(397,'18637468680',16,161,1453,'龙湖西苑(魏都区龙湖西苑塑料厂街南)',NULL,'王波','河南省','许昌市','魏都区'),(398,'18637468680',16,161,1453,'龙湖西苑(魏都区龙湖西苑塑料厂街南)',NULL,'王波','河南省','许昌市','魏都区'),(399,'15939938235',16,161,1453,'龙湖西苑(塑料厂街南) 龙湖西苑',NULL,'王会敏','河南省','许昌市','魏都区'),(404,'18637468680',16,161,1453,'龙湖西苑(魏都区龙湖西苑塑料厂街南)',NULL,'王波','河南省','许昌市','魏都区'),(406,'18637468680',16,161,1453,'龙湖西苑(魏都区龙湖西苑塑料厂街南)',NULL,'王波','河南省','许昌市','魏都区'),(407,'18637468680',16,161,1453,'龙湖西苑(魏都区龙湖西苑塑料厂街南)',NULL,'王波','河南省','许昌市','魏都区'),(411,'18637468680',16,161,1453,'龙湖西苑(魏都区龙湖西苑塑料厂街南)',NULL,'魏','河南省','许昌市','魏都区'),(412,'18637468680',16,161,1453,'龙湖西苑(魏都区龙湖西苑塑料厂街南)',NULL,'魏','河南省','许昌市','魏都区'),(419,'18637468680',16,161,1453,'龙湖西苑(魏都区龙湖西苑塑料厂街南)',NULL,'王波','河南省','许昌市','魏都区'),(420,'18637468680',1,1,2,'北新华街29号 北京昌盛大厦',NULL,'王江波','北京市','北京市','西城区'),(421,'15939938235',16,161,1453,'龙湖西苑(塑料厂街南) 龙湖西苑',NULL,'王会敏','河南省','许昌市','魏都区'),(425,'18637468680',16,161,1453,'龙湖西苑(魏都区龙湖西苑塑料厂街南)',NULL,'王波','河南省','许昌市','魏都区'),(426,'18637468680',16,161,1453,'龙湖西苑(魏都区龙湖西苑塑料厂街南)',NULL,'王波','河南省','许昌市','魏都区'),(428,'18637468680',16,161,1453,'龙湖西苑(魏都区龙湖西苑塑料厂街南)',NULL,'王波','河南省','许昌市','魏都区'),(429,'18637468680',16,161,1453,'龙湖西苑(魏都区龙湖西苑塑料厂街南)',NULL,'王波','河南省','许昌市','魏都区'),(433,'18637468680',1,1,2,'北新华街29号 北京昌盛大厦',NULL,'王江波','北京市','北京市','西城区'),(434,'18637468680',16,161,1453,'龙湖西苑(魏都区龙湖西苑塑料厂街南)',NULL,'王波','河南省','许昌市','魏都区'),(435,'18637468680',16,161,1453,'龙湖西苑(魏都区龙湖西苑塑料厂街南)',NULL,'王波','河南省','许昌市','魏都区'),(442,'15939938235',16,161,1453,'龙湖西苑(塑料厂街南) 龙湖西苑',NULL,'王会敏','河南省','许昌市','魏都区'),(443,'15939938235',16,161,1453,'龙湖西苑(塑料厂街南) 龙湖西苑',NULL,'王会敏','河南省','许昌市','魏都区'),(446,'18637468680',16,161,1453,'龙湖西苑(魏都区龙湖西苑塑料厂街南)',NULL,'魏','河南省','许昌市','魏都区'),(447,'13716206495',27,296,2607,'长安镇枣园村2组',NULL,'王婉君','陕西省','安康市','平利县'),(448,'13716206495',27,296,2607,'长安镇枣园村2组',NULL,'王婉君','陕西省','安康市','平利县'),(451,'18637471928',16,161,1453,'御萃花园',NULL,'胡林林','河南省','许昌市','魏都区'),(452,'18637468680',16,161,1453,'龙湖西苑(魏都区龙湖西苑塑料厂街南)',NULL,'王波','河南省','许昌市','魏都区'),(456,'15527238320',17,169,1527,'中北路知音广场15楼天风天成资产管理有限公司',NULL,'余谦','湖北省','武汉市','武昌区'),(457,'18637468680',16,161,1453,'龙湖西苑(魏都区龙湖西苑塑料厂街南)',NULL,'王波','河南省','许昌市','魏都区'),(458,'18637468680',1,1,2,'北新华街29号 北京昌盛大厦',NULL,'王江波','北京市','北京市','西城区'),(459,'15669058183',11,87,846,'下沙幸福南路东海柠檬郡7栋2603',NULL,'杨哲','浙江省','杭州市','江干区'),(467,'18637468680',16,161,1453,'龙湖西苑(魏都区龙湖西苑塑料厂街南)',NULL,'王波','河南省','许昌市','魏都区');
/*!40000 ALTER TABLE `zytc_order_addr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_order_extra`
--

DROP TABLE IF EXISTS `zytc_order_extra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_order_extra` (
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `buyer_message` varchar(255) DEFAULT '' COMMENT '买家附言',
  `blessing_message` varchar(45) DEFAULT '',
  `articleid` int(11) DEFAULT '0',
  `fixaddr` int(11) DEFAULT '0',
  `tryrefund` int(11) DEFAULT '0',
  `sendnickname` varchar(45) DEFAULT NULL,
  `sendheadpic` varchar(256) DEFAULT NULL,
  `recievenickname` varchar(45) DEFAULT NULL,
  `recieveheadpic` varchar(256) DEFAULT NULL,
  `givertime` datetime DEFAULT CURRENT_TIMESTAMP,
  `formid` varchar(256) DEFAULT NULL,
  `refusemsg` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_order_extra`
--

LOCK TABLES `zytc_order_extra` WRITE;
/*!40000 ALTER TABLE `zytc_order_extra` DISABLE KEYS */;
INSERT INTO `zytc_order_extra` VALUES (1,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132','王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL),(2,'','',0,0,0,'胡林林','https://wx.qlogo.cn/mmopen/vi_32/ajNVdqHZLLBPWYY8zd1Mq59HA2xZu1M7WMELVl6yJFhq8pf5nBNyG2IJdkqobCMlpCibQgMictn8nCSo71HWRpMg/132','王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL),(3,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132','胡林林','https://wx.qlogo.cn/mmopen/vi_32/ajNVdqHZLLBPWYY8zd1Mq59HA2xZu1M7WMELVl6yJFhq8pf5nBNyG2IJdkqobCMlpCibQgMictn8nCSo71HWRpMg/132',NULL,NULL,NULL),(4,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(5,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132','王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132','2018-11-22 15:14:28',NULL,NULL),(6,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(278,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132','王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132','2018-11-22 16:06:27',NULL,NULL),(279,'','',0,0,2,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132','王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132','2018-11-22 16:34:50',NULL,NULL),(280,'','',0,1,2,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132','王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132','2018-11-22 16:57:16',NULL,NULL),(281,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(283,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(284,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(285,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(286,'','',0,0,0,'胡林林','https://wx.qlogo.cn/mmopen/vi_32/ajNVdqHZLLBPWYY8zd1Mq59HA2xZu1M7WMELVl6yJFhq8pf5nBNyG2IJdkqobCMlpCibQgMictn8nCSo71HWRpMg/132',NULL,NULL,NULL,NULL,NULL),(287,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(288,'','',0,0,0,'胡林林','https://wx.qlogo.cn/mmopen/vi_32/ajNVdqHZLLBPWYY8zd1Mq59HA2xZu1M7WMELVl6yJFhq8pf5nBNyG2IJdkqobCMlpCibQgMictn8nCSo71HWRpMg/132',NULL,NULL,NULL,NULL,NULL),(289,'','',0,0,0,'胡林林','https://wx.qlogo.cn/mmopen/vi_32/ajNVdqHZLLBPWYY8zd1Mq59HA2xZu1M7WMELVl6yJFhq8pf5nBNyG2IJdkqobCMlpCibQgMictn8nCSo71HWRpMg/132',NULL,NULL,NULL,NULL,NULL),(290,'','',0,0,0,'高华','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIX88FOcCENjuB272faID1GpFRE77nMXN6Pm43Z4IVnFXxc0sPiaXZtmxZQPmwvy8slaWZ57pNMLmQ/132',NULL,NULL,NULL,NULL,NULL),(291,'','',0,0,0,'高华','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIX88FOcCENjuB272faID1GpFRE77nMXN6Pm43Z4IVnFXxc0sPiaXZtmxZQPmwvy8slaWZ57pNMLmQ/132',NULL,NULL,NULL,NULL,NULL),(292,'','',0,0,0,'会敏','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJkribhRyDNNmIA9gibbXEus80nqGvexn9zKUtYos8OWY30AB8VgyU2MArZA7tHwpbPlUKkFGdkNqdw/132',NULL,NULL,NULL,NULL,NULL),(294,'','',0,0,0,'高华','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIX88FOcCENjuB272faID1GpFRE77nMXN6Pm43Z4IVnFXxc0sPiaXZtmxZQPmwvy8slaWZ57pNMLmQ/132',NULL,NULL,NULL,NULL,NULL),(295,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(298,'','',0,0,0,'高华','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIX88FOcCENjuB272faID1GpFRE77nMXN6Pm43Z4IVnFXxc0sPiaXZtmxZQPmwvy8slaWZ57pNMLmQ/132',NULL,NULL,NULL,NULL,NULL),(299,'','',0,0,0,'王 ','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132','王 ','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132','2018-12-14 12:22:12',NULL,NULL),(300,'','',0,0,0,'高华','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIX88FOcCENjuB272faID1GpFRE77nMXN6Pm43Z4IVnFXxc0sPiaXZtmxZQPmwvy8slaWZ57pNMLmQ/132',NULL,NULL,NULL,NULL,NULL),(301,'','',0,0,0,'高华','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIX88FOcCENjuB272faID1GpFRE77nMXN6Pm43Z4IVnFXxc0sPiaXZtmxZQPmwvy8slaWZ57pNMLmQ/132',NULL,NULL,NULL,NULL,NULL),(302,'','',0,0,0,'会敏','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJkribhRyDNNmIA9gibbXEus80nqGvexn9zKUtYos8OWY30AB8VgyU2MArZA7tHwpbPlUKkFGdkNqdw/132',NULL,NULL,NULL,NULL,NULL),(303,'','',0,0,0,'高华','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIX88FOcCENjuB272faID1GpFRE77nMXN6Pm43Z4IVnFXxc0sPiaXZtmxZQPmwvy8slaWZ57pNMLmQ/132',NULL,NULL,NULL,NULL,NULL),(304,'','',0,0,0,'高华','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIX88FOcCENjuB272faID1GpFRE77nMXN6Pm43Z4IVnFXxc0sPiaXZtmxZQPmwvy8slaWZ57pNMLmQ/132',NULL,NULL,NULL,NULL,NULL),(305,'','',0,0,0,'胡林林','https://wx.qlogo.cn/mmopen/vi_32/ajNVdqHZLLBPWYY8zd1Mq59HA2xZu1M7WMELVl6yJFhq8pf5nBNyG2IJdkqobCMlpCibQgMictn8nCSo71HWRpMg/132',NULL,NULL,NULL,NULL,NULL),(306,'','',0,0,0,'高华','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIX88FOcCENjuB272faID1GpFRE77nMXN6Pm43Z4IVnFXxc0sPiaXZtmxZQPmwvy8slaWZ57pNMLmQ/132',NULL,NULL,NULL,NULL,NULL),(307,'','',0,0,0,'王 ','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(308,'','',0,0,0,'胡林林','https://wx.qlogo.cn/mmopen/vi_32/ajNVdqHZLLBPWYY8zd1Mq59HA2xZu1M7WMELVl6yJFhq8pf5nBNyG2IJdkqobCMlpCibQgMictn8nCSo71HWRpMg/132',NULL,NULL,NULL,NULL,NULL),(309,'','',0,0,0,'高华','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIX88FOcCENjuB272faID1GpFRE77nMXN6Pm43Z4IVnFXxc0sPiaXZtmxZQPmwvy8slaWZ57pNMLmQ/132',NULL,NULL,NULL,NULL,NULL),(310,'','',0,0,0,'高华','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIX88FOcCENjuB272faID1GpFRE77nMXN6Pm43Z4IVnFXxc0sPiaXZtmxZQPmwvy8slaWZ57pNMLmQ/132',NULL,NULL,NULL,NULL,NULL),(311,'','',0,0,0,'高华','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIX88FOcCENjuB272faID1GpFRE77nMXN6Pm43Z4IVnFXxc0sPiaXZtmxZQPmwvy8slaWZ57pNMLmQ/132',NULL,NULL,NULL,NULL,NULL),(312,'','',0,0,0,'高华','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIX88FOcCENjuB272faID1GpFRE77nMXN6Pm43Z4IVnFXxc0sPiaXZtmxZQPmwvy8slaWZ57pNMLmQ/132',NULL,NULL,NULL,NULL,NULL),(313,'','',0,0,0,'高华','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIX88FOcCENjuB272faID1GpFRE77nMXN6Pm43Z4IVnFXxc0sPiaXZtmxZQPmwvy8slaWZ57pNMLmQ/132',NULL,NULL,NULL,NULL,NULL),(314,'','',0,0,0,'高华','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIX88FOcCENjuB272faID1GpFRE77nMXN6Pm43Z4IVnFXxc0sPiaXZtmxZQPmwvy8slaWZ57pNMLmQ/132',NULL,NULL,NULL,NULL,NULL),(315,'','大吉大利，恭喜发财',0,0,0,'许昌特产','http://www.imgtqbu.weiruikj.cn/Fs32xo_EjWT7D_a1Ry1gmDsQKx9v','会敏','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJkribhRyDNNmIA9gibbXEus80nqGvexn9zKUtYos8OWY30AB8VgyU2MArZA7tHwpbPlUKkFGdkNqdw/132','2018-12-17 12:20:26',NULL,NULL),(316,'','',0,0,0,'胡林林','https://wx.qlogo.cn/mmopen/vi_32/ajNVdqHZLLBPWYY8zd1Mq59HA2xZu1M7WMELVl6yJFhq8pf5nBNyG2IJdkqobCMlpCibQgMictn8nCSo71HWRpMg/132',NULL,NULL,NULL,NULL,NULL),(317,'','',0,0,0,'浅','https://wx.qlogo.cn/mmopen/vi_32/BeGIP6S39amwpsv3ibWK5DmHVpsiaaPjUpYRZenYEKuJFmClCNzNMEFwXzuVjeQrvjDJ3Vdia4paGcX9IvwXL9HOQ/132',NULL,NULL,NULL,NULL,NULL),(318,'','',0,0,0,'碗豆','https://wx.qlogo.cn/mmopen/vi_32/IDDicA7apW2Kic82l9RHzSxS1I5QHQ7d5L2qnROYsQQHCHvBYyP8tnOaXSVDUTyDIsUULYtUwhteTpAfnciaMvUNg/132',NULL,NULL,NULL,NULL,NULL),(319,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132','高华','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIX88FOcCENjuB272faID1GpFRE77nMXN6Pm43Z4IVnFXxc0sPiaXZtmxZQPmwvy8slaWZ57pNMLmQ/132','2018-12-18 23:28:17',NULL,NULL),(320,'','',0,0,0,'高华','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIX88FOcCENjuB272faID1GpFRE77nMXN6Pm43Z4IVnFXxc0sPiaXZtmxZQPmwvy8slaWZ57pNMLmQ/132',NULL,NULL,NULL,NULL,NULL),(321,'','',0,0,0,'胡林林','https://wx.qlogo.cn/mmopen/vi_32/ajNVdqHZLLBPWYY8zd1Mq59HA2xZu1M7WMELVl6yJFhq8pf5nBNyG2IJdkqobCMlpCibQgMictn8nCSo71HWRpMg/132',NULL,NULL,NULL,NULL,NULL),(322,'','',0,0,0,'会敏','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJkribhRyDNNmIA9gibbXEus80nqGvexn9zKUtYos8OWY30AB8VgyU2MArZA7tHwpbPlUKkFGdkNqdw/132',NULL,NULL,NULL,NULL,NULL),(323,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(324,'','',0,0,2,'会敏','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJkribhRyDNNmIA9gibbXEus80nqGvexn9zKUtYos8OWY30AB8VgyU2MArZA7tHwpbPlUKkFGdkNqdw/132',NULL,NULL,NULL,NULL,NULL),(325,'','',0,0,0,'会敏','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJkribhRyDNNmIA9gibbXEus80nqGvexn9zKUtYos8OWY30AB8VgyU2MArZA7tHwpbPlUKkFGdkNqdw/132','碗豆','https://wx.qlogo.cn/mmopen/vi_32/IDDicA7apW2Kic82l9RHzSxS1I5QHQ7d5L2qnROYsQQHCHvBYyP8tnOaXSVDUTyDIsUULYtUwhteTpAfnciaMvUNg/132','2018-12-22 16:55:20',NULL,NULL),(326,'','',0,0,0,'碗豆','https://wx.qlogo.cn/mmopen/vi_32/IDDicA7apW2Kic82l9RHzSxS1I5QHQ7d5L2qnROYsQQHCHvBYyP8tnOaXSVDUTyDIsUULYtUwhteTpAfnciaMvUNg/132',NULL,NULL,NULL,NULL,NULL),(327,'','',0,0,0,'高华','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIX88FOcCENjuB272faID1GpFRE77nMXN6Pm43Z4IVnFXxc0sPiaXZtmxZQPmwvy8slaWZ57pNMLmQ/132',NULL,NULL,NULL,NULL,NULL),(328,'','',0,0,0,'在路上（海龙）','https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEL1yOaichkJ9z54MXMjRcRwDSPZ2gia3ck4dvVRhvpemvX7esSSbwOtOrEgdMYicM4RXHwUMUINjWEOw/132',NULL,NULL,NULL,NULL,NULL),(329,'','',0,0,0,'高华','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIX88FOcCENjuB272faID1GpFRE77nMXN6Pm43Z4IVnFXxc0sPiaXZtmxZQPmwvy8slaWZ57pNMLmQ/132',NULL,NULL,NULL,NULL,NULL),(330,'','',0,0,0,'碗豆','https://wx.qlogo.cn/mmopen/vi_32/IDDicA7apW2Kic82l9RHzSxS1I5QHQ7d5L2qnROYsQQHCHvBYyP8tnOaXSVDUTyDIsUULYtUwhteTpAfnciaMvUNg/132',NULL,NULL,NULL,NULL,NULL),(331,'','',0,0,0,'胡林林','https://wx.qlogo.cn/mmopen/vi_32/ajNVdqHZLLBPWYY8zd1Mq59HA2xZu1M7WMELVl6yJFhq8pf5nBNyG2IJdkqobCMlpCibQgMictn8nCSo71HWRpMg/132',NULL,NULL,NULL,NULL,NULL),(332,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132','在路上（海龙）','https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEL1yOaichkJ9z54MXMjRcRwDSPZ2gia3ck4dvVRhvpemvX7esSSbwOtOrEgdMYicM4RXHwUMUINjWEOw/132','2018-12-23 12:32:33',NULL,NULL),(333,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132','浅','https://wx.qlogo.cn/mmopen/vi_32/BeGIP6S39amwpsv3ibWK5DmHVpsiaaPjUpYRZenYEKuJFmClCNzNMEFwXzuVjeQrvjDJ3Vdia4paGcX9IvwXL9HOQ/132','2018-12-23 17:17:59',NULL,NULL),(334,'','',0,0,0,'stone','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJGmJJSxWepjfldr56lk5a2vH8PmwPgemDnY8zOJLzkOZWzkkve6OD3na5p7oCaCkY7Us279LgYQQ/132',NULL,NULL,NULL,NULL,NULL),(335,'','',0,0,0,'胡林林','https://wx.qlogo.cn/mmopen/vi_32/ajNVdqHZLLBPWYY8zd1Mq59HA2xZu1M7WMELVl6yJFhq8pf5nBNyG2IJdkqobCMlpCibQgMictn8nCSo71HWRpMg/132',NULL,NULL,NULL,NULL,NULL),(336,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(337,'','',0,1,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(338,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(339,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(340,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(341,'','',0,0,0,'会敏','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJkribhRyDNNmIA9gibbXEus80nqGvexn9zKUtYos8OWY30AB8VgyU2MArZA7tHwpbPlUKkFGdkNqdw/132',NULL,NULL,NULL,NULL,NULL),(342,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(343,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(344,'','',0,0,0,'老魏特产','https://wx.qlogo.cn/mmopen/vi_32/ekFWm6NDQzRicibSFGfWMgHS2jaiaTTOdg1jBzJk7NR3VwT9cibqRia1FdHTt3fsTD0PWA9AyyzsibvwPs98RgNfyPOA/132',NULL,NULL,NULL,NULL,NULL),(345,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(346,'','',0,0,0,'碗豆','https://wx.qlogo.cn/mmopen/vi_32/IDDicA7apW2Kic82l9RHzSxS1I5QHQ7d5L2qnROYsQQHCHvBYyP8tnOaXSVDUTyDIsUULYtUwhteTpAfnciaMvUNg/132',NULL,NULL,NULL,NULL,NULL),(347,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(348,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(349,'','',0,0,0,'高华','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIX88FOcCENjuB272faID1GpFRE77nMXN6Pm43Z4IVnFXxc0sPiaXZtmxZQPmwvy8slaWZ57pNMLmQ/132',NULL,NULL,NULL,NULL,NULL),(350,'','',0,0,0,'老魏特产','https://wx.qlogo.cn/mmopen/vi_32/ekFWm6NDQzRicibSFGfWMgHS2jaiaTTOdg1jBzJk7NR3VwT9cibqRia1FdHTt3fsTD0PWA9AyyzsibvwPs98RgNfyPOA/132','王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132','2018-12-30 14:22:37',NULL,NULL),(351,'','',0,0,0,'老魏特产','https://wx.qlogo.cn/mmopen/vi_32/ekFWm6NDQzRicibSFGfWMgHS2jaiaTTOdg1jBzJk7NR3VwT9cibqRia1FdHTt3fsTD0PWA9AyyzsibvwPs98RgNfyPOA/132','王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132','2018-12-30 14:41:43',NULL,NULL),(352,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132','老魏特产','https://wx.qlogo.cn/mmopen/vi_32/ekFWm6NDQzRicibSFGfWMgHS2jaiaTTOdg1jBzJk7NR3VwT9cibqRia1FdHTt3fsTD0PWA9AyyzsibvwPs98RgNfyPOA/132','2018-12-31 10:38:30',NULL,NULL),(353,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(354,'','',0,0,0,'老魏特产','https://wx.qlogo.cn/mmopen/vi_32/ekFWm6NDQzRicibSFGfWMgHS2jaiaTTOdg1jBzJk7NR3VwT9cibqRia1FdHTt3fsTD0PWA9AyyzsibvwPs98RgNfyPOA/132',NULL,NULL,NULL,NULL,NULL),(355,'','',0,0,0,'老魏特产','https://wx.qlogo.cn/mmopen/vi_32/ekFWm6NDQzRicibSFGfWMgHS2jaiaTTOdg1jBzJk7NR3VwT9cibqRia1FdHTt3fsTD0PWA9AyyzsibvwPs98RgNfyPOA/132','王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132','2019-01-01 11:30:16',NULL,NULL),(356,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(357,'','',0,0,0,'碗豆','https://wx.qlogo.cn/mmopen/vi_32/IDDicA7apW2Kic82l9RHzSxS1I5QHQ7d5L2qnROYsQQHCHvBYyP8tnOaXSVDUTyDIsUULYtUwhteTpAfnciaMvUNg/132',NULL,NULL,NULL,NULL,NULL),(358,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(359,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(360,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132','高华','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIX88FOcCENjuB272faID1GpFRE77nMXN6Pm43Z4IVnFXxc0sPiaXZtmxZQPmwvy8slaWZ57pNMLmQ/132','2019-01-03 11:30:53',NULL,NULL),(361,'','',0,0,0,'老魏特产','https://wx.qlogo.cn/mmopen/vi_32/ekFWm6NDQzRicibSFGfWMgHS2jaiaTTOdg1jBzJk7NR3VwT9cibqRia1FdHTt3fsTD0PWA9AyyzsibvwPs98RgNfyPOA/132',NULL,NULL,NULL,NULL,NULL),(362,'','',0,1,2,'高华','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIX88FOcCENjuB272faID1GpFRE77nMXN6Pm43Z4IVnFXxc0sPiaXZtmxZQPmwvy8slaWZ57pNMLmQ/132',NULL,NULL,NULL,NULL,NULL),(363,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(364,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(365,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(366,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(367,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(368,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(370,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(371,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(373,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(374,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(376,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(378,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(382,'','',0,1,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(384,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(387,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132','会敏','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJkribhRyDNNmIA9gibbXEus80nqGvexn9zKUtYos8OWY30AB8VgyU2MArZA7tHwpbPlUKkFGdkNqdw/132','2019-01-09 20:03:13',NULL,NULL),(389,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(390,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(391,'','',0,0,0,'碗豆','https://wx.qlogo.cn/mmopen/vi_32/IDDicA7apW2Kic82l9RHzSxS1I5QHQ7d5L2qnROYsQQHCHvBYyP8tnOaXSVDUTyDIsUULYtUwhteTpAfnciaMvUNg/132',NULL,NULL,NULL,NULL,NULL),(392,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(395,'','',0,0,0,'老魏特产','https://wx.qlogo.cn/mmopen/vi_32/ekFWm6NDQzRicibSFGfWMgHS2jaiaTTOdg1jBzJk7NR3VwT9cibqRia1FdHTt3fsTD0PWA9AyyzsibvwPs98RgNfyPOA/132',NULL,NULL,NULL,NULL,NULL),(396,'','',0,0,0,'高华','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIX88FOcCENjuB272faID1GpFRE77nMXN6Pm43Z4IVnFXxc0sPiaXZtmxZQPmwvy8slaWZ57pNMLmQ/132',NULL,NULL,NULL,NULL,NULL),(397,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(398,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(399,'','',0,0,0,'会敏','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJkribhRyDNNmIA9gibbXEus80nqGvexn9zKUtYos8OWY30AB8VgyU2MArZA7tHwpbPlUKkFGdkNqdw/132',NULL,NULL,NULL,NULL,NULL),(401,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(402,'','',0,0,0,'老魏特产','https://wx.qlogo.cn/mmopen/vi_32/ekFWm6NDQzRicibSFGfWMgHS2jaiaTTOdg1jBzJk7NR3VwT9cibqRia1FdHTt3fsTD0PWA9AyyzsibvwPs98RgNfyPOA/132',NULL,NULL,NULL,NULL,NULL),(403,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(404,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(405,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(406,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(407,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(408,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(410,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(411,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132','老魏特产','https://wx.qlogo.cn/mmopen/vi_32/ekFWm6NDQzRicibSFGfWMgHS2jaiaTTOdg1jBzJk7NR3VwT9cibqRia1FdHTt3fsTD0PWA9AyyzsibvwPs98RgNfyPOA/132','2019-01-13 21:50:19',NULL,NULL),(412,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132','老魏特产','https://wx.qlogo.cn/mmopen/vi_32/ekFWm6NDQzRicibSFGfWMgHS2jaiaTTOdg1jBzJk7NR3VwT9cibqRia1FdHTt3fsTD0PWA9AyyzsibvwPs98RgNfyPOA/132','2019-01-13 21:53:56',NULL,NULL),(413,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(414,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(415,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(416,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(417,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(418,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(419,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(420,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(421,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132','会敏','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJkribhRyDNNmIA9gibbXEus80nqGvexn9zKUtYos8OWY30AB8VgyU2MArZA7tHwpbPlUKkFGdkNqdw/132','2019-01-16 22:12:50',NULL,NULL),(422,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(423,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(424,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(425,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(426,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(427,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(428,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(429,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(430,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(432,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(433,'','',0,0,0,'会敏','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJkribhRyDNNmIA9gibbXEus80nqGvexn9zKUtYos8OWY30AB8VgyU2MArZA7tHwpbPlUKkFGdkNqdw/132','王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132','2019-01-20 11:03:46',NULL,NULL),(434,'','',0,0,0,'会敏','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJkribhRyDNNmIA9gibbXEus80nqGvexn9zKUtYos8OWY30AB8VgyU2MArZA7tHwpbPlUKkFGdkNqdw/132','王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132','2019-01-20 11:23:36',NULL,NULL),(435,'','',0,0,0,'会敏','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJkribhRyDNNmIA9gibbXEus80nqGvexn9zKUtYos8OWY30AB8VgyU2MArZA7tHwpbPlUKkFGdkNqdw/132','王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132','2019-01-20 11:30:21',NULL,NULL),(442,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132','会敏','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJkribhRyDNNmIA9gibbXEus80nqGvexn9zKUtYos8OWY30AB8VgyU2MArZA7tHwpbPlUKkFGdkNqdw/132','2019-01-20 11:56:13',NULL,NULL),(443,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132','会敏','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJkribhRyDNNmIA9gibbXEus80nqGvexn9zKUtYos8OWY30AB8VgyU2MArZA7tHwpbPlUKkFGdkNqdw/132','2019-01-20 12:05:43',NULL,NULL),(444,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(446,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132','老魏特产','https://wx.qlogo.cn/mmopen/vi_32/ekFWm6NDQzRicibSFGfWMgHS2jaiaTTOdg1jBzJk7NR3VwT9cibqRia1FdHTt3fsTD0PWA9AyyzsibvwPs98RgNfyPOA/132','2019-01-21 18:22:47',NULL,NULL),(447,'','',0,0,0,'碗豆','https://wx.qlogo.cn/mmopen/vi_32/IDDicA7apW2Kic82l9RHzSxS1I5QHQ7d5L2qnROYsQQHCHvBYyP8tnOaXSVDUTyDIsUULYtUwhteTpAfnciaMvUNg/132',NULL,NULL,NULL,NULL,NULL),(448,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132','碗豆','https://wx.qlogo.cn/mmopen/vi_32/IDDicA7apW2Kic82l9RHzSxS1I5QHQ7d5L2qnROYsQQHCHvBYyP8tnOaXSVDUTyDIsUULYtUwhteTpAfnciaMvUNg/132','2019-01-22 13:26:06',NULL,NULL),(450,'','',0,0,0,'胡林林','https://wx.qlogo.cn/mmopen/vi_32/ajNVdqHZLLBPWYY8zd1Mq59HA2xZu1M7WMELVl6yJFhq8pf5nBNyG2IJdkqobCMlpCibQgMictn8nCSo71HWRpMg/132',NULL,NULL,NULL,NULL,NULL),(451,'','',0,0,0,'胡林林','https://wx.qlogo.cn/mmopen/vi_32/ajNVdqHZLLBPWYY8zd1Mq59HA2xZu1M7WMELVl6yJFhq8pf5nBNyG2IJdkqobCMlpCibQgMictn8nCSo71HWRpMg/132',NULL,NULL,NULL,NULL,NULL),(452,'','',0,0,1,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(454,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(456,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132','余谦','https://wx.qlogo.cn/mmopen/vi_32/37ia2979KWbtdK5s1IE9a2eCeKU1hhGkpSrAMQHUCBBIviayZ2Yy7wDoK9BJfJKnwIS4FrekcxkiblCRfxAicsP5HA/132','2019-01-27 16:45:57',NULL,NULL),(457,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(458,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,'已经发货'),(459,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132','安徒生','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLGqibUOngLiboEkODsNG7u7vfaB6DkXqour6o85GmteGj8oA4SPjUyP3ROQtsXk9mqaicrI5qcG1JoQ/132','2019-02-04 19:06:46',NULL,NULL),(467,'','',0,0,0,'王江波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132',NULL,NULL,NULL,NULL,NULL),(469,'','大吉大利，恭喜发财',0,0,0,'许昌特产','http://www.imgtqbu.weiruikj.cn/Fs32xo_EjWT7D_a1Ry1gmDsQKx9v',NULL,NULL,NULL,NULL,NULL),(477,'','大吉大利，恭喜发财',0,0,0,'许昌特产','http://www.imgtqbu.weiruikj.cn/Fs32xo_EjWT7D_a1Ry1gmDsQKx9v',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `zytc_order_extra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_order_goods`
--

DROP TABLE IF EXISTS `zytc_order_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_order_goods` (
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `goods_price` decimal(19,2) DEFAULT '0.00' COMMENT '商品价格',
  `goodid` int(11) DEFAULT '0',
  `goodtitle` varchar(256) DEFAULT '',
  `goodposter` varchar(245) DEFAULT '',
  `buysum` int(11) DEFAULT '0',
  `group_number` int(11) DEFAULT '2',
  `skuid` int(11) DEFAULT '0',
  `skuname` varchar(45) DEFAULT '',
  `discount` decimal(19,2) DEFAULT '1.00',
  `discount_goods_id` int(11) DEFAULT '0',
  `goodsname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_order_goods`
--

LOCK TABLES `zytc_order_goods` WRITE;
/*!40000 ALTER TABLE `zytc_order_goods` DISABLE KEYS */;
INSERT INTO `zytc_order_goods` VALUES (1,33.00,404,'许昌质源腐竹 3KG特惠装 限时特价 过时不候 速速来抢','http://p4wgvxk6d.bkt.clouddn.com/FpG8pTIUA4iUJ44Ls4QkiE2t0MUC',1,3,1501,'15 深红色 ',1.00,0,NULL),(2,22.00,404,'许昌质源腐竹 3KG特惠装 限时特价 过时不候 速速来抢','http://p4wgvxk6d.bkt.clouddn.com/FpG8pTIUA4iUJ44Ls4QkiE2t0MUC',1,3,1500,'18 深红色 ',1.00,0,NULL),(3,33.00,404,'许昌质源腐竹 3KG特惠装 限时特价 过时不候 速速来抢','http://p4wgvxk6d.bkt.clouddn.com/FpG8pTIUA4iUJ44Ls4QkiE2t0MUC',1,3,1501,'15 深红色 ',1.00,0,NULL),(4,22.00,404,'许昌质源腐竹 3KG特惠装 限时特价 过时不候 速速来抢','http://p4wgvxk6d.bkt.clouddn.com/FpG8pTIUA4iUJ44Ls4QkiE2t0MUC',1,3,1500,'18 深红色 ',1.00,0,NULL),(5,22.00,404,'许昌质源腐竹 3KG特惠装 限时特价 过时不候 速速来抢','http://p4wgvxk6d.bkt.clouddn.com/FpG8pTIUA4iUJ44Ls4QkiE2t0MUC',1,3,1500,'18 深红色 ',1.00,0,NULL),(6,22.00,404,'许昌质源腐竹 3KG特惠装 限时特价 过时不候 速速来抢','http://p4wgvxk6d.bkt.clouddn.com/FpG8pTIUA4iUJ44Ls4QkiE2t0MUC',1,3,1500,'18 深红色 ',1.00,0,NULL),(278,33.00,404,'许昌质源腐竹 3KG特惠装 限时特价 过时不候 速速来抢','http://p4wgvxk6d.bkt.clouddn.com/FpG8pTIUA4iUJ44Ls4QkiE2t0MUC',1,3,1501,'15 深红色 ',1.00,0,NULL),(279,33.00,404,'许昌质源腐竹 3KG特惠装 限时特价 过时不候 速速来抢','http://p4wgvxk6d.bkt.clouddn.com/FpG8pTIUA4iUJ44Ls4QkiE2t0MUC',1,3,1501,'15 深红色 ',1.00,0,NULL),(280,33.00,404,'许昌质源腐竹 3KG特惠装 限时特价 过时不候 速速来抢','http://p4wgvxk6d.bkt.clouddn.com/FpG8pTIUA4iUJ44Ls4QkiE2t0MUC',1,3,1501,'15 深红色 ',1.00,0,NULL),(281,22.00,404,'许昌质源腐竹 3KG特惠装 限时特价 过时不候 速速来抢','http://p4wgvxk6d.bkt.clouddn.com/FpG8pTIUA4iUJ44Ls4QkiE2t0MUC',1,3,1500,'18 深红色 ',1.00,0,NULL),(283,11.00,407,'礼品苹果 12个','http://p4wgvxk6d.bkt.clouddn.com/FtfdQIarBcHtVsmP4_NLLHGFcbCX',1,2,0,'',1.00,0,NULL),(284,33.00,404,'许昌质源腐竹 3KG特惠装 限时特价 过时不候 速速来抢','http://p4wgvxk6d.bkt.clouddn.com/FpG8pTIUA4iUJ44Ls4QkiE2t0MUC',1,3,1501,'15 深红色 ',1.00,0,NULL),(285,22.00,404,'许昌质源腐竹 3KG特惠装 限时特价 过时不候 速速来抢','http://p4wgvxk6d.bkt.clouddn.com/FpG8pTIUA4iUJ44Ls4QkiE2t0MUC',1,3,1500,'18 深红色 ',1.00,0,NULL),(286,22.00,404,'许昌质源腐竹 3KG特惠装 限时特价 过时不候 速速来抢','http://p4wgvxk6d.bkt.clouddn.com/FpG8pTIUA4iUJ44Ls4QkiE2t0MUC',1,3,1500,'18 深红色 ',1.00,0,NULL),(287,25.00,407,'礼品苹果 12个','http://www.imgtqbu.weiruikj.cn/FtfdQIarBcHtVsmP4_NLLHGFcbCX',1,2,0,'',1.00,0,NULL),(288,11.00,407,'礼品苹果 12个','http://www.imgtqbu.weiruikj.cn/FtfdQIarBcHtVsmP4_NLLHGFcbCX',9,2,0,'',1.00,0,NULL),(289,22.00,404,'许昌质源腐竹 3KG特惠装 限时特价 过时不候 速速来抢','http://www.imgtqbu.weiruikj.cn/FpG8pTIUA4iUJ44Ls4QkiE2t0MUC',1,3,1500,'18 深红色 ',1.00,0,NULL),(290,25.00,407,'礼品苹果 12个','http://www.imgtqbu.weiruikj.cn/FtfdQIarBcHtVsmP4_NLLHGFcbCX',5,2,0,'',1.00,0,NULL),(291,33.00,404,'许昌质源腐竹 3KG特惠装 限时特价 过时不候 速速来抢','http://www.imgtqbu.weiruikj.cn/FpG8pTIUA4iUJ44Ls4QkiE2t0MUC',2,3,1501,'15 深红色 ',1.00,0,NULL),(292,33.00,404,'许昌质源腐竹 3KG特惠装 限时特价 过时不候 速速来抢','http://www.imgtqbu.weiruikj.cn/FpG8pTIUA4iUJ44Ls4QkiE2t0MUC',1,3,1501,'15 深红色 ',1.00,0,NULL),(294,25.00,407,'礼品苹果 12个','http://www.imgtqbu.weiruikj.cn/FtfdQIarBcHtVsmP4_NLLHGFcbCX',1,2,0,'',1.00,0,NULL),(295,25.00,407,'礼品苹果 12个','http://www.imgtqbu.weiruikj.cn/FtfdQIarBcHtVsmP4_NLLHGFcbCX',1,2,0,'',1.00,0,NULL),(298,33.00,404,'许昌质源腐竹 3KG特惠装 限时特价 过时不候 速速来抢','http://www.imgtqbu.weiruikj.cn/FpG8pTIUA4iUJ44Ls4QkiE2t0MUC',2,3,1501,'15 深红色 ',1.00,0,NULL),(299,25.00,407,'礼品苹果 12个','http://www.imgtqbu.weiruikj.cn/FtfdQIarBcHtVsmP4_NLLHGFcbCX',1,2,0,'',1.00,0,NULL),(300,33.00,404,'许昌质源腐竹 3KG特惠装 限时特价 过时不候 速速来抢','http://www.imgtqbu.weiruikj.cn/FpG8pTIUA4iUJ44Ls4QkiE2t0MUC',2,3,1501,'15 深红色 ',1.00,0,NULL),(301,33.00,404,'许昌质源腐竹 3KG特惠装 限时特价 过时不候 速速来抢','http://www.imgtqbu.weiruikj.cn/FpG8pTIUA4iUJ44Ls4QkiE2t0MUC',2,3,1501,'15 深红色 ',1.00,0,NULL),(302,22.00,404,'许昌质源腐竹 3KG特惠装 限时特价 过时不候 速速来抢','http://www.imgtqbu.weiruikj.cn/FpG8pTIUA4iUJ44Ls4QkiE2t0MUC',1,3,1500,'18 深红色 ',1.00,0,NULL),(303,33.00,404,'许昌质源腐竹 3KG特惠装 限时特价 过时不候 速速来抢','http://www.imgtqbu.weiruikj.cn/FpG8pTIUA4iUJ44Ls4QkiE2t0MUC',2,3,1501,'15 深红色 ',1.00,0,NULL),(304,33.00,404,'许昌质源腐竹 3KG特惠装 限时特价 过时不候 速速来抢','http://www.imgtqbu.weiruikj.cn/FpG8pTIUA4iUJ44Ls4QkiE2t0MUC',1,3,1501,'15 深红色 ',1.00,0,NULL),(305,11.00,407,'礼品苹果 12个','http://www.imgtqbu.weiruikj.cn/FtfdQIarBcHtVsmP4_NLLHGFcbCX',1,2,0,'',1.00,0,NULL),(306,25.00,407,'礼品苹果 12个','http://www.imgtqbu.weiruikj.cn/FtfdQIarBcHtVsmP4_NLLHGFcbCX',1,2,0,'',1.00,0,NULL),(307,22.00,404,'许昌质源腐竹 3KG特惠装 限时特价 过时不候 速速来抢','http://www.imgtqbu.weiruikj.cn/FpG8pTIUA4iUJ44Ls4QkiE2t0MUC',1,3,1500,'18 深红色 ',1.00,0,NULL),(308,33.00,404,'许昌质源腐竹 3KG特惠装 限时特价 过时不候 速速来抢','http://www.imgtqbu.weiruikj.cn/FpG8pTIUA4iUJ44Ls4QkiE2t0MUC',1,3,1501,'15 深红色 ',1.00,0,NULL),(309,25.00,407,'礼品苹果 12个','http://www.imgtqbu.weiruikj.cn/FtfdQIarBcHtVsmP4_NLLHGFcbCX',1,2,0,'',1.00,0,NULL),(310,33.00,404,'许昌质源腐竹 3KG特惠装 限时特价 过时不候 速速来抢','http://www.imgtqbu.weiruikj.cn/FpG8pTIUA4iUJ44Ls4QkiE2t0MUC',1,3,1501,'15 深红色 ',1.00,0,NULL),(311,33.00,404,'许昌质源腐竹 3KG特惠装 限时特价 过时不候 速速来抢','http://www.imgtqbu.weiruikj.cn/FpG8pTIUA4iUJ44Ls4QkiE2t0MUC',1,3,1501,'15 深红色 ',1.00,0,NULL),(312,33.00,404,'许昌质源腐竹 3KG特惠装 限时特价 过时不候 速速来抢','http://www.imgtqbu.weiruikj.cn/FpG8pTIUA4iUJ44Ls4QkiE2t0MUC',1,3,1501,'15 深红色 ',1.00,0,NULL),(313,33.00,404,'许昌质源腐竹 3KG特惠装 限时特价 过时不候 速速来抢','http://www.imgtqbu.weiruikj.cn/FpG8pTIUA4iUJ44Ls4QkiE2t0MUC',1,3,1501,'15 深红色 ',1.00,0,NULL),(314,33.00,404,'许昌质源腐竹 3KG特惠装 限时特价 过时不候 速速来抢','http://www.imgtqbu.weiruikj.cn/FpG8pTIUA4iUJ44Ls4QkiE2t0MUC',1,3,1501,'15 深红色 ',1.00,0,NULL),(315,11.00,407,'礼品苹果 12个','http://www.imgtqbu.weiruikj.cn/FtfdQIarBcHtVsmP4_NLLHGFcbCX',1,1,0,'',1.00,0,NULL),(316,11.00,407,'礼品苹果 12个','http://www.imgtqbu.weiruikj.cn/FtfdQIarBcHtVsmP4_NLLHGFcbCX',1,2,0,'',1.00,0,NULL),(317,11.00,407,'礼品苹果 12个','http://www.imgtqbu.weiruikj.cn/FtfdQIarBcHtVsmP4_NLLHGFcbCX',1,2,0,'',1.00,0,NULL),(318,11.00,407,'礼品苹果 12个','http://www.imgtqbu.weiruikj.cn/FtfdQIarBcHtVsmP4_NLLHGFcbCX',1,2,0,'',1.00,0,NULL),(319,25.00,407,'礼品苹果 12个','http://www.imgtqbu.weiruikj.cn/FtfdQIarBcHtVsmP4_NLLHGFcbCX',1,2,0,'',1.00,0,NULL),(320,25.00,407,'礼品苹果 12个','http://www.imgtqbu.weiruikj.cn/FtfdQIarBcHtVsmP4_NLLHGFcbCX',1,2,0,'',1.00,0,NULL),(321,25.00,407,'礼品苹果 12个','http://www.imgtqbu.weiruikj.cn/FtfdQIarBcHtVsmP4_NLLHGFcbCX',1,2,0,'',1.00,0,NULL),(322,11.00,407,'礼品苹果 12个','http://www.imgtqbu.weiruikj.cn/FtfdQIarBcHtVsmP4_NLLHGFcbCX',1,2,0,'',1.00,0,NULL),(323,11.00,407,'礼品苹果 12个','http://www.imgtqbu.weiruikj.cn/FtfdQIarBcHtVsmP4_NLLHGFcbCX',1,2,0,'',1.00,0,NULL),(324,22.00,404,'许昌质源腐竹 3KG特惠装 限时特价 过时不候 速速来抢','http://www.imgtqbu.weiruikj.cn/FpG8pTIUA4iUJ44Ls4QkiE2t0MUC',1,3,1500,'18 深红色 ',1.00,0,NULL),(325,22.00,404,'许昌质源腐竹 3KG特惠装 限时特价 过时不候 速速来抢','http://www.imgtqbu.weiruikj.cn/FpG8pTIUA4iUJ44Ls4QkiE2t0MUC',1,3,1500,'18 深红色 ',1.00,0,NULL),(326,11.00,407,'礼品苹果 12个','http://www.imgtqbu.weiruikj.cn/FtfdQIarBcHtVsmP4_NLLHGFcbCX',1,2,0,'',1.00,0,NULL),(327,11.00,407,'礼品苹果 12个','http://www.imgtqbu.weiruikj.cn/FtfdQIarBcHtVsmP4_NLLHGFcbCX',1,2,0,'',1.00,0,NULL),(328,11.00,407,'礼品苹果 12个','http://www.imgtqbu.weiruikj.cn/FtfdQIarBcHtVsmP4_NLLHGFcbCX',1,2,0,'',1.00,0,NULL),(329,33.00,404,'许昌质源腐竹 3KG特惠装 限时特价 过时不候 速速来抢','http://www.imgtqbu.weiruikj.cn/FpG8pTIUA4iUJ44Ls4QkiE2t0MUC',2,3,1501,'15 深红色 ',1.00,0,NULL),(330,11.00,407,'礼品苹果 12个','http://www.imgtqbu.weiruikj.cn/FtfdQIarBcHtVsmP4_NLLHGFcbCX',1,2,0,'',1.00,0,NULL),(331,33.00,404,'许昌质源腐竹 3KG特惠装 限时特价 过时不候 速速来抢','http://www.imgtqbu.weiruikj.cn/FpG8pTIUA4iUJ44Ls4QkiE2t0MUC',1,3,1501,'15 深红色 ',1.00,0,NULL),(332,25.00,407,'礼品苹果 12个','http://www.imgtqbu.weiruikj.cn/FtfdQIarBcHtVsmP4_NLLHGFcbCX',2,2,0,'',1.00,0,NULL),(333,33.00,404,'许昌质源腐竹 3KG特惠装 限时特价 过时不候 速速来抢','http://www.imgtqbu.weiruikj.cn/FpG8pTIUA4iUJ44Ls4QkiE2t0MUC',1,3,1501,'15 深红色 ',1.00,0,NULL),(334,11.00,407,'礼品苹果 12个','http://www.imgtqbu.weiruikj.cn/FtfdQIarBcHtVsmP4_NLLHGFcbCX',1,2,0,'',1.00,0,NULL),(335,11.00,407,'礼品苹果 12个','http://www.imgtqbu.weiruikj.cn/FtfdQIarBcHtVsmP4_NLLHGFcbCX',5,2,0,'',1.00,0,NULL),(336,25.00,407,'礼品苹果 12个','http://www.imgtqbu.weiruikj.cn/FtfdQIarBcHtVsmP4_NLLHGFcbCX',1,2,0,'',1.00,0,NULL),(337,25.00,407,'礼品苹果 12个','http://www.imgtqbu.weiruikj.cn/FtfdQIarBcHtVsmP4_NLLHGFcbCX',1,2,0,'',1.00,0,NULL),(338,25.00,407,'礼品苹果 12个','http://www.imgtqbu.weiruikj.cn/FtfdQIarBcHtVsmP4_NLLHGFcbCX',1,2,0,'',1.00,0,NULL),(339,25.00,407,'礼品苹果 12个','http://www.imgtqbu.weiruikj.cn/FtfdQIarBcHtVsmP4_NLLHGFcbCX',1,2,0,'',1.00,0,NULL),(340,25.00,407,'礼品苹果 12个','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1545895505',1,2,0,'',1.00,0,NULL),(341,25.00,407,'礼品苹果 12个','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1545895505',1,2,0,'',1.00,0,NULL),(342,25.00,407,'礼品苹果 12个','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1545895505',1,2,0,'',1.00,0,NULL),(343,25.00,407,'礼品苹果 12个','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1545895505',1,2,0,'',1.00,0,NULL),(344,25.00,407,'礼品苹果 12个','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1545895505',1,2,0,'',1.00,0,NULL),(345,25.00,407,'礼品苹果 12个','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1545895505',1,2,0,'',1.00,0,NULL),(346,25.00,407,'礼品苹果 12个','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1545895505',1,2,0,'',1.00,0,NULL),(347,25.00,407,'礼品苹果 12个','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1545895505',1,2,0,'',1.00,0,NULL),(348,11.00,407,'礼品苹果 12个','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1545895505',1,2,0,'',1.00,0,NULL),(349,33.00,404,'许昌质源腐竹 3KG特惠装 限时特价 过时不候 速速来抢','http://www.imgtqbu.weiruikj.cn/FpG8pTIUA4iUJ44Ls4QkiE2t0MUC',1,3,1501,'15 深红色 ',1.00,0,NULL),(350,33.00,404,'许昌质源腐竹 3KG特惠装 限时特价 过时不候 速速来抢','http://www.imgtqbu.weiruikj.cn/FpG8pTIUA4iUJ44Ls4QkiE2t0MUC',1,3,1501,'15 深红色 ',1.00,0,NULL),(351,33.00,404,'许昌质源腐竹 3KG特惠装 限时特价 过时不候 速速来抢','http://www.imgtqbu.weiruikj.cn/FpG8pTIUA4iUJ44Ls4QkiE2t0MUC',1,3,1501,'15 深红色 ',1.00,0,NULL),(352,25.00,407,'礼品苹果 12个','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1545895505',1,2,0,'',1.00,0,NULL),(353,25.00,407,'礼品苹果 12个','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1545895505',1,2,0,'',1.00,0,NULL),(354,25.00,407,'礼品苹果 12个','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1545895505',1,2,0,'',1.00,0,NULL),(355,25.00,407,'礼品苹果 12个','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1545895505',2,2,0,'',1.00,0,NULL),(356,25.00,407,'礼品苹果 12个','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1545895505',1,2,0,'',1.00,0,NULL),(357,11.00,407,'礼品苹果 12个','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1545895505',1,2,0,'',1.00,0,NULL),(358,25.00,407,'礼品苹果 12个','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1545895505',1,2,0,'',1.00,0,NULL),(359,75.00,408,'禹州名产 红薯粉条 传统配方 现代工艺 高端礼品2.5KG装','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1546412669',1,2,0,'',1.00,0,NULL),(360,78.00,408,'禹州名产 红薯粉条 传统配方 现代工艺 高端礼品2.5KG装','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1546412669',1,2,0,'',1.00,0,NULL),(361,75.00,408,'禹州名产 红薯粉条 传统配方 现代工艺 高端礼品2.5KG装','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1546412669',1,2,0,'',1.00,0,NULL),(362,25.00,407,'礼品苹果 12个','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1545895505',1,2,0,'',1.00,0,NULL),(363,78.00,408,'禹州名产 红薯粉条 传统配方 现代工艺 高端礼品2.5KG装','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1546412669',1,2,0,'',1.00,0,NULL),(364,78.00,408,'禹州名产 红薯粉条 传统配方 现代工艺 高端礼品2.5KG装','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1546412669',1,2,0,'',1.00,0,NULL),(365,78.00,408,'禹州名产 红薯粉条 传统配方 现代工艺 高端礼品2.5KG装','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1546412669',1,2,0,'',1.00,0,NULL),(366,108.00,407,'新疆 阿克苏 冰甜糖心苹果 20斤一箱装 个个好果子','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1545895505',1,2,0,'',1.00,0,NULL),(367,78.00,408,'禹州名产 红薯粉条 传统配方 现代工艺 高端礼品2.5KG装','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1546412669',1,2,0,'',1.00,0,NULL),(368,108.00,407,'新疆 阿克苏 冰甜糖心苹果 20斤一箱装 个个好果子','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1545895505',1,2,0,'',1.00,0,NULL),(370,78.00,408,'禹州名产 红薯粉条 传统配方 现代工艺 高端礼品2.5KG装','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1546412669',1,2,0,'',1.00,0,NULL),(371,78.00,408,'禹州名产 红薯粉条 传统配方 现代工艺 高端礼品2.5KG装','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1546412669',1,2,0,'',1.00,0,NULL),(373,32.00,404,'许昌质源腐竹 3KG特惠装 限时特价 过时不候 速速来抢','http://www.imgtqbu.weiruikj.cn/FpG8pTIUA4iUJ44Ls4QkiE2t0MUC',1,3,0,'',1.00,0,NULL),(374,32.00,404,'许昌质源腐竹 3KG特惠装 限时特价 过时不候 速速来抢','http://www.imgtqbu.weiruikj.cn/FpG8pTIUA4iUJ44Ls4QkiE2t0MUC',1,3,0,'',1.00,0,NULL),(376,32.00,404,'许昌质源腐竹 3KG特惠装 限时特价 过时不候 速速来抢','http://www.imgtqbu.weiruikj.cn/FpG8pTIUA4iUJ44Ls4QkiE2t0MUC',1,3,0,'',1.00,0,NULL),(378,32.00,404,'许昌质源腐竹 3KG特惠装 限时特价 过时不候 速速来抢','http://www.imgtqbu.weiruikj.cn/FpG8pTIUA4iUJ44Ls4QkiE2t0MUC',1,3,0,'',1.00,0,NULL),(382,12.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',1,2,0,'',1.00,0,NULL),(384,4.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',1,2,0,'',1.00,0,NULL),(387,5.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',1,2,0,'',1.00,0,NULL),(389,5.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',1,2,0,'',1.00,0,NULL),(390,5.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',1,2,0,'',1.00,0,NULL),(391,75.00,408,'禹州名产 红薯粉条 传统配方 现代工艺 高端礼品2.5KG装','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1546412669',1,2,0,'',1.00,0,NULL),(392,5.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',1,2,0,'',1.00,0,NULL),(395,4.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',1,2,0,'',1.00,0,NULL),(396,5.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',1,2,0,'',1.00,0,NULL),(397,5.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',1,2,0,'',1.00,0,NULL),(398,5.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',1,2,0,'',1.00,0,NULL),(399,4.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',1,2,0,'',1.00,0,NULL),(401,4.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',1,2,0,'',1.00,0,NULL),(402,4.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',1,2,0,'',1.00,0,NULL),(403,4.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',1,2,0,'',1.00,0,NULL),(404,4.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',1,2,0,'',1.00,0,NULL),(405,5.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',1,2,0,'',1.00,0,NULL),(406,5.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',1,2,0,'',1.00,0,NULL),(407,5.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',1,2,0,'',1.00,0,NULL),(408,5.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',1,2,0,'',1.00,0,NULL),(410,5.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',2,2,0,'',1.00,0,NULL),(411,5.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',1,2,0,'',1.00,0,NULL),(412,5.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',1,2,0,'',1.00,0,NULL),(413,5.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',1,2,0,'',1.00,0,NULL),(414,5.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',1,2,0,'',1.00,0,NULL),(415,4.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',1,2,0,'',1.00,0,NULL),(416,5.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',1,2,0,'',1.00,0,NULL),(417,5.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',1,2,0,'',1.00,0,NULL),(418,5.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',1,2,0,'',1.00,0,NULL),(419,5.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',1,2,0,'',1.00,0,NULL),(420,5.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',1,2,0,'',1.00,0,NULL),(421,5.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',2,2,0,'',1.00,0,NULL),(422,5.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',1,2,0,'',1.00,0,NULL),(423,5.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',1,2,0,'',1.00,0,NULL),(424,4.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',1,2,0,'',1.00,0,NULL),(425,5.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',1,2,0,'',1.00,0,'榆林小米'),(426,5.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',1,2,0,'',1.00,0,'榆林小米'),(427,5.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',1,2,0,'',1.00,0,'榆林小米'),(428,5.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',1,2,0,'',1.00,0,'榆林小米'),(429,5.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',1,2,0,'',1.00,0,'榆林小米'),(430,5.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',1,2,0,'',1.00,0,'榆林小米'),(432,5.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',1,2,0,'',1.00,0,'榆林小米'),(433,5.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',1,2,0,'',1.00,0,'榆林小米'),(434,5.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',1,2,0,'',1.00,0,'榆林小米'),(435,5.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',1,2,0,'',1.00,0,'榆林小米'),(442,5.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',1,2,0,'',1.00,0,'榆林小米'),(443,5.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',1,2,0,'',1.00,0,'榆林小米'),(444,5.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',1,2,0,'',1.00,0,'榆林小米'),(446,5.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',1,2,0,'',1.00,0,'榆林小米'),(447,4.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',1,2,0,'',1.00,0,'榆林小米'),(448,4.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',1,2,0,'',1.00,0,'榆林小米'),(450,5.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',1,2,0,'',1.00,0,'榆林小米'),(451,4.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',1,2,0,'',1.00,0,'榆林小米'),(452,5.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',1,2,0,'',1.00,0,'榆林小米'),(454,5.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',1,2,0,'',1.00,0,'榆林小米'),(456,65.00,411,'禹州名产 红薯粉条 传统手工 现代工艺 特惠5斤盒装','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1548299677',1,2,0,'',1.00,0,'禹州红薯粉条'),(457,5.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',1,2,0,'',1.00,0,'榆林小米'),(458,5.90,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008371',1,2,0,'',1.00,0,'榆林小米'),(459,65.00,411,'禹州名产 红薯粉条 传统手工 现代工艺 特惠5斤盒装','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1548299677',1,2,0,'',1.00,0,'禹州红薯粉条'),(477,59.90,411,'禹州名产 红薯粉条 传统手工 现代工艺 特惠5斤盒装','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1548299677',1,1,0,'',1.00,0,'禹州红薯粉条');
/*!40000 ALTER TABLE `zytc_order_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_order_goods_express`
--

DROP TABLE IF EXISTS `zytc_order_goods_express`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_order_goods_express` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `express_name` varchar(50) DEFAULT '' COMMENT '包裹名称  （包裹- 1 包裹 - 2）',
  `shipping_type` tinyint(4) DEFAULT NULL COMMENT '发货方式1 需要物流 0无需物流',
  `express_company_id` int(11) DEFAULT NULL COMMENT '快递公司id',
  `express_company` varchar(255) DEFAULT '' COMMENT '物流公司名称',
  `express_no` varchar(50) DEFAULT NULL COMMENT '运单编号',
  `shipping_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '发货时间',
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `memo` varchar(255) DEFAULT '' COMMENT '备注',
  `message` text,
  `company_code` varchar(45) DEFAULT NULL,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `errmessage` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `INDEX_ORDERID` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=606 COMMENT='商品订单物流信息表（多次发货）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_order_goods_express`
--

LOCK TABLES `zytc_order_goods_express` WRITE;
/*!40000 ALTER TABLE `zytc_order_goods_express` DISABLE KEYS */;
INSERT INTO `zytc_order_goods_express` VALUES (1,278,'圆通速递',0,1,'圆通速递','DDD10999','2018-11-26 15:50:38',296,'huiminxiaodian','',NULL,'yuantong','2018-11-26 15:50:38',NULL),(2,287,'天天快递',0,4,'天天快递','dt6787667','2018-11-30 19:07:11',296,'huiminxiaodian','',NULL,'tiantian','2018-11-30 19:14:58','快递公司参数异常：单号不存在或者已经过期'),(5,2,'圆通速递',0,1,'圆通速递','ceshi123456','2018-12-05 10:01:26',296,'huiminxiaodian','',NULL,'yuantong','2018-12-05 10:01:26',NULL),(6,298,'圆通速递',0,1,'圆通速递','ceshi123456','2018-12-05 10:01:48',296,'huiminxiaodian','',NULL,'yuantong','2018-12-05 10:01:48',NULL),(7,295,'圆通速递',0,1,'圆通速递','dddddd','2018-12-05 10:05:15',296,'huiminxiaodian','',NULL,'yuantong','2018-12-14 17:01:40','快递公司参数异常：单号不存在或者已经过期'),(9,290,'圆通速递',0,1,'圆通速递','123456cc','2018-12-05 10:18:15',296,'huiminxiaodian','',NULL,'yuantong','2018-12-05 10:18:15',NULL),(12,294,NULL,0,1,'圆通速递','123465ss','2018-12-05 11:05:38',40,'高华',NULL,NULL,'yuantong','2018-12-05 11:05:38',NULL),(13,339,NULL,0,7,'线下配送','1','2018-12-28 11:06:20',10,'王江波',NULL,NULL,'','2018-12-28 11:07:04','参数错误'),(14,338,NULL,0,7,'线下配送','1','2018-12-28 11:10:33',10,'王江波',NULL,NULL,'','2018-12-28 11:11:48','参数错误'),(15,331,NULL,0,7,'线下配送','111','2018-12-28 11:10:54',14,'胡林林',NULL,NULL,'','2018-12-28 11:10:54',NULL),(16,354,NULL,1,7,'线下配送','hhhh','2018-12-31 22:54:28',63,'老魏特产',NULL,NULL,'','2018-12-31 22:54:28',NULL),(17,367,NULL,1,7,'线下配送','配送电话18637468680','2019-01-06 22:03:42',10,'王江波',NULL,NULL,'','2019-01-06 22:03:42',NULL),(18,446,NULL,1,7,'线下配送','王江波 18637468680','2019-01-21 18:25:53',10,'王江波',NULL,NULL,'','2019-01-21 18:25:53',NULL),(19,456,NULL,0,6,'顺丰速递','306210757123','2019-01-28 10:12:01',10,'王江波',NULL,NULL,'shunfeng','2019-01-28 10:12:01',NULL),(20,456,NULL,0,6,'顺丰速递','306210757123','2019-01-28 10:12:04',10,'王江波',NULL,NULL,'shunfeng','2019-01-28 10:12:04',NULL),(22,457,NULL,0,6,'顺丰速递','306210757123','2019-01-28 11:04:00',10,'王江波',NULL,NULL,'shunfeng','2019-01-28 11:04:00',NULL),(25,458,NULL,0,6,'顺丰速递','306210757123','2019-01-28 11:32:33',10,'王江波',NULL,'[{\"time\":\"2019-01-29 14:41:26\",\"ftime\":\"2019-01-29 14:41:26\",\"context\":\"[武汉市]代签收(前台 ),感谢使用顺丰,期待再次为您服务\",\"location\":\"武汉市\"},{\"time\":\"2019-01-29 12:14:42\",\"ftime\":\"2019-01-29 12:14:42\",\"context\":\"[武汉市]快件交给程俊，正在派送途中（联系电话：13995529522）\",\"location\":\"武汉市\"},{\"time\":\"2019-01-29 06:41:52\",\"ftime\":\"2019-01-29 06:41:52\",\"context\":\"[武汉市]快件到达 【武汉武昌区汉街营业点】\",\"location\":\"武汉市\"},{\"time\":\"2019-01-29 05:29:06\",\"ftime\":\"2019-01-29 05:29:06\",\"context\":\"[武汉市]快件已发车\",\"location\":\"武汉市\"},{\"time\":\"2019-01-29 02:47:00\",\"ftime\":\"2019-01-29 02:47:00\",\"context\":\"[武汉市]快件在【武汉吴家山集散中心】已装车,准备发往 【武汉武昌区汉街营业点】\",\"location\":\"武汉市\"},{\"time\":\"2019-01-29 01:03:43\",\"ftime\":\"2019-01-29 01:03:43\",\"context\":\"[武汉市]快件到达 【武汉吴家山集散中心】\",\"location\":\"武汉市\"},{\"time\":\"2019-01-28 17:59:59\",\"ftime\":\"2019-01-28 17:59:59\",\"context\":\"[郑州市]快件已发车\",\"location\":\"郑州市\"},{\"time\":\"2019-01-28 16:05:21\",\"ftime\":\"2019-01-28 16:05:21\",\"context\":\"[郑州市]快件在【郑州新郑集散中心】已装车,准备发往 【武汉吴家山集散中心】\",\"location\":\"郑州市\"},{\"time\":\"2019-01-28 14:59:09\",\"ftime\":\"2019-01-28 14:59:09\",\"context\":\"[郑州市]快件到达 【郑州新郑集散中心】\",\"location\":\"郑州市\"},{\"time\":\"2019-01-28 13:10:50\",\"ftime\":\"2019-01-28 13:10:50\",\"context\":\"[许昌市]快件已发车\",\"location\":\"许昌市\"},{\"time\":\"2019-01-28 13:09:16\",\"ftime\":\"2019-01-28 13:09:16\",\"context\":\"[许昌市]快件在【许昌】已装车,准备发往 【郑州新郑集散中心】\",\"location\":\"许昌市\"},{\"time\":\"2019-01-28 12:25:03\",\"ftime\":\"2019-01-28 12:25:03\",\"context\":\"[许昌市]快件到达 【许昌】\",\"location\":\"许昌市\"},{\"time\":\"2019-01-28 12:04:09\",\"ftime\":\"2019-01-28 12:04:09\",\"context\":\"[许昌市]快件已发车\",\"location\":\"许昌市\"},{\"time\":\"2019-01-28 11:46:52\",\"ftime\":\"2019-01-28 11:46:52\",\"context\":\"[许昌市]快件在【许昌魏都瑞祥路营业点】已装车,准备发往 【许昌】\",\"location\":\"许昌市\"},{\"time\":\"2019-01-28 10:06:12\",\"ftime\":\"2019-01-28 10:06:12\",\"context\":\"[许昌市]顺丰速运 已收取快件\",\"location\":\"许昌市\"}]','shunfeng','2019-01-29 15:14:41',NULL),(26,458,NULL,0,3,'申通快递','jd999','2019-02-03 21:33:20',10,'王江波',NULL,NULL,'shentong','2019-02-03 21:33:17',NULL);
/*!40000 ALTER TABLE `zytc_order_goods_express` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_order_refund`
--

DROP TABLE IF EXISTS `zytc_order_refund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_order_refund` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `status` int(11) NOT NULL COMMENT '操作状态\n\n\n\n流程状态(refund_status)	状态名称(refund_status_name)	操作时间\n\n1	买家申请	发起了退款申请,等待卖家处理\n\n2	等待买家退货	卖家已同意退款申请,等待买家退货\n\n3	等待卖家确认收货	买家已退货,等待卖家确认收货\n\n4	等待卖家确认退款	卖家同意退款\n\n0	退款已成功	卖家退款给买家，本次维权结束\n\n-1	退款已拒绝	卖家拒绝本次退款，本次维权结束\n\n-2	退款已关闭	主动撤销退款，退款关闭\n\n-3	退款申请不通过	拒绝了本次退款申请,等待买家修改\n\n',
  `userid` int(11) NOT NULL DEFAULT '0' COMMENT '操作人id',
  `createtime` datetime DEFAULT NULL COMMENT '操作时间',
  `money` decimal(10,2) DEFAULT '0.00',
  `reason` varchar(45) DEFAULT NULL,
  `refundid` varchar(128) DEFAULT NULL,
  `refundtime` datetime DEFAULT NULL,
  `orderid` int(11) DEFAULT '0',
  `failstr` varchar(45) DEFAULT NULL,
  `type` int(11) DEFAULT '0',
  `errcode` varchar(45) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `INDEX_ORDERID` (`orderid`),
  KEY `INDEX_TYPE` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=108 COMMENT='订单商品退货退款操作表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_order_refund`
--

LOCK TABLES `zytc_order_refund` WRITE;
/*!40000 ALTER TABLE `zytc_order_refund` DISABLE KEYS */;
INSERT INTO `zytc_order_refund` VALUES (1,1,10,'2018-11-22 10:28:53',9.00,'退回预付运费','50000508782018112207236180905','2018-11-22 10:28:54',1,NULL,2,''),(2,1,14,'2018-11-22 10:42:51',9.00,'退回预付运费','50000008682018112207242682195','2018-11-22 10:42:53',2,NULL,2,''),(3,1,10,'2018-11-22 11:59:25',9.00,'退回预付运费','50000008902018112207236318796','2018-11-22 11:59:26',3,NULL,2,''),(4,1,10,'2018-11-22 14:54:13',9.00,'退回预付运费','50000108822018112207243240065','2018-11-22 15:33:42',5,'',2,''),(5,2,10,'2018-11-22 15:22:10',22.00,'送礼免单','50000108822018112207173636993','2018-11-22 15:32:33',5,'',7,''),(6,2,10,'2018-11-22 16:06:37',9.00,'退回预付运费',NULL,NULL,278,'ERROR',2,''),(7,2,10,'2018-11-22 16:06:37',33.00,'送礼免单',NULL,NULL,278,'商户订单号非法，请核实后再试',7,''),(8,2,10,'2018-11-22 16:35:00',9.00,'退回预付运费',NULL,NULL,279,'你的操作过于频繁，请稍后再试。',2,''),(9,1,10,'2018-11-22 16:35:00',33.00,'送礼免单','50000308692018112207200283540','2018-11-22 16:35:01',279,NULL,7,''),(10,1,10,'2018-11-22 16:57:26',9.00,'退回预付运费','50000408892018112207183084636','2018-11-22 16:57:27',280,NULL,2,''),(11,2,10,'2018-11-23 16:36:39',42.00,'礼物领取超时','50000408892018112307183974201','2018-11-23 16:36:40',280,'invalid refund_fee',4,''),(12,1,10,'2018-11-23 21:57:16',42.00,'取消订单','50000308692018112307191448327','2018-11-23 21:57:40',279,NULL,5,''),(13,1,10,'2018-11-23 22:30:21',42.00,'取消订单','50000408892018112307205123625','2018-11-23 22:30:22',280,NULL,5,''),(14,1,10,'2018-11-24 10:00:40',31.00,'成团失败 自动退款','50000008792018112407248471358','2018-11-24 10:00:41',281,NULL,1,''),(15,1,10,'2018-11-24 11:11:59',11.00,'成团失败 自动退款','50000508942018112407245040108','2018-11-24 11:12:00',283,NULL,1,''),(16,1,10,'2018-11-26 11:07:31',31.00,'成团失败 自动退款','50000408752018112607295113933','2018-11-26 11:07:32',285,NULL,1,''),(17,1,14,'2018-11-26 11:07:32',22.00,'成团失败 自动退款','50000608662018112607228492521','2018-11-26 11:07:34',286,NULL,1,''),(18,1,10,'2018-11-27 11:02:04',42.00,'礼物领取超时','50000408662018112707261642191','2018-11-27 11:02:05',284,NULL,4,''),(19,2,10,'2018-11-30 15:47:35',22.00,'商品售后',NULL,NULL,278,'商户订单号非法，请核实后再试',0,''),(20,1,10,'2018-11-30 21:03:48',19.00,'商品售后','50000408652018113007271568288','2018-11-30 21:03:50',287,NULL,0,''),(21,1,14,'2018-12-03 20:18:38',99.00,'成团失败 自动退款','50000608812018120307356237059','2018-12-03 20:18:40',288,NULL,1,''),(22,1,14,'2018-12-03 20:20:19',22.00,'成团失败 自动退款','50000308692018120307332963598','2018-12-03 20:20:21',289,NULL,1,''),(23,1,40,'2018-12-03 23:00:05',84.00,'成团失败 自动退款','50000208702018120307286732249','2018-12-03 23:00:06',291,NULL,1,''),(24,1,13,'2018-12-04 23:01:55',42.00,'礼物领取超时','50000008682018120407334446358','2018-12-04 23:01:56',292,NULL,4,''),(25,1,40,'2018-12-15 18:37:20',84.00,'成团失败 自动退款','50000409262018121507504427320','2018-12-15 18:37:22',301,NULL,1,''),(26,2,14,'2018-12-15 20:04:29',11.00,'成团失败 自动退款',NULL,NULL,305,'invalid refund_fee',1,''),(27,1,40,'2018-12-16 23:20:09',42.00,'成团失败 自动退款','50000409222018121607548638302','2018-12-16 23:20:10',314,NULL,1,''),(28,1,22,'2018-12-18 19:34:27',11.00,'成团失败 自动退款','50000508982018121807595155113','2018-12-18 19:34:29',318,NULL,1,''),(29,1,10,'2018-12-18 23:28:32',25.00,'送礼免单','50000709072018121807571772580','2018-12-18 23:28:33',319,NULL,7,''),(30,1,13,'2018-12-22 16:55:30',9.00,'退回预付运费','50000209042018122207660031799','2018-12-22 16:55:31',325,NULL,2,''),(31,1,10,'2018-12-23 12:32:48',50.00,'送礼免单','50000609202018122307647966755','2018-12-23 12:32:49',332,NULL,7,''),(32,1,10,'2018-12-23 17:18:09',9.00,'退回预付运费','50000009082018122307585506568','2018-12-23 17:18:11',333,NULL,2,''),(33,1,10,'2018-12-23 17:18:14',33.00,'送礼免单','50000009082018122307585601673','2018-12-23 17:18:16',333,NULL,7,''),(34,1,10,'2018-12-24 16:44:57',11.00,'礼物领取超时','50000009052018122407612641168','2018-12-24 16:44:59',323,NULL,4,''),(35,1,13,'2018-12-24 16:53:05',31.00,'礼物领取超时','50000609192018122407589743309','2018-12-24 16:53:07',324,NULL,4,''),(36,1,14,'2018-12-28 16:07:38',2.50,'退还团购折扣','50000209252018122807726017688','2018-12-28 16:07:40',321,NULL,6,''),(37,1,10,'2018-12-28 16:07:40',2.50,'退还团购折扣','50000209052018122807737551470','2018-12-28 16:07:41',340,NULL,6,''),(38,1,13,'2018-12-28 16:07:41',2.50,'退还团购折扣','50000509152018122807702686977','2018-12-28 16:07:42',341,NULL,6,''),(39,1,10,'2018-12-29 12:00:00',1.00,'退还团购折扣','50000009062018122907760520875','2018-12-29 12:00:02',343,NULL,6,''),(40,1,63,'2018-12-29 12:00:02',1.00,'退还团购折扣','50000708982018122907730550758','2018-12-29 12:00:03',344,NULL,6,''),(41,1,22,'2018-12-29 12:00:03',1.00,'退还团购折扣','50000409262018122907760379277','2018-12-29 12:00:05',346,NULL,6,''),(42,1,10,'2018-12-30 13:20:43',11.00,'成团失败 自动退款','50000309182018123007764304645','2018-12-30 13:20:45',348,NULL,1,''),(43,1,63,'2018-12-30 14:41:53',9.00,'退回预付运费','50000709072018123007746563956','2018-12-30 14:41:54',351,NULL,2,''),(44,1,63,'2018-12-30 14:41:58',33.00,'送礼免单','50000709072018123007706549379','2018-12-30 14:41:59',351,NULL,7,''),(45,1,10,'2018-12-31 10:38:45',25.00,'送礼免单','50000009222018123107777144217','2018-12-31 10:38:47',352,NULL,7,''),(46,1,22,'2019-01-02 11:52:00',11.00,'成团失败自动退款','50000509172019010207803263940','2019-01-02 11:52:02',357,NULL,1,''),(47,1,10,'2019-01-03 11:31:08',78.00,'送礼免单','50000109202019010307837414336','2019-01-03 11:31:09',360,NULL,7,''),(48,1,40,'2019-01-06 22:02:42',25.00,'取消订单','50000008972019010607862130128','2019-01-06 22:02:43',362,NULL,5,''),(49,1,10,'2019-01-07 09:06:59',78.00,'礼物领取超时','50000009362019010707896774613','2019-01-07 09:07:00',364,NULL,4,''),(50,1,10,'2019-01-09 20:03:23',3.00,'退回预付运费','50000409552019010907873024192','2019-01-09 20:03:24',387,NULL,2,''),(51,1,10,'2019-01-09 20:03:28',5.90,'送礼免单','50000409552019010907900195631','2019-01-09 20:03:29',387,NULL,7,''),(52,1,10,'2019-01-10 16:44:05',4.90,'成团失败自动退款','50000209332019011007911836251','2019-01-10 16:44:07',384,NULL,1,''),(53,2,22,'2019-01-11 18:22:50',75.00,'成团失败自动退款',NULL,NULL,391,'订单已全额退款',1,''),(54,1,22,'2019-01-11 18:25:39',75.00,'成团失败自动退款','50000009442019011107892602046','2019-01-11 18:25:41',391,NULL,1,''),(55,1,63,'2019-01-11 18:30:00',0.39,'退还团购折扣','50000709292019011107947056652','2019-01-11 18:30:02',395,NULL,6,''),(56,1,13,'2019-01-11 18:30:02',0.39,'退还团购折扣','50000309532019011107941954723','2019-01-11 18:30:03',399,NULL,6,''),(57,1,10,'2019-01-11 18:30:03',0.39,'退还团购折扣','50000309452019011107909642936','2019-01-11 18:30:05',401,NULL,6,''),(58,1,10,'2019-01-12 21:03:43',4.90,'成团失败自动退款','50000409392019011207890776687','2019-01-12 21:03:44',404,NULL,1,''),(59,1,10,'2019-01-13 16:53:40',7.90,'礼物领取超时','50000009312019011307926211215','2019-01-13 16:53:41',403,NULL,4,''),(60,1,10,'2019-01-13 21:50:29',3.00,'退回预付运费','50000509542019011307950794205','2019-01-13 21:50:30',411,NULL,2,''),(61,1,10,'2019-01-13 21:50:34',5.90,'送礼免单','50000509542019011307926806217','2019-01-13 21:50:35',411,NULL,7,''),(62,1,10,'2019-01-13 21:54:06',3.00,'退回预付运费','50000409512019011307930956967','2019-01-13 21:54:08',412,NULL,2,''),(63,1,10,'2019-01-13 21:54:11',5.90,'送礼免单','50000409512019011307950447780','2019-01-13 21:54:12',412,NULL,7,''),(64,1,10,'2019-01-15 15:55:48',2.90,'成团失败自动退款','50000609352019011507966092177','2019-01-15 15:55:50',415,NULL,1,''),(65,1,10,'2019-01-16 20:58:49',8.90,'礼物领取超时','50000309502019011608032022649','2019-01-16 20:58:50',416,NULL,4,''),(66,1,10,'2019-01-16 21:37:04',4.00,'商品售后','50000309372019011608032167181','2019-01-16 21:37:05',410,NULL,3,''),(67,1,10,'2019-01-16 22:13:00',6.00,'退回预付运费','50000009472019011607998744678','2019-01-16 22:13:01',421,NULL,2,''),(68,1,10,'2019-01-16 22:13:05',11.80,'送礼免单','50000009472019011607970891577','2019-01-16 22:13:06',421,NULL,7,''),(69,1,10,'2019-01-18 10:53:55',2.90,'成团失败自动退款','50000709312019011808039564169','2019-01-18 10:53:56',424,NULL,1,''),(70,1,13,'2019-01-20 11:23:46',3.00,'退回预付运费','50000709572019012008078083039','2019-01-20 11:23:48',434,NULL,2,''),(71,1,13,'2019-01-20 11:23:51',5.90,'送礼免单','50000709572019012008065106128','2019-01-20 11:23:53',434,NULL,7,''),(72,1,13,'2019-01-20 11:30:31',3.00,'退回预付运费','50000009592019012008078095698','2019-01-20 11:30:33',435,NULL,2,''),(73,1,10,'2019-01-20 11:56:23',3.00,'退回预付运费','50000509552019012008081909134','2019-01-20 11:56:24',442,NULL,2,''),(74,1,10,'2019-01-20 12:05:53',3.00,'退回预付运费','50000109462019012008068366589','2019-01-20 12:05:54',443,NULL,2,''),(75,1,10,'2019-01-20 12:05:58',5.90,'送礼免单','50000109462019012008078155745','2019-01-20 12:05:59',443,NULL,7,''),(76,1,10,'2019-01-21 18:22:57',3.00,'退回预付运费','50000609392019012108073460600','2019-01-21 18:22:59',446,NULL,2,''),(77,1,10,'2019-01-22 13:26:16',3.00,'退回预付运费','50000509542019012208086440829','2019-01-22 13:26:17',448,NULL,2,''),(78,1,10,'2019-01-27 16:46:07',7.00,'退回预付运费','50000209492019012708152285385','2019-01-27 16:46:08',456,NULL,2,''),(79,1,10,'2019-02-04 19:06:57',7.00,'退回预付运费','50000009602019020408245619679','2019-02-04 19:06:58',459,NULL,2,''),(80,2,10,'2019-02-07 16:04:09',22.00,'商品售后',NULL,NULL,278,'商户订单号非法，请核实后再试',3,''),(81,2,10,'2019-02-07 16:10:59',22.00,'商品售后',NULL,NULL,278,'商户订单号非法，请核实后再试',3,'');
/*!40000 ALTER TABLE `zytc_order_refund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_order_refund_process`
--

DROP TABLE IF EXISTS `zytc_order_refund_process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_order_refund_process` (
  `orderid` int(11) NOT NULL,
  `applymsg` varchar(512) DEFAULT NULL,
  `applypics` varchar(512) DEFAULT NULL,
  `receiveid` int(11) DEFAULT '0',
  `buyid` int(11) DEFAULT '0',
  `applyreason` int(11) DEFAULT '1' COMMENT '0 商品变质, 1 商家发错货,2 物流破损严重',
  `status` int(11) DEFAULT NULL,
  `refundmoney` decimal(10,2) DEFAULT NULL,
  `sendbackstatus` int(11) DEFAULT NULL,
  `sellermsg` varchar(45) DEFAULT NULL,
  `sendbackcompany` varchar(128) DEFAULT NULL,
  `sendbackcode` varchar(45) DEFAULT NULL,
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP,
  `sendbacktime` datetime DEFAULT CURRENT_TIMESTAMP,
  `refundtime` datetime DEFAULT CURRENT_TIMESTAMP,
  `refundid` int(11) DEFAULT '0',
  `shopid` int(11) DEFAULT '0',
  `applymode` int(11) DEFAULT '0' COMMENT '0 只退款 1 退货退款',
  `needjudge` int(11) DEFAULT '0',
  `customerphone` varchar(20) DEFAULT NULL,
  `ordermoney` decimal(10,2) DEFAULT '0.00',
  `shopphone` varchar(20) DEFAULT '',
  `hasreply` int(11) DEFAULT '0' COMMENT '是否曾经回复,回复过的申请将不再受时间限制.',
  PRIMARY KEY (`orderid`),
  KEY `INDEX_USEID` (`buyid`),
  KEY `INDEX_SHOPID` (`shopid`),
  KEY `INDEX_STATUS` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_order_refund_process`
--

LOCK TABLES `zytc_order_refund_process` WRITE;
/*!40000 ALTER TABLE `zytc_order_refund_process` DISABLE KEYS */;
INSERT INTO `zytc_order_refund_process` VALUES (278,'gggguugugu','http://www.imgtqcu.weiruikj.cn/tmp/wxacdc9acc9937a90b.o6zAJs7ovNRM1nCfIURMX8URcbI8.twgdgbR0u2JC2b33b2cb6ecd7e4777924eaff52cdec2.png',10,10,0,0,22.00,2,'哈哈',NULL,NULL,'2018-11-27 20:57:47',NULL,NULL,81,48,0,0,'18637468680',42.00,'18637568680',0),(287,'测试流程','http://www.imgtqcu.weiruikj.cn/tmp/wxacdc9acc9937a90b.o6zAJs7ovNRM1nCfIURMX8URcbI8.5t6wuxzTo3HIc8ef96b89b0d5f0d65df02f916707de3.png',10,10,1,7,19.00,2,NULL,'申通快递','44444445','2018-11-30 20:57:43',NULL,NULL,20,48,1,0,'18637468680',25.00,'18637568680',0),(410,'ssss','',10,10,0,7,4.00,0,NULL,NULL,NULL,'2019-01-13 21:35:04',NULL,NULL,66,48,0,0,'18637468680',9.80,'18637568680',0);
/*!40000 ALTER TABLE `zytc_order_refund_process` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_order_shipping_fee`
--

DROP TABLE IF EXISTS `zytc_order_shipping_fee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_order_shipping_fee` (
  `shipping_fee_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '运费模板ID',
  `shipping_fee_name` varchar(30) NOT NULL DEFAULT '' COMMENT '运费模板名称',
  `is_default` int(11) NOT NULL DEFAULT '0' COMMENT '是否是默认模板',
  `shop_id` int(11) NOT NULL COMMENT '店铺ID',
  `province_id_array` text NOT NULL COMMENT '省ID组',
  `weight_snum` int(11) NOT NULL DEFAULT '1' COMMENT '首重',
  `weight_sprice` int(11) NOT NULL DEFAULT '0' COMMENT '首重运费',
  `weight_xnum` int(11) NOT NULL DEFAULT '1' COMMENT '续重',
  `weight_xprice` int(11) NOT NULL DEFAULT '0' COMMENT '续重运费',
  `create_time` datetime NOT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `fee_mode` int(11) DEFAULT '1',
  PRIMARY KEY (`shipping_fee_id`),
  KEY `INDEX_SHOPID` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=5461 COMMENT='运费模板';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_order_shipping_fee`
--

LOCK TABLES `zytc_order_shipping_fee` WRITE;
/*!40000 ALTER TABLE `zytc_order_shipping_fee` DISABLE KEYS */;
INSERT INTO `zytc_order_shipping_fee` VALUES (6,'ceshi',0,48,'9,10,11,12,14',1,8,1,2,'2018-07-13 10:04:52','2018-07-13 16:54:59',1),(7,'北京',0,48,'2,3,4,5,15,1',1,3,1,2,'2018-07-13 10:07:54','2019-01-09 17:20:06',1);
/*!40000 ALTER TABLE `zytc_order_shipping_fee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_order_shop`
--

DROP TABLE IF EXISTS `zytc_order_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_order_shop` (
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `shop_id` int(11) DEFAULT '0' COMMENT '卖家店铺id',
  `shop_name` varchar(100) DEFAULT '' COMMENT '卖家店铺名称',
  `shopcontact` varchar(20) DEFAULT '',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_order_shop`
--

LOCK TABLES `zytc_order_shop` WRITE;
/*!40000 ALTER TABLE `zytc_order_shop` DISABLE KEYS */;
INSERT INTO `zytc_order_shop` VALUES (1,48,'许昌特产','18637568680'),(2,48,'许昌特产','18637568680'),(3,48,'许昌特产','18637568680'),(4,48,'许昌特产','18637568680'),(5,48,'许昌特产','18637568680'),(6,48,'许昌特产','18637568680'),(278,48,'许昌特产','18637568680'),(279,48,'许昌特产','18637568680'),(280,48,'许昌特产','18637568680'),(281,48,'许昌特产','18637568680'),(283,48,'许昌特产','18637568680'),(284,48,'许昌特产','18637568680'),(285,48,'许昌特产','18637568680'),(286,48,'许昌特产','18637568680'),(287,48,'许昌特产','18637568680'),(288,48,'许昌特产','18637568680'),(289,48,'许昌特产','18637568680'),(290,48,'许昌特产','18637568680'),(291,48,'许昌特产','18637568680'),(292,48,'许昌特产','18637568680'),(294,48,'许昌特产','18637568680'),(295,48,'许昌特产','18637568680'),(298,48,'许昌特产','18637568680'),(299,48,'许昌特产','18637568680'),(300,48,'许昌特产','18637568680'),(301,48,'许昌特产','18637568680'),(302,48,'许昌特产','18637568680'),(303,48,'许昌特产','18637568680'),(304,48,'许昌特产','18637568680'),(305,48,'许昌特产','18637568680'),(306,48,'许昌特产','18637568680'),(307,48,'许昌特产','18637568680'),(308,48,'许昌特产','18637568680'),(309,48,'许昌特产','18637568680'),(310,48,'许昌特产','18637568680'),(311,48,'许昌特产','18637568680'),(312,48,'许昌特产','18637568680'),(313,48,'许昌特产','18637568680'),(314,48,'许昌特产','18637568680'),(315,48,NULL,'18637568680'),(316,48,'许昌特产','18637568680'),(317,48,'许昌特产','18637568680'),(318,48,'许昌特产','18637568680'),(319,48,'许昌特产','18637568680'),(320,48,'许昌特产','18637568680'),(321,48,'许昌特产','18637568680'),(322,48,'许昌特产','18637568680'),(323,48,'许昌特产','18637568680'),(324,48,'许昌特产','18637568680'),(325,48,'许昌特产','18637568680'),(326,48,'许昌特产','18637568680'),(327,48,'许昌特产','18637568680'),(328,48,'许昌特产','18637568680'),(329,48,'许昌特产','18637568680'),(330,48,'许昌特产','18637568680'),(331,48,'许昌特产','18637568680'),(332,48,'许昌特产','18637568680'),(333,48,'许昌特产','18637568680'),(334,48,'许昌特产','18637568680'),(335,48,'许昌特产','18637568680'),(336,48,'许昌特产','18637568680'),(337,48,'许昌特产','18637568680'),(338,48,'许昌特产','18637568680'),(339,48,'许昌特产','18637568680'),(340,48,'许昌特产','18637568680'),(341,48,'许昌特产','18637568680'),(342,48,'许昌特产','18637568680'),(343,48,'许昌特产','18637568680'),(344,48,'许昌特产','18637568680'),(345,48,'许昌特产','18637568680'),(346,48,'许昌特产','18637568680'),(347,48,'许昌特产','18637568680'),(348,48,'许昌特产','18637568680'),(349,48,'许昌特产','18637568680'),(350,48,'许昌特产','18637568680'),(351,48,'许昌特产','18637568680'),(352,48,'许昌特产','18637568680'),(353,48,'许昌特产','18637568680'),(354,48,'许昌特产','18637568680'),(355,48,'许昌特产','18637568680'),(356,48,'许昌特产','18637568680'),(357,48,'许昌特产','18637568680'),(358,48,'许昌特产','18637568680'),(359,48,'许昌特产','18637568680'),(360,48,'许昌特产','18637568680'),(361,48,'许昌特产','18637568680'),(362,48,'许昌特产','18637568680'),(363,48,'许昌特产','18637568680'),(364,48,'许昌特产','18637568680'),(365,48,'许昌特产','18637568680'),(366,53,'新疆阿克苏','18637468680'),(367,48,'许昌特产','18637568680'),(368,53,'新疆阿克苏','18637468680'),(370,48,'许昌特产','18637568680'),(371,48,'许昌特产','18637568680'),(373,48,'许昌特产','18637568680'),(374,48,'许昌特产','18637568680'),(376,48,'许昌特产','18637568680'),(378,48,'许昌特产','18637568680'),(382,48,'许昌特产','18637568680'),(384,48,'许昌特产','18637568680'),(387,48,'许昌特产','18637568680'),(389,48,'许昌特产','18637568680'),(390,48,'许昌特产','18637568680'),(391,48,'许昌特产','18637568680'),(392,48,'许昌特产','18637568680'),(395,48,'许昌特产','18637568680'),(396,48,'许昌特产','18637568680'),(397,48,'许昌特产','18637568680'),(398,48,'许昌特产','18637568680'),(399,48,'许昌特产','18637568680'),(401,48,'许昌特产','18637568680'),(402,48,'许昌特产','18637568680'),(403,48,'许昌特产','18637568680'),(404,48,'许昌特产','18637568680'),(405,48,'许昌特产','18637568680'),(406,48,'许昌特产','18637568680'),(407,48,'许昌特产','18637568680'),(408,48,'许昌特产','18637568680'),(410,48,'许昌特产','18637568680'),(411,48,'许昌特产','18637568680'),(412,48,'许昌特产','18637568680'),(413,48,'许昌特产','18637568680'),(414,48,'许昌特产','18637568680'),(415,48,'许昌特产','18637568680'),(416,48,'许昌特产','18637568680'),(417,48,'许昌特产','18637568680'),(418,48,'许昌特产','18637568680'),(419,48,'许昌特产','18637568680'),(420,48,'许昌特产','18637568680'),(421,48,'许昌特产','18637568680'),(422,48,'许昌特产','18637568680'),(423,48,'许昌特产','18637568680'),(424,48,'许昌特产','18637568680'),(425,48,'许昌特产','18637568680'),(426,48,'许昌特产','18637568680'),(427,48,'许昌特产','18637568680'),(428,48,'许昌特产','18637568680'),(429,48,'许昌特产','18637568680'),(430,48,'许昌特产','18637568680'),(432,48,'许昌特产','18637568680'),(433,48,'许昌特产','18637568680'),(434,48,'许昌特产','18637568680'),(435,48,'许昌特产','18637568680'),(442,48,'许昌特产','18637568680'),(443,48,'许昌特产','18637568680'),(444,48,'许昌特产','18637568680'),(446,48,'许昌特产','18637568680'),(447,48,'许昌特产','18637568680'),(448,48,'许昌特产','18637568680'),(450,48,'许昌特产','18637568680'),(451,48,'许昌特产','18637568680'),(452,48,'许昌特产','18637568680'),(454,48,'许昌特产','18637568680'),(456,48,'许昌特产','18637568680'),(457,48,'许昌特产','18637568680'),(458,48,'许昌特产','18637568680'),(459,48,'许昌特产','18637568680'),(467,48,'许昌特产','18637568680'),(469,48,NULL,'18637568680'),(477,48,NULL,'18637568680');
/*!40000 ALTER TABLE `zytc_order_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_order_shop_return`
--

DROP TABLE IF EXISTS `zytc_order_shop_return`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_order_shop_return` (
  `shop_id` int(11) NOT NULL,
  `shop_address` varchar(255) NOT NULL DEFAULT '' COMMENT '商家地址',
  `seller_name` varchar(50) NOT NULL DEFAULT '' COMMENT '收件人',
  `seller_mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '收件人手机号',
  `seller_zipcode` varchar(20) NOT NULL DEFAULT '' COMMENT '邮编',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='店铺退货设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_order_shop_return`
--

LOCK TABLES `zytc_order_shop_return` WRITE;
/*!40000 ALTER TABLE `zytc_order_shop_return` DISABLE KEYS */;
INSERT INTO `zytc_order_shop_return` VALUES (48,'河南省许昌市龙湖西苑小区2116','王江波','18637468680','461000','2018-07-30 11:02:34','2018-07-30 11:08:58');
/*!40000 ALTER TABLE `zytc_order_shop_return` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_pickup_point`
--

DROP TABLE IF EXISTS `zytc_pickup_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_pickup_point` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `name` varchar(255) NOT NULL COMMENT '自提点名称',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '自提点地址',
  `contact` varchar(255) NOT NULL DEFAULT '' COMMENT '联系人',
  `phone` varchar(255) NOT NULL DEFAULT '' COMMENT '联系电话',
  `city_id` int(11) NOT NULL COMMENT '市ID',
  `province_id` int(11) NOT NULL COMMENT '省ID',
  `district_id` int(11) NOT NULL COMMENT '区县ID',
  `supplier_id` int(11) NOT NULL DEFAULT '0' COMMENT '供应门店ID',
  `longitude` varchar(255) NOT NULL DEFAULT '' COMMENT '经度',
  `latitude` varchar(255) NOT NULL DEFAULT '' COMMENT '维度',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `cityname` varchar(45) DEFAULT NULL,
  `provincename` varchar(45) DEFAULT NULL,
  `districtname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=4096 COMMENT='自提点管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_pickup_point`
--

LOCK TABLES `zytc_pickup_point` WRITE;
/*!40000 ALTER TABLE `zytc_pickup_point` DISABLE KEYS */;
INSERT INTO `zytc_pickup_point` VALUES (8,48,'许昌西仓库','龙湖西苑商品楼西侧','王江波','18637468680',161,16,1453,0,'','','2019-01-07 10:33:26','许昌市','河南省','魏都区');
/*!40000 ALTER TABLE `zytc_pickup_point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_promotion_discount`
--

DROP TABLE IF EXISTS `zytc_promotion_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_promotion_discount` (
  `discount_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shop_id` int(11) NOT NULL DEFAULT '1' COMMENT '店铺ID',
  `shop_name` varchar(50) NOT NULL DEFAULT '' COMMENT '店铺名称',
  `discount_name` varchar(255) NOT NULL DEFAULT '' COMMENT '活动名称',
  `start_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '开始时间',
  `end_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '结束时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '活动状态(0-未发布/1-正常/3-关闭/4-结束)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` text NOT NULL COMMENT '备注',
  `type` int(11) DEFAULT '1' COMMENT '1. 店铺折扣  2.平台长期活动 3.平台限时活动',
  `pid` int(11) DEFAULT '0',
  `level` int(11) DEFAULT '1',
  `is_visible` int(11) DEFAULT '0',
  PRIMARY KEY (`discount_id`),
  KEY `INDEX_SHOPID` (`shop_id`),
  KEY `INDEX_PID` (`pid`),
  KEY `INDEX_LEVEL` (`level`),
  KEY `INDEX_TYPE` (`type`),
  KEY `INDEX_STATUS` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=4096 COMMENT='限时折扣';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_promotion_discount`
--

LOCK TABLES `zytc_promotion_discount` WRITE;
/*!40000 ALTER TABLE `zytc_promotion_discount` DISABLE KEYS */;
INSERT INTO `zytc_promotion_discount` VALUES (11,0,'niushop开源商城','10.1特惠','2018-09-30 15:45:00','2018-10-08 15:45:00',4,'2018-09-28 15:46:01','2018-09-28 15:51:49','',3,0,0,1),(12,0,'niushop开源商城','惠农专区','2018-01-01 00:00:00','2999-01-01 00:00:00',5,'2018-10-01 16:08:58','2018-10-01 16:14:50','',2,0,0,1),(13,0,'niushop开源商城','超值清仓','2018-01-01 00:00:00','2999-01-01 00:00:00',5,'2018-10-01 16:08:58','2018-10-01 16:14:50','',2,0,0,1),(14,48,'许昌特产','惠农专区','2018-11-07 17:00:00','2018-11-18 15:00:00',6,'2018-11-07 16:06:41','2018-11-07 16:13:28','',2,12,1,1);
/*!40000 ALTER TABLE `zytc_promotion_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_promotion_discount_goods`
--

DROP TABLE IF EXISTS `zytc_promotion_discount_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_promotion_discount_goods` (
  `discount_goods_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `discount_id` int(11) NOT NULL COMMENT '对应活动',
  `start_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '开始时间',
  `end_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '结束时间',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `discount` decimal(10,2) NOT NULL COMMENT '活动折扣或者减现信息',
  `goods_name` varchar(255) NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_picture` int(11) NOT NULL COMMENT '商品图片',
  `pid` int(11) DEFAULT '0',
  `discount_name` varchar(45) DEFAULT '',
  PRIMARY KEY (`discount_goods_id`),
  KEY `INDEX_DISCOUNTID` (`discount_id`),
  KEY `INDEX_GOODSID` (`goods_id`),
  KEY `INDEX_STATUS` (`status`),
  KEY `INDEX_PID` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=712 COMMENT='限时折扣商品列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_promotion_discount_goods`
--

LOCK TABLES `zytc_promotion_discount_goods` WRITE;
/*!40000 ALTER TABLE `zytc_promotion_discount_goods` DISABLE KEYS */;
INSERT INTO `zytc_promotion_discount_goods` VALUES (15,14,'2018-11-07 17:00:00','2018-11-18 15:00:00',404,6,9.20,'许昌腐竹',1980,12,'');
/*!40000 ALTER TABLE `zytc_promotion_discount_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_promotion_gift`
--

DROP TABLE IF EXISTS `zytc_promotion_gift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_promotion_gift` (
  `gift_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '赠品活动id ',
  `start_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '赠品有效期开始时间',
  `end_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '赠品有效期结束时间',
  `days` int(10) unsigned NOT NULL COMMENT '领取有效期(多少天)',
  `max_num` int(11) NOT NULL DEFAULT '1' COMMENT '总数',
  `ownerid` int(11) NOT NULL COMMENT '店铺id',
  `gift_name` varchar(255) NOT NULL COMMENT '赠品活动名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `status` int(11) DEFAULT '0' COMMENT '0未申请 1 已申请 2 申请通过 3申请未通过 4 可展示 5 已经开始 6已经出奖 7已经结束',
  `goods_id` int(11) DEFAULT '0',
  `goods_name` varchar(45) DEFAULT '',
  `goods_picture` varchar(512) DEFAULT '',
  `ownername` varchar(45) NOT NULL COMMENT '赠品活动名称',
  `remarks` varchar(45) DEFAULT '',
  `mode` int(11) DEFAULT '0',
  `parms` varchar(256) DEFAULT '',
  `result` varchar(2048) DEFAULT '',
  `count` int(11) DEFAULT '0' COMMENT '已领',
  `participate` int(11) DEFAULT '0' COMMENT '参加数量',
  `goods_price` decimal(19,2) DEFAULT '0.00' COMMENT '商品价格',
  `ownerpic` varchar(512) DEFAULT NULL,
  `personas` text,
  `appointment` int(11) DEFAULT '0',
  `giftfrom` int(11) DEFAULT '0',
  `user_propagate` text,
  `qrpic` varchar(256) DEFAULT NULL,
  `extra` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`gift_id`),
  KEY `INDEX_SHOPID` (`ownerid`),
  KEY `INDEX_STATUS` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='赠品活动表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_promotion_gift`
--

LOCK TABLES `zytc_promotion_gift` WRITE;
/*!40000 ALTER TABLE `zytc_promotion_gift` DISABLE KEYS */;
INSERT INTO `zytc_promotion_gift` VALUES (51,'2018-12-27 12:07:32','2018-12-28 12:06:00',30,1,10,'测试生成朋友圈','2018-12-27 12:07:32','2018-12-27 12:08:08',6,NULL,'1','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_userlottery/u10_1545883689920','王江波','',1,'{}','[{\"uid\":10,\"name\":\"王江波\",\"pic\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132\",\"oid\":\"0\",\"token\":\"0\"}]',0,1,0.00,'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132','',0,1,'{\"drawmode\":\"0\",\"drawvalue\":\"看看\",\"ownerphone\":\"18637468680\",\"propagatesetting\":{\"id\":202,\"uid\":10,\"type\":2,\"name\":\"测试地址\",\"introduction\":\"销售许昌地区各种特产小吃，有禹州的红薯粉条，杂珂，银梅可乐，长葛的腐竹蜂蜜，襄县的猪蹄，欢迎大家光临选购。\",\"spreadvalue\":\"许昌市龙湖西宛\",\"isdefault\":1,\"propagatesettingindex\":\"1\"}}','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_lottery/id_51_1545883751278',NULL),(52,'2018-12-27 18:01:00','2018-12-29 16:01:00',30,1,48,'从后台发起','2018-12-27 16:02:07','2018-12-27 16:02:07',6,407,'苹果','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1545895534','许昌特产','10斤装',3,'{\"chance\":\"10\",\"solution\":9}','',0,2,25.00,'http://www.imgtqbu.weiruikj.cn/Fs32xo_EjWT7D_a1Ry1gmDsQKx9v',NULL,3,0,NULL,'https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_lottery/id_52_1545897749186',NULL),(53,'2018-12-27 16:48:02','2018-12-27 16:46:18',30,1,10,'测试图片','2018-12-27 16:48:02','2018-12-27 16:48:02',6,NULL,'哈哈哈别想多了','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_userlottery/u10_1545900483748','王江波','',2,'{\"chance\":\"5\",\"solution\":2}','[{\"uid\":13,\"name\":\"会敏\",\"pic\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJkribhRyDNNmIA9gibbXEus80nqGvexn9zKUtYos8OWY30AB8VgyU2MArZA7tHwpbPlUKkFGdkNqdw/132\",\"oid\":\"0\",\"token\":\"0\"}]',1,7,0.00,'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132','',0,1,'{\"drawmode\":\"2\",\"drawvalue\":\"许昌市区自取\",\"ownerphone\":\"18637468680\",\"propagatesetting\":{\"id\":201,\"uid\":10,\"type\":0,\"name\":\"小程序开发\",\"introduction\":\"小伙伴们，我是个独立开发者，主要专注于微信小程通过社交进行推广和营销的解决方案，有想法和需要的朋友可以加我聊聊。\",\"spreadvalue\":\"w18637468680\",\"isdefault\":0}}','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_lottery/id_53_1545900514507',NULL),(54,'2018-12-29 13:21:51','2018-12-29 13:19:58',30,1,10,'测试配送地址','2018-12-29 13:21:51','2018-12-29 13:21:51',5,NULL,'哈哈','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_userlottery/u10_1546060913509','王江波','',3,'{\"chance\":\"5\",\"solution\":0}','',0,2,0.00,'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132','',0,1,'{\"drawmode\":\"0\",\"drawvalue\":\"全国包邮\",\"ownerphone\":\"18637468680\",\"propagatesetting\":{\"id\":201,\"uid\":10,\"type\":0,\"name\":\"小程序开发\",\"introduction\":\"小伙伴们，我是个独立开发者，主要专注于微信小程通过社交进行推广和营销的解决方案，有想法和需要的朋友可以加我聊聊。\",\"spreadvalue\":\"w18637468680\",\"isdefault\":0}}','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_lottery/id_54_1546060964434',NULL),(55,'2019-01-04 15:19:05','2019-01-04 15:16:46',30,1,10,'再次测下满人','2019-01-04 15:19:05','2019-01-04 15:19:05',6,NULL,'一朵太阳花','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_userlottery/u10_1546586344258','王江波','',4,'{\"num\":\"5\"}','[{\"uid\":10,\"name\":\"王江波\",\"pic\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132\",\"oid\":\"0\",\"token\":\"0\"}]',0,5,0.00,'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132','',0,1,'{\"drawmode\":\"2\",\"drawvalue\":\"许昌魏都区西区自取\",\"ownerphone\":\"18637468680\",\"propagatesetting\":{\"id\":201,\"uid\":10,\"type\":0,\"name\":\"小程序开发\",\"introduction\":\"小伙伴们，我是个独立开发者，主要专注于微信小程通过社交进行推广和营销的解决方案，有想法和需要的朋友可以加我聊聊。\",\"spreadvalue\":\"w18637468680\",\"isdefault\":0}}','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_lottery/id_55_1546586443862',NULL),(56,'2019-01-10 17:45:00','2019-01-11 18:00:00',30,1,48,'即将上线','2019-01-10 16:46:20','2019-01-10 16:46:20',6,409,'榆林小米','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547008376','许昌特产','测试商品',3,'{\"chance\":\"12\",\"solution\":3}','',0,5,5.90,'http://www.imgtqbu.weiruikj.cn/Fs32xo_EjWT7D_a1Ry1gmDsQKx9v',NULL,2,0,NULL,'https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_lottery/id_56_1547111300855',NULL),(59,'2019-01-22 21:13:42','2019-01-22 21:11:37',30,10,14,'冰糖心苹果','2019-01-22 21:13:42','2019-01-22 21:13:42',5,NULL,'阿克苏','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_userlottery/u14_1548162821576','胡林林','',4,'{\"num\":\"5\"}','',0,1,0.00,'https://wx.qlogo.cn/mmopen/vi_32/ajNVdqHZLLBPWYY8zd1Mq59HA2xZu1M7WMELVl6yJFhq8pf5nBNyG2IJdkqobCMlpCibQgMictn8nCSo71HWRpMg/132','',0,1,'{\"drawmode\":\"2\",\"drawvalue\":\"自提\",\"ownerphone\":\"18637471928\"}','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_lottery/id_59_1548163127651',NULL),(60,'2019-01-28 16:29:49','2019-01-28 16:28:34',30,1,10,'再测一下','2019-01-28 16:29:49','2019-01-28 16:29:49',6,NULL,'测试商品','','王江波','',3,'{\"chance\":\"5\",\"solution\":1}','[{\"uid\":10,\"name\":\"王江波\",\"pic\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132\",\"oid\":\"0\",\"token\":\"0\"}]',1,2,0.00,'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132','',0,1,'{\"drawmode\":\"2\",\"drawvalue\":\"许昌魏都区自取\",\"ownerphone\":\"18637468680\",\"propagatesetting\":{\"id\":206,\"uid\":10,\"type\":0,\"name\":\"个人微信特产\",\"introduction\":\"线上经营许昌地区特产小吃，包括禹州红薯粉制品，许昌腐竹制品等，需要的朋友或者经营生产的厂家可以联系我哦。\",\"spreadvalue\":\"w18637468680\",\"isdefault\":1,\"propagatesettingindex\":0}}','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_lottery/id_60_1548669091912',NULL),(61,'2019-01-28 18:16:47','2019-01-28 18:11:48',30,1,10,'买特产找我吧','2019-01-28 18:16:47','2019-01-28 18:16:47',6,NULL,'许昌大商白蛇缘起电影票2张','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_userlottery/u10_1548670610788','王江波','',3,'{\"chance\":\"199\",\"solution\":154}','',0,31,0.00,'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132','',0,1,'{\"drawmode\":\"2\",\"drawvalue\":\"1-30晚19点前许昌市区联系我领取\",\"ownerphone\":\"18637468680\",\"propagatesetting\":{\"id\":206,\"uid\":10,\"type\":0,\"name\":\"个人微信特产\",\"introduction\":\"线上经营许昌地区特产小吃，包括禹州红薯粉制品，许昌腐竹制品等，需要的朋友或者经营生产的厂家可以联系我哦。\",\"spreadvalue\":\"w18637468680\",\"isdefault\":1,\"propagatesettingindex\":0}}','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_lottery/id_61_1548670653415',NULL),(62,'2019-02-15 22:56:30','2019-02-16 17:56:00',30,1,48,'榆林小米','2019-02-15 17:56:31','2019-02-15 18:11:17',6,409,'原产榆林小米 1斤试吃装 粒粒金黄 颗颗饱满',NULL,'田趣小集','',1,'{}','',0,0,0.00,'http://www.imgtqbu.weiruikj.cn/Fs32xo_EjWT7D_a1Ry1gmDsQKx9v','',0,0,'','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_lottery/id_62_1550237281531',NULL),(63,'2019-02-16 21:28:00','2019-02-17 21:28:00',30,1,48,'测试','2019-02-15 21:29:23','2019-02-15 21:29:23',3,408,'禹州红薯粉条','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1546412892','许昌特产',NULL,2,'{\"chance\":\"10\",\"solution\":9}','',0,0,85.00,'http://www.imgtqbu.weiruikj.cn/Fs32xo_EjWT7D_a1Ry1gmDsQKx9v',NULL,0,0,NULL,NULL,NULL),(64,'2019-02-18 14:57:00','2019-02-19 10:57:00',30,1,48,'榆林小米','2019-02-18 10:58:07','2019-02-18 10:58:07',6,411,'禹州红薯粉条','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1548300715','许昌特产','测试schedule',1,'0','[{\"uid\":10,\"name\":\"王江波\",\"pic\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132\",\"oid\":477,\"token\":\"912016710C716DE295CDFA99C7CE3CF8\"}]',0,1,65.00,'http://www.imgtqbu.weiruikj.cn/Fs32xo_EjWT7D_a1Ry1gmDsQKx9v',NULL,0,0,NULL,'https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_lottery/id_64_1550458905782',NULL),(65,'2019-02-18 12:15:00','2019-02-18 22:51:00',30,1,48,'继续测试','2019-02-18 11:51:52','2019-02-18 11:51:52',6,404,'许昌腐竹','http://www.imgtqbu.weiruikj.cn/FpGOcIzreoJXdcWegmJ3lKioQG4E','许昌特产','111',1,'0','[{\"uid\":14,\"name\":\"胡林林\",\"pic\":\"https://wx.qlogo.cn/mmopen/vi_32/ajNVdqHZLLBPWYY8zd1Mq59HA2xZu1M7WMELVl6yJFhq8pf5nBNyG2IJdkqobCMlpCibQgMictn8nCSo71HWRpMg/132\",\"oid\":460,\"token\":\"05E74315438AE44441E823C77345DE55\"}]',0,1,32.00,'http://www.imgtqbu.weiruikj.cn/Fs32xo_EjWT7D_a1Ry1gmDsQKx9v',NULL,0,0,NULL,'https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_lottery/id_65_1550461971833',NULL),(66,'2019-02-18 17:21:34','2019-02-19 17:20:00',30,1,10,'测试图片','2019-02-18 17:21:34','2019-02-18 17:21:34',0,NULL,'哈哈哈哈哈','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_userlottery/u10_1550481693832','王江波','',1,'{}','',0,0,0.00,'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDhKdiaucrcHI3oWX3uIx71iatjy1gunGeiaNeEz7j46TlGdqRgJpYNH4V5LwNQmeuBCK25biauFdptA/132','',0,1,'{\"drawmode\":\"0\",\"drawvalue\":\"三生三世\",\"ownerphone\":\"11111\",\"propagatesetting\":{\"id\":206,\"uid\":10,\"type\":0,\"name\":\"个人微信特产\",\"introduction\":\"线上经营许昌地区特产小吃，包括禹州红薯粉制品，许昌腐竹制品等，需要的朋友或者经营生产的厂家可以联系我哦。\",\"spreadvalue\":\"w18637468680\",\"isdefault\":1,\"propagatesettingindex\":0}}',NULL,NULL);
/*!40000 ALTER TABLE `zytc_promotion_gift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_promotion_gift_goods`
--

DROP TABLE IF EXISTS `zytc_promotion_gift_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_promotion_gift_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id ',
  `gift_id` int(10) unsigned NOT NULL COMMENT '赠品id ',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `goods_picture` varchar(100) NOT NULL COMMENT '商品图片',
  PRIMARY KEY (`id`),
  KEY `INDEX_GIFTID` (`gift_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='商品赠品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_promotion_gift_goods`
--

LOCK TABLES `zytc_promotion_gift_goods` WRITE;
/*!40000 ALTER TABLE `zytc_promotion_gift_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `zytc_promotion_gift_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_region`
--

DROP TABLE IF EXISTS `zytc_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_region` (
  `region_id` int(11) NOT NULL AUTO_INCREMENT,
  `region_name` varchar(50) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '2',
  `level` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`region_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3438 DEFAULT CHARSET=gbk COMMENT='配送地区';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_region`
--

LOCK TABLES `zytc_region` WRITE;
/*!40000 ALTER TABLE `zytc_region` DISABLE KEYS */;
INSERT INTO `zytc_region` VALUES (3,'安徽',1,2,1),(16,'江苏',1,2,1),(25,'上海',1,2,1),(31,'浙江',1,2,1),(4,'福建',1,2,1),(6,'广东',1,2,1),(7,'广西',1,2,1),(9,'海南',1,2,1),(11,'河南',1,2,1),(13,'湖北',1,2,1),(14,'湖南',1,2,1),(17,'江西',1,2,1),(5,'甘肃',1,2,1),(20,'宁夏',1,2,1),(24,'陕西',1,2,1),(8,'贵州',1,2,1),(26,'四川',1,2,1),(28,'西藏',1,2,1),(30,'云南',1,2,1),(32,'重庆',1,2,1),(2,'北京',1,2,1),(10,'河北',1,2,1),(19,'内蒙古',1,2,1),(22,'山东',1,2,1),(23,'山西',1,2,1),(27,'天津',1,2,1),(12,'黑龙江',1,2,1),(15,'吉林',1,2,1),(18,'辽宁',1,2,1),(36,'安庆',3,2,2),(37,'蚌埠',3,2,2),(38,'巢湖',3,2,2),(39,'池州',3,2,2),(40,'滁州',3,2,2),(41,'阜阳',3,2,2),(42,'淮北',3,2,2),(43,'淮南',3,2,2),(44,'黄山',3,2,2),(45,'六安',3,2,2),(46,'马鞍山',3,2,2),(47,'宿州',3,2,2),(48,'铜陵',3,2,2),(49,'芜湖',3,2,2),(50,'宣城',3,2,2),(51,'亳州',3,2,2),(220,'南京',16,2,2),(221,'苏州',16,2,2),(222,'无锡',16,2,2),(223,'常州',16,2,2),(224,'淮安',16,2,2),(225,'连云港',16,2,2),(226,'南通',16,2,2),(227,'宿迁',16,2,2),(228,'泰州',16,2,2),(229,'徐州',16,2,2),(230,'盐城',16,2,2),(231,'扬州',16,2,2),(232,'镇江',16,2,2),(321,'上海',25,2,2),(383,'杭州',31,2,2),(384,'湖州',31,2,2),(385,'嘉兴',31,2,2),(386,'金华',31,2,2),(387,'丽水',31,2,2),(388,'宁波',31,2,2),(389,'绍兴',31,2,2),(390,'台州',31,2,2),(391,'温州',31,2,2),(392,'舟山',31,2,2),(393,'衢州',31,2,2),(3401,'合肥',3,2,2),(53,'福州',4,2,2),(54,'龙岩',4,2,2),(55,'南平',4,2,2),(56,'宁德',4,2,2),(57,'莆田',4,2,2),(58,'泉州',4,2,2),(59,'三明',4,2,2),(60,'厦门',4,2,2),(61,'漳州',4,2,2),(76,'广州',6,2,2),(77,'深圳',6,2,2),(78,'潮州',6,2,2),(79,'东莞',6,2,2),(80,'佛山',6,2,2),(81,'河源',6,2,2),(82,'惠州',6,2,2),(83,'江门',6,2,2),(84,'揭阳',6,2,2),(85,'茂名',6,2,2),(86,'梅州',6,2,2),(87,'清远',6,2,2),(88,'汕头',6,2,2),(89,'汕尾',6,2,2),(90,'韶关',6,2,2),(91,'阳江',6,2,2),(92,'云浮',6,2,2),(93,'湛江',6,2,2),(94,'肇庆',6,2,2),(95,'中山',6,2,2),(96,'珠海',6,2,2),(97,'南宁',7,2,2),(98,'桂林',7,2,2),(99,'百色',7,2,2),(100,'北海',7,2,2),(101,'崇左',7,2,2),(102,'防城港',7,2,2),(103,'贵港',7,2,2),(104,'河池',7,2,2),(105,'贺州',7,2,2),(106,'来宾',7,2,2),(107,'柳州',7,2,2),(108,'钦州',7,2,2),(109,'梧州',7,2,2),(110,'玉林',7,2,2),(120,'海口',9,2,2),(121,'三亚',9,2,2),(122,'白沙',9,2,2),(123,'保亭',9,2,2),(124,'昌江',9,2,2),(125,'澄迈县',9,2,2),(126,'定安县',9,2,2),(127,'东方',9,2,2),(128,'乐东',9,2,2),(129,'临高县',9,2,2),(130,'陵水',9,2,2),(131,'琼海',9,2,2),(132,'琼中',9,2,2),(133,'屯昌县',9,2,2),(134,'万宁',9,2,2),(135,'文昌',9,2,2),(136,'五指山',9,2,2),(137,'儋州',9,2,2),(149,'郑州',11,2,2),(150,'洛阳',11,2,2),(151,'开封',11,2,2),(152,'安阳',11,2,2),(153,'鹤壁',11,2,2),(154,'济源',11,2,2),(155,'焦作',11,2,2),(156,'南阳',11,2,2),(157,'平顶山',11,2,2),(158,'三门峡',11,2,2),(159,'商丘',11,2,2),(160,'新乡',11,2,2),(161,'信阳',11,2,2),(162,'许昌',11,2,2),(163,'周口',11,2,2),(164,'驻马店',11,2,2),(165,'漯河',11,2,2),(166,'濮阳',11,2,2),(180,'武汉',13,2,2),(181,'仙桃',13,2,2),(182,'鄂州',13,2,2),(183,'黄冈',13,2,2),(184,'黄石',13,2,2),(185,'荆门',13,2,2),(186,'荆州',13,2,2),(187,'潜江',13,2,2),(188,'神农架林区',13,2,2),(189,'十堰',13,2,2),(190,'随州',13,2,2),(191,'天门',13,2,2),(192,'咸宁',13,2,2),(193,'襄阳',13,2,2),(194,'孝感',13,2,2),(195,'宜昌',13,2,2),(196,'恩施',13,2,2),(197,'长沙',14,2,2),(198,'张家界',14,2,2),(199,'常德',14,2,2),(200,'郴州',14,2,2),(201,'衡阳',14,2,2),(202,'怀化',14,2,2),(203,'娄底',14,2,2),(204,'邵阳',14,2,2),(205,'湘潭',14,2,2),(206,'湘西',14,2,2),(207,'益阳',14,2,2),(208,'永州',14,2,2),(209,'岳阳',14,2,2),(210,'株洲',14,2,2),(233,'南昌',17,2,2),(234,'抚州',17,2,2),(235,'赣州',17,2,2),(236,'吉安',17,2,2),(237,'景德镇',17,2,2),(238,'九江',17,2,2),(239,'萍乡',17,2,2),(240,'上饶',17,2,2),(241,'新余',17,2,2),(242,'宜春',17,2,2),(243,'鹰潭',17,2,2),(62,'兰州',5,2,2),(63,'白银',5,2,2),(64,'定西',5,2,2),(65,'甘南',5,2,2),(66,'嘉峪关',5,2,2),(67,'金昌',5,2,2),(68,'酒泉',5,2,2),(69,'临夏',5,2,2),(70,'陇南',5,2,2),(71,'平凉',5,2,2),(72,'庆阳',5,2,2),(73,'天水',5,2,2),(74,'武威',5,2,2),(75,'张掖',5,2,2),(270,'银川',20,2,2),(271,'固原',20,2,2),(272,'石嘴山',20,2,2),(273,'吴忠',20,2,2),(274,'中卫',20,2,2),(311,'西安',24,2,2),(312,'安康',24,2,2),(313,'宝鸡',24,2,2),(314,'汉中',24,2,2),(315,'商洛',24,2,2),(316,'铜川',24,2,2),(317,'渭南',24,2,2),(318,'咸阳',24,2,2),(319,'延安',24,2,2),(320,'榆林',24,2,2),(111,'贵阳',8,2,2),(112,'安顺',8,2,2),(113,'毕节',8,2,2),(114,'六盘水',8,2,2),(115,'黔东南',8,2,2),(116,'黔南',8,2,2),(117,'黔西南',8,2,2),(118,'铜仁',8,2,2),(119,'遵义',8,2,2),(322,'成都',26,2,2),(323,'绵阳',26,2,2),(324,'阿坝',26,2,2),(325,'巴中',26,2,2),(326,'达州',26,2,2),(327,'德阳',26,2,2),(328,'甘孜',26,2,2),(329,'广安',26,2,2),(330,'广元',26,2,2),(331,'乐山',26,2,2),(332,'凉山',26,2,2),(333,'眉山',26,2,2),(334,'南充',26,2,2),(335,'内江',26,2,2),(336,'攀枝花',26,2,2),(337,'遂宁',26,2,2),(338,'雅安',26,2,2),(339,'宜宾',26,2,2),(340,'资阳',26,2,2),(341,'自贡',26,2,2),(342,'泸州',26,2,2),(344,'拉萨',28,2,2),(345,'阿里',28,2,2),(346,'昌都',28,2,2),(347,'林芝',28,2,2),(348,'那曲',28,2,2),(349,'日喀则',28,2,2),(350,'山南',28,2,2),(367,'昆明',30,2,2),(368,'怒江',30,2,2),(369,'普洱',30,2,2),(370,'丽江',30,2,2),(371,'保山',30,2,2),(372,'楚雄',30,2,2),(373,'大理',30,2,2),(374,'德宏',30,2,2),(375,'迪庆',30,2,2),(376,'红河',30,2,2),(377,'临沧',30,2,2),(378,'曲靖',30,2,2),(379,'文山',30,2,2),(380,'西双版纳',30,2,2),(381,'玉溪',30,2,2),(382,'昭通',30,2,2),(394,'重庆',32,2,2),(52,'北京',2,2,2),(138,'石家庄',10,2,2),(139,'保定',10,2,2),(140,'沧州',10,2,2),(141,'承德',10,2,2),(142,'邯郸',10,2,2),(143,'衡水',10,2,2),(144,'廊坊',10,2,2),(145,'秦皇岛',10,2,2),(146,'唐山',10,2,2),(147,'邢台',10,2,2),(148,'张家口',10,2,2),(258,'呼和浩特',19,2,2),(259,'阿拉善盟',19,2,2),(260,'巴彦淖尔盟',19,2,2),(261,'包头',19,2,2),(262,'赤峰',19,2,2),(263,'鄂尔多斯',19,2,2),(264,'呼伦贝尔',19,2,2),(265,'通辽',19,2,2),(266,'乌海',19,2,2),(267,'乌兰察布市',19,2,2),(268,'锡林郭勒盟',19,2,2),(269,'兴安盟',19,2,2),(283,'济南',22,2,2),(284,'青岛',22,2,2),(285,'滨州',22,2,2),(286,'德州',22,2,2),(287,'东营',22,2,2),(288,'菏泽',22,2,2),(289,'济宁',22,2,2),(290,'莱芜',22,2,2),(291,'聊城',22,2,2),(292,'临沂',22,2,2),(293,'日照',22,2,2),(294,'泰安',22,2,2),(295,'威海',22,2,2),(296,'潍坊',22,2,2),(297,'烟台',22,2,2),(298,'枣庄',22,2,2),(299,'淄博',22,2,2),(300,'太原',23,2,2),(301,'长治',23,2,2),(302,'大同',23,2,2),(303,'晋城',23,2,2),(304,'晋中',23,2,2),(305,'临汾',23,2,2),(306,'吕梁',23,2,2),(307,'朔州',23,2,2),(308,'忻州',23,2,2),(309,'阳泉',23,2,2),(310,'运城',23,2,2),(343,'天津',27,2,2),(167,'哈尔滨',12,2,2),(168,'大庆',12,2,2),(169,'大兴安岭',12,2,2),(170,'鹤岗',12,2,2),(171,'黑河',12,2,2),(172,'鸡西',12,2,2),(173,'佳木斯',12,2,2),(174,'牡丹江',12,2,2),(175,'七台河',12,2,2),(176,'齐齐哈尔',12,2,2),(177,'双鸭山',12,2,2),(178,'绥化',12,2,2),(179,'伊春',12,2,2),(211,'长春',15,2,2),(212,'吉林',15,2,2),(213,'白城',15,2,2),(214,'白山',15,2,2),(215,'辽源',15,2,2),(216,'四平',15,2,2),(217,'松原',15,2,2),(218,'通化',15,2,2),(219,'延边',15,2,2),(244,'沈阳',18,2,2),(245,'大连',18,2,2),(246,'鞍山',18,2,2),(247,'本溪',18,2,2),(248,'朝阳',18,2,2),(249,'丹东',18,2,2),(250,'抚顺',18,2,2),(251,'阜新',18,2,2),(252,'葫芦岛',18,2,2),(253,'锦州',18,2,2),(254,'辽阳',18,2,2),(255,'盘锦',18,2,2),(256,'铁岭',18,2,2),(257,'营口',18,2,2),(398,'迎江区',36,2,3),(399,'大观区',36,2,3),(400,'宜秀区',36,2,3),(401,'桐城市',36,2,3),(402,'怀宁县',36,2,3),(403,'枞阳县',36,2,3),(404,'潜山县',36,2,3),(405,'太湖县',36,2,3),(406,'宿松县',36,2,3),(407,'望江县',36,2,3),(408,'岳西县',36,2,3),(409,'中市区',37,2,3),(410,'东市区',37,2,3),(411,'西市区',37,2,3),(412,'郊区',37,2,3),(413,'怀远县',37,2,3),(414,'五河县',37,2,3),(415,'固镇县',37,2,3),(416,'居巢区',38,2,3),(417,'庐江县',38,2,3),(418,'无为县',38,2,3),(419,'含山县',38,2,3),(420,'和县',38,2,3),(421,'贵池区',39,2,3),(422,'东至县',39,2,3),(423,'石台县',39,2,3),(424,'青阳县',39,2,3),(425,'琅琊区',40,2,3),(426,'南谯区',40,2,3),(427,'天长市',40,2,3),(428,'明光市',40,2,3),(429,'来安县',40,2,3),(430,'全椒县',40,2,3),(431,'定远县',40,2,3),(432,'凤阳县',40,2,3),(433,'蚌山区',37,2,3),(434,'龙子湖区',37,2,3),(435,'禹会区',37,2,3),(436,'淮上区',37,2,3),(437,'颍州区',41,2,3),(438,'颍东区',41,2,3),(439,'颍泉区',41,2,3),(440,'界首市',41,2,3),(441,'临泉县',41,2,3),(442,'太和县',41,2,3),(443,'阜南县',41,2,3),(444,'颖上县',41,2,3),(445,'相山区',42,2,3),(446,'杜集区',42,2,3),(447,'烈山区',42,2,3),(448,'濉溪县',42,2,3),(449,'田家庵区',43,2,3),(450,'大通区',43,2,3),(451,'谢家集区',43,2,3),(452,'八公山区',43,2,3),(453,'潘集区',43,2,3),(454,'凤台县',43,2,3),(455,'屯溪区',44,2,3),(456,'黄山区',44,2,3),(457,'徽州区',44,2,3),(458,'歙县',44,2,3),(459,'休宁县',44,2,3),(460,'黟县',44,2,3),(461,'祁门县',44,2,3),(462,'金安区',45,2,3),(463,'裕安区',45,2,3),(464,'寿县',45,2,3),(465,'霍邱县',45,2,3),(466,'舒城县',45,2,3),(467,'金寨县',45,2,3),(468,'霍山县',45,2,3),(469,'雨山区',46,2,3),(470,'花山区',46,2,3),(471,'金家庄区',46,2,3),(472,'当涂县',46,2,3),(473,'埇桥区',47,2,3),(474,'砀山县',47,2,3),(475,'萧县',47,2,3),(476,'灵璧县',47,2,3),(477,'泗县',47,2,3),(478,'铜官山区',48,2,3),(479,'狮子山区',48,2,3),(480,'郊区',48,2,3),(481,'铜陵县',48,2,3),(482,'镜湖区',49,2,3),(483,'弋江区',49,2,3),(484,'鸠江区',49,2,3),(485,'三山区',49,2,3),(486,'芜湖县',49,2,3),(487,'繁昌县',49,2,3),(488,'南陵县',49,2,3),(489,'宣州区',50,2,3),(490,'宁国市',50,2,3),(491,'郎溪县',50,2,3),(492,'广德县',50,2,3),(493,'泾县',50,2,3),(494,'绩溪县',50,2,3),(495,'旌德县',50,2,3),(496,'涡阳县',51,2,3),(497,'蒙城县',51,2,3),(498,'利辛县',51,2,3),(499,'谯城区',51,2,3),(1834,'玄武区',220,2,3),(1835,'鼓楼区',220,2,3),(1836,'白下区',220,2,3),(1837,'建邺区',220,2,3),(1838,'秦淮区',220,2,3),(1839,'雨花台区',220,2,3),(1840,'下关区',220,2,3),(1841,'栖霞区',220,2,3),(1842,'浦口区',220,2,3),(1843,'江宁区',220,2,3),(1844,'六合区',220,2,3),(1845,'溧水县',220,2,3),(1846,'高淳县',220,2,3),(1847,'沧浪区',221,2,3),(1848,'金阊区',221,2,3),(1849,'平江区',221,2,3),(1850,'虎丘区',221,2,3),(1851,'吴中区',221,2,3),(1852,'相城区',221,2,3),(1853,'工业园区',221,2,3),(1854,'新区',221,2,3),(1855,'常熟市',221,2,3),(1856,'张家港市',221,2,3),(1867,'昆山市',221,2,3),(1868,'吴江市',221,2,3),(1869,'太仓市',221,2,3),(1870,'崇安区',222,2,3),(1871,'北塘区',222,2,3),(1872,'南长区',222,2,3),(1873,'锡山区',222,2,3),(1874,'惠山区',222,2,3),(1875,'滨湖区',222,2,3),(1876,'新区',222,2,3),(1877,'江阴市',222,2,3),(1878,'宜兴市',222,2,3),(1879,'天宁区',223,2,3),(1880,'钟楼区',223,2,3),(1881,'戚墅堰区',223,2,3),(1882,'郊区',223,2,3),(1883,'新北区',223,2,3),(1884,'武进区',223,2,3),(1885,'溧阳市',223,2,3),(1886,'金坛市',223,2,3),(1887,'清河区',224,2,3),(1888,'清浦区',224,2,3),(1889,'楚州区',224,2,3),(1890,'淮阴区',224,2,3),(1891,'涟水县',224,2,3),(1892,'洪泽县',224,2,3),(1893,'盱眙县',224,2,3),(1894,'金湖县',224,2,3),(1895,'新浦区',225,2,3),(1896,'连云区',225,2,3),(1897,'海州区',225,2,3),(1898,'赣榆县',225,2,3),(1899,'东海县',225,2,3),(1900,'灌云县',225,2,3),(1901,'灌南县',225,2,3),(1902,'崇川区',226,2,3),(1903,'港闸区',226,2,3),(1904,'经济开发区',226,2,3),(1905,'启东市',226,2,3),(1906,'如皋市',226,2,3),(1907,'通州市',226,2,3),(1908,'海门市',226,2,3),(1909,'海安县',226,2,3),(1910,'如东县',226,2,3),(1911,'宿城区',227,2,3),(1912,'宿豫区',227,2,3),(1913,'宿豫县',227,2,3),(1914,'沭阳县',227,2,3),(1915,'泗阳县',227,2,3),(1916,'泗洪县',227,2,3),(1917,'海陵区',228,2,3),(1918,'高港区',228,2,3),(1919,'兴化市',228,2,3),(1920,'靖江市',228,2,3),(1921,'泰兴市',228,2,3),(1922,'姜堰市',228,2,3),(1923,'云龙区',229,2,3),(1924,'鼓楼区',229,2,3),(1925,'九里区',229,2,3),(1926,'贾汪区',229,2,3),(1927,'泉山区',229,2,3),(1928,'新沂市',229,2,3),(1929,'邳州市',229,2,3),(1930,'丰县',229,2,3),(1931,'沛县',229,2,3),(1932,'铜山县',229,2,3),(1933,'睢宁县',229,2,3),(1934,'城区',230,2,3),(1935,'亭湖区',230,2,3),(1936,'盐都区',230,2,3),(1937,'盐都县',230,2,3),(1938,'东台市',230,2,3),(1939,'大丰市',230,2,3),(1940,'响水县',230,2,3),(1941,'滨海县',230,2,3),(1942,'阜宁县',230,2,3),(1943,'射阳县',230,2,3),(1944,'建湖县',230,2,3),(1945,'广陵区',231,2,3),(1946,'维扬区',231,2,3),(1947,'邗江区',231,2,3),(1948,'仪征市',231,2,3),(1949,'高邮市',231,2,3),(1950,'江都市',231,2,3),(1951,'宝应县',231,2,3),(1952,'京口区',232,2,3),(1953,'润州区',232,2,3),(1954,'丹徒区',232,2,3),(1955,'丹阳市',232,2,3),(1956,'扬中市',232,2,3),(1957,'句容市',232,2,3),(2703,'长宁区',321,2,3),(2704,'闸北区',321,2,3),(2705,'闵行区',321,2,3),(2706,'徐汇区',321,2,3),(2707,'浦东新区',321,2,3),(2708,'杨浦区',321,2,3),(2709,'普陀区',321,2,3),(2710,'静安区',321,2,3),(2711,'卢湾区',321,2,3),(2712,'虹口区',321,2,3),(2713,'黄浦区',321,2,3),(2714,'南汇区',321,2,3),(2715,'松江区',321,2,3),(2716,'嘉定区',321,2,3),(2717,'宝山区',321,2,3),(2718,'青浦区',321,2,3),(2719,'金山区',321,2,3),(2720,'奉贤区',321,2,3),(2721,'崇明县',321,2,3),(3229,'西湖区',383,2,3),(3230,'上城区',383,2,3),(3231,'下城区',383,2,3),(3232,'拱墅区',383,2,3),(3233,'滨江区',383,2,3),(3234,'江干区',383,2,3),(3235,'萧山区',383,2,3),(3236,'余杭区',383,2,3),(3237,'市郊',383,2,3),(3238,'建德市',383,2,3),(3239,'富阳市',383,2,3),(3240,'临安市',383,2,3),(3241,'桐庐县',383,2,3),(3242,'淳安县',383,2,3),(3243,'吴兴区',384,2,3),(3244,'南浔区',384,2,3),(3245,'德清县',384,2,3),(3246,'长兴县',384,2,3),(3247,'安吉县',384,2,3),(3248,'南湖区',385,2,3),(3249,'秀洲区',385,2,3),(3250,'海宁市',385,2,3),(3251,'嘉善县',385,2,3),(3252,'平湖市',385,2,3),(3253,'桐乡市',385,2,3),(3254,'海盐县',385,2,3),(3255,'婺城区',386,2,3),(3256,'金东区',386,2,3),(3257,'兰溪市',386,2,3),(3258,'市区',386,2,3),(3265,'东阳市',386,2,3),(3266,'永康市',386,2,3),(3267,'武义县',386,2,3),(3268,'浦江县',386,2,3),(3269,'磐安县',386,2,3),(3270,'莲都区',387,2,3),(3271,'龙泉市',387,2,3),(3272,'青田县',387,2,3),(3273,'缙云县',387,2,3),(3274,'遂昌县',387,2,3),(3275,'松阳县',387,2,3),(3276,'云和县',387,2,3),(3277,'庆元县',387,2,3),(3278,'景宁',387,2,3),(3279,'海曙区',388,2,3),(3280,'江东区',388,2,3),(3281,'江北区',388,2,3),(3282,'镇海区',388,2,3),(3283,'北仑区',388,2,3),(3284,'鄞州区',388,2,3),(3285,'余姚市',388,2,3),(3286,'慈溪市',388,2,3),(3287,'奉化市',388,2,3),(3288,'象山县',388,2,3),(3289,'宁海县',388,2,3),(3290,'越城区',389,2,3),(3291,'上虞市',389,2,3),(3292,'嵊州市',389,2,3),(3293,'绍兴县',389,2,3),(3294,'新昌县',389,2,3),(3295,'诸暨市',389,2,3),(3296,'椒江区',390,2,3),(3297,'黄岩区',390,2,3),(3298,'路桥区',390,2,3),(3299,'温岭市',390,2,3),(3300,'临海市',390,2,3),(3301,'玉环县',390,2,3),(3302,'三门县',390,2,3),(3303,'天台县',390,2,3),(3304,'仙居县',390,2,3),(3305,'鹿城区',391,2,3),(3306,'龙湾区',391,2,3),(3307,'瓯海区',391,2,3),(3308,'瑞安市',391,2,3),(3309,'乐清市',391,2,3),(3310,'洞头县',391,2,3),(3311,'永嘉县',391,2,3),(3312,'平阳县',391,2,3),(3313,'苍南县',391,2,3),(3314,'文成县',391,2,3),(3315,'泰顺县',391,2,3),(3316,'定海区',392,2,3),(3317,'普陀区',392,2,3),(3318,'岱山县',392,2,3),(3319,'嵊泗县',392,2,3),(3320,'衢州市',393,2,3),(3321,'江山市',393,2,3),(3322,'常山县',393,2,3),(3323,'开化县',393,2,3),(3324,'龙游县',393,2,3),(3402,'庐阳区',3401,2,3),(3403,'瑶海区',3401,2,3),(3404,'蜀山区',3401,2,3),(3405,'包河区',3401,2,3),(3406,'长丰县',3401,2,3),(3407,'肥东县',3401,2,3),(3408,'肥西县',3401,2,3),(3409,'义乌市',386,2,3),(518,'鼓楼区',53,2,3),(519,'台江区',53,2,3),(520,'仓山区',53,2,3),(521,'马尾区',53,2,3),(522,'晋安区',53,2,3),(523,'福清市',53,2,3),(524,'长乐市',53,2,3),(525,'闽侯县',53,2,3),(526,'连江县',53,2,3),(527,'罗源县',53,2,3),(528,'闽清县',53,2,3),(529,'永泰县',53,2,3),(530,'平潭县',53,2,3),(531,'新罗区',54,2,3),(532,'漳平市',54,2,3),(533,'长汀县',54,2,3),(534,'永定县',54,2,3),(535,'上杭县',54,2,3),(536,'武平县',54,2,3),(537,'连城县',54,2,3),(538,'延平区',55,2,3),(539,'邵武市',55,2,3),(540,'武夷山市',55,2,3),(541,'建瓯市',55,2,3),(542,'建阳市',55,2,3),(543,'顺昌县',55,2,3),(544,'浦城县',55,2,3),(545,'光泽县',55,2,3),(546,'松溪县',55,2,3),(547,'政和县',55,2,3),(548,'蕉城区',56,2,3),(549,'福安市',56,2,3),(550,'福鼎市',56,2,3),(551,'霞浦县',56,2,3),(552,'古田县',56,2,3),(553,'屏南县',56,2,3),(554,'寿宁县',56,2,3),(555,'周宁县',56,2,3),(556,'柘荣县',56,2,3),(557,'城厢区',57,2,3),(558,'涵江区',57,2,3),(559,'荔城区',57,2,3),(560,'秀屿区',57,2,3),(561,'仙游县',57,2,3),(562,'鲤城区',58,2,3),(563,'丰泽区',58,2,3),(564,'洛江区',58,2,3),(565,'清濛开发区',58,2,3),(566,'泉港区',58,2,3),(567,'石狮市',58,2,3),(568,'晋江市',58,2,3),(569,'南安市',58,2,3),(570,'惠安县',58,2,3),(571,'安溪县',58,2,3),(572,'永春县',58,2,3),(573,'德化县',58,2,3),(574,'金门县',58,2,3),(575,'梅列区',59,2,3),(576,'三元区',59,2,3),(577,'永安市',59,2,3),(578,'明溪县',59,2,3),(579,'清流县',59,2,3),(580,'宁化县',59,2,3),(581,'大田县',59,2,3),(582,'尤溪县',59,2,3),(583,'沙县',59,2,3),(584,'将乐县',59,2,3),(585,'泰宁县',59,2,3),(586,'建宁县',59,2,3),(587,'思明区',60,2,3),(588,'海沧区',60,2,3),(589,'湖里区',60,2,3),(590,'集美区',60,2,3),(591,'同安区',60,2,3),(592,'翔安区',60,2,3),(593,'芗城区',61,2,3),(594,'龙文区',61,2,3),(595,'龙海市',61,2,3),(596,'云霄县',61,2,3),(597,'漳浦县',61,2,3),(598,'诏安县',61,2,3),(599,'长泰县',61,2,3),(600,'东山县',61,2,3),(601,'南靖县',61,2,3),(602,'平和县',61,2,3),(603,'华安县',61,2,3),(692,'从化市',76,2,3),(693,'天河区',76,2,3),(694,'东山区',76,2,3),(695,'白云区',76,2,3),(696,'海珠区',76,2,3),(697,'荔湾区',76,2,3),(698,'越秀区',76,2,3),(699,'黄埔区',76,2,3),(700,'番禺区',76,2,3),(701,'花都区',76,2,3),(702,'增城区',76,2,3),(703,'从化区',76,2,3),(704,'市郊',76,2,3),(705,'福田区',77,2,3),(706,'罗湖区',77,2,3),(707,'南山区',77,2,3),(708,'宝安区',77,2,3),(709,'龙岗区',77,2,3),(710,'盐田区',77,2,3),(711,'湘桥区',78,2,3),(712,'潮安县',78,2,3),(713,'饶平县',78,2,3),(714,'南城区',79,2,3),(715,'东城区',79,2,3),(716,'万江区',79,2,3),(717,'莞城区',79,2,3),(718,'石龙镇',79,2,3),(719,'虎门镇',79,2,3),(720,'麻涌镇',79,2,3),(721,'道滘镇',79,2,3),(722,'石碣镇',79,2,3),(723,'沙田镇',79,2,3),(724,'望牛墩镇',79,2,3),(725,'洪梅镇',79,2,3),(726,'茶山镇',79,2,3),(727,'寮步镇',79,2,3),(728,'大岭山镇',79,2,3),(729,'大朗镇',79,2,3),(730,'黄江镇',79,2,3),(731,'樟木头',79,2,3),(732,'凤岗镇',79,2,3),(733,'塘厦镇',79,2,3),(734,'谢岗镇',79,2,3),(735,'厚街镇',79,2,3),(736,'清溪镇',79,2,3),(737,'常平镇',79,2,3),(738,'桥头镇',79,2,3),(739,'横沥镇',79,2,3),(740,'东坑镇',79,2,3),(741,'企石镇',79,2,3),(742,'石排镇',79,2,3),(743,'长安镇',79,2,3),(744,'中堂镇',79,2,3),(745,'高埗镇',79,2,3),(746,'禅城区',80,2,3),(747,'南海区',80,2,3),(748,'顺德区',80,2,3),(749,'三水区',80,2,3),(750,'高明区',80,2,3),(751,'东源县',81,2,3),(752,'和平县',81,2,3),(753,'源城区',81,2,3),(754,'连平县',81,2,3),(755,'龙川县',81,2,3),(756,'紫金县',81,2,3),(757,'惠阳区',82,2,3),(758,'惠城区',82,2,3),(759,'大亚湾',82,2,3),(760,'博罗县',82,2,3),(761,'惠东县',82,2,3),(762,'龙门县',82,2,3),(763,'江海区',83,2,3),(764,'蓬江区',83,2,3),(765,'新会区',83,2,3),(766,'台山市',83,2,3),(767,'开平市',83,2,3),(768,'鹤山市',83,2,3),(769,'恩平市',83,2,3),(770,'榕城区',84,2,3),(771,'普宁市',84,2,3),(772,'揭东县',84,2,3),(773,'揭西县',84,2,3),(774,'惠来县',84,2,3),(775,'茂南区',85,2,3),(776,'茂港区',85,2,3),(777,'高州市',85,2,3),(778,'化州市',85,2,3),(779,'信宜市',85,2,3),(780,'电白县',85,2,3),(781,'梅县',86,2,3),(782,'梅江区',86,2,3),(783,'兴宁市',86,2,3),(784,'大埔县',86,2,3),(785,'丰顺县',86,2,3),(786,'五华县',86,2,3),(787,'平远县',86,2,3),(788,'蕉岭县',86,2,3),(789,'清城区',87,2,3),(790,'英德市',87,2,3),(791,'连州市',87,2,3),(792,'佛冈县',87,2,3),(793,'阳山县',87,2,3),(794,'清新县',87,2,3),(795,'连山',87,2,3),(796,'连南',87,2,3),(797,'南澳县',88,2,3),(798,'潮阳区',88,2,3),(799,'澄海区',88,2,3),(800,'龙湖区',88,2,3),(801,'金平区',88,2,3),(802,'濠江区',88,2,3),(803,'潮南区',88,2,3),(804,'城区',89,2,3),(805,'陆丰市',89,2,3),(806,'海丰县',89,2,3),(807,'陆河县',89,2,3),(808,'曲江县',90,2,3),(809,'浈江区',90,2,3),(810,'武江区',90,2,3),(811,'曲江区',90,2,3),(812,'乐昌市',90,2,3),(813,'南雄市',90,2,3),(814,'始兴县',90,2,3),(815,'仁化县',90,2,3),(816,'翁源县',90,2,3),(817,'新丰县',90,2,3),(818,'乳源',90,2,3),(819,'江城区',91,2,3),(820,'阳春市',91,2,3),(821,'阳西县',91,2,3),(822,'阳东县',91,2,3),(823,'云城区',92,2,3),(824,'罗定市',92,2,3),(825,'新兴县',92,2,3),(826,'郁南县',92,2,3),(827,'云安县',92,2,3),(828,'赤坎区',93,2,3),(829,'霞山区',93,2,3),(830,'坡头区',93,2,3),(831,'麻章区',93,2,3),(832,'廉江市',93,2,3),(833,'雷州市',93,2,3),(834,'吴川市',93,2,3),(835,'遂溪县',93,2,3),(836,'徐闻县',93,2,3),(837,'肇庆市',94,2,3),(838,'高要市',94,2,3),(839,'四会市',94,2,3),(840,'广宁县',94,2,3),(841,'怀集县',94,2,3),(842,'封开县',94,2,3),(843,'德庆县',94,2,3),(844,'石岐街道',95,2,3),(845,'东区街道',95,2,3),(846,'西区街道',95,2,3),(847,'环城街道',95,2,3),(848,'中山港街道',95,2,3),(849,'五桂山街道',95,2,3),(850,'香洲区',96,2,3),(851,'斗门区',96,2,3),(852,'金湾区',96,2,3),(853,'邕宁区',97,2,3),(854,'青秀区',97,2,3),(855,'兴宁区',97,2,3),(856,'良庆区',97,2,3),(857,'西乡塘区',97,2,3),(858,'江南区',97,2,3),(859,'武鸣县',97,2,3),(860,'隆安县',97,2,3),(861,'马山县',97,2,3),(862,'上林县',97,2,3),(863,'宾阳县',97,2,3),(864,'横县',97,2,3),(865,'秀峰区',98,2,3),(866,'叠彩区',98,2,3),(867,'象山区',98,2,3),(868,'七星区',98,2,3),(869,'雁山区',98,2,3),(870,'阳朔县',98,2,3),(871,'临桂县',98,2,3),(872,'灵川县',98,2,3),(873,'全州县',98,2,3),(874,'平乐县',98,2,3),(875,'兴安县',98,2,3),(876,'灌阳县',98,2,3),(877,'荔浦县',98,2,3),(878,'资源县',98,2,3),(879,'永福县',98,2,3),(880,'龙胜',98,2,3),(881,'恭城',98,2,3),(882,'右江区',99,2,3),(883,'凌云县',99,2,3),(884,'平果县',99,2,3),(885,'西林县',99,2,3),(886,'乐业县',99,2,3),(887,'德保县',99,2,3),(888,'田林县',99,2,3),(889,'田阳县',99,2,3),(890,'靖西县',99,2,3),(891,'田东县',99,2,3),(892,'那坡县',99,2,3),(893,'隆林',99,2,3),(894,'海城区',100,2,3),(895,'银海区',100,2,3),(896,'铁山港区',100,2,3),(897,'合浦县',100,2,3),(898,'江州区',101,2,3),(899,'凭祥市',101,2,3),(900,'宁明县',101,2,3),(901,'扶绥县',101,2,3),(902,'龙州县',101,2,3),(903,'大新县',101,2,3),(904,'天等县',101,2,3),(905,'港口区',102,2,3),(906,'防城区',102,2,3),(907,'东兴市',102,2,3),(908,'上思县',102,2,3),(909,'港北区',103,2,3),(910,'港南区',103,2,3),(911,'覃塘区',103,2,3),(912,'桂平市',103,2,3),(913,'平南县',103,2,3),(914,'金城江区',104,2,3),(915,'宜州市',104,2,3),(916,'天峨县',104,2,3),(917,'凤山县',104,2,3),(918,'南丹县',104,2,3),(919,'东兰县',104,2,3),(920,'都安',104,2,3),(921,'罗城',104,2,3),(922,'巴马',104,2,3),(923,'环江',104,2,3),(924,'大化',104,2,3),(925,'八步区',105,2,3),(926,'钟山县',105,2,3),(927,'昭平县',105,2,3),(928,'富川',105,2,3),(929,'兴宾区',106,2,3),(930,'合山市',106,2,3),(931,'象州县',106,2,3),(932,'武宣县',106,2,3),(933,'忻城县',106,2,3),(934,'金秀',106,2,3),(935,'城中区',107,2,3),(936,'鱼峰区',107,2,3),(937,'柳北区',107,2,3),(938,'柳南区',107,2,3),(939,'柳江县',107,2,3),(940,'柳城县',107,2,3),(941,'鹿寨县',107,2,3),(942,'融安县',107,2,3),(943,'融水',107,2,3),(944,'三江',107,2,3),(945,'钦南区',108,2,3),(946,'钦北区',108,2,3),(947,'灵山县',108,2,3),(948,'浦北县',108,2,3),(949,'万秀区',109,2,3),(950,'蝶山区',109,2,3),(951,'长洲区',109,2,3),(952,'岑溪市',109,2,3),(953,'苍梧县',109,2,3),(954,'藤县',109,2,3),(955,'蒙山县',109,2,3),(956,'玉州区',110,2,3),(957,'北流市',110,2,3),(958,'容县',110,2,3),(959,'陆川县',110,2,3),(960,'博白县',110,2,3),(961,'兴业县',110,2,3),(1054,'秀英区',120,2,3),(1055,'龙华区',120,2,3),(1056,'琼山区',120,2,3),(1057,'美兰区',120,2,3),(1058,'市区',137,2,3),(1059,'洋浦开发区',137,2,3),(1060,'那大镇',137,2,3),(1061,'王五镇',137,2,3),(1062,'雅星镇',137,2,3),(1063,'大成镇',137,2,3),(1064,'中和镇',137,2,3),(1065,'峨蔓镇',137,2,3),(1066,'南丰镇',137,2,3),(1067,'白马井镇',137,2,3),(1068,'兰洋镇',137,2,3),(1069,'和庆镇',137,2,3),(1070,'海头镇',137,2,3),(1071,'排浦镇',137,2,3),(1072,'东成镇',137,2,3),(1073,'光村镇',137,2,3),(1074,'木棠镇',137,2,3),(1075,'新州镇',137,2,3),(1076,'三都镇',137,2,3),(1077,'其他',137,2,3),(3415,'吉阳区',121,2,3),(3416,'崖州区',121,2,3),(3417,'天涯区',121,2,3),(3418,'海棠区',121,2,3),(3419,'白沙',122,2,3),(3420,'保亭',123,2,3),(3421,'昌江',124,2,3),(3422,'澄迈县',125,2,3),(3423,'定安县',126,2,3),(3424,'东方',127,2,3),(3425,'乐东',128,2,3),(3426,'临高县',129,2,3),(3427,'陵水',130,2,3),(3428,'琼海',131,2,3),(3429,'琼中',132,2,3),(3430,'屯昌县',133,2,3),(3431,'万宁',134,2,3),(3432,'文昌',135,2,3),(3433,'五指山',136,2,3),(1251,'金水区',149,2,3),(1252,'邙山区',149,2,3),(1253,'二七区',149,2,3),(1254,'管城区',149,2,3),(1255,'中原区',149,2,3),(1256,'上街区',149,2,3),(1257,'惠济区',149,2,3),(1258,'郑东新区',149,2,3),(1259,'经济技术开发区',149,2,3),(1260,'高新开发区',149,2,3),(1261,'出口加工区',149,2,3),(1262,'巩义市',149,2,3),(1263,'荥阳市',149,2,3),(1264,'新密市',149,2,3),(1265,'新郑市',149,2,3),(1266,'登封市',149,2,3),(1267,'中牟县',149,2,3),(1268,'西工区',150,2,3),(1269,'老城区',150,2,3),(1270,'涧西区',150,2,3),(1271,'瀍河回族区',150,2,3),(1272,'洛龙区',150,2,3),(1273,'吉利区',150,2,3),(1274,'偃师市',150,2,3),(1275,'孟津县',150,2,3),(1276,'新安县',150,2,3),(1277,'栾川县',150,2,3),(1278,'嵩县',150,2,3),(1279,'汝阳县',150,2,3),(1280,'宜阳县',150,2,3),(1281,'洛宁县',150,2,3),(1282,'伊川县',150,2,3),(1283,'鼓楼区',151,2,3),(1284,'龙亭区',151,2,3),(1285,'顺河回族区',151,2,3),(1286,'金明区',151,2,3),(1287,'禹王台区',151,2,3),(1288,'杞县',151,2,3),(1289,'通许县',151,2,3),(1290,'尉氏县',151,2,3),(1291,'开封县',151,2,3),(1292,'兰考县',151,2,3),(1293,'北关区',152,2,3),(1294,'文峰区',152,2,3),(1295,'殷都区',152,2,3),(1296,'龙安区',152,2,3),(1297,'林州市',152,2,3),(1298,'安阳县',152,2,3),(1299,'汤阴县',152,2,3),(1300,'滑县',152,2,3),(1301,'内黄县',152,2,3),(1302,'淇滨区',153,2,3),(1303,'山城区',153,2,3),(1304,'鹤山区',153,2,3),(1305,'浚县',153,2,3),(1306,'淇县',153,2,3),(1307,'济源市',154,2,3),(1308,'解放区',155,2,3),(1309,'中站区',155,2,3),(1310,'马村区',155,2,3),(1311,'山阳区',155,2,3),(1312,'沁阳市',155,2,3),(1313,'孟州市',155,2,3),(1314,'修武县',155,2,3),(1315,'博爱县',155,2,3),(1316,'武陟县',155,2,3),(1317,'温县',155,2,3),(1318,'卧龙区',156,2,3),(1319,'宛城区',156,2,3),(1320,'邓州市',156,2,3),(1321,'南召县',156,2,3),(1322,'方城县',156,2,3),(1323,'西峡县',156,2,3),(1324,'镇平县',156,2,3),(1325,'内乡县',156,2,3),(1326,'淅川县',156,2,3),(1327,'社旗县',156,2,3),(1328,'唐河县',156,2,3),(1329,'新野县',156,2,3),(1330,'桐柏县',156,2,3),(1331,'新华区',157,2,3),(1332,'卫东区',157,2,3),(1333,'湛河区',157,2,3),(1334,'石龙区',157,2,3),(1335,'舞钢市',157,2,3),(1336,'汝州市',157,2,3),(1337,'宝丰县',157,2,3),(1338,'叶县',157,2,3),(1339,'鲁山县',157,2,3),(1340,'郏县',157,2,3),(1341,'湖滨区',158,2,3),(1342,'义马市',158,2,3),(1343,'灵宝市',158,2,3),(1344,'渑池县',158,2,3),(1345,'陕县',158,2,3),(1346,'卢氏县',158,2,3),(1347,'梁园区',159,2,3),(1348,'睢阳区',159,2,3),(1349,'永城市',159,2,3),(1350,'民权县',159,2,3),(1351,'睢县',159,2,3),(1352,'宁陵县',159,2,3),(1353,'虞城县',159,2,3),(1354,'柘城县',159,2,3),(1355,'夏邑县',159,2,3),(1356,'卫滨区',160,2,3),(1357,'红旗区',160,2,3),(1358,'凤泉区',160,2,3),(1359,'牧野区',160,2,3),(1360,'卫辉市',160,2,3),(1361,'辉县市',160,2,3),(1362,'新乡县',160,2,3),(1363,'获嘉县',160,2,3),(1364,'原阳县',160,2,3),(1365,'延津县',160,2,3),(1366,'封丘县',160,2,3),(1367,'长垣县',160,2,3),(1368,'浉河区',161,2,3),(1369,'平桥区',161,2,3),(1370,'罗山县',161,2,3),(1371,'光山县',161,2,3),(1372,'新县',161,2,3),(1373,'商城县',161,2,3),(1374,'固始县',161,2,3),(1375,'潢川县',161,2,3),(1376,'淮滨县',161,2,3),(1377,'息县',161,2,3),(1378,'魏都区',162,2,3),(1379,'禹州市',162,2,3),(1380,'长葛市',162,2,3),(1381,'许昌县',162,2,3),(1382,'鄢陵县',162,2,3),(1383,'襄城县',162,2,3),(1384,'川汇区',163,2,3),(1385,'项城市',163,2,3),(1386,'扶沟县',163,2,3),(1387,'西华县',163,2,3),(1388,'商水县',163,2,3),(1389,'沈丘县',163,2,3),(1390,'郸城县',163,2,3),(1391,'淮阳县',163,2,3),(1392,'太康县',163,2,3),(1393,'鹿邑县',163,2,3),(1394,'驿城区',164,2,3),(1395,'西平县',164,2,3),(1396,'上蔡县',164,2,3),(1397,'平舆县',164,2,3),(1398,'正阳县',164,2,3),(1399,'确山县',164,2,3),(1400,'泌阳县',164,2,3),(1401,'汝南县',164,2,3),(1402,'遂平县',164,2,3),(1403,'新蔡县',164,2,3),(1404,'郾城区',165,2,3),(1405,'源汇区',165,2,3),(1406,'召陵区',165,2,3),(1407,'舞阳县',165,2,3),(1408,'临颍县',165,2,3),(1409,'华龙区',166,2,3),(1410,'清丰县',166,2,3),(1411,'南乐县',166,2,3),(1412,'范县',166,2,3),(1413,'台前县',166,2,3),(1414,'濮阳县',166,2,3),(1544,'江岸区',180,2,3),(1545,'武昌区',180,2,3),(1546,'江汉区',180,2,3),(1547,'硚口区',180,2,3),(1548,'汉阳区',180,2,3),(1549,'青山区',180,2,3),(1550,'洪山区',180,2,3),(1551,'东西湖区',180,2,3),(1552,'汉南区',180,2,3),(1553,'蔡甸区',180,2,3),(1554,'江夏区',180,2,3),(1555,'黄陂区',180,2,3),(1556,'新洲区',180,2,3),(1557,'经济开发区',180,2,3),(1558,'仙桃市',181,2,3),(1559,'鄂城区',182,2,3),(1560,'华容区',182,2,3),(1561,'梁子湖区',182,2,3),(1562,'黄州区',183,2,3),(1563,'麻城市',183,2,3),(1564,'武穴市',183,2,3),(1565,'团风县',183,2,3),(1566,'红安县',183,2,3),(1567,'罗田县',183,2,3),(1568,'英山县',183,2,3),(1569,'浠水县',183,2,3),(1570,'蕲春县',183,2,3),(1571,'黄梅县',183,2,3),(1572,'黄石港区',184,2,3),(1573,'西塞山区',184,2,3),(1574,'下陆区',184,2,3),(1575,'铁山区',184,2,3),(1576,'大冶市',184,2,3),(1577,'阳新县',184,2,3),(1578,'东宝区',185,2,3),(1579,'掇刀区',185,2,3),(1580,'钟祥市',185,2,3),(1581,'京山县',185,2,3),(1582,'沙洋县',185,2,3),(1583,'沙市区',186,2,3),(1584,'荆州区',186,2,3),(1585,'石首市',186,2,3),(1586,'洪湖市',186,2,3),(1587,'松滋市',186,2,3),(1588,'公安县',186,2,3),(1589,'监利县',186,2,3),(1590,'江陵县',186,2,3),(1591,'潜江市',187,2,3),(1592,'神农架林区',188,2,3),(1593,'张湾区',189,2,3),(1594,'茅箭区',189,2,3),(1595,'丹江口市',189,2,3),(1596,'郧县',189,2,3),(1597,'郧西县',189,2,3),(1598,'竹山县',189,2,3),(1599,'竹溪县',189,2,3),(1600,'房县',189,2,3),(1601,'曾都区',190,2,3),(1602,'广水市',190,2,3),(1603,'天门市',191,2,3),(1604,'咸安区',192,2,3),(1605,'赤壁市',192,2,3),(1606,'嘉鱼县',192,2,3),(1607,'通城县',192,2,3),(1608,'崇阳县',192,2,3),(1609,'通山县',192,2,3),(1610,'襄城区',193,2,3),(1611,'樊城区',193,2,3),(1612,'襄阳区',193,2,3),(1613,'老河口市',193,2,3),(1614,'枣阳市',193,2,3),(1615,'宜城市',193,2,3),(1616,'南漳县',193,2,3),(1617,'谷城县',193,2,3),(1618,'保康县',193,2,3),(1619,'孝南区',194,2,3),(1620,'应城市',194,2,3),(1621,'安陆市',194,2,3),(1622,'汉川市',194,2,3),(1623,'孝昌县',194,2,3),(1624,'大悟县',194,2,3),(1625,'云梦县',194,2,3),(1626,'长阳',195,2,3),(1627,'五峰',195,2,3),(1628,'西陵区',195,2,3),(1629,'伍家岗区',195,2,3),(1630,'点军区',195,2,3),(1631,'猇亭区',195,2,3),(1632,'夷陵区',195,2,3),(1633,'宜都市',195,2,3),(1634,'当阳市',195,2,3),(1635,'枝江市',195,2,3),(1636,'远安县',195,2,3),(1637,'兴山县',195,2,3),(1638,'秭归县',195,2,3),(1639,'恩施市',196,2,3),(1640,'利川市',196,2,3),(1641,'建始县',196,2,3),(1642,'巴东县',196,2,3),(1643,'宣恩县',196,2,3),(1644,'咸丰县',196,2,3),(1645,'来凤县',196,2,3),(1646,'鹤峰县',196,2,3),(1647,'岳麓区',197,2,3),(1648,'芙蓉区',197,2,3),(1649,'天心区',197,2,3),(1650,'开福区',197,2,3),(1651,'雨花区',197,2,3),(1652,'开发区',197,2,3),(1653,'浏阳市',197,2,3),(1654,'长沙县',197,2,3),(1655,'望城县',197,2,3),(1656,'宁乡县',197,2,3),(1657,'永定区',198,2,3),(1658,'武陵源区',198,2,3),(1659,'慈利县',198,2,3),(1660,'桑植县',198,2,3),(1661,'武陵区',199,2,3),(1662,'鼎城区',199,2,3),(1663,'津市市',199,2,3),(1664,'安乡县',199,2,3),(1665,'汉寿县',199,2,3),(1666,'澧县',199,2,3),(1667,'临澧县',199,2,3),(1668,'桃源县',199,2,3),(1669,'石门县',199,2,3),(1670,'北湖区',200,2,3),(1671,'苏仙区',200,2,3),(1672,'资兴市',200,2,3),(1673,'桂阳县',200,2,3),(1674,'宜章县',200,2,3),(1675,'永兴县',200,2,3),(1676,'嘉禾县',200,2,3),(1677,'临武县',200,2,3),(1678,'汝城县',200,2,3),(1679,'桂东县',200,2,3),(1680,'安仁县',200,2,3),(1681,'雁峰区',201,2,3),(1682,'珠晖区',201,2,3),(1683,'石鼓区',201,2,3),(1684,'蒸湘区',201,2,3),(1685,'南岳区',201,2,3),(1686,'耒阳市',201,2,3),(1687,'常宁市',201,2,3),(1688,'衡阳县',201,2,3),(1689,'衡南县',201,2,3),(1690,'衡山县',201,2,3),(1691,'衡东县',201,2,3),(1692,'祁东县',201,2,3),(1693,'鹤城区',202,2,3),(1694,'靖州',202,2,3),(1695,'麻阳',202,2,3),(1696,'通道',202,2,3),(1697,'新晃',202,2,3),(1698,'芷江',202,2,3),(1699,'沅陵县',202,2,3),(1700,'辰溪县',202,2,3),(1701,'溆浦县',202,2,3),(1702,'中方县',202,2,3),(1703,'会同县',202,2,3),(1704,'洪江市',202,2,3),(1705,'娄星区',203,2,3),(1706,'冷水江市',203,2,3),(1707,'涟源市',203,2,3),(1708,'双峰县',203,2,3),(1709,'新化县',203,2,3),(1710,'城步',204,2,3),(1711,'双清区',204,2,3),(1712,'大祥区',204,2,3),(1713,'北塔区',204,2,3),(1714,'武冈市',204,2,3),(1715,'邵东县',204,2,3),(1716,'新邵县',204,2,3),(1717,'邵阳县',204,2,3),(1718,'隆回县',204,2,3),(1719,'洞口县',204,2,3),(1720,'绥宁县',204,2,3),(1721,'新宁县',204,2,3),(1722,'岳塘区',205,2,3),(1723,'雨湖区',205,2,3),(1724,'湘乡市',205,2,3),(1725,'韶山市',205,2,3),(1726,'湘潭县',205,2,3),(1727,'吉首市',206,2,3),(1728,'泸溪县',206,2,3),(1729,'凤凰县',206,2,3),(1730,'花垣县',206,2,3),(1731,'保靖县',206,2,3),(1732,'古丈县',206,2,3),(1733,'永顺县',206,2,3),(1734,'龙山县',206,2,3),(1735,'赫山区',207,2,3),(1736,'资阳区',207,2,3),(1737,'沅江市',207,2,3),(1738,'南县',207,2,3),(1739,'桃江县',207,2,3),(1740,'安化县',207,2,3),(1741,'江华',208,2,3),(1742,'冷水滩区',208,2,3),(1743,'零陵区',208,2,3),(1744,'祁阳县',208,2,3),(1745,'东安县',208,2,3),(1746,'双牌县',208,2,3),(1747,'道县',208,2,3),(1748,'江永县',208,2,3),(1749,'宁远县',208,2,3),(1750,'蓝山县',208,2,3),(1751,'新田县',208,2,3),(1752,'岳阳楼区',209,2,3),(1753,'君山区',209,2,3),(1754,'云溪区',209,2,3),(1755,'汨罗市',209,2,3),(1756,'临湘市',209,2,3),(1757,'岳阳县',209,2,3),(1758,'华容县',209,2,3),(1759,'湘阴县',209,2,3),(1760,'平江县',209,2,3),(1761,'天元区',210,2,3),(1762,'荷塘区',210,2,3),(1763,'芦淞区',210,2,3),(1764,'石峰区',210,2,3),(1765,'醴陵市',210,2,3),(1766,'株洲县',210,2,3),(1767,'攸县',210,2,3),(1768,'茶陵县',210,2,3),(1769,'炎陵县',210,2,3),(1958,'东湖区',233,2,3),(1959,'西湖区',233,2,3),(1960,'青云谱区',233,2,3),(1961,'湾里区',233,2,3),(1962,'青山湖区',233,2,3),(1963,'红谷滩新区',233,2,3),(1964,'昌北区',233,2,3),(1965,'高新区',233,2,3),(1966,'南昌县',233,2,3),(1967,'新建县',233,2,3),(1968,'安义县',233,2,3),(1969,'进贤县',233,2,3),(1970,'临川区',234,2,3),(1971,'南城县',234,2,3),(1972,'黎川县',234,2,3),(1973,'南丰县',234,2,3),(1974,'崇仁县',234,2,3),(1975,'乐安县',234,2,3),(1976,'宜黄县',234,2,3),(1977,'金溪县',234,2,3),(1978,'资溪县',234,2,3),(1979,'东乡县',234,2,3),(1980,'广昌县',234,2,3),(1981,'章贡区',235,2,3),(1982,'于都县',235,2,3),(1983,'瑞金市',235,2,3),(1984,'南康市',235,2,3),(1985,'赣县',235,2,3),(1986,'信丰县',235,2,3),(1987,'大余县',235,2,3),(1988,'上犹县',235,2,3),(1989,'崇义县',235,2,3),(1990,'安远县',235,2,3),(1991,'龙南县',235,2,3),(1992,'定南县',235,2,3),(1993,'全南县',235,2,3),(1994,'宁都县',235,2,3),(1995,'兴国县',235,2,3),(1996,'会昌县',235,2,3),(1997,'寻乌县',235,2,3),(1998,'石城县',235,2,3),(1999,'安福县',236,2,3),(2000,'吉州区',236,2,3),(2001,'青原区',236,2,3),(2002,'井冈山市',236,2,3),(2003,'吉安县',236,2,3),(2004,'吉水县',236,2,3),(2005,'峡江县',236,2,3),(2006,'新干县',236,2,3),(2007,'永丰县',236,2,3),(2008,'泰和县',236,2,3),(2009,'遂川县',236,2,3),(2010,'万安县',236,2,3),(2011,'永新县',236,2,3),(2012,'珠山区',237,2,3),(2013,'昌江区',237,2,3),(2014,'乐平市',237,2,3),(2015,'浮梁县',237,2,3),(2016,'浔阳区',238,2,3),(2017,'庐山区',238,2,3),(2018,'瑞昌市',238,2,3),(2019,'九江县',238,2,3),(2020,'武宁县',238,2,3),(2021,'修水县',238,2,3),(2022,'永修县',238,2,3),(2023,'德安县',238,2,3),(2024,'星子县',238,2,3),(2025,'都昌县',238,2,3),(2026,'湖口县',238,2,3),(2027,'彭泽县',238,2,3),(2028,'安源区',239,2,3),(2029,'湘东区',239,2,3),(2030,'莲花县',239,2,3),(2031,'芦溪县',239,2,3),(2032,'上栗县',239,2,3),(2033,'信州区',240,2,3),(2034,'德兴市',240,2,3),(2035,'上饶县',240,2,3),(2036,'广丰县',240,2,3),(2037,'玉山县',240,2,3),(2038,'铅山县',240,2,3),(2039,'横峰县',240,2,3),(2040,'弋阳县',240,2,3),(2041,'余干县',240,2,3),(2042,'波阳县',240,2,3),(2043,'万年县',240,2,3),(2044,'婺源县',240,2,3),(2045,'渝水区',241,2,3),(2046,'分宜县',241,2,3),(2047,'袁州区',242,2,3),(2048,'丰城市',242,2,3),(2049,'樟树市',242,2,3),(2050,'高安市',242,2,3),(2051,'奉新县',242,2,3),(2052,'万载县',242,2,3),(2053,'上高县',242,2,3),(2054,'宜丰县',242,2,3),(2055,'靖安县',242,2,3),(2056,'铜鼓县',242,2,3),(2057,'月湖区',243,2,3),(2058,'贵溪市',243,2,3),(2059,'余江县',243,2,3),(604,'皋兰县',62,2,3),(605,'城关区',62,2,3),(606,'七里河区',62,2,3),(607,'西固区',62,2,3),(608,'安宁区',62,2,3),(609,'红古区',62,2,3),(610,'永登县',62,2,3),(611,'榆中县',62,2,3),(612,'白银区',63,2,3),(613,'平川区',63,2,3),(614,'会宁县',63,2,3),(615,'景泰县',63,2,3),(616,'靖远县',63,2,3),(617,'临洮县',64,2,3),(618,'陇西县',64,2,3),(619,'通渭县',64,2,3),(620,'渭源县',64,2,3),(621,'漳县',64,2,3),(622,'岷县',64,2,3),(623,'安定区',64,2,3),(624,'安定区',64,2,3),(625,'合作市',65,2,3),(626,'临潭县',65,2,3),(627,'卓尼县',65,2,3),(628,'舟曲县',65,2,3),(629,'迭部县',65,2,3),(630,'玛曲县',65,2,3),(631,'碌曲县',65,2,3),(632,'夏河县',65,2,3),(633,'嘉峪关市',66,2,3),(634,'金川区',67,2,3),(635,'永昌县',67,2,3),(636,'肃州区',68,2,3),(637,'玉门市',68,2,3),(638,'敦煌市',68,2,3),(639,'金塔县',68,2,3),(640,'瓜州县',68,2,3),(641,'肃北',68,2,3),(642,'阿克塞',68,2,3),(643,'临夏市',69,2,3),(644,'临夏县',69,2,3),(645,'康乐县',69,2,3),(646,'永靖县',69,2,3),(647,'广河县',69,2,3),(648,'和政县',69,2,3),(649,'东乡族自治县',69,2,3),(650,'积石山',69,2,3),(651,'成县',70,2,3),(652,'徽县',70,2,3),(653,'康县',70,2,3),(654,'礼县',70,2,3),(655,'两当县',70,2,3),(656,'文县',70,2,3),(657,'西和县',70,2,3),(658,'宕昌县',70,2,3),(659,'武都区',70,2,3),(660,'崇信县',71,2,3),(661,'华亭县',71,2,3),(662,'静宁县',71,2,3),(663,'灵台县',71,2,3),(664,'崆峒区',71,2,3),(665,'庄浪县',71,2,3),(666,'泾川县',71,2,3),(667,'合水县',72,2,3),(668,'华池县',72,2,3),(669,'环县',72,2,3),(670,'宁县',72,2,3),(671,'庆城县',72,2,3),(672,'西峰区',72,2,3),(673,'镇原县',72,2,3),(674,'正宁县',72,2,3),(675,'甘谷县',73,2,3),(676,'秦安县',73,2,3),(677,'清水县',73,2,3),(678,'秦州区',73,2,3),(679,'麦积区',73,2,3),(680,'武山县',73,2,3),(681,'张家川',73,2,3),(682,'古浪县',74,2,3),(683,'民勤县',74,2,3),(684,'天祝',74,2,3),(685,'凉州区',74,2,3),(686,'高台县',75,2,3),(687,'临泽县',75,2,3),(688,'民乐县',75,2,3),(689,'山丹县',75,2,3),(690,'肃南',75,2,3),(691,'甘州区',75,2,3),(2263,'西夏区',270,2,3),(2264,'金凤区',270,2,3),(2265,'兴庆区',270,2,3),(2266,'灵武市',270,2,3),(2267,'永宁县',270,2,3),(2268,'贺兰县',270,2,3),(2269,'原州区',271,2,3),(2270,'海原县',271,2,3),(2271,'西吉县',271,2,3),(2272,'隆德县',271,2,3),(2273,'泾源县',271,2,3),(2274,'彭阳县',271,2,3),(2275,'惠农县',272,2,3),(2276,'大武口区',272,2,3),(2277,'惠农区',272,2,3),(2278,'陶乐县',272,2,3),(2279,'平罗县',272,2,3),(2280,'利通区',273,2,3),(2281,'中卫县',273,2,3),(2282,'青铜峡市',273,2,3),(2283,'中宁县',273,2,3),(2284,'盐池县',273,2,3),(2285,'同心县',273,2,3),(2286,'沙坡头区',274,2,3),(2287,'海原县',274,2,3),(2288,'中宁县',274,2,3),(2596,'莲湖区',311,2,3),(2597,'新城区',311,2,3),(2598,'碑林区',311,2,3),(2599,'雁塔区',311,2,3),(2600,'灞桥区',311,2,3),(2601,'未央区',311,2,3),(2602,'阎良区',311,2,3),(2603,'临潼区',311,2,3),(2604,'长安区',311,2,3),(2605,'蓝田县',311,2,3),(2606,'周至县',311,2,3),(2607,'户县',311,2,3),(2608,'高陵县',311,2,3),(2609,'汉滨区',312,2,3),(2610,'汉阴县',312,2,3),(2611,'石泉县',312,2,3),(2612,'宁陕县',312,2,3),(2613,'紫阳县',312,2,3),(2614,'岚皋县',312,2,3),(2615,'平利县',312,2,3),(2616,'镇坪县',312,2,3),(2617,'旬阳县',312,2,3),(2618,'白河县',312,2,3),(2619,'陈仓区',313,2,3),(2620,'渭滨区',313,2,3),(2621,'金台区',313,2,3),(2622,'凤翔县',313,2,3),(2623,'岐山县',313,2,3),(2624,'扶风县',313,2,3),(2625,'眉县',313,2,3),(2626,'陇县',313,2,3),(2627,'千阳县',313,2,3),(2628,'麟游县',313,2,3),(2629,'凤县',313,2,3),(2630,'太白县',313,2,3),(2631,'汉台区',314,2,3),(2632,'南郑县',314,2,3),(2633,'城固县',314,2,3),(2634,'洋县',314,2,3),(2635,'西乡县',314,2,3),(2636,'勉县',314,2,3),(2637,'宁强县',314,2,3),(2638,'略阳县',314,2,3),(2639,'镇巴县',314,2,3),(2640,'留坝县',314,2,3),(2641,'佛坪县',314,2,3),(2642,'商州区',315,2,3),(2643,'洛南县',315,2,3),(2644,'丹凤县',315,2,3),(2645,'商南县',315,2,3),(2646,'山阳县',315,2,3),(2647,'镇安县',315,2,3),(2648,'柞水县',315,2,3),(2649,'耀州区',316,2,3),(2650,'王益区',316,2,3),(2651,'印台区',316,2,3),(2652,'宜君县',316,2,3),(2653,'临渭区',317,2,3),(2654,'韩城市',317,2,3),(2655,'华阴市',317,2,3),(2656,'华县',317,2,3),(2657,'潼关县',317,2,3),(2658,'大荔县',317,2,3),(2659,'合阳县',317,2,3),(2660,'澄城县',317,2,3),(2661,'蒲城县',317,2,3),(2662,'白水县',317,2,3),(2663,'富平县',317,2,3),(2664,'秦都区',318,2,3),(2665,'渭城区',318,2,3),(2666,'杨陵区',318,2,3),(2667,'兴平市',318,2,3),(2668,'三原县',318,2,3),(2669,'泾阳县',318,2,3),(2670,'乾县',318,2,3),(2671,'礼泉县',318,2,3),(2672,'永寿县',318,2,3),(2673,'彬县',318,2,3),(2674,'长武县',318,2,3),(2675,'旬邑县',318,2,3),(2676,'淳化县',318,2,3),(2677,'武功县',318,2,3),(2678,'吴起县',319,2,3),(2679,'宝塔区',319,2,3),(2680,'延长县',319,2,3),(2681,'延川县',319,2,3),(2682,'子长县',319,2,3),(2683,'安塞县',319,2,3),(2684,'志丹县',319,2,3),(2685,'甘泉县',319,2,3),(2686,'富县',319,2,3),(2687,'洛川县',319,2,3),(2688,'宜川县',319,2,3),(2689,'黄龙县',319,2,3),(2690,'黄陵县',319,2,3),(2691,'榆阳区',320,2,3),(2692,'神木县',320,2,3),(2693,'府谷县',320,2,3),(2694,'横山县',320,2,3),(2695,'靖边县',320,2,3),(2696,'定边县',320,2,3),(2697,'绥德县',320,2,3),(2698,'米脂县',320,2,3),(2699,'佳县',320,2,3),(2700,'吴堡县',320,2,3),(2701,'清涧县',320,2,3),(2702,'子洲县',320,2,3),(962,'南明区',111,2,3),(963,'云岩区',111,2,3),(964,'花溪区',111,2,3),(965,'乌当区',111,2,3),(966,'白云区',111,2,3),(967,'小河区',111,2,3),(968,'观山湖区',111,2,3),(969,'新天园区',111,2,3),(970,'清镇市',111,2,3),(971,'开阳县',111,2,3),(972,'修文县',111,2,3),(973,'息烽县',111,2,3),(974,'西秀区',112,2,3),(975,'关岭',112,2,3),(976,'镇宁',112,2,3),(977,'紫云',112,2,3),(978,'平坝县',112,2,3),(979,'普定县',112,2,3),(980,'毕节市',113,2,3),(981,'大方县',113,2,3),(982,'黔西县',113,2,3),(983,'金沙县',113,2,3),(984,'织金县',113,2,3),(985,'纳雍县',113,2,3),(986,'赫章县',113,2,3),(987,'威宁',113,2,3),(988,'钟山区',114,2,3),(989,'六枝特区',114,2,3),(990,'水城县',114,2,3),(991,'盘县',114,2,3),(992,'凯里市',115,2,3),(993,'黄平县',115,2,3),(994,'施秉县',115,2,3),(995,'三穗县',115,2,3),(996,'镇远县',115,2,3),(997,'岑巩县',115,2,3),(998,'天柱县',115,2,3),(999,'锦屏县',115,2,3),(1000,'剑河县',115,2,3),(1001,'台江县',115,2,3),(1002,'黎平县',115,2,3),(1003,'榕江县',115,2,3),(1004,'从江县',115,2,3),(1005,'雷山县',115,2,3),(1006,'麻江县',115,2,3),(1007,'丹寨县',115,2,3),(1008,'都匀市',116,2,3),(1009,'福泉市',116,2,3),(1010,'荔波县',116,2,3),(1011,'贵定县',116,2,3),(1012,'瓮安县',116,2,3),(1013,'独山县',116,2,3),(1014,'平塘县',116,2,3),(1015,'罗甸县',116,2,3),(1016,'长顺县',116,2,3),(1017,'龙里县',116,2,3),(1018,'惠水县',116,2,3),(1019,'三都',116,2,3),(1020,'兴义市',117,2,3),(1021,'兴仁县',117,2,3),(1022,'普安县',117,2,3),(1023,'晴隆县',117,2,3),(1024,'贞丰县',117,2,3),(1025,'望谟县',117,2,3),(1026,'册亨县',117,2,3),(1027,'安龙县',117,2,3),(1028,'铜仁市',118,2,3),(1029,'江口县',118,2,3),(1030,'石阡县',118,2,3),(1031,'思南县',118,2,3),(1032,'德江县',118,2,3),(1033,'玉屏',118,2,3),(1034,'印江',118,2,3),(1035,'沿河',118,2,3),(1036,'松桃',118,2,3),(1037,'万山特区',118,2,3),(1038,'红花岗区',119,2,3),(1039,'务川县',119,2,3),(1040,'道真县',119,2,3),(1041,'汇川区',119,2,3),(1042,'赤水市',119,2,3),(1043,'仁怀市',119,2,3),(1044,'遵义县',119,2,3),(1045,'桐梓县',119,2,3),(1046,'绥阳县',119,2,3),(1047,'正安县',119,2,3),(1048,'凤冈县',119,2,3),(1049,'湄潭县',119,2,3),(1050,'余庆县',119,2,3),(1051,'习水县',119,2,3),(1052,'道真',119,2,3),(1053,'务川',119,2,3),(2722,'青羊区',322,2,3),(2723,'锦江区',322,2,3),(2724,'金牛区',322,2,3),(2725,'武侯区',322,2,3),(2726,'成华区',322,2,3),(2727,'龙泉驿区',322,2,3),(2728,'青白江区',322,2,3),(2729,'新都区',322,2,3),(2730,'温江区',322,2,3),(2731,'高新区',322,2,3),(2732,'高新西区',322,2,3),(2733,'都江堰市',322,2,3),(2734,'彭州市',322,2,3),(2735,'邛崃市',322,2,3),(2736,'崇州市',322,2,3),(2737,'金堂县',322,2,3),(2738,'双流县',322,2,3),(2739,'郫县',322,2,3),(2740,'大邑县',322,2,3),(2741,'蒲江县',322,2,3),(2742,'新津县',322,2,3),(2743,'都江堰市',322,2,3),(2744,'彭州市',322,2,3),(2745,'邛崃市',322,2,3),(2746,'崇州市',322,2,3),(2747,'金堂县',322,2,3),(2748,'双流县',322,2,3),(2749,'郫县',322,2,3),(2750,'大邑县',322,2,3),(2751,'蒲江县',322,2,3),(2752,'新津县',322,2,3),(2753,'涪城区',323,2,3),(2754,'游仙区',323,2,3),(2755,'江油市',323,2,3),(2756,'盐亭县',323,2,3),(2757,'三台县',323,2,3),(2758,'平武县',323,2,3),(2759,'安县',323,2,3),(2760,'梓潼县',323,2,3),(2761,'北川县',323,2,3),(2762,'马尔康县',324,2,3),(2763,'汶川县',324,2,3),(2764,'理县',324,2,3),(2765,'茂县',324,2,3),(2766,'松潘县',324,2,3),(2767,'九寨沟县',324,2,3),(2768,'金川县',324,2,3),(2769,'小金县',324,2,3),(2770,'黑水县',324,2,3),(2771,'壤塘县',324,2,3),(2772,'阿坝县',324,2,3),(2773,'若尔盖县',324,2,3),(2774,'红原县',324,2,3),(2775,'巴州区',325,2,3),(2776,'通江县',325,2,3),(2777,'南江县',325,2,3),(2778,'平昌县',325,2,3),(2779,'通川区',326,2,3),(2780,'万源市',326,2,3),(2781,'达川区',326,2,3),(2782,'宣汉县',326,2,3),(2783,'开江县',326,2,3),(2784,'大竹县',326,2,3),(2785,'渠县',326,2,3),(2786,'旌阳区',327,2,3),(2787,'广汉市',327,2,3),(2788,'什邡市',327,2,3),(2789,'绵竹市',327,2,3),(2790,'罗江县',327,2,3),(2791,'中江县',327,2,3),(2792,'康定县',328,2,3),(2793,'丹巴县',328,2,3),(2794,'泸定县',328,2,3),(2795,'炉霍县',328,2,3),(2796,'九龙县',328,2,3),(2797,'甘孜县',328,2,3),(2798,'雅江县',328,2,3),(2799,'新龙县',328,2,3),(2800,'道孚县',328,2,3),(2801,'白玉县',328,2,3),(2802,'理塘县',328,2,3),(2803,'德格县',328,2,3),(2804,'乡城县',328,2,3),(2805,'石渠县',328,2,3),(2806,'稻城县',328,2,3),(2807,'色达县',328,2,3),(2808,'巴塘县',328,2,3),(2809,'得荣县',328,2,3),(2810,'前锋区',329,2,3),(2811,'华蓥市',329,2,3),(2812,'岳池县',329,2,3),(2813,'武胜县',329,2,3),(2814,'邻水县',329,2,3),(2815,'利州区',330,2,3),(2816,'昭化区',330,2,3),(2817,'朝天区',330,2,3),(2818,'旺苍县',330,2,3),(2819,'青川县',330,2,3),(2820,'剑阁县',330,2,3),(2821,'苍溪县',330,2,3),(2822,'峨眉山市',331,2,3),(2823,'乐山市',331,2,3),(2824,'犍为县',331,2,3),(2825,'井研县',331,2,3),(2826,'夹江县',331,2,3),(2827,'沐川县',331,2,3),(2828,'峨边',331,2,3),(2829,'马边',331,2,3),(2830,'西昌市',332,2,3),(2831,'盐源县',332,2,3),(2832,'德昌县',332,2,3),(2833,'会理县',332,2,3),(2834,'会东县',332,2,3),(2835,'宁南县',332,2,3),(2836,'普格县',332,2,3),(2837,'布拖县',332,2,3),(2838,'金阳县',332,2,3),(2839,'昭觉县',332,2,3),(2840,'喜德县',332,2,3),(2841,'冕宁县',332,2,3),(2842,'越西县',332,2,3),(2843,'甘洛县',332,2,3),(2844,'美姑县',332,2,3),(2845,'雷波县',332,2,3),(2846,'木里',332,2,3),(2847,'东坡区',333,2,3),(2848,'仁寿县',333,2,3),(2849,'彭山区',333,2,3),(2850,'洪雅县',333,2,3),(2851,'丹棱县',333,2,3),(2852,'青神县',333,2,3),(2853,'阆中市',334,2,3),(2854,'南部县',334,2,3),(2855,'营山县',334,2,3),(2856,'蓬安县',334,2,3),(2857,'仪陇县',334,2,3),(2858,'顺庆区',334,2,3),(2859,'高坪区',334,2,3),(2860,'嘉陵区',334,2,3),(2861,'西充县',334,2,3),(2862,'市中区',335,2,3),(2863,'东兴区',335,2,3),(2864,'威远县',335,2,3),(2865,'资中县',335,2,3),(2866,'隆昌县',335,2,3),(2867,'东  区',336,2,3),(2868,'西  区',336,2,3),(2869,'仁和区',336,2,3),(2870,'米易县',336,2,3),(2871,'盐边县',336,2,3),(2872,'船山区',337,2,3),(2873,'安居区',337,2,3),(2874,'蓬溪县',337,2,3),(2875,'射洪县',337,2,3),(2876,'大英县',337,2,3),(2877,'雨城区',338,2,3),(2878,'名山区',338,2,3),(2879,'荥经县',338,2,3),(2880,'汉源县',338,2,3),(2881,'石棉县',338,2,3),(2882,'天全县',338,2,3),(2883,'芦山县',338,2,3),(2884,'宝兴县',338,2,3),(2885,'翠屏区',339,2,3),(2886,'宜宾县',339,2,3),(2887,'南溪区',339,2,3),(2888,'江安县',339,2,3),(2889,'长宁县',339,2,3),(2890,'高县',339,2,3),(2891,'珙县',339,2,3),(2892,'筠连县',339,2,3),(2893,'兴文县',339,2,3),(2894,'屏山县',339,2,3),(2895,'雁江区',340,2,3),(2896,'简阳市',340,2,3),(2897,'安岳县',340,2,3),(2898,'乐至县',340,2,3),(2899,'大安区',341,2,3),(2900,'自流井区',341,2,3),(2901,'贡井区',341,2,3),(2902,'沿滩区',341,2,3),(2903,'荣县',341,2,3),(2904,'富顺县',341,2,3),(2905,'江阳区',342,2,3),(2906,'纳溪区',342,2,3),(2907,'龙马潭区',342,2,3),(2908,'泸县',342,2,3),(2909,'合江县',342,2,3),(2910,'叙永县',342,2,3),(2911,'古蔺县',342,2,3),(2931,'城关区',344,2,3),(2932,'林周县',344,2,3),(2933,'当雄县',344,2,3),(2934,'尼木县',344,2,3),(2935,'曲水县',344,2,3),(2936,'堆龙德庆县',344,2,3),(2937,'达孜县',344,2,3),(2938,'墨竹工卡县',344,2,3),(2939,'噶尔县',345,2,3),(2940,'普兰县',345,2,3),(2941,'札达县',345,2,3),(2942,'日土县',345,2,3),(2943,'革吉县',345,2,3),(2944,'改则县',345,2,3),(2945,'措勤县',345,2,3),(2946,'昌都县',346,2,3),(2947,'江达县',346,2,3),(2948,'贡觉县',346,2,3),(2949,'类乌齐县',346,2,3),(2950,'丁青县',346,2,3),(2951,'察雅县',346,2,3),(2952,'八宿县',346,2,3),(2953,'左贡县',346,2,3),(2954,'芒康县',346,2,3),(2955,'洛隆县',346,2,3),(2956,'边坝县',346,2,3),(2957,'林芝县',347,2,3),(2958,'工布江达县',347,2,3),(2959,'米林县',347,2,3),(2960,'墨脱县',347,2,3),(2961,'波密县',347,2,3),(2962,'察隅县',347,2,3),(2963,'朗县',347,2,3),(2964,'那曲县',348,2,3),(2965,'嘉黎县',348,2,3),(2966,'比如县',348,2,3),(2967,'聂荣县',348,2,3),(2968,'安多县',348,2,3),(2969,'申扎县',348,2,3),(2970,'索县',348,2,3),(2971,'班戈县',348,2,3),(2972,'巴青县',348,2,3),(2973,'尼玛县',348,2,3),(2974,'日喀则市',349,2,3),(2975,'南木林县',349,2,3),(2976,'江孜县',349,2,3),(2977,'定日县',349,2,3),(2978,'萨迦县',349,2,3),(2979,'拉孜县',349,2,3),(2980,'昂仁县',349,2,3),(2981,'谢通门县',349,2,3),(2982,'白朗县',349,2,3),(2983,'仁布县',349,2,3),(2984,'康马县',349,2,3),(2985,'定结县',349,2,3),(2986,'仲巴县',349,2,3),(2987,'亚东县',349,2,3),(2988,'吉隆县',349,2,3),(2989,'聂拉木县',349,2,3),(2990,'萨嘎县',349,2,3),(2991,'岗巴县',349,2,3),(2992,'乃东县',350,2,3),(2993,'扎囊县',350,2,3),(2994,'贡嘎县',350,2,3),(2995,'桑日县',350,2,3),(2996,'琼结县',350,2,3),(2997,'曲松县',350,2,3),(2998,'措美县',350,2,3),(2999,'洛扎县',350,2,3),(3000,'加查县',350,2,3),(3001,'隆子县',350,2,3),(3002,'错那县',350,2,3),(3003,'浪卡子县',350,2,3),(3100,'盘龙区',367,2,3),(3101,'五华区',367,2,3),(3102,'官渡区',367,2,3),(3103,'西山区',367,2,3),(3104,'东川区',367,2,3),(3105,'安宁市',367,2,3),(3106,'呈贡区',367,2,3),(3107,'晋宁县',367,2,3),(3108,'富民县',367,2,3),(3109,'宜良县',367,2,3),(3110,'嵩明县',367,2,3),(3111,'石林县',367,2,3),(3112,'禄劝',367,2,3),(3113,'寻甸',367,2,3),(3114,'兰坪',368,2,3),(3115,'泸水县',368,2,3),(3116,'福贡县',368,2,3),(3117,'贡山',368,2,3),(3118,'宁洱',369,2,3),(3119,'思茅区',369,2,3),(3120,'墨江',369,2,3),(3121,'景东',369,2,3),(3122,'景谷',369,2,3),(3123,'镇沅',369,2,3),(3124,'江城',369,2,3),(3125,'孟连',369,2,3),(3126,'澜沧',369,2,3),(3127,'西盟',369,2,3),(3128,'古城区',370,2,3),(3129,'宁蒗',370,2,3),(3130,'玉龙',370,2,3),(3131,'永胜县',370,2,3),(3132,'华坪县',370,2,3),(3133,'隆阳区',371,2,3),(3134,'施甸县',371,2,3),(3135,'腾冲县',371,2,3),(3136,'龙陵县',371,2,3),(3137,'昌宁县',371,2,3),(3138,'楚雄市',372,2,3),(3139,'双柏县',372,2,3),(3140,'牟定县',372,2,3),(3141,'南华县',372,2,3),(3142,'姚安县',372,2,3),(3143,'大姚县',372,2,3),(3144,'永仁县',372,2,3),(3145,'元谋县',372,2,3),(3146,'武定县',372,2,3),(3147,'禄丰县',372,2,3),(3148,'大理市',373,2,3),(3149,'祥云县',373,2,3),(3150,'宾川县',373,2,3),(3151,'弥渡县',373,2,3),(3152,'永平县',373,2,3),(3153,'云龙县',373,2,3),(3154,'洱源县',373,2,3),(3155,'剑川县',373,2,3),(3156,'鹤庆县',373,2,3),(3157,'漾濞',373,2,3),(3158,'南涧',373,2,3),(3159,'巍山',373,2,3),(3160,'潞西市',374,2,3),(3161,'瑞丽市',374,2,3),(3162,'梁河县',374,2,3),(3163,'盈江县',374,2,3),(3164,'陇川县',374,2,3),(3165,'香格里拉县',375,2,3),(3166,'德钦县',375,2,3),(3167,'维西',375,2,3),(3168,'泸西县',376,2,3),(3169,'蒙自县',376,2,3),(3170,'个旧市',376,2,3),(3171,'开远市',376,2,3),(3172,'绿春县',376,2,3),(3173,'建水县',376,2,3),(3174,'石屏县',376,2,3),(3175,'弥勒县',376,2,3),(3176,'元阳县',376,2,3),(3177,'红河县',376,2,3),(3178,'金平',376,2,3),(3179,'河口',376,2,3),(3180,'屏边',376,2,3),(3181,'临翔区',377,2,3),(3182,'凤庆县',377,2,3),(3183,'云县',377,2,3),(3184,'永德县',377,2,3),(3185,'镇康县',377,2,3),(3186,'双江',377,2,3),(3187,'耿马',377,2,3),(3188,'沧源',377,2,3),(3189,'麒麟区',378,2,3),(3190,'宣威市',378,2,3),(3191,'马龙县',378,2,3),(3192,'陆良县',378,2,3),(3193,'师宗县',378,2,3),(3194,'罗平县',378,2,3),(3195,'富源县',378,2,3),(3196,'会泽县',378,2,3),(3197,'沾益县',378,2,3),(3198,'文山县',379,2,3),(3199,'砚山县',379,2,3),(3200,'西畴县',379,2,3),(3201,'麻栗坡县',379,2,3),(3202,'马关县',379,2,3),(3203,'丘北县',379,2,3),(3204,'广南县',379,2,3),(3205,'富宁县',379,2,3),(3206,'景洪市',380,2,3),(3207,'勐海县',380,2,3),(3208,'勐腊县',380,2,3),(3209,'红塔区',381,2,3),(3210,'江川县',381,2,3),(3211,'澄江县',381,2,3),(3212,'通海县',381,2,3),(3213,'华宁县',381,2,3),(3214,'易门县',381,2,3),(3215,'峨山',381,2,3),(3216,'新平',381,2,3),(3217,'元江',381,2,3),(3218,'昭阳区',382,2,3),(3219,'鲁甸县',382,2,3),(3220,'巧家县',382,2,3),(3221,'盐津县',382,2,3),(3222,'大关县',382,2,3),(3223,'永善县',382,2,3),(3224,'绥江县',382,2,3),(3225,'镇雄县',382,2,3),(3226,'彝良县',382,2,3),(3227,'威信县',382,2,3),(3228,'水富县',382,2,3),(3325,'合川区',394,2,3),(3326,'江津区',394,2,3),(3327,'南川区',394,2,3),(3328,'永川区',394,2,3),(3329,'南岸区',394,2,3),(3330,'渝北区',394,2,3),(3331,'万盛区',394,2,3),(3332,'大渡口区',394,2,3),(3333,'万州区',394,2,3),(3334,'北碚区',394,2,3),(3335,'沙坪坝区',394,2,3),(3336,'巴南区',394,2,3),(3337,'涪陵区',394,2,3),(3338,'江北区',394,2,3),(3339,'九龙坡区',394,2,3),(3340,'渝中区',394,2,3),(3341,'黔江开发区',394,2,3),(3342,'长寿区',394,2,3),(3343,'双桥区',394,2,3),(3344,'綦江区',394,2,3),(3345,'潼南县',394,2,3),(3346,'铜梁区',394,2,3),(3347,'大足区',394,2,3),(3348,'荣昌县',394,2,3),(3349,'璧山区',394,2,3),(3350,'垫江县',394,2,3),(3351,'武隆县',394,2,3),(3352,'丰都县',394,2,3),(3353,'城口县',394,2,3),(3354,'梁平县',394,2,3),(3355,'开县',394,2,3),(3356,'巫溪县',394,2,3),(3357,'巫山县',394,2,3),(3358,'奉节县',394,2,3),(3359,'云阳县',394,2,3),(3360,'忠县',394,2,3),(3361,'石柱',394,2,3),(3362,'彭水',394,2,3),(3363,'酉阳',394,2,3),(3364,'秀山',394,2,3),(3410,'恩阳区',325,2,3),(3411,'市中区',331,2,3),(3412,'沙湾区',331,2,3),(3413,'五通桥区',331,2,3),(3414,'金口河区',331,2,3),(500,'东城区',52,2,3),(501,'西城区',52,2,3),(502,'海淀区',52,2,3),(503,'朝阳区',52,2,3),(504,'崇文区',52,2,3),(505,'宣武区',52,2,3),(506,'丰台区',52,2,3),(507,'石景山区',52,2,3),(508,'房山区',52,2,3),(509,'门头沟区',52,2,3),(510,'通州区',52,2,3),(511,'顺义区',52,2,3),(512,'昌平区',52,2,3),(513,'怀柔区',52,2,3),(514,'平谷区',52,2,3),(515,'大兴区',52,2,3),(516,'密云县',52,2,3),(517,'延庆县',52,2,3),(1078,'长安区',138,2,3),(1079,'桥东区',138,2,3),(1080,'桥西区',138,2,3),(1081,'新华区',138,2,3),(1082,'裕华区',138,2,3),(1083,'井陉矿区',138,2,3),(1084,'高新区',138,2,3),(1085,'辛集市',138,2,3),(1086,'藁城市',138,2,3),(1087,'晋州市',138,2,3),(1088,'新乐市',138,2,3),(1089,'鹿泉市',138,2,3),(1090,'井陉县',138,2,3),(1091,'正定县',138,2,3),(1092,'栾城县',138,2,3),(1093,'行唐县',138,2,3),(1094,'灵寿县',138,2,3),(1095,'高邑县',138,2,3),(1096,'深泽县',138,2,3),(1097,'赞皇县',138,2,3),(1098,'无极县',138,2,3),(1099,'平山县',138,2,3),(1100,'元氏县',138,2,3),(1101,'赵县',138,2,3),(1102,'新市区',139,2,3),(1103,'南市区',139,2,3),(1104,'北市区',139,2,3),(1105,'涿州市',139,2,3),(1106,'定州市',139,2,3),(1107,'安国市',139,2,3),(1108,'高碑店市',139,2,3),(1109,'满城县',139,2,3),(1110,'清苑县',139,2,3),(1111,'涞水县',139,2,3),(1112,'阜平县',139,2,3),(1113,'徐水县',139,2,3),(1114,'定兴县',139,2,3),(1115,'唐县',139,2,3),(1116,'高阳县',139,2,3),(1117,'容城县',139,2,3),(1118,'涞源县',139,2,3),(1119,'望都县',139,2,3),(1120,'安新县',139,2,3),(1121,'易县',139,2,3),(1122,'曲阳县',139,2,3),(1123,'蠡县',139,2,3),(1124,'顺平县',139,2,3),(1125,'博野县',139,2,3),(1126,'雄县',139,2,3),(1127,'运河区',140,2,3),(1128,'新华区',140,2,3),(1129,'泊头市',140,2,3),(1130,'任丘市',140,2,3),(1131,'黄骅市',140,2,3),(1132,'河间市',140,2,3),(1133,'沧县',140,2,3),(1134,'青县',140,2,3),(1135,'东光县',140,2,3),(1136,'海兴县',140,2,3),(1137,'盐山县',140,2,3),(1138,'肃宁县',140,2,3),(1139,'南皮县',140,2,3),(1140,'吴桥县',140,2,3),(1141,'献县',140,2,3),(1142,'孟村',140,2,3),(1143,'双桥区',141,2,3),(1144,'双滦区',141,2,3),(1145,'鹰手营子矿区',141,2,3),(1146,'承德县',141,2,3),(1147,'兴隆县',141,2,3),(1148,'平泉县',141,2,3),(1149,'滦平县',141,2,3),(1150,'隆化县',141,2,3),(1151,'丰宁',141,2,3),(1152,'宽城',141,2,3),(1153,'围场',141,2,3),(1154,'从台区',142,2,3),(1155,'复兴区',142,2,3),(1156,'邯山区',142,2,3),(1157,'峰峰矿区',142,2,3),(1158,'武安市',142,2,3),(1159,'邯郸县',142,2,3),(1160,'临漳县',142,2,3),(1161,'成安县',142,2,3),(1162,'大名县',142,2,3),(1163,'涉县',142,2,3),(1164,'磁县',142,2,3),(1165,'肥乡县',142,2,3),(1166,'永年县',142,2,3),(1167,'邱县',142,2,3),(1168,'鸡泽县',142,2,3),(1169,'广平县',142,2,3),(1170,'馆陶县',142,2,3),(1171,'魏县',142,2,3),(1172,'曲周县',142,2,3),(1173,'桃城区',143,2,3),(1174,'冀州市',143,2,3),(1175,'深州市',143,2,3),(1176,'枣强县',143,2,3),(1177,'武邑县',143,2,3),(1178,'武强县',143,2,3),(1179,'饶阳县',143,2,3),(1180,'安平县',143,2,3),(1181,'故城县',143,2,3),(1182,'景县',143,2,3),(1183,'阜城县',143,2,3),(1184,'安次区',144,2,3),(1185,'广阳区',144,2,3),(1186,'霸州市',144,2,3),(1187,'三河市',144,2,3),(1188,'固安县',144,2,3),(1189,'永清县',144,2,3),(1190,'香河县',144,2,3),(1191,'大城县',144,2,3),(1192,'文安县',144,2,3),(1193,'大厂',144,2,3),(1194,'海港区',145,2,3),(1195,'山海关区',145,2,3),(1196,'北戴河区',145,2,3),(1197,'昌黎县',145,2,3),(1198,'抚宁县',145,2,3),(1199,'卢龙县',145,2,3),(1200,'青龙',145,2,3),(1201,'路北区',146,2,3),(1202,'路南区',146,2,3),(1203,'古冶区',146,2,3),(1204,'开平区',146,2,3),(1205,'丰南区',146,2,3),(1206,'丰润区',146,2,3),(1207,'遵化市',146,2,3),(1208,'迁安市',146,2,3),(1209,'滦县',146,2,3),(1210,'滦南县',146,2,3),(1211,'乐亭县',146,2,3),(1212,'迁西县',146,2,3),(1213,'玉田县',146,2,3),(1214,'唐海县',146,2,3),(1215,'桥东区',147,2,3),(1216,'桥西区',147,2,3),(1217,'南宫市',147,2,3),(1218,'沙河市',147,2,3),(1219,'邢台县',147,2,3),(1220,'临城县',147,2,3),(1221,'内丘县',147,2,3),(1222,'柏乡县',147,2,3),(1223,'隆尧县',147,2,3),(1224,'任县',147,2,3),(1225,'南和县',147,2,3),(1226,'宁晋县',147,2,3),(1227,'巨鹿县',147,2,3),(1228,'新河县',147,2,3),(1229,'广宗县',147,2,3),(1230,'平乡县',147,2,3),(1231,'威县',147,2,3),(1232,'清河县',147,2,3),(1233,'临西县',147,2,3),(1234,'桥西区',148,2,3),(1235,'桥东区',148,2,3),(1236,'宣化区',148,2,3),(1237,'下花园区',148,2,3),(1238,'宣化县',148,2,3),(1239,'张北县',148,2,3),(1240,'康保县',148,2,3),(1241,'沽源县',148,2,3),(1242,'尚义县',148,2,3),(1243,'蔚县',148,2,3),(1244,'阳原县',148,2,3),(1245,'怀安县',148,2,3),(1246,'万全县',148,2,3),(1247,'怀来县',148,2,3),(1248,'涿鹿县',148,2,3),(1249,'赤城县',148,2,3),(1250,'崇礼县',148,2,3),(2162,'回民区',258,2,3),(2163,'玉泉区',258,2,3),(2164,'新城区',258,2,3),(2165,'赛罕区',258,2,3),(2166,'清水河县',258,2,3),(2167,'土默特左旗',258,2,3),(2168,'托克托县',258,2,3),(2169,'和林格尔县',258,2,3),(2170,'武川县',258,2,3),(2171,'阿拉善左旗',259,2,3),(2172,'阿拉善右旗',259,2,3),(2173,'额济纳旗',259,2,3),(2174,'临河区',260,2,3),(2175,'五原县',260,2,3),(2176,'磴口县',260,2,3),(2177,'乌拉特前旗',260,2,3),(2178,'乌拉特中旗',260,2,3),(2179,'乌拉特后旗',260,2,3),(2180,'杭锦后旗',260,2,3),(2181,'昆都仑区',261,2,3),(2182,'青山区',261,2,3),(2183,'东河区',261,2,3),(2184,'九原区',261,2,3),(2185,'石拐区',261,2,3),(2186,'白云矿区',261,2,3),(2187,'土默特右旗',261,2,3),(2188,'固阳县',261,2,3),(2189,'达尔罕茂明安联合旗',261,2,3),(2190,'红山区',262,2,3),(2191,'元宝山区',262,2,3),(2192,'松山区',262,2,3),(2193,'阿鲁科尔沁旗',262,2,3),(2194,'巴林左旗',262,2,3),(2195,'巴林右旗',262,2,3),(2196,'林西县',262,2,3),(2197,'克什克腾旗',262,2,3),(2198,'翁牛特旗',262,2,3),(2199,'喀喇沁旗',262,2,3),(2200,'宁城县',262,2,3),(2201,'敖汉旗',262,2,3),(2202,'东胜区',263,2,3),(2203,'达拉特旗',263,2,3),(2204,'准格尔旗',263,2,3),(2205,'鄂托克前旗',263,2,3),(2206,'鄂托克旗',263,2,3),(2207,'杭锦旗',263,2,3),(2208,'乌审旗',263,2,3),(2209,'伊金霍洛旗',263,2,3),(2210,'海拉尔区',264,2,3),(2211,'莫力达瓦',264,2,3),(2212,'满洲里市',264,2,3),(2213,'牙克石市',264,2,3),(2214,'扎兰屯市',264,2,3),(2215,'额尔古纳市',264,2,3),(2216,'根河市',264,2,3),(2217,'阿荣旗',264,2,3),(2218,'鄂伦春自治旗',264,2,3),(2219,'鄂温克族自治旗',264,2,3),(2220,'陈巴尔虎旗',264,2,3),(2221,'新巴尔虎左旗',264,2,3),(2222,'新巴尔虎右旗',264,2,3),(2223,'科尔沁区',265,2,3),(2224,'霍林郭勒市',265,2,3),(2225,'科尔沁左翼中旗',265,2,3),(2226,'科尔沁左翼后旗',265,2,3),(2227,'开鲁县',265,2,3),(2228,'库伦旗',265,2,3),(2229,'奈曼旗',265,2,3),(2230,'扎鲁特旗',265,2,3),(2231,'海勃湾区',266,2,3),(2232,'乌达区',266,2,3),(2233,'海南区',266,2,3),(2234,'化德县',267,2,3),(2235,'集宁区',267,2,3),(2236,'丰镇市',267,2,3),(2237,'卓资县',267,2,3),(2238,'商都县',267,2,3),(2239,'兴和县',267,2,3),(2240,'凉城县',267,2,3),(2241,'察哈尔右翼前旗',267,2,3),(2242,'察哈尔右翼中旗',267,2,3),(2243,'察哈尔右翼后旗',267,2,3),(2244,'四子王旗',267,2,3),(2245,'二连浩特市',268,2,3),(2246,'锡林浩特市',268,2,3),(2247,'阿巴嘎旗',268,2,3),(2248,'苏尼特左旗',268,2,3),(2249,'苏尼特右旗',268,2,3),(2250,'东乌珠穆沁旗',268,2,3),(2251,'西乌珠穆沁旗',268,2,3),(2252,'太仆寺旗',268,2,3),(2253,'镶黄旗',268,2,3),(2254,'正镶白旗',268,2,3),(2255,'正蓝旗',268,2,3),(2256,'多伦县',268,2,3),(2257,'乌兰浩特市',269,2,3),(2258,'阿尔山市',269,2,3),(2259,'科尔沁右翼前旗',269,2,3),(2260,'科尔沁右翼中旗',269,2,3),(2261,'扎赉特旗',269,2,3),(2262,'突泉县',269,2,3),(2332,'市中区',283,2,3),(2333,'历下区',283,2,3),(2334,'天桥区',283,2,3),(2335,'槐荫区',283,2,3),(2336,'历城区',283,2,3),(2337,'长清区',283,2,3),(2338,'章丘市',283,2,3),(2339,'平阴县',283,2,3),(2340,'济阳县',283,2,3),(2341,'商河县',283,2,3),(2342,'市南区',284,2,3),(2343,'市北区',284,2,3),(2344,'城阳区',284,2,3),(2345,'四方区',284,2,3),(2346,'李沧区',284,2,3),(2347,'黄岛区',284,2,3),(2348,'崂山区',284,2,3),(2349,'胶州市',284,2,3),(2350,'即墨市',284,2,3),(2351,'平度市',284,2,3),(2352,'胶南市',284,2,3),(2353,'莱西市',284,2,3),(2354,'滨城区',285,2,3),(2355,'惠民县',285,2,3),(2356,'阳信县',285,2,3),(2357,'无棣县',285,2,3),(2358,'沾化县',285,2,3),(2359,'博兴县',285,2,3),(2360,'邹平县',285,2,3),(2361,'德城区',286,2,3),(2362,'陵县',286,2,3),(2363,'乐陵市',286,2,3),(2364,'禹城市',286,2,3),(2365,'宁津县',286,2,3),(2366,'庆云县',286,2,3),(2367,'临邑县',286,2,3),(2368,'齐河县',286,2,3),(2369,'平原县',286,2,3),(2370,'夏津县',286,2,3),(2371,'武城县',286,2,3),(2372,'东营区',287,2,3),(2373,'河口区',287,2,3),(2374,'垦利县',287,2,3),(2375,'利津县',287,2,3),(2376,'广饶县',287,2,3),(2377,'牡丹区',288,2,3),(2378,'曹县',288,2,3),(2379,'单县',288,2,3),(2380,'成武县',288,2,3),(2381,'巨野县',288,2,3),(2382,'郓城县',288,2,3),(2383,'鄄城县',288,2,3),(2384,'定陶县',288,2,3),(2385,'东明县',288,2,3),(2386,'市中区',289,2,3),(2387,'任城区',289,2,3),(2388,'曲阜市',289,2,3),(2389,'兖州市',289,2,3),(2390,'邹城市',289,2,3),(2391,'微山县',289,2,3),(2392,'鱼台县',289,2,3),(2393,'金乡县',289,2,3),(2394,'嘉祥县',289,2,3),(2395,'汶上县',289,2,3),(2396,'泗水县',289,2,3),(2397,'梁山县',289,2,3),(2398,'莱城区',290,2,3),(2399,'钢城区',290,2,3),(2400,'东昌府区',291,2,3),(2401,'临清市',291,2,3),(2402,'阳谷县',291,2,3),(2403,'莘县',291,2,3),(2404,'茌平县',291,2,3),(2405,'东阿县',291,2,3),(2406,'冠县',291,2,3),(2407,'高唐县',291,2,3),(2408,'兰山区',292,2,3),(2409,'罗庄区',292,2,3),(2410,'河东区',292,2,3),(2411,'沂南县',292,2,3),(2412,'郯城县',292,2,3),(2413,'沂水县',292,2,3),(2414,'苍山县',292,2,3),(2415,'费县',292,2,3),(2416,'平邑县',292,2,3),(2417,'莒南县',292,2,3),(2418,'蒙阴县',292,2,3),(2419,'临沭县',292,2,3),(2420,'东港区',293,2,3),(2421,'岚山区',293,2,3),(2422,'五莲县',293,2,3),(2423,'莒县',293,2,3),(2424,'泰山区',294,2,3),(2425,'岱岳区',294,2,3),(2426,'新泰市',294,2,3),(2427,'肥城市',294,2,3),(2428,'宁阳县',294,2,3),(2429,'东平县',294,2,3),(2430,'荣成市',295,2,3),(2431,'乳山市',295,2,3),(2432,'环翠区',295,2,3),(2433,'文登市',295,2,3),(2434,'潍城区',296,2,3),(2435,'寒亭区',296,2,3),(2436,'坊子区',296,2,3),(2437,'奎文区',296,2,3),(2438,'青州市',296,2,3),(2439,'诸城市',296,2,3),(2440,'寿光市',296,2,3),(2441,'安丘市',296,2,3),(2442,'高密市',296,2,3),(2443,'昌邑市',296,2,3),(2444,'临朐县',296,2,3),(2445,'昌乐县',296,2,3),(2446,'芝罘区',297,2,3),(2447,'福山区',297,2,3),(2448,'牟平区',297,2,3),(2449,'莱山区',297,2,3),(2450,'开发区',297,2,3),(2451,'龙口市',297,2,3),(2452,'莱阳市',297,2,3),(2453,'莱州市',297,2,3),(2454,'蓬莱市',297,2,3),(2455,'招远市',297,2,3),(2456,'栖霞市',297,2,3),(2457,'海阳市',297,2,3),(2458,'长岛县',297,2,3),(2459,'市中区',298,2,3),(2460,'山亭区',298,2,3),(2461,'峄城区',298,2,3),(2462,'台儿庄区',298,2,3),(2463,'薛城区',298,2,3),(2464,'滕州市',298,2,3),(2465,'张店区',299,2,3),(2466,'临淄区',299,2,3),(2467,'淄川区',299,2,3),(2468,'博山区',299,2,3),(2469,'周村区',299,2,3),(2470,'桓台县',299,2,3),(2471,'高青县',299,2,3),(2472,'沂源县',299,2,3),(2473,'杏花岭区',300,2,3),(2474,'小店区',300,2,3),(2475,'迎泽区',300,2,3),(2476,'尖草坪区',300,2,3),(2477,'万柏林区',300,2,3),(2478,'晋源区',300,2,3),(2479,'高新开发区',300,2,3),(2480,'民营经济开发区',300,2,3),(2481,'经济技术开发区',300,2,3),(2482,'清徐县',300,2,3),(2483,'阳曲县',300,2,3),(2484,'娄烦县',300,2,3),(2485,'古交市',300,2,3),(2486,'城区',301,2,3),(2487,'郊区',301,2,3),(2488,'沁县',301,2,3),(2489,'潞城市',301,2,3),(2490,'长治县',301,2,3),(2491,'襄垣县',301,2,3),(2492,'屯留县',301,2,3),(2493,'平顺县',301,2,3),(2494,'黎城县',301,2,3),(2495,'壶关县',301,2,3),(2496,'长子县',301,2,3),(2497,'武乡县',301,2,3),(2498,'沁源县',301,2,3),(2499,'城区',302,2,3),(2500,'矿区',302,2,3),(2501,'南郊区',302,2,3),(2502,'新荣区',302,2,3),(2503,'阳高县',302,2,3),(2504,'天镇县',302,2,3),(2505,'广灵县',302,2,3),(2506,'灵丘县',302,2,3),(2507,'浑源县',302,2,3),(2508,'左云县',302,2,3),(2509,'大同县',302,2,3),(2510,'城区',303,2,3),(2511,'高平市',303,2,3),(2512,'沁水县',303,2,3),(2513,'阳城县',303,2,3),(2514,'陵川县',303,2,3),(2515,'泽州县',303,2,3),(2516,'榆次区',304,2,3),(2517,'介休市',304,2,3),(2518,'榆社县',304,2,3),(2519,'左权县',304,2,3),(2520,'和顺县',304,2,3),(2521,'昔阳县',304,2,3),(2522,'寿阳县',304,2,3),(2523,'太谷县',304,2,3),(2524,'祁县',304,2,3),(2525,'平遥县',304,2,3),(2526,'灵石县',304,2,3),(2527,'尧都区',305,2,3),(2528,'侯马市',305,2,3),(2529,'霍州市',305,2,3),(2530,'曲沃县',305,2,3),(2531,'翼城县',305,2,3),(2532,'襄汾县',305,2,3),(2533,'洪洞县',305,2,3),(2534,'吉县',305,2,3),(2535,'安泽县',305,2,3),(2536,'浮山县',305,2,3),(2537,'古县',305,2,3),(2538,'乡宁县',305,2,3),(2539,'大宁县',305,2,3),(2540,'隰县',305,2,3),(2541,'永和县',305,2,3),(2542,'蒲县',305,2,3),(2543,'汾西县',305,2,3),(2544,'离石市',306,2,3),(2545,'离石区',306,2,3),(2546,'孝义市',306,2,3),(2547,'汾阳市',306,2,3),(2548,'文水县',306,2,3),(2549,'交城县',306,2,3),(2550,'兴县',306,2,3),(2551,'临县',306,2,3),(2552,'柳林县',306,2,3),(2553,'石楼县',306,2,3),(2554,'岚县',306,2,3),(2555,'方山县',306,2,3),(2556,'中阳县',306,2,3),(2557,'交口县',306,2,3),(2558,'朔城区',307,2,3),(2559,'平鲁区',307,2,3),(2560,'山阴县',307,2,3),(2561,'应县',307,2,3),(2562,'右玉县',307,2,3),(2563,'怀仁县',307,2,3),(2564,'忻府区',308,2,3),(2565,'原平市',308,2,3),(2566,'定襄县',308,2,3),(2567,'五台县',308,2,3),(2568,'代县',308,2,3),(2569,'繁峙县',308,2,3),(2570,'宁武县',308,2,3),(2571,'静乐县',308,2,3),(2572,'神池县',308,2,3),(2573,'五寨县',308,2,3),(2574,'岢岚县',308,2,3),(2575,'河曲县',308,2,3),(2576,'保德县',308,2,3),(2577,'偏关县',308,2,3),(2578,'城区',309,2,3),(2579,'矿区',309,2,3),(2580,'郊区',309,2,3),(2581,'平定县',309,2,3),(2582,'盂县',309,2,3),(2583,'盐湖区',310,2,3),(2584,'永济市',310,2,3),(2585,'河津市',310,2,3),(2586,'临猗县',310,2,3),(2587,'万荣县',310,2,3),(2588,'闻喜县',310,2,3),(2589,'稷山县',310,2,3),(2590,'新绛县',310,2,3),(2591,'绛县',310,2,3),(2592,'垣曲县',310,2,3),(2593,'夏县',310,2,3),(2594,'平陆县',310,2,3),(2595,'芮城县',310,2,3),(2912,'和平区',343,2,3),(2913,'河西区',343,2,3),(2914,'南开区',343,2,3),(2915,'河北区',343,2,3),(2916,'河东区',343,2,3),(2917,'红桥区',343,2,3),(2918,'东丽区',343,2,3),(2919,'津南区',343,2,3),(2920,'西青区',343,2,3),(2921,'北辰区',343,2,3),(2922,'塘沽区',343,2,3),(2923,'汉沽区',343,2,3),(2924,'大港区',343,2,3),(2925,'武清区',343,2,3),(2926,'宝坻区',343,2,3),(2927,'经济开发区',343,2,3),(2928,'宁河县',343,2,3),(2929,'静海县',343,2,3),(2930,'蓟县',343,2,3),(1415,'道里区',167,2,3),(1416,'南岗区',167,2,3),(1417,'动力区',167,2,3),(1418,'平房区',167,2,3),(1419,'香坊区',167,2,3),(1420,'太平区',167,2,3),(1421,'道外区',167,2,3),(1422,'阿城区',167,2,3),(1423,'呼兰区',167,2,3),(1424,'松北区',167,2,3),(1425,'尚志市',167,2,3),(1426,'双城市',167,2,3),(1427,'五常市',167,2,3),(1428,'方正县',167,2,3),(1429,'宾县',167,2,3),(1430,'依兰县',167,2,3),(1431,'巴彦县',167,2,3),(1432,'通河县',167,2,3),(1433,'木兰县',167,2,3),(1434,'延寿县',167,2,3),(1435,'萨尔图区',168,2,3),(1436,'红岗区',168,2,3),(1437,'龙凤区',168,2,3),(1438,'让胡路区',168,2,3),(1439,'大同区',168,2,3),(1440,'肇州县',168,2,3),(1441,'肇源县',168,2,3),(1442,'林甸县',168,2,3),(1443,'杜尔伯特',168,2,3),(1444,'呼玛县',169,2,3),(1445,'漠河县',169,2,3),(1446,'塔河县',169,2,3),(1447,'兴山区',170,2,3),(1448,'工农区',170,2,3),(1449,'南山区',170,2,3),(1450,'兴安区',170,2,3),(1451,'向阳区',170,2,3),(1452,'东山区',170,2,3),(1453,'萝北县',170,2,3),(1454,'绥滨县',170,2,3),(1455,'爱辉区',171,2,3),(1456,'五大连池市',171,2,3),(1457,'北安市',171,2,3),(1458,'嫩江县',171,2,3),(1459,'逊克县',171,2,3),(1460,'孙吴县',171,2,3),(1461,'鸡冠区',172,2,3),(1462,'恒山区',172,2,3),(1463,'城子河区',172,2,3),(1464,'滴道区',172,2,3),(1465,'梨树区',172,2,3),(1466,'虎林市',172,2,3),(1467,'密山市',172,2,3),(1468,'鸡东县',172,2,3),(1469,'前进区',173,2,3),(1470,'郊区',173,2,3),(1471,'向阳区',173,2,3),(1472,'东风区',173,2,3),(1473,'同江市',173,2,3),(1474,'富锦市',173,2,3),(1475,'桦南县',173,2,3),(1476,'桦川县',173,2,3),(1477,'汤原县',173,2,3),(1478,'抚远县',173,2,3),(1479,'爱民区',174,2,3),(1480,'东安区',174,2,3),(1481,'阳明区',174,2,3),(1482,'西安区',174,2,3),(1483,'绥芬河市',174,2,3),(1484,'海林市',174,2,3),(1485,'宁安市',174,2,3),(1486,'穆棱市',174,2,3),(1487,'东宁县',174,2,3),(1488,'林口县',174,2,3),(1489,'桃山区',175,2,3),(1490,'新兴区',175,2,3),(1491,'茄子河区',175,2,3),(1492,'勃利县',175,2,3),(1493,'龙沙区',176,2,3),(1494,'昂昂溪区',176,2,3),(1495,'铁峰区',176,2,3),(1496,'建华区',176,2,3),(1497,'富拉尔基区',176,2,3),(1498,'碾子山区',176,2,3),(1499,'梅里斯达斡尔区',176,2,3),(1500,'讷河市',176,2,3),(1501,'龙江县',176,2,3),(1502,'依安县',176,2,3),(1503,'泰来县',176,2,3),(1504,'甘南县',176,2,3),(1505,'富裕县',176,2,3),(1506,'克山县',176,2,3),(1507,'克东县',176,2,3),(1508,'拜泉县',176,2,3),(1509,'尖山区',177,2,3),(1510,'岭东区',177,2,3),(1511,'四方台区',177,2,3),(1512,'宝山区',177,2,3),(1513,'集贤县',177,2,3),(1514,'友谊县',177,2,3),(1515,'宝清县',177,2,3),(1516,'饶河县',177,2,3),(1517,'北林区',178,2,3),(1518,'安达市',178,2,3),(1519,'肇东市',178,2,3),(1520,'海伦市',178,2,3),(1521,'望奎县',178,2,3),(1522,'兰西县',178,2,3),(1523,'青冈县',178,2,3),(1524,'庆安县',178,2,3),(1525,'明水县',178,2,3),(1526,'绥棱县',178,2,3),(1527,'伊春区',179,2,3),(1528,'带岭区',179,2,3),(1529,'南岔区',179,2,3),(1530,'金山屯区',179,2,3),(1531,'西林区',179,2,3),(1532,'美溪区',179,2,3),(1533,'乌马河区',179,2,3),(1534,'翠峦区',179,2,3),(1535,'友好区',179,2,3),(1536,'上甘岭区',179,2,3),(1537,'五营区',179,2,3),(1538,'红星区',179,2,3),(1539,'新青区',179,2,3),(1540,'汤旺河区',179,2,3),(1541,'乌伊岭区',179,2,3),(1542,'铁力市',179,2,3),(1543,'嘉荫县',179,2,3),(1770,'朝阳区',211,2,3),(1771,'宽城区',211,2,3),(1772,'二道区',211,2,3),(1773,'南关区',211,2,3),(1774,'绿园区',211,2,3),(1775,'双阳区',211,2,3),(1776,'净月潭开发区',211,2,3),(1777,'高新技术开发区',211,2,3),(1778,'经济技术开发区',211,2,3),(1779,'汽车产业开发区',211,2,3),(1780,'德惠市',211,2,3),(1781,'九台市',211,2,3),(1782,'榆树市',211,2,3),(1783,'农安县',211,2,3),(1784,'船营区',212,2,3),(1785,'昌邑区',212,2,3),(1786,'龙潭区',212,2,3),(1787,'丰满区',212,2,3),(1788,'蛟河市',212,2,3),(1789,'桦甸市',212,2,3),(1790,'舒兰市',212,2,3),(1791,'磐石市',212,2,3),(1792,'永吉县',212,2,3),(1793,'洮北区',213,2,3),(1794,'洮南市',213,2,3),(1795,'大安市',213,2,3),(1796,'镇赉县',213,2,3),(1797,'通榆县',213,2,3),(1798,'江源区',214,2,3),(1799,'八道江区',214,2,3),(1800,'长白',214,2,3),(1801,'临江市',214,2,3),(1802,'抚松县',214,2,3),(1803,'靖宇县',214,2,3),(1804,'龙山区',215,2,3),(1805,'西安区',215,2,3),(1806,'东丰县',215,2,3),(1807,'东辽县',215,2,3),(1808,'铁西区',216,2,3),(1809,'铁东区',216,2,3),(1810,'伊通',216,2,3),(1811,'公主岭市',216,2,3),(1812,'双辽市',216,2,3),(1813,'梨树县',216,2,3),(1814,'前郭尔罗斯',217,2,3),(1815,'宁江区',217,2,3),(1816,'长岭县',217,2,3),(1817,'乾安县',217,2,3),(1818,'扶余县',217,2,3),(1819,'东昌区',218,2,3),(1820,'二道江区',218,2,3),(1821,'梅河口市',218,2,3),(1822,'集安市',218,2,3),(1823,'通化县',218,2,3),(1824,'辉南县',218,2,3),(1825,'柳河县',218,2,3),(1826,'延吉市',219,2,3),(1827,'图们市',219,2,3),(1828,'敦化市',219,2,3),(1829,'珲春市',219,2,3),(1830,'龙井市',219,2,3),(1831,'和龙市',219,2,3),(1832,'安图县',219,2,3),(1833,'汪清县',219,2,3),(2060,'沈河区',244,2,3),(2061,'皇姑区',244,2,3),(2062,'和平区',244,2,3),(2063,'大东区',244,2,3),(2064,'铁西区',244,2,3),(2065,'苏家屯区',244,2,3),(2066,'东陵区',244,2,3),(2067,'沈北新区',244,2,3),(2068,'于洪区',244,2,3),(2069,'浑南新区',244,2,3),(2070,'新民市',244,2,3),(2071,'辽中县',244,2,3),(2072,'康平县',244,2,3),(2073,'法库县',244,2,3),(2074,'西岗区',245,2,3),(2075,'中山区',245,2,3),(2076,'沙河口区',245,2,3),(2077,'甘井子区',245,2,3),(2078,'旅顺口区',245,2,3),(2079,'金州区',245,2,3),(2080,'开发区',245,2,3),(2081,'瓦房店市',245,2,3),(2082,'普兰店市',245,2,3),(2083,'庄河市',245,2,3),(2084,'长海县',245,2,3),(2085,'铁东区',246,2,3),(2086,'铁西区',246,2,3),(2087,'立山区',246,2,3),(2088,'千山区',246,2,3),(2089,'岫岩',246,2,3),(2090,'海城市',246,2,3),(2091,'台安县',246,2,3),(2092,'本溪',247,2,3),(2093,'平山区',247,2,3),(2094,'明山区',247,2,3),(2095,'溪湖区',247,2,3),(2096,'南芬区',247,2,3),(2097,'桓仁',247,2,3),(2098,'双塔区',248,2,3),(2099,'龙城区',248,2,3),(2100,'喀喇沁左翼蒙古族自治县',248,2,3),(2101,'北票市',248,2,3),(2102,'凌源市',248,2,3),(2103,'朝阳县',248,2,3),(2104,'建平县',248,2,3),(2105,'振兴区',249,2,3),(2106,'元宝区',249,2,3),(2107,'振安区',249,2,3),(2108,'宽甸',249,2,3),(2109,'东港市',249,2,3),(2110,'凤城市',249,2,3),(2111,'顺城区',250,2,3),(2112,'新抚区',250,2,3),(2113,'东洲区',250,2,3),(2114,'望花区',250,2,3),(2115,'清原',250,2,3),(2116,'新宾',250,2,3),(2117,'抚顺县',250,2,3),(2118,'阜新',251,2,3),(2119,'海州区',251,2,3),(2120,'新邱区',251,2,3),(2121,'太平区',251,2,3),(2122,'清河门区',251,2,3),(2123,'细河区',251,2,3),(2124,'彰武县',251,2,3),(2125,'龙港区',252,2,3),(2126,'南票区',252,2,3),(2127,'连山区',252,2,3),(2128,'兴城市',252,2,3),(2129,'绥中县',252,2,3),(2130,'建昌县',252,2,3),(2131,'太和区',253,2,3),(2132,'古塔区',253,2,3),(2133,'凌河区',253,2,3),(2134,'凌海市',253,2,3),(2135,'北镇市',253,2,3),(2136,'黑山县',253,2,3),(2137,'义县',253,2,3),(2138,'白塔区',254,2,3),(2139,'文圣区',254,2,3),(2140,'宏伟区',254,2,3),(2141,'太子河区',254,2,3),(2142,'弓长岭区',254,2,3),(2143,'灯塔市',254,2,3),(2144,'辽阳县',254,2,3),(2145,'双台子区',255,2,3),(2146,'兴隆台区',255,2,3),(2147,'大洼县',255,2,3),(2148,'盘山县',255,2,3),(2149,'银州区',256,2,3),(2150,'清河区',256,2,3),(2151,'调兵山市',256,2,3),(2152,'开原市',256,2,3),(2153,'铁岭县',256,2,3),(2154,'西丰县',256,2,3),(2155,'昌图县',256,2,3),(2156,'站前区',257,2,3),(2157,'西市区',257,2,3),(2158,'鲅鱼圈区',257,2,3),(2159,'老边区',257,2,3),(2160,'盖州市',257,2,3),(2161,'大石桥市',257,2,3),(1,'中国',0,2,0);
/*!40000 ALTER TABLE `zytc_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_shop`
--

DROP TABLE IF EXISTS `zytc_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_shop` (
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺索引id',
  `shop_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `shop_type` int(11) NOT NULL COMMENT '店铺类型等级',
  `uid` int(11) NOT NULL COMMENT '会员id',
  `shop_company_name` varchar(50) DEFAULT NULL COMMENT '店铺公司名称',
  `province_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '店铺所在省份ID',
  `city_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '店铺所在市ID',
  `shop_address` varchar(100) NOT NULL DEFAULT '' COMMENT '详细地区',
  `shop_state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '店铺状态，0关闭，1开启，2审核中',
  `shop_close_info` varchar(255) DEFAULT NULL COMMENT '店铺关闭原因',
  `shop_sort` int(11) NOT NULL DEFAULT '0' COMMENT '店铺排序',
  `shop_create_time` datetime DEFAULT NULL COMMENT '店铺时间',
  `shop_end_time` datetime DEFAULT NULL COMMENT '店铺关闭时间',
  `shop_logo` varchar(255) DEFAULT NULL COMMENT '店铺logo',
  `shop_banner` varchar(255) DEFAULT NULL COMMENT '店铺横幅',
  `shop_avatar` varchar(150) DEFAULT NULL COMMENT '店铺头像',
  `shop_keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺seo关键字',
  `shop_description` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺seo描述',
  `shop_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐，0为否，1为是，默认为0',
  `shop_collect` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺收藏数量',
  `shop_platform_commission_rate` decimal(10,2) NOT NULL DEFAULT '0.01' COMMENT '平台抽取佣金比率',
  `shop_weixinpay_rate` decimal(10,2) DEFAULT '0.01',
  `shoptitle` varchar(45) DEFAULT NULL,
  `provincename` varchar(45) DEFAULT '',
  `cityname` varchar(45) DEFAULT '',
  `shopcontact` varchar(20) DEFAULT NULL,
  `shop_qrcode` varchar(256) DEFAULT NULL,
  `shopsales` int(11) DEFAULT '0',
  PRIMARY KEY (`shop_id`),
  KEY `INDEX_CITYID` (`city_id`),
  KEY `INDEX_STATE` (`shop_state`),
  KEY `INDEX_UID` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='店铺数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_shop`
--

LOCK TABLES `zytc_shop` WRITE;
/*!40000 ALTER TABLE `zytc_shop` DISABLE KEYS */;
INSERT INTO `zytc_shop` VALUES (45,'安阳特产',1,293,'',16,156,'安阳市',0,'未开业',1,NULL,NULL,'','','','','地方饮食\n特色餐饮：道口烧鸡、老庙牛肉 \n安阳美食\n、安阳三熏、曹马芝麻糖、三不沾、安阳燎花。\n地方小吃：扁粉菜、粉浆饭、安阳烩菜、皮渣、血糕、内黄灌肠、关家酥烧饼。安阳血糕为著名风味小吃，用荞麦面、猪血佐以其它配料蒸制成糕，然后切片油炸，抹上蒜汁后食用。\n土特产：内黄大枣、山楂、核桃、阳梨、板栗、大红袍花椒、林州东姚小米等。',0,3,0.01,0.01,NULL,'河南省','安阳市',NULL,NULL,0),(46,'周口特产',1,294,'',16,167,'周口市',0,NULL,1,NULL,NULL,'','','','','红颜总的小店d',0,9,0.01,0.01,NULL,'河南省','周口市',NULL,NULL,0),(47,'安康特产',1,295,'',27,296,'安康市',0,'未开张',1,NULL,NULL,NULL,NULL,NULL,'','',0,1,0.01,0.01,NULL,'陕西省','安康市',NULL,NULL,0),(48,'许昌特产',1,296,'',16,161,'许昌市',1,NULL,1,NULL,NULL,'http://www.imgtqbu.weiruikj.cn/Fs32xo_EjWT7D_a1Ry1gmDsQKx9v','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1547643581','http://www.imgtqcommon.weiruikj.cn/FsOw1FMgoCpsmK4M_ml6KLwDDN46','','许昌 三国时期魏都，地处中原，地方红薯粉条，腐竹远近闻名',0,5,0.00,0.00,NULL,'河南省','许昌市','18637568680','',100),(53,'阿克苏特产',1,306,'',31,332,'许昌魏都区',1,NULL,0,NULL,NULL,'https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1546588384','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1546588427','https://tqxjbu-1256942653.cos.ap-chengdu.myqcloud.com/tqxj_img_shop/s__1546588431','','阿克苏在维吾尔语里意为&quot;清澈的水&quot;素有&quot;塞外江南&quot;之美称，这里降水稀少，气候干燥，但密布水系，水流量丰富，滋养这这片肥美的绿洲。',0,0,0.01,0.01,NULL,'新疆维吾尔自治区','阿克苏地区','18637468680','',18);
/*!40000 ALTER TABLE `zytc_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_shop_account`
--

DROP TABLE IF EXISTS `zytc_shop_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_shop_account` (
  `shop_id` int(11) NOT NULL,
  `shop_profit` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '店铺总营业额',
  `shop_total_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '店铺当前余额',
  `shop_proceeds` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '店铺收益总额',
  `shop_platform_commission` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '平台抽取店铺利润总额',
  `shop_withdraw` decimal(10,2) NOT NULL DEFAULT '1.00' COMMENT '店铺提现总额',
  `shop_weixin_commission` decimal(10,2) NOT NULL DEFAULT '0.60',
  `shop_total_money_lock` decimal(10,2) DEFAULT '0.00' COMMENT '提现过程的绑定金额',
  `dayincome` decimal(10,2) DEFAULT '0.00',
  `dayordercount` int(11) DEFAULT '0',
  `monthincome` decimal(10,2) DEFAULT '0.00',
  `monthordercount` int(11) DEFAULT '0',
  PRIMARY KEY (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=2340 COMMENT='店铺账户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_shop_account`
--

LOCK TABLES `zytc_shop_account` WRITE;
/*!40000 ALTER TABLE `zytc_shop_account` DISABLE KEYS */;
INSERT INTO `zytc_shop_account` VALUES (48,785.55,862.65,739.88,0.00,16.00,0.60,0.00,156.00,2,345.00,9),(49,0.00,0.00,0.00,0.00,1.00,0.60,0.00,0.00,0,0.00,0),(50,0.00,0.00,0.00,0.00,1.00,0.60,0.00,0.00,0,0.00,0),(51,0.00,0.00,0.00,0.00,1.00,0.60,0.00,0.00,0,0.00,0),(52,0.00,0.00,0.00,0.00,1.00,0.60,0.00,0.00,0,0.00,0),(53,0.00,0.00,0.00,0.00,1.00,0.60,0.00,0.00,0,0.00,0);
/*!40000 ALTER TABLE `zytc_shop_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_shop_account_proceeds_records`
--

DROP TABLE IF EXISTS `zytc_shop_account_proceeds_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_shop_account_proceeds_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺ID  0标识平台',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '相关金额',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '简单描述',
  `order_id` int(11) DEFAULT '0',
  `proceeds_type` int(11) DEFAULT '1' COMMENT '1 推广消费返利 2 下线消费返利',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='店铺收益总额的记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_shop_account_proceeds_records`
--

LOCK TABLES `zytc_shop_account_proceeds_records` WRITE;
/*!40000 ALTER TABLE `zytc_shop_account_proceeds_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `zytc_shop_account_proceeds_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_shop_account_records`
--

DROP TABLE IF EXISTS `zytc_shop_account_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_shop_account_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL COMMENT '店铺ID  0标识平台',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '相关金额',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '发生方式 1 入账 2提现',
  `refid` int(11) NOT NULL COMMENT '相关ID号 orderid withdrewid',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '店铺的可用余额',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '简单描述',
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `INDEX_SHOPID` (`shop_id`),
  KEY `INDEX_REFID` (`refid`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=5461 COMMENT='店铺账户记录管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_shop_account_records`
--

LOCK TABLES `zytc_shop_account_records` WRITE;
/*!40000 ALTER TABLE `zytc_shop_account_records` DISABLE KEYS */;
INSERT INTO `zytc_shop_account_records` VALUES (1,48,32.60,1,180,204.79,'2018-10-15 18:01:41','',0),(2,48,31.02,1,180,235.81,'2018-10-22 17:06:28','',0),(3,48,20.00,1,258,255.81,'2018-11-21 22:20:47','',0),(4,48,5.64,1,287,261.45,'2018-11-30 21:04:28','',0),(5,48,23.50,1,295,284.95,'2018-12-22 15:30:57','',0),(6,48,77.95,1,298,362.90,'2018-12-27 10:01:49','',0),(7,48,116.00,1,290,478.90,'2018-12-27 10:18:35','',0),(8,48,23.20,1,294,502.10,'2018-12-27 11:13:05','',0),(9,48,23.20,1,354,525.30,'2018-12-31 22:56:48','',0),(10,48,23.50,1,339,548.80,'2019-01-04 11:07:11','',0),(11,48,73.32,1,367,622.12,'2019-01-13 22:04:04','',0),(12,48,5.73,1,410,627.85,'2019-01-16 21:37:05','',0),(13,48,3.67,1,405,631.52,'2019-01-19 10:42:47','',0),(14,48,23.50,1,338,655.02,'2019-01-19 11:10:34','',0),(15,48,31.02,1,331,686.04,'2019-01-19 11:10:55','',0),(16,48,3.67,1,408,689.71,'2019-01-20 16:33:36','',0),(17,48,3.67,1,422,693.38,'2019-01-23 21:24:16','',0),(18,48,3.67,1,430,697.05,'2019-01-26 18:24:44','',0),(19,48,5.55,1,446,702.60,'2019-01-28 18:26:49','',0),(20,48,3.67,1,450,706.27,'2019-01-29 20:15:09','',0),(21,48,3.67,1,444,709.94,'2019-01-29 20:24:18','',0),(22,48,25.38,1,374,735.32,'2019-01-30 20:51:52','',0),(23,48,25.38,1,378,760.70,'2019-01-31 11:29:02','',0),(24,48,3.67,1,390,764.37,'2019-02-01 12:01:55','',0),(25,48,2.69,1,402,767.06,'2019-02-02 16:53:40','',0),(26,48,2.48,1,401,769.54,'2019-02-02 18:30:05','',0),(27,48,3.67,1,413,773.21,'2019-02-04 21:55:35','',0),(28,48,3.67,1,414,776.88,'2019-02-05 08:54:02','',0),(29,48,5.00,3,2,771.88,'2019-02-05 21:33:45','提现（在途）',0),(30,48,5.00,3,3,766.88,'2019-02-05 21:47:00','提现成功',1),(31,48,2.00,3,4,764.88,'2019-02-05 22:03:30','提现（在途）',0),(32,48,2.00,3,5,762.88,'2019-02-05 22:31:04','提现成功',1),(33,48,3.67,1,417,766.55,'2019-02-05 23:00:33','',0),(34,48,3.67,1,418,770.22,'2019-02-06 09:49:12','',0),(35,48,3.67,1,423,773.89,'2019-02-08 10:47:53','',0),(36,48,3.67,1,427,777.56,'2019-02-09 09:12:31','',0),(37,48,3.67,1,432,781.23,'2019-02-11 09:22:20','',0),(38,48,3.67,1,454,784.90,'2019-02-16 11:19:08','',0),(39,48,61.10,1,456,846.00,'2019-02-19 10:12:04','',0),(40,48,5.55,1,452,851.55,'2019-02-19 10:21:23','',0),(41,48,5.55,1,457,857.10,'2019-02-19 11:04:00','',0),(42,48,5.55,1,458,862.65,'2019-02-19 11:18:56','',0);
/*!40000 ALTER TABLE `zytc_shop_account_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_shop_account_withdraw_records`
--

DROP TABLE IF EXISTS `zytc_shop_account_withdraw_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_shop_account_withdraw_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL COMMENT '店铺ID  0标识平台',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '相关金额',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '相关ID号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `remark` varchar(255) DEFAULT '' COMMENT '简单描述',
  `shopname` varchar(45) DEFAULT NULL,
  `openid` varchar(45) DEFAULT NULL,
  `ownername` varchar(45) DEFAULT NULL,
  `ownerphone` varchar(45) DEFAULT NULL,
  `withdrewtime` datetime DEFAULT CURRENT_TIMESTAMP,
  `failstr` varchar(256) DEFAULT NULL,
  `errcode` varchar(45) DEFAULT NULL,
  `formid` varchar(256) DEFAULT NULL,
  `wxpayid` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `INDEX_SHOPID` (`shop_id`),
  KEY `INDEX_STATUS` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='店铺提现的记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_shop_account_withdraw_records`
--

LOCK TABLES `zytc_shop_account_withdraw_records` WRITE;
/*!40000 ALTER TABLE `zytc_shop_account_withdraw_records` DISABLE KEYS */;
INSERT INTO `zytc_shop_account_withdraw_records` VALUES (1,48,4.00,0,'2018-06-04 11:36:02',NULL,'许昌旗舰店','oLYBW46tqnyUFV4mqcIP4ALKxkLE','王江波','18637468680','2019-02-05 20:57:13',NULL,NULL,NULL,NULL),(3,48,5.00,1,'2019-02-05 21:46:59',NULL,'许昌特产','oLYBW46tqnyUFV4mqcIP4ALKxkLE','','','2019-02-05 21:47:19',NULL,NULL,'the formId is a mock one',''),(4,48,2.00,2,'2019-02-05 22:03:30',NULL,'许昌特产','oLYBW46tqnyUFV4mqcIP4ALKxkLE','','',NULL,'','','5626e699a18a6fce5b99aacbaa01323e',NULL),(5,48,2.00,1,'2019-02-05 22:31:04',NULL,'许昌特产','oLYBW46tqnyUFV4mqcIP4ALKxkLE','','','2019-02-05 22:31:06',NULL,NULL,'4d0149eefa2bf6009579ada00f41bb9d','');
/*!40000 ALTER TABLE `zytc_shop_account_withdraw_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_shop_ad`
--

DROP TABLE IF EXISTS `zytc_shop_ad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_shop_ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `ad_image` varchar(255) NOT NULL DEFAULT '' COMMENT '广告图片',
  `link_url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `type` int(1) NOT NULL DEFAULT '0' COMMENT '类型 0 -- pc端  1-- 手机端 ',
  `background` varchar(255) NOT NULL DEFAULT '#FFFFFF' COMMENT '背景色',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=5461 COMMENT='店铺广告设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_shop_ad`
--

LOCK TABLES `zytc_shop_ad` WRITE;
/*!40000 ALTER TABLE `zytc_shop_ad` DISABLE KEYS */;
INSERT INTO `zytc_shop_ad` VALUES (2,0,'upload/advertising/1500632003.jpg','#',1,0,'#000000'),(4,1,'upload/advertising/1500632298.jpg','#',1,0,'#000000'),(5,1,'upload/advertising/1500632315.jpg','#',2,0,'#000000'),(6,41,'upload/advertising/1500632686.jpg','#',0,0,'#ffffff'),(7,41,'upload/advertising/1500632698.jpg','#',2,0,'#ffffff'),(8,42,'upload/advertising/1500632762.jpg','#',1,0,'#000000');
/*!40000 ALTER TABLE `zytc_shop_ad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_shop_apply`
--

DROP TABLE IF EXISTS `zytc_shop_apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_shop_apply` (
  `apply_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '申请ID',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺ID申请成功之前为0',
  `apply_type` int(11) NOT NULL DEFAULT '2' COMMENT '申请类型1.个人2.公司',
  `uid` int(10) unsigned NOT NULL COMMENT '用户编号',
  `company_name` varchar(50) NOT NULL DEFAULT '' COMMENT '公司名称',
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '店主用户名',
  `company_province_id` mediumint(8) NOT NULL DEFAULT '0' COMMENT '所在地省ID',
  `company_city_id` mediumint(8) NOT NULL DEFAULT '0' COMMENT '所在地市ID',
  `company_district_id` mediumint(8) NOT NULL DEFAULT '0' COMMENT '所在地区ID',
  `company_address_detail` varchar(50) NOT NULL DEFAULT '' COMMENT '公司详细地址',
  `company_phone` varchar(20) NOT NULL DEFAULT '' COMMENT '公司电话',
  `company_type` varchar(255) NOT NULL DEFAULT '私企' COMMENT '私企.个体.外企.中外合资',
  `company_employee_count` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '员工总数',
  `company_registered_capital` int(10) NOT NULL DEFAULT '0' COMMENT '注册资金',
  `contacts_name` varchar(50) NOT NULL DEFAULT '' COMMENT '联系人姓名',
  `contacts_phone` varchar(20) NOT NULL DEFAULT '' COMMENT '联系人电话',
  `contacts_email` varchar(50) NOT NULL DEFAULT '' COMMENT '联系人邮箱',
  `contacts_card_no` varchar(255) NOT NULL DEFAULT '' COMMENT '申请人身份证号',
  `contacts_card_electronic_1` varchar(255) NOT NULL DEFAULT '' COMMENT '申请人手持身份证电子版',
  `contacts_card_electronic_2` varchar(255) NOT NULL DEFAULT '' COMMENT '申请人身份证正面',
  `contacts_card_electronic_3` varchar(255) NOT NULL DEFAULT '' COMMENT '申请人身份证反面',
  `business_licence_number` varchar(50) NOT NULL DEFAULT '' COMMENT '营业执照号',
  `business_sphere` varchar(1000) NOT NULL DEFAULT '' COMMENT '法定经营范围',
  `business_licence_number_electronic` varchar(50) NOT NULL DEFAULT '' COMMENT '营业执照电子版',
  `organization_code` varchar(50) NOT NULL DEFAULT '' COMMENT '组织机构代码',
  `organization_code_electronic` varchar(50) NOT NULL DEFAULT '' COMMENT '组织机构代码电子版',
  `general_taxpayer` varchar(255) NOT NULL DEFAULT '' COMMENT '一般纳税人证明',
  `bank_account_name` varchar(50) NOT NULL DEFAULT '' COMMENT '银行开户名',
  `bank_account_number` varchar(50) NOT NULL DEFAULT '' COMMENT '公司银行账号',
  `bank_name` varchar(50) NOT NULL DEFAULT '' COMMENT '开户银行支行名称',
  `bank_code` varchar(50) NOT NULL DEFAULT '' COMMENT '支行联行号',
  `bank_address` varchar(50) NOT NULL DEFAULT '' COMMENT '开户银行所在地',
  `bank_licence_electronic` varchar(50) NOT NULL DEFAULT '' COMMENT '开户银行许可证电子版',
  `is_settlement_account` tinyint(1) NOT NULL DEFAULT '1' COMMENT '开户行账号是否为结算账号 1-开户行就是结算账号 2-独立的计算账号',
  `settlement_bank_account_name` varchar(50) NOT NULL DEFAULT '' COMMENT '结算银行开户名',
  `settlement_bank_account_number` varchar(50) NOT NULL DEFAULT '' COMMENT '结算公司银行账号',
  `settlement_bank_name` varchar(50) NOT NULL DEFAULT '' COMMENT '结算开户银行支行名称',
  `settlement_bank_code` varchar(50) NOT NULL DEFAULT '' COMMENT '结算支行联行号',
  `settlement_bank_address` varchar(50) NOT NULL DEFAULT '' COMMENT '结算开户银行所在地',
  `tax_registration_certificate` varchar(50) NOT NULL DEFAULT '' COMMENT '税务登记证号',
  `tax_registration_certificate_electronic` varchar(50) NOT NULL DEFAULT '' COMMENT '税务登记证号电子版',
  `taxpayer_id` varchar(50) NOT NULL DEFAULT '' COMMENT '纳税人识别号',
  `shop_name` varchar(50) NOT NULL DEFAULT '' COMMENT '店铺名称',
  `apply_state` varchar(50) NOT NULL DEFAULT '1' COMMENT '申请状态 1-已提交申请 -1-审核失败 2-审核通过开店',
  `apply_message` varchar(200) NOT NULL DEFAULT '' COMMENT '管理员审核信息',
  `apply_year` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '开店时长(年)',
  `shop_type_name` varchar(50) NOT NULL DEFAULT '' COMMENT '店铺等级名称',
  `shop_type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺等级id',
  `shop_group_name` varchar(50) NOT NULL DEFAULT '' COMMENT '店铺类型名称',
  `shop_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺类型ID',
  `paying_money_certificate` varchar(50) NOT NULL DEFAULT '' COMMENT '付款凭证',
  `paying_money_certificate_explain` varchar(200) NOT NULL DEFAULT '' COMMENT '付款凭证说明',
  `paying_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '付款金额',
  `recommend_uid` int(11) NOT NULL DEFAULT '0' COMMENT '推荐招商员用户id',
  PRIMARY KEY (`apply_id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1365 COMMENT='店铺申请表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_shop_apply`
--

LOCK TABLES `zytc_shop_apply` WRITE;
/*!40000 ALTER TABLE `zytc_shop_apply` DISABLE KEYS */;
INSERT INTO `zytc_shop_apply` VALUES (86,42,2,292,'苏泊尔专卖','',19,208,1825,'梅江阿诗丹顿','030000','私营企业',1000,5000,'郭先生','13000000000','1623542@qq.com','','','','','0000111111111111111111','家用电器','upload/common/1500292183.png','0111111','upload/common/1500292197.png','upload/common/1500292203.jpg','','','','','','',1,'','','','','','','','','苏泊尔家电','2','',1,'直营店铺',1,'家居用品',5,'','',0.00,0);
/*!40000 ALTER TABLE `zytc_shop_apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_shop_bank_account`
--

DROP TABLE IF EXISTS `zytc_shop_bank_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_shop_bank_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL COMMENT '店铺id',
  `bank_type` varchar(50) NOT NULL DEFAULT '1' COMMENT '账号类型 1银行卡2支付宝',
  `branch_bank_name` varchar(50) DEFAULT NULL COMMENT '支行信息',
  `realname` varchar(50) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `account_number` varchar(50) NOT NULL DEFAULT '' COMMENT '银行账号',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `is_default` int(11) NOT NULL DEFAULT '0' COMMENT '是否默认账号',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `modify_date` datetime DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='店铺提现账号';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_shop_bank_account`
--

LOCK TABLES `zytc_shop_bank_account` WRITE;
/*!40000 ALTER TABLE `zytc_shop_bank_account` DISABLE KEYS */;
INSERT INTO `zytc_shop_bank_account` VALUES (2,0,'1','中国建设银行','王伟','6227 0003  9542  1265 369','138 3838 5429',1,'2017-07-13 16:30:19','2017-07-13 16:38:14'),(3,45,'1','河南许昌市建设银行七一路支行','胡林林','6227002558360370256','18637471928',0,'2018-05-09 17:48:23',NULL);
/*!40000 ALTER TABLE `zytc_shop_bank_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_shop_express_address`
--

DROP TABLE IF EXISTS `zytc_shop_express_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_shop_express_address` (
  `express_address_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '物流地址id',
  `shop_id` int(11) NOT NULL COMMENT '商铺id',
  `contact` varchar(100) NOT NULL DEFAULT '' COMMENT '联系人',
  `mobile` varchar(50) NOT NULL DEFAULT '' COMMENT '手机',
  `phone` varchar(50) NOT NULL DEFAULT '' COMMENT '电话',
  `company_name` varchar(100) NOT NULL DEFAULT '' COMMENT '公司名称',
  `province` smallint(6) NOT NULL DEFAULT '0' COMMENT '所在地省',
  `city` smallint(6) NOT NULL DEFAULT '0' COMMENT '所在地市',
  `district` smallint(6) NOT NULL DEFAULT '0' COMMENT '所在地区县',
  `zipcode` varchar(6) NOT NULL DEFAULT '' COMMENT '邮编',
  `address` varchar(100) NOT NULL DEFAULT '' COMMENT '详细地址',
  `is_consigner` tinyint(2) NOT NULL DEFAULT '0' COMMENT '发货地址标记',
  `is_receiver` tinyint(2) NOT NULL DEFAULT '0' COMMENT '收货地址标记',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `modify_date` datetime DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`express_address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1092 COMMENT='物流地址';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_shop_express_address`
--

LOCK TABLES `zytc_shop_express_address` WRITE;
/*!40000 ALTER TABLE `zytc_shop_express_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `zytc_shop_express_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_shop_navigation`
--

DROP TABLE IF EXISTS `zytc_shop_navigation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_shop_navigation` (
  `nav_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shop_id` int(11) NOT NULL COMMENT '店铺ID',
  `nav_title` varchar(255) NOT NULL DEFAULT '' COMMENT '导航名称',
  `nav_url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `nav_type` int(11) NOT NULL DEFAULT '0' COMMENT '导航类型  0代表 商城链接   1代表外部链接',
  `is_blank` int(11) NOT NULL DEFAULT '0' COMMENT '是否在新窗口打开  0 在当前页面打开  1在新窗口打开',
  `template_name` varchar(50) NOT NULL DEFAULT '' COMMENT '模块名称',
  `type` int(11) NOT NULL DEFAULT '3' COMMENT '纵向所在位置1.头部2.中部3底部',
  `sort` int(11) NOT NULL COMMENT '排序号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `align` int(11) NOT NULL DEFAULT '1' COMMENT '横向所在位置1 左  2  右',
  PRIMARY KEY (`nav_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1489 COMMENT='店铺导航管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_shop_navigation`
--

LOCK TABLES `zytc_shop_navigation` WRITE;
/*!40000 ALTER TABLE `zytc_shop_navigation` DISABLE KEYS */;
/*!40000 ALTER TABLE `zytc_shop_navigation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_shop_notify`
--

DROP TABLE IF EXISTS `zytc_shop_notify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_shop_notify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` int(11) DEFAULT NULL,
  `shopid` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `message` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通知处理状态';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_shop_notify`
--

LOCK TABLES `zytc_shop_notify` WRITE;
/*!40000 ALTER TABLE `zytc_shop_notify` DISABLE KEYS */;
/*!40000 ALTER TABLE `zytc_shop_notify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_shop_withdraw`
--

DROP TABLE IF EXISTS `zytc_shop_withdraw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_shop_withdraw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL COMMENT '店铺编号',
  `withdraw_no` varchar(255) NOT NULL DEFAULT '' COMMENT '提现流水号',
  `bank_name` varchar(50) NOT NULL COMMENT '提现银行名称',
  `account_number` varchar(50) NOT NULL COMMENT '提现银行账号',
  `realname` varchar(10) NOT NULL COMMENT '提现账户姓名',
  `mobile` varchar(20) NOT NULL COMMENT '手机',
  `cash` decimal(10,2) NOT NULL COMMENT '提现金额',
  `ask_for_date` datetime NOT NULL COMMENT '提现日期',
  `payment_date` datetime DEFAULT NULL COMMENT '到账日期',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '当前状态 0已申请(等待处理) 1已同意 -1 已拒绝',
  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `modify_date` datetime DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`id`),
  KEY `INDEX_SHOPID` (`shop_id`),
  KEY `INDEX_STATUS` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='店铺提现记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_shop_withdraw`
--

LOCK TABLES `zytc_shop_withdraw` WRITE;
/*!40000 ALTER TABLE `zytc_shop_withdraw` DISABLE KEYS */;
INSERT INTO `zytc_shop_withdraw` VALUES (1,0,'170713043833126','中国建设银行','6227 0003  9542  1265 369','王伟','138 3838 5429',0.00,'2017-07-13 16:38:33',NULL,1,'','2017-07-15 15:18:18'),(2,0,'170713044037756','中国建设银行','6227 0003  9542  1265 369','王伟','138 3838 5429',0.00,'2017-07-13 16:40:37',NULL,0,'','2017-07-14 12:20:04'),(3,0,'170713044209509','中国建设银行','6227 0003  9542  1265 369','王伟','138 3838 5429',0.00,'2017-07-13 16:42:09',NULL,0,'','2017-07-14 12:20:11'),(4,0,'170713045059858','中国建设银行','6227 0003  9542  1265 369','王伟','138 3838 5429',0.00,'2017-07-13 16:50:59',NULL,0,'','2017-07-14 12:20:19'),(5,0,'170713045209356','中国建设银行','6227 0003  9542  1265 369','王伟','138 3838 5429',0.00,'2017-07-13 16:52:09',NULL,0,'','2017-07-14 12:20:26'),(6,0,'170713053752733','中国建设银行','6227 0003  9542  1265 369','王伟','138 3838 5429',0.00,'2017-07-13 17:37:52',NULL,0,'',NULL),(7,0,'170713055127299','中国建设银行','6227 0003  9542  1265 369','王伟','138 3838 5429',0.00,'2017-07-13 17:51:27',NULL,0,'','2017-07-14 11:38:42');
/*!40000 ALTER TABLE `zytc_shop_withdraw` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_supergroup_appointment`
--

DROP TABLE IF EXISTS `zytc_supergroup_appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_supergroup_appointment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `formid` varchar(45) DEFAULT NULL,
  `status` int(11) DEFAULT '0' COMMENT '1预约 2正式参与',
  PRIMARY KEY (`id`),
  KEY `INDEX_GROUPID` (`groupid`),
  KEY `INDEX_USERANDGROUP` (`groupid`,`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_supergroup_appointment`
--

LOCK TABLES `zytc_supergroup_appointment` WRITE;
/*!40000 ALTER TABLE `zytc_supergroup_appointment` DISABLE KEYS */;
INSERT INTO `zytc_supergroup_appointment` VALUES (23,57,10,'the formId is a mock one',0),(24,63,10,'1542029447537',1),(25,63,23,'1542029705818',1),(26,64,10,'1542632454775',1),(27,64,14,'1acf2748e9eea9f752e1387710af4c8f',1),(28,66,14,'e6e18ec53a272926fff8156eda7aaa63',1),(29,66,10,'1545893415906',1),(30,85,10,'the formId is a mock one',1),(31,90,10,'1547113005572',1),(32,90,13,'1547115151531',1);
/*!40000 ALTER TABLE `zytc_supergroup_appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_user_propagate_setting`
--

DROP TABLE IF EXISTS `zytc_user_propagate_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_user_propagate_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '会员基本资料表ID',
  `introduction` varchar(512) NOT NULL DEFAULT '' COMMENT '介绍说明',
  `spreadvalue` varchar(128) NOT NULL DEFAULT '' COMMENT '根据类型分别为微信号公众号和位置',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '类型',
  `is_default` int(11) NOT NULL DEFAULT '0' COMMENT '是否默认',
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=utf8 COMMENT='推广员宣传信息设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_user_propagate_setting`
--

LOCK TABLES `zytc_user_propagate_setting` WRITE;
/*!40000 ALTER TABLE `zytc_user_propagate_setting` DISABLE KEYS */;
INSERT INTO `zytc_user_propagate_setting` VALUES (203,13,'从事欧瑞莲的销售工作，大家需要化妆品抹脸的可以加我微信哦。','whmnizi',0,1,'王会敏微信号'),(206,10,'线上经营许昌地区特产小吃，包括禹州红薯粉制品，许昌腐竹制品等，需要的朋友或者经营生产的厂家可以联系我哦。','w18637468680',0,1,'个人微信特产');
/*!40000 ALTER TABLE `zytc_user_propagate_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zytc_wallet_pay`
--

DROP TABLE IF EXISTS `zytc_wallet_pay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zytc_wallet_pay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `refid` int(11) NOT NULL,
  `money_after` decimal(10,2) DEFAULT '0.00',
  `money_before` decimal(10,2) DEFAULT '0.00',
  `createtime` datetime DEFAULT NULL,
  `type` int(11) DEFAULT '0',
  `userid` int(11) NOT NULL,
  `money` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zytc_wallet_pay`
--

LOCK TABLES `zytc_wallet_pay` WRITE;
/*!40000 ALTER TABLE `zytc_wallet_pay` DISABLE KEYS */;
INSERT INTO `zytc_wallet_pay` VALUES (42,17,0.00,50.00,'2018-04-23 16:32:21',2,1,50.00);
/*!40000 ALTER TABLE `zytc_wallet_pay` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-02 22:17:26
