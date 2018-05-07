/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50149
Source Host           : localhost:3306
Source Database       : guns-lite

Target Server Type    : MYSQL
Target Server Version : 50149
File Encoding         : 65001

Date: 2018-04-05 22:00:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_sys_cfg`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_cfg`;
CREATE TABLE `t_sys_cfg` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `cfg_name` varchar(100) DEFAULT NULL COMMENT '参数名',
  `cfg_value` varchar(3000) DEFAULT NULL COMMENT '参数值',
  `cfg_desc` varchar(200) DEFAULT NULL COMMENT '参数描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=331 DEFAULT CHARSET=utf8 COMMENT='系统参数';

-- ----------------------------
-- Records of t_sys_cfg
-- ----------------------------
INSERT INTO `t_sys_cfg` VALUES ('1', 'JS_API_TICKET', 'test', '微信JSAPI_TICKET(produt:kgt8ON7yVITDhtdwci0qeYBa_xOxkaEccepDVZel0heq1M9pKgrfFWOlX2MfHEt122psCpElf4V5eePHPouJPg)');
INSERT INTO `t_sys_cfg` VALUES ('2', 'ACCESS_TOKEN', 'test', '微信Token');

-- ----------------------------
-- Table structure for `t_sys_dept`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_dept`;
CREATE TABLE `t_sys_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `num` int(11) DEFAULT NULL COMMENT '排序',
  `pid` int(11) DEFAULT NULL COMMENT '父部门id',
  `pids` varchar(255) DEFAULT NULL COMMENT '父级ids',
  `simplename` varchar(45) DEFAULT NULL COMMENT '简称',
  `fullname` varchar(255) DEFAULT NULL COMMENT '全称',
  `tips` varchar(255) DEFAULT NULL COMMENT '提示',
  `version` int(11) DEFAULT NULL COMMENT '版本（乐观锁保留字段）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of t_sys_dept
-- ----------------------------
INSERT INTO `t_sys_dept` VALUES ('24', '1', '0', '[0],', '总公司', '总公司', '', null);
INSERT INTO `t_sys_dept` VALUES ('25', '2', '24', '[0],[24],', '开发部', '开发部', '', null);
INSERT INTO `t_sys_dept` VALUES ('26', '3', '24', '[0],[24],', '运营部', '运营部', '', null);
INSERT INTO `t_sys_dept` VALUES ('27', '4', '24', '[0],[24],', '战略部', '战略部', '', null);

-- ----------------------------
-- Table structure for `t_sys_dict`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_dict`;
CREATE TABLE `t_sys_dict` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `num` varchar(32) DEFAULT NULL COMMENT '排序',
  `pid` int(11) DEFAULT NULL COMMENT '父级字典',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `tips` varchar(255) DEFAULT NULL COMMENT '提示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COMMENT='字典表';

-- ----------------------------
-- Records of t_sys_dict
-- ----------------------------
INSERT INTO `t_sys_dict` VALUES ('16', '0', '0', '状态', null);
INSERT INTO `t_sys_dict` VALUES ('17', '1', '16', '启用', null);
INSERT INTO `t_sys_dict` VALUES ('18', '2', '16', '禁用', null);
INSERT INTO `t_sys_dict` VALUES ('29', '0', '0', '性别', null);
INSERT INTO `t_sys_dict` VALUES ('30', '1', '29', '男', null);
INSERT INTO `t_sys_dict` VALUES ('31', '2', '29', '女', null);
INSERT INTO `t_sys_dict` VALUES ('35', '0', '0', '账号状态', null);
INSERT INTO `t_sys_dict` VALUES ('36', '1', '35', '启用', null);
INSERT INTO `t_sys_dict` VALUES ('37', '2', '35', '冻结', null);
INSERT INTO `t_sys_dict` VALUES ('38', '3', '35', '已删除', null);
INSERT INTO `t_sys_dict` VALUES ('39', '0', '0', '银行卡类型', null);
INSERT INTO `t_sys_dict` VALUES ('40', '0', '39', '借记卡', null);
INSERT INTO `t_sys_dict` VALUES ('41', '1', '39', '信用卡', null);
INSERT INTO `t_sys_dict` VALUES ('44', '0', '0', '联系人关系', null);
INSERT INTO `t_sys_dict` VALUES ('45', '1', '44', '父子', null);
INSERT INTO `t_sys_dict` VALUES ('46', '2', '44', '母子', null);
INSERT INTO `t_sys_dict` VALUES ('47', '3', '44', '配偶', null);
INSERT INTO `t_sys_dict` VALUES ('48', '4', '44', '朋友', null);
INSERT INTO `t_sys_dict` VALUES ('49', '5', '44', '子女', null);
INSERT INTO `t_sys_dict` VALUES ('50', '6', '44', '兄弟姐妹', null);
INSERT INTO `t_sys_dict` VALUES ('53', '0', '0', '证件类型', null);
INSERT INTO `t_sys_dict` VALUES ('54', '1', '53', '身份证', null);
INSERT INTO `t_sys_dict` VALUES ('55', '2', '53', '护照', null);
INSERT INTO `t_sys_dict` VALUES ('56', '0', '0', '学历类型', null);
INSERT INTO `t_sys_dict` VALUES ('57', '1', '56', '博士', null);
INSERT INTO `t_sys_dict` VALUES ('58', '2', '56', '硕士', null);
INSERT INTO `t_sys_dict` VALUES ('59', '3', '56', '本科', null);
INSERT INTO `t_sys_dict` VALUES ('60', '4', '56', '专科', null);
INSERT INTO `t_sys_dict` VALUES ('61', '5', '56', '高中及以下', null);

-- ----------------------------
-- Table structure for `t_sys_expense`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_expense`;
CREATE TABLE `t_sys_expense` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `money` decimal(20,2) DEFAULT NULL COMMENT '报销金额',
  `desc` varchar(255) DEFAULT '' COMMENT '描述',
  `createtime` datetime DEFAULT NULL,
  `state` int(11) DEFAULT NULL COMMENT '状态: 1.待提交  2:待审核   3.审核通过 4:驳回',
  `userid` int(11) DEFAULT NULL COMMENT '用户id',
  `processId` varchar(255) DEFAULT NULL COMMENT '流程定义id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='报销表';

