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

 Date: 27/03/2018 16:23:57
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
) ENGINE = MyISAM AUTO_INCREMENT = 67 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
  `order_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` int(5) NOT NULL DEFAULT 0 COMMENT '用户ID',
  `username` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `product_id` int(10) UNSIGNED DEFAULT 0 COMMENT '商品ID',
  `product_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '商品名称',
  `type` int(10) UNSIGNED DEFAULT 0 COMMENT '商品分类',
  `pay_real` double(10, 2) NOT NULL DEFAULT 0.00 COMMENT '实收金额',
  `pay_amout` double(10, 2) NOT NULL DEFAULT 0.00 COMMENT '订单金额',
  `preferential` double(10, 2) NOT NULL DEFAULT 0.00 COMMENT '优惠金额',
  `pay_channels` tinyint(1) NOT NULL DEFAULT 0 COMMENT '支付渠道 1在线支付宝 2在线微信支付 3在线网银付款 4线下支付宝 5线下微信 6线下银行转账 7pos机刷卡 8现金支付 9其他',
  `pay_account` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '支付账号',
  `shroff_account` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收款账号',
  `source` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单来源',
  `pay_time` int(10) NOT NULL DEFAULT 0 COMMENT '支付时间',
  `orderstatus` tinyint(1) NOT NULL DEFAULT 1 COMMENT '订单状态 1未支付 2已支付 3申请退款 4已退款 5失效',
  `desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单描述',
  `create_time` int(10) NOT NULL DEFAULT 0 COMMENT '生成时间',
  `update_time` int(10) UNSIGNED DEFAULT 0 COMMENT '修改时间',
  `isdelete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=开启订单；1=关闭订单',
  `is_online` tinyint(1) DEFAULT 0 COMMENT '是否线上支付1是0不是',
  PRIMARY KEY (`order_id`) USING BTREE
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
) ENGINE = MyISAM AUTO_INCREMENT = 562 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '网站日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book_web_log_001
-- ----------------------------
INSERT INTO `book_web_log_001` VALUES (1, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1519955509);
INSERT INTO `book_web_log_001` VALUES (2, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1519955510);
INSERT INTO `book_web_log_001` VALUES (3, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', 1519955673);
INSERT INTO `book_web_log_001` VALUES (4, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1519955675);
INSERT INTO `book_web_log_001` VALUES (5, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1519955676);
INSERT INTO `book_web_log_001` VALUES (6, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', 1519955676);
INSERT INTO `book_web_log_001` VALUES (7, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1519955676);
INSERT INTO `book_web_log_001` VALUES (8, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_user/index.html', 'admin', 'AdminUser', 'index', 'GET', 'a:0:{}', 1519955676);
INSERT INTO `book_web_log_001` VALUES (9, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/node_map/index.html', 'admin', 'NodeMap', 'index', 'GET', 'a:0:{}', 1519955677);
INSERT INTO `book_web_log_001` VALUES (10, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/web_log/index.html', 'admin', 'WebLog', 'index', 'GET', 'a:0:{}', 1519955677);
INSERT INTO `book_web_log_001` VALUES (11, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/login_log/index.html', 'admin', 'LoginLog', 'index', 'GET', 'a:0:{}', 1519955678);
INSERT INTO `book_web_log_001` VALUES (12, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/web_log/index.html', 'admin', 'WebLog', 'index', 'GET', 'a:0:{}', 1519955680);
INSERT INTO `book_web_log_001` VALUES (13, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1519955691);
INSERT INTO `book_web_log_001` VALUES (14, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1519955692);
INSERT INTO `book_web_log_001` VALUES (15, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/web_log/index.html', 'admin', 'WebLog', 'index', 'GET', 'a:0:{}', 1519955694);
INSERT INTO `book_web_log_001` VALUES (16, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_user/index.html', 'admin', 'AdminUser', 'index', 'GET', 'a:0:{}', 1519957537);
INSERT INTO `book_web_log_001` VALUES (17, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', 1519957539);
INSERT INTO `book_web_log_001` VALUES (18, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1519957541);
INSERT INTO `book_web_log_001` VALUES (19, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1519957541);
INSERT INTO `book_web_log_001` VALUES (20, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1519957541);
INSERT INTO `book_web_log_001` VALUES (21, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', 1519957543);
INSERT INTO `book_web_log_001` VALUES (22, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_user/index.html', 'admin', 'AdminUser', 'index', 'GET', 'a:0:{}', 1519957544);
INSERT INTO `book_web_log_001` VALUES (23, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/node_map/index.html', 'admin', 'NodeMap', 'index', 'GET', 'a:0:{}', 1519957666);
INSERT INTO `book_web_log_001` VALUES (24, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', 1519957673);
INSERT INTO `book_web_log_001` VALUES (25, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_group/add.html', 'admin', 'AdminGroup', 'add', 'GET', 'a:0:{}', 1519957675);
INSERT INTO `book_web_log_001` VALUES (26, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_group/add.html', 'admin', 'AdminGroup', 'add', 'POST', 'a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:18:\"小巧玲珑书吧\";s:4:\"icon\";s:12:\"&amp;#xe625;\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:0:\"\";}', 1519957847);
INSERT INTO `book_web_log_001` VALUES (27, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', 1519957847);
INSERT INTO `book_web_log_001` VALUES (28, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1519957850);
INSERT INTO `book_web_log_001` VALUES (29, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1519957851);
INSERT INTO `book_web_log_001` VALUES (30, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', 1519957858);
INSERT INTO `book_web_log_001` VALUES (31, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', 1519957860);
INSERT INTO `book_web_log_001` VALUES (32, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_group/edit/id/3.html', 'admin', 'AdminGroup', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"3\";}', 1519957864);
INSERT INTO `book_web_log_001` VALUES (33, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_user/index.html', 'admin', 'AdminUser', 'index', 'GET', 'a:0:{}', 1519957894);
INSERT INTO `book_web_log_001` VALUES (34, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1519957901);
INSERT INTO `book_web_log_001` VALUES (35, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1519957901);
INSERT INTO `book_web_log_001` VALUES (36, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1519957901);
INSERT INTO `book_web_log_001` VALUES (37, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/add?pid=1', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:\"pid\";s:1:\"1\";}', 1519957914);
INSERT INTO `book_web_log_001` VALUES (38, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/add', 'admin', 'AdminNode', 'add', 'POST', 'a:9:{s:2:\"id\";s:0:\"\";s:3:\"pid\";s:1:\"1\";s:5:\"level\";s:1:\"2\";s:8:\"group_id\";s:1:\"4\";s:5:\"title\";s:12:\"用户管理\";s:4:\"name\";s:5:\"index\";s:4:\"type\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}', 1519957952);
INSERT INTO `book_web_log_001` VALUES (39, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/add?pid=1', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:\"pid\";s:1:\"1\";}', 1519957988);
INSERT INTO `book_web_log_001` VALUES (40, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/add', 'admin', 'AdminNode', 'add', 'POST', 'a:9:{s:2:\"id\";s:0:\"\";s:3:\"pid\";s:1:\"1\";s:5:\"level\";s:1:\"2\";s:8:\"group_id\";s:1:\"4\";s:5:\"title\";s:12:\"用户管理\";s:4:\"name\";s:10:\"user/index\";s:4:\"type\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}', 1519958007);
INSERT INTO `book_web_log_001` VALUES (41, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1519958007);
INSERT INTO `book_web_log_001` VALUES (42, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1519958007);
INSERT INTO `book_web_log_001` VALUES (43, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1519958008);
INSERT INTO `book_web_log_001` VALUES (44, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1519958009);
INSERT INTO `book_web_log_001` VALUES (45, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1519958010);
INSERT INTO `book_web_log_001` VALUES (46, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1519961583);
INSERT INTO `book_web_log_001` VALUES (47, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1519961583);
INSERT INTO `book_web_log_001` VALUES (48, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1519961584);
INSERT INTO `book_web_log_001` VALUES (49, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', 1519961596);
INSERT INTO `book_web_log_001` VALUES (50, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', 1519961598);
INSERT INTO `book_web_log_001` VALUES (51, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_group/edit/id/4.html', 'admin', 'AdminGroup', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"4\";}', 1519961602);
INSERT INTO `book_web_log_001` VALUES (52, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_group/edit/id/3.html', 'admin', 'AdminGroup', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"3\";}', 1519961606);
INSERT INTO `book_web_log_001` VALUES (53, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_group/edit/id/1.html', 'admin', 'AdminGroup', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', 1519961616);
INSERT INTO `book_web_log_001` VALUES (54, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_group/edit/id/4.html', 'admin', 'AdminGroup', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"4\";}', 1519961624);
INSERT INTO `book_web_log_001` VALUES (55, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_group/edit/id/4.html', 'admin', 'AdminGroup', 'edit', 'POST', 'a:6:{s:2:\"id\";s:1:\"4\";s:4:\"name\";s:18:\"小巧玲珑书吧\";s:4:\"icon\";s:12:\"&amp;#xe625;\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:0:\"\";}', 1519961630);
INSERT INTO `book_web_log_001` VALUES (56, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', 1519961630);
INSERT INTO `book_web_log_001` VALUES (57, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1519961633);
INSERT INTO `book_web_log_001` VALUES (58, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1519961633);
INSERT INTO `book_web_log_001` VALUES (59, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', 1519961640);
INSERT INTO `book_web_log_001` VALUES (60, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1519961641);
INSERT INTO `book_web_log_001` VALUES (61, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1519961641);
INSERT INTO `book_web_log_001` VALUES (62, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1519961641);
INSERT INTO `book_web_log_001` VALUES (63, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', 1519961650);
INSERT INTO `book_web_log_001` VALUES (64, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/node_map/index.html', 'admin', 'NodeMap', 'index', 'GET', 'a:0:{}', 1519961652);
INSERT INTO `book_web_log_001` VALUES (65, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', 1519961654);
INSERT INTO `book_web_log_001` VALUES (66, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_group/edit/id/4.html', 'admin', 'AdminGroup', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"4\";}', 1519961656);
INSERT INTO `book_web_log_001` VALUES (67, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_group/edit/id/4.html', 'admin', 'AdminGroup', 'edit', 'POST', 'a:6:{s:2:\"id\";s:1:\"4\";s:4:\"name\";s:18:\"小巧玲珑书吧\";s:4:\"icon\";s:0:\"\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:0:\"\";}', 1519961673);
INSERT INTO `book_web_log_001` VALUES (68, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', 1519961673);
INSERT INTO `book_web_log_001` VALUES (69, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1519961676);
INSERT INTO `book_web_log_001` VALUES (70, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1519961677);
INSERT INTO `book_web_log_001` VALUES (71, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1519961677);
INSERT INTO `book_web_log_001` VALUES (72, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1519976740);
INSERT INTO `book_web_log_001` VALUES (73, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1519976741);
INSERT INTO `book_web_log_001` VALUES (74, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1519976741);
INSERT INTO `book_web_log_001` VALUES (75, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1519976755);
INSERT INTO `book_web_log_001` VALUES (76, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1519976755);
INSERT INTO `book_web_log_001` VALUES (77, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1519976756);
INSERT INTO `book_web_log_001` VALUES (78, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"4\";}', 1519976759);
INSERT INTO `book_web_log_001` VALUES (79, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1519976767);
INSERT INTO `book_web_log_001` VALUES (80, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/edit?id=2', 'admin', 'AdminNode', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"2\";}', 1519976771);
INSERT INTO `book_web_log_001` VALUES (81, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"4\";}', 1519976786);
INSERT INTO `book_web_log_001` VALUES (82, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/edit?id=63', 'admin', 'AdminNode', 'edit', 'GET', 'a:1:{s:2:\"id\";s:2:\"63\";}', 1519976789);
INSERT INTO `book_web_log_001` VALUES (83, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/edit', 'admin', 'AdminNode', 'edit', 'POST', 'a:9:{s:2:\"id\";s:2:\"63\";s:3:\"pid\";s:1:\"1\";s:5:\"level\";s:1:\"2\";s:8:\"group_id\";s:1:\"4\";s:5:\"title\";s:12:\"用户管理\";s:4:\"name\";s:4:\"User\";s:4:\"type\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}', 1519976798);
INSERT INTO `book_web_log_001` VALUES (84, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1519976798);
INSERT INTO `book_web_log_001` VALUES (85, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1519976798);
INSERT INTO `book_web_log_001` VALUES (86, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"4\";}', 1519976799);
INSERT INTO `book_web_log_001` VALUES (87, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1519976829);
INSERT INTO `book_web_log_001` VALUES (88, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1519976829);
INSERT INTO `book_web_log_001` VALUES (89, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1519976830);
INSERT INTO `book_web_log_001` VALUES (90, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"4\";}', 1519976833);
INSERT INTO `book_web_log_001` VALUES (91, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/edit?id=63', 'admin', 'AdminNode', 'edit', 'GET', 'a:1:{s:2:\"id\";s:2:\"63\";}', 1519976836);
INSERT INTO `book_web_log_001` VALUES (92, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/edit', 'admin', 'AdminNode', 'edit', 'POST', 'a:9:{s:2:\"id\";s:2:\"63\";s:3:\"pid\";s:1:\"1\";s:5:\"level\";s:1:\"2\";s:8:\"group_id\";s:1:\"4\";s:5:\"title\";s:12:\"用户管理\";s:4:\"name\";s:10:\"Admin/User\";s:4:\"type\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}', 1519976846);
INSERT INTO `book_web_log_001` VALUES (93, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1519976846);
INSERT INTO `book_web_log_001` VALUES (94, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1519976847);
INSERT INTO `book_web_log_001` VALUES (95, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"4\";}', 1519976847);
INSERT INTO `book_web_log_001` VALUES (96, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1519976852);
INSERT INTO `book_web_log_001` VALUES (97, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1519976853);
INSERT INTO `book_web_log_001` VALUES (98, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1519976853);
INSERT INTO `book_web_log_001` VALUES (99, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1519976853);
INSERT INTO `book_web_log_001` VALUES (100, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', 1519976910);
INSERT INTO `book_web_log_001` VALUES (101, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', 1519976912);
INSERT INTO `book_web_log_001` VALUES (102, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', 1519978653);
INSERT INTO `book_web_log_001` VALUES (103, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', 1519978673);
INSERT INTO `book_web_log_001` VALUES (104, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', 1519978737);
INSERT INTO `book_web_log_001` VALUES (105, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/user/index.html?ktype=&kword=', 'admin', 'User', 'index', 'GET', 'a:2:{s:5:\"ktype\";s:0:\"\";s:5:\"kword\";s:0:\"\";}', 1519978739);
INSERT INTO `book_web_log_001` VALUES (106, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/user/index.html?ktype=&kword=', 'admin', 'User', 'index', 'GET', 'a:2:{s:5:\"ktype\";s:0:\"\";s:5:\"kword\";s:0:\"\";}', 1519978740);
INSERT INTO `book_web_log_001` VALUES (107, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/user/index.html?ktype=&kword=', 'admin', 'User', 'index', 'GET', 'a:2:{s:5:\"ktype\";s:0:\"\";s:5:\"kword\";s:0:\"\";}', 1519978968);
INSERT INTO `book_web_log_001` VALUES (108, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/user/index?ktype=4&kword=', 'admin', 'User', 'index', 'GET', 'a:2:{s:5:\"ktype\";s:1:\"4\";s:5:\"kword\";s:0:\"\";}', 1519978979);
INSERT INTO `book_web_log_001` VALUES (109, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/user/index?ktype=4&kword=', 'admin', 'User', 'index', 'GET', 'a:2:{s:5:\"ktype\";s:1:\"4\";s:5:\"kword\";s:0:\"\";}', 1519978989);
INSERT INTO `book_web_log_001` VALUES (110, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', 1519980624);
INSERT INTO `book_web_log_001` VALUES (111, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1519980666);
INSERT INTO `book_web_log_001` VALUES (112, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1519980667);
INSERT INTO `book_web_log_001` VALUES (113, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1519980667);
INSERT INTO `book_web_log_001` VALUES (114, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/add?pid=1', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:\"pid\";s:1:\"1\";}', 1519980670);
INSERT INTO `book_web_log_001` VALUES (115, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/add', 'admin', 'AdminNode', 'add', 'POST', 'a:9:{s:2:\"id\";s:0:\"\";s:3:\"pid\";s:1:\"1\";s:5:\"level\";s:1:\"2\";s:8:\"group_id\";s:1:\"4\";s:5:\"title\";s:12:\"商品分类\";s:4:\"name\";s:10:\"Admin/type\";s:4:\"type\";s:1:\"1\";s:4:\"sort\";s:1:\"2\";s:6:\"status\";s:1:\"1\";}', 1519980703);
INSERT INTO `book_web_log_001` VALUES (116, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1519980703);
INSERT INTO `book_web_log_001` VALUES (117, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1519980704);
INSERT INTO `book_web_log_001` VALUES (118, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1519980704);
INSERT INTO `book_web_log_001` VALUES (119, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1519980706);
INSERT INTO `book_web_log_001` VALUES (120, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1519980707);
INSERT INTO `book_web_log_001` VALUES (121, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1519985174);
INSERT INTO `book_web_log_001` VALUES (122, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1519985184);
INSERT INTO `book_web_log_001` VALUES (123, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1519985186);
INSERT INTO `book_web_log_001` VALUES (124, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1519985186);
INSERT INTO `book_web_log_001` VALUES (125, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"4\";}', 1519985281);
INSERT INTO `book_web_log_001` VALUES (126, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1519985294);
INSERT INTO `book_web_log_001` VALUES (127, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/edit?id=3', 'admin', 'AdminNode', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"3\";}', 1519985298);
INSERT INTO `book_web_log_001` VALUES (128, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"4\";}', 1519985305);
INSERT INTO `book_web_log_001` VALUES (129, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/edit?id=64', 'admin', 'AdminNode', 'edit', 'GET', 'a:1:{s:2:\"id\";s:2:\"64\";}', 1519985309);
INSERT INTO `book_web_log_001` VALUES (130, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1519985315);
INSERT INTO `book_web_log_001` VALUES (131, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1519985322);
INSERT INTO `book_web_log_001` VALUES (132, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1520215095);
INSERT INTO `book_web_log_001` VALUES (133, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1520215096);
INSERT INTO `book_web_log_001` VALUES (134, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:4:{s:7:\"account\";s:5:\"admin\";s:8:\"password\";s:6:\"123456\";s:7:\"captcha\";s:4:\"euti\";s:6:\"online\";s:1:\"1\";}', 1520215104);
INSERT INTO `book_web_log_001` VALUES (135, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1520215105);
INSERT INTO `book_web_log_001` VALUES (136, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1520215105);
INSERT INTO `book_web_log_001` VALUES (137, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', 1520215118);
INSERT INTO `book_web_log_001` VALUES (138, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520215121);
INSERT INTO `book_web_log_001` VALUES (139, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/add.html', 'admin', 'Type', 'add', 'GET', 'a:0:{}', 1520215130);
INSERT INTO `book_web_log_001` VALUES (140, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520216856);
INSERT INTO `book_web_log_001` VALUES (141, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520216879);
INSERT INTO `book_web_log_001` VALUES (142, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520217150);
INSERT INTO `book_web_log_001` VALUES (143, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520217315);
INSERT INTO `book_web_log_001` VALUES (144, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/add.html', 'admin', 'Type', 'add', 'GET', 'a:0:{}', 1520217330);
INSERT INTO `book_web_log_001` VALUES (145, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/add.html', 'admin', 'Type', 'add', 'GET', 'a:0:{}', 1520217349);
INSERT INTO `book_web_log_001` VALUES (146, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/add.html', 'admin', 'Type', 'add', 'GET', 'a:0:{}', 1520217373);
INSERT INTO `book_web_log_001` VALUES (147, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/add.html', 'admin', 'Type', 'add', 'GET', 'a:0:{}', 1520217386);
INSERT INTO `book_web_log_001` VALUES (148, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/add.html', 'admin', 'Type', 'add', 'GET', 'a:0:{}', 1520217402);
INSERT INTO `book_web_log_001` VALUES (149, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/add.html', 'admin', 'Type', 'add', 'GET', 'a:0:{}', 1520217431);
INSERT INTO `book_web_log_001` VALUES (150, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/add.html', 'admin', 'Type', 'add', 'POST', 'a:5:{s:2:\"id\";s:0:\"\";s:5:\"title\";s:6:\"文学\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:25:\"文学类型-浮生六记\";}', 1520219191);
INSERT INTO `book_web_log_001` VALUES (151, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520219192);
INSERT INTO `book_web_log_001` VALUES (152, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520219335);
INSERT INTO `book_web_log_001` VALUES (153, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/add.html', 'admin', 'Type', 'add', 'GET', 'a:0:{}', 1520219337);
INSERT INTO `book_web_log_001` VALUES (154, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/add.html', 'admin', 'Type', 'add', 'POST', 'a:5:{s:2:\"id\";s:0:\"\";s:5:\"title\";s:6:\"小说\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:43:\"小说-东野圭吾，阿加莎，小王子\";}', 1520219385);
INSERT INTO `book_web_log_001` VALUES (155, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520219385);
INSERT INTO `book_web_log_001` VALUES (156, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/index/_sort/asc/_order/id.html', 'admin', 'Type', 'index', 'GET', 'a:2:{s:5:\"_sort\";s:3:\"asc\";s:6:\"_order\";s:2:\"id\";}', 1520219389);
INSERT INTO `book_web_log_001` VALUES (157, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520219415);
INSERT INTO `book_web_log_001` VALUES (158, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520219443);
INSERT INTO `book_web_log_001` VALUES (159, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/add.html', 'admin', 'Type', 'add', 'GET', 'a:0:{}', 1520219608);
INSERT INTO `book_web_log_001` VALUES (160, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', 1520219687);
INSERT INTO `book_web_log_001` VALUES (161, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_role/add.html', 'admin', 'AdminRole', 'add', 'GET', 'a:0:{}', 1520219688);
INSERT INTO `book_web_log_001` VALUES (162, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_role/add.html', 'admin', 'AdminRole', 'add', 'GET', 'a:0:{}', 1520219699);
INSERT INTO `book_web_log_001` VALUES (163, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_role/add.html', 'admin', 'AdminRole', 'add', 'GET', 'a:0:{}', 1520219703);
INSERT INTO `book_web_log_001` VALUES (164, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_role/add.html', 'admin', 'AdminRole', 'add', 'POST', 'a:4:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:9:\"管理员\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:33:\"管理商品分类，商品信息\";}', 1520219790);
INSERT INTO `book_web_log_001` VALUES (165, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', 1520219791);
INSERT INTO `book_web_log_001` VALUES (166, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_role/user/id/3.html', 'admin', 'AdminRole', 'user', 'GET', 'a:1:{s:2:\"id\";s:1:\"3\";}', 1520219795);
INSERT INTO `book_web_log_001` VALUES (167, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_role/add.html', 'admin', 'AdminRole', 'add', 'GET', 'a:0:{}', 1520219825);
INSERT INTO `book_web_log_001` VALUES (168, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520220168);
INSERT INTO `book_web_log_001` VALUES (169, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520220170);
INSERT INTO `book_web_log_001` VALUES (170, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520220170);
INSERT INTO `book_web_log_001` VALUES (171, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520220170);
INSERT INTO `book_web_log_001` VALUES (172, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520220171);
INSERT INTO `book_web_log_001` VALUES (173, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520220171);
INSERT INTO `book_web_log_001` VALUES (174, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520220171);
INSERT INTO `book_web_log_001` VALUES (175, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1520220173);
INSERT INTO `book_web_log_001` VALUES (176, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1520220173);
INSERT INTO `book_web_log_001` VALUES (177, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520220175);
INSERT INTO `book_web_log_001` VALUES (178, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520220176);
INSERT INTO `book_web_log_001` VALUES (179, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/add.html', 'admin', 'Type', 'add', 'GET', 'a:0:{}', 1520220184);
INSERT INTO `book_web_log_001` VALUES (180, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/add.html', 'admin', 'Type', 'add', 'POST', 'a:5:{s:2:\"id\";s:0:\"\";s:5:\"title\";s:6:\"历史\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:19:\"历史-未来简史\";}', 1520220204);
INSERT INTO `book_web_log_001` VALUES (181, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520220205);
INSERT INTO `book_web_log_001` VALUES (182, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/edit/id/3.html', 'admin', 'Type', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"3\";}', 1520220213);
INSERT INTO `book_web_log_001` VALUES (183, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/edit/id/3.html', 'admin', 'Type', 'edit', 'POST', 'a:5:{s:2:\"id\";s:1:\"3\";s:5:\"title\";s:6:\"历史\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:19:\"历史-未来简史\";}', 1520220215);
INSERT INTO `book_web_log_001` VALUES (184, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520220215);
INSERT INTO `book_web_log_001` VALUES (185, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520220711);
INSERT INTO `book_web_log_001` VALUES (186, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/add.html', 'admin', 'Type', 'add', 'GET', 'a:0:{}', 1520220720);
INSERT INTO `book_web_log_001` VALUES (187, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1520220978);
INSERT INTO `book_web_log_001` VALUES (188, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1520220978);
INSERT INTO `book_web_log_001` VALUES (189, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1520300381);
INSERT INTO `book_web_log_001` VALUES (190, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1520300386);
INSERT INTO `book_web_log_001` VALUES (191, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520300393);
INSERT INTO `book_web_log_001` VALUES (192, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520305843);
INSERT INTO `book_web_log_001` VALUES (193, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/add.html', 'admin', 'Type', 'add', 'GET', 'a:0:{}', 1520305847);
INSERT INTO `book_web_log_001` VALUES (194, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1520306160);
INSERT INTO `book_web_log_001` VALUES (195, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1520306160);
INSERT INTO `book_web_log_001` VALUES (196, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520306245);
INSERT INTO `book_web_log_001` VALUES (197, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/add.html', 'admin', 'Type', 'add', 'GET', 'a:0:{}', 1520306738);
INSERT INTO `book_web_log_001` VALUES (198, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520306744);
INSERT INTO `book_web_log_001` VALUES (199, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/add.html', 'admin', 'Type', 'add', 'GET', 'a:0:{}', 1520306749);
INSERT INTO `book_web_log_001` VALUES (200, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/add.html', 'admin', 'Type', 'add', 'POST', 'a:5:{s:2:\"id\";s:0:\"\";s:5:\"title\";s:6:\"科幻\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:6:\"科幻\";}', 1520306762);
INSERT INTO `book_web_log_001` VALUES (201, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520306762);
INSERT INTO `book_web_log_001` VALUES (202, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520319858);
INSERT INTO `book_web_log_001` VALUES (203, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520320237);
INSERT INTO `book_web_log_001` VALUES (204, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/add.html', 'admin', 'Type', 'add', 'GET', 'a:0:{}', 1520320244);
INSERT INTO `book_web_log_001` VALUES (205, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/add.html', 'admin', 'Type', 'add', 'POST', 'a:5:{s:2:\"id\";s:0:\"\";s:5:\"title\";s:6:\"儿童\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:6:\"儿童\";}', 1520320254);
INSERT INTO `book_web_log_001` VALUES (206, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520320254);
INSERT INTO `book_web_log_001` VALUES (207, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', 1520320291);
INSERT INTO `book_web_log_001` VALUES (208, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_role/add.html', 'admin', 'AdminRole', 'add', 'GET', 'a:0:{}', 1520320294);
INSERT INTO `book_web_log_001` VALUES (209, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_role/add.html', 'admin', 'AdminRole', 'add', 'GET', 'a:0:{}', 1520320454);
INSERT INTO `book_web_log_001` VALUES (210, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520320459);
INSERT INTO `book_web_log_001` VALUES (211, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520320459);
INSERT INTO `book_web_log_001` VALUES (212, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/add.html', 'admin', 'Type', 'add', 'GET', 'a:0:{}', 1520320462);
INSERT INTO `book_web_log_001` VALUES (213, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/add.html', 'admin', 'Type', 'add', 'GET', 'a:0:{}', 1520320540);
INSERT INTO `book_web_log_001` VALUES (214, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520320594);
INSERT INTO `book_web_log_001` VALUES (215, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/edit/id/5.html', 'admin', 'Type', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"5\";}', 1520320596);
INSERT INTO `book_web_log_001` VALUES (216, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/edit/id/5.html', 'admin', 'Type', 'edit', 'POST', 'a:5:{s:2:\"id\";s:1:\"5\";s:5:\"title\";s:6:\"儿童\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:6:\"儿童\";}', 1520320598);
INSERT INTO `book_web_log_001` VALUES (217, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520320598);
INSERT INTO `book_web_log_001` VALUES (218, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/add.html', 'admin', 'Type', 'add', 'GET', 'a:0:{}', 1520320635);
INSERT INTO `book_web_log_001` VALUES (219, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/add.html', 'admin', 'Type', 'add', 'POST', 'a:5:{s:2:\"id\";s:0:\"\";s:5:\"title\";s:6:\"生活\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:6:\"生活\";}', 1520320644);
INSERT INTO `book_web_log_001` VALUES (220, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520320645);
INSERT INTO `book_web_log_001` VALUES (221, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/forbid.html', 'admin', 'Type', 'forbid', 'POST', 'a:1:{s:2:\"id\";s:0:\"\";}', 1520320746);
INSERT INTO `book_web_log_001` VALUES (222, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520320746);
INSERT INTO `book_web_log_001` VALUES (223, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/resume.html', 'admin', 'Type', 'resume', 'POST', 'a:1:{s:2:\"id\";s:0:\"\";}', 1520320751);
INSERT INTO `book_web_log_001` VALUES (224, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520320751);
INSERT INTO `book_web_log_001` VALUES (225, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/resume.html', 'admin', 'Type', 'resume', 'POST', 'a:1:{s:2:\"id\";s:1:\"6\";}', 1520320758);
INSERT INTO `book_web_log_001` VALUES (226, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520320758);
INSERT INTO `book_web_log_001` VALUES (227, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/forbid.html', 'admin', 'Type', 'forbid', 'POST', 'a:1:{s:2:\"id\";s:1:\"6\";}', 1520320762);
INSERT INTO `book_web_log_001` VALUES (228, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520320762);
INSERT INTO `book_web_log_001` VALUES (229, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/resume.html', 'admin', 'Type', 'resume', 'POST', 'a:1:{s:2:\"id\";s:1:\"6\";}', 1520320767);
INSERT INTO `book_web_log_001` VALUES (230, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520320767);
INSERT INTO `book_web_log_001` VALUES (231, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520320806);
INSERT INTO `book_web_log_001` VALUES (232, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/edit/id/6.html', 'admin', 'Type', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"6\";}', 1520320815);
INSERT INTO `book_web_log_001` VALUES (233, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520320969);
INSERT INTO `book_web_log_001` VALUES (234, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1520321512);
INSERT INTO `book_web_log_001` VALUES (235, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1520321513);
INSERT INTO `book_web_log_001` VALUES (236, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1520321513);
INSERT INTO `book_web_log_001` VALUES (237, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1520321513);
INSERT INTO `book_web_log_001` VALUES (238, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1520321513);
INSERT INTO `book_web_log_001` VALUES (239, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1520321514);
INSERT INTO `book_web_log_001` VALUES (240, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1520321514);
INSERT INTO `book_web_log_001` VALUES (241, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1520321516);
INSERT INTO `book_web_log_001` VALUES (242, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1520321516);
INSERT INTO `book_web_log_001` VALUES (243, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520321518);
INSERT INTO `book_web_log_001` VALUES (244, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/add.html', 'admin', 'Type', 'add', 'GET', 'a:0:{}', 1520321521);
INSERT INTO `book_web_log_001` VALUES (245, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/add.html', 'admin', 'Type', 'add', 'POST', 'a:5:{s:2:\"id\";s:0:\"\";s:5:\"title\";s:6:\"育儿\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:6:\"育儿\";}', 1520321529);
INSERT INTO `book_web_log_001` VALUES (246, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520321530);
INSERT INTO `book_web_log_001` VALUES (247, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520321545);
INSERT INTO `book_web_log_001` VALUES (248, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520321546);
INSERT INTO `book_web_log_001` VALUES (249, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520322989);
INSERT INTO `book_web_log_001` VALUES (250, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', 1520324984);
INSERT INTO `book_web_log_001` VALUES (251, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520324985);
INSERT INTO `book_web_log_001` VALUES (252, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', 1520325255);
INSERT INTO `book_web_log_001` VALUES (253, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1520325256);
INSERT INTO `book_web_log_001` VALUES (254, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1520325257);
INSERT INTO `book_web_log_001` VALUES (255, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1520325257);
INSERT INTO `book_web_log_001` VALUES (256, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"4\";}', 1520325258);
INSERT INTO `book_web_log_001` VALUES (257, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/add?pid=1', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:\"pid\";s:1:\"1\";}', 1520325264);
INSERT INTO `book_web_log_001` VALUES (258, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/add', 'admin', 'AdminNode', 'add', 'POST', 'a:9:{s:2:\"id\";s:0:\"\";s:3:\"pid\";s:1:\"1\";s:5:\"level\";s:1:\"2\";s:8:\"group_id\";s:1:\"4\";s:5:\"title\";s:12:\"商品列表\";s:4:\"name\";s:7:\"Product\";s:4:\"type\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}', 1520325276);
INSERT INTO `book_web_log_001` VALUES (259, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1520325276);
INSERT INTO `book_web_log_001` VALUES (260, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1520325276);
INSERT INTO `book_web_log_001` VALUES (261, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1520325276);
INSERT INTO `book_web_log_001` VALUES (262, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1520325351);
INSERT INTO `book_web_log_001` VALUES (263, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1520325351);
INSERT INTO `book_web_log_001` VALUES (264, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1520325353);
INSERT INTO `book_web_log_001` VALUES (265, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1520325376);
INSERT INTO `book_web_log_001` VALUES (266, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1522046483);
INSERT INTO `book_web_log_001` VALUES (267, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1522046483);
INSERT INTO `book_web_log_001` VALUES (268, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:3:{s:7:\"account\";s:5:\"admin\";s:8:\"password\";s:6:\"123456\";s:7:\"captcha\";s:4:\"tiap\";}', 1522046491);
INSERT INTO `book_web_log_001` VALUES (269, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1522046491);
INSERT INTO `book_web_log_001` VALUES (270, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1522046492);
INSERT INTO `book_web_log_001` VALUES (271, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522046496);
INSERT INTO `book_web_log_001` VALUES (272, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1522046557);
INSERT INTO `book_web_log_001` VALUES (273, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', 1522046564);
INSERT INTO `book_web_log_001` VALUES (274, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522046565);
INSERT INTO `book_web_log_001` VALUES (275, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522046568);
INSERT INTO `book_web_log_001` VALUES (276, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522046719);
INSERT INTO `book_web_log_001` VALUES (277, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522046720);
INSERT INTO `book_web_log_001` VALUES (278, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522046798);
INSERT INTO `book_web_log_001` VALUES (279, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/generate/index.html', 'admin', 'Generate', 'index', 'GET', 'a:0:{}', 1522046808);
INSERT INTO `book_web_log_001` VALUES (280, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/generate/index.html?table=book_order', 'admin', 'Generate', 'index', 'GET', 'a:1:{s:5:\"table\";s:10:\"book_order\";}', 1522046815);
INSERT INTO `book_web_log_001` VALUES (281, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/generate/run.html', 'admin', 'Generate', 'run', 'POST', 'a:6:{s:4:\"file\";s:3:\"all\";s:6:\"module\";s:5:\"admin\";s:10:\"controller\";s:5:\"Order\";s:5:\"title\";s:0:\"\";s:4:\"form\";a:16:{i:1;a:7:{s:5:\"title\";s:0:\"\";s:4:\"name\";s:8:\"order_id\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:2;a:7:{s:5:\"title\";s:0:\"\";s:4:\"name\";s:7:\"user_id\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:3;a:7:{s:5:\"title\";s:0:\"\";s:4:\"name\";s:8:\"username\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:4;a:7:{s:5:\"title\";s:0:\"\";s:4:\"name\";s:8:\"pay_real\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:5;a:7:{s:5:\"title\";s:0:\"\";s:4:\"name\";s:9:\"pay_amout\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:6;a:7:{s:5:\"title\";s:0:\"\";s:4:\"name\";s:12:\"preferential\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:7;a:7:{s:5:\"title\";s:0:\"\";s:4:\"name\";s:12:\"pay_channels\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:8;a:7:{s:5:\"title\";s:0:\"\";s:4:\"name\";s:11:\"pay_account\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:9;a:7:{s:5:\"title\";s:0:\"\";s:4:\"name\";s:14:\"shroff_account\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:10;a:7:{s:5:\"title\";s:0:\"\";s:4:\"name\";s:6:\"source\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:11;a:7:{s:5:\"title\";s:0:\"\";s:4:\"name\";s:8:\"pay_time\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:12;a:7:{s:5:\"title\";s:0:\"\";s:4:\"name\";s:11:\"orderstatus\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:13;a:7:{s:5:\"title\";s:0:\"\";s:4:\"name\";s:4:\"desc\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:14;a:7:{s:5:\"title\";s:0:\"\";s:4:\"name\";s:11:\"create_time\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:15;a:7:{s:5:\"title\";s:0:\"\";s:4:\"name\";s:9:\"is_delete\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:16;a:7:{s:5:\"title\";s:0:\"\";s:4:\"name\";s:9:\"is_online\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}}s:4:\"menu\";a:6:{i:0;s:3:\"add\";i:1;s:6:\"forbid\";i:2;s:6:\"resume\";i:3;s:6:\"delete\";i:4;s:10:\"recycleBin\";i:5;s:9:\"saveOrder\";}}', 1522046835);
INSERT INTO `book_web_log_001` VALUES (282, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1522046838);
INSERT INTO `book_web_log_001` VALUES (283, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1522046838);
INSERT INTO `book_web_log_001` VALUES (284, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1522046922);
INSERT INTO `book_web_log_001` VALUES (285, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1522046922);
INSERT INTO `book_web_log_001` VALUES (286, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1522046926);
INSERT INTO `book_web_log_001` VALUES (287, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1522046927);
INSERT INTO `book_web_log_001` VALUES (288, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1522046927);
INSERT INTO `book_web_log_001` VALUES (289, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/add?pid=1', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:\"pid\";s:1:\"1\";}', 1522046936);
INSERT INTO `book_web_log_001` VALUES (290, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/add', 'admin', 'AdminNode', 'add', 'POST', 'a:9:{s:2:\"id\";s:0:\"\";s:3:\"pid\";s:1:\"1\";s:5:\"level\";s:1:\"2\";s:8:\"group_id\";s:1:\"4\";s:5:\"title\";s:6:\"订单\";s:4:\"name\";s:5:\"order\";s:4:\"type\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}', 1522046951);
INSERT INTO `book_web_log_001` VALUES (291, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1522046951);
INSERT INTO `book_web_log_001` VALUES (292, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1522046951);
INSERT INTO `book_web_log_001` VALUES (293, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1522046951);
INSERT INTO `book_web_log_001` VALUES (294, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1522046952);
INSERT INTO `book_web_log_001` VALUES (295, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1522046952);
INSERT INTO `book_web_log_001` VALUES (296, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522046954);
INSERT INTO `book_web_log_001` VALUES (297, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1522047001);
INSERT INTO `book_web_log_001` VALUES (298, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1522047001);
INSERT INTO `book_web_log_001` VALUES (299, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1522047001);
INSERT INTO `book_web_log_001` VALUES (300, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"4\";}', 1522047007);
INSERT INTO `book_web_log_001` VALUES (301, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/edit?id=66', 'admin', 'AdminNode', 'edit', 'GET', 'a:1:{s:2:\"id\";s:2:\"66\";}', 1522047010);
INSERT INTO `book_web_log_001` VALUES (302, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/edit', 'admin', 'AdminNode', 'edit', 'POST', 'a:9:{s:2:\"id\";s:2:\"66\";s:3:\"pid\";s:1:\"1\";s:5:\"level\";s:1:\"2\";s:8:\"group_id\";s:1:\"4\";s:5:\"title\";s:12:\"订单列表\";s:4:\"name\";s:5:\"order\";s:4:\"type\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}', 1522047015);
INSERT INTO `book_web_log_001` VALUES (303, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1522047016);
INSERT INTO `book_web_log_001` VALUES (304, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1522047016);
INSERT INTO `book_web_log_001` VALUES (305, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"4\";}', 1522047016);
INSERT INTO `book_web_log_001` VALUES (306, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1522047020);
INSERT INTO `book_web_log_001` VALUES (307, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1522047020);
INSERT INTO `book_web_log_001` VALUES (308, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522047022);
INSERT INTO `book_web_log_001` VALUES (309, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522047026);
INSERT INTO `book_web_log_001` VALUES (310, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522047408);
INSERT INTO `book_web_log_001` VALUES (311, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522047411);
INSERT INTO `book_web_log_001` VALUES (312, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522047412);
INSERT INTO `book_web_log_001` VALUES (313, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522047496);
INSERT INTO `book_web_log_001` VALUES (314, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522047497);
INSERT INTO `book_web_log_001` VALUES (315, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522047498);
INSERT INTO `book_web_log_001` VALUES (316, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522047528);
INSERT INTO `book_web_log_001` VALUES (317, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1522047529);
INSERT INTO `book_web_log_001` VALUES (318, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1522047529);
INSERT INTO `book_web_log_001` VALUES (319, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1522047529);
INSERT INTO `book_web_log_001` VALUES (320, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1522047530);
INSERT INTO `book_web_log_001` VALUES (321, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522047531);
INSERT INTO `book_web_log_001` VALUES (322, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522047541);
INSERT INTO `book_web_log_001` VALUES (323, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522047544);
INSERT INTO `book_web_log_001` VALUES (324, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522047803);
INSERT INTO `book_web_log_001` VALUES (325, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522047806);
INSERT INTO `book_web_log_001` VALUES (326, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522047807);
INSERT INTO `book_web_log_001` VALUES (327, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522047810);
INSERT INTO `book_web_log_001` VALUES (328, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522047813);
INSERT INTO `book_web_log_001` VALUES (329, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522047815);
INSERT INTO `book_web_log_001` VALUES (330, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522047826);
INSERT INTO `book_web_log_001` VALUES (331, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522047892);
INSERT INTO `book_web_log_001` VALUES (332, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522047902);
INSERT INTO `book_web_log_001` VALUES (333, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522047928);
INSERT INTO `book_web_log_001` VALUES (334, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'POST', 'a:11:{s:2:\"id\";s:0:\"\";s:5:\"title\";s:12:\"东野圭吾\";s:5:\"price\";s:3:\"100\";s:10:\"sale_price\";s:1:\"0\";s:9:\"inventory\";s:3:\"100\";s:7:\"soldnum\";s:3:\"100\";s:8:\"clicknum\";s:2:\"10\";s:4:\"type\";s:1:\"4\";s:3:\"img\";s:0:\"\";s:11:\"description\";s:0:\"\";s:6:\"status\";s:1:\"1\";}', 1522048559);
INSERT INTO `book_web_log_001` VALUES (335, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522048560);
INSERT INTO `book_web_log_001` VALUES (336, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'POST', 'a:11:{s:2:\"id\";s:0:\"\";s:5:\"title\";s:9:\"阿加莎\";s:5:\"price\";s:1:\"1\";s:10:\"sale_price\";s:1:\"2\";s:9:\"inventory\";s:1:\"3\";s:7:\"soldnum\";s:1:\"4\";s:8:\"clicknum\";s:1:\"5\";s:4:\"type\";s:1:\"1\";s:3:\"img\";s:1:\"1\";s:11:\"description\";s:5:\"11111\";s:6:\"status\";s:1:\"1\";}', 1522048709);
INSERT INTO `book_web_log_001` VALUES (337, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522048709);
INSERT INTO `book_web_log_001` VALUES (338, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522048955);
INSERT INTO `book_web_log_001` VALUES (339, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'POST', 'a:11:{s:2:\"id\";s:0:\"\";s:5:\"title\";s:9:\"白夜行\";s:5:\"price\";s:4:\"23.5\";s:10:\"sale_price\";s:4:\"20.8\";s:9:\"inventory\";s:3:\"100\";s:7:\"soldnum\";s:2:\"80\";s:8:\"clicknum\";s:2:\"50\";s:4:\"type\";s:1:\"2\";s:3:\"img\";s:0:\"\";s:11:\"description\";s:9:\"发发发\";s:6:\"status\";s:1:\"1\";}', 1522049000);
INSERT INTO `book_web_log_001` VALUES (340, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522049000);
INSERT INTO `book_web_log_001` VALUES (341, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522049142);
INSERT INTO `book_web_log_001` VALUES (342, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522049456);
INSERT INTO `book_web_log_001` VALUES (343, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index/_sort/asc/_order/id.html', 'admin', 'Product', 'index', 'GET', 'a:2:{s:5:\"_sort\";s:3:\"asc\";s:6:\"_order\";s:2:\"id\";}', 1522049464);
INSERT INTO `book_web_log_001` VALUES (344, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index/_sort/desc/_order/id.html', 'admin', 'Product', 'index', 'GET', 'a:2:{s:5:\"_sort\";s:4:\"desc\";s:6:\"_order\";s:2:\"id\";}', 1522049465);
INSERT INTO `book_web_log_001` VALUES (345, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index/_sort/asc/_order/id.html', 'admin', 'Product', 'index', 'GET', 'a:2:{s:5:\"_sort\";s:3:\"asc\";s:6:\"_order\";s:2:\"id\";}', 1522049466);
INSERT INTO `book_web_log_001` VALUES (346, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index/_sort/desc/_order/id.html', 'admin', 'Product', 'index', 'GET', 'a:2:{s:5:\"_sort\";s:4:\"desc\";s:6:\"_order\";s:2:\"id\";}', 1522049467);
INSERT INTO `book_web_log_001` VALUES (347, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522051317);
INSERT INTO `book_web_log_001` VALUES (348, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522052904);
INSERT INTO `book_web_log_001` VALUES (349, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522052913);
INSERT INTO `book_web_log_001` VALUES (350, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522053183);
INSERT INTO `book_web_log_001` VALUES (351, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522053275);
INSERT INTO `book_web_log_001` VALUES (352, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522053299);
INSERT INTO `book_web_log_001` VALUES (353, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522053444);
INSERT INTO `book_web_log_001` VALUES (354, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522053458);
INSERT INTO `book_web_log_001` VALUES (355, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/forbid/id/8.html', 'admin', 'Product', 'forbid', 'POST', 'a:1:{s:2:\"id\";s:1:\"8\";}', 1522053468);
INSERT INTO `book_web_log_001` VALUES (356, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/resume/id/8.html', 'admin', 'Product', 'resume', 'POST', 'a:1:{s:2:\"id\";s:1:\"8\";}', 1522053472);
INSERT INTO `book_web_log_001` VALUES (357, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522053579);
INSERT INTO `book_web_log_001` VALUES (358, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/delete.html', 'admin', 'Product', 'delete', 'POST', 'a:1:{s:2:\"id\";s:1:\"8\";}', 1522053582);
INSERT INTO `book_web_log_001` VALUES (359, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522053643);
INSERT INTO `book_web_log_001` VALUES (360, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/delete.html', 'admin', 'Product', 'delete', 'POST', 'a:1:{s:2:\"id\";s:0:\"\";}', 1522053650);
INSERT INTO `book_web_log_001` VALUES (361, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522053650);
INSERT INTO `book_web_log_001` VALUES (362, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522053746);
INSERT INTO `book_web_log_001` VALUES (363, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522054154);
INSERT INTO `book_web_log_001` VALUES (364, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522054169);
INSERT INTO `book_web_log_001` VALUES (365, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522054325);
INSERT INTO `book_web_log_001` VALUES (366, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522054403);
INSERT INTO `book_web_log_001` VALUES (367, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522056415);
INSERT INTO `book_web_log_001` VALUES (368, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522056450);
INSERT INTO `book_web_log_001` VALUES (369, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522056454);
INSERT INTO `book_web_log_001` VALUES (370, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522056456);
INSERT INTO `book_web_log_001` VALUES (371, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522057560);
INSERT INTO `book_web_log_001` VALUES (372, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522059271);
INSERT INTO `book_web_log_001` VALUES (373, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522059368);
INSERT INTO `book_web_log_001` VALUES (374, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522059485);
INSERT INTO `book_web_log_001` VALUES (375, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/edit/id/8.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"8\";}', 1522059487);
INSERT INTO `book_web_log_001` VALUES (376, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522059597);
INSERT INTO `book_web_log_001` VALUES (377, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522059599);
INSERT INTO `book_web_log_001` VALUES (378, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/edit/id/8.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"8\";}', 1522059600);
INSERT INTO `book_web_log_001` VALUES (379, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522059777);
INSERT INTO `book_web_log_001` VALUES (380, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522059868);
INSERT INTO `book_web_log_001` VALUES (381, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/edit/id/8.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"8\";}', 1522059870);
INSERT INTO `book_web_log_001` VALUES (382, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/edit/id/7.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"7\";}', 1522059875);
INSERT INTO `book_web_log_001` VALUES (383, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/edit/id/6.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"6\";}', 1522059879);
INSERT INTO `book_web_log_001` VALUES (384, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522059921);
INSERT INTO `book_web_log_001` VALUES (385, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/edit/id/7.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"7\";}', 1522059925);
INSERT INTO `book_web_log_001` VALUES (386, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/edit/id/7.html', 'admin', 'Product', 'edit', 'POST', 'a:11:{s:2:\"id\";s:1:\"7\";s:5:\"title\";s:9:\"阿加莎\";s:5:\"price\";s:5:\"18.00\";s:10:\"sale_price\";s:4:\"2.00\";s:9:\"inventory\";s:1:\"3\";s:7:\"soldnum\";s:1:\"4\";s:8:\"clicknum\";s:1:\"5\";s:4:\"type\";s:1:\"1\";s:3:\"img\";s:0:\"\";s:11:\"description\";s:5:\"11111\";s:6:\"status\";s:1:\"1\";}', 1522059932);
INSERT INTO `book_web_log_001` VALUES (387, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522059932);
INSERT INTO `book_web_log_001` VALUES (388, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/edit/id/7.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"7\";}', 1522059937);
INSERT INTO `book_web_log_001` VALUES (389, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522059959);
INSERT INTO `book_web_log_001` VALUES (390, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522059963);
INSERT INTO `book_web_log_001` VALUES (391, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522059964);
INSERT INTO `book_web_log_001` VALUES (392, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522059997);
INSERT INTO `book_web_log_001` VALUES (393, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522060345);
INSERT INTO `book_web_log_001` VALUES (394, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522060469);
INSERT INTO `book_web_log_001` VALUES (395, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522060720);
INSERT INTO `book_web_log_001` VALUES (396, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522060722);
INSERT INTO `book_web_log_001` VALUES (397, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522060745);
INSERT INTO `book_web_log_001` VALUES (398, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522060785);
INSERT INTO `book_web_log_001` VALUES (399, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522060786);
INSERT INTO `book_web_log_001` VALUES (400, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522061260);
INSERT INTO `book_web_log_001` VALUES (401, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522061263);
INSERT INTO `book_web_log_001` VALUES (402, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1522061264);
INSERT INTO `book_web_log_001` VALUES (403, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', 1522061265);
INSERT INTO `book_web_log_001` VALUES (404, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1522061273);
INSERT INTO `book_web_log_001` VALUES (405, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522061275);
INSERT INTO `book_web_log_001` VALUES (406, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522061276);
INSERT INTO `book_web_log_001` VALUES (407, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1522061277);
INSERT INTO `book_web_log_001` VALUES (408, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522061280);
INSERT INTO `book_web_log_001` VALUES (409, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522061280);
INSERT INTO `book_web_log_001` VALUES (410, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1522061281);
INSERT INTO `book_web_log_001` VALUES (411, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522061281);
INSERT INTO `book_web_log_001` VALUES (412, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522061282);
INSERT INTO `book_web_log_001` VALUES (413, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522061283);
INSERT INTO `book_web_log_001` VALUES (414, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1522061283);
INSERT INTO `book_web_log_001` VALUES (415, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522061283);
INSERT INTO `book_web_log_001` VALUES (416, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522061284);
INSERT INTO `book_web_log_001` VALUES (417, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522061359);
INSERT INTO `book_web_log_001` VALUES (418, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1522061360);
INSERT INTO `book_web_log_001` VALUES (419, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', 1522061361);
INSERT INTO `book_web_log_001` VALUES (420, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522061364);
INSERT INTO `book_web_log_001` VALUES (421, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522116261);
INSERT INTO `book_web_log_001` VALUES (422, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522116261);
INSERT INTO `book_web_log_001` VALUES (423, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/pub/login.html?callback=http%3A%2F%2Fwww.tpadmin.com%2Fadmin%2Fproduct%2Fadd.html', 'admin', 'Pub', 'login', 'GET', 'a:1:{s:8:\"callback\";s:45:\"http://www.tpadmin.com/admin/product/add.html\";}', 1522116261);
INSERT INTO `book_web_log_001` VALUES (424, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1522116273);
INSERT INTO `book_web_log_001` VALUES (425, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1522116274);
INSERT INTO `book_web_log_001` VALUES (426, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:3:{s:7:\"account\";s:5:\"admin\";s:8:\"password\";s:6:\"123456\";s:7:\"captcha\";s:4:\"sxex\";}', 1522118875);
INSERT INTO `book_web_log_001` VALUES (427, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:3:{s:7:\"account\";s:5:\"admin\";s:8:\"password\";s:6:\"123456\";s:7:\"captcha\";s:4:\"rv8v\";}', 1522118882);
INSERT INTO `book_web_log_001` VALUES (428, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522118958);
INSERT INTO `book_web_log_001` VALUES (429, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522119559);
INSERT INTO `book_web_log_001` VALUES (430, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522119725);
INSERT INTO `book_web_log_001` VALUES (431, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1522119741);
INSERT INTO `book_web_log_001` VALUES (432, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1522119741);
INSERT INTO `book_web_log_001` VALUES (433, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1522119742);
INSERT INTO `book_web_log_001` VALUES (434, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522119747);
INSERT INTO `book_web_log_001` VALUES (435, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522119750);
INSERT INTO `book_web_log_001` VALUES (436, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522119751);
INSERT INTO `book_web_log_001` VALUES (437, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522119755);
INSERT INTO `book_web_log_001` VALUES (438, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/edit/id/8.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"8\";}', 1522119759);
INSERT INTO `book_web_log_001` VALUES (439, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/edit/id/8.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"8\";}', 1522119769);
INSERT INTO `book_web_log_001` VALUES (440, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522119820);
INSERT INTO `book_web_log_001` VALUES (441, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'POST', 'a:11:{s:2:\"id\";s:0:\"\";s:5:\"title\";s:12:\"麒麟之翼\";s:5:\"price\";s:4:\"26.8\";s:10:\"sale_price\";s:1:\"0\";s:9:\"inventory\";s:2:\"88\";s:7:\"soldnum\";s:2:\"10\";s:8:\"clicknum\";s:2:\"10\";s:4:\"type\";s:1:\"2\";s:3:\"img\";s:0:\"\";s:11:\"description\";s:12:\"东野圭吾\";s:6:\"status\";s:1:\"1\";}', 1522119859);
INSERT INTO `book_web_log_001` VALUES (442, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522119860);
INSERT INTO `book_web_log_001` VALUES (443, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522119870);
INSERT INTO `book_web_log_001` VALUES (444, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522119884);
INSERT INTO `book_web_log_001` VALUES (445, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522119886);
INSERT INTO `book_web_log_001` VALUES (446, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/edit/id/9.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"9\";}', 1522119906);
INSERT INTO `book_web_log_001` VALUES (447, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522119922);
INSERT INTO `book_web_log_001` VALUES (448, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1522119927);
INSERT INTO `book_web_log_001` VALUES (449, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1522119932);
INSERT INTO `book_web_log_001` VALUES (450, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1522120037);
INSERT INTO `book_web_log_001` VALUES (451, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1522120037);
INSERT INTO `book_web_log_001` VALUES (452, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1522120137);
INSERT INTO `book_web_log_001` VALUES (453, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1522120137);
INSERT INTO `book_web_log_001` VALUES (454, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522120234);
INSERT INTO `book_web_log_001` VALUES (455, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1522120297);
INSERT INTO `book_web_log_001` VALUES (456, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1522120297);
INSERT INTO `book_web_log_001` VALUES (457, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1522120309);
INSERT INTO `book_web_log_001` VALUES (458, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1522120309);
INSERT INTO `book_web_log_001` VALUES (459, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522120318);
INSERT INTO `book_web_log_001` VALUES (460, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522120324);
INSERT INTO `book_web_log_001` VALUES (461, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522120327);
INSERT INTO `book_web_log_001` VALUES (462, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522120331);
INSERT INTO `book_web_log_001` VALUES (463, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', 1522120334);
INSERT INTO `book_web_log_001` VALUES (464, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522120338);
INSERT INTO `book_web_log_001` VALUES (465, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1522120339);
INSERT INTO `book_web_log_001` VALUES (466, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522120339);
INSERT INTO `book_web_log_001` VALUES (467, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/edit/id/9.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"9\";}', 1522120346);
INSERT INTO `book_web_log_001` VALUES (468, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1522120498);
INSERT INTO `book_web_log_001` VALUES (469, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1522121058);
INSERT INTO `book_web_log_001` VALUES (470, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1522121077);
INSERT INTO `book_web_log_001` VALUES (471, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1522121082);
INSERT INTO `book_web_log_001` VALUES (472, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522121100);
INSERT INTO `book_web_log_001` VALUES (473, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/edit/id/9.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"9\";}', 1522121103);
INSERT INTO `book_web_log_001` VALUES (474, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1522121106);
INSERT INTO `book_web_log_001` VALUES (475, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1522121109);
INSERT INTO `book_web_log_001` VALUES (476, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522121156);
INSERT INTO `book_web_log_001` VALUES (477, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522121163);
INSERT INTO `book_web_log_001` VALUES (478, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522121457);
INSERT INTO `book_web_log_001` VALUES (479, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522121480);
INSERT INTO `book_web_log_001` VALUES (480, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522122078);
INSERT INTO `book_web_log_001` VALUES (481, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1522122080);
INSERT INTO `book_web_log_001` VALUES (482, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1522122084);
INSERT INTO `book_web_log_001` VALUES (483, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522131242);
INSERT INTO `book_web_log_001` VALUES (484, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522131443);
INSERT INTO `book_web_log_001` VALUES (485, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1522131446);
INSERT INTO `book_web_log_001` VALUES (486, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1522131454);
INSERT INTO `book_web_log_001` VALUES (487, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522131473);
INSERT INTO `book_web_log_001` VALUES (488, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522132463);
INSERT INTO `book_web_log_001` VALUES (489, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522132512);
INSERT INTO `book_web_log_001` VALUES (490, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522132537);
INSERT INTO `book_web_log_001` VALUES (491, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522132558);
INSERT INTO `book_web_log_001` VALUES (492, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1522132597);
INSERT INTO `book_web_log_001` VALUES (493, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1522132601);
INSERT INTO `book_web_log_001` VALUES (494, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1522132672);
INSERT INTO `book_web_log_001` VALUES (495, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1522132676);
INSERT INTO `book_web_log_001` VALUES (496, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522132826);
INSERT INTO `book_web_log_001` VALUES (497, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522132841);
INSERT INTO `book_web_log_001` VALUES (498, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522132880);
INSERT INTO `book_web_log_001` VALUES (499, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1522132884);
INSERT INTO `book_web_log_001` VALUES (500, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1522132888);
INSERT INTO `book_web_log_001` VALUES (501, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522135901);
INSERT INTO `book_web_log_001` VALUES (502, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1522135914);
INSERT INTO `book_web_log_001` VALUES (503, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1522135918);
INSERT INTO `book_web_log_001` VALUES (504, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1522136200);
INSERT INTO `book_web_log_001` VALUES (505, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522136373);
INSERT INTO `book_web_log_001` VALUES (506, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1522136380);
INSERT INTO `book_web_log_001` VALUES (507, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1522136384);
INSERT INTO `book_web_log_001` VALUES (508, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522136476);
INSERT INTO `book_web_log_001` VALUES (509, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522136478);
INSERT INTO `book_web_log_001` VALUES (510, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1522136481);
INSERT INTO `book_web_log_001` VALUES (511, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1522136485);
INSERT INTO `book_web_log_001` VALUES (512, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522136551);
INSERT INTO `book_web_log_001` VALUES (513, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522136552);
INSERT INTO `book_web_log_001` VALUES (514, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1522136554);
INSERT INTO `book_web_log_001` VALUES (515, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1522136558);
INSERT INTO `book_web_log_001` VALUES (516, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1522136752);
INSERT INTO `book_web_log_001` VALUES (517, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1522136755);
INSERT INTO `book_web_log_001` VALUES (518, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522136934);
INSERT INTO `book_web_log_001` VALUES (519, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522136937);
INSERT INTO `book_web_log_001` VALUES (520, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1522136938);
INSERT INTO `book_web_log_001` VALUES (521, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1522136943);
INSERT INTO `book_web_log_001` VALUES (522, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522136955);
INSERT INTO `book_web_log_001` VALUES (523, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522136956);
INSERT INTO `book_web_log_001` VALUES (524, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1522136957);
INSERT INTO `book_web_log_001` VALUES (525, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1522136960);
INSERT INTO `book_web_log_001` VALUES (526, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522136981);
INSERT INTO `book_web_log_001` VALUES (527, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1522136983);
INSERT INTO `book_web_log_001` VALUES (528, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1522136986);
INSERT INTO `book_web_log_001` VALUES (529, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522137109);
INSERT INTO `book_web_log_001` VALUES (530, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1522137111);
INSERT INTO `book_web_log_001` VALUES (531, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1522137114);
INSERT INTO `book_web_log_001` VALUES (532, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522137167);
INSERT INTO `book_web_log_001` VALUES (533, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522137219);
INSERT INTO `book_web_log_001` VALUES (534, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1522137259);
INSERT INTO `book_web_log_001` VALUES (535, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1522137263);
INSERT INTO `book_web_log_001` VALUES (536, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'POST', 'a:11:{s:2:\"id\";s:0:\"\";s:5:\"title\";s:6:\"毕业\";s:5:\"price\";s:4:\"18.6\";s:10:\"sale_price\";s:1:\"1\";s:9:\"inventory\";s:2:\"11\";s:7:\"soldnum\";s:0:\"\";s:8:\"clicknum\";s:0:\"\";s:4:\"type\";s:1:\"2\";s:3:\"img\";s:1:\"1\";s:11:\"description\";s:2:\"11\";s:6:\"status\";s:1:\"1\";}', 1522137283);
INSERT INTO `book_web_log_001` VALUES (537, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522137284);
INSERT INTO `book_web_log_001` VALUES (538, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522137291);
INSERT INTO `book_web_log_001` VALUES (539, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522137331);
INSERT INTO `book_web_log_001` VALUES (540, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/edit/id/10.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:2:\"10\";}', 1522137335);
INSERT INTO `book_web_log_001` VALUES (541, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522137455);
INSERT INTO `book_web_log_001` VALUES (542, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/edit/id/10.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:2:\"10\";}', 1522137457);
INSERT INTO `book_web_log_001` VALUES (543, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/edit/id/10.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:2:\"10\";}', 1522137469);
INSERT INTO `book_web_log_001` VALUES (544, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522137580);
INSERT INTO `book_web_log_001` VALUES (545, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522137594);
INSERT INTO `book_web_log_001` VALUES (546, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522138308);
INSERT INTO `book_web_log_001` VALUES (547, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1522138322);
INSERT INTO `book_web_log_001` VALUES (548, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1522138325);
INSERT INTO `book_web_log_001` VALUES (549, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522138381);
INSERT INTO `book_web_log_001` VALUES (550, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1522138383);
INSERT INTO `book_web_log_001` VALUES (551, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1522138386);
INSERT INTO `book_web_log_001` VALUES (552, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522138657);
INSERT INTO `book_web_log_001` VALUES (553, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522138707);
INSERT INTO `book_web_log_001` VALUES (554, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522138759);
INSERT INTO `book_web_log_001` VALUES (555, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522138769);
INSERT INTO `book_web_log_001` VALUES (556, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/edit/id/10.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:2:\"10\";}', 1522138771);
INSERT INTO `book_web_log_001` VALUES (557, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522138806);
INSERT INTO `book_web_log_001` VALUES (558, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522138851);
INSERT INTO `book_web_log_001` VALUES (559, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1522138857);
INSERT INTO `book_web_log_001` VALUES (560, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', 1522138857);
INSERT INTO `book_web_log_001` VALUES (561, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522138956);

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

-- ----------------------------
-- Records of book_web_log_all
-- ----------------------------
INSERT INTO `book_web_log_all` VALUES (1, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1519955509);
INSERT INTO `book_web_log_all` VALUES (2, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1519955510);
INSERT INTO `book_web_log_all` VALUES (3, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', 1519955673);
INSERT INTO `book_web_log_all` VALUES (4, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1519955675);
INSERT INTO `book_web_log_all` VALUES (5, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1519955676);
INSERT INTO `book_web_log_all` VALUES (6, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', 1519955676);
INSERT INTO `book_web_log_all` VALUES (7, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1519955676);
INSERT INTO `book_web_log_all` VALUES (8, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_user/index.html', 'admin', 'AdminUser', 'index', 'GET', 'a:0:{}', 1519955676);
INSERT INTO `book_web_log_all` VALUES (9, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/node_map/index.html', 'admin', 'NodeMap', 'index', 'GET', 'a:0:{}', 1519955677);
INSERT INTO `book_web_log_all` VALUES (10, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/web_log/index.html', 'admin', 'WebLog', 'index', 'GET', 'a:0:{}', 1519955677);
INSERT INTO `book_web_log_all` VALUES (11, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/login_log/index.html', 'admin', 'LoginLog', 'index', 'GET', 'a:0:{}', 1519955678);
INSERT INTO `book_web_log_all` VALUES (12, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/web_log/index.html', 'admin', 'WebLog', 'index', 'GET', 'a:0:{}', 1519955680);
INSERT INTO `book_web_log_all` VALUES (13, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1519955691);
INSERT INTO `book_web_log_all` VALUES (14, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1519955692);
INSERT INTO `book_web_log_all` VALUES (15, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/web_log/index.html', 'admin', 'WebLog', 'index', 'GET', 'a:0:{}', 1519955694);
INSERT INTO `book_web_log_all` VALUES (16, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_user/index.html', 'admin', 'AdminUser', 'index', 'GET', 'a:0:{}', 1519957537);
INSERT INTO `book_web_log_all` VALUES (17, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', 1519957539);
INSERT INTO `book_web_log_all` VALUES (18, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1519957541);
INSERT INTO `book_web_log_all` VALUES (19, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1519957541);
INSERT INTO `book_web_log_all` VALUES (20, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1519957541);
INSERT INTO `book_web_log_all` VALUES (21, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', 1519957543);
INSERT INTO `book_web_log_all` VALUES (22, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_user/index.html', 'admin', 'AdminUser', 'index', 'GET', 'a:0:{}', 1519957544);
INSERT INTO `book_web_log_all` VALUES (23, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/node_map/index.html', 'admin', 'NodeMap', 'index', 'GET', 'a:0:{}', 1519957666);
INSERT INTO `book_web_log_all` VALUES (24, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', 1519957673);
INSERT INTO `book_web_log_all` VALUES (25, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_group/add.html', 'admin', 'AdminGroup', 'add', 'GET', 'a:0:{}', 1519957675);
INSERT INTO `book_web_log_all` VALUES (26, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_group/add.html', 'admin', 'AdminGroup', 'add', 'POST', 'a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:18:\"小巧玲珑书吧\";s:4:\"icon\";s:12:\"&amp;#xe625;\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:0:\"\";}', 1519957847);
INSERT INTO `book_web_log_all` VALUES (27, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', 1519957847);
INSERT INTO `book_web_log_all` VALUES (28, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1519957850);
INSERT INTO `book_web_log_all` VALUES (29, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1519957851);
INSERT INTO `book_web_log_all` VALUES (30, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', 1519957858);
INSERT INTO `book_web_log_all` VALUES (31, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', 1519957860);
INSERT INTO `book_web_log_all` VALUES (32, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_group/edit/id/3.html', 'admin', 'AdminGroup', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"3\";}', 1519957864);
INSERT INTO `book_web_log_all` VALUES (33, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_user/index.html', 'admin', 'AdminUser', 'index', 'GET', 'a:0:{}', 1519957894);
INSERT INTO `book_web_log_all` VALUES (34, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1519957901);
INSERT INTO `book_web_log_all` VALUES (35, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1519957901);
INSERT INTO `book_web_log_all` VALUES (36, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1519957901);
INSERT INTO `book_web_log_all` VALUES (37, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/add?pid=1', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:\"pid\";s:1:\"1\";}', 1519957914);
INSERT INTO `book_web_log_all` VALUES (38, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/add', 'admin', 'AdminNode', 'add', 'POST', 'a:9:{s:2:\"id\";s:0:\"\";s:3:\"pid\";s:1:\"1\";s:5:\"level\";s:1:\"2\";s:8:\"group_id\";s:1:\"4\";s:5:\"title\";s:12:\"用户管理\";s:4:\"name\";s:5:\"index\";s:4:\"type\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}', 1519957952);
INSERT INTO `book_web_log_all` VALUES (39, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/add?pid=1', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:\"pid\";s:1:\"1\";}', 1519957988);
INSERT INTO `book_web_log_all` VALUES (40, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/add', 'admin', 'AdminNode', 'add', 'POST', 'a:9:{s:2:\"id\";s:0:\"\";s:3:\"pid\";s:1:\"1\";s:5:\"level\";s:1:\"2\";s:8:\"group_id\";s:1:\"4\";s:5:\"title\";s:12:\"用户管理\";s:4:\"name\";s:10:\"user/index\";s:4:\"type\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}', 1519958007);
INSERT INTO `book_web_log_all` VALUES (41, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1519958007);
INSERT INTO `book_web_log_all` VALUES (42, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1519958007);
INSERT INTO `book_web_log_all` VALUES (43, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1519958008);
INSERT INTO `book_web_log_all` VALUES (44, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1519958009);
INSERT INTO `book_web_log_all` VALUES (45, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1519958010);
INSERT INTO `book_web_log_all` VALUES (46, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1519961583);
INSERT INTO `book_web_log_all` VALUES (47, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1519961583);
INSERT INTO `book_web_log_all` VALUES (48, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1519961584);
INSERT INTO `book_web_log_all` VALUES (49, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', 1519961596);
INSERT INTO `book_web_log_all` VALUES (50, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', 1519961598);
INSERT INTO `book_web_log_all` VALUES (51, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_group/edit/id/4.html', 'admin', 'AdminGroup', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"4\";}', 1519961602);
INSERT INTO `book_web_log_all` VALUES (52, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_group/edit/id/3.html', 'admin', 'AdminGroup', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"3\";}', 1519961606);
INSERT INTO `book_web_log_all` VALUES (53, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_group/edit/id/1.html', 'admin', 'AdminGroup', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', 1519961616);
INSERT INTO `book_web_log_all` VALUES (54, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_group/edit/id/4.html', 'admin', 'AdminGroup', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"4\";}', 1519961624);
INSERT INTO `book_web_log_all` VALUES (55, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_group/edit/id/4.html', 'admin', 'AdminGroup', 'edit', 'POST', 'a:6:{s:2:\"id\";s:1:\"4\";s:4:\"name\";s:18:\"小巧玲珑书吧\";s:4:\"icon\";s:12:\"&amp;#xe625;\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:0:\"\";}', 1519961630);
INSERT INTO `book_web_log_all` VALUES (56, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', 1519961630);
INSERT INTO `book_web_log_all` VALUES (57, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1519961633);
INSERT INTO `book_web_log_all` VALUES (58, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1519961633);
INSERT INTO `book_web_log_all` VALUES (59, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', 1519961640);
INSERT INTO `book_web_log_all` VALUES (60, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1519961641);
INSERT INTO `book_web_log_all` VALUES (61, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1519961641);
INSERT INTO `book_web_log_all` VALUES (62, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1519961641);
INSERT INTO `book_web_log_all` VALUES (63, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', 1519961650);
INSERT INTO `book_web_log_all` VALUES (64, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/node_map/index.html', 'admin', 'NodeMap', 'index', 'GET', 'a:0:{}', 1519961652);
INSERT INTO `book_web_log_all` VALUES (65, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', 1519961654);
INSERT INTO `book_web_log_all` VALUES (66, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_group/edit/id/4.html', 'admin', 'AdminGroup', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"4\";}', 1519961656);
INSERT INTO `book_web_log_all` VALUES (67, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_group/edit/id/4.html', 'admin', 'AdminGroup', 'edit', 'POST', 'a:6:{s:2:\"id\";s:1:\"4\";s:4:\"name\";s:18:\"小巧玲珑书吧\";s:4:\"icon\";s:0:\"\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:0:\"\";}', 1519961673);
INSERT INTO `book_web_log_all` VALUES (68, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', 1519961673);
INSERT INTO `book_web_log_all` VALUES (69, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1519961676);
INSERT INTO `book_web_log_all` VALUES (70, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1519961677);
INSERT INTO `book_web_log_all` VALUES (71, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1519961677);
INSERT INTO `book_web_log_all` VALUES (72, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1519976740);
INSERT INTO `book_web_log_all` VALUES (73, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1519976741);
INSERT INTO `book_web_log_all` VALUES (74, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1519976741);
INSERT INTO `book_web_log_all` VALUES (75, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1519976755);
INSERT INTO `book_web_log_all` VALUES (76, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1519976755);
INSERT INTO `book_web_log_all` VALUES (77, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1519976756);
INSERT INTO `book_web_log_all` VALUES (78, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"4\";}', 1519976759);
INSERT INTO `book_web_log_all` VALUES (79, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1519976767);
INSERT INTO `book_web_log_all` VALUES (80, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/edit?id=2', 'admin', 'AdminNode', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"2\";}', 1519976771);
INSERT INTO `book_web_log_all` VALUES (81, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"4\";}', 1519976786);
INSERT INTO `book_web_log_all` VALUES (82, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/edit?id=63', 'admin', 'AdminNode', 'edit', 'GET', 'a:1:{s:2:\"id\";s:2:\"63\";}', 1519976789);
INSERT INTO `book_web_log_all` VALUES (83, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/edit', 'admin', 'AdminNode', 'edit', 'POST', 'a:9:{s:2:\"id\";s:2:\"63\";s:3:\"pid\";s:1:\"1\";s:5:\"level\";s:1:\"2\";s:8:\"group_id\";s:1:\"4\";s:5:\"title\";s:12:\"用户管理\";s:4:\"name\";s:4:\"User\";s:4:\"type\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}', 1519976798);
INSERT INTO `book_web_log_all` VALUES (84, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1519976798);
INSERT INTO `book_web_log_all` VALUES (85, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1519976798);
INSERT INTO `book_web_log_all` VALUES (86, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"4\";}', 1519976799);
INSERT INTO `book_web_log_all` VALUES (87, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1519976829);
INSERT INTO `book_web_log_all` VALUES (88, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1519976829);
INSERT INTO `book_web_log_all` VALUES (89, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1519976830);
INSERT INTO `book_web_log_all` VALUES (90, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"4\";}', 1519976833);
INSERT INTO `book_web_log_all` VALUES (91, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/edit?id=63', 'admin', 'AdminNode', 'edit', 'GET', 'a:1:{s:2:\"id\";s:2:\"63\";}', 1519976836);
INSERT INTO `book_web_log_all` VALUES (92, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/edit', 'admin', 'AdminNode', 'edit', 'POST', 'a:9:{s:2:\"id\";s:2:\"63\";s:3:\"pid\";s:1:\"1\";s:5:\"level\";s:1:\"2\";s:8:\"group_id\";s:1:\"4\";s:5:\"title\";s:12:\"用户管理\";s:4:\"name\";s:10:\"Admin/User\";s:4:\"type\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}', 1519976846);
INSERT INTO `book_web_log_all` VALUES (93, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1519976846);
INSERT INTO `book_web_log_all` VALUES (94, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1519976847);
INSERT INTO `book_web_log_all` VALUES (95, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"4\";}', 1519976847);
INSERT INTO `book_web_log_all` VALUES (96, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1519976852);
INSERT INTO `book_web_log_all` VALUES (97, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1519976853);
INSERT INTO `book_web_log_all` VALUES (98, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1519976853);
INSERT INTO `book_web_log_all` VALUES (99, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1519976853);
INSERT INTO `book_web_log_all` VALUES (100, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', 1519976910);
INSERT INTO `book_web_log_all` VALUES (101, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', 1519976912);
INSERT INTO `book_web_log_all` VALUES (102, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', 1519978653);
INSERT INTO `book_web_log_all` VALUES (103, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', 1519978673);
INSERT INTO `book_web_log_all` VALUES (104, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', 1519978737);
INSERT INTO `book_web_log_all` VALUES (105, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/user/index.html?ktype=&kword=', 'admin', 'User', 'index', 'GET', 'a:2:{s:5:\"ktype\";s:0:\"\";s:5:\"kword\";s:0:\"\";}', 1519978739);
INSERT INTO `book_web_log_all` VALUES (106, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/user/index.html?ktype=&kword=', 'admin', 'User', 'index', 'GET', 'a:2:{s:5:\"ktype\";s:0:\"\";s:5:\"kword\";s:0:\"\";}', 1519978740);
INSERT INTO `book_web_log_all` VALUES (107, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/user/index.html?ktype=&kword=', 'admin', 'User', 'index', 'GET', 'a:2:{s:5:\"ktype\";s:0:\"\";s:5:\"kword\";s:0:\"\";}', 1519978968);
INSERT INTO `book_web_log_all` VALUES (108, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/user/index?ktype=4&kword=', 'admin', 'User', 'index', 'GET', 'a:2:{s:5:\"ktype\";s:1:\"4\";s:5:\"kword\";s:0:\"\";}', 1519978979);
INSERT INTO `book_web_log_all` VALUES (109, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/user/index?ktype=4&kword=', 'admin', 'User', 'index', 'GET', 'a:2:{s:5:\"ktype\";s:1:\"4\";s:5:\"kword\";s:0:\"\";}', 1519978989);
INSERT INTO `book_web_log_all` VALUES (110, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', 1519980624);
INSERT INTO `book_web_log_all` VALUES (111, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1519980666);
INSERT INTO `book_web_log_all` VALUES (112, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1519980667);
INSERT INTO `book_web_log_all` VALUES (113, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1519980667);
INSERT INTO `book_web_log_all` VALUES (114, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/add?pid=1', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:\"pid\";s:1:\"1\";}', 1519980670);
INSERT INTO `book_web_log_all` VALUES (115, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/add', 'admin', 'AdminNode', 'add', 'POST', 'a:9:{s:2:\"id\";s:0:\"\";s:3:\"pid\";s:1:\"1\";s:5:\"level\";s:1:\"2\";s:8:\"group_id\";s:1:\"4\";s:5:\"title\";s:12:\"商品分类\";s:4:\"name\";s:10:\"Admin/type\";s:4:\"type\";s:1:\"1\";s:4:\"sort\";s:1:\"2\";s:6:\"status\";s:1:\"1\";}', 1519980703);
INSERT INTO `book_web_log_all` VALUES (116, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1519980703);
INSERT INTO `book_web_log_all` VALUES (117, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1519980704);
INSERT INTO `book_web_log_all` VALUES (118, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1519980704);
INSERT INTO `book_web_log_all` VALUES (119, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1519980706);
INSERT INTO `book_web_log_all` VALUES (120, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1519980707);
INSERT INTO `book_web_log_all` VALUES (121, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1519985174);
INSERT INTO `book_web_log_all` VALUES (122, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1519985184);
INSERT INTO `book_web_log_all` VALUES (123, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1519985186);
INSERT INTO `book_web_log_all` VALUES (124, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1519985186);
INSERT INTO `book_web_log_all` VALUES (125, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"4\";}', 1519985281);
INSERT INTO `book_web_log_all` VALUES (126, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1519985294);
INSERT INTO `book_web_log_all` VALUES (127, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/edit?id=3', 'admin', 'AdminNode', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"3\";}', 1519985298);
INSERT INTO `book_web_log_all` VALUES (128, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"4\";}', 1519985305);
INSERT INTO `book_web_log_all` VALUES (129, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/edit?id=64', 'admin', 'AdminNode', 'edit', 'GET', 'a:1:{s:2:\"id\";s:2:\"64\";}', 1519985309);
INSERT INTO `book_web_log_all` VALUES (130, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1519985315);
INSERT INTO `book_web_log_all` VALUES (131, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1519985322);
INSERT INTO `book_web_log_all` VALUES (132, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1520215095);
INSERT INTO `book_web_log_all` VALUES (133, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1520215096);
INSERT INTO `book_web_log_all` VALUES (134, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:4:{s:7:\"account\";s:5:\"admin\";s:8:\"password\";s:6:\"123456\";s:7:\"captcha\";s:4:\"euti\";s:6:\"online\";s:1:\"1\";}', 1520215104);
INSERT INTO `book_web_log_all` VALUES (135, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1520215105);
INSERT INTO `book_web_log_all` VALUES (136, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1520215105);
INSERT INTO `book_web_log_all` VALUES (137, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', 1520215118);
INSERT INTO `book_web_log_all` VALUES (138, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520215121);
INSERT INTO `book_web_log_all` VALUES (139, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/add.html', 'admin', 'Type', 'add', 'GET', 'a:0:{}', 1520215130);
INSERT INTO `book_web_log_all` VALUES (140, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520216856);
INSERT INTO `book_web_log_all` VALUES (141, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520216879);
INSERT INTO `book_web_log_all` VALUES (142, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520217150);
INSERT INTO `book_web_log_all` VALUES (143, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520217315);
INSERT INTO `book_web_log_all` VALUES (144, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/add.html', 'admin', 'Type', 'add', 'GET', 'a:0:{}', 1520217330);
INSERT INTO `book_web_log_all` VALUES (145, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/add.html', 'admin', 'Type', 'add', 'GET', 'a:0:{}', 1520217349);
INSERT INTO `book_web_log_all` VALUES (146, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/add.html', 'admin', 'Type', 'add', 'GET', 'a:0:{}', 1520217373);
INSERT INTO `book_web_log_all` VALUES (147, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/add.html', 'admin', 'Type', 'add', 'GET', 'a:0:{}', 1520217386);
INSERT INTO `book_web_log_all` VALUES (148, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/add.html', 'admin', 'Type', 'add', 'GET', 'a:0:{}', 1520217402);
INSERT INTO `book_web_log_all` VALUES (149, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/add.html', 'admin', 'Type', 'add', 'GET', 'a:0:{}', 1520217431);
INSERT INTO `book_web_log_all` VALUES (150, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/add.html', 'admin', 'Type', 'add', 'POST', 'a:5:{s:2:\"id\";s:0:\"\";s:5:\"title\";s:6:\"文学\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:25:\"文学类型-浮生六记\";}', 1520219191);
INSERT INTO `book_web_log_all` VALUES (151, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520219192);
INSERT INTO `book_web_log_all` VALUES (152, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520219335);
INSERT INTO `book_web_log_all` VALUES (153, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/add.html', 'admin', 'Type', 'add', 'GET', 'a:0:{}', 1520219337);
INSERT INTO `book_web_log_all` VALUES (154, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/add.html', 'admin', 'Type', 'add', 'POST', 'a:5:{s:2:\"id\";s:0:\"\";s:5:\"title\";s:6:\"小说\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:43:\"小说-东野圭吾，阿加莎，小王子\";}', 1520219385);
INSERT INTO `book_web_log_all` VALUES (155, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520219385);
INSERT INTO `book_web_log_all` VALUES (156, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/index/_sort/asc/_order/id.html', 'admin', 'Type', 'index', 'GET', 'a:2:{s:5:\"_sort\";s:3:\"asc\";s:6:\"_order\";s:2:\"id\";}', 1520219389);
INSERT INTO `book_web_log_all` VALUES (157, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520219415);
INSERT INTO `book_web_log_all` VALUES (158, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520219443);
INSERT INTO `book_web_log_all` VALUES (159, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/add.html', 'admin', 'Type', 'add', 'GET', 'a:0:{}', 1520219608);
INSERT INTO `book_web_log_all` VALUES (160, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', 1520219687);
INSERT INTO `book_web_log_all` VALUES (161, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_role/add.html', 'admin', 'AdminRole', 'add', 'GET', 'a:0:{}', 1520219688);
INSERT INTO `book_web_log_all` VALUES (162, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_role/add.html', 'admin', 'AdminRole', 'add', 'GET', 'a:0:{}', 1520219699);
INSERT INTO `book_web_log_all` VALUES (163, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_role/add.html', 'admin', 'AdminRole', 'add', 'GET', 'a:0:{}', 1520219703);
INSERT INTO `book_web_log_all` VALUES (164, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_role/add.html', 'admin', 'AdminRole', 'add', 'POST', 'a:4:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:9:\"管理员\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:33:\"管理商品分类，商品信息\";}', 1520219790);
INSERT INTO `book_web_log_all` VALUES (165, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', 1520219791);
INSERT INTO `book_web_log_all` VALUES (166, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_role/user/id/3.html', 'admin', 'AdminRole', 'user', 'GET', 'a:1:{s:2:\"id\";s:1:\"3\";}', 1520219795);
INSERT INTO `book_web_log_all` VALUES (167, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_role/add.html', 'admin', 'AdminRole', 'add', 'GET', 'a:0:{}', 1520219825);
INSERT INTO `book_web_log_all` VALUES (168, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520220168);
INSERT INTO `book_web_log_all` VALUES (169, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520220170);
INSERT INTO `book_web_log_all` VALUES (170, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520220170);
INSERT INTO `book_web_log_all` VALUES (171, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520220170);
INSERT INTO `book_web_log_all` VALUES (172, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520220171);
INSERT INTO `book_web_log_all` VALUES (173, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520220171);
INSERT INTO `book_web_log_all` VALUES (174, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520220171);
INSERT INTO `book_web_log_all` VALUES (175, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1520220173);
INSERT INTO `book_web_log_all` VALUES (176, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1520220173);
INSERT INTO `book_web_log_all` VALUES (177, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520220175);
INSERT INTO `book_web_log_all` VALUES (178, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520220176);
INSERT INTO `book_web_log_all` VALUES (179, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/add.html', 'admin', 'Type', 'add', 'GET', 'a:0:{}', 1520220184);
INSERT INTO `book_web_log_all` VALUES (180, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/add.html', 'admin', 'Type', 'add', 'POST', 'a:5:{s:2:\"id\";s:0:\"\";s:5:\"title\";s:6:\"历史\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:19:\"历史-未来简史\";}', 1520220204);
INSERT INTO `book_web_log_all` VALUES (181, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520220205);
INSERT INTO `book_web_log_all` VALUES (182, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/edit/id/3.html', 'admin', 'Type', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"3\";}', 1520220213);
INSERT INTO `book_web_log_all` VALUES (183, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/edit/id/3.html', 'admin', 'Type', 'edit', 'POST', 'a:5:{s:2:\"id\";s:1:\"3\";s:5:\"title\";s:6:\"历史\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:19:\"历史-未来简史\";}', 1520220215);
INSERT INTO `book_web_log_all` VALUES (184, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520220215);
INSERT INTO `book_web_log_all` VALUES (185, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520220711);
INSERT INTO `book_web_log_all` VALUES (186, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/add.html', 'admin', 'Type', 'add', 'GET', 'a:0:{}', 1520220720);
INSERT INTO `book_web_log_all` VALUES (187, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1520220978);
INSERT INTO `book_web_log_all` VALUES (188, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1520220978);
INSERT INTO `book_web_log_all` VALUES (189, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1520300381);
INSERT INTO `book_web_log_all` VALUES (190, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1520300386);
INSERT INTO `book_web_log_all` VALUES (191, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520300393);
INSERT INTO `book_web_log_all` VALUES (192, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520305843);
INSERT INTO `book_web_log_all` VALUES (193, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/add.html', 'admin', 'Type', 'add', 'GET', 'a:0:{}', 1520305847);
INSERT INTO `book_web_log_all` VALUES (194, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1520306160);
INSERT INTO `book_web_log_all` VALUES (195, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1520306160);
INSERT INTO `book_web_log_all` VALUES (196, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520306245);
INSERT INTO `book_web_log_all` VALUES (197, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/add.html', 'admin', 'Type', 'add', 'GET', 'a:0:{}', 1520306738);
INSERT INTO `book_web_log_all` VALUES (198, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520306744);
INSERT INTO `book_web_log_all` VALUES (199, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/add.html', 'admin', 'Type', 'add', 'GET', 'a:0:{}', 1520306749);
INSERT INTO `book_web_log_all` VALUES (200, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/add.html', 'admin', 'Type', 'add', 'POST', 'a:5:{s:2:\"id\";s:0:\"\";s:5:\"title\";s:6:\"科幻\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:6:\"科幻\";}', 1520306762);
INSERT INTO `book_web_log_all` VALUES (201, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520306762);
INSERT INTO `book_web_log_all` VALUES (202, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520319858);
INSERT INTO `book_web_log_all` VALUES (203, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520320237);
INSERT INTO `book_web_log_all` VALUES (204, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/add.html', 'admin', 'Type', 'add', 'GET', 'a:0:{}', 1520320244);
INSERT INTO `book_web_log_all` VALUES (205, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/add.html', 'admin', 'Type', 'add', 'POST', 'a:5:{s:2:\"id\";s:0:\"\";s:5:\"title\";s:6:\"儿童\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:6:\"儿童\";}', 1520320254);
INSERT INTO `book_web_log_all` VALUES (206, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520320254);
INSERT INTO `book_web_log_all` VALUES (207, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', 1520320291);
INSERT INTO `book_web_log_all` VALUES (208, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_role/add.html', 'admin', 'AdminRole', 'add', 'GET', 'a:0:{}', 1520320294);
INSERT INTO `book_web_log_all` VALUES (209, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_role/add.html', 'admin', 'AdminRole', 'add', 'GET', 'a:0:{}', 1520320454);
INSERT INTO `book_web_log_all` VALUES (210, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520320459);
INSERT INTO `book_web_log_all` VALUES (211, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520320459);
INSERT INTO `book_web_log_all` VALUES (212, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/add.html', 'admin', 'Type', 'add', 'GET', 'a:0:{}', 1520320462);
INSERT INTO `book_web_log_all` VALUES (213, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/add.html', 'admin', 'Type', 'add', 'GET', 'a:0:{}', 1520320540);
INSERT INTO `book_web_log_all` VALUES (214, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520320594);
INSERT INTO `book_web_log_all` VALUES (215, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/edit/id/5.html', 'admin', 'Type', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"5\";}', 1520320596);
INSERT INTO `book_web_log_all` VALUES (216, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/edit/id/5.html', 'admin', 'Type', 'edit', 'POST', 'a:5:{s:2:\"id\";s:1:\"5\";s:5:\"title\";s:6:\"儿童\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:6:\"儿童\";}', 1520320598);
INSERT INTO `book_web_log_all` VALUES (217, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520320598);
INSERT INTO `book_web_log_all` VALUES (218, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/add.html', 'admin', 'Type', 'add', 'GET', 'a:0:{}', 1520320635);
INSERT INTO `book_web_log_all` VALUES (219, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/add.html', 'admin', 'Type', 'add', 'POST', 'a:5:{s:2:\"id\";s:0:\"\";s:5:\"title\";s:6:\"生活\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:6:\"生活\";}', 1520320644);
INSERT INTO `book_web_log_all` VALUES (220, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520320645);
INSERT INTO `book_web_log_all` VALUES (221, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/forbid.html', 'admin', 'Type', 'forbid', 'POST', 'a:1:{s:2:\"id\";s:0:\"\";}', 1520320746);
INSERT INTO `book_web_log_all` VALUES (222, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520320746);
INSERT INTO `book_web_log_all` VALUES (223, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/resume.html', 'admin', 'Type', 'resume', 'POST', 'a:1:{s:2:\"id\";s:0:\"\";}', 1520320751);
INSERT INTO `book_web_log_all` VALUES (224, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520320751);
INSERT INTO `book_web_log_all` VALUES (225, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/resume.html', 'admin', 'Type', 'resume', 'POST', 'a:1:{s:2:\"id\";s:1:\"6\";}', 1520320758);
INSERT INTO `book_web_log_all` VALUES (226, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520320758);
INSERT INTO `book_web_log_all` VALUES (227, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/forbid.html', 'admin', 'Type', 'forbid', 'POST', 'a:1:{s:2:\"id\";s:1:\"6\";}', 1520320762);
INSERT INTO `book_web_log_all` VALUES (228, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520320762);
INSERT INTO `book_web_log_all` VALUES (229, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/resume.html', 'admin', 'Type', 'resume', 'POST', 'a:1:{s:2:\"id\";s:1:\"6\";}', 1520320767);
INSERT INTO `book_web_log_all` VALUES (230, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520320767);
INSERT INTO `book_web_log_all` VALUES (231, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520320806);
INSERT INTO `book_web_log_all` VALUES (232, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/edit/id/6.html', 'admin', 'Type', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"6\";}', 1520320815);
INSERT INTO `book_web_log_all` VALUES (233, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520320969);
INSERT INTO `book_web_log_all` VALUES (234, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1520321512);
INSERT INTO `book_web_log_all` VALUES (235, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1520321513);
INSERT INTO `book_web_log_all` VALUES (236, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1520321513);
INSERT INTO `book_web_log_all` VALUES (237, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1520321513);
INSERT INTO `book_web_log_all` VALUES (238, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1520321513);
INSERT INTO `book_web_log_all` VALUES (239, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1520321514);
INSERT INTO `book_web_log_all` VALUES (240, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1520321514);
INSERT INTO `book_web_log_all` VALUES (241, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1520321516);
INSERT INTO `book_web_log_all` VALUES (242, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1520321516);
INSERT INTO `book_web_log_all` VALUES (243, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520321518);
INSERT INTO `book_web_log_all` VALUES (244, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/add.html', 'admin', 'Type', 'add', 'GET', 'a:0:{}', 1520321521);
INSERT INTO `book_web_log_all` VALUES (245, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/type/add.html', 'admin', 'Type', 'add', 'POST', 'a:5:{s:2:\"id\";s:0:\"\";s:5:\"title\";s:6:\"育儿\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:6:\"育儿\";}', 1520321529);
INSERT INTO `book_web_log_all` VALUES (246, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520321530);
INSERT INTO `book_web_log_all` VALUES (247, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520321545);
INSERT INTO `book_web_log_all` VALUES (248, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520321546);
INSERT INTO `book_web_log_all` VALUES (249, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520322989);
INSERT INTO `book_web_log_all` VALUES (250, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', 1520324984);
INSERT INTO `book_web_log_all` VALUES (251, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1520324985);
INSERT INTO `book_web_log_all` VALUES (252, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', 1520325255);
INSERT INTO `book_web_log_all` VALUES (253, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1520325256);
INSERT INTO `book_web_log_all` VALUES (254, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1520325257);
INSERT INTO `book_web_log_all` VALUES (255, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1520325257);
INSERT INTO `book_web_log_all` VALUES (256, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"4\";}', 1520325258);
INSERT INTO `book_web_log_all` VALUES (257, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/add?pid=1', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:\"pid\";s:1:\"1\";}', 1520325264);
INSERT INTO `book_web_log_all` VALUES (258, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/add', 'admin', 'AdminNode', 'add', 'POST', 'a:9:{s:2:\"id\";s:0:\"\";s:3:\"pid\";s:1:\"1\";s:5:\"level\";s:1:\"2\";s:8:\"group_id\";s:1:\"4\";s:5:\"title\";s:12:\"商品列表\";s:4:\"name\";s:7:\"Product\";s:4:\"type\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}', 1520325276);
INSERT INTO `book_web_log_all` VALUES (259, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1520325276);
INSERT INTO `book_web_log_all` VALUES (260, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1520325276);
INSERT INTO `book_web_log_all` VALUES (261, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1520325276);
INSERT INTO `book_web_log_all` VALUES (262, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1520325351);
INSERT INTO `book_web_log_all` VALUES (263, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1520325351);
INSERT INTO `book_web_log_all` VALUES (264, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1520325353);
INSERT INTO `book_web_log_all` VALUES (265, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1520325376);
INSERT INTO `book_web_log_all` VALUES (266, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1522046483);
INSERT INTO `book_web_log_all` VALUES (267, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1522046483);
INSERT INTO `book_web_log_all` VALUES (268, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:3:{s:7:\"account\";s:5:\"admin\";s:8:\"password\";s:6:\"123456\";s:7:\"captcha\";s:4:\"tiap\";}', 1522046491);
INSERT INTO `book_web_log_all` VALUES (269, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1522046491);
INSERT INTO `book_web_log_all` VALUES (270, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1522046492);
INSERT INTO `book_web_log_all` VALUES (271, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522046496);
INSERT INTO `book_web_log_all` VALUES (272, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1522046557);
INSERT INTO `book_web_log_all` VALUES (273, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', 1522046564);
INSERT INTO `book_web_log_all` VALUES (274, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522046565);
INSERT INTO `book_web_log_all` VALUES (275, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522046568);
INSERT INTO `book_web_log_all` VALUES (276, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522046719);
INSERT INTO `book_web_log_all` VALUES (277, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522046720);
INSERT INTO `book_web_log_all` VALUES (278, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522046798);
INSERT INTO `book_web_log_all` VALUES (279, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/generate/index.html', 'admin', 'Generate', 'index', 'GET', 'a:0:{}', 1522046808);
INSERT INTO `book_web_log_all` VALUES (280, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/generate/index.html?table=book_order', 'admin', 'Generate', 'index', 'GET', 'a:1:{s:5:\"table\";s:10:\"book_order\";}', 1522046815);
INSERT INTO `book_web_log_all` VALUES (281, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/generate/run.html', 'admin', 'Generate', 'run', 'POST', 'a:6:{s:4:\"file\";s:3:\"all\";s:6:\"module\";s:5:\"admin\";s:10:\"controller\";s:5:\"Order\";s:5:\"title\";s:0:\"\";s:4:\"form\";a:16:{i:1;a:7:{s:5:\"title\";s:0:\"\";s:4:\"name\";s:8:\"order_id\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:2;a:7:{s:5:\"title\";s:0:\"\";s:4:\"name\";s:7:\"user_id\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:3;a:7:{s:5:\"title\";s:0:\"\";s:4:\"name\";s:8:\"username\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:4;a:7:{s:5:\"title\";s:0:\"\";s:4:\"name\";s:8:\"pay_real\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:5;a:7:{s:5:\"title\";s:0:\"\";s:4:\"name\";s:9:\"pay_amout\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:6;a:7:{s:5:\"title\";s:0:\"\";s:4:\"name\";s:12:\"preferential\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:7;a:7:{s:5:\"title\";s:0:\"\";s:4:\"name\";s:12:\"pay_channels\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:8;a:7:{s:5:\"title\";s:0:\"\";s:4:\"name\";s:11:\"pay_account\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:9;a:7:{s:5:\"title\";s:0:\"\";s:4:\"name\";s:14:\"shroff_account\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:10;a:7:{s:5:\"title\";s:0:\"\";s:4:\"name\";s:6:\"source\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:11;a:7:{s:5:\"title\";s:0:\"\";s:4:\"name\";s:8:\"pay_time\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:12;a:7:{s:5:\"title\";s:0:\"\";s:4:\"name\";s:11:\"orderstatus\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:13;a:7:{s:5:\"title\";s:0:\"\";s:4:\"name\";s:4:\"desc\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:14;a:7:{s:5:\"title\";s:0:\"\";s:4:\"name\";s:11:\"create_time\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:15;a:7:{s:5:\"title\";s:0:\"\";s:4:\"name\";s:9:\"is_delete\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:16;a:7:{s:5:\"title\";s:0:\"\";s:4:\"name\";s:9:\"is_online\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}}s:4:\"menu\";a:6:{i:0;s:3:\"add\";i:1;s:6:\"forbid\";i:2;s:6:\"resume\";i:3;s:6:\"delete\";i:4;s:10:\"recycleBin\";i:5;s:9:\"saveOrder\";}}', 1522046835);
INSERT INTO `book_web_log_all` VALUES (282, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1522046838);
INSERT INTO `book_web_log_all` VALUES (283, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1522046838);
INSERT INTO `book_web_log_all` VALUES (284, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1522046922);
INSERT INTO `book_web_log_all` VALUES (285, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1522046922);
INSERT INTO `book_web_log_all` VALUES (286, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1522046926);
INSERT INTO `book_web_log_all` VALUES (287, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1522046927);
INSERT INTO `book_web_log_all` VALUES (288, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1522046927);
INSERT INTO `book_web_log_all` VALUES (289, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/add?pid=1', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:\"pid\";s:1:\"1\";}', 1522046936);
INSERT INTO `book_web_log_all` VALUES (290, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/add', 'admin', 'AdminNode', 'add', 'POST', 'a:9:{s:2:\"id\";s:0:\"\";s:3:\"pid\";s:1:\"1\";s:5:\"level\";s:1:\"2\";s:8:\"group_id\";s:1:\"4\";s:5:\"title\";s:6:\"订单\";s:4:\"name\";s:5:\"order\";s:4:\"type\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}', 1522046951);
INSERT INTO `book_web_log_all` VALUES (291, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1522046951);
INSERT INTO `book_web_log_all` VALUES (292, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1522046951);
INSERT INTO `book_web_log_all` VALUES (293, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1522046951);
INSERT INTO `book_web_log_all` VALUES (294, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1522046952);
INSERT INTO `book_web_log_all` VALUES (295, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1522046952);
INSERT INTO `book_web_log_all` VALUES (296, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522046954);
INSERT INTO `book_web_log_all` VALUES (297, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1522047001);
INSERT INTO `book_web_log_all` VALUES (298, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1522047001);
INSERT INTO `book_web_log_all` VALUES (299, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1522047001);
INSERT INTO `book_web_log_all` VALUES (300, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"4\";}', 1522047007);
INSERT INTO `book_web_log_all` VALUES (301, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/edit?id=66', 'admin', 'AdminNode', 'edit', 'GET', 'a:1:{s:2:\"id\";s:2:\"66\";}', 1522047010);
INSERT INTO `book_web_log_all` VALUES (302, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/edit', 'admin', 'AdminNode', 'edit', 'POST', 'a:9:{s:2:\"id\";s:2:\"66\";s:3:\"pid\";s:1:\"1\";s:5:\"level\";s:1:\"2\";s:8:\"group_id\";s:1:\"4\";s:5:\"title\";s:12:\"订单列表\";s:4:\"name\";s:5:\"order\";s:4:\"type\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}', 1522047015);
INSERT INTO `book_web_log_all` VALUES (303, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1522047016);
INSERT INTO `book_web_log_all` VALUES (304, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1522047016);
INSERT INTO `book_web_log_all` VALUES (305, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"4\";}', 1522047016);
INSERT INTO `book_web_log_all` VALUES (306, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1522047020);
INSERT INTO `book_web_log_all` VALUES (307, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1522047020);
INSERT INTO `book_web_log_all` VALUES (308, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522047022);
INSERT INTO `book_web_log_all` VALUES (309, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522047026);
INSERT INTO `book_web_log_all` VALUES (310, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522047408);
INSERT INTO `book_web_log_all` VALUES (311, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522047411);
INSERT INTO `book_web_log_all` VALUES (312, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522047412);
INSERT INTO `book_web_log_all` VALUES (313, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522047496);
INSERT INTO `book_web_log_all` VALUES (314, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522047497);
INSERT INTO `book_web_log_all` VALUES (315, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522047498);
INSERT INTO `book_web_log_all` VALUES (316, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522047528);
INSERT INTO `book_web_log_all` VALUES (317, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1522047529);
INSERT INTO `book_web_log_all` VALUES (318, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1522047529);
INSERT INTO `book_web_log_all` VALUES (319, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1522047529);
INSERT INTO `book_web_log_all` VALUES (320, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1522047530);
INSERT INTO `book_web_log_all` VALUES (321, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522047531);
INSERT INTO `book_web_log_all` VALUES (322, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522047541);
INSERT INTO `book_web_log_all` VALUES (323, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522047544);
INSERT INTO `book_web_log_all` VALUES (324, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522047803);
INSERT INTO `book_web_log_all` VALUES (325, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522047806);
INSERT INTO `book_web_log_all` VALUES (326, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522047807);
INSERT INTO `book_web_log_all` VALUES (327, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522047810);
INSERT INTO `book_web_log_all` VALUES (328, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522047813);
INSERT INTO `book_web_log_all` VALUES (329, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522047815);
INSERT INTO `book_web_log_all` VALUES (330, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522047826);
INSERT INTO `book_web_log_all` VALUES (331, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522047892);
INSERT INTO `book_web_log_all` VALUES (332, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522047902);
INSERT INTO `book_web_log_all` VALUES (333, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522047928);
INSERT INTO `book_web_log_all` VALUES (334, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'POST', 'a:11:{s:2:\"id\";s:0:\"\";s:5:\"title\";s:12:\"东野圭吾\";s:5:\"price\";s:3:\"100\";s:10:\"sale_price\";s:1:\"0\";s:9:\"inventory\";s:3:\"100\";s:7:\"soldnum\";s:3:\"100\";s:8:\"clicknum\";s:2:\"10\";s:4:\"type\";s:1:\"4\";s:3:\"img\";s:0:\"\";s:11:\"description\";s:0:\"\";s:6:\"status\";s:1:\"1\";}', 1522048559);
INSERT INTO `book_web_log_all` VALUES (335, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522048560);
INSERT INTO `book_web_log_all` VALUES (336, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'POST', 'a:11:{s:2:\"id\";s:0:\"\";s:5:\"title\";s:9:\"阿加莎\";s:5:\"price\";s:1:\"1\";s:10:\"sale_price\";s:1:\"2\";s:9:\"inventory\";s:1:\"3\";s:7:\"soldnum\";s:1:\"4\";s:8:\"clicknum\";s:1:\"5\";s:4:\"type\";s:1:\"1\";s:3:\"img\";s:1:\"1\";s:11:\"description\";s:5:\"11111\";s:6:\"status\";s:1:\"1\";}', 1522048709);
INSERT INTO `book_web_log_all` VALUES (337, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522048709);
INSERT INTO `book_web_log_all` VALUES (338, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522048955);
INSERT INTO `book_web_log_all` VALUES (339, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'POST', 'a:11:{s:2:\"id\";s:0:\"\";s:5:\"title\";s:9:\"白夜行\";s:5:\"price\";s:4:\"23.5\";s:10:\"sale_price\";s:4:\"20.8\";s:9:\"inventory\";s:3:\"100\";s:7:\"soldnum\";s:2:\"80\";s:8:\"clicknum\";s:2:\"50\";s:4:\"type\";s:1:\"2\";s:3:\"img\";s:0:\"\";s:11:\"description\";s:9:\"发发发\";s:6:\"status\";s:1:\"1\";}', 1522049000);
INSERT INTO `book_web_log_all` VALUES (340, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522049000);
INSERT INTO `book_web_log_all` VALUES (341, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522049142);
INSERT INTO `book_web_log_all` VALUES (342, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522049456);
INSERT INTO `book_web_log_all` VALUES (343, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index/_sort/asc/_order/id.html', 'admin', 'Product', 'index', 'GET', 'a:2:{s:5:\"_sort\";s:3:\"asc\";s:6:\"_order\";s:2:\"id\";}', 1522049464);
INSERT INTO `book_web_log_all` VALUES (344, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index/_sort/desc/_order/id.html', 'admin', 'Product', 'index', 'GET', 'a:2:{s:5:\"_sort\";s:4:\"desc\";s:6:\"_order\";s:2:\"id\";}', 1522049465);
INSERT INTO `book_web_log_all` VALUES (345, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index/_sort/asc/_order/id.html', 'admin', 'Product', 'index', 'GET', 'a:2:{s:5:\"_sort\";s:3:\"asc\";s:6:\"_order\";s:2:\"id\";}', 1522049466);
INSERT INTO `book_web_log_all` VALUES (346, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index/_sort/desc/_order/id.html', 'admin', 'Product', 'index', 'GET', 'a:2:{s:5:\"_sort\";s:4:\"desc\";s:6:\"_order\";s:2:\"id\";}', 1522049467);
INSERT INTO `book_web_log_all` VALUES (347, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522051317);
INSERT INTO `book_web_log_all` VALUES (348, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522052904);
INSERT INTO `book_web_log_all` VALUES (349, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522052913);
INSERT INTO `book_web_log_all` VALUES (350, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522053183);
INSERT INTO `book_web_log_all` VALUES (351, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522053275);
INSERT INTO `book_web_log_all` VALUES (352, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522053299);
INSERT INTO `book_web_log_all` VALUES (353, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522053444);
INSERT INTO `book_web_log_all` VALUES (354, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522053458);
INSERT INTO `book_web_log_all` VALUES (355, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/forbid/id/8.html', 'admin', 'Product', 'forbid', 'POST', 'a:1:{s:2:\"id\";s:1:\"8\";}', 1522053468);
INSERT INTO `book_web_log_all` VALUES (356, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/resume/id/8.html', 'admin', 'Product', 'resume', 'POST', 'a:1:{s:2:\"id\";s:1:\"8\";}', 1522053472);
INSERT INTO `book_web_log_all` VALUES (357, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522053579);
INSERT INTO `book_web_log_all` VALUES (358, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/delete.html', 'admin', 'Product', 'delete', 'POST', 'a:1:{s:2:\"id\";s:1:\"8\";}', 1522053582);
INSERT INTO `book_web_log_all` VALUES (359, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522053643);
INSERT INTO `book_web_log_all` VALUES (360, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/delete.html', 'admin', 'Product', 'delete', 'POST', 'a:1:{s:2:\"id\";s:0:\"\";}', 1522053650);
INSERT INTO `book_web_log_all` VALUES (361, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522053650);
INSERT INTO `book_web_log_all` VALUES (362, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522053746);
INSERT INTO `book_web_log_all` VALUES (363, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522054154);
INSERT INTO `book_web_log_all` VALUES (364, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522054169);
INSERT INTO `book_web_log_all` VALUES (365, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522054325);
INSERT INTO `book_web_log_all` VALUES (366, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522054403);
INSERT INTO `book_web_log_all` VALUES (367, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522056415);
INSERT INTO `book_web_log_all` VALUES (368, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522056450);
INSERT INTO `book_web_log_all` VALUES (369, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522056454);
INSERT INTO `book_web_log_all` VALUES (370, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522056456);
INSERT INTO `book_web_log_all` VALUES (371, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522057560);
INSERT INTO `book_web_log_all` VALUES (372, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522059271);
INSERT INTO `book_web_log_all` VALUES (373, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522059368);
INSERT INTO `book_web_log_all` VALUES (374, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522059485);
INSERT INTO `book_web_log_all` VALUES (375, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/edit/id/8.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"8\";}', 1522059487);
INSERT INTO `book_web_log_all` VALUES (376, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522059597);
INSERT INTO `book_web_log_all` VALUES (377, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522059599);
INSERT INTO `book_web_log_all` VALUES (378, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/edit/id/8.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"8\";}', 1522059600);
INSERT INTO `book_web_log_all` VALUES (379, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522059777);
INSERT INTO `book_web_log_all` VALUES (380, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522059868);
INSERT INTO `book_web_log_all` VALUES (381, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/edit/id/8.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"8\";}', 1522059870);
INSERT INTO `book_web_log_all` VALUES (382, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/edit/id/7.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"7\";}', 1522059875);
INSERT INTO `book_web_log_all` VALUES (383, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/edit/id/6.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"6\";}', 1522059879);
INSERT INTO `book_web_log_all` VALUES (384, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522059921);
INSERT INTO `book_web_log_all` VALUES (385, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/edit/id/7.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"7\";}', 1522059925);
INSERT INTO `book_web_log_all` VALUES (386, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/edit/id/7.html', 'admin', 'Product', 'edit', 'POST', 'a:11:{s:2:\"id\";s:1:\"7\";s:5:\"title\";s:9:\"阿加莎\";s:5:\"price\";s:5:\"18.00\";s:10:\"sale_price\";s:4:\"2.00\";s:9:\"inventory\";s:1:\"3\";s:7:\"soldnum\";s:1:\"4\";s:8:\"clicknum\";s:1:\"5\";s:4:\"type\";s:1:\"1\";s:3:\"img\";s:0:\"\";s:11:\"description\";s:5:\"11111\";s:6:\"status\";s:1:\"1\";}', 1522059932);
INSERT INTO `book_web_log_all` VALUES (387, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522059932);
INSERT INTO `book_web_log_all` VALUES (388, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/edit/id/7.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"7\";}', 1522059937);
INSERT INTO `book_web_log_all` VALUES (389, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522059959);
INSERT INTO `book_web_log_all` VALUES (390, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522059963);
INSERT INTO `book_web_log_all` VALUES (391, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522059964);
INSERT INTO `book_web_log_all` VALUES (392, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522059997);
INSERT INTO `book_web_log_all` VALUES (393, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522060345);
INSERT INTO `book_web_log_all` VALUES (394, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522060469);
INSERT INTO `book_web_log_all` VALUES (395, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522060720);
INSERT INTO `book_web_log_all` VALUES (396, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522060722);
INSERT INTO `book_web_log_all` VALUES (397, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522060745);
INSERT INTO `book_web_log_all` VALUES (398, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522060785);
INSERT INTO `book_web_log_all` VALUES (399, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522060786);
INSERT INTO `book_web_log_all` VALUES (400, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522061260);
INSERT INTO `book_web_log_all` VALUES (401, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522061263);
INSERT INTO `book_web_log_all` VALUES (402, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1522061264);
INSERT INTO `book_web_log_all` VALUES (403, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', 1522061265);
INSERT INTO `book_web_log_all` VALUES (404, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1522061273);
INSERT INTO `book_web_log_all` VALUES (405, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522061275);
INSERT INTO `book_web_log_all` VALUES (406, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522061276);
INSERT INTO `book_web_log_all` VALUES (407, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1522061277);
INSERT INTO `book_web_log_all` VALUES (408, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522061280);
INSERT INTO `book_web_log_all` VALUES (409, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522061280);
INSERT INTO `book_web_log_all` VALUES (410, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1522061281);
INSERT INTO `book_web_log_all` VALUES (411, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522061281);
INSERT INTO `book_web_log_all` VALUES (412, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522061282);
INSERT INTO `book_web_log_all` VALUES (413, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522061283);
INSERT INTO `book_web_log_all` VALUES (414, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1522061283);
INSERT INTO `book_web_log_all` VALUES (415, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522061283);
INSERT INTO `book_web_log_all` VALUES (416, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522061284);
INSERT INTO `book_web_log_all` VALUES (417, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522061359);
INSERT INTO `book_web_log_all` VALUES (418, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1522061360);
INSERT INTO `book_web_log_all` VALUES (419, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', 1522061361);
INSERT INTO `book_web_log_all` VALUES (420, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522061364);
INSERT INTO `book_web_log_all` VALUES (421, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522116261);
INSERT INTO `book_web_log_all` VALUES (422, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522116261);
INSERT INTO `book_web_log_all` VALUES (423, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/pub/login.html?callback=http%3A%2F%2Fwww.tpadmin.com%2Fadmin%2Fproduct%2Fadd.html', 'admin', 'Pub', 'login', 'GET', 'a:1:{s:8:\"callback\";s:45:\"http://www.tpadmin.com/admin/product/add.html\";}', 1522116261);
INSERT INTO `book_web_log_all` VALUES (424, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1522116273);
INSERT INTO `book_web_log_all` VALUES (425, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1522116274);
INSERT INTO `book_web_log_all` VALUES (426, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:3:{s:7:\"account\";s:5:\"admin\";s:8:\"password\";s:6:\"123456\";s:7:\"captcha\";s:4:\"sxex\";}', 1522118875);
INSERT INTO `book_web_log_all` VALUES (427, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:3:{s:7:\"account\";s:5:\"admin\";s:8:\"password\";s:6:\"123456\";s:7:\"captcha\";s:4:\"rv8v\";}', 1522118882);
INSERT INTO `book_web_log_all` VALUES (428, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522118958);
INSERT INTO `book_web_log_all` VALUES (429, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522119559);
INSERT INTO `book_web_log_all` VALUES (430, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522119725);
INSERT INTO `book_web_log_all` VALUES (431, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1522119741);
INSERT INTO `book_web_log_all` VALUES (432, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1522119741);
INSERT INTO `book_web_log_all` VALUES (433, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1522119742);
INSERT INTO `book_web_log_all` VALUES (434, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522119747);
INSERT INTO `book_web_log_all` VALUES (435, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522119750);
INSERT INTO `book_web_log_all` VALUES (436, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522119751);
INSERT INTO `book_web_log_all` VALUES (437, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522119755);
INSERT INTO `book_web_log_all` VALUES (438, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/edit/id/8.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"8\";}', 1522119759);
INSERT INTO `book_web_log_all` VALUES (439, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/edit/id/8.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"8\";}', 1522119769);
INSERT INTO `book_web_log_all` VALUES (440, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522119820);
INSERT INTO `book_web_log_all` VALUES (441, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'POST', 'a:11:{s:2:\"id\";s:0:\"\";s:5:\"title\";s:12:\"麒麟之翼\";s:5:\"price\";s:4:\"26.8\";s:10:\"sale_price\";s:1:\"0\";s:9:\"inventory\";s:2:\"88\";s:7:\"soldnum\";s:2:\"10\";s:8:\"clicknum\";s:2:\"10\";s:4:\"type\";s:1:\"2\";s:3:\"img\";s:0:\"\";s:11:\"description\";s:12:\"东野圭吾\";s:6:\"status\";s:1:\"1\";}', 1522119859);
INSERT INTO `book_web_log_all` VALUES (442, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522119860);
INSERT INTO `book_web_log_all` VALUES (443, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522119870);
INSERT INTO `book_web_log_all` VALUES (444, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522119884);
INSERT INTO `book_web_log_all` VALUES (445, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522119886);
INSERT INTO `book_web_log_all` VALUES (446, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/edit/id/9.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"9\";}', 1522119906);
INSERT INTO `book_web_log_all` VALUES (447, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522119922);
INSERT INTO `book_web_log_all` VALUES (448, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1522119927);
INSERT INTO `book_web_log_all` VALUES (449, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1522119932);
INSERT INTO `book_web_log_all` VALUES (450, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1522120037);
INSERT INTO `book_web_log_all` VALUES (451, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1522120037);
INSERT INTO `book_web_log_all` VALUES (452, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1522120137);
INSERT INTO `book_web_log_all` VALUES (453, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1522120137);
INSERT INTO `book_web_log_all` VALUES (454, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522120234);
INSERT INTO `book_web_log_all` VALUES (455, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1522120297);
INSERT INTO `book_web_log_all` VALUES (456, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1522120297);
INSERT INTO `book_web_log_all` VALUES (457, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1522120309);
INSERT INTO `book_web_log_all` VALUES (458, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1522120309);
INSERT INTO `book_web_log_all` VALUES (459, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522120318);
INSERT INTO `book_web_log_all` VALUES (460, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522120324);
INSERT INTO `book_web_log_all` VALUES (461, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522120327);
INSERT INTO `book_web_log_all` VALUES (462, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', 1522120331);
INSERT INTO `book_web_log_all` VALUES (463, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', 1522120334);
INSERT INTO `book_web_log_all` VALUES (464, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522120338);
INSERT INTO `book_web_log_all` VALUES (465, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1522120339);
INSERT INTO `book_web_log_all` VALUES (466, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522120339);
INSERT INTO `book_web_log_all` VALUES (467, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/edit/id/9.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"9\";}', 1522120346);
INSERT INTO `book_web_log_all` VALUES (468, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1522120498);
INSERT INTO `book_web_log_all` VALUES (469, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1522121058);
INSERT INTO `book_web_log_all` VALUES (470, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1522121077);
INSERT INTO `book_web_log_all` VALUES (471, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1522121082);
INSERT INTO `book_web_log_all` VALUES (472, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522121100);
INSERT INTO `book_web_log_all` VALUES (473, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/edit/id/9.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"9\";}', 1522121103);
INSERT INTO `book_web_log_all` VALUES (474, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1522121106);
INSERT INTO `book_web_log_all` VALUES (475, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1522121109);
INSERT INTO `book_web_log_all` VALUES (476, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522121156);
INSERT INTO `book_web_log_all` VALUES (477, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522121163);
INSERT INTO `book_web_log_all` VALUES (478, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522121457);
INSERT INTO `book_web_log_all` VALUES (479, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522121480);
INSERT INTO `book_web_log_all` VALUES (480, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522122078);
INSERT INTO `book_web_log_all` VALUES (481, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1522122080);
INSERT INTO `book_web_log_all` VALUES (482, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1522122084);
INSERT INTO `book_web_log_all` VALUES (483, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522131242);
INSERT INTO `book_web_log_all` VALUES (484, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522131443);
INSERT INTO `book_web_log_all` VALUES (485, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1522131446);
INSERT INTO `book_web_log_all` VALUES (486, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1522131454);
INSERT INTO `book_web_log_all` VALUES (487, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522131473);
INSERT INTO `book_web_log_all` VALUES (488, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522132463);
INSERT INTO `book_web_log_all` VALUES (489, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522132512);
INSERT INTO `book_web_log_all` VALUES (490, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522132537);
INSERT INTO `book_web_log_all` VALUES (491, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522132558);
INSERT INTO `book_web_log_all` VALUES (492, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1522132597);
INSERT INTO `book_web_log_all` VALUES (493, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1522132601);
INSERT INTO `book_web_log_all` VALUES (494, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1522132672);
INSERT INTO `book_web_log_all` VALUES (495, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1522132676);
INSERT INTO `book_web_log_all` VALUES (496, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522132826);
INSERT INTO `book_web_log_all` VALUES (497, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522132841);
INSERT INTO `book_web_log_all` VALUES (498, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522132880);
INSERT INTO `book_web_log_all` VALUES (499, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1522132884);
INSERT INTO `book_web_log_all` VALUES (500, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1522132888);
INSERT INTO `book_web_log_all` VALUES (501, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522135901);
INSERT INTO `book_web_log_all` VALUES (502, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1522135914);
INSERT INTO `book_web_log_all` VALUES (503, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1522135918);
INSERT INTO `book_web_log_all` VALUES (504, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1522136200);
INSERT INTO `book_web_log_all` VALUES (505, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522136373);
INSERT INTO `book_web_log_all` VALUES (506, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1522136380);
INSERT INTO `book_web_log_all` VALUES (507, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1522136384);
INSERT INTO `book_web_log_all` VALUES (508, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522136476);
INSERT INTO `book_web_log_all` VALUES (509, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522136478);
INSERT INTO `book_web_log_all` VALUES (510, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1522136481);
INSERT INTO `book_web_log_all` VALUES (511, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1522136485);
INSERT INTO `book_web_log_all` VALUES (512, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522136551);
INSERT INTO `book_web_log_all` VALUES (513, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522136552);
INSERT INTO `book_web_log_all` VALUES (514, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1522136554);
INSERT INTO `book_web_log_all` VALUES (515, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1522136558);
INSERT INTO `book_web_log_all` VALUES (516, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1522136752);
INSERT INTO `book_web_log_all` VALUES (517, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1522136755);
INSERT INTO `book_web_log_all` VALUES (518, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522136934);
INSERT INTO `book_web_log_all` VALUES (519, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522136937);
INSERT INTO `book_web_log_all` VALUES (520, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1522136938);
INSERT INTO `book_web_log_all` VALUES (521, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1522136943);
INSERT INTO `book_web_log_all` VALUES (522, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522136955);
INSERT INTO `book_web_log_all` VALUES (523, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522136956);
INSERT INTO `book_web_log_all` VALUES (524, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1522136957);
INSERT INTO `book_web_log_all` VALUES (525, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1522136960);
INSERT INTO `book_web_log_all` VALUES (526, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522136981);
INSERT INTO `book_web_log_all` VALUES (527, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1522136983);
INSERT INTO `book_web_log_all` VALUES (528, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1522136986);
INSERT INTO `book_web_log_all` VALUES (529, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522137109);
INSERT INTO `book_web_log_all` VALUES (530, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1522137111);
INSERT INTO `book_web_log_all` VALUES (531, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1522137114);
INSERT INTO `book_web_log_all` VALUES (532, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522137167);
INSERT INTO `book_web_log_all` VALUES (533, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522137219);
INSERT INTO `book_web_log_all` VALUES (534, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1522137259);
INSERT INTO `book_web_log_all` VALUES (535, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1522137263);
INSERT INTO `book_web_log_all` VALUES (536, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'POST', 'a:11:{s:2:\"id\";s:0:\"\";s:5:\"title\";s:6:\"毕业\";s:5:\"price\";s:4:\"18.6\";s:10:\"sale_price\";s:1:\"1\";s:9:\"inventory\";s:2:\"11\";s:7:\"soldnum\";s:0:\"\";s:8:\"clicknum\";s:0:\"\";s:4:\"type\";s:1:\"2\";s:3:\"img\";s:1:\"1\";s:11:\"description\";s:2:\"11\";s:6:\"status\";s:1:\"1\";}', 1522137283);
INSERT INTO `book_web_log_all` VALUES (537, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522137284);
INSERT INTO `book_web_log_all` VALUES (538, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522137291);
INSERT INTO `book_web_log_all` VALUES (539, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522137331);
INSERT INTO `book_web_log_all` VALUES (540, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/edit/id/10.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:2:\"10\";}', 1522137335);
INSERT INTO `book_web_log_all` VALUES (541, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522137455);
INSERT INTO `book_web_log_all` VALUES (542, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/edit/id/10.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:2:\"10\";}', 1522137457);
INSERT INTO `book_web_log_all` VALUES (543, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/edit/id/10.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:2:\"10\";}', 1522137469);
INSERT INTO `book_web_log_all` VALUES (544, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522137580);
INSERT INTO `book_web_log_all` VALUES (545, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522137594);
INSERT INTO `book_web_log_all` VALUES (546, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522138308);
INSERT INTO `book_web_log_all` VALUES (547, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1522138322);
INSERT INTO `book_web_log_all` VALUES (548, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1522138325);
INSERT INTO `book_web_log_all` VALUES (549, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522138381);
INSERT INTO `book_web_log_all` VALUES (550, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1522138383);
INSERT INTO `book_web_log_all` VALUES (551, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1522138386);
INSERT INTO `book_web_log_all` VALUES (552, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522138657);
INSERT INTO `book_web_log_all` VALUES (553, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522138707);
INSERT INTO `book_web_log_all` VALUES (554, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522138759);
INSERT INTO `book_web_log_all` VALUES (555, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522138769);
INSERT INTO `book_web_log_all` VALUES (556, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/edit/id/10.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:2:\"10\";}', 1522138771);
INSERT INTO `book_web_log_all` VALUES (557, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522138806);
INSERT INTO `book_web_log_all` VALUES (558, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', 1522138851);
INSERT INTO `book_web_log_all` VALUES (559, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/type/index.html', 'admin', 'Type', 'index', 'GET', 'a:0:{}', 1522138857);
INSERT INTO `book_web_log_all` VALUES (560, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/Admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', 1522138857);
INSERT INTO `book_web_log_all` VALUES (561, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.108)', 'http://www.tpadmin.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', 1522138956);

SET FOREIGN_KEY_CHECKS = 1;
