/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50553
 Source Host           : localhost:3306
 Source Schema         : ling_book

 Target Server Type    : MySQL
 Target Server Version : 50553
 File Encoding         : 65001

 Date: 06/05/2018 15:07:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book_admin_access
-- ----------------------------
DROP TABLE IF EXISTS `book_admin_access`;
CREATE TABLE `book_admin_access`  (
  `role_id` smallint(6) UNSIGNED NOT NULL DEFAULT 0,
  `node_id` smallint(6) UNSIGNED NOT NULL DEFAULT 0,
  `level` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `pid` smallint(6) UNSIGNED NOT NULL DEFAULT 0,
  INDEX `groupId`(`role_id`) USING BTREE,
  INDEX `nodeId`(`node_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for book_admin_group
-- ----------------------------
DROP TABLE IF EXISTS `book_admin_group`;
CREATE TABLE `book_admin_group`  (
  `id` smallint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'icon小图标',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 50,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `isdelete` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sort`(`sort`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book_admin_group
-- ----------------------------
INSERT INTO `book_admin_group` VALUES (1, '系统管理', '&#xe61d;', 1, 1, '', 0, 1450752856, 1481180175);
INSERT INTO `book_admin_group` VALUES (2, '工具', '&#xe616;', 1, 1, '', 0, 1476016712, 1481180175);
INSERT INTO `book_admin_group` VALUES (3, '用户管理', '', 1, 1, '', 0, 1504596854, 1504596854);
INSERT INTO `book_admin_group` VALUES (4, '小巧玲珑书吧', '&#xe67f;', 1, 1, '', 0, 1519957846, 1519961672);

-- ----------------------------
-- Table structure for book_admin_node
-- ----------------------------
DROP TABLE IF EXISTS `book_admin_node`;
CREATE TABLE `book_admin_node`  (
  `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` smallint(6) UNSIGNED NOT NULL DEFAULT 0,
  `group_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `level` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '节点类型，1-控制器 | 0-方法',
  `sort` smallint(6) UNSIGNED NOT NULL DEFAULT 50,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `isdelete` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `level`(`level`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `name`(`name`) USING BTREE,
  INDEX `isdelete`(`isdelete`) USING BTREE,
  INDEX `sort`(`sort`) USING BTREE,
  INDEX `group_id`(`group_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 71 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book_admin_node
-- ----------------------------
INSERT INTO `book_admin_node` VALUES (1, 0, 1, 'Admin', '后台管理', '后台管理，不可更改', 1, 1, 1, 1, 0);
INSERT INTO `book_admin_node` VALUES (2, 1, 1, 'AdminGroup', '分组管理', ' ', 2, 1, 1, 1, 0);
INSERT INTO `book_admin_node` VALUES (3, 1, 1, 'AdminNode', '节点管理', ' ', 2, 1, 2, 1, 0);
INSERT INTO `book_admin_node` VALUES (4, 1, 1, 'AdminRole', '角色管理', ' ', 2, 1, 3, 1, 0);
INSERT INTO `book_admin_node` VALUES (5, 1, 1, 'AdminUser', '用户管理', '', 2, 1, 4, 1, 0);
INSERT INTO `book_admin_node` VALUES (6, 1, 0, 'Index', '首页', '', 2, 1, 50, 1, 0);
INSERT INTO `book_admin_node` VALUES (7, 6, 0, 'welcome', '欢迎页', '', 3, 0, 50, 1, 0);
INSERT INTO `book_admin_node` VALUES (8, 6, 0, 'index', '未定义', '', 3, 0, 50, 1, 0);
INSERT INTO `book_admin_node` VALUES (9, 1, 2, 'Generate', '代码自动生成', '', 2, 1, 50, 1, 0);
INSERT INTO `book_admin_node` VALUES (10, 1, 2, 'Demo/excel', 'Excel一键导出', '', 2, 0, 2, 1, 0);
INSERT INTO `book_admin_node` VALUES (11, 1, 2, 'Demo/download', '下载', '', 2, 0, 3, 1, 0);
INSERT INTO `book_admin_node` VALUES (12, 1, 2, 'Demo/downloadImage', '远程图片下载', '', 2, 0, 4, 1, 0);
INSERT INTO `book_admin_node` VALUES (13, 1, 2, 'Demo/mail', '邮件发送', '', 2, 0, 5, 1, 0);
INSERT INTO `book_admin_node` VALUES (14, 1, 2, 'Demo/qiniu', '七牛上传', '', 2, 0, 6, 1, 0);
INSERT INTO `book_admin_node` VALUES (15, 1, 2, 'Demo/hashids', 'ID加密', '', 2, 0, 7, 1, 0);
INSERT INTO `book_admin_node` VALUES (16, 1, 2, 'Demo/layer', '丰富弹层', '', 2, 0, 8, 1, 0);
INSERT INTO `book_admin_node` VALUES (17, 1, 2, 'Demo/tableFixed', '表格溢出', '', 2, 0, 9, 1, 0);
INSERT INTO `book_admin_node` VALUES (18, 1, 2, 'Demo/ueditor', '百度编辑器', '', 2, 0, 10, 1, 0);
INSERT INTO `book_admin_node` VALUES (19, 1, 2, 'Demo/imageUpload', '图片上传', '', 2, 0, 11, 1, 0);
INSERT INTO `book_admin_node` VALUES (20, 1, 2, 'Demo/qrcode', '二维码生成', '', 2, 0, 12, 1, 0);
INSERT INTO `book_admin_node` VALUES (21, 1, 1, 'NodeMap', '节点图', '', 2, 1, 5, 1, 0);
INSERT INTO `book_admin_node` VALUES (22, 1, 1, 'WebLog', '操作日志', '', 2, 1, 6, 1, 0);
INSERT INTO `book_admin_node` VALUES (23, 1, 1, 'LoginLog', '登录日志', '', 2, 1, 7, 1, 0);
INSERT INTO `book_admin_node` VALUES (59, 1, 2, 'one.two.three.Four/index', '多级节点', '', 2, 0, 50, 1, 0);
INSERT INTO `book_admin_node` VALUES (24, 23, 0, 'index', '首页', '', 3, 0, 50, 1, 0);
INSERT INTO `book_admin_node` VALUES (25, 22, 0, 'index', '列表', '', 3, 0, 50, 1, 0);
INSERT INTO `book_admin_node` VALUES (26, 22, 0, 'detail', '详情', '', 3, 0, 50, 1, 0);
INSERT INTO `book_admin_node` VALUES (27, 21, 0, 'load', '自动导入', '', 3, 0, 50, 1, 0);
INSERT INTO `book_admin_node` VALUES (28, 21, 0, 'index', '首页', '', 3, 0, 50, 1, 0);
INSERT INTO `book_admin_node` VALUES (29, 5, 0, 'add', '添加', '', 3, 0, 51, 1, 0);
INSERT INTO `book_admin_node` VALUES (30, 21, 0, 'edit', '编辑', '', 3, 0, 50, 1, 0);
INSERT INTO `book_admin_node` VALUES (31, 21, 0, 'deleteForever', '永久删除', '', 3, 0, 50, 1, 0);
INSERT INTO `book_admin_node` VALUES (32, 9, 0, 'index', '首页', '', 3, 0, 50, 1, 0);
INSERT INTO `book_admin_node` VALUES (33, 9, 0, 'generate', '生成方法', '', 3, 0, 50, 1, 0);
INSERT INTO `book_admin_node` VALUES (34, 5, 0, 'password', '修改密码', '', 3, 0, 50, 1, 0);
INSERT INTO `book_admin_node` VALUES (35, 5, 0, 'index', '首页', '', 3, 0, 50, 1, 0);
INSERT INTO `book_admin_node` VALUES (36, 5, 0, 'add', '添加', '', 3, 0, 50, 1, 0);
INSERT INTO `book_admin_node` VALUES (37, 5, 0, 'edit', '编辑', '', 3, 0, 50, 1, 0);
INSERT INTO `book_admin_node` VALUES (38, 4, 0, 'user', '用户列表', '', 3, 0, 50, 1, 0);
INSERT INTO `book_admin_node` VALUES (39, 4, 0, 'access', '授权', '', 3, 0, 50, 1, 0);
INSERT INTO `book_admin_node` VALUES (40, 4, 0, 'index', '首页', '', 3, 0, 50, 1, 0);
INSERT INTO `book_admin_node` VALUES (41, 4, 0, 'add', '添加', '', 3, 0, 50, 1, 0);
INSERT INTO `book_admin_node` VALUES (42, 4, 0, 'edit', '编辑', '', 3, 0, 50, 1, 0);
INSERT INTO `book_admin_node` VALUES (43, 4, 0, 'forbid', '默认禁用操作', '', 3, 0, 50, 1, 0);
INSERT INTO `book_admin_node` VALUES (44, 4, 0, 'resume', '默认恢复操作', '', 3, 0, 50, 1, 0);
INSERT INTO `book_admin_node` VALUES (45, 3, 0, 'load', '节点快速导入测试', '', 3, 0, 50, 1, 0);
INSERT INTO `book_admin_node` VALUES (46, 3, 0, 'index', '首页', '', 3, 0, 50, 1, 0);
INSERT INTO `book_admin_node` VALUES (47, 3, 0, 'add', '添加', '', 3, 0, 50, 1, 0);
INSERT INTO `book_admin_node` VALUES (48, 3, 0, 'edit', '编辑', '', 3, 0, 50, 1, 0);
INSERT INTO `book_admin_node` VALUES (49, 3, 0, 'forbid', '默认禁用操作', '', 3, 0, 50, 1, 0);
INSERT INTO `book_admin_node` VALUES (50, 3, 0, 'resume', '默认恢复操作', '', 3, 0, 50, 1, 0);
INSERT INTO `book_admin_node` VALUES (51, 2, 0, 'index', '首页', '', 3, 0, 50, 1, 0);
INSERT INTO `book_admin_node` VALUES (52, 2, 0, 'add', '添加', '', 3, 0, 50, 1, 0);
INSERT INTO `book_admin_node` VALUES (53, 2, 0, 'edit', '编辑', '', 3, 0, 50, 1, 0);
INSERT INTO `book_admin_node` VALUES (54, 2, 0, 'forbid', '默认禁用操作', '', 3, 0, 51, 1, 0);
INSERT INTO `book_admin_node` VALUES (55, 2, 0, 'resume', '默认恢复操作', '', 3, 0, 50, 1, 0);
INSERT INTO `book_admin_node` VALUES (56, 1, 2, 'one', '一级菜单', '', 2, 1, 13, 1, 0);
INSERT INTO `book_admin_node` VALUES (60, 56, 2, 'two', '二级', '', 3, 1, 50, 1, 0);
INSERT INTO `book_admin_node` VALUES (61, 60, 2, 'three', '三级菜单', '', 4, 1, 50, 1, 0);
INSERT INTO `book_admin_node` VALUES (62, 61, 2, 'Four', '四级菜单', '', 5, 1, 50, 1, 0);
INSERT INTO `book_admin_node` VALUES (63, 1, 4, 'Admin/User', '用户管理', '', 2, 1, 1, 1, 0);
INSERT INTO `book_admin_node` VALUES (64, 1, 4, 'Admin/type', '商品分类', '', 2, 1, 2, 1, 0);
INSERT INTO `book_admin_node` VALUES (65, 1, 4, 'Product', '商品列表', '', 2, 1, 1, 1, 0);
INSERT INTO `book_admin_node` VALUES (66, 1, 4, 'order', '订单列表', '', 2, 1, 1, 1, 0);
INSERT INTO `book_admin_node` VALUES (67, 1, 4, 'Focus', '焦点图列表', '', 2, 1, 1, 1, 0);
INSERT INTO `book_admin_node` VALUES (68, 1, 4, 'FeedBack', '反馈信息列表', '', 2, 1, 1, 1, 0);
INSERT INTO `book_admin_node` VALUES (69, 1, 4, 'Recommend', '推荐列表', '', 1, 1, 1, 1, 1);

-- ----------------------------
-- Table structure for book_admin_node_load
-- ----------------------------
DROP TABLE IF EXISTS `book_admin_node_load`;
CREATE TABLE `book_admin_node_load`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `status` tinyint(4) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '节点快速导入' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of book_admin_node_load
-- ----------------------------
INSERT INTO `book_admin_node_load` VALUES (4, '编辑', 'edit', 1);
INSERT INTO `book_admin_node_load` VALUES (5, '添加', 'add', 1);
INSERT INTO `book_admin_node_load` VALUES (6, '首页', 'index', 1);
INSERT INTO `book_admin_node_load` VALUES (7, '删除', 'delete', 1);

-- ----------------------------
-- Table structure for book_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `book_admin_role`;
CREATE TABLE `book_admin_role`  (
  `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` smallint(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父级id',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态',
  `isdelete` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parentId`(`pid`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `isdelete`(`isdelete`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book_admin_role
-- ----------------------------
INSERT INTO `book_admin_role` VALUES (3, 0, '管理员', '管理商品分类，商品信息', 1, 0, 1520219790, 1520219790);

-- ----------------------------
-- Table structure for book_admin_role_user
-- ----------------------------
DROP TABLE IF EXISTS `book_admin_role_user`;
CREATE TABLE `book_admin_role_user`  (
  `role_id` mediumint(9) UNSIGNED NULL DEFAULT NULL,
  `user_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  INDEX `group_id`(`role_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for book_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `book_admin_user`;
CREATE TABLE `book_admin_user`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `account` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `last_login_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `last_login_ip` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `login_count` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mobile` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 50,
  `isdelete` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `accountpassword`(`account`, `password`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book_admin_user
-- ----------------------------
INSERT INTO `book_admin_user` VALUES (1, 'admin', '超级管理员', 'e10adc3949ba59abbe56e057f20f883e', 1525525441, '127.0.0.1', 11, 'admin@admin.com', '13121126169', '我是超级管理员', 1, 0, 1222907803, 1451033528);
INSERT INTO `book_admin_user` VALUES (2, 'demo', '测试', 'e10adc3949ba59abbe56e057f20f883e', 1481206367, '127.0.0.1', 0, '', '', '', 1, 0, 1476777133, 1477399793);

-- ----------------------------
-- Table structure for book_feedback
-- ----------------------------
DROP TABLE IF EXISTS `book_feedback`;
CREATE TABLE `book_feedback`  (
  `fb_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `fb_name` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '称呼',
  `fb_email` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '邮箱',
  `fb_mobile` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '联系方式',
  `fb_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '反馈内容',
  `fb_m_uid` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '用户ID',
  `fb_type` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '渠道 1 小巧玲珑书吧',
  `fb_place` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '位置 1 首页',
  `fb_create_time` int(10) NOT NULL DEFAULT 0 COMMENT '提交时间',
  `fb_status` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '处理状态 0未处理 1已处理',
  `fb_status_content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `fb_status_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '处理时间',
  `fb_admin_uid` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '处理管理员',
  PRIMARY KEY (`fb_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '反馈意见表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of book_feedback
-- ----------------------------
INSERT INTO `book_feedback` VALUES (1, '擦擦擦', 'dd@163.com', '15854512151', 'eee', 0, 1, 1, 1524708997, 0, '', 0, 0);
INSERT INTO `book_feedback` VALUES (2, '11', '1111@163.com', '1345678409', 'dddddd', 11, 1, 1, 1524738183, 0, '', 0, 0);
INSERT INTO `book_feedback` VALUES (3, 'qq', 'qiaoling@163.com', '1345678409', 'wwwww', 0, 1, 1, 1524743117, 1, 'fff', 1524743149, 1);

-- ----------------------------
-- Table structure for book_file
-- ----------------------------
DROP TABLE IF EXISTS `book_file`;
CREATE TABLE `book_file`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cate` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '文件类型，1-image | 2-file',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `original` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '原文件名',
  `domain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '域名',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图片类型 png jpg',
  `size` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `add_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of book_file
-- ----------------------------
INSERT INTO `book_file` VALUES (1, 1, '/tmp/uploads/20180330\\09d69eff6563cc3643723bb9f1f82240.jpg', 'cj.jpg', 'http://admin.lingbook.com', 'image/jpeg', 82823, 1522398743);
INSERT INTO `book_file` VALUES (2, 1, '/tmp/uploads/20180330\\6b46533ea9b4ee9658d188a3298f7298.jpg', '57ecb9f5Nd0edad02.jpg', 'http://admin.lingbook.com', 'image/jpeg', 12722, 1522399183);
INSERT INTO `book_file` VALUES (3, 1, '/tmp/uploads/20180330\\a902f8fbcf061c91075098f89978fc93.jpg', '59cdf6deN491ebd9d.jpg', 'http://admin.lingbook.com', 'image/jpeg', 12020, 1522399391);
INSERT INTO `book_file` VALUES (4, 1, '/tmp/uploads/20180330\\d60acfe2abc999e042f8559deb799a2b.jpg', '59cdf6deN491ebd9d.jpg', 'http://admin.lingbook.com', 'image/jpeg', 12020, 1522399857);
INSERT INTO `book_file` VALUES (5, 1, '/tmp/uploads/20180330\\d22d31e7ab75bd7359174cf4df1203b7.jpg', '5a5c6211Nee2887ea.jpg', 'http://admin.lingbook.com', 'image/jpeg', 21283, 1522399866);
INSERT INTO `book_file` VALUES (6, 1, '/tmp/uploads/20180330\\f75649b0bb1ab5f779595123e6cb38dd.jpg', '599d53b0Nfad65b53.jpg', 'http://admin.lingbook.com', 'image/jpeg', 29723, 1522399904);
INSERT INTO `book_file` VALUES (7, 1, '/tmp/uploads/20180330\\5645e363df9f8c8cf7e455eb4308a51e.jpg', '585b6017N1ffed46c.jpg', 'http://admin.lingbook.com', 'image/jpeg', 25004, 1522399946);
INSERT INTO `book_file` VALUES (8, 1, '/tmp/uploads/20180420\\12f07a894112711c9cfe6f1df3941316.jpg', '4.26.jpg', 'http://admin.lingbook.com', 'image/jpeg', 75231, 1524210887);
INSERT INTO `book_file` VALUES (9, 1, '/tmp/uploads/20180424\\2048cb0286bc1ee3ed97dc4192dee220.jpg', '我在未来等你.jpg', 'http://admin.lingbook.com', 'image/jpeg', 19391, 1524538349);
INSERT INTO `book_file` VALUES (10, 1, '/tmp/uploads/20180424\\1c1249145d4ea71545b36946f288e3db.jpg', '挪威的森林.jpg', 'http://admin.lingbook.com', 'image/jpeg', 16430, 1524538513);
INSERT INTO `book_file` VALUES (11, 1, '/tmp/uploads/20180424\\8a4a852f924c8c69f02b2ac6577716c1.jpg', '区块链.jpg', 'http://admin.lingbook.com', 'image/jpeg', 34641, 1524538815);
INSERT INTO `book_file` VALUES (12, 1, '/tmp/uploads/20180424\\675d99a3d83b1c2ee92cf4cc7b27f6a5.jpg', '小王子.jpg', 'http://admin.lingbook.com', 'image/jpeg', 54376, 1524539344);
INSERT INTO `book_file` VALUES (13, 1, '/tmp/uploads/20180424\\cbaf469aba6dda6e404eff8a24f5a912.jpg', '梦的精灵.jpg', 'http://admin.lingbook.com', 'image/jpeg', 51159, 1524539616);
INSERT INTO `book_file` VALUES (14, 1, '/tmp/uploads/20180424\\97ecb7e065dc1d2e2cc3a8cf066b3cc3.jpg', '未来简史.jpg', 'http://admin.lingbook.com', 'image/jpeg', 32088, 1524539869);
INSERT INTO `book_file` VALUES (15, 1, '/tmp/uploads/20180424\\e86194eccab3daa600f90e18bfd78a09.jpg', '荒野求生.jpg', 'http://admin.lingbook.com', 'image/jpeg', 26409, 1524540260);
INSERT INTO `book_file` VALUES (16, 1, '/tmp/uploads/20180424\\0e7667b15fbb7c6c162d2f02aecd36a1.jpg', '马刺王朝(全彩珍藏版).jpg', 'http://admin.lingbook.com', 'image/jpeg', 36248, 1524540506);
INSERT INTO `book_file` VALUES (17, 1, '/tmp/uploads/20180424\\58adc347274df9577cc55a07d5549f9a.jpg', '大事细节全知道,孕前·孕期·产后呵护指南.jpg', 'http://admin.lingbook.com', 'image/jpeg', 48732, 1524541320);
INSERT INTO `book_file` VALUES (18, 1, '/tmp/uploads/20180424\\74b5aeff31f54875de62fa8b7856ae73.jpg', 'hellospring.jpg', 'http://admin.lingbook.com', 'image/jpeg', 87434, 1524541476);
INSERT INTO `book_file` VALUES (19, 1, '/tmp/uploads/20180424\\bfac718a3d5adf3755bf925d5998dc0c.jpg', '04.23.jpg', 'http://admin.lingbook.com', 'image/jpeg', 81514, 1524541576);
INSERT INTO `book_file` VALUES (20, 1, '/tmp/uploads/20180424\\89c9f79cf33496c5b66cf470994b12d2.jpg', '4.23.jpg', 'http://admin.lingbook.com', 'image/jpeg', 85613, 1524541639);

-- ----------------------------
-- Table structure for book_file_copy1
-- ----------------------------
DROP TABLE IF EXISTS `book_file_copy1`;
CREATE TABLE `book_file_copy1`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `subject` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件类型，1-image | 2-file',
  `score` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of book_file_copy1
-- ----------------------------
INSERT INTO `book_file_copy1` VALUES (1, '小孟', '数学', 8);
INSERT INTO `book_file_copy1` VALUES (2, '小孟', '英语', 10);
INSERT INTO `book_file_copy1` VALUES (3, '小孟', '语文', 50);
INSERT INTO `book_file_copy1` VALUES (4, '小李', '语文', 60);
INSERT INTO `book_file_copy1` VALUES (21, '小李', '数学', 10);

-- ----------------------------
-- Table structure for book_focus
-- ----------------------------
DROP TABLE IF EXISTS `book_focus`;
CREATE TABLE `book_focus`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `ad_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '广告名称',
  `ad_img_key` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '图片id',
  `ad_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '广告链接地址url',
  `ad_start_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '开始时间',
  `ad_end_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '结束时间',
  `ad_channel` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '应用渠道：1书吧',
  `ad_type` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '区域:1.首页banner 后续补充',
  `ad_place` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '位置: 1 2 3 4 来标识所在位置',
  `ad_details` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '详情',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '更改时间',
  `admin_uid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
  `isdelete` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除 1删除 0未删除',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1启用  0禁用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of book_focus
-- ----------------------------
INSERT INTO `book_focus` VALUES (1, '4月1日愚人节活动', 1, 'http://www.lingbook.com', 1526632521, 1530261321, 1, 1, 1, '', 1522398936, 1522398936, 0, 0, 1);
INSERT INTO `book_focus` VALUES (2, '423活动', 8, 'http://www.lingbook.com/', 1524210904, 1529567706, 1, 1, 1, '', 1524210929, 1524210929, 0, 0, 1);
INSERT INTO `book_focus` VALUES (3, '423', 18, 'http://www.lingbook.com', 1524541488, 1528515891, 1, 1, 1, '', 1524541499, 1524541499, 0, 0, 1);
INSERT INTO `book_focus` VALUES (4, '423', 19, 'http://www.lingbook.com', 1524627989, 1526096789, 1, 1, 1, '', 1524541600, 1524541600, 0, 0, 1);
INSERT INTO `book_focus` VALUES (5, '423', 20, 'http://www.lingbook.com', 1524541642, 1526096845, 1, 1, 1, '', 1524541653, 1524541653, 0, 0, 1);

-- ----------------------------
-- Table structure for book_login_log
-- ----------------------------
DROP TABLE IF EXISTS `book_login_log`;
CREATE TABLE `book_login_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `login_ip` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `login_browser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `login_os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of book_login_log
-- ----------------------------
INSERT INTO `book_login_log` VALUES (1, 1, '127.0.0.1', '本机地址 本机地址  ', 'Chrome(63.0.3239.108)', 'Windows 10', '2018-02-23 10:59:31');
INSERT INTO `book_login_log` VALUES (2, 1, '127.0.0.1', '本机地址 本机地址  ', 'Chrome(63.0.3239.108)', 'Windows 10', '2018-02-24 13:43:38');
INSERT INTO `book_login_log` VALUES (3, 1, '127.0.0.1', '本机地址 本机地址  ', 'Chrome(63.0.3239.108)', 'Windows 10', '2018-03-05 09:58:24');
INSERT INTO `book_login_log` VALUES (4, 1, '127.0.0.1', '本机地址 本机地址  ', 'Chrome(63.0.3239.108)', 'Windows 10', '2018-03-26 14:41:31');
INSERT INTO `book_login_log` VALUES (5, 1, '127.0.0.1', '本机地址 本机地址  ', 'Chrome(63.0.3239.108)', 'Windows 10', '2018-03-27 10:48:02');
INSERT INTO `book_login_log` VALUES (6, 1, '127.0.0.1', '本机地址 本机地址  ', 'Firefox(59.0)', 'Windows 10', '2018-03-28 16:12:37');
INSERT INTO `book_login_log` VALUES (7, 1, '127.0.0.1', '本机地址 本机地址  ', 'Chrome(63.0.3239.108)', 'Windows 10', '2018-03-30 16:09:43');
INSERT INTO `book_login_log` VALUES (8, 1, '127.0.0.1', '本机地址 本机地址  ', 'Chrome(63.0.3239.108)', 'Windows 10', '2018-04-08 10:47:00');
INSERT INTO `book_login_log` VALUES (9, 1, '127.0.0.1', '本机地址 本机地址  ', 'Chrome(63.0.3239.108)', 'Windows 10', '2018-04-19 16:10:04');
INSERT INTO `book_login_log` VALUES (10, 1, '127.0.0.1', '本机地址 本机地址  ', 'Chrome(60.0.3112.101)', 'Windows 7', '2018-04-26 18:23:19');
INSERT INTO `book_login_log` VALUES (11, 1, '127.0.0.1', '本机地址 本机地址  ', 'Chrome(60.0.3112.101)', 'Windows 7', '2018-04-26 19:32:37');
INSERT INTO `book_login_log` VALUES (12, 1, '127.0.0.1', '本机地址 本机地址  ', 'Firefox(58.0)', 'Windows 7', '2018-05-04 23:59:46');
INSERT INTO `book_login_log` VALUES (13, 1, '127.0.0.1', '本机地址 本机地址  ', 'Firefox(58.0)', 'Windows 7', '2018-05-05 21:04:01');

-- ----------------------------
-- Table structure for book_node_map
-- ----------------------------
DROP TABLE IF EXISTS `book_node_map`;
CREATE TABLE `book_node_map`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `module` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模块',
  `controller` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '控制器',
  `action` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '方法',
  `method` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '请求方式',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '节点图描述',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `map`(`method`, `module`, `controller`, `action`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 82 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '节点图' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of book_node_map
-- ----------------------------
INSERT INTO `book_node_map` VALUES (1, 'admin', 'AdminGroup', 'index', 'ALL', 'AdminGroup 首页');
INSERT INTO `book_node_map` VALUES (2, 'admin', 'AdminGroup', 'recycleBin', 'ALL', 'AdminGroup 回收站');
INSERT INTO `book_node_map` VALUES (3, 'admin', 'AdminGroup', 'add', 'ALL', 'AdminGroup 添加');
INSERT INTO `book_node_map` VALUES (4, 'admin', 'AdminGroup', 'edit', 'ALL', 'AdminGroup 编辑');
INSERT INTO `book_node_map` VALUES (5, 'admin', 'AdminGroup', 'delete', 'ALL', 'AdminGroup 默认删除操作');
INSERT INTO `book_node_map` VALUES (6, 'admin', 'AdminGroup', 'recycle', 'ALL', 'AdminGroup 从回收站恢复');
INSERT INTO `book_node_map` VALUES (7, 'admin', 'AdminGroup', 'forbid', 'ALL', 'AdminGroup 默认禁用操作');
INSERT INTO `book_node_map` VALUES (8, 'admin', 'AdminGroup', 'resume', 'ALL', 'AdminGroup 默认恢复操作');
INSERT INTO `book_node_map` VALUES (9, 'admin', 'AdminGroup', 'deleteForever', 'ALL', 'AdminGroup 永久删除');
INSERT INTO `book_node_map` VALUES (10, 'admin', 'AdminGroup', 'clear', 'ALL', 'AdminGroup 清空回收站');
INSERT INTO `book_node_map` VALUES (11, 'admin', 'AdminGroup', 'saveOrder', 'ALL', 'AdminGroup 保存排序');
INSERT INTO `book_node_map` VALUES (16, 'admin', 'AdminNode', 'index', 'ALL', 'AdminNode 首页');
INSERT INTO `book_node_map` VALUES (17, 'admin', 'AdminNode', 'recycleBin', 'ALL', 'AdminNode 回收站');
INSERT INTO `book_node_map` VALUES (18, 'admin', 'AdminNode', 'sort', 'ALL', 'AdminNode 保存排序');
INSERT INTO `book_node_map` VALUES (19, 'admin', 'AdminNode', 'load', 'ALL', 'AdminNode 节点快速导入');
INSERT INTO `book_node_map` VALUES (20, 'admin', 'AdminNode', 'indexOld', 'ALL', 'AdminNode 首页');
INSERT INTO `book_node_map` VALUES (21, 'admin', 'AdminNode', 'add', 'ALL', 'AdminNode 添加');
INSERT INTO `book_node_map` VALUES (22, 'admin', 'AdminNode', 'edit', 'ALL', 'AdminNode 编辑');
INSERT INTO `book_node_map` VALUES (23, 'admin', 'AdminNode', 'delete', 'ALL', 'AdminNode 默认删除操作');
INSERT INTO `book_node_map` VALUES (24, 'admin', 'AdminNode', 'recycle', 'ALL', 'AdminNode 从回收站恢复');
INSERT INTO `book_node_map` VALUES (25, 'admin', 'AdminNode', 'forbid', 'ALL', 'AdminNode 默认禁用操作');
INSERT INTO `book_node_map` VALUES (26, 'admin', 'AdminNode', 'resume', 'ALL', 'AdminNode 默认恢复操作');
INSERT INTO `book_node_map` VALUES (27, 'admin', 'AdminNode', 'deleteForever', 'ALL', 'AdminNode 永久删除');
INSERT INTO `book_node_map` VALUES (28, 'admin', 'AdminNode', 'clear', 'ALL', 'AdminNode 清空回收站');
INSERT INTO `book_node_map` VALUES (29, 'admin', 'AdminNode', 'saveOrder', 'ALL', 'AdminNode 保存排序');
INSERT INTO `book_node_map` VALUES (31, 'admin', 'AdminNodeLoad', 'index', 'ALL', 'AdminNodeLoad 首页');
INSERT INTO `book_node_map` VALUES (32, 'admin', 'AdminNodeLoad', 'recycleBin', 'ALL', 'AdminNodeLoad 回收站');
INSERT INTO `book_node_map` VALUES (33, 'admin', 'AdminNodeLoad', 'add', 'ALL', 'AdminNodeLoad 添加');
INSERT INTO `book_node_map` VALUES (34, 'admin', 'AdminNodeLoad', 'edit', 'ALL', 'AdminNodeLoad 编辑');
INSERT INTO `book_node_map` VALUES (35, 'admin', 'AdminNodeLoad', 'forbid', 'ALL', 'AdminNodeLoad 默认禁用操作');
INSERT INTO `book_node_map` VALUES (36, 'admin', 'AdminNodeLoad', 'resume', 'ALL', 'AdminNodeLoad 默认恢复操作');
INSERT INTO `book_node_map` VALUES (37, 'admin', 'AdminNodeLoad', 'deleteForever', 'ALL', 'AdminNodeLoad 永久删除');
INSERT INTO `book_node_map` VALUES (38, 'admin', 'AdminNodeLoad', 'clear', 'ALL', 'AdminNodeLoad 清空回收站');
INSERT INTO `book_node_map` VALUES (39, 'admin', 'AdminNodeLoad', 'saveOrder', 'ALL', 'AdminNodeLoad 保存排序');
INSERT INTO `book_node_map` VALUES (46, 'admin', 'AdminRole', 'user', 'ALL', 'AdminRole 用户列表');
INSERT INTO `book_node_map` VALUES (47, 'admin', 'AdminRole', 'access', 'ALL', 'AdminRole 授权');
INSERT INTO `book_node_map` VALUES (48, 'admin', 'AdminRole', 'index', 'ALL', 'AdminRole 首页');
INSERT INTO `book_node_map` VALUES (49, 'admin', 'AdminRole', 'recycleBin', 'ALL', 'AdminRole 回收站');
INSERT INTO `book_node_map` VALUES (50, 'admin', 'AdminRole', 'add', 'ALL', 'AdminRole 添加');
INSERT INTO `book_node_map` VALUES (51, 'admin', 'AdminRole', 'edit', 'ALL', 'AdminRole 编辑');
INSERT INTO `book_node_map` VALUES (52, 'admin', 'AdminRole', 'delete', 'ALL', 'AdminRole 默认删除操作');
INSERT INTO `book_node_map` VALUES (53, 'admin', 'AdminRole', 'recycle', 'ALL', 'AdminRole 从回收站恢复');
INSERT INTO `book_node_map` VALUES (54, 'admin', 'AdminRole', 'forbid', 'ALL', 'AdminRole 默认禁用操作');
INSERT INTO `book_node_map` VALUES (55, 'admin', 'AdminRole', 'resume', 'ALL', 'AdminRole 默认恢复操作');
INSERT INTO `book_node_map` VALUES (56, 'admin', 'AdminRole', 'deleteForever', 'ALL', 'AdminRole 永久删除');
INSERT INTO `book_node_map` VALUES (57, 'admin', 'AdminRole', 'clear', 'ALL', 'AdminRole 清空回收站');
INSERT INTO `book_node_map` VALUES (58, 'admin', 'AdminRole', 'saveOrder', 'ALL', 'AdminRole 保存排序');
INSERT INTO `book_node_map` VALUES (61, 'admin', 'AdminUser', 'password', 'ALL', 'AdminUser 修改密码');
INSERT INTO `book_node_map` VALUES (62, 'admin', 'AdminUser', 'index', 'ALL', 'AdminUser 首页');
INSERT INTO `book_node_map` VALUES (63, 'admin', 'AdminUser', 'recycleBin', 'ALL', 'AdminUser 回收站');
INSERT INTO `book_node_map` VALUES (64, 'admin', 'AdminUser', 'add', 'ALL', 'AdminUser 添加');
INSERT INTO `book_node_map` VALUES (65, 'admin', 'AdminUser', 'edit', 'ALL', 'AdminUser 编辑');
INSERT INTO `book_node_map` VALUES (66, 'admin', 'AdminUser', 'delete', 'ALL', 'AdminUser 默认删除操作');
INSERT INTO `book_node_map` VALUES (67, 'admin', 'AdminUser', 'recycle', 'ALL', 'AdminUser 从回收站恢复');
INSERT INTO `book_node_map` VALUES (68, 'admin', 'AdminUser', 'forbid', 'ALL', 'AdminUser 默认禁用操作');
INSERT INTO `book_node_map` VALUES (69, 'admin', 'AdminUser', 'resume', 'ALL', 'AdminUser 默认恢复操作');
INSERT INTO `book_node_map` VALUES (70, 'admin', 'AdminUser', 'deleteForever', 'ALL', 'AdminUser 永久删除');
INSERT INTO `book_node_map` VALUES (71, 'admin', 'AdminUser', 'clear', 'ALL', 'AdminUser 清空回收站');
INSERT INTO `book_node_map` VALUES (72, 'admin', 'AdminUser', 'saveOrder', 'ALL', 'AdminUser 保存排序');
INSERT INTO `book_node_map` VALUES (76, 'admin', 'Demo', 'excel', 'ALL', 'Demo Excel一键导出');
INSERT INTO `book_node_map` VALUES (77, 'admin', 'Demo', 'download', 'ALL', 'Demo 下载文件');
INSERT INTO `book_node_map` VALUES (78, 'admin', 'Demo', 'downloadImage', 'ALL', 'Demo 下载远程图片');
INSERT INTO `book_node_map` VALUES (79, 'admin', 'Demo', 'mail', 'ALL', 'Demo 发送邮件');
INSERT INTO `book_node_map` VALUES (80, 'admin', 'Demo', 'ueditor', 'ALL', 'Demo 百度编辑器');
INSERT INTO `book_node_map` VALUES (81, 'admin', 'Demo', 'qiniu', 'ALL', 'Demo 七牛上传');

-- ----------------------------
-- Table structure for book_one_two_three_four
-- ----------------------------
DROP TABLE IF EXISTS `book_one_two_three_four`;
CREATE TABLE `book_one_two_three_four`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '四级控制器主键',
  `field1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段一',
  `option` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选填',
  `select` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下拉框',
  `radio` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单选',
  `checkbox` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '复选框',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `textarea` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文本域',
  `date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日期',
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `sort` smallint(5) NULL DEFAULT 50 COMMENT '排序',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态，1-正常 | 0-禁用',
  `isdelete` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除状态，1-删除 | 0-正常',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sort`(`sort`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '四级控制器' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of book_one_two_three_four
-- ----------------------------
INSERT INTO `book_one_two_three_four` VALUES (1, 'yuan1994', 'tpadmin', '2', '1', NULL, '2222', 'https://github.com/yuan1994/tpadmin', '2016-12-07', '13012345678', 'tianpian0805@gmail.com', 50, 1, 0, 1481947278, 1481947353);

-- ----------------------------
-- Table structure for book_order
-- ----------------------------
DROP TABLE IF EXISTS `book_order`;
CREATE TABLE `book_order`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单号',
  `uid` int(11) NOT NULL DEFAULT 0 COMMENT '用户ID',
  `pay_price` double(20, 2) NOT NULL DEFAULT 0.00 COMMENT '商品价格',
  `consignee` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '收货人',
  `consignee_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '收货地址',
  `consignee_phone` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人电话',
  `is_pay` tinyint(1) NOT NULL DEFAULT 1 COMMENT '订单状态 1未支付 2已支付 3申请退款 4已退款 5失效 6 已完成 ',
  `pay_time` int(1) NOT NULL DEFAULT 0 COMMENT '支付时间',
  `pay_channels` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '支付渠道 1支付宝 2微信 3网银',
  `pay_account` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '支付账号',
  `shroff_account` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '收款账号',
  `is_ship` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否已经发货 0 未发货 1 已发货',
  `ship_time` int(10) NOT NULL DEFAULT 0 COMMENT '发货时间',
  `is_receipt` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否已经收货 0 未收货 1 已收货 3 已退货',
  `receipt_time` int(10) NOT NULL DEFAULT 0 COMMENT '收货时间',
  `ship_nmber` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '快递单号',
  `desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '订单备注',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '记录状态 1正常 0 禁用 -1删除',
  `create_time` int(10) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) NOT NULL DEFAULT 0 COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for book_order_product
-- ----------------------------
DROP TABLE IF EXISTS `book_order_product`;
CREATE TABLE `book_order_product`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '订单号',
  `product_id` int(10) NOT NULL DEFAULT 0 COMMENT '商品ID',
  `product_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '商品名称',
  `product_type` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '商品类型',
  `product_num` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '商品数量',
  `product_price` double(20, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '商品价格',
  `status` tinyint(4) UNSIGNED NOT NULL DEFAULT 1 COMMENT '记录状态 1正常 0 禁用 -1删除',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单与商品的关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for book_product
-- ----------------------------
DROP TABLE IF EXISTS `book_product`;
CREATE TABLE `book_product`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品名称',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '外文书名',
  `price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '商品价格',
  `sale_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠价格',
  `type` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '商品分类',
  `img` int(10) NULL DEFAULT NULL COMMENT '图片id',
  `press` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '出版社',
  `author` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '作者',
  `page` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '页数',
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '描述',
  `inventory` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '库存',
  `soldnum` int(10) NULL DEFAULT NULL COMMENT '售出量',
  `real_soldnum` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '真实售出量',
  `clicknum` int(10) NULL DEFAULT 0 COMMENT '浏览量',
  `real_clicknum` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '真实浏览量',
  `is_top` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否推荐 1独家 2主编推荐 3 读者推荐',
  `status` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '状态0屏蔽  1 正常 ',
  `uid` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '管理员ID',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  `isdelete` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '0 正常 1删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book_product
-- ----------------------------
INSERT INTO `book_product` VALUES (1, '东野圭吾：圣女的救济', '', 10.00, 0.00, 4, 7, '南海出版公司; 第1版 (2017年1月1日)', '东野圭吾', 312, '', 100, 100, 0, 10, 0, 3, 1, 1, 1522049000, 1522399947, 0);
INSERT INTO `book_product` VALUES (2, '东野圭吾：放学后（2017精装典藏版）', '', 18.00, 2.00, 1, 6, '南海出版公司; 第2版 (2013年9月1日)', '东野圭吾', 227, '11111', 3, 4, 0, 5, 0, 1, 1, 1, 1522049000, 1522399909, 0);
INSERT INTO `book_product` VALUES (3, '东野圭吾：黎明之街', '', 23.50, 20.80, 2, 5, '南海出版公司; 第3版 (2018年2月1日)', '东野圭吾', 280, '发发发', 100, 80, 0, 50, 0, 2, 1, 1, 1522049000, 1522399870, 0);
INSERT INTO `book_product` VALUES (4, '东野圭吾：秘密（无删节精装典藏版）', '', 26.80, 0.00, 2, 3, '南海出版公司; 第1版 (2017年11月1日)', '东野圭吾', 336, '东野圭吾', 88, 10, 0, 10, 0, 2, 1, 1, 1522119859, 1522399828, 0);
INSERT INTO `book_product` VALUES (5, '恶意（2016版)', '', 18.60, 1.00, 2, 2, '南海出版公司; 第3版 (2016年11月1日)', '东野圭吾', 268, '11', 11, 0, 0, 0, 0, 1, 1, 1, 1522137283, 1523243133, 0);
INSERT INTO `book_product` VALUES (6, '东野圭吾：圣女的救济', '', 10.00, 0.00, 4, 7, '南海出版公司; 第1版 (2017年1月1日)', '东野圭吾', 312, '', 100, 100, 0, 10, 0, 3, 1, 1, 1522049000, 1522399947, 0);
INSERT INTO `book_product` VALUES (7, '东野圭吾：放学后（2017精装典藏版）', '', 18.00, 2.00, 1, 6, '南海出版公司; 第2版 (2013年9月1日)', '东野圭吾', 227, '11111', 3, 4, 0, 5, 0, 1, 1, 1, 1522049000, 1522399909, 0);
INSERT INTO `book_product` VALUES (8, '东野圭吾：黎明之街', '', 23.50, 20.80, 2, 5, '南海出版公司; 第3版 (2018年2月1日)', '东野圭吾', 280, '发发发', 100, 80, 0, 50, 0, 2, 1, 1, 1522049000, 1522399870, 0);
INSERT INTO `book_product` VALUES (9, ' 东野圭吾：秘密（无删节精装典藏版）', '', 26.80, 0.00, 2, 3, '南海出版公司; 第1版 (2017年11月1日)', '东野圭吾', 336, '东野圭吾', 88, 10, 0, 10, 0, 2, 1, 1, 1522119859, 1522399828, 0);
INSERT INTO `book_product` VALUES (10, '恶意（2016版)', '', 18.60, 1.00, 2, 2, '南海出版公司; 第3版 (2016年11月1日)', '东野圭吾', 268, '11', 11, 0, 0, 0, 0, 1, 1, 1, 1522137283, 1523243133, 0);
INSERT INTO `book_product` VALUES (11, '我在未来等你', '', 33.40, 0.00, 1, 9, '北京联合出版有限公司', '刘同', 289, '', 100, 0, 0, 0, 0, 6, 1, 1, 1524538398, 1524538398, 0);
INSERT INTO `book_product` VALUES (12, '挪威的森林', '', 23.80, 0.00, 1, 10, '上海译文出版社', '村上春树', 198, '', 88, 0, 0, 0, 0, 2, 1, 1, 1524538578, 1524538578, 0);
INSERT INTO `book_product` VALUES (13, '图说区块链:神一样的金融科技与未来社会', '', 40.12, 0.00, 4, 11, '中信出版社; 第1版 (2017年7月1日)', '徐明星', 301, '内容简介：区块链，如瑞士仪表般精密，如互联网般惊世骇俗，它在以神一般的节奏颠覆社会。\r\n当新兴技术来临时，你可以选择规避&mdash;&mdash;如果明天也可以规避的话。区块链也一样。\r\n', 145, 0, 0, 0, 0, 6, 1, 1, 1524538933, 1524539418, 0);
INSERT INTO `book_product` VALUES (14, '小王子(法国政府勋章诗人译本&bull;未删减全新珍藏版)', '', 30.66, 0.00, 5, 12, '浙江文艺出版社; 第1版 (2017年2月1日)', '安托万&middot;德&middot;圣-埃克苏佩里', 134, '《小王子》是一本足以让您永葆童心的不朽经典：遥远星球上的小王子，与美丽而骄傲的玫瑰吵架负气出走，在各星球漫游中，小王子遇到了傲慢的国王，一个任性的酒鬼，', 122, 0, 0, 0, 0, 6, 1, 1, 1524539368, 1524539368, 0);
INSERT INTO `book_product` VALUES (15, '晚安，梦的精灵', '', 37.40, 0.00, 5, 13, '北京联合出版公司; 第1版 (2018年4月1日)', '艾米丽&middot;马丁', 85, '每当夜幕降临，闭上双眼，梦的精灵就会载你去往神奇的梦乡：天空海底，森林空谷，奇妙的演出&hellip;&hellip;小朋友，你准备好了吗？艾米丽&middot;马丁将奇思妙想融入甜美押韵的诗句，用细腻温柔的笔触勾画出孩子安眠的场景。', 165, 0, 0, 0, 0, 6, 1, 1, 1524539702, 1524539702, 0);
INSERT INTO `book_product` VALUES (16, '未来简史 ', '', 46.24, 0.00, 3, 14, '中信出版社; 第1版 (2017年2月1日)', '尤瓦尔&bull;赫拉利', 416, '《未来简史:从智人到智神》进入21世纪后，曾经长期威胁人类生存、发展的瘟疫、饥荒和战争已经被攻克，智人面临着新的待办议题：永生不老、幸福快乐和成为具有&ldquo;神性&rdquo;的人类。在解决这些新问题的过程中。。。', 154, 0, 0, 0, 0, 3, 1, 1, 1524539931, 1524539931, 0);
INSERT INTO `book_product` VALUES (17, '荒野求生手册', '', 34.20, 0.00, 6, 15, '北京联合出版公司; 第3版 (2017年10月1日)', '贝尔&middot;格里尔斯', 303, '《荒野求生手册（新版）》内容简介：他曾是英国皇家特种部队成员，获得&ldquo;英国皇家海军少校&rdquo;名誉头衔。\r\n他21岁执行跳伞任务时身受重伤，却在23岁征服珠峰，创下世界纪录。', 88, 0, 0, 0, 0, 1, 1, 1, 1524540331, 1524540331, 0);
INSERT INTO `book_product` VALUES (18, '马刺王朝(全彩珍藏版)', '', 52.20, 0.00, 6, 16, '机械工业出版社; 第1版 (2017年1月1日)', '段旭', 316, '1997年的盛夏，在纽约举行的选秀大会上，蒂姆?邓肯在首轮第一位被波波维奇慧眼识珠选中，随即与&ldquo;海军上将&rdquo;大卫?罗宾逊组成双塔，并在职业生涯第二个赛季就获得了总冠军和FMVP，开启了马刺王朝的序幕', 125, 0, 0, 0, 0, 6, 1, 1, 1524540554, 1525449648, 0);
INSERT INTO `book_product` VALUES (19, '翻翻书,做好准爸爸样样行:大事细节全知道,孕前&middot;孕期&middot;产后呵护指南', '', 20.60, 0.00, 7, 17, '中国人口出版社; 第1版 (2016年1月1日)', '王艳琴', 212, '《翻翻书，做好准爸爸样样行》由多位专家编写，汇集了众多孕产夫妇的经验，是一本难得的准爸爸怀孕指导书。包括：孕前准备、孕期护理、产后母婴护理三部分。孕前：介绍如何在物质、生理、心理和物质生活条件等准备。', 120, 0, 0, 0, 0, 1, 0, 1, 1524541373, 1524541373, 1);

-- ----------------------------
-- Table structure for book_recommend
-- ----------------------------
DROP TABLE IF EXISTS `book_recommend`;
CREATE TABLE `book_recommend`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '推荐ID',
  `title` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '推荐名称',
  `status` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '状态 0 正常 1删除',
  `sort` tinyint(10) UNSIGNED NULL DEFAULT 0 COMMENT '排序',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `uid` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '管理员ID',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '推荐模块' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of book_recommend
-- ----------------------------
INSERT INTO `book_recommend` VALUES (1, '热门', 1, 1, '', 0, 0, 0);
INSERT INTO `book_recommend` VALUES (2, '最新', 1, 1, '', 0, 0, 0);
INSERT INTO `book_recommend` VALUES (3, '主编推荐', 1, 1, '', 0, 0, 0);
INSERT INTO `book_recommend` VALUES (4, '销量', 1, 2, '', 0, 0, 0);
INSERT INTO `book_recommend` VALUES (5, '小编推荐', 1, 1, '', 0, 0, 0);
INSERT INTO `book_recommend` VALUES (6, '独家特供', 1, 1, '', 1, 1522398484, 1522398484);

-- ----------------------------
-- Table structure for book_shopcar
-- ----------------------------
DROP TABLE IF EXISTS `book_shopcar`;
CREATE TABLE `book_shopcar`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT 0 COMMENT '用户ID 关联user表id',
  `pro_id` int(11) NOT NULL DEFAULT 0 COMMENT '商品ID 关联product',
  `num` int(10) NOT NULL DEFAULT 0 COMMENT '商品数量',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 正常 0 删除',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '购物车' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for book_type
-- ----------------------------
DROP TABLE IF EXISTS `book_type`;
CREATE TABLE `book_type`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品分类ID',
  `title` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '分类名称',
  `status` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '状态 0 删除 1 正常',
  `sort` tinyint(10) UNSIGNED NULL DEFAULT 0 COMMENT '排序',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `uid` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '管理员ID',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品分类' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of book_type
-- ----------------------------
INSERT INTO `book_type` VALUES (1, '文学', 1, 1, '文学类型-浮生六记', 1, 1520220576, 0);
INSERT INTO `book_type` VALUES (2, '小说', 1, 1, '小说-东野圭吾，阿加莎，小王子', 1, 1520220576, 0);
INSERT INTO `book_type` VALUES (3, '历史', 1, 1, '历史-未来简史', 1, 1520220576, 0);
INSERT INTO `book_type` VALUES (4, '科幻', 1, 1, '科幻', 1, 1520220576, 0);
INSERT INTO `book_type` VALUES (5, '儿童', 1, 1, '儿童', 1, 1520220576, 0);
INSERT INTO `book_type` VALUES (6, '生活', 1, 1, '生活', 1, 1520220576, 0);
INSERT INTO `book_type` VALUES (7, '育儿', 1, 1, '育儿', 1, 1520220576, 0);

-- ----------------------------
-- Table structure for book_user
-- ----------------------------
DROP TABLE IF EXISTS `book_user`;
CREATE TABLE `book_user`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '真实姓名',
  `mobile` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户手机',
  `email` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户邮箱',
  `sex` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '性别',
  `img` int(5) NOT NULL DEFAULT 0 COMMENT '头像 ',
  `authKey` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '认证码',
  `accessToken` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'token',
  `status` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '0正常 1禁用',
  `reg_ip` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '注册IP',
  `reg_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '注册时间',
  `last_login_ip` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '最后登录IP',
  `login` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '登录次数',
  `last_login_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后登录时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of book_user
-- ----------------------------
INSERT INTO `book_user` VALUES (1, 'qiaoling', 'f8e39c15556b5768acd95c4244c3ab4c', '巧玲', '13712012000', 'qiaoling@163.com', 0, 0, '1371ling0', '8454e2c1f7952fb3635dde815a33b7b5', 0, '127.0.0.1', 1524651666, '127.0.0.1', 1, 1524651666);

-- ----------------------------
-- Table structure for book_web_log_001
-- ----------------------------
DROP TABLE IF EXISTS `book_web_log_001`;
CREATE TABLE `book_web_log_001`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `uid` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  `ip` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '访客ip',
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '访客地址',
  `os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作系统',
  `browser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '浏览器',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'url',
  `module` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模块',
  `controller` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '控制器',
  `action` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '方法',
  `method` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '请求方式',
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '请求的param数据，serialize后的',
  `create_at` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `ip`(`ip`) USING BTREE,
  INDEX `create_at`(`create_at`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 71 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '网站日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book_web_log_001
-- ----------------------------
INSERT INTO `book_web_log_001` VALUES (1, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1524738193);
INSERT INTO `book_web_log_001` VALUES (2, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1524738194);
INSERT INTO `book_web_log_001` VALUES (3, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:3:{s:7:\"account\";s:5:\"admin\";s:8:\"password\";s:6:\"123456\";s:7:\"captcha\";s:4:\"nhds\";}', 1524738199);
INSERT INTO `book_web_log_001` VALUES (4, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1524738199);
INSERT INTO `book_web_log_001` VALUES (5, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1524738200);
INSERT INTO `book_web_log_001` VALUES (6, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1524738202);
INSERT INTO `book_web_log_001` VALUES (7, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/admin/focus/index.html', 'admin', 'Focus', 'index', 'GET', 'a:0:{}', 1524738204);
INSERT INTO `book_web_log_001` VALUES (8, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/admin/feed_back/index.html', 'admin', 'FeedBack', 'index', 'GET', 'a:0:{}', 1524738205);
INSERT INTO `book_web_log_001` VALUES (9, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/admin/recommend/index.html', 'admin', 'Recommend', 'index', 'GET', 'a:0:{}', 1524738208);
INSERT INTO `book_web_log_001` VALUES (10, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1524738210);
INSERT INTO `book_web_log_001` VALUES (11, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1524738210);
INSERT INTO `book_web_log_001` VALUES (12, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/Admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', 1524738340);
INSERT INTO `book_web_log_001` VALUES (13, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/Admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', 1524738461);
INSERT INTO `book_web_log_001` VALUES (14, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/Admin/user/view?id=1', 'admin', 'User', 'view', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', 1524738475);
INSERT INTO `book_web_log_001` VALUES (15, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1524742340);
INSERT INTO `book_web_log_001` VALUES (16, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1524742341);
INSERT INTO `book_web_log_001` VALUES (17, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:3:{s:7:\"account\";s:5:\"admin\";s:8:\"password\";s:6:\"123456\";s:7:\"captcha\";s:4:\"8asb\";}', 1524742357);
INSERT INTO `book_web_log_001` VALUES (18, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1524742358);
INSERT INTO `book_web_log_001` VALUES (19, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1524742359);
INSERT INTO `book_web_log_001` VALUES (20, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/Admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', 1524742980);
INSERT INTO `book_web_log_001` VALUES (21, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', 1524743124);
INSERT INTO `book_web_log_001` VALUES (22, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/Admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', 1524743128);
INSERT INTO `book_web_log_001` VALUES (23, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1524743131);
INSERT INTO `book_web_log_001` VALUES (24, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/admin/feed_back/index.html', 'admin', 'FeedBack', 'index', 'GET', 'a:0:{}', 1524743138);
INSERT INTO `book_web_log_001` VALUES (25, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/admin/feed_back/status?fb_id=3', 'admin', 'FeedBack', 'status', 'GET', 'a:1:{s:5:\"fb_id\";s:1:\"3\";}', 1524743144);
INSERT INTO `book_web_log_001` VALUES (26, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/admin/feed_back/status?fb_id=3', 'admin', 'FeedBack', 'status', 'POST', 'a:2:{s:5:\"fb_id\";s:1:\"3\";s:17:\"fb_status_content\";s:3:\"fff\";}', 1524743149);
INSERT INTO `book_web_log_001` VALUES (27, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/admin/recommend/index.html', 'admin', 'Recommend', 'index', 'GET', 'a:0:{}', 1524743152);
INSERT INTO `book_web_log_001` VALUES (28, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/admin/feed_back/index.html', 'admin', 'FeedBack', 'index', 'GET', 'a:0:{}', 1524743152);
INSERT INTO `book_web_log_001` VALUES (29, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/admin/focus/index.html', 'admin', 'Focus', 'index', 'GET', 'a:0:{}', 1524743153);
INSERT INTO `book_web_log_001` VALUES (30, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1525449554);
INSERT INTO `book_web_log_001` VALUES (31, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1525449554);
INSERT INTO `book_web_log_001` VALUES (32, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:3:{s:7:\"account\";s:5:\"admin\";s:8:\"password\";s:6:\"123456\";s:7:\"captcha\";s:4:\"axwu\";}', 1525449571);
INSERT INTO `book_web_log_001` VALUES (33, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:4:{s:7:\"account\";s:5:\"admin\";s:8:\"password\";s:6:\"123456\";s:7:\"captcha\";s:4:\"8ggj\";s:6:\"online\";s:1:\"1\";}', 1525449579);
INSERT INTO `book_web_log_001` VALUES (34, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:4:{s:7:\"account\";s:5:\"admin\";s:8:\"password\";s:6:\"123456\";s:7:\"captcha\";s:4:\"wpcv\";s:6:\"online\";s:1:\"1\";}', 1525449586);
INSERT INTO `book_web_log_001` VALUES (35, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1525449586);
INSERT INTO `book_web_log_001` VALUES (36, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1525449587);
INSERT INTO `book_web_log_001` VALUES (37, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1525449590);
INSERT INTO `book_web_log_001` VALUES (38, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/product/delete.html', 'admin', 'Product', 'delete', 'POST', 'a:1:{s:2:\"id\";s:2:\"19\";}', 1525449605);
INSERT INTO `book_web_log_001` VALUES (39, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/product/edit/id/18.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:2:\"18\";}', 1525449638);
INSERT INTO `book_web_log_001` VALUES (40, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/product/edit/id/18.html', 'admin', 'Product', 'edit', 'POST', 'a:16:{s:2:\"id\";s:2:\"18\";s:5:\"title\";s:29:\"马刺王朝(全彩珍藏版)\";s:4:\"name\";s:0:\"\";s:5:\"price\";s:5:\"52.20\";s:10:\"sale_price\";s:4:\"0.00\";s:9:\"inventory\";s:3:\"125\";s:7:\"soldnum\";s:1:\"0\";s:8:\"clicknum\";s:1:\"0\";s:4:\"type\";s:1:\"6\";s:3:\"img\";s:2:\"16\";s:6:\"author\";s:6:\"段旭\";s:5:\"press\";s:48:\"机械工业出版社; 第1版 (2017年1月1日)\";s:4:\"page\";s:3:\"316\";s:11:\"description\";s:200:\"1997年的盛夏，在纽约举行的选秀大会上，蒂姆?邓肯在首轮第一位被波波维奇慧眼识珠选中，随即与&ldquo;海军上将&rdquo;大卫?罗宾逊组成双塔，并在职业\";s:6:\"is_top\";s:1:\"6\";s:6:\"status\";s:1:\"1\";}', 1525449648);
INSERT INTO `book_web_log_001` VALUES (41, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1525449648);
INSERT INTO `book_web_log_001` VALUES (42, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1525525430);
INSERT INTO `book_web_log_001` VALUES (43, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1525525430);
INSERT INTO `book_web_log_001` VALUES (44, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:4:{s:7:\"account\";s:5:\"admin\";s:8:\"password\";s:6:\"123456\";s:7:\"captcha\";s:4:\"y3yj\";s:6:\"online\";s:1:\"1\";}', 1525525441);
INSERT INTO `book_web_log_001` VALUES (45, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1525525442);
INSERT INTO `book_web_log_001` VALUES (46, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1525525442);
INSERT INTO `book_web_log_001` VALUES (47, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/Admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', 1525525444);
INSERT INTO `book_web_log_001` VALUES (48, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1525525468);
INSERT INTO `book_web_log_001` VALUES (49, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1525525468);
INSERT INTO `book_web_log_001` VALUES (50, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/Admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', 1525525584);
INSERT INTO `book_web_log_001` VALUES (51, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/Admin/user/index?ktype=1&kword=', 'admin', 'User', 'index', 'GET', 'a:2:{s:5:\"ktype\";s:1:\"1\";s:5:\"kword\";s:0:\"\";}', 1525525671);
INSERT INTO `book_web_log_001` VALUES (52, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/Admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', 1525525700);
INSERT INTO `book_web_log_001` VALUES (53, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/Admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', 1525526120);
INSERT INTO `book_web_log_001` VALUES (54, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/Admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', 1525526121);
INSERT INTO `book_web_log_001` VALUES (55, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/Admin/user/index?ktype=2&kword=', 'admin', 'User', 'index', 'GET', 'a:2:{s:5:\"ktype\";s:1:\"2\";s:5:\"kword\";s:0:\"\";}', 1525526124);
INSERT INTO `book_web_log_001` VALUES (56, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/Admin/user/index?ktype=2&kword=kk', 'admin', 'User', 'index', 'GET', 'a:2:{s:5:\"ktype\";s:1:\"2\";s:5:\"kword\";s:2:\"kk\";}', 1525526128);
INSERT INTO `book_web_log_001` VALUES (57, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/Admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', 1525526182);
INSERT INTO `book_web_log_001` VALUES (58, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1525526185);
INSERT INTO `book_web_log_001` VALUES (59, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/type/index.html?title=%E8%82%B2%E5%84%BF', 'admin', 'Type', 'index', 'GET', 'a:1:{s:5:\"title\";s:6:\"育儿\";}', 1525526193);
INSERT INTO `book_web_log_001` VALUES (60, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/type/index.html?title=%E8%82%B2%E5%84%BF', 'admin', 'Type', 'index', 'GET', 'a:1:{s:5:\"title\";s:6:\"育儿\";}', 1525526199);
INSERT INTO `book_web_log_001` VALUES (61, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1525526201);
INSERT INTO `book_web_log_001` VALUES (62, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/product/index.html?title=%E9%A9%AC%E5%88%BA%E7%8E%8B%E6%9C%9D', 'admin', 'Product', 'index', 'GET', 'a:1:{s:5:\"title\";s:12:\"马刺王朝\";}', 1525526209);
INSERT INTO `book_web_log_001` VALUES (63, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/product/index.html?title=', 'admin', 'Product', 'index', 'GET', 'a:1:{s:5:\"title\";s:0:\"\";}', 1525526213);
INSERT INTO `book_web_log_001` VALUES (64, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/product/index.html?title=%E6%9C%AA%E6%9D%A5%E7%AE%80%E5%8F%B2+', 'admin', 'Product', 'index', 'GET', 'a:1:{s:5:\"title\";s:13:\"未来简史 \";}', 1525526219);
INSERT INTO `book_web_log_001` VALUES (65, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1525526221);
INSERT INTO `book_web_log_001` VALUES (66, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/focus/index.html', 'admin', 'Focus', 'index', 'GET', 'a:0:{}', 1525526224);
INSERT INTO `book_web_log_001` VALUES (67, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/feed_back/index.html', 'admin', 'FeedBack', 'index', 'GET', 'a:0:{}', 1525526228);
INSERT INTO `book_web_log_001` VALUES (68, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/recommend/index.html', 'admin', 'Recommend', 'index', 'GET', 'a:0:{}', 1525526232);
INSERT INTO `book_web_log_001` VALUES (69, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/recommend/index.html?title=%E7%8B%AC%E5%AE%B6%E7%89%B9%E4%BE%9B', 'admin', 'Recommend', 'index', 'GET', 'a:1:{s:5:\"title\";s:12:\"独家特供\";}', 1525526239);
INSERT INTO `book_web_log_001` VALUES (70, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/recommend/index.html?title=%E7%8B%AC%E5%AE%B6%E7%89%B9%E4%BE%9B', 'admin', 'Recommend', 'index', 'GET', 'a:1:{s:5:\"title\";s:12:\"独家特供\";}', 1525526242);

-- ----------------------------
-- Table structure for book_web_log_all
-- ----------------------------
DROP TABLE IF EXISTS `book_web_log_all`;
CREATE TABLE `book_web_log_all`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `uid` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  `ip` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '访客ip',
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '访客地址',
  `os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作系统',
  `browser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '浏览器',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'url',
  `module` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模块',
  `controller` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '控制器',
  `action` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '方法',
  `method` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '请求方式',
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '请求的param数据，serialize后的',
  `create_at` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `ip`(`ip`) USING BTREE,
  INDEX `create_at`(`create_at`) USING BTREE
) ENGINE = MRG_MYISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '网站日志' INSERT_METHOD = LAST ROW_FORMAT = Dynamic UNION = (`book_web_log_001`);

-- ----------------------------
-- Records of book_web_log_all
-- ----------------------------
INSERT INTO `book_web_log_all` VALUES (1, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1524738193);
INSERT INTO `book_web_log_all` VALUES (2, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1524738194);
INSERT INTO `book_web_log_all` VALUES (3, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:3:{s:7:\"account\";s:5:\"admin\";s:8:\"password\";s:6:\"123456\";s:7:\"captcha\";s:4:\"nhds\";}', 1524738199);
INSERT INTO `book_web_log_all` VALUES (4, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1524738199);
INSERT INTO `book_web_log_all` VALUES (5, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1524738200);
INSERT INTO `book_web_log_all` VALUES (6, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1524738202);
INSERT INTO `book_web_log_all` VALUES (7, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/admin/focus/index.html', 'admin', 'Focus', 'index', 'GET', 'a:0:{}', 1524738204);
INSERT INTO `book_web_log_all` VALUES (8, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/admin/feed_back/index.html', 'admin', 'FeedBack', 'index', 'GET', 'a:0:{}', 1524738205);
INSERT INTO `book_web_log_all` VALUES (9, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/admin/recommend/index.html', 'admin', 'Recommend', 'index', 'GET', 'a:0:{}', 1524738208);
INSERT INTO `book_web_log_all` VALUES (10, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1524738210);
INSERT INTO `book_web_log_all` VALUES (11, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1524738210);
INSERT INTO `book_web_log_all` VALUES (12, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/Admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', 1524738340);
INSERT INTO `book_web_log_all` VALUES (13, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/Admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', 1524738461);
INSERT INTO `book_web_log_all` VALUES (14, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/Admin/user/view?id=1', 'admin', 'User', 'view', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', 1524738475);
INSERT INTO `book_web_log_all` VALUES (15, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1524742340);
INSERT INTO `book_web_log_all` VALUES (16, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1524742341);
INSERT INTO `book_web_log_all` VALUES (17, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:3:{s:7:\"account\";s:5:\"admin\";s:8:\"password\";s:6:\"123456\";s:7:\"captcha\";s:4:\"8asb\";}', 1524742357);
INSERT INTO `book_web_log_all` VALUES (18, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1524742358);
INSERT INTO `book_web_log_all` VALUES (19, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1524742359);
INSERT INTO `book_web_log_all` VALUES (20, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/Admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', 1524742980);
INSERT INTO `book_web_log_all` VALUES (21, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', 1524743124);
INSERT INTO `book_web_log_all` VALUES (22, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/Admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', 1524743128);
INSERT INTO `book_web_log_all` VALUES (23, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1524743131);
INSERT INTO `book_web_log_all` VALUES (24, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/admin/feed_back/index.html', 'admin', 'FeedBack', 'index', 'GET', 'a:0:{}', 1524743138);
INSERT INTO `book_web_log_all` VALUES (25, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/admin/feed_back/status?fb_id=3', 'admin', 'FeedBack', 'status', 'GET', 'a:1:{s:5:\"fb_id\";s:1:\"3\";}', 1524743144);
INSERT INTO `book_web_log_all` VALUES (26, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/admin/feed_back/status?fb_id=3', 'admin', 'FeedBack', 'status', 'POST', 'a:2:{s:5:\"fb_id\";s:1:\"3\";s:17:\"fb_status_content\";s:3:\"fff\";}', 1524743149);
INSERT INTO `book_web_log_all` VALUES (27, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/admin/recommend/index.html', 'admin', 'Recommend', 'index', 'GET', 'a:0:{}', 1524743152);
INSERT INTO `book_web_log_all` VALUES (28, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/admin/feed_back/index.html', 'admin', 'FeedBack', 'index', 'GET', 'a:0:{}', 1524743152);
INSERT INTO `book_web_log_all` VALUES (29, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Chrome(60.0.3112.101)', 'http://admin.lingbook.com/admin/focus/index.html', 'admin', 'Focus', 'index', 'GET', 'a:0:{}', 1524743153);
INSERT INTO `book_web_log_all` VALUES (30, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1525449554);
INSERT INTO `book_web_log_all` VALUES (31, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1525449554);
INSERT INTO `book_web_log_all` VALUES (32, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:3:{s:7:\"account\";s:5:\"admin\";s:8:\"password\";s:6:\"123456\";s:7:\"captcha\";s:4:\"axwu\";}', 1525449571);
INSERT INTO `book_web_log_all` VALUES (33, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:4:{s:7:\"account\";s:5:\"admin\";s:8:\"password\";s:6:\"123456\";s:7:\"captcha\";s:4:\"8ggj\";s:6:\"online\";s:1:\"1\";}', 1525449579);
INSERT INTO `book_web_log_all` VALUES (34, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:4:{s:7:\"account\";s:5:\"admin\";s:8:\"password\";s:6:\"123456\";s:7:\"captcha\";s:4:\"wpcv\";s:6:\"online\";s:1:\"1\";}', 1525449586);
INSERT INTO `book_web_log_all` VALUES (35, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1525449586);
INSERT INTO `book_web_log_all` VALUES (36, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1525449587);
INSERT INTO `book_web_log_all` VALUES (37, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1525449590);
INSERT INTO `book_web_log_all` VALUES (38, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/product/delete.html', 'admin', 'Product', 'delete', 'POST', 'a:1:{s:2:\"id\";s:2:\"19\";}', 1525449605);
INSERT INTO `book_web_log_all` VALUES (39, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/product/edit/id/18.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:2:\"18\";}', 1525449638);
INSERT INTO `book_web_log_all` VALUES (40, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/product/edit/id/18.html', 'admin', 'Product', 'edit', 'POST', 'a:16:{s:2:\"id\";s:2:\"18\";s:5:\"title\";s:29:\"马刺王朝(全彩珍藏版)\";s:4:\"name\";s:0:\"\";s:5:\"price\";s:5:\"52.20\";s:10:\"sale_price\";s:4:\"0.00\";s:9:\"inventory\";s:3:\"125\";s:7:\"soldnum\";s:1:\"0\";s:8:\"clicknum\";s:1:\"0\";s:4:\"type\";s:1:\"6\";s:3:\"img\";s:2:\"16\";s:6:\"author\";s:6:\"段旭\";s:5:\"press\";s:48:\"机械工业出版社; 第1版 (2017年1月1日)\";s:4:\"page\";s:3:\"316\";s:11:\"description\";s:200:\"1997年的盛夏，在纽约举行的选秀大会上，蒂姆?邓肯在首轮第一位被波波维奇慧眼识珠选中，随即与&ldquo;海军上将&rdquo;大卫?罗宾逊组成双塔，并在职业\";s:6:\"is_top\";s:1:\"6\";s:6:\"status\";s:1:\"1\";}', 1525449648);
INSERT INTO `book_web_log_all` VALUES (41, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1525449648);
INSERT INTO `book_web_log_all` VALUES (42, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1525525430);
INSERT INTO `book_web_log_all` VALUES (43, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1525525430);
INSERT INTO `book_web_log_all` VALUES (44, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:4:{s:7:\"account\";s:5:\"admin\";s:8:\"password\";s:6:\"123456\";s:7:\"captcha\";s:4:\"y3yj\";s:6:\"online\";s:1:\"1\";}', 1525525441);
INSERT INTO `book_web_log_all` VALUES (45, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1525525442);
INSERT INTO `book_web_log_all` VALUES (46, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1525525442);
INSERT INTO `book_web_log_all` VALUES (47, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/Admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', 1525525444);
INSERT INTO `book_web_log_all` VALUES (48, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1525525468);
INSERT INTO `book_web_log_all` VALUES (49, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1525525468);
INSERT INTO `book_web_log_all` VALUES (50, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/Admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', 1525525584);
INSERT INTO `book_web_log_all` VALUES (51, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/Admin/user/index?ktype=1&kword=', 'admin', 'User', 'index', 'GET', 'a:2:{s:5:\"ktype\";s:1:\"1\";s:5:\"kword\";s:0:\"\";}', 1525525671);
INSERT INTO `book_web_log_all` VALUES (52, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/Admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', 1525525700);
INSERT INTO `book_web_log_all` VALUES (53, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/Admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', 1525526120);
INSERT INTO `book_web_log_all` VALUES (54, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/Admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', 1525526121);
INSERT INTO `book_web_log_all` VALUES (55, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/Admin/user/index?ktype=2&kword=', 'admin', 'User', 'index', 'GET', 'a:2:{s:5:\"ktype\";s:1:\"2\";s:5:\"kword\";s:0:\"\";}', 1525526124);
INSERT INTO `book_web_log_all` VALUES (56, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/Admin/user/index?ktype=2&kword=kk', 'admin', 'User', 'index', 'GET', 'a:2:{s:5:\"ktype\";s:1:\"2\";s:5:\"kword\";s:2:\"kk\";}', 1525526128);
INSERT INTO `book_web_log_all` VALUES (57, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/Admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', 1525526182);
INSERT INTO `book_web_log_all` VALUES (58, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1525526185);
INSERT INTO `book_web_log_all` VALUES (59, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/type/index.html?title=%E8%82%B2%E5%84%BF', 'admin', 'Type', 'index', 'GET', 'a:1:{s:5:\"title\";s:6:\"育儿\";}', 1525526193);
INSERT INTO `book_web_log_all` VALUES (60, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/type/index.html?title=%E8%82%B2%E5%84%BF', 'admin', 'Type', 'index', 'GET', 'a:1:{s:5:\"title\";s:6:\"育儿\";}', 1525526199);
INSERT INTO `book_web_log_all` VALUES (61, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1525526201);
INSERT INTO `book_web_log_all` VALUES (62, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/product/index.html?title=%E9%A9%AC%E5%88%BA%E7%8E%8B%E6%9C%9D', 'admin', 'Product', 'index', 'GET', 'a:1:{s:5:\"title\";s:12:\"马刺王朝\";}', 1525526209);
INSERT INTO `book_web_log_all` VALUES (63, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/product/index.html?title=', 'admin', 'Product', 'index', 'GET', 'a:1:{s:5:\"title\";s:0:\"\";}', 1525526213);
INSERT INTO `book_web_log_all` VALUES (64, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/product/index.html?title=%E6%9C%AA%E6%9D%A5%E7%AE%80%E5%8F%B2+', 'admin', 'Product', 'index', 'GET', 'a:1:{s:5:\"title\";s:13:\"未来简史 \";}', 1525526219);
INSERT INTO `book_web_log_all` VALUES (65, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1525526221);
INSERT INTO `book_web_log_all` VALUES (66, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/focus/index.html', 'admin', 'Focus', 'index', 'GET', 'a:0:{}', 1525526224);
INSERT INTO `book_web_log_all` VALUES (67, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/feed_back/index.html', 'admin', 'FeedBack', 'index', 'GET', 'a:0:{}', 1525526228);
INSERT INTO `book_web_log_all` VALUES (68, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/recommend/index.html', 'admin', 'Recommend', 'index', 'GET', 'a:0:{}', 1525526232);
INSERT INTO `book_web_log_all` VALUES (69, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/recommend/index.html?title=%E7%8B%AC%E5%AE%B6%E7%89%B9%E4%BE%9B', 'admin', 'Recommend', 'index', 'GET', 'a:1:{s:5:\"title\";s:12:\"独家特供\";}', 1525526239);
INSERT INTO `book_web_log_all` VALUES (70, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 7', 'Firefox(58.0)', 'http://admin.lingbook.com/admin/recommend/index.html?title=%E7%8B%AC%E5%AE%B6%E7%89%B9%E4%BE%9B', 'admin', 'Recommend', 'index', 'GET', 'a:1:{s:5:\"title\";s:12:\"独家特供\";}', 1525526242);

SET FOREIGN_KEY_CHECKS = 1;
