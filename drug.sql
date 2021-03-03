/*
 Navicat Premium Data Transfer

 Source Server         : root2
 Source Server Type    : MySQL
 Source Server Version : 50732
 Source Host           : localhost:3306
 Source Schema         : drug

 Target Server Type    : MySQL
 Target Server Version : 50732
 File Encoding         : 65001

 Date: 03/03/2021 08:29:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for billinfo
-- ----------------------------
DROP TABLE IF EXISTS `billinfo`;
CREATE TABLE `billinfo`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商名称',
  `dname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品名称',
  `count` int(10) NULL DEFAULT NULL COMMENT '药品数量',
  `total` float(20, 2) NULL DEFAULT NULL COMMENT '总金额',
  `buytime` datetime(0) NULL DEFAULT NULL COMMENT '进货时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '账单信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of billinfo
-- ----------------------------
INSERT INTO `billinfo` VALUES (1, '哈药六厂', '感冒灵', 1000, 22500.00, '2021-02-02 16:00:00');

-- ----------------------------
-- Table structure for druginfo
-- ----------------------------
DROP TABLE IF EXISTS `druginfo`;
CREATE TABLE `druginfo`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `supplier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商',
  `producttime` date NULL DEFAULT NULL COMMENT '生产时间',
  `warrenty` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保质期（月）',
  `number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品编码',
  `price` float(20, 2) NULL DEFAULT NULL COMMENT '价格',
  `stock` int(10) NULL DEFAULT NULL COMMENT '库存',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '药品信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of druginfo
-- ----------------------------
INSERT INTO `druginfo` VALUES (2, '感冒灵', '哈药六厂', '2020-01-27', '24', '1001', 22.50, 50);
INSERT INTO `druginfo` VALUES (3, '白药片', '云南白药', '2021-02-02', '36', '2021052', 30.50, 100);

-- ----------------------------
-- Table structure for owinfo
-- ----------------------------
DROP TABLE IF EXISTS `owinfo`;
CREATE TABLE `owinfo`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品名称',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出库/入库',
  `count` int(10) NULL DEFAULT NULL COMMENT '数量',
  `operator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `createtime` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '出入库' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of owinfo
-- ----------------------------
INSERT INTO `owinfo` VALUES (1, '白药片', '出库', 3, '华佗', '2021-02-20 14:21:53');
INSERT INTO `owinfo` VALUES (2, '感冒灵', '入库', 20, '扁鹊', '2021-02-20 14:22:12');

-- ----------------------------
-- Table structure for problem
-- ----------------------------
DROP TABLE IF EXISTS `problem`;
CREATE TABLE `problem`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品名称',
  `dcount` int(10) NULL DEFAULT NULL COMMENT '问题药品数量',
  `dprice` float(20, 2) NULL DEFAULT NULL COMMENT '药品单价',
  `reason` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问题原因',
  `createtime` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '问题药品' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of problem
-- ----------------------------
INSERT INTO `problem` VALUES (1, '感冒灵', 2, 22.50, '受潮了。不能欺骗消费者。', '2021-02-24 14:19:36');

-- ----------------------------
-- Table structure for returngoods
-- ----------------------------
DROP TABLE IF EXISTS `returngoods`;
CREATE TABLE `returngoods`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品名称',
  `count` int(10) NULL DEFAULT NULL COMMENT '数量',
  `reason` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退货原因',
  `total` float(20, 2) NULL DEFAULT NULL COMMENT '总金额',
  `operatetime` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收到退货' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of returngoods
-- ----------------------------
INSERT INTO `returngoods` VALUES (1, '感冒灵', 1, '过期了。', 22.50, '2021-02-25 16:00:00');

-- ----------------------------
-- Table structure for returnsupplier
-- ----------------------------
DROP TABLE IF EXISTS `returnsupplier`;
CREATE TABLE `returnsupplier`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品名称',
  `dcount` int(10) NULL DEFAULT NULL COMMENT '数量',
  `sname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商名称',
  `buytime` datetime(0) NULL DEFAULT NULL COMMENT '进货时间',
  `reason` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退货原因',
  `createtime` datetime(0) NULL DEFAULT NULL COMMENT '退货时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '退货给供应商' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of returnsupplier
-- ----------------------------
INSERT INTO `returnsupplier` VALUES (1, '感冒灵', 5, '哈药六厂', '2021-02-24 16:00:00', '过期了呗！！！', '2021-02-26 16:00:00');

-- ----------------------------
-- Table structure for saleinfo
-- ----------------------------
DROP TABLE IF EXISTS `saleinfo`;
CREATE TABLE `saleinfo`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品名称',
  `dnumber` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品编号',
  `count` int(10) NULL DEFAULT NULL COMMENT '数量',
  `total` float(20, 2) NULL DEFAULT NULL COMMENT '金额',
  `operator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `operatetime` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '销售记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of saleinfo
-- ----------------------------
INSERT INTO `saleinfo` VALUES (1, '感冒灵', '1001', 2, 45.00, '张三', '2021-02-25 16:00:00');

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商名称',
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商描述',
  `createtime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '供应商' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES (1, '哈药六厂', '东北很知名的企业之一', '2018-01-17 11:52:53');
INSERT INTO `supplier` VALUES (2, '云南白药', '云南白药是云南著名的中成药，由名贵药材制成，具有化瘀止血、活血止痛、解毒消肿之功效。', '2021-02-18 14:20:49');
INSERT INTO `supplier` VALUES (3, '阿莫西林', '阿莫西林，又名安莫西林或安默西林，是一种最常用的半合成青霉素类广谱β-内酰胺类抗生素，为一种白色粉末，半衰期约为61.3分钟。在酸性条件下稳定，胃肠道吸收率达90%。阿莫西林杀菌作用强，穿透细胞膜的能力也强。是目前应用较为广泛的口服半合成青霉素之一，其制剂有胶囊、片剂、颗粒剂、分散片等等，现在常与克拉维酸合用制成分散片。\n', '2021-03-02 23:57:51');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '123456');

SET FOREIGN_KEY_CHECKS = 1;
