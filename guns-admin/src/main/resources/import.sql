INSERT INTO `t_sys_dict`(id,value,pid,name,create_time,create_by,modify_time,modify_by) VALUES ('16', '0', '0', '状态', '2019-01-13 14:18:21', '1', '2019-01-13 14:18:21', '1');
INSERT INTO `t_sys_dict`(id,value,pid,name,create_time,create_by,modify_time,modify_by) VALUES ('17', '1', '16', '启用', '2019-01-13 14:18:21', '1', '2019-01-13 14:18:21', '1');
INSERT INTO `t_sys_dict`(id,value,pid,name,create_time,create_by,modify_time,modify_by) VALUES ('18', '2', '16', '禁用', '2019-01-13 14:18:21', '1', '2019-01-13 14:18:21', '1');
INSERT INTO `t_sys_dict`(id,value,pid,name,create_time,create_by,modify_time,modify_by) VALUES ('29', '0', '0', '性别', '2019-07-23 21:30:09', '1', '2019-07-23 21:30:09', '1');
INSERT INTO `t_sys_dict`(id,value,pid,name,create_time,create_by,modify_time,modify_by) VALUES ('30', '1', '29', '男', '2019-07-23 21:30:09', '1', '2019-07-23 21:30:09', '1');
INSERT INTO `t_sys_dict`(id,value,pid,name,create_time,create_by,modify_time,modify_by) VALUES ('31', '2', '29', '女', '2019-07-23 21:30:09', '1', '2019-07-23 21:30:09', '1');
INSERT INTO `t_sys_dict`(id,value,pid,name,create_time,create_by,modify_time,modify_by) VALUES ('35', '0', '0', '账号状态', '2019-01-13 14:18:21', '1', '2019-01-13 14:18:21', '1');
INSERT INTO `t_sys_dict`(id,value,pid,name,create_time,create_by,modify_time,modify_by) VALUES ('36', '1', '35', '启用', '2019-01-13 14:18:21', '1', '2019-01-13 14:18:21', '1');
INSERT INTO `t_sys_dict`(id,value,pid,name,create_time,create_by,modify_time,modify_by) VALUES ('37', '2', '35', '冻结', '2019-01-13 14:18:21', '1', '2019-01-13 14:18:21', '1');
INSERT INTO `t_sys_dict`(id,value,pid,name,create_time,create_by,modify_time,modify_by) VALUES ('38', '3', '35', '已删除', '2019-01-13 14:18:21', '1', '2019-01-13 14:18:21', '1');
INSERT INTO `t_sys_dict`(id,value,pid,name,create_time,create_by,modify_time,modify_by) VALUES ('53', '0', '0', '证件类型', '2019-01-13 14:18:21', '1', '2019-01-13 14:18:21', '1');
INSERT INTO `t_sys_dict`(id,value,pid,name,create_time,create_by,modify_time,modify_by) VALUES ('54', '1', '53', '身份证', '2019-01-13 14:18:21', '1', '2019-01-13 14:18:21', '1');
INSERT INTO `t_sys_dict`(id,value,pid,name,create_time,create_by,modify_time,modify_by) VALUES ('55', '2', '53', '护照', '2019-07-23 21:30:09', '1', '2019-07-23 21:30:09', '1');
INSERT INTO `t_sys_dict`(id,value,pid,name,create_time,create_by,modify_time,modify_by) VALUES ('68', '0', '0', '是否', '2019-07-23 21:30:09', '1', '2019-07-23 21:30:09', '1');
INSERT INTO `t_sys_dict`(id,value,pid,name,create_time,create_by,modify_time,modify_by) VALUES ('69', '1', '68', '是', '2019-07-23 21:30:09', '1', '2019-07-23 21:30:09', '1');
INSERT INTO `t_sys_dict`(id,value,pid,name,create_time,create_by,modify_time,modify_by) VALUES ('70', '0', '68', '否', '2019-01-13 14:18:21', '1', '2019-01-13 14:18:21', '1');
INSERT INTO `t_sys_dict`(id,value,pid,name,create_time,create_by,modify_time,modify_by) VALUES ('71', '0', '0', '消息类型', '2019-07-23 21:30:09', '1', '2019-07-23 21:30:09', '1');
INSERT INTO `t_sys_dict`(id,value,pid,name,create_time,create_by,modify_time,modify_by) VALUES ('72', '0', '71', '短信', '2019-07-23 21:30:09', '1', '2019-07-23 21:30:09', '1');
INSERT INTO `t_sys_dict`(id,value,pid,name,create_time,create_by,modify_time,modify_by) VALUES ('73', '1', '71', '邮件', '2019-07-23 21:30:09', '1', '2019-07-23 21:30:09', '1');

