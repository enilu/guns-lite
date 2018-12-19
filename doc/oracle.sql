/*
Navicat Oracle Data Transfer
Oracle Client Version : 11.2.0.2.0

Source Server         : oracle_guns
Source Server Version : 110200
Source Host           : localhost:1521
Source Schema         : GUNS

Target Server Type    : ORACLE
Target Server Version : 110200
File Encoding         : 65001

Date: 2018-04-19 19:40:19
*/


-- ----------------------------
-- Table structure for "GUNS"."T_SYS_CFG"
-- ----------------------------
DROP TABLE "GUNS"."T_SYS_CFG";
CREATE TABLE "GUNS"."T_SYS_CFG" (
"ID" NUMBER(20) NULL ,
"CFG_NAME" NVARCHAR2(100) NULL ,
"CFG_VALUE" NCLOB NULL ,
"CFG_DESC" NVARCHAR2(200) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "GUNS"."T_SYS_CFG" IS '系统参数';
COMMENT ON COLUMN "GUNS"."T_SYS_CFG"."ID" IS '自增主键';
COMMENT ON COLUMN "GUNS"."T_SYS_CFG"."CFG_NAME" IS '参数名';
COMMENT ON COLUMN "GUNS"."T_SYS_CFG"."CFG_VALUE" IS '参数值';
COMMENT ON COLUMN "GUNS"."T_SYS_CFG"."CFG_DESC" IS '参数描述';

-- ----------------------------
-- Records of T_SYS_CFG
-- ----------------------------
INSERT INTO "GUNS"."T_SYS_CFG" VALUES ('1', 'APP_NAME', 'guns-lite', '项目名');

-- ----------------------------
-- Table structure for "GUNS"."T_SYS_DEPT"
-- ----------------------------
DROP TABLE "GUNS"."T_SYS_DEPT";
CREATE TABLE "GUNS"."T_SYS_DEPT" (
"ID" NUMBER(11) NULL ,
"NUM" NUMBER(11) NULL ,
"PID" NUMBER(11) NULL ,
"PIDS" NVARCHAR2(255) NULL ,
"SIMPLENAME" NVARCHAR2(45) NULL ,
"FULLNAME" NVARCHAR2(255) NULL ,
"TIPS" NVARCHAR2(255) NULL ,
"VERSION" NUMBER(11) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "GUNS"."T_SYS_DEPT" IS '部门表';
COMMENT ON COLUMN "GUNS"."T_SYS_DEPT"."ID" IS '主键id';
COMMENT ON COLUMN "GUNS"."T_SYS_DEPT"."NUM" IS '排序';
COMMENT ON COLUMN "GUNS"."T_SYS_DEPT"."PID" IS '父部门id';
COMMENT ON COLUMN "GUNS"."T_SYS_DEPT"."PIDS" IS '父级ids';
COMMENT ON COLUMN "GUNS"."T_SYS_DEPT"."SIMPLENAME" IS '简称';
COMMENT ON COLUMN "GUNS"."T_SYS_DEPT"."FULLNAME" IS '全称';
COMMENT ON COLUMN "GUNS"."T_SYS_DEPT"."TIPS" IS '提示';
COMMENT ON COLUMN "GUNS"."T_SYS_DEPT"."VERSION" IS '版本（乐观锁保留字段）';

-- ----------------------------
-- Records of T_SYS_DEPT
-- ----------------------------
INSERT INTO "GUNS"."T_SYS_DEPT" VALUES ('24', '1', '0', '[0],', '总公司', '总公司', null, null);
INSERT INTO "GUNS"."T_SYS_DEPT" VALUES ('25', '2', '24', '[0],[24],', '开发部', '开发部', null, null);
INSERT INTO "GUNS"."T_SYS_DEPT" VALUES ('26', '3', '24', '[0],[24],', '运营部', '运营部', null, null);
INSERT INTO "GUNS"."T_SYS_DEPT" VALUES ('27', '4', '24', '[0],[24],', '战略部', '战略部', null, null);

-- ----------------------------
-- Table structure for "GUNS"."T_SYS_DICT"
-- ----------------------------
DROP TABLE "GUNS"."T_SYS_DICT";
CREATE TABLE "GUNS"."T_SYS_DICT" (
"ID" NUMBER(11) NULL ,
"NUM" NVARCHAR2(32) NULL ,
"PID" NUMBER(11) NULL ,
"NAME" NVARCHAR2(255) NULL ,
"TIPS" NVARCHAR2(255) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "GUNS"."T_SYS_DICT" IS '字典表';
COMMENT ON COLUMN "GUNS"."T_SYS_DICT"."ID" IS '主键id';
COMMENT ON COLUMN "GUNS"."T_SYS_DICT"."NUM" IS '排序';
COMMENT ON COLUMN "GUNS"."T_SYS_DICT"."PID" IS '父级字典';
COMMENT ON COLUMN "GUNS"."T_SYS_DICT"."NAME" IS '名称';
COMMENT ON COLUMN "GUNS"."T_SYS_DICT"."TIPS" IS '提示';

-- ----------------------------
-- Records of T_SYS_DICT
-- ----------------------------
INSERT INTO "GUNS"."T_SYS_DICT" VALUES ('16', '0', '0', '状态', null);
INSERT INTO "GUNS"."T_SYS_DICT" VALUES ('17', '1', '16', '启用', null);
INSERT INTO "GUNS"."T_SYS_DICT" VALUES ('18', '2', '16', '禁用', null);
INSERT INTO "GUNS"."T_SYS_DICT" VALUES ('29', '0', '0', '性别', null);
INSERT INTO "GUNS"."T_SYS_DICT" VALUES ('30', '1', '29', '男', null);
INSERT INTO "GUNS"."T_SYS_DICT" VALUES ('31', '2', '29', '女', null);
INSERT INTO "GUNS"."T_SYS_DICT" VALUES ('35', '0', '0', '账号状态', null);
INSERT INTO "GUNS"."T_SYS_DICT" VALUES ('36', '1', '35', '启用', null);
INSERT INTO "GUNS"."T_SYS_DICT" VALUES ('37', '2', '35', '冻结', null);
INSERT INTO "GUNS"."T_SYS_DICT" VALUES ('38', '3', '35', '已删除', null);
INSERT INTO "GUNS"."T_SYS_DICT" VALUES ('39', '0', '0', '银行卡类型', null);
INSERT INTO "GUNS"."T_SYS_DICT" VALUES ('40', '0', '39', '借记卡', null);
INSERT INTO "GUNS"."T_SYS_DICT" VALUES ('41', '1', '39', '信用卡', null);
INSERT INTO "GUNS"."T_SYS_DICT" VALUES ('44', '0', '0', '联系人关系', null);
INSERT INTO "GUNS"."T_SYS_DICT" VALUES ('45', '1', '44', '父子', null);
INSERT INTO "GUNS"."T_SYS_DICT" VALUES ('46', '2', '44', '母子', null);
INSERT INTO "GUNS"."T_SYS_DICT" VALUES ('47', '3', '44', '配偶', null);
INSERT INTO "GUNS"."T_SYS_DICT" VALUES ('48', '4', '44', '朋友', null);
INSERT INTO "GUNS"."T_SYS_DICT" VALUES ('49', '5', '44', '子女', null);
INSERT INTO "GUNS"."T_SYS_DICT" VALUES ('50', '6', '44', '兄弟姐妹', null);
INSERT INTO "GUNS"."T_SYS_DICT" VALUES ('53', '0', '0', '证件类型', null);
INSERT INTO "GUNS"."T_SYS_DICT" VALUES ('54', '1', '53', '身份证', null);
INSERT INTO "GUNS"."T_SYS_DICT" VALUES ('55', '2', '53', '护照', null);
INSERT INTO "GUNS"."T_SYS_DICT" VALUES ('56', '0', '0', '学历类型', null);
INSERT INTO "GUNS"."T_SYS_DICT" VALUES ('57', '1', '56', '博士', null);
INSERT INTO "GUNS"."T_SYS_DICT" VALUES ('58', '2', '56', '硕士', null);
INSERT INTO "GUNS"."T_SYS_DICT" VALUES ('59', '3', '56', '本科', null);
INSERT INTO "GUNS"."T_SYS_DICT" VALUES ('60', '4', '56', '专科', null);
INSERT INTO "GUNS"."T_SYS_DICT" VALUES ('61', '5', '56', '高中及以下', null);

-- ----------------------------
-- Table structure for "GUNS"."T_SYS_EXPENSE"
-- ----------------------------
DROP TABLE "GUNS"."T_SYS_EXPENSE";
CREATE TABLE "GUNS"."T_SYS_EXPENSE" (
"ID" NUMBER(11) NULL ,
"MONEY" NUMBER NULL ,
"DESC" NVARCHAR2(255) NULL ,
"CREATETIME" DATE NULL ,
"STATE" NUMBER(11) NULL ,
"USERID" NUMBER(11) NULL ,
"PROCESS_ID" NVARCHAR2(255) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "GUNS"."T_SYS_EXPENSE" IS '报销表';
COMMENT ON COLUMN "GUNS"."T_SYS_EXPENSE"."MONEY" IS '报销金额';
COMMENT ON COLUMN "GUNS"."T_SYS_EXPENSE"."DESC" IS '描述';
COMMENT ON COLUMN "GUNS"."T_SYS_EXPENSE"."STATE" IS '状态: 1.待提交  2:待审核   3.审核通过 4:驳回';
COMMENT ON COLUMN "GUNS"."T_SYS_EXPENSE"."USERID" IS '用户id';
COMMENT ON COLUMN "GUNS"."T_SYS_EXPENSE"."PROCESS_ID" IS '流程定义id';

-- ----------------------------
-- Records of T_SYS_EXPENSE
-- ----------------------------

-- ----------------------------
-- Table structure for "GUNS"."T_SYS_LOGIN_LOG"
-- ----------------------------
DROP TABLE "GUNS"."T_SYS_LOGIN_LOG";
CREATE TABLE "GUNS"."T_SYS_LOGIN_LOG" (
"ID" NUMBER(11) NULL ,
"LOGNAME" NVARCHAR2(255) NULL ,
"USERID" NUMBER(11) NULL ,
"CREATETIME" DATE NULL ,
"SUCCEED" NVARCHAR2(255) NULL ,
"MESSAGE" NCLOB NULL ,
"IP" NVARCHAR2(255) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "GUNS"."T_SYS_LOGIN_LOG" IS '登录记录';
COMMENT ON COLUMN "GUNS"."T_SYS_LOGIN_LOG"."ID" IS '主键';
COMMENT ON COLUMN "GUNS"."T_SYS_LOGIN_LOG"."LOGNAME" IS '日志名称';
COMMENT ON COLUMN "GUNS"."T_SYS_LOGIN_LOG"."USERID" IS '管理员id';
COMMENT ON COLUMN "GUNS"."T_SYS_LOGIN_LOG"."CREATETIME" IS '创建时间';
COMMENT ON COLUMN "GUNS"."T_SYS_LOGIN_LOG"."SUCCEED" IS '是否执行成功';
COMMENT ON COLUMN "GUNS"."T_SYS_LOGIN_LOG"."MESSAGE" IS '具体消息';
COMMENT ON COLUMN "GUNS"."T_SYS_LOGIN_LOG"."IP" IS '登录ip';

-- ----------------------------
-- Records of T_SYS_LOGIN_LOG
-- ----------------------------
INSERT INTO "GUNS"."T_SYS_LOGIN_LOG" VALUES ('29', '退出日志', '1', TO_DATE('2018-04-19 19:35:14', 'YYYY-MM-DD HH24:MI:SS'), '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO "GUNS"."T_SYS_LOGIN_LOG" VALUES ('30', '登录日志', '1', TO_DATE('2018-04-19 19:35:17', 'YYYY-MM-DD HH24:MI:SS'), '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO "GUNS"."T_SYS_LOGIN_LOG" VALUES ('31', '退出日志', '1', TO_DATE('2018-04-19 19:36:19', 'YYYY-MM-DD HH24:MI:SS'), '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO "GUNS"."T_SYS_LOGIN_LOG" VALUES ('32', '登录日志', '300', TO_DATE('2018-04-19 19:36:28', 'YYYY-MM-DD HH24:MI:SS'), '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO "GUNS"."T_SYS_LOGIN_LOG" VALUES ('33', '退出日志', '300', TO_DATE('2018-04-19 19:38:58', 'YYYY-MM-DD HH24:MI:SS'), '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO "GUNS"."T_SYS_LOGIN_LOG" VALUES ('34', '登录日志', '300', TO_DATE('2018-04-19 19:39:02', 'YYYY-MM-DD HH24:MI:SS'), '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO "GUNS"."T_SYS_LOGIN_LOG" VALUES ('27', '退出日志', '1', TO_DATE('2018-04-19 19:26:56', 'YYYY-MM-DD HH24:MI:SS'), '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO "GUNS"."T_SYS_LOGIN_LOG" VALUES ('28', '登录日志', '1', TO_DATE('2018-04-19 19:27:11', 'YYYY-MM-DD HH24:MI:SS'), '成功', null, '0:0:0:0:0:0:0:1');

-- ----------------------------
-- Table structure for "GUNS"."T_SYS_MENU"
-- ----------------------------
DROP TABLE "GUNS"."T_SYS_MENU";
CREATE TABLE "GUNS"."T_SYS_MENU" (
"ID" NUMBER(18) NULL ,
"CODE" NVARCHAR2(255) NULL ,
"PCODE" NVARCHAR2(255) NULL ,
"PCODES" NVARCHAR2(255) NULL ,
"NAME" NVARCHAR2(255) NULL ,
"ICON" NVARCHAR2(255) NULL ,
"URL" NVARCHAR2(255) NULL ,
"NUM" NUMBER(9) NULL ,
"LEVELS" NUMBER(9) NULL ,
"ISMENU" NUMBER(9) NULL ,
"TIPS" NVARCHAR2(255) NULL ,
"STATUS" NUMBER(9) NULL ,
"ISOPEN" NUMBER(9) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "GUNS"."T_SYS_MENU" IS '菜单表';
COMMENT ON COLUMN "GUNS"."T_SYS_MENU"."ID" IS '主键id';
COMMENT ON COLUMN "GUNS"."T_SYS_MENU"."CODE" IS '菜单编号';
COMMENT ON COLUMN "GUNS"."T_SYS_MENU"."PCODE" IS '菜单父编号';
COMMENT ON COLUMN "GUNS"."T_SYS_MENU"."PCODES" IS '当前菜单的所有父菜单编号';
COMMENT ON COLUMN "GUNS"."T_SYS_MENU"."NAME" IS '菜单名称';
COMMENT ON COLUMN "GUNS"."T_SYS_MENU"."ICON" IS '菜单图标';
COMMENT ON COLUMN "GUNS"."T_SYS_MENU"."URL" IS 'url地址';
COMMENT ON COLUMN "GUNS"."T_SYS_MENU"."NUM" IS '菜单排序号';
COMMENT ON COLUMN "GUNS"."T_SYS_MENU"."LEVELS" IS '菜单层级';
COMMENT ON COLUMN "GUNS"."T_SYS_MENU"."ISMENU" IS '是否是菜单（1：是  0：不是）';
COMMENT ON COLUMN "GUNS"."T_SYS_MENU"."TIPS" IS '备注';
COMMENT ON COLUMN "GUNS"."T_SYS_MENU"."STATUS" IS '菜单状态 :  1:启用   0:不启用';
COMMENT ON COLUMN "GUNS"."T_SYS_MENU"."ISOPEN" IS '是否打开:    1:打开   0:不打开';

-- ----------------------------
-- Records of T_SYS_MENU
-- ----------------------------
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('205', 'todo', '0', '[0],', '品种补采(待)', null, null, '4', '1', '1', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('206', 'base_data', '0', '[0],', '业务信息维护', null, null, '5', '1', '1', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('207', 'analyze', '0', '[0],', '采选分析', null, null, '6', '1', '1', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('208', 'new_book_confirm', 'collect', '[0],[collect],', '备选新书确认', null, null, '1', '2', '1', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('209', 'buy_audit', 'collect', '[0],[collect],', '采购审核', null, null, '2', '2', '1', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('210', null, 'collect', '[0],[collect],', '订单准备', null, null, '3', '2', '1', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('211', null, 'collect', '[0],[collect],', '门店主推选品', null, null, '4', '2', '1', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('212', 'buy_search', 'collect', '[0],[collect],', '选采记录查询', null, null, '5', '2', '1', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('213', 'shop_search', 'collect', '[0],[collect],', '门店选书查询', null, null, '6', '2', '1', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('214', null, 'collect', '[0],[collect],', '(门店用)新书选采', null, null, '7', '2', '1', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('215', null, 'collect', '[0],[collect],', '(门店用)图书查询', null, null, '8', '2', '1', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('216', null, 'buy_audit', '[0],[collect],[buy_audit],', '自营选采审核', null, null, '1', '3', '1', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('217', null, 'buy_audit', '[0],[collect],[buy_audit],', '审核未选图书', null, null, '2', '3', '1', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('218', null, 'buy_audit', '[0],[collect],[buy_audit],', '门店提议审核', null, null, '3', '3', '1', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('219', null, 'buy_search', '[0],[collect],[buy_search],', '采购记录查询', null, null, '1', '3', '1', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('220', null, 'buy_search', '[0],[collect],[buy_search],', '门店提议审核', null, null, '2', '3', '1', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('221', null, 'shop_search', '[0],[collect],[shop_search],', '近期选品查询', null, null, '1', '3', '1', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('222', null, 'shop_search', '[0],[collect],[shop_search],', '预计到货查询', null, null, '2', '3', '1', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('223', null, 'new_book_mgr', '[0],[new_book_mgr],', '供应商书目导入', null, null, '1', '2', '1', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('224', null, 'new_book_mgr', '[0],[new_book_mgr],', '供应商书目修改', null, null, '2', '2', '1', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('225', null, 'new_book_mgr', '[0],[new_book_mgr],', '查看供应商新书', null, null, '3', '2', '1', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('226', null, 'new_book_mgr', '[0],[new_book_mgr],', '查看开卷新书', null, null, '4', '2', '1', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('227', null, 'rule_mgr', '[0],[rule_mgr],', '开卷分类定位范围', null, null, '1', '2', '1', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('228', null, 'rule_mgr', '[0],[rule_mgr],', '分类图书价格区间', null, null, '2', '2', '1', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('229', null, 'rule_mgr', '[0],[rule_mgr],', '供应商品格标记', null, null, '3', '2', '1', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('230', null, 'rule_mgr', '[0],[rule_mgr],', '作者品格标记', null, null, '4', '2', '1', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('231', null, 'rule_mgr', '[0],[rule_mgr],', '关键词黑白名单', null, null, '5', '2', '1', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('232', null, 'rule_mgr', '[0],[rule_mgr],', '门店分量化规则', null, null, '6', '2', '1', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('233', null, 'rule_mgr', '[0],[rule_mgr],', '词云标识', null, null, '7', '2', '1', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('234', null, 'todo', '[0],[todo],', '品种补采', null, null, '1', '2', '1', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('235', null, 'todo', '[0],[todo],', '开卷榜单对比', null, null, '2', '2', '1', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('236', null, 'todo', '[0],[todo],', '市场热点关注', null, null, '3', '2', '1', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('237', null, 'todo', '[0],[todo],', '图书销售查询', null, null, '4', '2', '1', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('238', null, 'base_data', '[0],[base_data],', '门店信息维护', null, null, '1', '2', '1', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('239', null, 'base_data', '[0],[base_data],', '供应商信息应对', null, null, '2', '2', '1', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('240', null, 'base_data', '[0],[base_data],', '选品业务维护', null, null, '3', '2', '1', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('241', null, 'analyze', '[0],[analyze],', '新书采选进度', null, null, '1', '2', '1', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('242', null, 'analyze', '[0],[analyze],', '采选审核分析', null, null, '2', '2', '1', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('243', null, 'analyze', '[0],[analyze],', '采选审核明细', null, null, '3', '2', '1', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('244', null, 'analyze', '[0],[analyze],', '算法效果分析', null, null, '4', '2', '1', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('107', 'mgr_add', 'mgr', '[0],[system],[mgr],', '添加用户', null, '/mgr/add', '1', '3', '0', null, '1', '0');
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('108', 'mgr_edit', 'mgr', '[0],[system],[mgr],', '修改用户', null, '/mgr/edit', '2', '3', '0', null, '1', '0');
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('109', 'mgr_delete', 'mgr', '[0],[system],[mgr],', '删除用户', null, '/mgr/delete', '3', '3', '0', null, '1', '0');
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('110', 'mgr_reset', 'mgr', '[0],[system],[mgr],', '重置密码', null, '/mgr/reset', '4', '3', '0', null, '1', '0');
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('111', 'mgr_freeze', 'mgr', '[0],[system],[mgr],', '冻结用户', null, '/mgr/freeze', '5', '3', '0', null, '1', '0');
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('112', 'mgr_unfreeze', 'mgr', '[0],[system],[mgr],', '解除冻结用户', null, '/mgr/unfreeze', '6', '3', '0', null, '1', '0');
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('113', 'mgr_setRole', 'mgr', '[0],[system],[mgr],', '分配角色', null, '/mgr/setRole', '7', '3', '0', null, '1', '0');
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('114', 'role', 'system', '[0],[system],', '(管理员)角色管理', null, '/role', '2', '2', '1', null, '1', '0');
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('115', 'role_add', 'role', '[0],[system],[role],', '添加角色', null, '/role/add', '1', '3', '0', null, '1', '0');
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('116', 'role_edit', 'role', '[0],[system],[role],', '修改角色', null, '/role/edit', '2', '3', '0', null, '1', '0');
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('117', 'role_remove', 'role', '[0],[system],[role],', '删除角色', null, '/role/remove', '3', '3', '0', null, '1', '0');
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('118', 'role_setAuthority', 'role', '[0],[system],[role],', '配置权限', null, '/role/setAuthority', '4', '3', '0', null, '1', '0');
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('119', 'menu', 'system', '[0],[system],', '菜单管理', null, '/menu', '4', '2', '1', null, '1', '0');
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('120', 'menu_add', 'menu', '[0],[system],[menu],', '添加菜单', null, '/menu/add', '1', '3', '0', null, '1', '0');
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('121', 'menu_edit', 'menu', '[0],[system],[menu],', '修改菜单', null, '/menu/edit', '2', '3', '0', null, '1', '0');
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('122', 'menu_remove', 'menu', '[0],[system],[menu],', '删除菜单', null, '/menu/remove', '3', '3', '0', null, '1', '0');
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('128', 'log', 'system', '[0],[system],', '业务日志', null, '/log', '6', '2', '1', null, '1', '0');
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('130', 'druid', 'system', '[0],[system],', '监控管理', null, '/druid', '7', '2', '1', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('131', 'dept', 'system', '[0],[system],', '(管理员)部门管理', null, '/dept', '3', '2', '1', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('132', 'dict', 'system', '[0],[system],', '字典管理', null, '/dict', '4', '2', '1', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('133', 'loginLog', 'system', '[0],[system],', '登录日志', null, '/loginLog', '6', '2', '1', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('134', 'log_clean', 'log', '[0],[system],[log],', '清空日志', null, '/log/delLog', '3', '3', '0', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('135', 'dept_add', 'dept', '[0],[system],[dept],', '添加部门', null, '/dept/add', '1', '3', '0', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('136', 'dept_update', 'dept', '[0],[system],[dept],', '修改部门', null, '/dept/update', '1', '3', '0', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('137', 'dept_delete', 'dept', '[0],[system],[dept],', '删除部门', null, '/dept/delete', '1', '3', '0', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('138', 'dict_add', 'dict', '[0],[system],[dict],', '添加字典', null, '/dict/add', '1', '3', '0', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('139', 'dict_update', 'dict', '[0],[system],[dict],', '修改字典', null, '/dict/update', '1', '3', '0', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('140', 'dict_delete', 'dict', '[0],[system],[dict],', '删除字典', null, '/dict/delete', '1', '3', '0', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('141', 'notice', 'system', '[0],[system],', '通知管理', null, '/notice', '9', '2', '1', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('142', 'notice_add', 'notice', '[0],[system],[notice],', '添加通知', null, '/notice/add', '1', '3', '0', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('143', 'notice_update', 'notice', '[0],[system],[notice],', '修改通知', null, '/notice/update', '2', '3', '0', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('144', 'notice_delete', 'notice', '[0],[system],[notice],', '删除通知', null, '/notice/delete', '3', '3', '0', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('146', 'profile', 'system', '[0],[system],', '个人', null, '/mgr/user_info', '10', '2', '1', null, '1', '0');
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('150', 'to_menu_edit', 'menu', '[0],[system],[menu],', '菜单编辑跳转', null, '/menu/menu_edit', '4', '3', '0', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('151', 'menu_list', 'menu', '[0],[system],[menu],', '菜单列表', null, '/menu/list', '5', '3', '0', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('152', 'to_dept_update', 'dept', '[0],[system],[dept],', '修改部门跳转', null, '/dept/dept_update', '4', '3', '0', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('153', 'dept_list', 'dept', '[0],[system],[dept],', '部门列表', null, '/dept/list', '5', '3', '0', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('154', 'dept_detail', 'dept', '[0],[system],[dept],', '部门详情', null, '/dept/detail', '6', '3', '0', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('155', 'to_dict_edit', 'dict', '[0],[system],[dict],', '修改菜单跳转', null, '/dict/dict_edit', '4', '3', '0', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('105', 'system', '0', '[0],', '系统管理', 'fa-cog', '#', '7', '1', '1', null, '1', '1');
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('106', 'mgr', 'system', '[0],[system],', '(管理员)用户管理', null, '/mgr', '1', '2', '1', null, '1', '0');
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('156', 'dict_list', 'dict', '[0],[system],[dict],', '字典列表', null, '/dict/list', '5', '3', '0', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('157', 'dict_detail', 'dict', '[0],[system],[dict],', '字典详情', null, '/dict/detail', '6', '3', '0', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('158', 'log_list', 'log', '[0],[system],[log],', '日志列表', null, '/log/list', '2', '3', '0', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('159', 'log_detail', 'log', '[0],[system],[log],', '日志详情', null, '/log/detail', '3', '3', '0', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('160', 'del_login_log', 'loginLog', '[0],[system],[loginLog],', '清空登录日志', null, '/loginLog/delLoginLog', '1', '3', '0', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('161', 'login_log_list', 'loginLog', '[0],[system],[loginLog],', '登录日志列表', null, '/loginLog/list', '2', '3', '0', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('162', 'to_role_edit', 'role', '[0],[system],[role],', '修改角色跳转', null, '/role/role_edit', '5', '3', '0', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('163', 'to_role_assign', 'role', '[0],[system],[role],', '角色分配跳转', null, '/role/role_assign', '6', '3', '0', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('164', 'role_list', 'role', '[0],[system],[role],', '角色列表', null, '/role/list', '7', '3', '0', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('165', 'to_assign_role', 'mgr', '[0],[system],[mgr],', '分配角色跳转', null, '/mgr/role_assign', '8', '3', '0', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('166', 'to_user_edit', 'mgr', '[0],[system],[mgr],', '编辑用户跳转', null, '/mgr/user_edit', '9', '3', '0', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('167', 'mgr_list', 'mgr', '[0],[system],[mgr],', '用户列表', null, '/mgr/list', '10', '3', '0', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('199', 'cfg_add', 'cfg', '[0],[system],[cfg],', '添加系统参数', null, '/cfg/add', '1', '3', '0', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('200', 'cfg_update', 'cfg', '[0],[system],[cfg],', '修改系统参数', null, '/cfg/update', '2', '3', '0', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('201', 'cfg_delete', 'cfg', '[0],[system],[cfg],', '删除系统参数', null, '/cfg/delete', '3', '3', '0', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('202', 'collect', '0', '[0],', '新书采集', null, null, '1', '1', '1', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('203', 'new_book_mgr', '0', '[0],', '新书信息管理', null, null, '2', '1', '1', null, '1', null);
INSERT INTO "GUNS"."T_SYS_MENU" VALUES ('204', 'rule_mgr', '0', '[0],', '选品与采购规则', null, null, '3', '1', '1', null, '1', null);

-- ----------------------------
-- Table structure for "GUNS"."T_SYS_NOTICE"
-- ----------------------------
DROP TABLE "GUNS"."T_SYS_NOTICE";
CREATE TABLE "GUNS"."T_SYS_NOTICE" (
"ID" NUMBER(11) NULL ,
"TITLE" NVARCHAR2(255) NULL ,
"TYPE" NUMBER(11) NULL ,
"CONTENT" NCLOB NULL ,
"CREATETIME" DATE NULL ,
"CREATER" NUMBER(11) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "GUNS"."T_SYS_NOTICE" IS '通知表';
COMMENT ON COLUMN "GUNS"."T_SYS_NOTICE"."ID" IS '主键';
COMMENT ON COLUMN "GUNS"."T_SYS_NOTICE"."TITLE" IS '标题';
COMMENT ON COLUMN "GUNS"."T_SYS_NOTICE"."TYPE" IS '类型';
COMMENT ON COLUMN "GUNS"."T_SYS_NOTICE"."CONTENT" IS '内容';
COMMENT ON COLUMN "GUNS"."T_SYS_NOTICE"."CREATETIME" IS '创建时间';
COMMENT ON COLUMN "GUNS"."T_SYS_NOTICE"."CREATER" IS '创建人';

-- ----------------------------
-- Records of T_SYS_NOTICE
-- ----------------------------
INSERT INTO "GUNS"."T_SYS_NOTICE" VALUES ('6', '世界', '10', HexToRaw('E6ACA2E8BF8EE4BDBFE794A8E5908EE58FB0E7AEA1E79086E7B3BBE7BB9F00'), TO_DATE('2017-01-11 08:53:20', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO "GUNS"."T_SYS_NOTICE" VALUES ('8', '你好', null, HexToRaw('E4BDA0E5A5BD00'), TO_DATE('2017-05-10 19:28:57', 'YYYY-MM-DD HH24:MI:SS'), '1');

-- ----------------------------
-- Table structure for "GUNS"."T_SYS_OPERATION_LOG"
-- ----------------------------
DROP TABLE "GUNS"."T_SYS_OPERATION_LOG";
CREATE TABLE "GUNS"."T_SYS_OPERATION_LOG" (
"ID" NUMBER(11) NULL ,
"LOGTYPE" NVARCHAR2(255) NULL ,
"LOGNAME" NVARCHAR2(255) NULL ,
"USERID" NUMBER(11) NULL ,
"CLASSNAME" NVARCHAR2(255) NULL ,
"METHOD" NCLOB NULL ,
"CREATETIME" DATE NULL ,
"SUCCEED" NVARCHAR2(255) NULL ,
"MESSAGE" NCLOB NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "GUNS"."T_SYS_OPERATION_LOG" IS '操作日志';
COMMENT ON COLUMN "GUNS"."T_SYS_OPERATION_LOG"."ID" IS '主键';
COMMENT ON COLUMN "GUNS"."T_SYS_OPERATION_LOG"."LOGTYPE" IS '日志类型';
COMMENT ON COLUMN "GUNS"."T_SYS_OPERATION_LOG"."LOGNAME" IS '日志名称';
COMMENT ON COLUMN "GUNS"."T_SYS_OPERATION_LOG"."USERID" IS '用户id';
COMMENT ON COLUMN "GUNS"."T_SYS_OPERATION_LOG"."CLASSNAME" IS '类名称';
COMMENT ON COLUMN "GUNS"."T_SYS_OPERATION_LOG"."METHOD" IS '方法名称';
COMMENT ON COLUMN "GUNS"."T_SYS_OPERATION_LOG"."CREATETIME" IS '创建时间';
COMMENT ON COLUMN "GUNS"."T_SYS_OPERATION_LOG"."SUCCEED" IS '是否成功';
COMMENT ON COLUMN "GUNS"."T_SYS_OPERATION_LOG"."MESSAGE" IS '备注';


-- ----------------------------
-- Table structure for "GUNS"."T_SYS_RELATION"
-- ----------------------------
DROP TABLE "GUNS"."T_SYS_RELATION";
CREATE TABLE "GUNS"."T_SYS_RELATION" (
"ID" NUMBER(11) NULL ,
"MENUID" NUMBER(20) NULL ,
"ROLEID" NUMBER(11) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "GUNS"."T_SYS_RELATION" IS '角色和菜单关联表';
COMMENT ON COLUMN "GUNS"."T_SYS_RELATION"."ID" IS '主键';
COMMENT ON COLUMN "GUNS"."T_SYS_RELATION"."MENUID" IS '菜单id';
COMMENT ON COLUMN "GUNS"."T_SYS_RELATION"."ROLEID" IS '角色id';

-- ----------------------------
-- Records of T_SYS_RELATION
-- ----------------------------
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('4974', '105', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('4975', '106', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('4976', '107', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('4977', '108', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('4978', '109', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('4979', '110', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('4980', '111', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('4981', '112', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('4982', '113', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('4983', '165', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('4984', '166', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('4985', '167', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('4986', '114', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('4987', '115', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('4988', '116', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('4989', '117', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('4990', '118', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('4991', '162', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('4992', '163', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('4993', '164', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('4994', '119', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('4995', '120', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('4996', '121', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('4997', '122', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('4998', '150', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('4999', '151', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5000', '128', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5001', '134', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5002', '158', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5003', '159', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5004', '130', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5005', '131', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5006', '135', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5007', '136', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5008', '137', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5009', '152', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5010', '153', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5011', '154', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5012', '132', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5013', '138', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5014', '139', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5015', '140', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5016', '155', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5017', '156', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5018', '157', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5019', '133', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5020', '160', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5021', '161', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5022', '141', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5023', '142', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5024', '143', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5025', '144', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5026', '146', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5027', '145', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5028', '199', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5029', '200', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5030', '201', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5031', '202', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5032', '208', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5033', '209', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5034', '216', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5035', '217', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5036', '218', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5037', '210', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5038', '211', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5039', '212', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5040', '219', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5041', '220', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5042', '213', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5043', '221', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5044', '222', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5045', '214', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5046', '215', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5047', '203', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5048', '223', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5049', '224', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5050', '225', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5051', '226', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5052', '204', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5053', '227', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5054', '228', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5055', '229', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5056', '230', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5057', '231', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5058', '232', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5059', '233', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5060', '205', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5061', '234', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5062', '235', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5063', '236', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5064', '237', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5065', '206', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5066', '238', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5067', '239', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5068', '240', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5069', '207', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5070', '241', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5071', '242', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5072', '243', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('5073', '244', '1');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('300', '105', '300');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('301', '106', '300');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('302', '107', '300');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('303', '108', '300');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('304', '109', '300');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('305', '110', '300');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('306', '111', '300');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('307', '112', '300');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('308', '113', '300');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('309', '165', '300');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('310', '166', '300');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('311', '167', '300');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('312', '114', '300');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('313', '115', '300');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('314', '116', '300');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('315', '117', '300');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('316', '118', '300');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('317', '162', '300');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('318', '163', '300');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('319', '164', '300');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('320', '119', '300');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('321', '120', '300');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('322', '121', '300');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('323', '122', '300');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('324', '150', '300');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('325', '151', '300');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('326', '128', '300');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('327', '134', '300');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('328', '158', '300');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('329', '159', '300');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('330', '130', '300');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('331', '131', '300');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('332', '135', '300');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('333', '136', '300');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('334', '137', '300');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('335', '152', '300');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('336', '153', '300');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('337', '154', '300');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('338', '132', '300');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('339', '138', '300');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('340', '139', '300');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('341', '140', '300');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('342', '155', '300');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('343', '156', '300');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('344', '157', '300');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('345', '133', '300');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('346', '160', '300');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('347', '161', '300');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('348', '141', '300');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('349', '142', '300');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('350', '143', '300');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('351', '144', '300');
INSERT INTO "GUNS"."T_SYS_RELATION" VALUES ('352', '146', '300');

-- ----------------------------
-- Table structure for "GUNS"."T_SYS_ROLE"
-- ----------------------------
DROP TABLE "GUNS"."T_SYS_ROLE";
CREATE TABLE "GUNS"."T_SYS_ROLE" (
"ID" NUMBER(11) NULL ,
"NUM" NUMBER(11) NULL ,
"PID" NUMBER(11) NULL ,
"NAME" NVARCHAR2(255) NULL ,
"DEPTID" NUMBER(11) NULL ,
"TIPS" NVARCHAR2(255) NULL ,
"VERSION" NUMBER(11) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "GUNS"."T_SYS_ROLE" IS '角色表';
COMMENT ON COLUMN "GUNS"."T_SYS_ROLE"."ID" IS '主键id';
COMMENT ON COLUMN "GUNS"."T_SYS_ROLE"."NUM" IS '序号';
COMMENT ON COLUMN "GUNS"."T_SYS_ROLE"."PID" IS '父角色id';
COMMENT ON COLUMN "GUNS"."T_SYS_ROLE"."NAME" IS '角色名称';
COMMENT ON COLUMN "GUNS"."T_SYS_ROLE"."DEPTID" IS '部门名称';
COMMENT ON COLUMN "GUNS"."T_SYS_ROLE"."TIPS" IS '提示';
COMMENT ON COLUMN "GUNS"."T_SYS_ROLE"."VERSION" IS '保留字段(暂时没用）';

-- ----------------------------
-- Records of T_SYS_ROLE
-- ----------------------------
INSERT INTO "GUNS"."T_SYS_ROLE" VALUES ('1', '1', '0', '超级管理员', '24', 'administrator', '1');
INSERT INTO "GUNS"."T_SYS_ROLE" VALUES ('300', '1', '1', '系统管理员', '24', '系统管理员', null);

-- ----------------------------
-- Table structure for "GUNS"."T_SYS_ROLE_MENU"
-- ----------------------------
DROP TABLE "GUNS"."T_SYS_ROLE_MENU";
CREATE TABLE "GUNS"."T_SYS_ROLE_MENU" (
"ROLE_ID" NVARCHAR2(32) NULL ,
"MENU_ID" NVARCHAR2(32) NULL ,
"ID" NUMBER(20) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "GUNS"."T_SYS_ROLE_MENU" IS '角色菜单关系';

-- ----------------------------
-- Records of T_SYS_ROLE_MENU
-- ----------------------------
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '0f9ccefe3c37446ab7dd4d8823b2674f', '1');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'f34c743c76d1487f8fd0c2469671e417', '2');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '5c2b4eee186b46b8ac80ce3bf1a31482', '3');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '7f8a8af316d547beac7d4263476571df', '4');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '175d06dcdd7d4aeaba7bfb31b9a6adf9', '5');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'd83e71c7552a4f1eb0986da5738d5455', '6');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'ef31791205dd4ca3b5c23a077feb1bc6', '7');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'b372f1d1c9714a808367ce9bbdaf52d5', '8');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'f13da3059ec441009c7ad8af3072dfa8', '9');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '83a127c18bac4e00829e9c9962803838', '10');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '233de9e289024088b9133e29dd959fca', '11');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'bf16dedfc88d45d0858a25a1f2b228ac', '12');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '32eeb7668dea4887847d15aac95b5df0', '13');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'e662fd578ef34423a4b2765290f1981e', '14');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '6f0262a2c4ab4655b01265f2394c8f2d', '15');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'c261eca005b54f37b4226b1833714f10', '16');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '8f2c142dee3b4714949724c3dfadb540', '17');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '45181d69e47947ebad4de4b5383cd9cb', '18');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'e53092c585504a77b6e2c5b3ec2e32c9', '19');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '3afbde86044c4d7fa040300e705c73fa', '20');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '15d567907c074d1a80034d6b77300c8a', '21');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '0c6199419432471283e07320040d7fed', '22');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'f70e928966304fdfbc8b0ae54e0e3d17', '23');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'a5a3efcf28154d2f8aba772b211455c3', '24');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'e7a12b99d3594562a4cb3f1acd5f4eb7', '25');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '62e0a6e9ec7d485485f99c1991173e63', '26');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'b489392439814f9eb208a676e351afb5', '27');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '8d88846e6dba4db4920742f32e308be4', '28');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'de344dcfa38240f6a656f15ef60af339', '29');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '28b180e83fbe40d78c909086233cabd2', '30');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '0a47185d7876405e85e4c203352bccc4', '31');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'ad3065cab4db4512967d993ef7c4f5ab', '32');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '06077b45c1b14755959e4f012314570b', '33');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'd1d4d7b46751456d8f840701d1746263', '34');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '5c6d010b5132479fa58fb88a1aedbd81', '35');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '230c7a019acf42208bcde7149c04efd2', '36');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'af3dd2a994f04bbda53998d8298aeb19', '37');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '52dcc185684d4920acb0f4a5280f7455', '38');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '23b643f8963a4eb591fa7395204e5013', '39');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'a5402be8e9c948a8872a3ce84ffc3294', '40');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'ac6f270034ab42b28a80728d255f32cf', '41');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'd86156b43c9b42728979e509aa058ac3', '42');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'ae4ec35909ae43d0a9ec7d99d382f0cd', '43');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '64ce61c4238a4c27880b17f70bec845d', '44');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'e9b41d0e3d8d483caccedc02f71c201f', '45');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'c75f7a083e0c47129a67630ea493b139', '46');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'b0edc6861a494b79b97990dc05f0a524', '47');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'e4256d7b0ffc4a02906cf900322b6213', '48');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'b19b23b0459a4754bf1fb8cb234450f2', '49');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '4dc997fef71e4862b9db22de8e99a618', '50');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '9f20a757a6bc40ddbb650c70debbf660', '51');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'f426468abf714b1599729f8c36ebbb0d', '52');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '1734e586e96941268a4c5248b593cef9', '53');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '6bb17a41f6394ed0a8a6faf5ff781354', '54');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '56d0658c5a8848818ac05e8ffa5c0570', '55');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'ce709456e867425297955b3c40406d7e', '56');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '3099f497480c4b1987bce3f3a26c3fb4', '57');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '4cd8e4e9519e4cff95465194fdcc8d88', '58');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '234f8ec3c2bc42bf9f6202aecae36fd6', '59');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'c3a44b478d3241b899b9c3f4611bc2b6', '60');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'fd63a8e389e04ff3a86c3cea53a3b9d5', '61');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '7c040dfd8db347e5956a3bc1764653dc', '62');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '17e1ee23ca1443f1bc886c2f5eb7c24b', '63');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '2275cb125710414e91b617dd7c62f12c', '64');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '0a972ce655cb4c84809d58668b655900', '65');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'fc52d5284b8f4522802383c1ef732242', '66');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '2cb327ad59b140828fd26eb2a46cb948', '67');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'dd965b2c1dfd493fb5efc7e4bcac99d4', '68');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '30a5e70a1456447ebf90b5546e9bc321', '69');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '2a63040409094f1e9dc535dd78ce15b7', '70');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '0706112ff5dc46e388064a99bcdb0561', '71');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'e864c78aba63448892cbcb6a3a7f4da7', '72');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'ff6cd243a77c4ae98dacf6149c816c75', '73');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '733d3f35d49f45af99ca9220048583ba', '74');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'bcf64d623fdd4519ae345b7a08c071a1', '75');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '66cc21d7ce104dd6877cbce114c59fb3', '76');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '309dc29ad3c34408a68df8f867a5c9ff', '77');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '96554b09a2dd4f82bab7546fa59acd35', '78');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'd568f4c2b687404e8aec7b9edcae5767', '79');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '2fab774f8b6d40cb9d7e187babab2d91', '80');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '45d958ca78304f25b51f6c71cf66f6d8', '81');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '44da90bc76a5419a841f4924333f7a66', '82');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '9a9557177d334c209cf73c3817fe3b63', '83');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '0a43d291e0c94ad88c8b690009279e34', '84');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '5244f5c38eb24b918e9ad64d456daa38', '85');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '6afc5075913d4df4b44a6476080e35a0', '86');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '1385ae887e5c4b8aa33fbf228be7f907', '87');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'e6b6224617b04090a76e46a4b048fb96', '88');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '3888f05aa4064f788ba7ec51c495ce7c', '89');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'cabbe834a7474675b899e8442b5c2604', '90');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'a11163584dfe456cbfd6fb2d4b74391b', '91');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'c76a84f871d047db955dd1465c845ac1', '92');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '02e86a61e99746bea34236ea73dd52a5', '93');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'd920314e925c451da6d881e7a29743b7', '94');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'd1e991ad38a8424daf9f7eb000ee27f4', '95');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '73a29d3f99224426b5a87c92da122275', '96');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '6b6de8c720c645a1808e1c3e9ccbfc90', '97');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'b2631bbdbf824cc4b74d819c87962c0d', '98');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '4781372b00bb4d52b429b58e72b80c68', '99');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'e461c62a1d5441619cd35612f3b40691', '100');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'f6fba69c3b704d79834b8bd2cc753729', '101');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '50ba60ee650e4c739e6abc3ab71e4960', '102');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '6075fc0cf0ef441b9d93cc3cab3445bf', '103');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '33aed9298643424783116e0cf0f7fcbe', '104');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', 'ef9f436c61654ec09efbfa79a40061cf', '105');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '17500ef3a9e44b4fabb240162a164fcb', '106');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '3f330d729ca34dc9825c46122be1bfae', '107');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '9822bafbe3454dfd8e8b974ebc304d03', '108');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '7db6207d0dab4d6e95a7eee4f2efe875', '109');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '31ed2243077c44448cce26abfd5ae574', '110');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '7125a72beee34b21ab3df9bf01b7bce6', '111');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '68cdbf694f71445c8587a20234d6fe31', '112');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '077cb6be4c7c41cc8955ee045a4f0286', '113');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '36e0faf5062b4f6b95d4167cbb1f8fea', '114');
INSERT INTO "GUNS"."T_SYS_ROLE_MENU" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '3c24111091ad4a70ad2d9cc361311d2f', '115');

-- ----------------------------
-- Table structure for "GUNS"."T_SYS_USER"
-- ----------------------------
DROP TABLE "GUNS"."T_SYS_USER";
CREATE TABLE "GUNS"."T_SYS_USER" (
"ID" NUMBER(11) NULL ,
"AVATAR" NVARCHAR2(255) NULL ,
"ACCOUNT" NVARCHAR2(45) NULL ,
"PASSWORD" NVARCHAR2(45) NULL ,
"SALT" NVARCHAR2(45) NULL ,
"NAME" NVARCHAR2(45) NULL ,
"BIRTHDAY" DATE NULL ,
"SEX" NUMBER(11) NULL ,
"EMAIL" NVARCHAR2(45) NULL ,
"PHONE" NVARCHAR2(45) NULL ,
"ROLEID" NVARCHAR2(255) NULL ,
"DEPTID" NUMBER(11) NULL ,
"STATUS" NUMBER(11) NULL ,
"CREATETIME" DATE NULL ,
"VERSION" NUMBER(11) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "GUNS"."T_SYS_USER" IS '管理员表';
COMMENT ON COLUMN "GUNS"."T_SYS_USER"."ID" IS '主键id';
COMMENT ON COLUMN "GUNS"."T_SYS_USER"."AVATAR" IS '头像';
COMMENT ON COLUMN "GUNS"."T_SYS_USER"."ACCOUNT" IS '账号';
COMMENT ON COLUMN "GUNS"."T_SYS_USER"."PASSWORD" IS '密码';
COMMENT ON COLUMN "GUNS"."T_SYS_USER"."SALT" IS 'md5密码盐';
COMMENT ON COLUMN "GUNS"."T_SYS_USER"."NAME" IS '名字';
COMMENT ON COLUMN "GUNS"."T_SYS_USER"."BIRTHDAY" IS '生日';
COMMENT ON COLUMN "GUNS"."T_SYS_USER"."SEX" IS '性别（1：男 2：女）';
COMMENT ON COLUMN "GUNS"."T_SYS_USER"."EMAIL" IS '电子邮件';
COMMENT ON COLUMN "GUNS"."T_SYS_USER"."PHONE" IS '电话';
COMMENT ON COLUMN "GUNS"."T_SYS_USER"."ROLEID" IS '角色id';
COMMENT ON COLUMN "GUNS"."T_SYS_USER"."DEPTID" IS '部门id';
COMMENT ON COLUMN "GUNS"."T_SYS_USER"."STATUS" IS '状态(1：启用  2：冻结  3：删除）';
COMMENT ON COLUMN "GUNS"."T_SYS_USER"."CREATETIME" IS '创建时间';
COMMENT ON COLUMN "GUNS"."T_SYS_USER"."VERSION" IS '保留字段';

-- ----------------------------
-- Records of T_SYS_USER
-- ----------------------------
INSERT INTO "GUNS"."T_SYS_USER" VALUES ('1', null, 'admin', '6ab1f386d715cfb6be85de941d438b02', '8pgby', '张三', TO_DATE('2017-05-05 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '2', 'eniluzt@qq.com', null, '1', '27', '1', TO_DATE('2016-01-29 08:49:53', 'YYYY-MM-DD HH24:MI:SS'), '25');
INSERT INTO "GUNS"."T_SYS_USER" VALUES ('45', null, 'boss', '71887a5ad666a18f709e1d4e693d5a35', '1f7bf', '老板', TO_DATE('2017-12-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1', null, null, '1', '24', '1', TO_DATE('2017-12-04 22:24:02', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO "GUNS"."T_SYS_USER" VALUES ('46', null, 'manager', 'b53cac62e7175637d4beb3b16b2f7915', 'j3cs9', '经理', TO_DATE('2017-12-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1', null, null, '1', '24', '1', TO_DATE('2017-12-04 22:24:24', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO "GUNS"."T_SYS_USER" VALUES ('300', null, 'test', '1db7f763679015ca3046cf0973cbb234', 'af6gh', 'test', TO_DATE('2018-04-19 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1', 'test@qq.co', '15021592814', '1', '27', '1', TO_DATE('2018-04-19 19:36:05', 'YYYY-MM-DD HH24:MI:SS'), null);

-- ----------------------------
-- Table structure for "GUNS"."T_SYS_USER_ROLE"
-- ----------------------------
DROP TABLE "GUNS"."T_SYS_USER_ROLE";
CREATE TABLE "GUNS"."T_SYS_USER_ROLE" (
"ROLE_ID" NVARCHAR2(32) NULL ,
"USER_ID" NVARCHAR2(32) NULL ,
"ID" NUMBER(20) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "GUNS"."T_SYS_USER_ROLE" IS '用户角色关系';

-- ----------------------------
-- Records of T_SYS_USER_ROLE
-- ----------------------------
INSERT INTO "GUNS"."T_SYS_USER_ROLE" VALUES ('c4de3cf1a62e41378d9f1205293485a3', '43e6c8d6d3134e5aa41ae2a85b87586b', '1');

-- ----------------------------
-- Table structure for "GUNS"."T_SYS_USER_UNIT"
-- ----------------------------
DROP TABLE "GUNS"."T_SYS_USER_UNIT";
CREATE TABLE "GUNS"."T_SYS_USER_UNIT" (
"USER_ID" NVARCHAR2(32) NULL ,
"UNIT_ID" NVARCHAR2(32) NULL ,
"ID" NUMBER(20) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of T_SYS_USER_UNIT
-- ----------------------------
INSERT INTO "GUNS"."T_SYS_USER_UNIT" VALUES ('43e6c8d6d3134e5aa41ae2a85b87586b', 'cff0e38c05544085b56dee30e97383b4', '1');
