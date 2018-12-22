/*
Navicat SQLite Data Transfer

Source Server         : sl-webmaster
Source Server Version : 30706
Source Host           : :0

Target Server Type    : SQLite
Target Server Version : 30706
File Encoding         : 65001

Date: 2018-12-22 17:46:07
*/

PRAGMA foreign_keys = OFF;

-- ----------------------------
-- Table structure for "main"."t_sys_cfg"
-- ----------------------------
DROP TABLE "main"."t_sys_cfg";
CREATE TABLE "t_sys_cfg" (
"id"  INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
"cfg_name"  TEXT(100),
"cfg_value"  TEXT(3000),
"cfg_desc"  TEXT(200)
);

-- ----------------------------
-- Records of t_sys_cfg
-- ----------------------------
INSERT INTO "main"."t_sys_cfg" VALUES (1, 'app_name', 'guns-lite', 'guns-lite web框架');
-- ----------------------------
-- Table structure for "main"."t_sys_dept"
-- ----------------------------
DROP TABLE "main"."t_sys_dept";
CREATE TABLE "t_sys_dept" (
"id"  INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
"num"  INTEGER,
"pid"  INTEGER,
"pids"  TEXT(255),
"simplename"  TEXT(45),
"fullname"  TEXT(255),
"tips"  TEXT(255),
"version"  INTEGER
);

-- ----------------------------
-- Records of t_sys_dept
-- ----------------------------
INSERT INTO "main"."t_sys_dept" VALUES (24, 1, 0, '[0],', '总公司', '总公司', null, null);
INSERT INTO "main"."t_sys_dept" VALUES (25, 2, 24, '[0],[24],', '开发部', '开发部', null, null);
INSERT INTO "main"."t_sys_dept" VALUES (26, 3, 24, '[0],[24],', '运营部', '运营部', null, null);
INSERT INTO "main"."t_sys_dept" VALUES (27, 4, 24, '[0],[24],', '战略部', '战略部', null, null);

-- ----------------------------
-- Table structure for "main"."t_sys_dict"
-- ----------------------------
DROP TABLE "main"."t_sys_dict";
CREATE TABLE "t_sys_dict" (
"id"  INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
"num"  TEXT(32),
"pid"  INTEGER,
"name"  TEXT(255),
"tips"  TEXT(255)
);

-- ----------------------------
-- Records of t_sys_dict
-- ----------------------------
INSERT INTO "main"."t_sys_dict" VALUES (16, 0, 0, '状态', null);
INSERT INTO "main"."t_sys_dict" VALUES (17, 1, 16, '启用', null);
INSERT INTO "main"."t_sys_dict" VALUES (18, 2, 16, '禁用', null);
INSERT INTO "main"."t_sys_dict" VALUES (29, 0, 0, '性别', null);
INSERT INTO "main"."t_sys_dict" VALUES (30, 1, 29, '男', null);
INSERT INTO "main"."t_sys_dict" VALUES (31, 2, 29, '女', null);
INSERT INTO "main"."t_sys_dict" VALUES (35, 0, 0, '账号状态', null);
INSERT INTO "main"."t_sys_dict" VALUES (36, 1, 35, '启用', null);
INSERT INTO "main"."t_sys_dict" VALUES (37, 2, 35, '冻结', null);
INSERT INTO "main"."t_sys_dict" VALUES (38, 3, 35, '已删除', null);
INSERT INTO "main"."t_sys_dict" VALUES (53, 0, 0, '证件类型', null);
INSERT INTO "main"."t_sys_dict" VALUES (54, 1, 53, '身份证', null);
INSERT INTO "main"."t_sys_dict" VALUES (55, 2, 53, '护照', null);
INSERT INTO "main"."t_sys_dict" VALUES (65, 0, 0, '是否', null);
INSERT INTO "main"."t_sys_dict" VALUES (66, 1, 65, '是', null);
INSERT INTO "main"."t_sys_dict" VALUES (67, 0, 65, '否', null);

-- ----------------------------
-- Table structure for "main"."t_sys_expense"
-- ----------------------------
DROP TABLE "main"."t_sys_expense";
CREATE TABLE "t_sys_expense" (
"id"  INTEGER(11) NOT NULL,
"money"  REAL(20,2),
"desc"  TEXT(255),
"createtime"  TEXT,
"state"  INTEGER(11),
"userid"  INTEGER(11),
"processId"  TEXT(255),
"process_id"  TEXT(255),
PRIMARY KEY ("id")
);

-- ----------------------------
-- Records of t_sys_expense
-- ----------------------------

-- ----------------------------
-- Table structure for "main"."t_sys_login_log"
-- ----------------------------
DROP TABLE "main"."t_sys_login_log";
CREATE TABLE "t_sys_login_log" (
"id"  INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
"logname"  TEXT(255),
"userid"  INTEGER,
"createtime"  TEXT,
"succeed"  TEXT(255),
"message"  TEXT,
"ip"  TEXT(255)
);