-- ----------------------------
-- Records of t_sys_cfg
-- ----------------------------
INSERT INTO `t_sys_cfg` VALUES ('1', null, null, '1', '2019-04-15 21:36:07', '应用名称update by 2019-03-27 11:47:04', 'system.app.name', 'guns-lite');
INSERT INTO `t_sys_cfg` VALUES ('2', null, null, '1', '2019-04-15 21:36:17', '系统默认上传文件路径', 'system.file.upload.path', '/data/guns-lite/runtime/upload');
INSERT INTO `t_sys_cfg` VALUES ('3', null, null, '1', '2019-04-15 21:36:17', '腾讯sms接口appid', 'api.tencent.sms.appid', '1400219425');
INSERT INTO `t_sys_cfg` VALUES ('4', null, null, '1', '2019-04-15 21:36:17', '腾讯sms接口appkey', 'api.tencent.sms.appkey', '5f71ed5325f3b292946530a1773e997a');
INSERT INTO `t_sys_cfg` VALUES ('5', null, null, '1', '2019-04-15 21:36:17', '腾讯sms接口签名参数', 'api.tencent.sms.sign', '需要去申请咯');

-- ----------------------------
-- Records of t_sys_dept
-- ----------------------------
INSERT INTO `t_sys_dept` VALUES ('1', '1', '2019-08-15 16:31:13', '1', '2019-08-15 16:31:13', '山迪亚集团', '1', '0', '[0],', '总公司', '', null);
INSERT INTO `t_sys_dept` VALUES ('2', '1', '2019-08-15 16:31:13', '1', '2019-08-15 16:31:13', '开发部', '2', '1', '[0],[1],', '开发部', null, null);
INSERT INTO `t_sys_dept` VALUES ('3', '1', '2019-08-15 16:31:13', '1', '2019-08-15 16:31:13', '运营部', '3', '1', '[0],[1],', '运营部', null, null);
INSERT INTO `t_sys_dept` VALUES ('4', '1', '2019-08-15 16:31:13', '1', '2019-08-15 16:31:13', '战略部', '4', '1', '[0],[1],', '战略部', null, null);
INSERT INTO `t_sys_dept` VALUES ('5', '1', '2019-08-15 16:31:13', '1', '2019-08-15 16:31:13', '人事部', '5', '1', '[0],[1],', '人事部', null, null);
INSERT INTO `t_sys_dept` VALUES ('6', '1', '2019-08-15 16:31:13', '1', '2019-08-15 16:31:13', '行政部', '6', '1', '[0],[1],', '行政部', null, null);
INSERT INTO `t_sys_dept` VALUES ('7', '1', '2019-08-15 16:31:13', '1', '2019-08-15 16:31:13', '山迪亚上海有限责任公司', '7', '1', '[0],[1],', '上海分公司', '', null);
INSERT INTO `t_sys_dept` VALUES ('8', '1', '2019-08-15 16:31:13', '1', '2019-08-15 16:31:13', '运维部', '8', '7', '[0],[1],[7],', '运维部', null, null);
INSERT INTO `t_sys_dept` VALUES ('9', '1', '2019-08-15 16:31:13', '1', '2019-08-15 16:31:13', '销售部', '9', '7', '[0],[1],[7],', '销售部', null, null);


-- ----------------------------
-- Records of t_sys_login_log
-- ----------------------------
INSERT INTO `t_sys_login_log` (`id`, `logname`, `userid`, `create_time`, `succeed`, `message`, `ip`) VALUES ('71', '登录日志', '1', '2019-05-10 13:17:43', '成功', null, '127.0.0.1');
INSERT INTO `t_sys_login_log` (`id`, `logname`, `userid`, `create_time`, `succeed`, `message`, `ip`) VALUES ('72', '登录日志', '1', '2019-05-12 13:36:56', '成功', null, '127.0.0.1');

