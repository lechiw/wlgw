/*
MySQL Data Transfer
Source Host: localhost
Source Database: db_wlgw
Target Host: localhost
Target Database: db_wlgw
Date: 2013-03-13 11:37:29
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
CREATE TABLE `t_admin` (
  `userId` int(11) NOT NULL,
  `userName` varchar(66) default NULL,
  `userPw` varchar(88) default NULL,
  PRIMARY KEY  (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_catelog
-- ----------------------------
CREATE TABLE `t_catelog` (
  `catelog_id` int(11) NOT NULL,
  `catelog_name` varchar(66) default NULL,
  `catelog_del` varchar(88) default NULL,
  PRIMARY KEY  (`catelog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_gonggao
-- ----------------------------
CREATE TABLE `t_gonggao` (
  `gonggao_id` int(11) NOT NULL,
  `gonggao_title` varchar(88) default NULL,
  `gonggao_content` longtext,
  `gonggao_data` varchar(50) default NULL,
  PRIMARY KEY  (`gonggao_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_goods
-- ----------------------------
CREATE TABLE `t_goods` (
  `goods_id` int(11) NOT NULL,
  `goods_catelog_id` int(11) default NULL,
  `goods_name` varchar(88) default NULL,
  `goods_miaoshu` longtext,
  `goods_pic` varchar(50) default NULL,
  `goods_shichangjia` int(11) default NULL,
  `goods_tejia` int(11) default NULL,
  `goods_isnottejia` varchar(50) default NULL,
  `goods_kucun` int(11) default NULL,
  `goods_Del` varchar(50) default NULL,
  PRIMARY KEY  (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_liuyan
-- ----------------------------
CREATE TABLE `t_liuyan` (
  `liuyan_id` int(11) NOT NULL,
  `liuyan_title` varchar(88) default NULL,
  `liuyan_content` longtext,
  `liuyan_date` varchar(50) default NULL,
  `liuyan_user` varchar(50) default NULL,
  PRIMARY KEY  (`liuyan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
CREATE TABLE `t_order` (
  `order_id` int(11) NOT NULL,
  `order_bianhao` varchar(66) default NULL,
  `order_date` varchar(88) default NULL,
  `order_zhuangtai` varchar(50) default NULL,
  `order_songhuodizhi` varchar(50) default NULL,
  `order_fukuangfangshi` varchar(50) default NULL,
  `order_jine` int(11) default NULL,
  `order_user_id` int(11) default NULL,
  PRIMARY KEY  (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_orderitem
-- ----------------------------
CREATE TABLE `t_orderitem` (
  `orderItem_id` int(11) NOT NULL,
  `order_id` int(11) default NULL,
  `goods_id` int(11) default NULL,
  `goods_quantity` int(11) default NULL,
  PRIMARY KEY  (`orderItem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
CREATE TABLE `t_user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(50) default NULL,
  `user_pw` varchar(55) default NULL,
  `user_realname` varchar(50) default NULL,
  `user_sex` varchar(50) default NULL,
  `user_address` varchar(50) default NULL,
  `user_tel` varchar(88) default NULL,
  `user_del` varchar(50) default NULL,
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', 'a', 'a');
INSERT INTO `t_catelog` VALUES ('1', '计算机编程', 'no');
INSERT INTO `t_catelog` VALUES ('2', '天文地理类', 'no');
INSERT INTO `t_catelog` VALUES ('3', '言情小说类', 'no');
INSERT INTO `t_catelog` VALUES ('4', '医药法学类', 'no');
INSERT INTO `t_gonggao` VALUES ('1', '2222222222222222222222222', '<p>22222222222222222222222222222</p>', '2013-03-13 00:33');
INSERT INTO `t_gonggao` VALUES ('2', '测试公告测试公告测试公告测试公告', '测试公告测试公告测试公告测试公告', '2013-03-13 00:33');
INSERT INTO `t_goods` VALUES ('1', '1', '计算机网络第5版', '计算机网络第5版', '/upload/1363113030765.jpg', '200', '0', 'yes', '199', 'no');
INSERT INTO `t_goods` VALUES ('2', '1', 'Java编程思想第4版 ', 'Java编程思想第4版', '/upload/1363113082676.jpg', '200', '150', 'yes', '99', 'no');
INSERT INTO `t_goods` VALUES ('3', '1', 'Java2实用教程第三版 ', 'Java2实用教程第三版', '/upload/1363113116129.jpg', '200', '150', 'yes', '100', 'no');
INSERT INTO `t_goods` VALUES ('4', '2', '月球丛书透视眼系列', '月球丛书透视眼系列', '/upload/1363113181029.jpg', '200', '150', 'yes', '99', 'no');
INSERT INTO `t_goods` VALUES ('5', '3', '傲霜盼月心-言情季', '傲霜盼月心-言情季', '/upload/1363113254728.jpg', '200', '200', 'no', '100', 'no');
INSERT INTO `t_goods` VALUES ('6', '3', '海上花列传', '海上花列传', '/upload/1363113296964.jpg', '200', '200', 'no', '100', 'no');
INSERT INTO `t_goods` VALUES ('7', '4', '医师资格考试大纲', '医师资格考试大纲', '/upload/1363113339641.jpg', '200', '200', 'no', '100', 'no');
INSERT INTO `t_goods` VALUES ('8', '4', '医药代表精英教程', '医药代表精英教程', '/upload/1363113412873.jpg', '200', '200', 'no', '96', 'no');
INSERT INTO `t_order` VALUES ('1', '20130313113455', '2013-03-13 11:34:55', 'yes', 'xxxxxxxxxxxxxxxxx', '货到付款', '1250', '1');
INSERT INTO `t_orderitem` VALUES ('1', '1', '1', '1');
INSERT INTO `t_orderitem` VALUES ('2', '1', '2', '1');
INSERT INTO `t_orderitem` VALUES ('3', '1', '4', '1');
INSERT INTO `t_orderitem` VALUES ('4', '1', '8', '4');
INSERT INTO `t_user` VALUES ('1', 'liusan', '000000', '刘三', '男', '北京路', '13555555555', 'no');