-- ----------------------------
-- Records of t_sys_login_log
-- ----------------------------
INSERT INTO "main"."t_sys_login_log" VALUES (1, '登录日志', 1, '2018-12-21 13:44:50', '成功', null, '127.0.0.1');

-- ----------------------------
-- Table structure for "main"."t_sys_menu"
-- ----------------------------
DROP TABLE "main"."t_sys_menu";
CREATE TABLE "t_sys_menu" (
"id"  INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
"code"  TEXT(255),
"pcode"  TEXT(255),
"pcodes"  TEXT(255),
"name"  TEXT(255),
"icon"  TEXT(255),
"url"  TEXT(255),
"num"  INTEGER,
"levels"  INTEGER,
"ismenu"  INTEGER,
"tips"  TEXT(255),
"status"  INTEGER,
"isopen"  INTEGER
);

-- ----------------------------
-- Records of t_sys_menu
-- ----------------------------
INSERT INTO "main"."t_sys_menu" VALUES (105, 'system', 0, '[0],', '系统管理', 'fa-cog', '#', 4, 1, 1, null, 1, 1);
INSERT INTO "main"."t_sys_menu" VALUES (106, 'mgr', 'system', '[0],[system],', '用户管理', null, '/mgr', 1, 2, 1, null, 1, 0);
INSERT INTO "main"."t_sys_menu" VALUES (107, 'mgr_add', 'mgr', '[0],[system],[mgr],', '添加用户', null, '/mgr/add', 1, 3, 0, null, 1, null);
INSERT INTO "main"."t_sys_menu" VALUES (108, 'mgr_edit', 'mgr', '[0],[system],[mgr],', '修改用户', null, '/mgr/edit', 2, 3, 0, null, 1, null);
INSERT INTO "main"."t_sys_menu" VALUES (109, 'mgr_delete', 'mgr', '[0],[system],[mgr],', '删除用户', null, '/mgr/delete', 3, 3, 0, null, 1, 0);
INSERT INTO "main"."t_sys_menu" VALUES (110, 'mgr_reset', 'mgr', '[0],[system],[mgr],', '重置密码', null, '/mgr/reset', 4, 3, 0, null, 1, 0);
INSERT INTO "main"."t_sys_menu" VALUES (111, 'mgr_freeze', 'mgr', '[0],[system],[mgr],', '冻结用户', null, '/mgr/freeze', 5, 3, 0, null, 1, 0);
INSERT INTO "main"."t_sys_menu" VALUES (112, 'mgr_unfreeze', 'mgr', '[0],[system],[mgr],', '解除冻结用户', null, '/mgr/unfreeze', 6, 3, 0, null, 1, 0);
INSERT INTO "main"."t_sys_menu" VALUES (113, 'mgr_setRole', 'mgr', '[0],[system],[mgr],', '分配角色', null, '/mgr/setRole', 7, 3, 0, null, 1, 0);
INSERT INTO "main"."t_sys_menu" VALUES (114, 'role', 'system', '[0],[system],', '角色管理', null, '/role', 2, 2, 1, null, 1, 0);
INSERT INTO "main"."t_sys_menu" VALUES (115, 'role_add', 'role', '[0],[system],[role],', '添加角色', null, '/role/add', 1, 3, 0, null, 1, 0);
INSERT INTO "main"."t_sys_menu" VALUES (116, 'role_edit', 'role', '[0],[system],[role],', '修改角色', null, '/role/edit', 2, 3, 0, null, 1, 0);
INSERT INTO "main"."t_sys_menu" VALUES (117, 'role_remove', 'role', '[0],[system],[role],', '删除角色', null, '/role/remove', 3, 3, 0, null, 1, 0);
INSERT INTO "main"."t_sys_menu" VALUES (118, 'role_setAuthority', 'role', '[0],[system],[role],', '配置权限', null, '/role/setAuthority', 4, 3, 0, null, 1, 0);
INSERT INTO "main"."t_sys_menu" VALUES (119, 'menu', 'system', '[0],[system],', '菜单管理', null, '/menu', 4, 2, 1, null, 1, 0);
INSERT INTO "main"."t_sys_menu" VALUES (120, 'menu_add', 'menu', '[0],[system],[menu],', '添加菜单', null, '/menu/add', 1, 3, 0, null, 1, 0);
INSERT INTO "main"."t_sys_menu" VALUES (121, 'menu_edit', 'menu', '[0],[system],[menu],', '修改菜单', null, '/menu/edit', 2, 3, 0, null, 1, 0);
INSERT INTO "main"."t_sys_menu" VALUES (122, 'menu_remove', 'menu', '[0],[system],[menu],', '删除菜单', null, '/menu/remove', 3, 3, 0, null, 1, 0);
INSERT INTO "main"."t_sys_menu" VALUES (128, 'log', 'system', '[0],[system],', '业务日志', null, '/log', 6, 2, 1, null, 1, 0);
INSERT INTO "main"."t_sys_menu" VALUES (130, 'druid', 'system', '[0],[system],', '监控管理', null, '/druid', 7, 2, 1, null, 1, null);
INSERT INTO "main"."t_sys_menu" VALUES (131, 'dept', 'system', '[0],[system],', '部门管理', null, '/dept', 3, 2, 1, null, 1, null);
INSERT INTO "main"."t_sys_menu" VALUES (132, 'dict', 'system', '[0],[system],', '字典管理', null, '/dict', 4, 2, 1, null, 1, null);
INSERT INTO "main"."t_sys_menu" VALUES (133, 'loginLog', 'system', '[0],[system],', '登录日志', null, '/loginLog', 6, 2, 1, null, 1, null);
INSERT INTO "main"."t_sys_menu" VALUES (134, 'log_clean', 'log', '[0],[system],[log],', '清空日志', null, '/log/delLog', 3, 3, 0, null, 1, null);
INSERT INTO "main"."t_sys_menu" VALUES (135, 'dept_add', 'dept', '[0],[system],[dept],', '添加部门', null, '/dept/add', 1, 3, 0, null, 1, null);
INSERT INTO "main"."t_sys_menu" VALUES (136, 'dept_update', 'dept', '[0],[system],[dept],', '修改部门', null, '/dept/update', 1, 3, 0, null, 1, null);
INSERT INTO "main"."t_sys_menu" VALUES (137, 'dept_delete', 'dept', '[0],[system],[dept],', '删除部门', null, '/dept/delete', 1, 3, 0, null, 1, null);
INSERT INTO "main"."t_sys_menu" VALUES (138, 'dict_add', 'dict', '[0],[system],[dict],', '添加字典', null, '/dict/add', 1, 3, 0, null, 1, null);
INSERT INTO "main"."t_sys_menu" VALUES (139, 'dict_update', 'dict', '[0],[system],[dict],', '修改字典', null, '/dict/update', 1, 3, 0, null, 1, null);
INSERT INTO "main"."t_sys_menu" VALUES (140, 'dict_delete', 'dict', '[0],[system],[dict],', '删除字典', null, '/dict/delete', 1, 3, 0, null, 1, null);
INSERT INTO "main"."t_sys_menu" VALUES (141, 'notice', 'system', '[0],[system],', '通知管理', null, '/notice', 9, 2, 1, null, 1, null);
INSERT INTO "main"."t_sys_menu" VALUES (142, 'notice_add', 'notice', '[0],[system],[notice],', '添加通知', null, '/notice/add', 1, 3, 0, null, 1, null);
INSERT INTO "main"."t_sys_menu" VALUES (143, 'notice_update', 'notice', '[0],[system],[notice],', '修改通知', null, '/notice/update', 2, 3, 0, null, 1, null);
INSERT INTO "main"."t_sys_menu" VALUES (144, 'notice_delete', 'notice', '[0],[system],[notice],', '删除通知', null, '/notice/delete', 3, 3, 0, null, 1, null);
INSERT INTO "main"."t_sys_menu" VALUES (145, 'notice', 0, '[0],', '通知', 'fa-rocket', '/notice/hello', 1, 1, 1, null, 1, null);
INSERT INTO "main"."t_sys_menu" VALUES (148, 'code', 0, '[0],', '代码生成', 'fa-code', '/code', 3, 1, 0, null, 1, null);
INSERT INTO "main"."t_sys_menu" VALUES (149, 'api_mgr', 0, '[0],', '接口文档', 'fa-leaf', '/swagger-ui.html', 2, 1, 1, null, 1, null);
INSERT INTO "main"."t_sys_menu" VALUES (150, 'to_menu_edit', 'menu', '[0],[system],[menu],', '菜单编辑跳转', null, '/menu/menu_edit', 4, 3, 0, null, 1, null);
INSERT INTO "main"."t_sys_menu" VALUES (151, 'menu_list', 'menu', '[0],[system],[menu],', '菜单列表', null, '/menu/list', 5, 3, 0, null, 1, null);
INSERT INTO "main"."t_sys_menu" VALUES (152, 'to_dept_update', 'dept', '[0],[system],[dept],', '修改部门跳转', null, '/dept/dept_update', 4, 3, 0, null, 1, null);
INSERT INTO "main"."t_sys_menu" VALUES (153, 'dept_list', 'dept', '[0],[system],[dept],', '部门列表', null, '/dept/list', 5, 3, 0, null, 1, null);
INSERT INTO "main"."t_sys_menu" VALUES (154, 'dept_detail', 'dept', '[0],[system],[dept],', '部门详情', null, '/dept/detail', 6, 3, 0, null, 1, null);
INSERT INTO "main"."t_sys_menu" VALUES (155, 'to_dict_edit', 'dict', '[0],[system],[dict],', '修改菜单跳转', null, '/dict/dict_edit', 4, 3, 0, null, 1, null);
INSERT INTO "main"."t_sys_menu" VALUES (156, 'dict_list', 'dict', '[0],[system],[dict],', '字典列表', null, '/dict/list', 5, 3, 0, null, 1, null);
INSERT INTO "main"."t_sys_menu" VALUES (157, 'dict_detail', 'dict', '[0],[system],[dict],', '字典详情', null, '/dict/detail', 6, 3, 0, null, 1, null);
INSERT INTO "main"."t_sys_menu" VALUES (159, 'log_detail', 'log', '[0],[system],[log],', '日志详情', null, '/log/detail', 3, 3, 0, null, 1, null);
INSERT INTO "main"."t_sys_menu" VALUES (160, 'del_login_log', 'loginLog', '[0],[system],[loginLog],', '清空登录日志', null, '/loginLog/delLoginLog', 1, 3, 0, null, 1, null);
INSERT INTO "main"."t_sys_menu" VALUES (161, 'login_log_list', 'loginLog', '[0],[system],[loginLog],', '登录日志列表', null, '/loginLog/list', 2, 3, 0, null, 1, null);
INSERT INTO "main"."t_sys_menu" VALUES (162, 'to_role_edit', 'role', '[0],[system],[role],', '修改角色跳转', null, '/role/role_edit', 5, 3, 0, null, 1, null);
INSERT INTO "main"."t_sys_menu" VALUES (163, 'to_role_assign', 'role', '[0],[system],[role],', '角色分配跳转', null, '/role/role_assign', 6, 3, 0, null, 1, null);
INSERT INTO "main"."t_sys_menu" VALUES (164, 'role_list', 'role', '[0],[system],[role],', '角色列表', null, '/role/list', 7, 3, 0, null, 1, null);
INSERT INTO "main"."t_sys_menu" VALUES (165, 'to_assign_role', 'mgr', '[0],[system],[mgr],', '分配角色跳转', null, '/mgr/role_assign', 8, 3, 0, null, 1, null);
INSERT INTO "main"."t_sys_menu" VALUES (166, 'to_user_edit', 'mgr', '[0],[system],[mgr],', '编辑用户跳转', null, '/mgr/user_edit', 9, 3, 0, null, 1, null);
INSERT INTO "main"."t_sys_menu" VALUES (167, 'mgr_list', 'mgr', '[0],[system],[mgr],', '用户列表', null, '/mgr/list', 10, 3, 0, null, 1, null);
INSERT INTO "main"."t_sys_menu" VALUES (198, 'cfg', 'system', '[0],[system],', '参数管理', null, '/cfg', 10, 2, 1, null, 1, null);
INSERT INTO "main"."t_sys_menu" VALUES (199, 'cfg_add', 'cfg', '[0],[system],[cfg],', '添加系统参数', null, '/cfg/add', 1, 3, 0, null, 1, null);
INSERT INTO "main"."t_sys_menu" VALUES (200, 'cfg_update', 'cfg', '[0],[system],[cfg],', '修改系统参数', null, '/cfg/update', 2, 3, 0, null, 1, null);
INSERT INTO "main"."t_sys_menu" VALUES (201, 'cfg_delete', 'cfg', '[0],[system],[cfg],', '删除系统参数', null, '/cfg/delete', 3, 3, 0, null, 1, null);