-- ----------------------------
-- Records of t_sys_menu
-- ----------------------------
INSERT INTO `t_sys_menu` VALUES ('1', null, null, null, null, 'system', 'fa-cog', '1', '1', '1', '系统管理', '4', '0', '[0],', '1', null, '/system');
INSERT INTO `t_sys_menu` VALUES ('4', null, null, '1', '2019-04-16 18:59:15', 'mgr', '', '1', null, '2', '用户管理', '1', 'system', '[0],[system],', '1', null, '/mgr');
INSERT INTO `t_sys_menu` VALUES ('5', null, null, null, null, 'mgr_add', '', '0', null, '3', '添加用户', '1', 'mgr', '[0],[system],[mgr],', '1', null, '/mgr/add');
INSERT INTO `t_sys_menu` VALUES ('6', null, null, null, null, 'mgr_edit', '', '0', null, '3', '修改用户', '2', 'mgr', '[0],[system],[mgr],', '1', null, '/mgr/edit');
INSERT INTO `t_sys_menu` VALUES ('7', null, null, null, null, 'mgr_delete', '', '0', '0', '3', '删除用户', '3', 'mgr', '[0],[system],[mgr],', '1', null, '/mgr/delete');
INSERT INTO `t_sys_menu` VALUES ('8', null, null, null, null, 'mgr_reset', '', '0', '0', '3', '重置密码', '4', 'mgr', '[0],[system],[mgr],', '1', null, '/mgr/reset');
INSERT INTO `t_sys_menu` VALUES ('9', null, null, null, null, 'mgr_freeze', '', '0', '0', '3', '冻结用户', '5', 'mgr', '[0],[system],[mgr],', '1', null, '/mgr/freeze');
INSERT INTO `t_sys_menu` VALUES ('10', null, null, null, null, 'mgr_unfreeze', '', '0', '0', '3', '解除冻结用户', '6', 'mgr', '[0],[system],[mgr],', '1', null, '/mgr/unfreeze');
INSERT INTO `t_sys_menu` VALUES ('11', null, null, null, null, 'mgr_setRole', '', '0', '0', '3', '分配角色', '7', 'mgr', '[0],[system],[mgr],', '1', null, '/mgr/setRole');
INSERT INTO `t_sys_menu` VALUES ('12', null, null, null, null, 'role', '', '1', '0', '2', '角色管理', '2', 'system', '[0],[system],', '1', null, '/role');
INSERT INTO `t_sys_menu` VALUES ('13', null, null, null, null, 'role_add', '', '0', '0', '3', '添加角色', '1', 'role', '[0],[system],[role],', '1', null, '/role/add');
INSERT INTO `t_sys_menu` VALUES ('14', null, null, null, null, 'role_edit', '', '0', '0', '3', '修改角色', '2', 'role', '[0],[system],[role],', '1', null, '/role/edit');
INSERT INTO `t_sys_menu` VALUES ('15', null, null, null, null, 'role_remove', '', '0', '0', '3', '删除角色', '3', 'role', '[0],[system],[role],', '1', null, '/role/remove');
INSERT INTO `t_sys_menu` VALUES ('16', null, null, null, null, 'role_setAuthority', '', '0', '0', '3', '配置权限', '4', 'role', '[0],[system],[role],', '1', null, '/role/setAuthority');
INSERT INTO `t_sys_menu` VALUES ('17', null, null, null, null, 'menu', '', '1', '0', '2', '菜单管理', '4', 'system', '[0],[system],', '1', null, '/menu');
INSERT INTO `t_sys_menu` VALUES ('18', null, null, null, null, 'menu_add', '', '0', '0', '3', '添加菜单', '1', 'menu', '[0],[system],[menu],', '1', null, '/menu/add');
INSERT INTO `t_sys_menu` VALUES ('19', null, null, null, null, 'menu_edit', '', '0', '0', '3', '修改菜单', '2', 'menu', '[0],[system],[menu],', '1', null, '/menu/edit');
INSERT INTO `t_sys_menu` VALUES ('20', null, null, null, null, 'menu_remove', '', '0', '0', '3', '删除菜单', '3', 'menu', '[0],[system],[menu],', '1', null, '/menu/remove');
INSERT INTO `t_sys_menu` VALUES ('58', null, null, '47', '2019-06-02 10:25:31', 'log', null, '1', null, '2', '业务日志', '6', 'operationMgr', '[0],[operationMgr],', '1', null, '/log');
INSERT INTO `t_sys_menu` VALUES ('21', null, null, null, null, 'dept', '', '1', null, '2', '部门管理', '3', 'system', '[0],[system],', '1', null, '/dept');
INSERT INTO `t_sys_menu` VALUES ('22', null, null, null, null, 'dict', '', '1', null, '2', '字典管理', '4', 'system', '[0],[system],', '1', null, '/dict');
INSERT INTO `t_sys_menu` VALUES ('59', null, null, '47', '2019-06-02 10:25:36', 'loginLog', null, '1', null, '2', '登录日志', '6', 'operationMgr', '[0],[operationMgr],', '1', null, '/loginLog');
INSERT INTO `t_sys_menu` VALUES ('60', null, null, null, null, 'log_clean', '', '0', null, '3', '清空日志', '3', 'log', '[0],[system],[log],', '1', null, '/log/delLog');
INSERT INTO `t_sys_menu` VALUES ('36', null, null, null, null, 'dept_add', '', '0', null, '3', '添加部门', '1', 'dept', '[0],[system],[dept],', '1', null, '/dept/add');
INSERT INTO `t_sys_menu` VALUES ('23', null, null, null, null, 'dept_update', '', '0', null, '3', '修改部门', '1', 'dept', '[0],[system],[dept],', '1', null, '/dept/update');
INSERT INTO `t_sys_menu` VALUES ('24', null, null, null, null, 'dept_delete', '', '0', null, '3', '删除部门', '1', 'dept', '[0],[system],[dept],', '1', null, '/dept/delete');
INSERT INTO `t_sys_menu` VALUES ('25', null, null, null, null, 'dict_add', '', '0', null, '3', '添加字典', '1', 'dict', '[0],[system],[dict],', '1', null, '/dict/add');
INSERT INTO `t_sys_menu` VALUES ('26', null, null, null, null, 'dict_update', '', '0', null, '3', '修改字典', '1', 'dict', '[0],[system],[dict],', '1', null, '/dict/update');
INSERT INTO `t_sys_menu` VALUES ('27', null, null, null, null, 'dict_delete', '', '0', null, '3', '删除字典', '1', 'dict', '[0],[system],[dict],', '1', null, '/dict/delete');
INSERT INTO `t_sys_menu` VALUES ('28', null, null, null, null, 'to_menu_edit', '', '0', null, '3', '菜单编辑跳转', '4', 'menu', '[0],[system],[menu],', '1', null, '/menu/menu_edit');
INSERT INTO `t_sys_menu` VALUES ('29', null, null, null, null, 'menu_list', '', '0', null, '3', '菜单列表', '5', 'menu', '[0],[system],[menu],', '1', null, '/menu/list');
INSERT INTO `t_sys_menu` VALUES ('30', null, null, null, null, 'to_dept_update', '', '0', null, '3', '修改部门跳转', '4', 'dept', '[0],[system],[dept],', '1', null, '/dept/dept_update');
INSERT INTO `t_sys_menu` VALUES ('31', null, null, null, null, 'dept_list', '', '0', null, '3', '部门列表', '5', 'dept', '[0],[system],[dept],', '1', null, '/dept/list');
INSERT INTO `t_sys_menu` VALUES ('32', null, null, null, null, 'dept_detail', '', '0', null, '3', '部门详情', '6', 'dept', '[0],[system],[dept],', '1', null, '/dept/detail');
INSERT INTO `t_sys_menu` VALUES ('33', null, null, null, null, 'to_dict_edit', '', '0', null, '3', '修改菜单跳转', '4', 'dict', '[0],[system],[dict],', '1', null, '/dict/dict_edit');
INSERT INTO `t_sys_menu` VALUES ('34', null, null, null, null, 'dict_list', '', '0', null, '3', '字典列表', '5', 'dict', '[0],[system],[dict],', '1', null, '/dict/list');
INSERT INTO `t_sys_menu` VALUES ('35', null, null, null, null, 'dict_detail', '', '0', null, '3', '字典详情', '6', 'dict', '[0],[system],[dict],', '1', null, '/dict/detail');
INSERT INTO `t_sys_menu` VALUES ('61', null, null, null, null, 'log_detail', '', '0', null, '3', '日志详情', '3', 'log', '[0],[system],[log],', '1', null, '/log/detail');
INSERT INTO `t_sys_menu` VALUES ('62', null, null, null, null, 'del_login_log', '', '0', null, '3', '清空登录日志', '1', 'loginLog', '[0],[system],[loginLog],', '1', null, '/loginLog/delLoginLog');
INSERT INTO `t_sys_menu` VALUES ('63', null, null, null, null, 'login_log_list', '', '0', null, '3', '登录日志列表', '2', 'loginLog', '[0],[system],[loginLog],', '1', null, '/loginLog/list');
INSERT INTO `t_sys_menu` VALUES ('37', null, null, null, null, 'to_role_edit', '', '0', null, '3', '修改角色跳转', '5', 'role', '[0],[system],[role],', '1', null, '/role/role_edit');
INSERT INTO `t_sys_menu` VALUES ('38', null, null, null, null, 'to_role_assign', '', '0', null, '3', '角色分配跳转', '6', 'role', '[0],[system],[role],', '1', null, '/role/role_assign');
INSERT INTO `t_sys_menu` VALUES ('39', null, null, null, null, 'role_list', '', '0', null, '3', '角色列表', '7', 'role', '[0],[system],[role],', '1', null, '/role/list');
INSERT INTO `t_sys_menu` VALUES ('40', null, null, null, null, 'to_assign_role', '', '0', null, '3', '分配角色跳转', '8', 'mgr', '[0],[system],[mgr],', '1', null, '/mgr/role_assign');
INSERT INTO `t_sys_menu` VALUES ('41', null, null, null, null, 'to_user_edit', '', '0', null, '3', '编辑用户跳转', '9', 'mgr', '[0],[system],[mgr],', '1', null, '/mgr/user_edit');
INSERT INTO `t_sys_menu` VALUES ('42', null, null, null, null, 'mgr_list', '', '0', null, '3', '用户列表', '10', 'mgr', '[0],[system],[mgr],', '1', null, '/mgr/list');
INSERT INTO `t_sys_menu` VALUES ('43', null, null, null, null, 'cfg', '', '1', null, '2', '参数管理', '10', 'system', '[0],[system],', '1', null, '/cfg');
INSERT INTO `t_sys_menu` VALUES ('44', null, null, null, null, 'cfg_add', '', '0', null, '3', '添加系统参数', '1', 'cfg', '[0],[system],[cfg],', '1', null, '/cfg/add');
INSERT INTO `t_sys_menu` VALUES ('45', null, null, null, null, 'cfg_update', '', '0', null, '3', '修改系统参数', '2', 'cfg', '[0],[system],[cfg],', '1', null, '/cfg/update');
INSERT INTO `t_sys_menu` VALUES ('46', null, null, null, null, 'cfg_delete', '', '0', null, '3', '删除系统参数', '3', 'cfg', '[0],[system],[cfg],', '1', null, '/cfg/delete');
INSERT INTO `t_sys_menu` VALUES ('47', null, null, null, null, 'task', '', '1', null, '2', '任务管理', '11', 'system', '[0],[system],', '1', null, '/task');
INSERT INTO `t_sys_menu` VALUES ('48', null, null, null, null, 'task_add', '', '0', null, '3', '添加任务', '1', 'task', '[0],[system],[task],', '1', null, '/task/add');
INSERT INTO `t_sys_menu` VALUES ('49', null, null, null, null, 'task_update', '', '0', null, '3', '修改任务', '2', 'task', '[0],[system],[task],', '1', null, '/task/update');
INSERT INTO `t_sys_menu` VALUES ('50', null, null, null, null, 'task_delete', '', '0', null, '3', '删除任务', '3', 'task', '[0],[system],[task],', '1', null, '/task/delete');
INSERT INTO `t_sys_menu` VALUES ('56', '1', '2019-03-11 22:30:17', '1', '2019-03-11 22:30:17', 'editArticle', '', '1', null, '3', '编辑文章', '1', 'article', '[0],[cms],[article]', '1', null, '/article/edit');
INSERT INTO `t_sys_menu` VALUES ('3', null, null, '47', '2019-06-02 10:09:09', 'operationMgr', 'fa-wrench', '1', null, '1', '运维管理', '3', '0', '[0],', '1', null, '/optionMgr');
INSERT INTO `t_sys_menu` VALUES ('64', '47', '2019-06-02 10:10:20', '47', '2019-06-02 10:10:20', 'druid', '', '1', null, '2', '数据库监控', '1', 'operationMgr', '[0],[operationMgr],', '1', null, '/druid');
INSERT INTO `t_sys_menu` VALUES ('65', '47', '2019-06-02 10:10:20', '47', '2019-06-02 10:10:20', 'swagger', null, '1', null, '2', '接口文档', '2', 'operationMgr', '[0],[operationMgr],', '1', null, '/swagger-ui.html');
INSERT INTO `t_sys_menu` VALUES ('66', '1', '2019-06-10 21:26:52', '1', '2019-06-10 21:26:52', 'messageMgr', 'fa-envelope-o', '1', null, '1', '消息管理', '5', '0', '[0],', '1', null, '/message');
INSERT INTO `t_sys_menu` VALUES ('67', '1', '2019-06-10 21:27:34', '1', '2019-06-10 21:27:34', 'historyMessage', null, '1', null, '2', '历史消息', '1', 'messageMgr', '[0],[messageMgr],', '1', null, '/message/history');
INSERT INTO `t_sys_menu` VALUES ('68', '1', '2019-06-10 21:27:56', '1', '2019-06-10 21:27:56', 'messageTemplate', null, '1', null, '2', '消息模板', '2', 'messageMgr', '[0],[messageMgr],', '1', null, '/message/template');
INSERT INTO `t_sys_menu` VALUES ('69', '1', '2019-06-10 21:28:21', '1', '2019-06-10 21:28:21', 'messageSender', null, '1', null, '2', '消息发送器', '3', 'messageMgr', '[0],[messageMgr],', '1', null, '/message/sender');

