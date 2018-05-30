/*
Navicat MySQL Data Transfer

Source Server         : eee
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : didi

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2018-01-14 19:31:12
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `t_a_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_a_type`;
CREATE TABLE `t_a_type` (
  `a_t_id` int(11) NOT NULL AUTO_INCREMENT,
  `a_t_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`a_t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_a_type
-- ----------------------------
INSERT INTO `t_a_type` VALUES ('1', '系统管理员');
INSERT INTO `t_a_type` VALUES ('2', '普通管理员');
INSERT INTO `t_a_type` VALUES ('3', '公司管理员');

-- ----------------------------
-- Table structure for `t_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `a_id` int(11) NOT NULL AUTO_INCREMENT,
  `a_t_id` int(11) DEFAULT NULL,
  `a_count` varchar(20) NOT NULL,
  `a_password` varchar(15) NOT NULL,
  PRIMARY KEY (`a_id`),
  KEY `FK_a_t_a` (`a_t_id`),
  CONSTRAINT `FK_a_t_a` FOREIGN KEY (`a_t_id`) REFERENCES `t_a_type` (`a_t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', '1', 'admin', 'admin');
INSERT INTO `t_admin` VALUES ('2', '2', 'admin123', 'admin123');
INSERT INTO `t_admin` VALUES ('3', '3', 'nanchang', 'nanchang');
INSERT INTO `t_admin` VALUES ('4', '3', 'nanchang2', 'nanchang2');
INSERT INTO `t_admin` VALUES ('5', '2', 'admin2', 'admin2');
INSERT INTO `t_admin` VALUES ('6', '3', 'beijing', 'beijing');
INSERT INTO `t_admin` VALUES ('7', '2', '333', '444');
INSERT INTO `t_admin` VALUES ('8', '3', '555', '666');
INSERT INTO `t_admin` VALUES ('9', '2', '666', '777');
INSERT INTO `t_admin` VALUES ('10', '3', '888', '999');
INSERT INTO `t_admin` VALUES ('11', '3', '1010', '1010');
INSERT INTO `t_admin` VALUES ('13', '2', '1313', '1313');
INSERT INTO `t_admin` VALUES ('14', '1', '3434', '3434');
INSERT INTO `t_admin` VALUES ('15', '1', '4545', '4545');
INSERT INTO `t_admin` VALUES ('16', '1', '45456', '45456');
INSERT INTO `t_admin` VALUES ('17', '1', '454567', '454567');
INSERT INTO `t_admin` VALUES ('18', '1', '4545678', '454567');
INSERT INTO `t_admin` VALUES ('20', '1', '1234', '1234');
INSERT INTO `t_admin` VALUES ('21', '1', '12345', '12345');
INSERT INTO `t_admin` VALUES ('22', '1', '123456', '12345');
INSERT INTO `t_admin` VALUES ('24', '1', '1111', '1111');

-- ----------------------------
-- Table structure for `t_allocation`
-- ----------------------------
DROP TABLE IF EXISTS `t_allocation`;
CREATE TABLE `t_allocation` (
  `allo_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) DEFAULT NULL,
  `u_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`allo_id`),
  KEY `FK_a_c_a` (`c_id`),
  KEY `FK_e_a_e` (`u_id`),
  CONSTRAINT `FK_a_c_a` FOREIGN KEY (`c_id`) REFERENCES `t_cpn_car` (`c_id`),
  CONSTRAINT `FK_e_a_e` FOREIGN KEY (`u_id`) REFERENCES `t_employee` (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_allocation
-- ----------------------------

-- ----------------------------
-- Table structure for `t_c_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_c_type`;
CREATE TABLE `t_c_type` (
  `c_t_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_t_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`c_t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_c_type
-- ----------------------------
INSERT INTO `t_c_type` VALUES ('1', '小轿车');

-- ----------------------------
-- Table structure for `t_car`
-- ----------------------------
DROP TABLE IF EXISTS `t_car`;
CREATE TABLE `t_car` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_t_id` int(11) DEFAULT NULL,
  `c_plate_number` varchar(8) DEFAULT NULL,
  `c_buy_time` date DEFAULT NULL,
  `c_brand` varchar(20) DEFAULT NULL,
  `c_color` varchar(10) DEFAULT NULL,
  `c_max_number` int(11) DEFAULT '5',
  `c_picture` varchar(100) DEFAULT NULL,
  `c_state` int(11) DEFAULT '3',
  PRIMARY KEY (`c_id`),
  KEY `FK_c_t_c` (`c_t_id`),
  CONSTRAINT `FK_c_t_c` FOREIGN KEY (`c_t_id`) REFERENCES `t_c_type` (`c_t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_car
-- ----------------------------
INSERT INTO `t_car` VALUES ('1', '1', 'aaaa', '2018-01-11', '', null, '5', null, '3');
INSERT INTO `t_car` VALUES ('2', '1', 'eeee', '2018-01-12', '大众', '白', '5', null, '3');

-- ----------------------------
-- Table structure for `t_comment`
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `m_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) DEFAULT NULL,
  `p_id` int(11) DEFAULT NULL,
  `m_content` text,
  `m_pub_time` datetime DEFAULT NULL,
  `m_target` int(11) DEFAULT NULL,
  PRIMARY KEY (`m_id`),
  KEY `FK_p_m_p` (`p_id`),
  KEY `FK_u_m_u` (`u_id`),
  CONSTRAINT `FK_p_m_p` FOREIGN KEY (`p_id`) REFERENCES `t_post` (`p_id`),
  CONSTRAINT `FK_u_m_u` FOREIGN KEY (`u_id`) REFERENCES `t_user` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES ('1', null, null, '鹅鹅鹅鹅', null, null);

-- ----------------------------
-- Table structure for `t_company`
-- ----------------------------
DROP TABLE IF EXISTS `t_company`;
CREATE TABLE `t_company` (
  `cpn_id` int(11) NOT NULL AUTO_INCREMENT,
  `cpn_name` varchar(50) DEFAULT NULL,
  `cpn_ico` varchar(100) DEFAULT '/didi/images/user_default_pic.jpg',
  PRIMARY KEY (`cpn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_company
-- ----------------------------
INSERT INTO `t_company` VALUES ('1', '南昌出租车公司', '/didi/images/user_default_pic.jpg');
INSERT INTO `t_company` VALUES ('2', '北京出租车公司', '/didi/images/user_default_pic.jpg');

-- ----------------------------
-- Table structure for `t_cpn_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_cpn_admin`;
CREATE TABLE `t_cpn_admin` (
  `a_id` int(11) NOT NULL,
  `cpn_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`a_id`),
  KEY `FK_cpn_a_cpn` (`cpn_id`),
  CONSTRAINT `FK_a_cpn_a` FOREIGN KEY (`a_id`) REFERENCES `t_admin` (`a_id`),
  CONSTRAINT `FK_cpn_a_cpn` FOREIGN KEY (`cpn_id`) REFERENCES `t_company` (`cpn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_cpn_admin
-- ----------------------------
INSERT INTO `t_cpn_admin` VALUES ('3', '1');
INSERT INTO `t_cpn_admin` VALUES ('4', '1');
INSERT INTO `t_cpn_admin` VALUES ('10', '1');
INSERT INTO `t_cpn_admin` VALUES ('11', '1');
INSERT INTO `t_cpn_admin` VALUES ('6', '2');
INSERT INTO `t_cpn_admin` VALUES ('8', '2');

-- ----------------------------
-- Table structure for `t_cpn_car`
-- ----------------------------
DROP TABLE IF EXISTS `t_cpn_car`;
CREATE TABLE `t_cpn_car` (
  `c_id` int(11) NOT NULL,
  `cpn_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`c_id`),
  KEY `FK_cpn_c_cpn` (`cpn_id`),
  CONSTRAINT `FK_cpn_c_cpn` FOREIGN KEY (`cpn_id`) REFERENCES `t_company` (`cpn_id`),
  CONSTRAINT `FK_c_cpn_c` FOREIGN KEY (`c_id`) REFERENCES `t_car` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_cpn_car
-- ----------------------------
INSERT INTO `t_cpn_car` VALUES ('1', '1');

-- ----------------------------
-- Table structure for `t_driver`
-- ----------------------------
DROP TABLE IF EXISTS `t_driver`;
CREATE TABLE `t_driver` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `d_real_name` varchar(20) NOT NULL,
  `d_car_class` char(2) DEFAULT NULL,
  `d_first_issue` date DEFAULT NULL,
  `d_valid_period` date DEFAULT NULL,
  `d_licence_picture` varchar(100) DEFAULT NULL,
  `d_id_f_picture` varchar(100) DEFAULT NULL,
  `d_id_b_picture` varchar(100) DEFAULT NULL,
  `d_state` int(11) DEFAULT '4',
  PRIMARY KEY (`u_id`),
  CONSTRAINT `FK_u_d` FOREIGN KEY (`u_id`) REFERENCES `t_user` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_driver
-- ----------------------------
INSERT INTO `t_driver` VALUES ('1', '张凤育', 'C1', '2018-01-08', '2020-01-23', null, null, null, '1');
INSERT INTO `t_driver` VALUES ('2', '哈哈哈', 'C1', '2018-01-09', '2018-01-19', null, null, null, '1');
INSERT INTO `t_driver` VALUES ('3', 'eee', null, null, null, null, null, null, '2');
INSERT INTO `t_driver` VALUES ('4', 'rrr', null, null, null, null, null, null, '4');

-- ----------------------------
-- Table structure for `t_employee`
-- ----------------------------
DROP TABLE IF EXISTS `t_employee`;
CREATE TABLE `t_employee` (
  `u_id` int(11) NOT NULL,
  `cpn_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`u_id`),
  KEY `FK_e_cpn_e` (`cpn_id`),
  CONSTRAINT `FK_d_e` FOREIGN KEY (`u_id`) REFERENCES `t_driver` (`u_id`),
  CONSTRAINT `FK_e_cpn_e` FOREIGN KEY (`cpn_id`) REFERENCES `t_company` (`cpn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_employee
-- ----------------------------
INSERT INTO `t_employee` VALUES ('1', '1');
INSERT INTO `t_employee` VALUES ('4', '2');

-- ----------------------------
-- Table structure for `t_evaluation`
-- ----------------------------
DROP TABLE IF EXISTS `t_evaluation`;
CREATE TABLE `t_evaluation` (
  `e_id` int(11) NOT NULL AUTO_INCREMENT,
  `o_f_id` int(11) DEFAULT NULL,
  `e_content` text,
  `e_level` int(11) DEFAULT '1',
  `e_source` int(11) DEFAULT NULL,
  PRIMARY KEY (`e_id`),
  KEY `FK_f_e_f` (`o_f_id`),
  CONSTRAINT `FK_f_e_f` FOREIGN KEY (`o_f_id`) REFERENCES `t_order_flow` (`o_f_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_evaluation
-- ----------------------------

-- ----------------------------
-- Table structure for `t_f_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_f_type`;
CREATE TABLE `t_f_type` (
  `f_t_id` int(11) NOT NULL AUTO_INCREMENT,
  `f_t_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`f_t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_f_type
-- ----------------------------
INSERT INTO `t_f_type` VALUES ('1', '功能建议');
INSERT INTO `t_f_type` VALUES ('2', '申述');
INSERT INTO `t_f_type` VALUES ('3', '举报');

-- ----------------------------
-- Table structure for `t_feedback`
-- ----------------------------
DROP TABLE IF EXISTS `t_feedback`;
CREATE TABLE `t_feedback` (
  `f_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) DEFAULT NULL,
  `f_t_id` int(11) DEFAULT NULL,
  `f_content` text,
  `f_target` int(11) DEFAULT '0',
  PRIMARY KEY (`f_id`),
  KEY `FK_f_t_f` (`f_t_id`),
  KEY `FK_u_f_u` (`u_id`),
  CONSTRAINT `FK_f_t_f` FOREIGN KEY (`f_t_id`) REFERENCES `t_f_type` (`f_t_id`),
  CONSTRAINT `FK_u_f_u` FOREIGN KEY (`u_id`) REFERENCES `t_user` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_feedback
-- ----------------------------
INSERT INTO `t_feedback` VALUES ('1', '3', '3', 'www', '1');
INSERT INTO `t_feedback` VALUES ('2', '2', '1', '11111', '0');

-- ----------------------------
-- Table structure for `t_money_flow`
-- ----------------------------
DROP TABLE IF EXISTS `t_money_flow`;
CREATE TABLE `t_money_flow` (
  `m_f_id` int(11) NOT NULL AUTO_INCREMENT,
  `r_t_id` int(11) DEFAULT NULL,
  `u_id` int(11) DEFAULT NULL,
  `m_f_time` datetime DEFAULT NULL,
  `m_f_account` varchar(20) DEFAULT NULL,
  `m_f_money` float DEFAULT '0',
  PRIMARY KEY (`m_f_id`),
  KEY `FK_f_m_t_f` (`r_t_id`),
  KEY `FK_u_m_f` (`u_id`),
  CONSTRAINT `FK_f_m_t_f` FOREIGN KEY (`r_t_id`) REFERENCES `t_rechange_type` (`r_t_id`),
  CONSTRAINT `FK_u_m_f` FOREIGN KEY (`u_id`) REFERENCES `t_user` (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_money_flow
-- ----------------------------

-- ----------------------------
-- Table structure for `t_o_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_o_type`;
CREATE TABLE `t_o_type` (
  `o_t_id` int(11) NOT NULL AUTO_INCREMENT,
  `o_t_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`o_t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_o_type
-- ----------------------------
INSERT INTO `t_o_type` VALUES ('1', '快车');
INSERT INTO `t_o_type` VALUES ('2', '出租车');
INSERT INTO `t_o_type` VALUES ('3', '乘客顺风车');
INSERT INTO `t_o_type` VALUES ('4', '司机顺风车');
INSERT INTO `t_o_type` VALUES ('5', '预约车');

-- ----------------------------
-- Table structure for `t_order`
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `o_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) NOT NULL,
  `o_t_id` int(11) DEFAULT NULL,
  `o_money` float DEFAULT '0',
  `o_now_time` datetime DEFAULT NULL,
  `o_state` int(11) DEFAULT '1',
  `u_location_x` double DEFAULT '0',
  `u_location_y` double DEFAULT '0',
  `d_location_x` double DEFAULT '0',
  `d_location_y` double DEFAULT '0',
  `o_start_time` datetime DEFAULT NULL,
  `u_number` int(11) DEFAULT '1',
  PRIMARY KEY (`o_id`),
  KEY `FK_o_t_o` (`o_t_id`),
  KEY `FK_u_o_u` (`u_id`),
  CONSTRAINT `FK_o_t_o` FOREIGN KEY (`o_t_id`) REFERENCES `t_o_type` (`o_t_id`),
  CONSTRAINT `FK_u_o_u` FOREIGN KEY (`u_id`) REFERENCES `t_user` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('1', '1', '1', '0', '2018-01-10 21:07:01', '1', '0', '0', '0', '0', null, '1');

-- ----------------------------
-- Table structure for `t_order_flow`
-- ----------------------------
DROP TABLE IF EXISTS `t_order_flow`;
CREATE TABLE `t_order_flow` (
  `o_f_id` int(11) NOT NULL AUTO_INCREMENT,
  `w_id` int(11) DEFAULT NULL,
  `o_id` int(11) DEFAULT NULL,
  `o_f_time` datetime DEFAULT NULL,
  `o_f_state` int(11) DEFAULT '1',
  `o_f_money` float DEFAULT '0',
  PRIMARY KEY (`o_f_id`),
  KEY `FK_o_f_o` (`o_id`),
  KEY `FK_w_f_w` (`w_id`),
  CONSTRAINT `FK_o_f_o` FOREIGN KEY (`o_id`) REFERENCES `t_order` (`o_id`),
  CONSTRAINT `FK_w_f_w` FOREIGN KEY (`w_id`) REFERENCES `t_work` (`w_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order_flow
-- ----------------------------

-- ----------------------------
-- Table structure for `t_post`
-- ----------------------------
DROP TABLE IF EXISTS `t_post`;
CREATE TABLE `t_post` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) DEFAULT NULL,
  `p_title` text,
  `p_content` text,
  `p_pub_time` datetime DEFAULT NULL,
  PRIMARY KEY (`p_id`),
  KEY `FK_u_p_u` (`u_id`),
  CONSTRAINT `FK_u_p_u` FOREIGN KEY (`u_id`) REFERENCES `t_user` (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_post
-- ----------------------------

-- ----------------------------
-- Table structure for `t_private_car`
-- ----------------------------
DROP TABLE IF EXISTS `t_private_car`;
CREATE TABLE `t_private_car` (
  `c_id` int(11) NOT NULL,
  `u_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`c_id`),
  KEY `FK_d_p_d` (`u_id`),
  CONSTRAINT `FK_c_p_c` FOREIGN KEY (`c_id`) REFERENCES `t_car` (`c_id`),
  CONSTRAINT `FK_d_p_d` FOREIGN KEY (`u_id`) REFERENCES `t_driver` (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_private_car
-- ----------------------------
INSERT INTO `t_private_car` VALUES ('2', '1');

-- ----------------------------
-- Table structure for `t_q_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_q_type`;
CREATE TABLE `t_q_type` (
  `q_t_id` int(11) NOT NULL AUTO_INCREMENT,
  `q_t_name` varchar(20) NOT NULL,
  PRIMARY KEY (`q_t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_q_type
-- ----------------------------
INSERT INTO `t_q_type` VALUES ('1', '系统问题');
INSERT INTO `t_q_type` VALUES ('2', '支付问题');
INSERT INTO `t_q_type` VALUES ('3', '定位问题');

-- ----------------------------
-- Table structure for `t_question`
-- ----------------------------
DROP TABLE IF EXISTS `t_question`;
CREATE TABLE `t_question` (
  `q_id` int(11) NOT NULL AUTO_INCREMENT,
  `q_t_id` int(11) DEFAULT NULL,
  `q_title` text,
  `q_question` text,
  PRIMARY KEY (`q_id`),
  KEY `FK_q_t_q` (`q_t_id`),
  CONSTRAINT `FK_q_t_q` FOREIGN KEY (`q_t_id`) REFERENCES `t_q_type` (`q_t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_question
-- ----------------------------
INSERT INTO `t_question` VALUES ('1', '1', '当支付时系统闪退怎么办？', '当支付时系统闪退怎么办？当支付时系统闪退怎么办？当支付时系统闪退怎么办？');
INSERT INTO `t_question` VALUES ('2', '1', '当支付时提示网络连接不稳定怎么办？', '当支付时提示网络连当支付时提示网络连接不稳定怎么办？接不稳定怎么办？');
INSERT INTO `t_question` VALUES ('3', '1', '当支付失败但金额已被扣除怎么办？', '当支付失败但金额已被扣除怎么办？当支付失败但金额已被扣除怎么办？当支付失败但金额已被扣除怎么办？');
INSERT INTO `t_question` VALUES ('4', '3', '定位误差范围是多少？', '定位误差范围是多少？定位误差范围是多少？定位误差范围是多少？');
INSERT INTO `t_question` VALUES ('5', '3', '当定位失败怎么办？', '当定位失败怎么办？当定位失败怎么办？当定位失败怎么办？当定位失败怎么办？当定位失败怎么办？');
INSERT INTO `t_question` VALUES ('6', '3', '当地图加载不出来怎么办？', '当地图加载不出来怎么办？当地图加载不出来怎么办？当地图加载不出来怎么办？当地图加载不出来怎么办？当地图加载不出来怎么办？');
INSERT INTO `t_question` VALUES ('7', '2', '当系统卡顿时怎么办？', '当系统卡顿时怎么办？当系统卡顿时怎么办？当系统卡顿时怎么办？当系统卡顿时怎么办？当系统卡顿时怎么办？当系统卡顿时怎么办？当系统卡顿时怎么办？');
INSERT INTO `t_question` VALUES ('9', '2', '当支付失败但金额已被扣除怎么办？', '当支付失败但金额已被扣除怎么办？当支付失败但金额已被扣除怎么办？当支付失败但金额已被扣除怎么办？当支付失败但金额已被扣除怎么办？当支付失败但金额已被扣除怎么办？');

-- ----------------------------
-- Table structure for `t_rechange_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_rechange_type`;
CREATE TABLE `t_rechange_type` (
  `r_t_id` int(11) NOT NULL AUTO_INCREMENT,
  `r_t_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`r_t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_rechange_type
-- ----------------------------
INSERT INTO `t_rechange_type` VALUES ('1', '支付宝');
INSERT INTO `t_rechange_type` VALUES ('2', '银联');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_photo` varchar(100) DEFAULT '/didi/images/user_default_pic.jpg',
  `u_name` varchar(20) DEFAULT NULL,
  `u_password` varchar(15) DEFAULT NULL,
  `u_phone_number` varchar(11) DEFAULT NULL,
  `u_id_card_number` varchar(18) DEFAULT NULL,
  `u_sex` int(11) DEFAULT NULL,
  `u_birth_day` date DEFAULT NULL,
  `u_credit` int(11) DEFAULT '100',
  `u_state` int(11) DEFAULT '1',
  `u_balance` float DEFAULT '0',
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '/didi/images/user_default_pic.jpg', '111', '1111', '15797638223', '362428199812102719', '1', '2015-01-07', '99', '1', '0');
INSERT INTO `t_user` VALUES ('2', '/didi/images/user_default_pic.jpg', '222', '333', '15279851125', '362428199611201584', '1', '2018-01-10', '100', '1', '0');
INSERT INTO `t_user` VALUES ('3', 'images/user_default_pic.jpg', '333', '444', '15797638225', '362428199912141140', null, null, '100', '1', '0');
INSERT INTO `t_user` VALUES ('4', 'images/user_default_pic.jpg', '333', '444', '15797638225', '362428199912141140', null, '2018-01-25', '100', '1', '0');
INSERT INTO `t_user` VALUES ('5', 'images/user_default_pic.jpg', 'qwe123', 'qwer1234', '15797638226', '362428199512141884', null, null, '100', '1', '0');
INSERT INTO `t_user` VALUES ('6', 'images/user_default_pic.jpg', 'qwe1234', 'qwer1234', '15797638222', '362428199812151440', null, '2018-01-23', '0', '2', '0');

-- ----------------------------
-- Table structure for `t_work`
-- ----------------------------
DROP TABLE IF EXISTS `t_work`;
CREATE TABLE `t_work` (
  `w_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) DEFAULT NULL,
  `u_id` int(11) DEFAULT NULL,
  `w_time` datetime DEFAULT NULL,
  `w_state` int(11) DEFAULT '1',
  `w_location_x` double DEFAULT '0',
  `w_location_y` double DEFAULT '0',
  PRIMARY KEY (`w_id`),
  KEY `FK_c_w_c` (`c_id`),
  KEY `FK_d_w_d` (`u_id`),
  CONSTRAINT `FK_c_w_c` FOREIGN KEY (`c_id`) REFERENCES `t_car` (`c_id`),
  CONSTRAINT `FK_d_w_d` FOREIGN KEY (`u_id`) REFERENCES `t_driver` (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_work
-- ----------------------------

-- ----------------------------
-- Table structure for `tiezi`
-- ----------------------------
DROP TABLE IF EXISTS `tiezi`;
CREATE TABLE `tiezi` (
  `tie_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) DEFAULT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `content` varchar(100) DEFAULT NULL,
  `TIME` date DEFAULT NULL,
  PRIMARY KEY (`tie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tiezi
-- ----------------------------
INSERT INTO `tiezi` VALUES ('1', 'sdfsdf', '123', 'sdfsdf', '2018-01-12');

-- ----------------------------
-- Table structure for `view`
-- ----------------------------
DROP TABLE IF EXISTS `view`;
CREATE TABLE `view` (
  `view_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(32) DEFAULT NULL,
  `tie_id` int(11) DEFAULT NULL,
  `content` varchar(100) DEFAULT NULL,
  `TIME` date DEFAULT NULL,
  PRIMARY KEY (`view_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of view
-- ----------------------------
INSERT INTO `view` VALUES ('1', '123', '1', 'sdfsdf', '2018-01-12');

-- ----------------------------
-- Procedure structure for `delete_car_by_id`
-- ----------------------------
DROP PROCEDURE IF EXISTS `delete_car_by_id`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_car_by_id`(in c_id_in INT)
BEGIN
    DECLARE result INT;
    if c_id_in IN (SELECT c_id FROM t_cpn_car) THEN
      DELETE FROM t_cpn_car WHERE c_id = c_id_in;
    END IF ;
    DELETE FROM t_car WHERE c_id = c_id_in;
    set result = row_count();

    SELECT result;
  END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `delete_driver_by_id`
-- ----------------------------
DROP PROCEDURE IF EXISTS `delete_driver_by_id`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_driver_by_id`(in u_id_in INT)
BEGIN
    DECLARE result INT;
    if u_id_in IN (SELECT u_id FROM t_employee) THEN
      DELETE FROM t_employee WHERE u_id = u_id_in;
    END IF ;
    DELETE FROM t_driver WHERE u_id = u_id_in;
    set result = row_count();

    SELECT result;
  END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `get_admin_list`
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_admin_list`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_admin_list`(IN a_id_in INT,IN a_t_id_in INT,IN cpn_id_in INT)
BEGIN
    CASE a_t_id_in
      WHEN 1 THEN SELECT a_id,t_admin.a_t_id,a_count,a_password,a_t_name FROM t_admin,t_a_type
        WHERE a_id != a_id_in AND t_admin.a_t_id = t_a_type.a_t_id ORDER BY t_admin.a_t_id;
      WHEN 2 THEN SELECT a_id,t_admin.a_t_id,a_count,a_password,a_t_name FROM t_admin,t_a_type WHERE t_admin.a_id != a_id_in AND t_admin.a_t_id > 1 and t_admin.a_t_id = t_a_type.a_t_id
                  ORDER BY t_admin.a_t_id;
      WHEN 3 THEN
      SELECT t_admin.*,t_a_type.a_t_name,t_company.* FROM t_admin,t_a_type,t_company,t_cpn_admin
      WHERE t_admin.a_t_id = t_a_type.a_t_id AND
            t_admin.a_id = t_cpn_admin.a_id AND
            t_cpn_admin.cpn_id = t_company.cpn_id AND
            t_company.cpn_id = cpn_id_in AND t_admin.a_id != a_id_in
            ORDER BY a_t_id;
      END CASE ;
  END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `get_admin_list_count`
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_admin_list_count`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_admin_list_count`(IN a_id_in INT,IN a_t_id_in INT,IN cpn_id_in INT,IN a_t_id_s_in INT)
BEGIN
    DECLARE result INT;
    if a_t_id_in < 3 THEN
      if a_t_id_s_in = 0 THEN
        SELECT count(*) INTO result FROM t_admin,t_a_type WHERE
          t_admin.a_t_id = t_a_type.a_t_id AND
          t_admin.a_t_id >= a_t_id_in AND
          t_admin.a_id != a_id_in ;
      ELSE
        SELECT count(*) into result FROM t_admin,t_a_type WHERE
          t_admin.a_t_id = t_a_type.a_t_id AND
          t_admin.a_t_id >= a_t_id_in AND
          t_admin.a_t_id = a_t_id_s_in AND
          t_admin.a_id != a_id_in ;
      END IF ;
    ELSE
      SELECT count(*) into result FROM t_admin,t_a_type,t_cpn_admin
      WHERE t_admin.a_t_id = t_a_type.a_t_id AND
            t_admin.a_id = t_cpn_admin.a_id AND
            t_cpn_admin.cpn_id = cpn_id_in AND
            t_admin.a_id != a_id_in ;
    END IF ;
    SELECT result;
  END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `get_admin_page_list`
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_admin_page_list`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_admin_page_list`(IN a_id_in INT,IN a_t_id_in INT,IN cpn_id_in INT, IN curr_page INT ,IN page_size INT,IN a_t_id_s_in INT)
BEGIN
  DECLARE s INT;
  SET s = (curr_page-1)*page_size;
  if a_t_id_in < 3 THEN
    if a_t_id_s_in = 0 THEN
      SELECT t_admin.*,t_a_type.a_t_name FROM t_admin,t_a_type WHERE
        t_admin.a_t_id = t_a_type.a_t_id AND
        t_admin.a_t_id >= a_t_id_in AND
        t_admin.a_id != a_id_in ORDER BY t_admin.a_t_id,t_admin.a_count LIMIT s,page_size;
    ELSEif a_t_id_s_in = 3 THEN
            SELECT t_admin.*,t_a_type.a_t_name FROM t_admin,t_a_type,t_cpn_admin WHERE
              t_admin.a_t_id = t_a_type.a_t_id AND
                t_admin.a_id = t_cpn_admin.a_id AND
                t_admin.a_t_id >= a_t_id_in AND
                t_admin.a_t_id = a_t_id_s_in AND
                t_admin.a_id != a_id_in ORDER BY t_cpn_admin.cpn_id,t_admin.a_count LIMIT s,page_size;
    ELSE SELECT t_admin.*,t_a_type.a_t_name FROM t_admin,t_a_type WHERE
        t_admin.a_t_id = t_a_type.a_t_id AND
        t_admin.a_t_id >= a_t_id_in AND
        t_admin.a_t_id = a_t_id_s_in AND
        t_admin.a_id != a_id_in ORDER BY t_admin.a_t_id,t_admin.a_count LIMIT s,page_size;

    END IF ;
  ELSE
    SELECT t_admin.*,t_a_type.a_t_name FROM t_admin,t_a_type,t_cpn_admin
    WHERE t_admin.a_t_id = t_a_type.a_t_id AND
          t_admin.a_id = t_cpn_admin.a_id AND
          t_cpn_admin.cpn_id = cpn_id_in AND
          t_admin.a_id != a_id_in ORDER BY t_admin.a_count LIMIT s,page_size;
  END IF ;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `get_car_host`
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_car_host`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_car_host`(IN c_id_in INT)
BEGIN
    if(c_id_in in (SELECT c_id FROM t_private_car)) THEN
      SELECT t_driver.u_id ,t_driver.d_real_name , '1' AS type FROM 
        t_driver ,t_private_car WHERE 
        t_private_car.u_id = t_driver.u_id AND 
          t_private_car.c_id = c_id_in;
    ELSE 
        SELECT t_company.cpn_id,t_company.cpn_name ,'2' as type FROM 
          t_company,t_cpn_car WHERE 
          t_cpn_car.cpn_id = t_company.cpn_id AND 
            t_cpn_car.c_id = c_id_in;
    END IF ;
  END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `get_car_list_count`
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_car_list_count`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_car_list_count`(In cpn_id_in INT,IN c_state_s INT,IN c_plant_s VARCHAR(20))
BEGIN
    DECLARE result INT;
    IF cpn_id_in = 0 THEN
      IF c_state_s = 0 THEN
        SELECT count(*) INTO result FROM t_c_type,t_car WHERE
          t_c_type.c_t_id = t_car.c_t_id AND
          t_car.c_plate_number LIKE concat('%',c_plant_s,'%');

      ELSE
        SELECT count(*) INTO result FROM t_c_type,t_car WHERE
          t_c_type.c_t_id = t_car.c_t_id AND
          t_car.c_state = c_state_s AND
          t_car.c_plate_number LIKE concat('%',c_plant_s,'%');

      END IF ;
    ELSE
      IF c_state_s = 0 THEN
        SELECT count(*) INTO result FROM t_c_type,t_car,t_cpn_car WHERE
          t_c_type.c_t_id = t_car.c_t_id AND
          t_car.c_id = t_cpn_car.c_id AND
          t_cpn_car.cpn_id = cpn_id_in AND
          t_car.c_plate_number LIKE concat('%',c_plant_s,'%');

      ELSE
        SELECT count(*) INTO result FROM t_c_type,t_car,t_cpn_car WHERE
          t_c_type.c_t_id = t_car.c_t_id AND
          t_car.c_state = c_state_s AND
          t_car.c_id = t_cpn_car.c_id AND
          t_cpn_car.cpn_id = cpn_id_in AND
          t_car.c_plate_number LIKE concat('%',c_plant_s,'%');
      END IF ;
    END IF ;
    SELECT result;
  END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `get_car_page_list`
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_car_page_list`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_car_page_list`(In cpn_id_in INT,IN curr_page INT ,IN page_size INT,IN c_state_s INT,IN c_plant_s VARCHAR(20))
BEGIN
    DECLARE s INT;
    SET s = (curr_page-1)*page_size;
    IF cpn_id_in = 0 THEN
      IF c_state_s = 0 THEN
        SELECT t_c_type.c_t_name,t_car.* FROM t_c_type,t_car WHERE
          t_c_type.c_t_id = t_car.c_t_id AND
          t_car.c_plate_number LIKE concat('%',c_plant_s,'%')
             ORDER BY t_car.c_t_id,t_car.c_brand,t_car.c_plate_number LIMIT s,page_size;
      ELSE
        SELECT t_c_type.c_t_name,t_car.* FROM t_c_type,t_car WHERE
          t_c_type.c_t_id = t_car.c_t_id AND
            t_car.c_state = c_state_s AND
          t_car.c_plate_number LIKE concat('%',c_plant_s,'%')
        ORDER BY t_car.c_t_id,t_car.c_brand,t_car.c_plate_number LIMIT s,page_size;
      END IF ;
    ELSE
      IF c_state_s = 0 THEN
        SELECT t_c_type.c_t_name,t_car.* FROM t_c_type,t_car,t_cpn_car WHERE
          t_c_type.c_t_id = t_car.c_t_id AND
            t_car.c_id = t_cpn_car.c_id AND
            t_cpn_car.cpn_id = cpn_id_in AND
          t_car.c_plate_number LIKE concat('%',c_plant_s,'%')
        ORDER BY t_car.c_t_id,t_car.c_brand,t_car.c_plate_number LIMIT s,page_size;
      ELSE
        SELECT t_c_type.c_t_name,t_car.* FROM t_c_type,t_car,t_cpn_car WHERE
          t_c_type.c_t_id = t_car.c_t_id AND
          t_car.c_state = c_state_s AND
          t_car.c_id = t_cpn_car.c_id AND
          t_cpn_car.cpn_id = cpn_id_in AND
          t_car.c_plate_number LIKE concat('%',c_plant_s,'%')
        ORDER BY t_car.c_t_id,t_car.c_brand,t_car.c_plate_number LIMIT s,page_size;

      END IF ;
    END IF ;
  END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `get_driver_list_count`
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_driver_list_count`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_driver_list_count`(In cpn_id_in INT,IN d_state_s INT,IN d_real_name_s VARCHAR(20))
BEGIN
    DECLARE result INT;
    IF cpn_id_in = 0 THEN
      IF d_state_s = 0 THEN
        SELECT count(*) INTO result FROM t_user,t_driver WHERE
          t_user.u_id = t_driver.u_id AND
          t_driver.d_real_name LIKE concat('%',d_real_name_s,'%') ;
      ELSE
        SELECT count(*) INTO result FROM t_user,t_driver WHERE
          t_user.u_id = t_driver.u_id AND t_driver.d_state = d_state_s AND
          t_driver.d_real_name LIKE concat('%',d_real_name_s,'%') ;
      END IF ;
    ELSE
      IF d_state_s = 0 THEN
        SELECT count(*) INTO result FROM t_user,t_driver,t_employee WHERE
          t_user.u_id = t_driver.u_id AND
          t_driver.d_real_name LIKE concat('%',d_real_name_s,'%') AND
          t_driver.u_id = t_employee.u_id AND
          t_employee.cpn_id = cpn_id_in ;
      ELSE
        SELECT count(*) INTO result FROM t_user,t_driver,t_employee WHERE
          t_user.u_id = t_driver.u_id AND
          t_driver.d_real_name LIKE concat('%',d_real_name_s,'%') AND
          t_driver.d_state = d_state_s AND
          t_driver.u_id = t_employee.u_id AND
          t_employee.cpn_id = cpn_id_in ;
      END IF ;
    END IF ;
    SELECT result;
  END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `get_driver_page_list`
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_driver_page_list`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_driver_page_list`(In cpn_id_in INT,IN curr_page INT ,IN page_size INT,IN d_state_s INT,IN d_real_name_s VARCHAR(20))
BEGIN
  DECLARE s INT;
  SET s = (curr_page-1)*page_size;
  IF cpn_id_in = 0 THEN
    IF d_state_s = 0 THEN
      SELECT t_user.u_credit,t_driver.* FROM t_user,t_driver WHERE
        t_user.u_id = t_driver.u_id AND
        t_driver.d_real_name LIKE concat('%',d_real_name_s,'%') ORDER BY t_driver.d_real_name LIMIT s,page_size;
    ELSE
      SELECT t_user.u_credit,t_driver.* FROM t_user,t_driver WHERE
        t_user.u_id = t_driver.u_id AND t_driver.d_state = d_state_s AND
        t_driver.d_real_name LIKE concat('%',d_real_name_s,'%') ORDER BY t_driver.d_real_name LIMIT s,page_size;

    END IF ;
  ELSE
    IF d_state_s = 0 THEN
      SELECT t_user.u_credit,t_driver.* FROM t_user,t_driver,t_employee WHERE
        t_user.u_id = t_driver.u_id AND
        t_driver.d_real_name LIKE concat('%',d_real_name_s,'%') AND
          t_driver.u_id = t_employee.u_id AND
          t_employee.cpn_id = cpn_id_in ORDER BY
        t_driver.d_real_name LIMIT s,page_size;
    ELSE
      SELECT t_user.u_credit,t_driver.* FROM t_user,t_driver,t_employee WHERE
        t_user.u_id = t_driver.u_id AND
        t_driver.d_real_name LIKE concat('%',d_real_name_s,'%') AND
        t_driver.d_state = d_state_s AND
        t_driver.u_id = t_employee.u_id AND
        t_employee.cpn_id = cpn_id_in ORDER BY
        t_driver.d_real_name LIMIT s,page_size;
    END IF ;
  END IF ;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `get_server_drive_by_id`
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_server_drive_by_id`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_server_drive_by_id`(IN u_id_in INT)
BEGIN
    SELECT t_driver.u_id,t_driver.d_real_name FROM
      t_driver,t_work,t_order_flow,t_order WHERE
      t_driver.u_id = t_work.u_id AND
        t_work.w_id = t_order_flow.w_id AND
        t_order_flow.o_id = t_order.o_id AND
        t_order.u_id = u_id_in;
  END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `get_user_list_count`
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_user_list_count`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_user_list_count`(IN u_state_s INT,IN u_name_s VARCHAR(20))
BEGIN
    DECLARE result INT;
    if u_state_s = 0 THEN
      SELECT count(*) INTO result FROM t_user WHERE u_name LIKE concat('%',u_name_s,'%') ;
    ELSE SELECT count(*) INTO result FROM t_user WHERE u_state = u_state_s AND
                                    u_name LIKE concat('%',u_name_s,'%') ;
    END IF ;
    SELECT result;
  END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `get_user_page_list`
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_user_page_list`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_user_page_list`(IN curr_page INT ,IN page_size INT,IN u_state_s INT,IN u_name_s VARCHAR(20))
BEGIN
    DECLARE s INT;
    SET s = (curr_page-1)*page_size;
    if u_state_s = 0 THEN
      SELECT * FROM t_user WHERE u_name LIKE concat('%',u_name_s,'%') ORDER BY u_name LIMIT s,page_size;
    ELSE SELECT * FROM t_user WHERE u_state = u_state_s AND
                                 u_name LIKE concat('%',u_name_s,'%') ORDER BY u_name LIMIT s, page_size;
    END IF ;
  END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `is_admin_exist`
-- ----------------------------
DROP PROCEDURE IF EXISTS `is_admin_exist`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `is_admin_exist`(in a_count_in VARCHAR(20))
BEGIN
    DECLARE result BOOLEAN;

    if((SELECT count(*) FROM t_admin WHERE a_count = trim(a_count_in))>0)
    THEN SET result = TRUE ;
    ELSE SET result=FALSE ;
    END IF ;
    SELECT result;
  END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `is_cpn_admin`
-- ----------------------------
DROP PROCEDURE IF EXISTS `is_cpn_admin`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `is_cpn_admin`(in a_id_in INT)
BEGIN
    DECLARE result int;
    SET result = 0;
    if((SELECT count(*) FROM t_cpn_admin WHERE a_id = a_id_in) > 0)
    THEN 
      SELECT cpn_id FROM t_cpn_admin WHERE a_id = a_id_in INTO result;
    ELSE SET result = 0;
    END IF ;
    SELECT result;
  END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `is_driver_by_name`
-- ----------------------------
DROP PROCEDURE IF EXISTS `is_driver_by_name`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `is_driver_by_name`(in u_name_in VARCHAR(20))
BEGIN
    DECLARE id int;
    DECLARE result BOOLEAN;
    SET id = 0;
    SELECT u_id FROM t_user WHERE trim(u_name_in) = t_user.u_name into id;
    if((SELECT count(*) FROM t_driver WHERE id = t_driver.u_id)>0)
      THEN SET result = TRUE ;
    ELSE SET result=FALSE ;
    END IF ;
    SELECT result;
  END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `is_id_card_exist`
-- ----------------------------
DROP PROCEDURE IF EXISTS `is_id_card_exist`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `is_id_card_exist`(in id_card_in VARCHAR(20))
BEGIN
    DECLARE result BOOLEAN;

    if((SELECT count(*) FROM t_user WHERE u_id_card_number = trim(id_card_in))>0)
    THEN SET result = TRUE ;
    ELSE SET result=FALSE ;
    END IF ;
    SELECT result;
  END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `is_phone_exist`
-- ----------------------------
DROP PROCEDURE IF EXISTS `is_phone_exist`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `is_phone_exist`(in phone_in VARCHAR(20))
BEGIN
    DECLARE result BOOLEAN;

    if((SELECT count(*) FROM t_user WHERE u_phone_number = trim(phone_in))>0)
    THEN SET result = TRUE ;
    ELSE SET result=FALSE ;
    END IF ;
    SELECT result;
  END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `is_user_exist`
-- ----------------------------
DROP PROCEDURE IF EXISTS `is_user_exist`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `is_user_exist`(in u_name_in VARCHAR(20))
BEGIN
    DECLARE result BOOLEAN;

    if((SELECT count(*) FROM t_user WHERE u_name = trim(u_name_in))>0)
    THEN SET result = TRUE ;
    ELSE SET result=FALSE ;
    END IF ;
    SELECT result;
  END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `register_admin`
-- ----------------------------
DROP PROCEDURE IF EXISTS `register_admin`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `register_admin`(IN a_t_id_in INT, IN a_count_in VARCHAR(20),IN a_pwd_in VARCHAR(15),IN cpn_id_in INT)
BEGIN
    DECLARE result INT;
    DECLARE a_id_temp INT;
    INSERT INTO t_admin(a_t_id, a_count, a_password)
      VALUES (a_t_id_in,a_count_in,a_pwd_in);

    if(cpn_id_in > 0 && a_t_id_in = 3) THEN
      SELECT a_id INTO a_id_temp FROM t_admin WHERE a_count = a_count_in;
      if(a_id_temp > 0) THEN
        INSERT INTO t_cpn_admin(a_id, cpn_id) VALUES (a_id_temp,cpn_id_in);

      END IF ;
    END IF ;
    SET result = row_count();
    SELECT result;
  END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `register_user`
-- ----------------------------
DROP PROCEDURE IF EXISTS `register_user`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `register_user`(in name_in VARCHAR(20),in pwd_in VARCHAR(15),in phone_in VARCHAR(11),in id_card_in VARCHAR(18))
BEGIN
    DECLARE result INT;
    INSERT INTO t_user(u_name, u_password, u_phone_number, u_id_card_number)
      VALUES (name_in,pwd_in,phone_in,id_card_in);
    SET result = row_count();
    SELECT result;
  END
;;
DELIMITER ;
DELIMITER ;;
CREATE TRIGGER `calculate_credit` BEFORE INSERT ON `t_feedback` FOR EACH ROW if new.f_t_id = 3 AND new.f_target != 0 then
    UPDATE t_user SET u_credit = u_credit-1 WHERE t_user.u_id = NEW.f_target;
  end if
;;
DELIMITER ;
DELIMITER ;;
CREATE TRIGGER `default_m_f_time` BEFORE INSERT ON `t_money_flow` FOR EACH ROW if new.m_f_time is null then
    set new.m_f_time = now();
  end if
;;
DELIMITER ;
DELIMITER ;;
CREATE TRIGGER `default_o_now_time` BEFORE INSERT ON `t_order` FOR EACH ROW if new.o_now_time is null then
      set new.o_now_time = now();
    end if
;;
DELIMITER ;
DELIMITER ;;
CREATE TRIGGER `default_p_pub_time` BEFORE INSERT ON `t_post` FOR EACH ROW if new.p_pub_time is null then
    set new.p_pub_time = now();
  end if
;;
DELIMITER ;
DELIMITER ;;
CREATE TRIGGER `auto_mod` BEFORE UPDATE ON `t_user` FOR EACH ROW BEGIN
    if new.u_credit < 0 THEN
      SET new.u_credit = 0;
    END IF ;

    if new.u_credit < 80 then
      SET NEW.u_state = 2;
    end if ;
  END
;;
DELIMITER ;
