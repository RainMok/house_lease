/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : lease_house

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 06/02/2023 15:35:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for lease_area
-- ----------------------------
DROP TABLE IF EXISTS `lease_area`;
CREATE TABLE `lease_area` (
  `area_id` tinyint unsigned NOT NULL AUTO_INCREMENT COMMENT '区域id',
  `area_name` varchar(12) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '区域名称',
  PRIMARY KEY (`area_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='区域表';

-- ----------------------------
-- Records of lease_area
-- ----------------------------
BEGIN;
INSERT INTO `lease_area` (`area_id`, `area_name`) VALUES (1, '铁东区');
INSERT INTO `lease_area` (`area_id`, `area_name`) VALUES (2, '铁西区');
INSERT INTO `lease_area` (`area_id`, `area_name`) VALUES (3, '立山区');
INSERT INTO `lease_area` (`area_id`, `area_name`) VALUES (4, '千山区');
COMMIT;

-- ----------------------------
-- Table structure for lease_community
-- ----------------------------
DROP TABLE IF EXISTS `lease_community`;
CREATE TABLE `lease_community` (
  `community_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '社区id',
  `community_name` varchar(16) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '社区名称',
  `community_address` varchar(64) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '社区地址',
  `community_tel` varchar(15) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '社区电话',
  `community_pid` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '社区父级id，对应办事处id',
  PRIMARY KEY (`community_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='社区表，对应鞍山市所有社区';

-- ----------------------------
-- Records of lease_community
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for lease_house
-- ----------------------------
DROP TABLE IF EXISTS `lease_house`;
CREATE TABLE `lease_house` (
  `house_id` int NOT NULL COMMENT '房屋id',
  `house_number` varchar(32) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '房屋户籍号',
  `house_block_id` tinyint unsigned NOT NULL COMMENT '房屋所在小区id',
  `house_building_number` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '房屋所在栋号',
  `house_area_number` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '房屋所在单元号',
  `house_door_number` varchar(8) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '房屋房间号',
  `house_area` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '房屋面积',
  `house_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '房屋状态：空房0，已住1',
  `house_apply_id` int unsigned NOT NULL DEFAULT '0' COMMENT '当前生效中的房屋租赁申请id号',
  PRIMARY KEY (`house_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='房屋信息表';

-- ----------------------------
-- Records of lease_house
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for lease_house_apply
-- ----------------------------
DROP TABLE IF EXISTS `lease_house_apply`;
CREATE TABLE `lease_house_apply` (
  `apply_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '申请id',
  `apply_user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '申请人的id',
  `apply_house_id` int unsigned NOT NULL DEFAULT '0' COMMENT '申请绑定的房屋id',
  `apply_user_family_count` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '家庭成员人数',
  `apply_user_family_ids` varchar(32) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '[]' COMMENT '家庭成员id集合',
  `apply_house_status` tinyint NOT NULL DEFAULT '0' COMMENT '廉租房、公租房状态',
  `apply_house_date` date DEFAULT NULL COMMENT '申请的日期',
  `check_pass_date` date DEFAULT NULL COMMENT '审核通过日期',
  `house_match_date` date DEFAULT NULL COMMENT '配房时间',
  `house_deal_date` date DEFAULT NULL COMMENT '合同签订日期',
  `lease_house_dead_line` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '租赁期限',
  `deal_start_date` date DEFAULT NULL COMMENT '租赁期开始时间',
  `deal_end_date` date DEFAULT NULL COMMENT '租赁期结束时间',
  `pay_per_month` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '月租金',
  `pay_per_year` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '年租金',
  `apply_remark` text COLLATE utf8mb4_general_ci COMMENT '申请备注',
  `house_user_files_dir` varchar(32) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '电子文件保存路径',
  PRIMARY KEY (`apply_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='租赁房屋申请表';

-- ----------------------------
-- Records of lease_house_apply
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for lease_house_block
-- ----------------------------
DROP TABLE IF EXISTS `lease_house_block`;
CREATE TABLE `lease_house_block` (
  `block_id` tinyint unsigned NOT NULL AUTO_INCREMENT COMMENT '小区id',
  `block_area_id` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '所属区域id',
  `block_name` varchar(32) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '小区名称',
  PRIMARY KEY (`block_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='小区表';

-- ----------------------------
-- Records of lease_house_block
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for lease_house_type
-- ----------------------------
DROP TABLE IF EXISTS `lease_house_type`;
CREATE TABLE `lease_house_type` (
  `type_id` tinyint NOT NULL COMMENT '房屋类型id',
  `type_name` varchar(16) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '房屋类型：公租房、廉租房',
  `type_keywords` varchar(32) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '公租房：第二类房；廉租房:第一类房',
  `mark_color` varchar(16) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标记颜色，根据不同房屋类型，设计标记颜色',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='房屋类型表';

-- ----------------------------
-- Records of lease_house_type
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for lease_manager
-- ----------------------------
DROP TABLE IF EXISTS `lease_manager`;
CREATE TABLE `lease_manager` (
  `manager_id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `account` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '管理员登录账号',
  `password` char(41) COLLATE utf8mb4_general_ci NOT NULL COMMENT '管理员登录密码',
  `manager_name` varchar(16) COLLATE utf8mb4_general_ci NOT NULL COMMENT '管理员姓名',
  `manager_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '管理员账号状态',
  PRIMARY KEY (`manager_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of lease_manager
-- ----------------------------
BEGIN;
INSERT INTO `lease_manager` (`manager_id`, `account`, `password`, `manager_name`, `manager_status`) VALUES (1, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Admin', 1);
COMMIT;

-- ----------------------------
-- Table structure for lease_office
-- ----------------------------
DROP TABLE IF EXISTS `lease_office`;
CREATE TABLE `lease_office` (
  `office_id` tinyint unsigned NOT NULL AUTO_INCREMENT COMMENT '办事处id',
  `office_name` varchar(32) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '办事处名称',
  `office_address` varchar(64) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '办事处地址',
  `office_tel` varchar(15) COLLATE utf8mb4_general_ci NOT NULL COMMENT '办事处电话',
  `office_area_id` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '所属区id',
  PRIMARY KEY (`office_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of lease_office
-- ----------------------------
BEGIN;
INSERT INTO `lease_office` (`office_id`, `office_name`, `office_address`, `office_tel`, `office_area_id`) VALUES (1, '和平街道', '团结街9栋', '7300215', 1);
INSERT INTO `lease_office` (`office_id`, `office_name`, `office_address`, `office_tel`, `office_area_id`) VALUES (2, '站前街道', '铁东区四道街33号', '2227013', 1);
INSERT INTO `lease_office` (`office_id`, `office_name`, `office_address`, `office_tel`, `office_area_id`) VALUES (3, '园林街道', '铁东区东山街70栋', '2581015', 1);
INSERT INTO `lease_office` (`office_id`, `office_name`, `office_address`, `office_tel`, `office_area_id`) VALUES (4, '山南街道', '铁东区南中华路160号', '5501031', 1);
INSERT INTO `lease_office` (`office_id`, `office_name`, `office_address`, `office_tel`, `office_area_id`) VALUES (5, '解放街道', '康宁街18号', '5644259', 1);
INSERT INTO `lease_office` (`office_id`, `office_name`, `office_address`, `office_tel`, `office_area_id`) VALUES (6, '长甸街道', '康宁街26甲', '8669510', 1);
INSERT INTO `lease_office` (`office_id`, `office_name`, `office_address`, `office_tel`, `office_area_id`) VALUES (7, '湖南街道', '解放东路198号', '5840639', 1);
INSERT INTO `lease_office` (`office_id`, `office_name`, `office_address`, `office_tel`, `office_area_id`) VALUES (8, '新兴街道', '铁东区营崔路1号', '2267800', 1);
INSERT INTO `lease_office` (`office_id`, `office_name`, `office_address`, `office_tel`, `office_area_id`) VALUES (9, '旧堡街道', '中华路西50米', '5644000', 1);
INSERT INTO `lease_office` (`office_id`, `office_name`, `office_address`, `office_tel`, `office_area_id`) VALUES (10, '大孤山街道', '铁南中街248号', '5808020', 1);
COMMIT;

-- ----------------------------
-- Table structure for lease_status_change
-- ----------------------------
DROP TABLE IF EXISTS `lease_status_change`;
CREATE TABLE `lease_status_change` (
  `change_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '房屋类型转变id',
  `house_id` int unsigned NOT NULL COMMENT '房屋id',
  `change_date` date DEFAULT NULL COMMENT '变更时间',
  `date_time` datetime DEFAULT NULL COMMENT '变更的操作时间',
  PRIMARY KEY (`change_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='廉转公、公转廉记录表';

-- ----------------------------
-- Records of lease_status_change
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for lease_stree_block
-- ----------------------------
DROP TABLE IF EXISTS `lease_stree_block`;
CREATE TABLE `lease_stree_block` (
  `stree_id` tinyint unsigned NOT NULL AUTO_INCREMENT COMMENT '街区id',
  `stree_name` varchar(16) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '街区名称',
  `stree_pid` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '街区父id',
  `stree_area_id` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '街区所属区域id',
  PRIMARY KEY (`stree_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='街区表';

-- ----------------------------
-- Records of lease_stree_block
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