-- ----------------------------
-- Records of t_sys_notice
-- ----------------------------
INSERT INTO `t_sys_notice` (`id`, `title`, `type`, `content`, `create_time`, `create_by`, `modify_time`, `modify_by`) VALUES ('1', '世界', '10', '欢迎使用guns-lite后台管理系统，点击查看<a href=\"http://enilu.gitee.io/guns-lite\" target=\"_blank\">官方文档</a>', '2017-01-11 08:53:20', '1', '2019-01-08 23:30:58', '1');

-- ----------------------------
-- Records of t_sys_operation_log
-- ----------------------------
INSERT INTO `t_sys_operation_log` (`id`, `logtype`, `logname`, `userid`, `classname`, `method`, `create_time`, `succeed`, `message`) VALUES ('76', '业务日志', '编辑文章', '1', 'cn.enilu.guns.api.controller.cms.ArticleMgrController', 'upload', '2019-05-10 13:22:49', '成功', '名称=null;;;');
INSERT INTO `t_sys_operation_log` (`id`, `logtype`, `logname`, `userid`, `classname`, `method`, `create_time`, `succeed`, `message`) VALUES ('77', '业务日志', '编辑文章', '1', 'cn.enilu.guns.api.controller.cms.ArticleMgrController', 'upload', '2019-05-10 13:31:09', '成功', '名称=null;;;');