-- ----------------------------
-- Table structure for "main"."t_sys_notice"
-- ----------------------------
DROP TABLE "main"."t_sys_notice";
CREATE TABLE "t_sys_notice" (
"id"  INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
"title"  TEXT(255),
"type"  INTEGER,
"content"  TEXT,
"createtime"  TEXT,
"creater"  INTEGER
);

-- ----------------------------
-- Records of t_sys_notice
-- ----------------------------
INSERT INTO "main"."t_sys_notice" VALUES (1, '世界', 10, '欢迎使用guns-lite', '2017-01-11 08:53:20', 1);

-- ----------------------------
-- Table structure for "main"."t_sys_operation_log"
-- ----------------------------
DROP TABLE "main"."t_sys_operation_log";
CREATE TABLE "t_sys_operation_log" (
"id"  INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
"logtype"  TEXT(255),
"logname"  TEXT(255),
"userid"  INTEGER,
"classname"  TEXT(255),
"method"  TEXT,
"createtime"  TEXT,
"succeed"  TEXT(255),
"message"  TEXT
);

-- ----------------------------
-- Records of t_sys_operation_log
-- ----------------------------
INSERT INTO "main"."t_sys_operation_log" VALUES (1, '业务日志', '清空登录日志', 1, 'cn.enilu.guns.admin.modular.system.controller.LoginLogController', 'delLog', '2018-11-27 23:49:15', '成功', '主键id=null');
INSERT INTO "main"."t_sys_operation_log" VALUES (2, '业务日志', '修改管理员', 1, 'cn.enilu.guns.admin.modular.system.controller.UserMgrController', 'edit', '2018-11-27 23:49:49', '成功', '账号=boss;;;');
INSERT INTO "main"."t_sys_operation_log" VALUES (3, '业务日志', '删除管理员', 1, 'cn.enilu.guns.api.controller.system.UserController', 'remove', '2018-11-28 00:01:33', '成功', '账号=test4');
INSERT INTO "main"."t_sys_operation_log" VALUES (4, '业务日志', '修改管理员', 1, 'cn.enilu.guns.admin.modular.system.controller.UserMgrController', 'edit', '2018-11-28 00:03:22', '成功', '账号=test2;;;');
INSERT INTO "main"."t_sys_operation_log" VALUES (5, '业务日志', '编辑管理员', 1, 'cn.enilu.guns.api.controller.system.UserController', 'save', '2018-11-28 00:08:26', '成功', '名字=测试3;;;');
INSERT INTO "main"."t_sys_operation_log" VALUES (6, '业务日志', '编辑管理员', 1, 'cn.enilu.guns.api.controller.system.UserController', 'save', '2018-11-28 00:10:37', '成功', '名字=测试3;;;');

