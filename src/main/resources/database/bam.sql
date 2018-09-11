/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50637
Source Host           : localhost:3306
Source Database       : bam

Target Server Type    : MYSQL
Target Server Version : 50637
File Encoding         : 65001

Date: 2018-09-11 10:30:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `accountname` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(1) NOT NULL,
  `phone` varchar(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accountname_unique` (`accountname`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '123456', '张三', '1', '12345678912');
INSERT INTO `admin` VALUES ('2', 'admin1', '654321', '李四', '2', '98765432189');

-- ----------------------------
-- Table structure for `books`
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `book_name` varchar(50) NOT NULL,
  `book_type` varchar(50) NOT NULL,
  `book_price` int(5) NOT NULL,
  `book_publish` varchar(50) NOT NULL,
  `book_newtime` varchar(20) DEFAULT NULL,
  `book_number` int(11) NOT NULL,
  `book_text` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1010 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES ('1000', 'java程序设计', '计算机', '30', '清华大学出版社', null, '2', 'java入门级书籍');
INSERT INTO `books` VALUES ('1001', '数据结构', '计算机', '40', '清华大学出版社', '2016-07-07', '6', '数据结构是计算机存储、组织数据的方式。数据结构是指相互之间存在一种或多种特定关系的数据元素的集合。');
INSERT INTO `books` VALUES ('1002', '设计模式', '计算机', '41', '清华大学出版社', '2016-07-07', '4', '设计模式（Design Pattern）是一套被反复使用、多数人知晓的、经过分类的、代码设计经验的总结');
INSERT INTO `books` VALUES ('1003', '编译原理', '计算机', '45', '清华大学出版社', '2016-07-07', '3', '编译原理是计算机专业的一门重要专业课，旨在介绍编译程序构造的一般原理和基本方法');
INSERT INTO `books` VALUES ('1004', '大学语文', '教育', '35', '清华大学出版社', '2016-07-07', '3', '基于长期的教学实践和学科思考，我们编写了这本《大学语文》教材');
INSERT INTO `books` VALUES ('1005', '计算方法', '数学', '40', '清华大学出版社', '2016-07-07', '7', '计算方法又称“数值分析”。是为各种数学问题的数值解答研究提供最有效的算法。');
INSERT INTO `books` VALUES ('1006', '高等数学', '教育', '40', '清华大学出版社', '2016-07-07', '5', '广义地说，初等数学之外的数学都是高等数学，也有将中学较深入的代数、几何以及简单的集合论初步');
INSERT INTO `books` VALUES ('1008', '计算机网络', '计算机', '45', '人民邮电出版社', '2017-01-03', '1', '计算机网络入门级书籍');
INSERT INTO `books` VALUES ('1009', '嵌入式', '硬件', '40', '人民邮电出版社', '2017-12-13', '0', '硬件学习书籍');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `order_id` int(5) NOT NULL AUTO_INCREMENT,
  `user_acname` varchar(20) NOT NULL,
  `book_id` int(5) NOT NULL,
  `starttime` varchar(20) NOT NULL,
  `finishtime` varchar(20) NOT NULL,
  `status` int(5) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', 'test', '1003', '2018-09-10', '2018-09-15', '0');
INSERT INTO `orders` VALUES ('2', 'test', '1005', '2018-09-11', '2018-09-17', '1');
INSERT INTO `orders` VALUES ('3', 'test', '1002', '2018-09-11', '2018-09-17', '1');
INSERT INTO `orders` VALUES ('4', 'user', '1001', '2018-09-11', '2018-09-17', '0');
INSERT INTO `orders` VALUES ('5', 'user', '1005', '2018-09-11', '2018-09-17', '1');
INSERT INTO `orders` VALUES ('6', 'user', '1006', '2018-09-11', '2018-09-17', '1');
INSERT INTO `orders` VALUES ('7', 'test', '1000', '2018-09-11', '2018-09-17', '1');
INSERT INTO `orders` VALUES ('8', 'test', '1008', '2018-09-11', '2018-09-17', '1');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `accountname` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(1) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `idnumber` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accountname_unique` (`accountname`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('4', 'test', '123456', 'liu', '2', '12345678934', '881303201803136789');
INSERT INTO `user` VALUES ('5', 'user', '654321', 'chen', '2', '12345678912', '110303201803136789');
INSERT INTO `user` VALUES ('10', 'nancy2018', '123456789', 'Nancy2018525', '2', '12345678912', '881303201803134561');
INSERT INTO `user` VALUES ('11', '测试用户', '123456', '张', '1', '12345678912', '881303201803131234');