-- ----------------------------
-- Records of t_sys_relation
-- ----------------------------
INSERT INTO `t_sys_relation` VALUES ('72', '65', '1');
INSERT INTO `t_sys_relation` VALUES ('71', '64', '1');
INSERT INTO `t_sys_relation` VALUES ('70', '63', '1');
INSERT INTO `t_sys_relation` VALUES ('69', '62', '1');
INSERT INTO `t_sys_relation` VALUES ('68', '59', '1');
INSERT INTO `t_sys_relation` VALUES ('67', '61', '1');
INSERT INTO `t_sys_relation` VALUES ('66', '60', '1');
INSERT INTO `t_sys_relation` VALUES ('65', '58', '1');
INSERT INTO `t_sys_relation` VALUES ('64', '3', '1');
INSERT INTO `t_sys_relation` VALUES ('60', '56', '1');
INSERT INTO `t_sys_relation` VALUES ('57', '2', '1');
INSERT INTO `t_sys_relation` VALUES ('55', '50', '1');
INSERT INTO `t_sys_relation` VALUES ('54', '49', '1');
INSERT INTO `t_sys_relation` VALUES ('53', '48', '1');
INSERT INTO `t_sys_relation` VALUES ('52', '47', '1');
INSERT INTO `t_sys_relation` VALUES ('51', '46', '1');
INSERT INTO `t_sys_relation` VALUES ('50', '45', '1');
INSERT INTO `t_sys_relation` VALUES ('49', '44', '1');
INSERT INTO `t_sys_relation` VALUES ('48', '43', '1');
INSERT INTO `t_sys_relation` VALUES ('47', '35', '1');
INSERT INTO `t_sys_relation` VALUES ('46', '34', '1');
INSERT INTO `t_sys_relation` VALUES ('45', '33', '1');
INSERT INTO `t_sys_relation` VALUES ('44', '27', '1');
INSERT INTO `t_sys_relation` VALUES ('43', '26', '1');
INSERT INTO `t_sys_relation` VALUES ('42', '25', '1');
INSERT INTO `t_sys_relation` VALUES ('41', '22', '1');
INSERT INTO `t_sys_relation` VALUES ('40', '36', '1');
INSERT INTO `t_sys_relation` VALUES ('39', '32', '1');
INSERT INTO `t_sys_relation` VALUES ('38', '31', '1');
INSERT INTO `t_sys_relation` VALUES ('37', '30', '1');
INSERT INTO `t_sys_relation` VALUES ('36', '24', '1');
INSERT INTO `t_sys_relation` VALUES ('35', '23', '1');
INSERT INTO `t_sys_relation` VALUES ('34', '21', '1');
INSERT INTO `t_sys_relation` VALUES ('33', '29', '1');
INSERT INTO `t_sys_relation` VALUES ('32', '28', '1');
INSERT INTO `t_sys_relation` VALUES ('31', '20', '1');
INSERT INTO `t_sys_relation` VALUES ('30', '19', '1');
INSERT INTO `t_sys_relation` VALUES ('29', '18', '1');
INSERT INTO `t_sys_relation` VALUES ('28', '17', '1');
INSERT INTO `t_sys_relation` VALUES ('27', '39', '1');
INSERT INTO `t_sys_relation` VALUES ('26', '38', '1');
INSERT INTO `t_sys_relation` VALUES ('25', '37', '1');
INSERT INTO `t_sys_relation` VALUES ('24', '16', '1');
INSERT INTO `t_sys_relation` VALUES ('23', '15', '1');
INSERT INTO `t_sys_relation` VALUES ('22', '14', '1');
INSERT INTO `t_sys_relation` VALUES ('21', '13', '1');
INSERT INTO `t_sys_relation` VALUES ('20', '12', '1');
INSERT INTO `t_sys_relation` VALUES ('19', '42', '1');
INSERT INTO `t_sys_relation` VALUES ('18', '41', '1');
INSERT INTO `t_sys_relation` VALUES ('17', '40', '1');
INSERT INTO `t_sys_relation` VALUES ('16', '11', '1');
INSERT INTO `t_sys_relation` VALUES ('15', '10', '1');
INSERT INTO `t_sys_relation` VALUES ('14', '9', '1');
INSERT INTO `t_sys_relation` VALUES ('13', '8', '1');
INSERT INTO `t_sys_relation` VALUES ('12', '7', '1');
INSERT INTO `t_sys_relation` VALUES ('11', '6', '1');
INSERT INTO `t_sys_relation` VALUES ('10', '5', '1');
INSERT INTO `t_sys_relation` VALUES ('9', '4', '1');
INSERT INTO `t_sys_relation` VALUES ('8', '1', '1');
INSERT INTO `t_sys_relation` VALUES ('7', '56', '2');
INSERT INTO `t_sys_relation` VALUES ('73', '66', '1');
INSERT INTO `t_sys_relation` VALUES ('74', '67', '1');
INSERT INTO `t_sys_relation` VALUES ('75', '68', '1');
INSERT INTO `t_sys_relation` VALUES ('76', '69', '1');