-- ----------------------------
-- Table structure for "main"."t_sys_relation"
-- ----------------------------
DROP TABLE "main"."t_sys_relation";
CREATE TABLE "t_sys_relation" (
"id"  INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
"menuid"  INTEGER,
"roleid"  INTEGER
);

-- ----------------------------
-- Records of t_sys_relation
-- ----------------------------
INSERT INTO "main"."t_sys_relation" VALUES (149, 105, 1);
INSERT INTO "main"."t_sys_relation" VALUES (150, 106, 1);
INSERT INTO "main"."t_sys_relation" VALUES (151, 107, 1);
INSERT INTO "main"."t_sys_relation" VALUES (152, 108, 1);
INSERT INTO "main"."t_sys_relation" VALUES (153, 109, 1);
INSERT INTO "main"."t_sys_relation" VALUES (154, 110, 1);
INSERT INTO "main"."t_sys_relation" VALUES (155, 111, 1);
INSERT INTO "main"."t_sys_relation" VALUES (156, 112, 1);
INSERT INTO "main"."t_sys_relation" VALUES (157, 113, 1);
INSERT INTO "main"."t_sys_relation" VALUES (158, 165, 1);
INSERT INTO "main"."t_sys_relation" VALUES (159, 166, 1);
INSERT INTO "main"."t_sys_relation" VALUES (160, 167, 1);
INSERT INTO "main"."t_sys_relation" VALUES (161, 114, 1);
INSERT INTO "main"."t_sys_relation" VALUES (162, 115, 1);
INSERT INTO "main"."t_sys_relation" VALUES (163, 116, 1);
INSERT INTO "main"."t_sys_relation" VALUES (164, 117, 1);
INSERT INTO "main"."t_sys_relation" VALUES (165, 118, 1);
INSERT INTO "main"."t_sys_relation" VALUES (166, 162, 1);
INSERT INTO "main"."t_sys_relation" VALUES (167, 163, 1);
INSERT INTO "main"."t_sys_relation" VALUES (168, 164, 1);
INSERT INTO "main"."t_sys_relation" VALUES (169, 119, 1);
INSERT INTO "main"."t_sys_relation" VALUES (170, 120, 1);
INSERT INTO "main"."t_sys_relation" VALUES (171, 121, 1);
INSERT INTO "main"."t_sys_relation" VALUES (172, 122, 1);
INSERT INTO "main"."t_sys_relation" VALUES (173, 150, 1);
INSERT INTO "main"."t_sys_relation" VALUES (174, 151, 1);
INSERT INTO "main"."t_sys_relation" VALUES (175, 128, 1);
INSERT INTO "main"."t_sys_relation" VALUES (176, 134, 1);
INSERT INTO "main"."t_sys_relation" VALUES (178, 159, 1);
INSERT INTO "main"."t_sys_relation" VALUES (179, 130, 1);
INSERT INTO "main"."t_sys_relation" VALUES (180, 131, 1);
INSERT INTO "main"."t_sys_relation" VALUES (181, 135, 1);
INSERT INTO "main"."t_sys_relation" VALUES (182, 136, 1);
INSERT INTO "main"."t_sys_relation" VALUES (183, 137, 1);
INSERT INTO "main"."t_sys_relation" VALUES (184, 152, 1);
INSERT INTO "main"."t_sys_relation" VALUES (185, 153, 1);
INSERT INTO "main"."t_sys_relation" VALUES (186, 154, 1);
INSERT INTO "main"."t_sys_relation" VALUES (187, 132, 1);
INSERT INTO "main"."t_sys_relation" VALUES (188, 138, 1);
INSERT INTO "main"."t_sys_relation" VALUES (189, 139, 1);
INSERT INTO "main"."t_sys_relation" VALUES (190, 140, 1);
INSERT INTO "main"."t_sys_relation" VALUES (191, 155, 1);
INSERT INTO "main"."t_sys_relation" VALUES (192, 156, 1);
INSERT INTO "main"."t_sys_relation" VALUES (193, 157, 1);
INSERT INTO "main"."t_sys_relation" VALUES (194, 133, 1);
INSERT INTO "main"."t_sys_relation" VALUES (195, 160, 1);
INSERT INTO "main"."t_sys_relation" VALUES (196, 161, 1);
INSERT INTO "main"."t_sys_relation" VALUES (197, 141, 1);
INSERT INTO "main"."t_sys_relation" VALUES (198, 142, 1);
INSERT INTO "main"."t_sys_relation" VALUES (199, 143, 1);
INSERT INTO "main"."t_sys_relation" VALUES (200, 144, 1);
INSERT INTO "main"."t_sys_relation" VALUES (201, 198, 1);
INSERT INTO "main"."t_sys_relation" VALUES (202, 199, 1);
INSERT INTO "main"."t_sys_relation" VALUES (203, 200, 1);
INSERT INTO "main"."t_sys_relation" VALUES (204, 201, 1);
INSERT INTO "main"."t_sys_relation" VALUES (205, 145, 1);
INSERT INTO "main"."t_sys_relation" VALUES (206, 148, 1);
INSERT INTO "main"."t_sys_relation" VALUES (207, 149, 1);
INSERT INTO "main"."t_sys_relation" VALUES (208, 145, 2);
INSERT INTO "main"."t_sys_relation" VALUES (209, 148, 2);
INSERT INTO "main"."t_sys_relation" VALUES (210, 149, 2);

