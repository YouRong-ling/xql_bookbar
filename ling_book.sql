/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50547
 Source Host           : localhost:3306
 Source Schema         : tpadmin_source

 Target Server Type    : MySQL
 Target Server Version : 50547
 File Encoding         : 65001

 Date: 28/03/2018 14:50:07
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
) ENGINE = MyISAM AUTO_INCREMENT = 69 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
  `role_id` mediumint(9) UNSIGNED DEFAULT NULL,
  `user_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
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
INSERT INTO `book_admin_user` VALUES (1, 'admin', '超级管理员', 'e10adc3949ba59abbe56e057f20f883e', 1522118882, '127.0.0.1', 3, 'admin@admin.com', '13121126169', '我是超级管理员', 1, 0, 1222907803, 1451033528);
INSERT INTO `book_admin_user` VALUES (2, 'demo', '测试', 'e10adc3949ba59abbe56e057f20f883e', 1481206367, '127.0.0.1', 0, '', '', '', 1, 0, 1476777133, 1477399793);

-- ----------------------------
-- Table structure for book_feedback
-- ----------------------------
DROP TABLE IF EXISTS `book_feedback`;
CREATE TABLE `book_feedback`  (
  `fb_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `fb_name` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '称呼',
  `fb_mobile` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '联系方式',
  `fb_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '反馈内容',
  `fb_m_uid` int(10) UNSIGNED DEFAULT 0 COMMENT '用户ID',
  `fb_type` tinyint(1) UNSIGNED DEFAULT 0 COMMENT '渠道 1 小巧玲珑书吧',
  `fb_place` tinyint(1) UNSIGNED DEFAULT 0 COMMENT '位置 1 首页',
  `fb_create_time` int(10) NOT NULL DEFAULT 0 COMMENT '提交时间',
  `fb_status` tinyint(1) UNSIGNED DEFAULT 0 COMMENT '处理状态 0未处理 1已处理',
  `fb_status_content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '备注',
  `fb_status_time` int(10) UNSIGNED DEFAULT 0 COMMENT '处理时间',
  `fb_admin_uid` int(11) UNSIGNED DEFAULT 0 COMMENT '处理管理员',
  PRIMARY KEY (`fb_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '反馈意见表' ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
  `ad_details` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '详情',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED DEFAULT 0 COMMENT '更改时间',
  `admin_uid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
  `isdelete` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除 1删除 0未删除',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1启用  0禁用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of book_login_log
-- ----------------------------
INSERT INTO `book_login_log` VALUES (1, 1, '127.0.0.1', '本机地址 本机地址  ', 'Chrome(63.0.3239.108)', 'Windows 10', '2018-02-23 10:59:31');
INSERT INTO `book_login_log` VALUES (2, 1, '127.0.0.1', '本机地址 本机地址  ', 'Chrome(63.0.3239.108)', 'Windows 10', '2018-02-24 13:43:38');
INSERT INTO `book_login_log` VALUES (3, 1, '127.0.0.1', '本机地址 本机地址  ', 'Chrome(63.0.3239.108)', 'Windows 10', '2018-03-05 09:58:24');
INSERT INTO `book_login_log` VALUES (4, 1, '127.0.0.1', '本机地址 本机地址  ', 'Chrome(63.0.3239.108)', 'Windows 10', '2018-03-26 14:41:31');
INSERT INTO `book_login_log` VALUES (5, 1, '127.0.0.1', '本机地址 本机地址  ', 'Chrome(63.0.3239.108)', 'Windows 10', '2018-03-27 10:48:02');

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
  `field1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '字段一',
  `option` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '选填',
  `select` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '下拉框',
  `radio` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '单选',
  `checkbox` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '复选框',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `textarea` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文本域',
  `date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '日期',
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮箱',
  `sort` smallint(5) DEFAULT 50 COMMENT '排序',
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
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` int(5) NOT NULL DEFAULT 0 COMMENT '用户ID',
  `username` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `product_id` int(10) UNSIGNED DEFAULT 0 COMMENT '商品ID',
  `product_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '商品名称',
  `type` int(10) UNSIGNED DEFAULT 0 COMMENT '商品分类',
  `pay_real` double(10, 2) NOT NULL DEFAULT 0.00 COMMENT '实收金额',
  `pay_amout` double(10, 2) NOT NULL DEFAULT 0.00 COMMENT '订单金额',
  `pay_channels` tinyint(1) NOT NULL DEFAULT 0 COMMENT '支付渠道 1支付宝 2微信 3网银 ',
  `pay_account` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '支付账号',
  `shroff_account` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收款账号',
  `source` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单来源',
  `pay_time` int(10) NOT NULL DEFAULT 0 COMMENT '支付时间',
  `orderstatus` tinyint(1) NOT NULL DEFAULT 1 COMMENT '订单状态 1未支付 2已支付 3申请退款 4已退款 5失效',
  `desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单描述',
  `create_time` int(10) NOT NULL DEFAULT 0 COMMENT '生成时间',
  `update_time` int(10) UNSIGNED DEFAULT 0 COMMENT '修改时间',
  `isdelete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=开启订单；1=关闭订单',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for book_product
-- ----------------------------
DROP TABLE IF EXISTS `book_product`;
CREATE TABLE `book_product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品名称',
  `price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '商品价格',
  `sale_price` decimal(10, 2) DEFAULT NULL COMMENT '优惠价格',
  `type` tinyint(1) UNSIGNED DEFAULT 0 COMMENT '商品分类',
  `img` int(10) DEFAULT NULL COMMENT '图片id',
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '描述',
  `inventory` int(10) UNSIGNED DEFAULT 0 COMMENT '库存',
  `soldnum` int(10) DEFAULT NULL COMMENT '售出量',
  `real_soldnum` int(10) UNSIGNED DEFAULT 0 COMMENT '真实售出量',
  `clicknum` int(10) DEFAULT 0 COMMENT '浏览量',
  `real_clicknum` int(10) UNSIGNED DEFAULT 0 COMMENT '真实浏览量',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态 0 正常 1屏蔽 ',
  `uid` int(10) UNSIGNED DEFAULT 0 COMMENT '管理员ID',
  `create_time` int(11) DEFAULT NULL COMMENT '添加时间',
  `update_time` int(11) DEFAULT NULL COMMENT '修改时间',
  `isdelete` tinyint(1) UNSIGNED DEFAULT 0 COMMENT '0 正常 1删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book_product
-- ----------------------------
INSERT INTO `book_product` VALUES (6, '东野圭吾', 100.00, 0.00, 4, 0, '', 100, 100, 0, 10, 0, 1, 1, 1522049000, 1522049000, 0);
INSERT INTO `book_product` VALUES (7, '阿加莎', 18.00, 2.00, 1, 0, '11111', 3, 4, 0, 5, 0, 1, 1, 1522049000, 1522059932, 0);
INSERT INTO `book_product` VALUES (8, '白夜行', 23.50, 20.80, 2, 0, '发发发', 100, 80, 0, 50, 0, 1, 1, 1522049000, 1522049000, 0);
INSERT INTO `book_product` VALUES (9, '麒麟之翼', 26.80, 0.00, 2, 0, '东野圭吾', 88, 10, 0, 10, 0, 1, 1, 1522119859, 1522119859, 0);
INSERT INTO `book_product` VALUES (10, '毕业', 18.60, 1.00, 2, 1, '11', 11, 0, 0, 0, 0, 1, 1, 1522137283, 1522137283, 0);

-- ----------------------------
-- Table structure for book_type
-- ----------------------------
DROP TABLE IF EXISTS `book_type`;
CREATE TABLE `book_type`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品分类ID',
  `title` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '分类名称',
  `status` tinyint(1) UNSIGNED DEFAULT 0 COMMENT '状态 0 正常 1删除',
  `sort` tinyint(10) UNSIGNED DEFAULT 0 COMMENT '排序',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '备注',
  `uid` int(10) UNSIGNED DEFAULT 0 COMMENT '管理员ID',
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
INSERT INTO `book_type` VALUES (4, '科幻', 1, 1, '科幻', 0, 1520220576, 0);
INSERT INTO `book_type` VALUES (5, '儿童', 1, 1, '儿童', 0, 1520220576, 0);
INSERT INTO `book_type` VALUES (6, '生活', 1, 1, '生活', 0, 1520220576, 0);
INSERT INTO `book_type` VALUES (7, '育儿', 1, 1, '育儿', 0, 0, 0);

-- ----------------------------
-- Table structure for book_user
-- ----------------------------
DROP TABLE IF EXISTS `book_user`;
CREATE TABLE `book_user`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `realname` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '真实姓名',
  `mobile` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户手机',
  `email` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户邮箱',
  `sex` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '性别',
  `img` int(5) NOT NULL DEFAULT 0 COMMENT '头像 ',
  `reg_ip` bigint(20) NOT NULL DEFAULT 0 COMMENT '注册IP',
  `reg_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT 0 COMMENT '最后登录IP',
  `login` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '登录次数',
  `last_login_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后登录时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员表' ROW_FORMAT = Compact;

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
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '请求的param数据，serialize后的',
  `create_at` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `ip`(`ip`) USING BTREE,
  INDEX `create_at`(`create_at`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '网站日志' ROW_FORMAT = Dynamic;

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
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '请求的param数据，serialize后的',
  `create_at` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `ip`(`ip`) USING BTREE,
  INDEX `create_at`(`create_at`) USING BTREE
) ENGINE = MRG_MYISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '网站日志' INSERT_METHOD = LAST ROW_FORMAT = Dynamic UNION = (`book_web_log_001`);

SET FOREIGN_KEY_CHECKS = 1;