-- ----------------------------
-- Records of t_sys_role
-- ----------------------------
INSERT INTO `t_sys_role` VALUES ('1', null, null, null, null, '24', '超级管理员', '1', '0', 'administrator', '1');
INSERT INTO `t_sys_role` VALUES ('2', null, null, null, null, '25', '网站管理员', '1', '1', 'developer', null);

-- ----------------------------
-- Records of t_sys_task
-- ----------------------------
INSERT INTO `t_sys_task` (`id`, `name`, `job_group`, `job_class`, `note`, `cron`, `data`, `exec_at`, `exec_result`, `disabled`, `create_time`, `create_by`, `concurrent`, `modify_time`, `modify_by`) VALUES ('1', '测试任务', 'default', 'cn.enilu.guns.service.task.job.HelloJob', '测试任务,每30分钟行一次', '0 0/30 * * * ?', '{\n\"appname\": \"guns-lite\",\n\"version\":1\n}\n            \n            \n            \n            \n            \n            \n            \n            \n            \n            \n            \n            ', '2019-03-27 11:47:00', '执行成功', '0', '2018-12-28 09:54:00', '1', '0', '2019-03-27 11:47:11', '-1');

-- ----------------------------
-- Records of t_sys_task_log
-- ----------------------------

-- ----------------------------
-- Records of t_sys_user
-- ----------------------------