-- ----------------------------
-- Table structure for "main"."t_sys_role"
-- ----------------------------
DROP TABLE "main"."t_sys_role";
CREATE TABLE "t_sys_role" (
"id"  INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
"num"  INTEGER,
"pid"  INTEGER,
"name"  TEXT(255),
"deptid"  INTEGER,
"tips"  TEXT(255),
"version"  INTEGER
);

-- ----------------------------
-- Records of t_sys_role
-- ----------------------------
INSERT INTO "main"."t_sys_role" VALUES (1, 1, 0, '超级管理员', 24, 'administrator', 1);
INSERT INTO "main"."t_sys_role" VALUES (2, 1, 1, '开发人员', 25, 'developer', null);

-- ----------------------------
-- Table structure for "main"."t_sys_role_menu"
-- ----------------------------
DROP TABLE "main"."t_sys_role_menu";
CREATE TABLE "t_sys_role_menu" (
"roleId"  TEXT(32),
"menuId"  TEXT(32),
"id"  INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
"menu_id"  TEXT(255),
"role_id"  TEXT(255)
);

-- ----------------------------
-- Records of t_sys_role_menu
-- ----------------------------
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '0f9ccefe3c37446ab7dd4d8823b2674f', 1, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'f34c743c76d1487f8fd0c2469671e417', 2, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '5c2b4eee186b46b8ac80ce3bf1a31482', 3, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '7f8a8af316d547beac7d4263476571df', 4, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '175d06dcdd7d4aeaba7bfb31b9a6adf9', 5, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'd83e71c7552a4f1eb0986da5738d5455', 6, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'ef31791205dd4ca3b5c23a077feb1bc6', 7, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'b372f1d1c9714a808367ce9bbdaf52d5', 8, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'f13da3059ec441009c7ad8af3072dfa8', 9, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '83a127c18bac4e00829e9c9962803838', 10, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '233de9e289024088b9133e29dd959fca', 11, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'bf16dedfc88d45d0858a25a1f2b228ac', 12, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '32eeb7668dea4887847d15aac95b5df0', 13, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'e662fd578ef34423a4b2765290f1981e', 14, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '6f0262a2c4ab4655b01265f2394c8f2d', 15, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'c261eca005b54f37b4226b1833714f10', 16, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '8f2c142dee3b4714949724c3dfadb540', 17, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '45181d69e47947ebad4de4b5383cd9cb', 18, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'e53092c585504a77b6e2c5b3ec2e32c9', 19, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '3afbde86044c4d7fa040300e705c73fa', 20, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '15d567907c074d1a80034d6b77300c8a', 21, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '0c6199419432471283e07320040d7fed', 22, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'f70e928966304fdfbc8b0ae54e0e3d17', 23, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'a5a3efcf28154d2f8aba772b211455c3', 24, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'e7a12b99d3594562a4cb3f1acd5f4eb7', 25, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '62e0a6e9ec7d485485f99c1991173e63', 26, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'b489392439814f9eb208a676e351afb5', 27, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '8d88846e6dba4db4920742f32e308be4', 28, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'de344dcfa38240f6a656f15ef60af339', 29, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '28b180e83fbe40d78c909086233cabd2', 30, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '0a47185d7876405e85e4c203352bccc4', 31, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'ad3065cab4db4512967d993ef7c4f5ab', 32, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '06077b45c1b14755959e4f012314570b', 33, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'd1d4d7b46751456d8f840701d1746263', 34, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '5c6d010b5132479fa58fb88a1aedbd81', 35, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '230c7a019acf42208bcde7149c04efd2', 36, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'af3dd2a994f04bbda53998d8298aeb19', 37, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '52dcc185684d4920acb0f4a5280f7455', 38, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '23b643f8963a4eb591fa7395204e5013', 39, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'a5402be8e9c948a8872a3ce84ffc3294', 40, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'ac6f270034ab42b28a80728d255f32cf', 41, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'd86156b43c9b42728979e509aa058ac3', 42, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'ae4ec35909ae43d0a9ec7d99d382f0cd', 43, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '64ce61c4238a4c27880b17f70bec845d', 44, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'e9b41d0e3d8d483caccedc02f71c201f', 45, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'c75f7a083e0c47129a67630ea493b139', 46, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'b0edc6861a494b79b97990dc05f0a524', 47, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'e4256d7b0ffc4a02906cf900322b6213', 48, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'b19b23b0459a4754bf1fb8cb234450f2', 49, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '4dc997fef71e4862b9db22de8e99a618', 50, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '9f20a757a6bc40ddbb650c70debbf660', 51, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'f426468abf714b1599729f8c36ebbb0d', 52, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '1734e586e96941268a4c5248b593cef9', 53, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '6bb17a41f6394ed0a8a6faf5ff781354', 54, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '56d0658c5a8848818ac05e8ffa5c0570', 55, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'ce709456e867425297955b3c40406d7e', 56, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '3099f497480c4b1987bce3f3a26c3fb4', 57, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '4cd8e4e9519e4cff95465194fdcc8d88', 58, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '234f8ec3c2bc42bf9f6202aecae36fd6', 59, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'c3a44b478d3241b899b9c3f4611bc2b6', 60, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'fd63a8e389e04ff3a86c3cea53a3b9d5', 61, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '7c040dfd8db347e5956a3bc1764653dc', 62, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '17e1ee23ca1443f1bc886c2f5eb7c24b', 63, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '2275cb125710414e91b617dd7c62f12c', 64, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '0a972ce655cb4c84809d58668b655900', 65, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'fc52d5284b8f4522802383c1ef732242', 66, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '2cb327ad59b140828fd26eb2a46cb948', 67, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'dd965b2c1dfd493fb5efc7e4bcac99d4', 68, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '30a5e70a1456447ebf90b5546e9bc321', 69, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '2a63040409094f1e9dc535dd78ce15b7', 70, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '0706112ff5dc46e388064a99bcdb0561', 71, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'e864c78aba63448892cbcb6a3a7f4da7', 72, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'ff6cd243a77c4ae98dacf6149c816c75', 73, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '733d3f35d49f45af99ca9220048583ba', 74, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'bcf64d623fdd4519ae345b7a08c071a1', 75, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '66cc21d7ce104dd6877cbce114c59fb3', 76, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '309dc29ad3c34408a68df8f867a5c9ff', 77, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '96554b09a2dd4f82bab7546fa59acd35', 78, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'd568f4c2b687404e8aec7b9edcae5767', 79, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '2fab774f8b6d40cb9d7e187babab2d91', 80, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '45d958ca78304f25b51f6c71cf66f6d8', 81, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '44da90bc76a5419a841f4924333f7a66', 82, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '9a9557177d334c209cf73c3817fe3b63', 83, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '0a43d291e0c94ad88c8b690009279e34', 84, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '5244f5c38eb24b918e9ad64d456daa38', 85, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '6afc5075913d4df4b44a6476080e35a0', 86, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '1385ae887e5c4b8aa33fbf228be7f907', 87, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'e6b6224617b04090a76e46a4b048fb96', 88, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '3888f05aa4064f788ba7ec51c495ce7c', 89, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'cabbe834a7474675b899e8442b5c2604', 90, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'a11163584dfe456cbfd6fb2d4b74391b', 91, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'c76a84f871d047db955dd1465c845ac1', 92, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '02e86a61e99746bea34236ea73dd52a5', 93, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'd920314e925c451da6d881e7a29743b7', 94, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'd1e991ad38a8424daf9f7eb000ee27f4', 95, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '73a29d3f99224426b5a87c92da122275', 96, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '6b6de8c720c645a1808e1c3e9ccbfc90', 97, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'b2631bbdbf824cc4b74d819c87962c0d', 98, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '4781372b00bb4d52b429b58e72b80c68', 99, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'e461c62a1d5441619cd35612f3b40691', 100, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'f6fba69c3b704d79834b8bd2cc753729', 101, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '50ba60ee650e4c739e6abc3ab71e4960', 102, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '6075fc0cf0ef441b9d93cc3cab3445bf', 103, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '33aed9298643424783116e0cf0f7fcbe', 104, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'ef9f436c61654ec09efbfa79a40061cf', 105, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '17500ef3a9e44b4fabb240162a164fcb', 106, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '3f330d729ca34dc9825c46122be1bfae', 107, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '9822bafbe3454dfd8e8b974ebc304d03', 108, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '7db6207d0dab4d6e95a7eee4f2efe875', 109, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '31ed2243077c44448cce26abfd5ae574', 110, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '7125a72beee34b21ab3df9bf01b7bce6', 111, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '68cdbf694f71445c8587a20234d6fe31', 112, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '077cb6be4c7c41cc8955ee045a4f0286', 113, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '36e0faf5062b4f6b95d4167cbb1f8fea', 114, null, null);
INSERT INTO "main"."t_sys_role_menu" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '3c24111091ad4a70ad2d9cc361311d2f', 115, null, null);

