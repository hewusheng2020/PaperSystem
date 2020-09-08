/*
 Navicat MySQL Data Transfer

 Source Server         : centos
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : 192.168.188.8:3306
 Source Schema         : paper

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 08/09/2020 08:48:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for paper
-- ----------------------------
DROP TABLE IF EXISTS `paper`;
CREATE TABLE `paper`  (
  `paper_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'paperID',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'paper名称',
  `number` int(0) NOT NULL COMMENT 'paper数量',
  `detail` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'paper描述',
  PRIMARY KEY (`paper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'paper表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of paper
-- ----------------------------
INSERT INTO `paper` VALUES (7, '机器学习', 2, 'mlmlmlml');
INSERT INTO `paper` VALUES (8, '深度学习', 3, 'dldldl');

SET FOREIGN_KEY_CHECKS = 1;