INSERT INTO `t_sys_user` VALUES ('-1', null, null, null, null, 'system', null, null, null, null, '应用系统', 'avatar.png', null, null, null, null, null, null);
INSERT INTO `t_sys_user` VALUES ('1', null, '2016-01-29 08:49:53', '1', '2019-03-20 23:45:24', 'admin', 'avatar.png', '2017-05-05 00:00:00', '3', 'eniluzt@qq.com', '管理员', '6ab1f386d715cfb6be85de941d438b02', null, '1', '8pgby', '2', '1', '25');
INSERT INTO `t_sys_user` VALUES ('2', null, '2018-09-13 17:21:02', '1', '2019-01-09 23:05:51', 'developer', 'avatar.png', '2017-12-31 00:00:00', '4', 'eniluzt@qq.com', '网站管理员', '4552805b07a4bf92ce1cea0373aab868', '', '2', 'vscp9', '1', '1', null);

-- ----------------------------
-- Records of t_test_boy
-- ----------------------------
INSERT INTO `t_test_boy` (`id`, `create_by`, `create_time`, `modify_by`, `modify_time`, `age`, `birthday`, `has_girl_friend`, `name`) VALUES ('1', null, null, null, null, '18', '2000-01-01', '1', '张三');


-- ----------------------------
-- Records of t_message_sender
-- ----------------------------
INSERT INTO `t_message_sender` VALUES ('1', null, null, null, null, 'tencentSmsSender', ' 腾讯短信服务', null);
INSERT INTO `t_message_sender` VALUES ('2', null, null, null, null, 'defaultEmailSender', '默认邮件发送器', null);

-- ----------------------------
-- Records of t_message_template
-- ----------------------------
INSERT INTO `t_message_template` VALUES ('1', null, null, null, null, 'REGISTER_CODE', '注册页面，点击获取验证码', '【腾讯云】校验码{1}，请于5分钟内完成验证，如非本人操作请忽略本短信。', '1', '注册验证码', 0);
INSERT INTO `t_message_template` VALUES ('2', null, null, null, null, 'EMAIL_TEST', '测试发送', '你好:{1},欢迎使用{2}', '2', '测试邮件', 1);
INSERT INTO `t_message_template` VALUES ('3', null, null, null, null, 'EMAIL_HTML_TEMPLATE_TEST', '测试发送模板邮件', '你好<strong>${userName}</strong>欢迎使用<font color=\"red\">${appName}</font>,这是html模板邮件', '2', '测试发送模板邮件', 1);

-- ----------------------------
-- Records of t_message
-- ----------------------------
INSERT INTO `t_message` VALUES ('1', null, '2019-06-10 21:20:16', null, null, '【腾讯云】校验码1032，请于5分钟内完成验证，如非本人操作请忽略本短信。', '15021592814', '2', 'REGISTER_CODE', '0');