-- ----------------------------
-- Table structure for "main"."t_sys_user"
-- ----------------------------
DROP TABLE "main"."t_sys_user";
CREATE TABLE "t_sys_user" (
"id"  INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
"avatar"  TEXT(255),
"account"  TEXT(45),
"password"  TEXT(45),
"salt"  TEXT(45),
"name"  TEXT(45),
"birthday"  TEXT,
"sex"  INTEGER,
"email"  TEXT(45),
"phone"  TEXT(45),
"roleid"  TEXT(255),
"deptid"  INTEGER,
"status"  INTEGER,
"createtime"  TEXT,
"version"  INTEGER
);

-- ----------------------------
-- Records of t_sys_user
-- ----------------------------
INSERT INTO "main"."t_sys_user" VALUES (1, null, 'admin', '6ab1f386d715cfb6be85de941d438b02', '8pgby', '管理员', '2017-05-05 00:00:00', 2, 'eniluzt@qq.com', null, 1, 27, 1, '2016-01-29 08:49:53', 25);
INSERT INTO "main"."t_sys_user" VALUES (45, null, 'boss', '71887a5ad666a18f709e1d4e693d5a35', '1f7bf', '老板', '2017-12-04 00:00:00', 1, null, null, '1,2', 24, 1, '2017-12-04 22:24:02', null);
INSERT INTO "main"."t_sys_user" VALUES (46, null, 'manager', 'b53cac62e7175637d4beb3b16b2f7915', 'j3cs9', '经理', '2017-12-04 00:00:00', 1, null, null, 1, 24, 1, '2017-12-04 22:24:24', null);
INSERT INTO "main"."t_sys_user" VALUES (47, null, 'developer', '4552805b07a4bf92ce1cea0373aab868', 'vscp9', '开发人员', '2017-12-31 00:00:00', 1, 'eniluzt@qq.com', null, 2, 25, 1, '2018-09-13 17:21:02', null);
INSERT INTO "main"."t_sys_user" VALUES (48, null, 'test', '4bd01ff1ebe93ad36877ca16f3c684d3', 'ed7k0', '测试', '1982-01-20 00:00:00', 1, ' test@qq.com', 15021591111, null, 26, 3, '2018-11-27 21:57:34', null);
INSERT INTO "main"."t_sys_user" VALUES (49, null, 'test2', 'ab9aa94c5f94d629798a2ba9a8acf903', '83dnp', '测试2', '2014-05-04 00:00:00', 2, 'test22@qq.com', 15021592222, null, 24, 2, '2018-11-27 22:00:10', null);
INSERT INTO "main"."t_sys_user" VALUES (50, null, 'test3', '0461fbaec67e1c61cd78d8c40fa8c3a7', 'gs7no', '测试3', '1970-01-01 00:00:00', 1, 'tttt@qq.com', 1111111, null, 24, 2, '2018-11-27 22:07:41', null);
INSERT INTO "main"."t_sys_user" VALUES (51, null, 'test4', '1a5366e7090e0ff8ad4e85b689011432', 'wz8oy', '测试4', '2018-11-13 00:00:00', 1, 'aaaa@qq', 11111, null, 24, 3, '2018-11-27 23:22:00', null);
INSERT INTO "main"."t_sys_user" VALUES (52, null, 'test5', '6cb2be91e862875b8afbad79fbbbed82', '1mgw7', '测试5', '2018-11-13 00:00:00', 2, 'aa@qq', 1111, null, 24, 1, '2018-11-28 00:12:43', null);

-- ----------------------------
-- Table structure for "main"."t_sys_user_role"
-- ----------------------------
DROP TABLE "main"."t_sys_user_role";
CREATE TABLE "t_sys_user_role" (
"roleId"  TEXT(32),
"userId"  TEXT(32),
"id"  INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
"role_id"  TEXT(255),
"user_id"  TEXT(255)
);

-- ----------------------------
-- Records of t_sys_user_role
-- ----------------------------
INSERT INTO "main"."t_sys_user_role" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '43e6c8d6d3134e5aa41ae2a85b87586b', 1, null, null);

-- ----------------------------
-- Table structure for "main"."t_sys_user_unit"
-- ----------------------------
DROP TABLE "main"."t_sys_user_unit";
CREATE TABLE "t_sys_user_unit" (
"userId"  TEXT(32),
"unitId"  TEXT(32),
"id"  INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
"unit_id"  TEXT(255),
"user_id"  TEXT(255)
);

-- ----------------------------
-- Records of t_sys_user_unit
-- ----------------------------
INSERT INTO "main"."t_sys_user_unit" VALUES ('43e6c8d6d3134e5aa41ae2a85b87586b', 'cff0e38c05544085b56dee30e97383b4', 1, null, null);