-- ----------------------------
-- Records of t_sys_expense
-- ----------------------------

-- ----------------------------
-- Table structure for `t_sys_login_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_login_log`;
CREATE TABLE `t_sys_login_log` (
  `id` int(65) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `logname` varchar(255) DEFAULT NULL COMMENT '日志名称',
  `userid` int(65) DEFAULT NULL COMMENT '管理员id',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `succeed` varchar(255) DEFAULT NULL COMMENT '是否执行成功',
  `message` text COMMENT '具体消息',
  `ip` varchar(255) DEFAULT NULL COMMENT '登录ip',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=372 DEFAULT CHARSET=utf8 COMMENT='登录记录';

-- ----------------------------
-- Records of t_sys_login_log
-- ----------------------------
INSERT INTO `t_sys_login_log` VALUES ('360', '登录日志', '1', '2018-04-05 21:15:22', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `t_sys_login_log` VALUES ('361', '退出日志', '1', '2018-04-05 21:17:17', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `t_sys_login_log` VALUES ('362', '登录日志', '1', '2018-04-05 21:17:23', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `t_sys_login_log` VALUES ('363', '登录日志', '1', '2018-04-05 21:18:26', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `t_sys_login_log` VALUES ('364', '退出日志', '1', '2018-04-05 21:18:49', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `t_sys_login_log` VALUES ('365', '登录日志', '1', '2018-04-05 21:18:50', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `t_sys_login_log` VALUES ('366', '退出日志', '1', '2018-04-05 21:21:01', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `t_sys_login_log` VALUES ('367', '登录日志', '1', '2018-04-05 21:21:02', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `t_sys_login_log` VALUES ('368', '登录日志', '1', '2018-04-05 21:21:53', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `t_sys_login_log` VALUES ('369', '退出日志', '1', '2018-04-05 21:24:33', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `t_sys_login_log` VALUES ('370', '登录日志', '1', '2018-04-05 21:25:27', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `t_sys_login_log` VALUES ('371', '登录日志', '1', '2018-04-05 21:45:23', '成功', null, '0:0:0:0:0:0:0:1');

-- ----------------------------
-- Table structure for `t_sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_menu`;
CREATE TABLE `t_sys_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `code` varchar(255) DEFAULT NULL COMMENT '菜单编号',
  `pcode` varchar(255) DEFAULT NULL COMMENT '菜单父编号',
  `pcodes` varchar(255) DEFAULT NULL COMMENT '当前菜单的所有父菜单编号',
  `name` varchar(255) DEFAULT NULL COMMENT '菜单名称',
  `icon` varchar(255) DEFAULT NULL COMMENT '菜单图标',
  `url` varchar(255) DEFAULT NULL COMMENT 'url地址',
  `num` int(65) DEFAULT NULL COMMENT '菜单排序号',
  `levels` int(65) DEFAULT NULL COMMENT '菜单层级',
  `ismenu` int(11) DEFAULT NULL COMMENT '是否是菜单（1：是  0：不是）',
  `tips` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` int(65) DEFAULT NULL COMMENT '菜单状态 :  1:启用   0:不启用',
  `isopen` int(11) DEFAULT NULL COMMENT '是否打开:    1:打开   0:不打开',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of t_sys_menu
-- ----------------------------
INSERT INTO `t_sys_menu` VALUES ('105', 'system', '0', '[0],', '系统管理', 'fa-cog', '#', '4', '1', '1', null, '1', '1');
INSERT INTO `t_sys_menu` VALUES ('106', 'mgr', 'system', '[0],[system],', '用户管理', '', '/mgr', '1', '2', '1', null, '1', '0');
INSERT INTO `t_sys_menu` VALUES ('107', 'mgr_add', 'mgr', '[0],[system],[mgr],', '添加用户', null, '/mgr/add', '1', '3', '0', null, '1', '0');
INSERT INTO `t_sys_menu` VALUES ('108', 'mgr_edit', 'mgr', '[0],[system],[mgr],', '修改用户', null, '/mgr/edit', '2', '3', '0', null, '1', '0');
INSERT INTO `t_sys_menu` VALUES ('109', 'mgr_delete', 'mgr', '[0],[system],[mgr],', '删除用户', null, '/mgr/delete', '3', '3', '0', null, '1', '0');
INSERT INTO `t_sys_menu` VALUES ('110', 'mgr_reset', 'mgr', '[0],[system],[mgr],', '重置密码', null, '/mgr/reset', '4', '3', '0', null, '1', '0');
INSERT INTO `t_sys_menu` VALUES ('111', 'mgr_freeze', 'mgr', '[0],[system],[mgr],', '冻结用户', null, '/mgr/freeze', '5', '3', '0', null, '1', '0');
INSERT INTO `t_sys_menu` VALUES ('112', 'mgr_unfreeze', 'mgr', '[0],[system],[mgr],', '解除冻结用户', null, '/mgr/unfreeze', '6', '3', '0', null, '1', '0');
INSERT INTO `t_sys_menu` VALUES ('113', 'mgr_setRole', 'mgr', '[0],[system],[mgr],', '分配角色', null, '/mgr/setRole', '7', '3', '0', null, '1', '0');
INSERT INTO `t_sys_menu` VALUES ('114', 'role', 'system', '[0],[system],', '角色管理', null, '/role', '2', '2', '1', null, '1', '0');
INSERT INTO `t_sys_menu` VALUES ('115', 'role_add', 'role', '[0],[system],[role],', '添加角色', null, '/role/add', '1', '3', '0', null, '1', '0');
INSERT INTO `t_sys_menu` VALUES ('116', 'role_edit', 'role', '[0],[system],[role],', '修改角色', null, '/role/edit', '2', '3', '0', null, '1', '0');
INSERT INTO `t_sys_menu` VALUES ('117', 'role_remove', 'role', '[0],[system],[role],', '删除角色', null, '/role/remove', '3', '3', '0', null, '1', '0');
INSERT INTO `t_sys_menu` VALUES ('118', 'role_setAuthority', 'role', '[0],[system],[role],', '配置权限', null, '/role/setAuthority', '4', '3', '0', null, '1', '0');
INSERT INTO `t_sys_menu` VALUES ('119', 'menu', 'system', '[0],[system],', '菜单管理', null, '/menu', '4', '2', '1', null, '1', '0');
INSERT INTO `t_sys_menu` VALUES ('120', 'menu_add', 'menu', '[0],[system],[menu],', '添加菜单', null, '/menu/add', '1', '3', '0', null, '1', '0');
INSERT INTO `t_sys_menu` VALUES ('121', 'menu_edit', 'menu', '[0],[system],[menu],', '修改菜单', null, '/menu/edit', '2', '3', '0', null, '1', '0');
INSERT INTO `t_sys_menu` VALUES ('122', 'menu_remove', 'menu', '[0],[system],[menu],', '删除菜单', null, '/menu/remove', '3', '3', '0', null, '1', '0');
INSERT INTO `t_sys_menu` VALUES ('128', 'log', 'system', '[0],[system],', '业务日志', null, '/log', '6', '2', '1', null, '1', '0');
INSERT INTO `t_sys_menu` VALUES ('130', 'druid', 'system', '[0],[system],', '监控管理', null, '/druid', '7', '2', '1', null, '1', null);
INSERT INTO `t_sys_menu` VALUES ('131', 'dept', 'system', '[0],[system],', '部门管理', null, '/dept', '3', '2', '1', null, '1', null);
INSERT INTO `t_sys_menu` VALUES ('132', 'dict', 'system', '[0],[system],', '字典管理', null, '/dict', '4', '2', '1', null, '1', null);
INSERT INTO `t_sys_menu` VALUES ('133', 'loginLog', 'system', '[0],[system],', '登录日志', null, '/loginLog', '6', '2', '1', null, '1', null);
INSERT INTO `t_sys_menu` VALUES ('134', 'log_clean', 'log', '[0],[system],[log],', '清空日志', null, '/log/delLog', '3', '3', '0', null, '1', null);
INSERT INTO `t_sys_menu` VALUES ('135', 'dept_add', 'dept', '[0],[system],[dept],', '添加部门', null, '/dept/add', '1', '3', '0', null, '1', null);
INSERT INTO `t_sys_menu` VALUES ('136', 'dept_update', 'dept', '[0],[system],[dept],', '修改部门', null, '/dept/update', '1', '3', '0', null, '1', null);
INSERT INTO `t_sys_menu` VALUES ('137', 'dept_delete', 'dept', '[0],[system],[dept],', '删除部门', null, '/dept/delete', '1', '3', '0', null, '1', null);
INSERT INTO `t_sys_menu` VALUES ('138', 'dict_add', 'dict', '[0],[system],[dict],', '添加字典', null, '/dict/add', '1', '3', '0', null, '1', null);
INSERT INTO `t_sys_menu` VALUES ('139', 'dict_update', 'dict', '[0],[system],[dict],', '修改字典', null, '/dict/update', '1', '3', '0', null, '1', null);
INSERT INTO `t_sys_menu` VALUES ('140', 'dict_delete', 'dict', '[0],[system],[dict],', '删除字典', null, '/dict/delete', '1', '3', '0', null, '1', null);
INSERT INTO `t_sys_menu` VALUES ('141', 'notice', 'system', '[0],[system],', '通知管理', null, '/notice', '9', '2', '1', null, '1', null);
INSERT INTO `t_sys_menu` VALUES ('142', 'notice_add', 'notice', '[0],[system],[notice],', '添加通知', null, '/notice/add', '1', '3', '0', null, '1', null);
INSERT INTO `t_sys_menu` VALUES ('143', 'notice_update', 'notice', '[0],[system],[notice],', '修改通知', null, '/notice/update', '2', '3', '0', null, '1', null);
INSERT INTO `t_sys_menu` VALUES ('144', 'notice_delete', 'notice', '[0],[system],[notice],', '删除通知', null, '/notice/delete', '3', '3', '0', null, '1', null);
INSERT INTO `t_sys_menu` VALUES ('145', 'hello', '0', '[0],', '通知', 'fa-rocket', '/notice/hello', '1', '1', '1', null, '1', null);
INSERT INTO `t_sys_menu` VALUES ('148', 'code', '0', '[0],', '代码生成', 'fa-code', '/code', '3', '1', '0', null, '1', null);
INSERT INTO `t_sys_menu` VALUES ('149', 'api_mgr', '0', '[0],', '接口文档', 'fa-leaf', '/swagger-ui.html', '2', '1', '1', null, '1', null);
INSERT INTO `t_sys_menu` VALUES ('150', 'to_menu_edit', 'menu', '[0],[system],[menu],', '菜单编辑跳转', '', '/menu/menu_edit', '4', '3', '0', null, '1', null);
INSERT INTO `t_sys_menu` VALUES ('151', 'menu_list', 'menu', '[0],[system],[menu],', '菜单列表', '', '/menu/list', '5', '3', '0', null, '1', null);
INSERT INTO `t_sys_menu` VALUES ('152', 'to_dept_update', 'dept', '[0],[system],[dept],', '修改部门跳转', '', '/dept/dept_update', '4', '3', '0', null, '1', null);
INSERT INTO `t_sys_menu` VALUES ('153', 'dept_list', 'dept', '[0],[system],[dept],', '部门列表', '', '/dept/list', '5', '3', '0', null, '1', null);
INSERT INTO `t_sys_menu` VALUES ('154', 'dept_detail', 'dept', '[0],[system],[dept],', '部门详情', '', '/dept/detail', '6', '3', '0', null, '1', null);
INSERT INTO `t_sys_menu` VALUES ('155', 'to_dict_edit', 'dict', '[0],[system],[dict],', '修改菜单跳转', '', '/dict/dict_edit', '4', '3', '0', null, '1', null);
INSERT INTO `t_sys_menu` VALUES ('156', 'dict_list', 'dict', '[0],[system],[dict],', '字典列表', '', '/dict/list', '5', '3', '0', null, '1', null);
INSERT INTO `t_sys_menu` VALUES ('157', 'dict_detail', 'dict', '[0],[system],[dict],', '字典详情', '', '/dict/detail', '6', '3', '0', null, '1', null);
INSERT INTO `t_sys_menu` VALUES ('158', 'log_list', 'log', '[0],[system],[log],', '日志列表', '', '/log/list', '2', '3', '0', null, '1', null);
INSERT INTO `t_sys_menu` VALUES ('159', 'log_detail', 'log', '[0],[system],[log],', '日志详情', '', '/log/detail', '3', '3', '0', null, '1', null);
INSERT INTO `t_sys_menu` VALUES ('160', 'del_login_log', 'loginLog', '[0],[system],[loginLog],', '清空登录日志', '', '/loginLog/delLoginLog', '1', '3', '0', null, '1', null);
INSERT INTO `t_sys_menu` VALUES ('161', 'login_log_list', 'loginLog', '[0],[system],[loginLog],', '登录日志列表', '', '/loginLog/list', '2', '3', '0', null, '1', null);
INSERT INTO `t_sys_menu` VALUES ('162', 'to_role_edit', 'role', '[0],[system],[role],', '修改角色跳转', '', '/role/role_edit', '5', '3', '0', null, '1', null);
INSERT INTO `t_sys_menu` VALUES ('163', 'to_role_assign', 'role', '[0],[system],[role],', '角色分配跳转', '', '/role/role_assign', '6', '3', '0', null, '1', null);
INSERT INTO `t_sys_menu` VALUES ('164', 'role_list', 'role', '[0],[system],[role],', '角色列表', '', '/role/list', '7', '3', '0', null, '1', null);
INSERT INTO `t_sys_menu` VALUES ('165', 'to_assign_role', 'mgr', '[0],[system],[mgr],', '分配角色跳转', '', '/mgr/role_assign', '8', '3', '0', null, '1', null);
INSERT INTO `t_sys_menu` VALUES ('166', 'to_user_edit', 'mgr', '[0],[system],[mgr],', '编辑用户跳转', '', '/mgr/user_edit', '9', '3', '0', null, '1', null);
INSERT INTO `t_sys_menu` VALUES ('167', 'mgr_list', 'mgr', '[0],[system],[mgr],', '用户列表', '', '/mgr/list', '10', '3', '0', null, '1', null);
INSERT INTO `t_sys_menu` VALUES ('168', 'expense', '0', '[0],', '报销管理', 'fa-clone', '#', '5', '1', '1', null, '0', null);
INSERT INTO `t_sys_menu` VALUES ('169', 'expense_fill', 'expense', '[0],[expense],', '报销申请', '', '/expense', '1', '2', '1', null, '0', null);
INSERT INTO `t_sys_menu` VALUES ('170', 'expense_progress', 'expense', '[0],[expense],', '报销审批', '', '/process', '2', '2', '1', null, '0', null);
INSERT INTO `t_sys_menu` VALUES ('199', 'cfg_add', 'cfg', '[0],[system],[cfg],', '添加系统参数', '', '/cfg/add', '1', '3', '0', null, '1', null);
INSERT INTO `t_sys_menu` VALUES ('200', 'cfg_update', 'cfg', '[0],[system],[cfg],', '修改系统参数', '', '/cfg/update', '2', '3', '0', null, '1', null);
INSERT INTO `t_sys_menu` VALUES ('201', 'cfg_delete', 'cfg', '[0],[system],[cfg],', '删除系统参数', '', '/cfg/delete', '3', '3', '0', null, '1', null);

-- ----------------------------
-- Table structure for `t_sys_notice`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_notice`;
CREATE TABLE `t_sys_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `type` int(11) DEFAULT NULL COMMENT '类型',
  `content` text COMMENT '内容',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `creater` int(11) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='通知表';

-- ----------------------------
-- Records of t_sys_notice
-- ----------------------------
INSERT INTO `t_sys_notice` VALUES ('6', '世界', '10', '欢迎使用后台管理系统', '2017-01-11 08:53:20', '1');
INSERT INTO `t_sys_notice` VALUES ('8', '你好', null, '你好', '2017-05-10 19:28:57', '1');

-- ----------------------------
-- Table structure for `t_sys_operation_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_operation_log`;
CREATE TABLE `t_sys_operation_log` (
  `id` int(65) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `logtype` varchar(255) DEFAULT NULL COMMENT '日志类型',
  `logname` varchar(255) DEFAULT NULL COMMENT '日志名称',
  `userid` int(65) DEFAULT NULL COMMENT '用户id',
  `classname` varchar(255) DEFAULT NULL COMMENT '类名称',
  `method` text COMMENT '方法名称',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `succeed` varchar(255) DEFAULT NULL COMMENT '是否成功',
  `message` text COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='操作日志';

-- ----------------------------
-- Table structure for `t_sys_relation`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_relation`;
CREATE TABLE `t_sys_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `menuid` bigint(11) DEFAULT NULL COMMENT '菜单id',
  `roleid` int(11) DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4569 DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of t_sys_relation
-- ----------------------------
INSERT INTO `t_sys_relation` VALUES ('4483', '105', '1');
INSERT INTO `t_sys_relation` VALUES ('4484', '106', '1');
INSERT INTO `t_sys_relation` VALUES ('4485', '107', '1');
INSERT INTO `t_sys_relation` VALUES ('4486', '108', '1');
INSERT INTO `t_sys_relation` VALUES ('4487', '109', '1');
INSERT INTO `t_sys_relation` VALUES ('4488', '110', '1');
INSERT INTO `t_sys_relation` VALUES ('4489', '111', '1');
INSERT INTO `t_sys_relation` VALUES ('4490', '112', '1');
INSERT INTO `t_sys_relation` VALUES ('4491', '113', '1');
INSERT INTO `t_sys_relation` VALUES ('4492', '165', '1');
INSERT INTO `t_sys_relation` VALUES ('4493', '166', '1');
INSERT INTO `t_sys_relation` VALUES ('4494', '167', '1');
INSERT INTO `t_sys_relation` VALUES ('4495', '114', '1');
INSERT INTO `t_sys_relation` VALUES ('4496', '115', '1');
INSERT INTO `t_sys_relation` VALUES ('4497', '116', '1');
INSERT INTO `t_sys_relation` VALUES ('4498', '117', '1');
INSERT INTO `t_sys_relation` VALUES ('4499', '118', '1');
INSERT INTO `t_sys_relation` VALUES ('4500', '162', '1');
INSERT INTO `t_sys_relation` VALUES ('4501', '163', '1');
INSERT INTO `t_sys_relation` VALUES ('4502', '164', '1');
INSERT INTO `t_sys_relation` VALUES ('4503', '119', '1');
INSERT INTO `t_sys_relation` VALUES ('4504', '120', '1');
INSERT INTO `t_sys_relation` VALUES ('4505', '121', '1');
INSERT INTO `t_sys_relation` VALUES ('4506', '122', '1');
INSERT INTO `t_sys_relation` VALUES ('4507', '150', '1');
INSERT INTO `t_sys_relation` VALUES ('4508', '151', '1');
INSERT INTO `t_sys_relation` VALUES ('4509', '128', '1');
INSERT INTO `t_sys_relation` VALUES ('4510', '134', '1');
INSERT INTO `t_sys_relation` VALUES ('4511', '158', '1');
INSERT INTO `t_sys_relation` VALUES ('4512', '159', '1');
INSERT INTO `t_sys_relation` VALUES ('4513', '130', '1');
INSERT INTO `t_sys_relation` VALUES ('4514', '131', '1');
INSERT INTO `t_sys_relation` VALUES ('4515', '135', '1');
INSERT INTO `t_sys_relation` VALUES ('4516', '136', '1');
INSERT INTO `t_sys_relation` VALUES ('4517', '137', '1');
INSERT INTO `t_sys_relation` VALUES ('4518', '152', '1');
INSERT INTO `t_sys_relation` VALUES ('4519', '153', '1');
INSERT INTO `t_sys_relation` VALUES ('4520', '154', '1');
INSERT INTO `t_sys_relation` VALUES ('4521', '132', '1');
INSERT INTO `t_sys_relation` VALUES ('4522', '138', '1');
INSERT INTO `t_sys_relation` VALUES ('4523', '139', '1');
INSERT INTO `t_sys_relation` VALUES ('4524', '140', '1');
INSERT INTO `t_sys_relation` VALUES ('4525', '155', '1');
INSERT INTO `t_sys_relation` VALUES ('4526', '156', '1');
INSERT INTO `t_sys_relation` VALUES ('4527', '157', '1');
INSERT INTO `t_sys_relation` VALUES ('4528', '133', '1');
INSERT INTO `t_sys_relation` VALUES ('4529', '160', '1');
INSERT INTO `t_sys_relation` VALUES ('4530', '161', '1');
INSERT INTO `t_sys_relation` VALUES ('4531', '141', '1');
INSERT INTO `t_sys_relation` VALUES ('4532', '142', '1');
INSERT INTO `t_sys_relation` VALUES ('4533', '143', '1');
INSERT INTO `t_sys_relation` VALUES ('4534', '144', '1');
INSERT INTO `t_sys_relation` VALUES ('4535', '198', '1');
INSERT INTO `t_sys_relation` VALUES ('4536', '199', '1');
INSERT INTO `t_sys_relation` VALUES ('4537', '200', '1');
INSERT INTO `t_sys_relation` VALUES ('4538', '201', '1');
INSERT INTO `t_sys_relation` VALUES ('4539', '145', '1');
INSERT INTO `t_sys_relation` VALUES ('4540', '148', '1');
INSERT INTO `t_sys_relation` VALUES ('4541', '149', '1');
INSERT INTO `t_sys_relation` VALUES ('4542', '171', '1');
INSERT INTO `t_sys_relation` VALUES ('4543', '172', '1');
INSERT INTO `t_sys_relation` VALUES ('4544', '173', '1');
INSERT INTO `t_sys_relation` VALUES ('4545', '174', '1');
INSERT INTO `t_sys_relation` VALUES ('4546', '175', '1');
INSERT INTO `t_sys_relation` VALUES ('4547', '176', '1');
INSERT INTO `t_sys_relation` VALUES ('4548', '177', '1');
INSERT INTO `t_sys_relation` VALUES ('4549', '178', '1');
INSERT INTO `t_sys_relation` VALUES ('4550', '179', '1');
INSERT INTO `t_sys_relation` VALUES ('4551', '180', '1');
INSERT INTO `t_sys_relation` VALUES ('4552', '181', '1');
INSERT INTO `t_sys_relation` VALUES ('4553', '182', '1');
INSERT INTO `t_sys_relation` VALUES ('4554', '183', '1');
INSERT INTO `t_sys_relation` VALUES ('4555', '184', '1');
INSERT INTO `t_sys_relation` VALUES ('4556', '185', '1');
INSERT INTO `t_sys_relation` VALUES ('4557', '186', '1');
INSERT INTO `t_sys_relation` VALUES ('4558', '187', '1');
INSERT INTO `t_sys_relation` VALUES ('4559', '188', '1');
INSERT INTO `t_sys_relation` VALUES ('4560', '189', '1');
INSERT INTO `t_sys_relation` VALUES ('4561', '195', '1');
INSERT INTO `t_sys_relation` VALUES ('4562', '190', '1');
INSERT INTO `t_sys_relation` VALUES ('4563', '191', '1');
INSERT INTO `t_sys_relation` VALUES ('4564', '192', '1');
INSERT INTO `t_sys_relation` VALUES ('4565', '193', '1');
INSERT INTO `t_sys_relation` VALUES ('4566', '194', '1');
INSERT INTO `t_sys_relation` VALUES ('4567', '196', '1');
INSERT INTO `t_sys_relation` VALUES ('4568', '197', '1');

-- ----------------------------
-- Table structure for `t_sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role`;
CREATE TABLE `t_sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `num` int(11) DEFAULT NULL COMMENT '序号',
  `pid` int(11) DEFAULT NULL COMMENT '父角色id',
  `name` varchar(255) DEFAULT NULL COMMENT '角色名称',
  `deptid` int(11) DEFAULT NULL COMMENT '部门名称',
  `tips` varchar(255) DEFAULT NULL COMMENT '提示',
  `version` int(11) DEFAULT NULL COMMENT '保留字段(暂时没用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of t_sys_role
-- ----------------------------
INSERT INTO `t_sys_role` VALUES ('1', '1', '0', '超级管理员', '24', 'administrator', '1');

-- ----------------------------
-- Table structure for `t_sys_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role_menu`;
CREATE TABLE `t_sys_role_menu` (
  `roleId` varchar(32) DEFAULT NULL,
  `menuId` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色菜单关系';

-- ----------------------------
-- Records of t_sys_role_menu
-- ----------------------------
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '0f9ccefe3c37446ab7dd4d8823b2674f');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'f34c743c76d1487f8fd0c2469671e417');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '5c2b4eee186b46b8ac80ce3bf1a31482');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '7f8a8af316d547beac7d4263476571df');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '175d06dcdd7d4aeaba7bfb31b9a6adf9');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'd83e71c7552a4f1eb0986da5738d5455');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'ef31791205dd4ca3b5c23a077feb1bc6');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'b372f1d1c9714a808367ce9bbdaf52d5');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'f13da3059ec441009c7ad8af3072dfa8');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '83a127c18bac4e00829e9c9962803838');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '233de9e289024088b9133e29dd959fca');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'bf16dedfc88d45d0858a25a1f2b228ac');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '32eeb7668dea4887847d15aac95b5df0');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'e662fd578ef34423a4b2765290f1981e');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '6f0262a2c4ab4655b01265f2394c8f2d');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'c261eca005b54f37b4226b1833714f10');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '8f2c142dee3b4714949724c3dfadb540');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '45181d69e47947ebad4de4b5383cd9cb');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'e53092c585504a77b6e2c5b3ec2e32c9');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '3afbde86044c4d7fa040300e705c73fa');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '15d567907c074d1a80034d6b77300c8a');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '0c6199419432471283e07320040d7fed');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'f70e928966304fdfbc8b0ae54e0e3d17');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'a5a3efcf28154d2f8aba772b211455c3');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'e7a12b99d3594562a4cb3f1acd5f4eb7');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '62e0a6e9ec7d485485f99c1991173e63');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'b489392439814f9eb208a676e351afb5');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '8d88846e6dba4db4920742f32e308be4');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'de344dcfa38240f6a656f15ef60af339');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '28b180e83fbe40d78c909086233cabd2');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '0a47185d7876405e85e4c203352bccc4');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'ad3065cab4db4512967d993ef7c4f5ab');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '06077b45c1b14755959e4f012314570b');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'd1d4d7b46751456d8f840701d1746263');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '5c6d010b5132479fa58fb88a1aedbd81');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '230c7a019acf42208bcde7149c04efd2');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'af3dd2a994f04bbda53998d8298aeb19');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '52dcc185684d4920acb0f4a5280f7455');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '23b643f8963a4eb591fa7395204e5013');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'a5402be8e9c948a8872a3ce84ffc3294');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'ac6f270034ab42b28a80728d255f32cf');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'd86156b43c9b42728979e509aa058ac3');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'ae4ec35909ae43d0a9ec7d99d382f0cd');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '64ce61c4238a4c27880b17f70bec845d');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'e9b41d0e3d8d483caccedc02f71c201f');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'c75f7a083e0c47129a67630ea493b139');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'b0edc6861a494b79b97990dc05f0a524');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'e4256d7b0ffc4a02906cf900322b6213');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'b19b23b0459a4754bf1fb8cb234450f2');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '4dc997fef71e4862b9db22de8e99a618');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '9f20a757a6bc40ddbb650c70debbf660');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'f426468abf714b1599729f8c36ebbb0d');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '1734e586e96941268a4c5248b593cef9');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '6bb17a41f6394ed0a8a6faf5ff781354');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '56d0658c5a8848818ac05e8ffa5c0570');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'ce709456e867425297955b3c40406d7e');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '3099f497480c4b1987bce3f3a26c3fb4');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '4cd8e4e9519e4cff95465194fdcc8d88');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '234f8ec3c2bc42bf9f6202aecae36fd6');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'c3a44b478d3241b899b9c3f4611bc2b6');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'fd63a8e389e04ff3a86c3cea53a3b9d5');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '7c040dfd8db347e5956a3bc1764653dc');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '17e1ee23ca1443f1bc886c2f5eb7c24b');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '2275cb125710414e91b617dd7c62f12c');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '0a972ce655cb4c84809d58668b655900');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'fc52d5284b8f4522802383c1ef732242');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '2cb327ad59b140828fd26eb2a46cb948');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'dd965b2c1dfd493fb5efc7e4bcac99d4');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '30a5e70a1456447ebf90b5546e9bc321');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '2a63040409094f1e9dc535dd78ce15b7');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '0706112ff5dc46e388064a99bcdb0561');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'e864c78aba63448892cbcb6a3a7f4da7');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'ff6cd243a77c4ae98dacf6149c816c75');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '733d3f35d49f45af99ca9220048583ba');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'bcf64d623fdd4519ae345b7a08c071a1');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '66cc21d7ce104dd6877cbce114c59fb3');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '309dc29ad3c34408a68df8f867a5c9ff');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '96554b09a2dd4f82bab7546fa59acd35');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'd568f4c2b687404e8aec7b9edcae5767');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '2fab774f8b6d40cb9d7e187babab2d91');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '45d958ca78304f25b51f6c71cf66f6d8');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '44da90bc76a5419a841f4924333f7a66');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '9a9557177d334c209cf73c3817fe3b63');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '0a43d291e0c94ad88c8b690009279e34');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '5244f5c38eb24b918e9ad64d456daa38');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '6afc5075913d4df4b44a6476080e35a0');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '1385ae887e5c4b8aa33fbf228be7f907');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'e6b6224617b04090a76e46a4b048fb96');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '3888f05aa4064f788ba7ec51c495ce7c');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'cabbe834a7474675b899e8442b5c2604');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'a11163584dfe456cbfd6fb2d4b74391b');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'c76a84f871d047db955dd1465c845ac1');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '02e86a61e99746bea34236ea73dd52a5');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'd920314e925c451da6d881e7a29743b7');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'd1e991ad38a8424daf9f7eb000ee27f4');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '73a29d3f99224426b5a87c92da122275');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '6b6de8c720c645a1808e1c3e9ccbfc90');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'b2631bbdbf824cc4b74d819c87962c0d');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '4781372b00bb4d52b429b58e72b80c68');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'e461c62a1d5441619cd35612f3b40691');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'f6fba69c3b704d79834b8bd2cc753729');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '50ba60ee650e4c739e6abc3ab71e4960');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '6075fc0cf0ef441b9d93cc3cab3445bf');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '33aed9298643424783116e0cf0f7fcbe');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'ef9f436c61654ec09efbfa79a40061cf');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '17500ef3a9e44b4fabb240162a164fcb');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '3f330d729ca34dc9825c46122be1bfae');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '9822bafbe3454dfd8e8b974ebc304d03');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '7db6207d0dab4d6e95a7eee4f2efe875');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '31ed2243077c44448cce26abfd5ae574');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '7125a72beee34b21ab3df9bf01b7bce6');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '68cdbf694f71445c8587a20234d6fe31');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '077cb6be4c7c41cc8955ee045a4f0286');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '36e0faf5062b4f6b95d4167cbb1f8fea');
INSERT INTO `t_sys_role_menu` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '3c24111091ad4a70ad2d9cc361311d2f');

-- ----------------------------
-- Table structure for `t_sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user`;
CREATE TABLE `t_sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `account` varchar(45) DEFAULT NULL COMMENT '账号',
  `password` varchar(45) DEFAULT NULL COMMENT '密码',
  `salt` varchar(45) DEFAULT NULL COMMENT 'md5密码盐',
  `name` varchar(45) DEFAULT NULL COMMENT '名字',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `sex` int(11) DEFAULT NULL COMMENT '性别（1：男 2：女）',
  `email` varchar(45) DEFAULT NULL COMMENT '电子邮件',
  `phone` varchar(45) DEFAULT NULL COMMENT '电话',
  `roleid` varchar(255) DEFAULT NULL COMMENT '角色id',
  `deptid` int(11) DEFAULT NULL COMMENT '部门id',
  `status` int(11) DEFAULT NULL COMMENT '状态(1：启用  2：冻结  3：删除）',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `version` int(11) DEFAULT NULL COMMENT '保留字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of t_sys_user
-- ----------------------------
INSERT INTO `t_sys_user` VALUES ('1', null, 'admin', '6ab1f386d715cfb6be85de941d438b02', '8pgby', '张三', '2017-05-05 00:00:00', '2', 'eniluzt@qq.com', null, '1', '27', '1', '2016-01-29 08:49:53', '25');
INSERT INTO `t_sys_user` VALUES ('45', null, 'boss', '71887a5ad666a18f709e1d4e693d5a35', '1f7bf', '老板', '2017-12-04 00:00:00', '1', '', '', '1', '24', '1', '2017-12-04 22:24:02', null);
INSERT INTO `t_sys_user` VALUES ('46', null, 'manager', 'b53cac62e7175637d4beb3b16b2f7915', 'j3cs9', '经理', '2017-12-04 00:00:00', '1', '', '', '1', '24', '1', '2017-12-04 22:24:24', null);

-- ----------------------------
-- Table structure for `t_sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user_role`;
CREATE TABLE `t_sys_user_role` (
  `roleId` varchar(32) DEFAULT NULL,
  `userId` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色关系';

-- ----------------------------
-- Records of t_sys_user_role
-- ----------------------------
INSERT INTO `t_sys_user_role` VALUES ('c4de3cf1a62e41378d9f1205293485a3', '43e6c8d6d3134e5aa41ae2a85b87586b');

-- ----------------------------
-- Table structure for `t_sys_user_unit`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user_unit`;
CREATE TABLE `t_sys_user_unit` (
  `userId` varchar(32) DEFAULT NULL,
  `unitId` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_user_unit
-- ----------------------------
INSERT INTO `t_sys_user_unit` VALUES ('43e6c8d6d3134e5aa41ae2a85b87586b', 'cff0e38c05544085b56dee30e97383b4');
