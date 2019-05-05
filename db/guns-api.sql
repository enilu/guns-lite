/*
如果你使用vue版本后台管理，请初始化改数据库脚本
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : guns-lite

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-05-05 15:43:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_cms_article`
-- ----------------------------
DROP TABLE IF EXISTS `t_cms_article`;
CREATE TABLE `t_cms_article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint(20) DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `author` varchar(255) DEFAULT NULL,
  `content` text,
  `title` varchar(255) DEFAULT NULL,
  `id_channel` bigint(20) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='文章';

-- ----------------------------
-- Records of t_cms_article
-- ----------------------------
INSERT INTO `t_cms_article` VALUES ('1', '1', '2019-03-09 16:24:58', '1', '2019-05-05 10:26:49', 'enilu', '<div id=\"articleContent\" class=\"content\">\n<div class=\"ad-wrap\">\n<p style=\"margin: 0 0 10px 0;\">一般我们都有这样的需求：我需要知道库中的数据是由谁创建，什么时候创建，最后一次修改时间是什么时候，最后一次修改人是谁。guns-lite最新代码已经实现该需求，具体实现方式网上有很多资料，这里做会搬运工，将guns-lite的实现步骤罗列如下：</p>\n</div>\n<p>在Spring jpa中可以通过在实体bean的属性或者方法上添加以下注解来实现上述需求@CreatedDate、@CreatedBy、@LastModifiedDate、@LastModifiedBy。</p>\n<ul class=\" list-paddingleft-2\">\n<li>\n<p>@CreatedDate 表示该字段为创建时间时间字段，在这个实体被insert的时候，会设置值</p>\n</li>\n<li>\n<p>@CreatedBy 表示该字段为创建人，在这个实体被insert的时候，会设置值</p>\n</li>\n<li>\n<p>@LastModifiedDate 最后修改时间 实体被update的时候会设置</p>\n</li>\n<li>\n<p>@LastModifiedBy 最后修改人 实体被update的时候会设置</p>\n</li>\n</ul>\n<h2>使用方式</h2>\n<h3>实体类添加注解</h3>\n<ul class=\" list-paddingleft-2\">\n<li>\n<p>首先在实体中对应的字段加上上述4个注解</p>\n</li>\n<li>\n<p>在guns-lite中我们提取了一个基础实体类BaseEntity，并将对应的字段添加上述4个注解,所有需要记录维护信息的表对应的实体都集成该类</p>\n</li>\n</ul>\n<pre>import&nbsp;org.springframework.data.annotation.CreatedBy;\nimport&nbsp;org.springframework.data.annotation.CreatedDate;\nimport&nbsp;org.springframework.data.annotation.LastModifiedBy;\nimport&nbsp;org.springframework.data.annotation.LastModifiedDate;\nimport&nbsp;javax.persistence.Column;\nimport&nbsp;javax.persistence.GeneratedValue;\nimport&nbsp;javax.persistence.Id;\nimport&nbsp;javax.persistence.MappedSuperclass;\nimport&nbsp;java.io.Serializable;\nimport&nbsp;java.util.Date;\n@MappedSuperclass\n@Data\npublic&nbsp;abstract&nbsp;class&nbsp;BaseEntity&nbsp;implements&nbsp;Serializable&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;@Id\n&nbsp;&nbsp;&nbsp;&nbsp;@GeneratedValue\n&nbsp;&nbsp;&nbsp;&nbsp;private&nbsp;Long&nbsp;id;\n&nbsp;&nbsp;&nbsp;&nbsp;@CreatedDate\n&nbsp;&nbsp;&nbsp;&nbsp;@Column(name&nbsp;=&nbsp;\"create_time\",columnDefinition=\"DATETIME&nbsp;COMMENT&nbsp;\'创建时间/注册时间\'\")\n&nbsp;&nbsp;&nbsp;&nbsp;private&nbsp;Date&nbsp;createTime;\n&nbsp;&nbsp;&nbsp;&nbsp;@Column(name&nbsp;=&nbsp;\"create_by\",columnDefinition=\"bigint&nbsp;COMMENT&nbsp;\'创建人\'\")\n&nbsp;&nbsp;&nbsp;&nbsp;@CreatedBy\n&nbsp;&nbsp;&nbsp;&nbsp;private&nbsp;Long&nbsp;createBy;\n&nbsp;&nbsp;&nbsp;&nbsp;@LastModifiedDate\n&nbsp;&nbsp;&nbsp;&nbsp;@Column(name&nbsp;=&nbsp;\"modify_time\",columnDefinition=\"DATETIME&nbsp;COMMENT&nbsp;\'最后更新时间\'\")\n&nbsp;&nbsp;&nbsp;&nbsp;private&nbsp;Date&nbsp;modifyTime;\n&nbsp;&nbsp;&nbsp;&nbsp;@LastModifiedBy\n&nbsp;&nbsp;&nbsp;&nbsp;@Column(name&nbsp;=&nbsp;\"modify_by\",columnDefinition=\"bigint&nbsp;COMMENT&nbsp;\'最后更新人\'\")\n&nbsp;&nbsp;&nbsp;&nbsp;private&nbsp;Long&nbsp;modifyBy;\n}</pre>\n<h3>实现AuditorAware接口返回操作人员的id</h3>\n<p>配置完上述4个注解后，在jpa.save方法被调用的时候，时间字段会自动设置并插入数据库，但是CreatedBy和LastModifiedBy并没有赋值 这两个信息需要实现AuditorAware接口来返回操作人员的id</p>\n<ul class=\" list-paddingleft-2\">\n<li>\n<p>首先需要在项目启动类添加@EnableJpaAuditing 注解来启用审计功能</p>\n</li>\n</ul>\n<pre>@SpringBootApplication\n@EnableJpaAuditing\npublic&nbsp;class&nbsp;AdminApplication&nbsp;extends&nbsp;WebMvcConfigurerAdapter&nbsp;{\n&nbsp;//省略\n}</pre>\n<ul class=\" list-paddingleft-2\">\n<li>\n<p>然后实现AuditorAware接口返回操作人员的id</p>\n</li>\n</ul>\n<pre>@Configuration\npublic&nbsp;class&nbsp;UserIDAuditorConfig&nbsp;implements&nbsp;AuditorAware&lt;Long&gt;&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;@Override\n&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;Long&nbsp;getCurrentAuditor()&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ShiroUser&nbsp;shiroUser&nbsp;=&nbsp;ShiroKit.getUser();\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if(shiroUser!=null){\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;shiroUser.getId();\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;null;\n&nbsp;&nbsp;&nbsp;&nbsp;}\n}</pre>\n</div>', 'guns-lite 将所有表增加维护人员和维护时间信息', '1', '1');
INSERT INTO `t_cms_article` VALUES ('2', '1', '2019-03-09 16:24:58', '1', '2019-03-23 23:12:16', 'enilu.cn', '<div id=\"articleContent\" class=\"content\">\n<div class=\"ad-wrap\">\n<p style=\"margin: 0 0 10px 0;\"><a style=\"color: #a00; font-weight: bold;\" href=\"https://my.oschina.net/u/3985214/blog/3018099?tdsourcetag=s_pcqq_aiomsg\" target=\"_blank\" rel=\"noopener\" data-traceid=\"news_detail_above_text_link_1\" data-tracepid=\"news_detail_above_text_link\">开发十年，就只剩下这套架构体系了！ &gt;&gt;&gt;</a>&nbsp;&nbsp;<img style=\"max-height: 32px; max-width: 32px;\" src=\"https://www.oschina.net/img/hot3.png\" align=\"\" /></p>\n</div>\n<h3>国际化</h3>\n<ul class=\" list-paddingleft-2\">\n<li>\n<p>guns-admin-vuejs实现国际化了，不好意思guns-admin暂未实现国际化，后续也会考虑实现。</p>\n</li>\n<li>\n<p>不了解上面两个的区别的同学可以再回顾下这个<a href=\"http://www.enilu.cn/guns-lite/base/guns-admin-vuejs.html\">文档</a></p>\n</li>\n<li>\n<p>guns-admin-vuejs实现国际化的方式参考vue-element-admin的&nbsp;<a href=\"https://panjiachen.github.io/vue-element-admin-site/zh/guide/advanced/i18n.html\" target=\"_blank\" rel=\"noopener\">官方文档</a>,这里不再赘述,强烈建议你先把文档读了之后再看下面的内容。</p>\n</li>\n</ul>\n<h3>默认约定</h3>\n<p>针对网站资源进行国际园涉及到的国际化资源的管理维护，这里给出一些guns-admin-vuejs的资源分类建议，当然，你也可以根据你的实际情况进行调整。</p>\n<ul class=\" list-paddingleft-2\">\n<li>\n<p>src/lang/为国际化资源目录,目前提供了英文（en.js）和中文(zh.js)的两种语言实现。</p>\n</li>\n<li>\n<p>目前资源语言资源文件中是json配置主要有以下几个节点：</p>\n</li>\n<ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\">\n<li>\n<p>route 左侧菜单资源</p>\n</li>\n<li>\n<p>navbar 顶部导航栏资源</p>\n</li>\n<li>\n<p>button 公共的按钮资源，比如：添加、删除、修改、确定、取消之类等等</p>\n</li>\n<li>\n<p>common 其他公共的资源，比如一些弹出框标题、提示信息、label等等</p>\n</li>\n<li>\n<p>login 登录页面资源</p>\n</li>\n<li>\n<p>config 参数管理界面资源</p>\n</li>\n</ul>\n<li>\n<p>目前针对具体的页面资源只做了登录和参数管理两个页面，其他具体业务界面仅针对公共的按钮做了国际化，你可以参考config页面资源进行配置进行进一步配置：/src/views/cfg/</p>\n</li>\n<li>\n<p>如果你有其他资源在上面对应的节点添加即可，针对每个页面特有的资源以页面名称作为几点进行维护，这样方便记忆和维护，不容易出错。</p>\n</li>\n</ul>\n<h3>添加新的语言支持</h3>\n<p>如果英文和中文两种语言不够，那么你可以通过下面步骤添加语言支持</p>\n<ul class=\" list-paddingleft-2\">\n<li>\n<p>在src/lang/目录下新增对应的资源文件</p>\n</li>\n<li>\n<p>在src/lang/index.js中import对应的资源文件</p>\n</li>\n<li>\n<p>在src/lang/index.js中的messages变量中加入新的语言声明</p>\n</li>\n<li>\n<p>在src/components/LangSelect/index.vue的语言下拉框中增加新的语言选项</p>\n</li>\n</ul>\n<h3>演示地址</h3>\n<ul class=\" list-paddingleft-2\">\n<li>\n<p>vue版本后台管理&nbsp;<a href=\"http://106.75.35.53:8082/vue/#/login\" target=\"_blank\" rel=\"noopener\">http://106.75.35.53:8082/vue/#/login</a></p>\n</li>\n<li>CMS内容管理系统的h5前端demo:<a href=\"http://106.75.35.53:8082/mobile/#/index\" target=\"_blank\" rel=\"noopener\">http://106.75.35.53:8082/mobile/#/index</a></li>\n</ul>\n</div>', 'guns-lite1.0.1 发布，增加国际化和定时任务管理功能', '1', '2');
INSERT INTO `t_cms_article` VALUES ('3', '1', '2019-03-09 16:24:58', '1', '2019-04-28 17:39:52', 'enilu.cn', '<div class=\"content\" id=\"articleContent\">\r\n                        <div class=\"ad-wrap\">\r\n                                                    <p style=\"margin:0 0 10px 0;\"><a data-traceid=\"news_detail_above_text_link_1\" data-tracepid=\"news_detail_above_text_link\" style=\"color:#A00;font-weight:bold;\" href=\"https://my.oschina.net/u/3985214/blog/3018099?tdsourcetag=s_pcqq_aiomsg\" target=\"_blank\">开发十年，就只剩下这套架构体系了！ &gt;&gt;&gt;</a>&nbsp;&nbsp;<img src=\"https://www.oschina.net/img/hot3.png\" align=\"\" style=\"max-height: 32px; max-width: 32px;\"></p>\r\n                                    </div>\r\n                        <p>guns-lite使用的Spring Boot从1.5.1升级到2.1.1</p><p>下面为升级过程</p><ul class=\" list-paddingleft-2\"><li><p>版本升级</p><pre>&lt;spring.boot.version&gt;2.1.1.RELEASE&lt;/spring.boot.version&gt;\r\n&lt;springframework.version&gt;5.1.3.RELEASE&lt;springframework.version&gt;</pre></li><li><p>配置增加</p><pre>spring.main.allow-bean-definition-overriding=true\r\nspring.jpa.hibernate.use-new-id-generator-mappings=false</pre></li></ul><ul class=\" list-paddingleft-2\"><li><p>审计功能调整，调整后代码:</p><pre>@Configuration\r\npublic&nbsp;class&nbsp;UserIDAuditorConfig&nbsp;implements&nbsp;AuditorAware&lt;Long&gt;&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;@Override\r\n&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;Optional&lt;Long&gt;&nbsp;getCurrentAuditor()&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ShiroUser&nbsp;shiroUser&nbsp;=&nbsp;ShiroKit.getUser();\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if(shiroUser!=null){\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;Optional.of(shiroUser.getId());\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;null;\r\n&nbsp;&nbsp;&nbsp;&nbsp;}\r\n}</pre></li><li><p>repository调整</p></li><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p>之前的 delete(Long id)方法没有了，替换为：deleteById(Long id)</p></li><li><p>之前的 T findOne(Long id)方法没有了，替换为：		</p><pre>Optional&lt;T&gt;&nbsp;optional&nbsp;=&nbsp;***Repository.findById(id);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(optional.isPresent())&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;optional.get();\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;null;</pre></li></ul><li><p>随着这次Spring Boot的升级也顺便做了一些其他内容的调整和重构</p></li><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p>springframework也从4.3.5.RELEASE升级到5.1.3.RELEASE</p></li><li><p>为减小复杂度service去掉接口和实现类的结构，基础功能的service直接使用实现类；当然具体业务中如果有需求你也可以这没用</p></li><li><p>去掉了一些暂时用不到的maven依赖</p></li><li><p>完善了基础功能的审计功能(之前有介绍审计功能的实现翻番，后续会专门发一篇文档来说明审计功能在系统总的具体用法，当然聪明的你看代码就知道了)</p></li></ul></ul>\r\n                    </div>', 'guns-lite 升级 Spring Boot 到 2.1.1 版本', '1', '1');
INSERT INTO `t_cms_article` VALUES ('4', '1', '2019-03-09 16:24:58', '1', '2019-04-28 00:34:21', 'enilu.cn', 'H5通用官网系统', 'H5通用官网系统', '2', '17');
INSERT INTO `t_cms_article` VALUES ('5', '1', '2019-03-09 16:24:58', '1', '2019-04-28 00:34:36', 'enilu.cn', 'H5通用论坛系统', 'H5通用论坛系统', '2', '18');
INSERT INTO `t_cms_article` VALUES ('6', '1', '2019-03-09 16:24:58', '1', '2019-04-28 00:38:33', 'enilu.cn', '官网建设方案', '官网建设方案', '3', '19');
INSERT INTO `t_cms_article` VALUES ('7', '1', '2019-03-09 16:24:58', '1', '2019-04-28 00:39:48', 'enilu.cn', '论坛建设方案', '论坛建设方案', '3', '22');
INSERT INTO `t_cms_article` VALUES ('8', '1', '2019-03-09 16:24:58', '1', '2019-04-28 17:39:52', 'enilu.cn', '案例1', '案例1', '4', '3');
INSERT INTO `t_cms_article` VALUES ('9', '1', '2019-03-09 16:24:58', '1', '2019-04-28 00:39:11', 'enilu.cn', '案例2', '案例2', '4', '20');
INSERT INTO `t_cms_article` VALUES ('14', '1', '2019-03-09 16:24:58', '1', '2019-04-28 00:39:25', 'test5', '<p>aaaaa<img class=\"wscnph\" src=\"http://127.0.0.1:8082/file/download?idFile=12\" /></p>', 'test5', '4', '21');
INSERT INTO `t_cms_article` VALUES ('15', '1', '2019-04-28 17:39:52', '1', '2019-05-05 15:36:57', 'enilu', '<p><img class=\"wscnph\" src=\"http://127.0.0.1:8082/file/download?idFile=24\" /></p>', 'test', '1', '25');

-- ----------------------------
-- Table structure for `t_cms_banner`
-- ----------------------------
DROP TABLE IF EXISTS `t_cms_banner`;
CREATE TABLE `t_cms_banner` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint(20) DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `type` varchar(18) DEFAULT NULL,
  `id_file` bigint(20) DEFAULT NULL COMMENT 'banner文件id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='banner';

-- ----------------------------
-- Records of t_cms_banner
-- ----------------------------
INSERT INTO `t_cms_banner` VALUES ('1', '1', '2019-03-09 16:29:03', null, null, '不打开链接', 'javascript:', 'index', '1');
INSERT INTO `t_cms_banner` VALUES ('2', '1', '2019-03-09 16:29:03', null, null, '打打开站内链接', '/contact', 'index', '2');
INSERT INTO `t_cms_banner` VALUES ('3', '1', '2019-03-09 16:29:03', null, null, '打开外部链接', 'http://www.baidu.com', 'index', '6');
INSERT INTO `t_cms_banner` VALUES ('4', '1', '2019-03-09 16:29:03', null, null, '不打开链接', 'javascript:', 'product', '1');
INSERT INTO `t_cms_banner` VALUES ('5', '1', '2019-03-09 16:29:03', null, null, '打打开站内链接', '/contact', 'product', '2');
INSERT INTO `t_cms_banner` VALUES ('6', '1', '2019-03-09 16:29:03', null, null, '打开外部链接', 'http://www.baidu.com', 'product', '6');
INSERT INTO `t_cms_banner` VALUES ('7', '1', '2019-03-09 16:29:03', null, null, '不打开链接', 'javascript:', 'solution', '1');
INSERT INTO `t_cms_banner` VALUES ('8', '1', '2019-03-09 16:29:03', null, null, '打打开站内链接', '/contact', 'solution', '2');
INSERT INTO `t_cms_banner` VALUES ('9', '1', '2019-03-09 16:29:03', null, null, '打开外部链接', 'http://www.baidu.com', 'solution', '6');
INSERT INTO `t_cms_banner` VALUES ('10', '1', '2019-03-09 16:29:03', null, null, '不打开链接', 'javascript:', 'case', '1');
INSERT INTO `t_cms_banner` VALUES ('11', '1', '2019-03-09 16:29:03', null, null, '打打开站内链接', '/contact', 'case', '2');
INSERT INTO `t_cms_banner` VALUES ('12', '1', '2019-03-09 16:29:03', null, null, '打开外部链接', 'http://www.baidu.com', 'case', '6');
INSERT INTO `t_cms_banner` VALUES ('14', '1', '2019-03-09 16:29:03', null, null, '不打开链接', 'javascript:', 'news', '1');
INSERT INTO `t_cms_banner` VALUES ('15', '1', '2019-03-09 16:29:03', null, null, '打打开站内链接', '/contact', 'news', '2');
INSERT INTO `t_cms_banner` VALUES ('16', '1', '2019-03-09 16:29:03', null, null, '打开外部链接', 'http://www.baidu.com', 'news', '6');

-- ----------------------------
-- Table structure for `t_cms_channel`
-- ----------------------------
DROP TABLE IF EXISTS `t_cms_channel`;
CREATE TABLE `t_cms_channel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint(20) DEFAULT NULL COMMENT '最后更新者',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='栏目';

-- ----------------------------
-- Records of t_cms_channel
-- ----------------------------
INSERT INTO `t_cms_channel` VALUES ('1', null, null, '1', '2019-03-13 22:52:46', '动态资讯', 'news');
INSERT INTO `t_cms_channel` VALUES ('2', null, null, '1', '2019-03-13 22:53:11', '产品服务', 'product');
INSERT INTO `t_cms_channel` VALUES ('3', null, null, '1', '2019-03-13 22:53:37', '解决方案', 'solution');
INSERT INTO `t_cms_channel` VALUES ('4', null, null, '1', '2019-03-13 22:53:41', '精选案例', 'case');

-- ----------------------------
-- Table structure for `t_cms_contacts`
-- ----------------------------
DROP TABLE IF EXISTS `t_cms_contacts`;
CREATE TABLE `t_cms_contacts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint(20) DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='客户邀约信息';

-- ----------------------------
-- Records of t_cms_contacts
-- ----------------------------
INSERT INTO `t_cms_contacts` VALUES ('1', null, null, null, null, 'test@qq.com', '15011111111', '测试联系，哈哈哈', '张三');

-- ----------------------------
-- Table structure for `t_snow_product`
-- ----------------------------
DROP TABLE IF EXISTS `t_snow_product`;
CREATE TABLE `t_snow_product` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `product_no` varchar(50) DEFAULT NULL COMMENT '产品模板编号',
  `loan_amount_up` varchar(50) DEFAULT NULL COMMENT '借款金额上限',
  `loan_amount_down` varchar(50) DEFAULT NULL COMMENT '借款金额下限',
  `loan_amount_multiple` varchar(50) DEFAULT NULL COMMENT '借款金额倍数',
  `inter_rate_up` varchar(50) DEFAULT NULL COMMENT '利率上限',
  `inter_rate_down` varchar(50) DEFAULT NULL COMMENT '利率下限',
  `loan_fee_rate_up` varchar(50) DEFAULT NULL COMMENT '手续费率上限',
  `loan_fee_rate_down` varchar(50) DEFAULT NULL COMMENT '手续费率下限',
  `loan_fee_min` varchar(50) DEFAULT NULL COMMENT '最低手续费',
  `reapy_period_unit` varchar(50) DEFAULT NULL COMMENT '还款期数单位',
  `repay_period_day` int(32) DEFAULT NULL COMMENT '还款每期天数',
  `repay_period_up` varchar(50) DEFAULT NULL COMMENT '还款期数上限',
  `repay_period_down` varchar(50) DEFAULT NULL COMMENT '还款期数下限',
  `free_day_up` varchar(50) DEFAULT NULL COMMENT '免息期上限',
  `free_day_down` varchar(50) DEFAULT NULL COMMENT '免息期下限',
  `inter_type` int(32) DEFAULT NULL COMMENT '计息方式',
  `prepay_penalty_rate` varchar(50) DEFAULT NULL COMMENT '提前还款补偿金率',
  `prepay_fee_rate` varchar(50) DEFAULT NULL COMMENT '提前还款手续费率',
  `overdue_rate_up` varchar(50) DEFAULT NULL COMMENT '逾期利率上限',
  `overdue_rate_down` varchar(50) DEFAULT NULL COMMENT '逾期利率下限',
  `overdue_fee_rate_up` varchar(50) DEFAULT NULL COMMENT '逾期帐户管理费率上限',
  `overdue_fee_rate_down` varchar(50) DEFAULT NULL COMMENT '逾期帐户管理费率下限',
  `overdue_svc_fee_rate` varchar(50) DEFAULT NULL COMMENT '逾期服务费率',
  `overdue_up_day` int(32) DEFAULT NULL COMMENT '超过此天数使用逾期利率和管理率的上限',
  `overdue_down_day` int(32) DEFAULT NULL COMMENT '此天数内免收逾期费用',
  `id_user_create` bigint(64) DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `id_user_modify` bigint(64) DEFAULT NULL COMMENT '修改人id',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `holding_period_interest_rate` varchar(16) DEFAULT NULL COMMENT '容时期利率',
  `holding_period_fee_rate` varchar(16) DEFAULT '0.0025' COMMENT '容时期账号管理费率',
  `loan_amount_normal` varchar(10) DEFAULT NULL COMMENT '正常额度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品表';

-- ----------------------------
-- Records of t_snow_product
-- ----------------------------

-- ----------------------------
-- Table structure for `t_sys_cfg`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_cfg`;
CREATE TABLE `t_sys_cfg` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `cfg_name` varchar(100) DEFAULT NULL COMMENT '参数名',
  `cfg_value` varchar(3000) DEFAULT NULL COMMENT '参数值',
  `cfg_desc` varchar(200) DEFAULT NULL COMMENT '参数描述',
  `create_time` datetime DEFAULT NULL,
  `create_by` bigint(20) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `modify_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='系统参数';

-- ----------------------------
-- Records of t_sys_cfg
-- ----------------------------
INSERT INTO `t_sys_cfg` VALUES ('1', 'system.app.name', 'guns-lite', '应用名称update by 2019-03-27 11:47:04', null, null, '2019-04-15 21:36:07', '1');
INSERT INTO `t_sys_cfg` VALUES ('2', 'system.file.upload.path', 'D:\\data\\guns-lite\\runtime\\upload', '系统默认上传文件路径', null, null, '2019-04-15 21:36:17', '1');

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
  `create_time` datetime DEFAULT NULL,
  `create_by` bigint(20) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `modify_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of t_sys_dept
-- ----------------------------
INSERT INTO `t_sys_dept` VALUES ('24', '1', '0', '[0],', '总公司', '总公司', '', null, null, null, null, null);
INSERT INTO `t_sys_dept` VALUES ('25', '2', '24', '[0],[24],', '开发部', '开发部', '', null, null, null, null, null);
INSERT INTO `t_sys_dept` VALUES ('26', '3', '24', '[0],[24],', '运营部', '运营部', '', null, null, null, null, null);
INSERT INTO `t_sys_dept` VALUES ('27', '4', '24', '[0],[24],', '战略部', '战略部', '', null, null, null, null, null);

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
  `create_time` datetime DEFAULT NULL,
  `create_by` bigint(20) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `modify_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COMMENT='字典表';

-- ----------------------------
-- Records of t_sys_dict
-- ----------------------------
INSERT INTO `t_sys_dict` VALUES ('16', '0', '0', '状态', null, null, null, null, null);
INSERT INTO `t_sys_dict` VALUES ('17', '1', '16', '启用', null, null, null, null, null);
INSERT INTO `t_sys_dict` VALUES ('18', '2', '16', '禁用', null, null, null, null, null);
INSERT INTO `t_sys_dict` VALUES ('29', '0', '0', '性别', null, null, null, null, null);
INSERT INTO `t_sys_dict` VALUES ('30', '1', '29', '男', null, null, null, null, null);
INSERT INTO `t_sys_dict` VALUES ('31', '2', '29', '女', null, null, null, null, null);
INSERT INTO `t_sys_dict` VALUES ('35', '0', '0', '账号状态', null, null, null, null, null);
INSERT INTO `t_sys_dict` VALUES ('36', '1', '35', '启用', null, null, null, null, null);
INSERT INTO `t_sys_dict` VALUES ('37', '2', '35', '冻结', null, null, null, null, null);
INSERT INTO `t_sys_dict` VALUES ('38', '3', '35', '已删除', null, null, null, null, null);
INSERT INTO `t_sys_dict` VALUES ('53', '0', '0', '证件类型', null, null, null, null, null);
INSERT INTO `t_sys_dict` VALUES ('54', '1', '53', '身份证', null, null, null, null, null);
INSERT INTO `t_sys_dict` VALUES ('55', '2', '53', '护照', null, null, null, null, null);
INSERT INTO `t_sys_dict` VALUES ('68', '0', '0', '是否', null, '2019-01-13 14:18:21', '1', '2019-01-13 14:18:21', '1');
INSERT INTO `t_sys_dict` VALUES ('69', '1', '68', '是', null, '2019-01-13 14:18:21', '1', '2019-01-13 14:18:21', '1');
INSERT INTO `t_sys_dict` VALUES ('70', '0', '68', '否', null, '2019-01-13 14:18:21', '1', '2019-01-13 14:18:21', '1');

-- ----------------------------
-- Table structure for `t_sys_file_info`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_file_info`;
CREATE TABLE `t_sys_file_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint(20) DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `original_file_name` varchar(255) DEFAULT NULL,
  `real_file_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='文件信息';

-- ----------------------------
-- Records of t_sys_file_info
-- ----------------------------
INSERT INTO `t_sys_file_info` VALUES ('1', '1', '2019-03-18 10:34:34', '1', '2019-03-18 10:34:34', 'banner1.png', '7e9ebc08-b194-4f85-8997-d97ccb0d2c2d.png');
INSERT INTO `t_sys_file_info` VALUES ('2', '1', '2019-03-18 10:54:04', '1', '2019-03-18 10:54:04', 'banner2.png', '756b9ca8-562f-4bf5-a577-190dcdd25c29.png');
INSERT INTO `t_sys_file_info` VALUES ('3', '1', '2019-03-18 20:09:59', '1', '2019-03-18 20:09:59', 'offcial_site.png', 'b0304e2b-0ee3-4966-ac9f-a075b13d4af6.png');
INSERT INTO `t_sys_file_info` VALUES ('4', '1', '2019-03-18 20:10:18', '1', '2019-03-18 20:10:18', 'bbs.png', '67486aa5-500c-4993-87ad-7e1fbc90ac1a.png');
INSERT INTO `t_sys_file_info` VALUES ('5', '1', '2019-03-18 20:20:14', '1', '2019-03-18 20:20:14', 'product.png', '1f2b05e0-403a-41e0-94a2-465f0c986b78.png');
INSERT INTO `t_sys_file_info` VALUES ('6', '1', '2019-03-18 20:22:09', '1', '2019-03-18 20:22:09', 'profile.jpg', '40ead888-14d1-4e9f-abb3-5bfb056a966a.jpg');
INSERT INTO `t_sys_file_info` VALUES ('7', '1', '2019-03-20 09:05:54', '1', '2019-03-20 09:05:54', '2303938_1453211.png', '87b037da-b517-4007-a66e-ba7cc8cfd6ea.png');
INSERT INTO `t_sys_file_info` VALUES ('8', null, null, null, null, 'login.png', '26835cc4-059e-4900-aff5-a41f2ea6a61d.png');
INSERT INTO `t_sys_file_info` VALUES ('9', null, null, null, null, 'login.png', '7ec7553b-7c9e-44d9-b9c2-3d89b11cf842.png');
INSERT INTO `t_sys_file_info` VALUES ('10', null, null, null, null, 'login.png', '357c4aad-19fd-4600-9fb6-e62aafa3df25.png');
INSERT INTO `t_sys_file_info` VALUES ('11', null, null, null, null, 'index.png', '55dd582b-033e-440d-8e8d-c8d39d01f1bb.png');
INSERT INTO `t_sys_file_info` VALUES ('12', null, null, null, null, 'login.png', '70507c07-e8bc-492f-9f0a-00bf1c23e329.png');
INSERT INTO `t_sys_file_info` VALUES ('13', null, null, null, null, 'index.png', 'cd539518-d15a-4cda-a19f-251169f5d1a4.png');
INSERT INTO `t_sys_file_info` VALUES ('14', null, null, null, null, 'login.png', '194c8a38-be94-483c-8875-3c62a857ead7.png');
INSERT INTO `t_sys_file_info` VALUES ('15', null, null, null, null, 'index.png', '6a6cb215-d0a7-4574-a45e-5fa04dcfdf90.png');
INSERT INTO `t_sys_file_info` VALUES ('16', '1', '2019-03-21 19:37:50', null, null, '测试文档.doc', 'd9d77815-496f-475b-a0f8-1d6dcb86e6ab.doc');
INSERT INTO `t_sys_file_info` VALUES ('17', '1', '2019-04-28 00:34:09', null, null, '首页.png', 'd5aba978-f8af-45c5-b079-673decfbdf26.png');
INSERT INTO `t_sys_file_info` VALUES ('18', '1', '2019-04-28 00:34:34', null, null, '资讯.png', '7e07520d-5b73-4712-800b-16f88d133db2.png');
INSERT INTO `t_sys_file_info` VALUES ('19', '1', '2019-04-28 00:38:32', null, null, '产品服务.png', '99214651-8cb8-4488-b572-12c6aa21f30a.png');
INSERT INTO `t_sys_file_info` VALUES ('20', '1', '2019-04-28 00:39:09', null, null, '67486aa5-500c-4993-87ad-7e1fbc90ac1a.png', '31fdc83e-7688-41f5-b153-b6816d5dfb06.png');
INSERT INTO `t_sys_file_info` VALUES ('21', '1', '2019-04-28 00:39:22', null, null, '67486aa5-500c-4993-87ad-7e1fbc90ac1a.png', 'ffaf0563-3115-477b-b31d-47a4e80a75eb.png');
INSERT INTO `t_sys_file_info` VALUES ('22', '1', '2019-04-28 00:39:47', null, null, '7e07520d-5b73-4712-800b-16f88d133db2.png', '8928e5d4-933a-4953-9507-f60b78e3ccee.png');
INSERT INTO `t_sys_file_info` VALUES ('23', null, '2019-04-28 17:34:31', null, null, '756b9ca8-562f-4bf5-a577-190dcdd25c29.png', '7d64ba36-adc4-4982-9ec2-8c68db68861b.png');
INSERT INTO `t_sys_file_info` VALUES ('24', null, '2019-04-28 17:39:43', null, null, 'timg.jpg', '6483eb26-775c-4fe2-81bf-8dd49ac9b6b1.jpg');
INSERT INTO `t_sys_file_info` VALUES ('25', '1', '2019-05-05 15:36:54', null, null, 'timg.jpg', '7fe918a2-c59a-4d17-ad77-f65dd4e163bf.jpg');

-- ----------------------------
-- Table structure for `t_sys_login_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_login_log`;
CREATE TABLE `t_sys_login_log` (
  `id` int(65) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `logname` varchar(255) DEFAULT NULL COMMENT '日志名称',
  `userid` int(65) DEFAULT NULL COMMENT '管理员id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `succeed` varchar(255) DEFAULT NULL COMMENT '是否执行成功',
  `message` text COMMENT '具体消息',
  `ip` varchar(255) DEFAULT NULL COMMENT '登录ip',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COMMENT='登录记录';

-- ----------------------------
-- Records of t_sys_login_log
-- ----------------------------

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
  `create_time` datetime DEFAULT NULL,
  `create_by` bigint(20) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `modify_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of t_sys_menu
-- ----------------------------
INSERT INTO `t_sys_menu` VALUES ('105', 'system', '0', '[0],', '系统管理', 'fa-cog', '/system', '4', '1', '1', null, '1', '1', null, null, null, null);
INSERT INTO `t_sys_menu` VALUES ('106', 'mgr', 'system', '[0],[system],', '用户管理', '', '/mgr', '1', '2', '1', null, '1', null, null, null, '2019-04-16 18:59:16', '1');
INSERT INTO `t_sys_menu` VALUES ('107', 'mgr_add', 'mgr', '[0],[system],[mgr],', '添加用户', '', '/mgr/add', '1', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu` VALUES ('108', 'mgr_edit', 'mgr', '[0],[system],[mgr],', '修改用户', '', '/mgr/edit', '2', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu` VALUES ('109', 'mgr_delete', 'mgr', '[0],[system],[mgr],', '删除用户', null, '/mgr/delete', '3', '3', '0', null, '1', '0', null, null, null, null);
INSERT INTO `t_sys_menu` VALUES ('110', 'mgr_reset', 'mgr', '[0],[system],[mgr],', '重置密码', null, '/mgr/reset', '4', '3', '0', null, '1', '0', null, null, null, null);
INSERT INTO `t_sys_menu` VALUES ('111', 'mgr_freeze', 'mgr', '[0],[system],[mgr],', '冻结用户', null, '/mgr/freeze', '5', '3', '0', null, '1', '0', null, null, null, null);
INSERT INTO `t_sys_menu` VALUES ('112', 'mgr_unfreeze', 'mgr', '[0],[system],[mgr],', '解除冻结用户', null, '/mgr/unfreeze', '6', '3', '0', null, '1', '0', null, null, null, null);
INSERT INTO `t_sys_menu` VALUES ('113', 'mgr_setRole', 'mgr', '[0],[system],[mgr],', '分配角色', null, '/mgr/setRole', '7', '3', '0', null, '1', '0', null, null, null, null);
INSERT INTO `t_sys_menu` VALUES ('114', 'role', 'system', '[0],[system],', '角色管理', null, '/role', '2', '2', '1', null, '1', '0', null, null, null, null);
INSERT INTO `t_sys_menu` VALUES ('115', 'role_add', 'role', '[0],[system],[role],', '添加角色', null, '/role/add', '1', '3', '0', null, '1', '0', null, null, null, null);
INSERT INTO `t_sys_menu` VALUES ('116', 'role_edit', 'role', '[0],[system],[role],', '修改角色', null, '/role/edit', '2', '3', '0', null, '1', '0', null, null, null, null);
INSERT INTO `t_sys_menu` VALUES ('117', 'role_remove', 'role', '[0],[system],[role],', '删除角色', null, '/role/remove', '3', '3', '0', null, '1', '0', null, null, null, null);
INSERT INTO `t_sys_menu` VALUES ('118', 'role_setAuthority', 'role', '[0],[system],[role],', '配置权限', null, '/role/setAuthority', '4', '3', '0', null, '1', '0', null, null, null, null);
INSERT INTO `t_sys_menu` VALUES ('119', 'menu', 'system', '[0],[system],', '菜单管理', null, '/menu', '4', '2', '1', null, '1', '0', null, null, null, null);
INSERT INTO `t_sys_menu` VALUES ('120', 'menu_add', 'menu', '[0],[system],[menu],', '添加菜单', null, '/menu/add', '1', '3', '0', null, '1', '0', null, null, null, null);
INSERT INTO `t_sys_menu` VALUES ('121', 'menu_edit', 'menu', '[0],[system],[menu],', '修改菜单', null, '/menu/edit', '2', '3', '0', null, '1', '0', null, null, null, null);
INSERT INTO `t_sys_menu` VALUES ('122', 'menu_remove', 'menu', '[0],[system],[menu],', '删除菜单', null, '/menu/remove', '3', '3', '0', null, '1', '0', null, null, null, null);
INSERT INTO `t_sys_menu` VALUES ('128', 'log', 'system', '[0],[system],', '业务日志', null, '/log', '6', '2', '1', null, '1', '0', null, null, null, null);
INSERT INTO `t_sys_menu` VALUES ('131', 'dept', 'system', '[0],[system],', '部门管理', null, '/dept', '3', '2', '1', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu` VALUES ('132', 'dict', 'system', '[0],[system],', '字典管理', null, '/dict', '4', '2', '1', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu` VALUES ('133', 'loginLog', 'system', '[0],[system],', '登录日志', null, '/loginLog', '6', '2', '1', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu` VALUES ('134', 'log_clean', 'log', '[0],[system],[log],', '清空日志', null, '/log/delLog', '3', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu` VALUES ('135', 'dept_add', 'dept', '[0],[system],[dept],', '添加部门', null, '/dept/add', '1', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu` VALUES ('136', 'dept_update', 'dept', '[0],[system],[dept],', '修改部门', null, '/dept/update', '1', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu` VALUES ('137', 'dept_delete', 'dept', '[0],[system],[dept],', '删除部门', null, '/dept/delete', '1', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu` VALUES ('138', 'dict_add', 'dict', '[0],[system],[dict],', '添加字典', null, '/dict/add', '1', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu` VALUES ('139', 'dict_update', 'dict', '[0],[system],[dict],', '修改字典', null, '/dict/update', '1', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu` VALUES ('140', 'dict_delete', 'dict', '[0],[system],[dict],', '删除字典', null, '/dict/delete', '1', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu` VALUES ('150', 'to_menu_edit', 'menu', '[0],[system],[menu],', '菜单编辑跳转', '', '/menu/menu_edit', '4', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu` VALUES ('151', 'menu_list', 'menu', '[0],[system],[menu],', '菜单列表', '', '/menu/list', '5', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu` VALUES ('152', 'to_dept_update', 'dept', '[0],[system],[dept],', '修改部门跳转', '', '/dept/dept_update', '4', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu` VALUES ('153', 'dept_list', 'dept', '[0],[system],[dept],', '部门列表', '', '/dept/list', '5', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu` VALUES ('154', 'dept_detail', 'dept', '[0],[system],[dept],', '部门详情', '', '/dept/detail', '6', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu` VALUES ('155', 'to_dict_edit', 'dict', '[0],[system],[dict],', '修改菜单跳转', '', '/dict/dict_edit', '4', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu` VALUES ('156', 'dict_list', 'dict', '[0],[system],[dict],', '字典列表', '', '/dict/list', '5', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu` VALUES ('157', 'dict_detail', 'dict', '[0],[system],[dict],', '字典详情', '', '/dict/detail', '6', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu` VALUES ('159', 'log_detail', 'log', '[0],[system],[log],', '日志详情', '', '/log/detail', '3', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu` VALUES ('160', 'del_login_log', 'loginLog', '[0],[system],[loginLog],', '清空登录日志', '', '/loginLog/delLoginLog', '1', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu` VALUES ('161', 'login_log_list', 'loginLog', '[0],[system],[loginLog],', '登录日志列表', '', '/loginLog/list', '2', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu` VALUES ('162', 'to_role_edit', 'role', '[0],[system],[role],', '修改角色跳转', '', '/role/role_edit', '5', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu` VALUES ('163', 'to_role_assign', 'role', '[0],[system],[role],', '角色分配跳转', '', '/role/role_assign', '6', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu` VALUES ('164', 'role_list', 'role', '[0],[system],[role],', '角色列表', '', '/role/list', '7', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu` VALUES ('165', 'to_assign_role', 'mgr', '[0],[system],[mgr],', '分配角色跳转', '', '/mgr/role_assign', '8', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu` VALUES ('166', 'to_user_edit', 'mgr', '[0],[system],[mgr],', '编辑用户跳转', '', '/mgr/user_edit', '9', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu` VALUES ('167', 'mgr_list', 'mgr', '[0],[system],[mgr],', '用户列表', '', '/mgr/list', '10', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu` VALUES ('198', 'cfg', 'system', '[0],[system],', '参数管理', '', '/cfg', '10', '2', '1', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu` VALUES ('199', 'cfg_add', 'cfg', '[0],[system],[cfg],', '添加系统参数', '', '/cfg/add', '1', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu` VALUES ('200', 'cfg_update', 'cfg', '[0],[system],[cfg],', '修改系统参数', '', '/cfg/update', '2', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu` VALUES ('201', 'cfg_delete', 'cfg', '[0],[system],[cfg],', '删除系统参数', '', '/cfg/delete', '3', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu` VALUES ('202', 'task', 'system', '[0],[system],', '任务管理', '', '/task', '11', '2', '1', '', '1', null, null, null, null, null);
INSERT INTO `t_sys_menu` VALUES ('203', 'task_add', 'task', '[0],[system],[task],', '添加任务', '', '/task/add', '1', '3', '0', '', '1', null, null, null, null, null);
INSERT INTO `t_sys_menu` VALUES ('204', 'task_update', 'task', '[0],[system],[task],', '修改任务', '', '/task/update', '2', '3', '0', '', '1', null, null, null, null, null);
INSERT INTO `t_sys_menu` VALUES ('205', 'task_delete', 'task', '[0],[system],[task],', '删除任务', '', '/task/delete', '3', '3', '0', '', '1', null, null, null, null, null);
INSERT INTO `t_sys_menu` VALUES ('206', 'cms', '0', '[0],', 'CMS管理', '', '/cms', '5', '1', '1', null, '1', null, null, null, '2019-03-11 22:25:38', '1');
INSERT INTO `t_sys_menu` VALUES ('207', 'channel', 'cms', '[0],[cms],', '栏目管理', null, '/channel', '1', '2', '1', null, '1', null, '2019-03-11 22:29:55', '1', '2019-03-11 22:29:55', '1');
INSERT INTO `t_sys_menu` VALUES ('208', 'article', 'cms', '[0],[cms],', '文章管理', null, '/article', '2', '2', '1', null, '1', null, '2019-03-11 22:30:18', '1', '2019-03-11 22:30:18', '1');
INSERT INTO `t_sys_menu` VALUES ('209', 'banner', 'cms', '[0],[cms],', 'banner管理', null, '/banner', '3', '2', '1', null, '1', null, '2019-03-11 22:30:52', '1', '2019-03-11 22:30:52', '1');
INSERT INTO `t_sys_menu` VALUES ('210', 'contacts', 'cms', '[0],[cms],', '联系管理', null, '/contacts', '4', '2', '1', null, '1', null, '2019-03-18 19:45:38', '1', '2019-03-18 19:45:38', '1');
INSERT INTO `t_sys_menu` VALUES ('211', 'fileMgr', 'cms', '[0],[cms],', '文件管理', null, '/fileMgr', '5', '2', '1', null, '1', null, '2019-03-19 10:25:06', '1', '2019-03-19 10:25:06', '1');
INSERT INTO `t_sys_menu` VALUES ('214', 'task_log', 'task', '[0],[system],[task],', '任务日志', null, '/taskLog', '4', '3', '1', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu` VALUES ('215', 'editArticle', 'article', '[0],[cms],[article]', '编辑文章', null, '/article/edit', '1', '3', '1', null, '1', null, '2019-03-11 22:30:18', '1', '2019-03-11 22:30:18', '1');

-- ----------------------------
-- Table structure for `t_sys_menu_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_menu_admin`;
CREATE TABLE `t_sys_menu_admin` (
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
  `create_time` datetime DEFAULT NULL,
  `create_by` bigint(20) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `modify_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of t_sys_menu_admin
-- ----------------------------
INSERT INTO `t_sys_menu_admin` VALUES ('105', 'system', '0', '[0],', '系统管理', 'fa-cog', '#', '4', '1', '1', null, '1', '1', null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('106', 'mgr', 'system', '[0],[system],', '用户管理', '', '/mgr', '1', '2', '1', null, '1', '0', null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('107', 'mgr_add', 'mgr', '[0],[system],[mgr],', '添加用户', '', '/mgr/add', '1', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('108', 'mgr_edit', 'mgr', '[0],[system],[mgr],', '修改用户', '', '/mgr/edit', '2', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('109', 'mgr_delete', 'mgr', '[0],[system],[mgr],', '删除用户', null, '/mgr/delete', '3', '3', '0', null, '1', '0', null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('110', 'mgr_reset', 'mgr', '[0],[system],[mgr],', '重置密码', null, '/mgr/reset', '4', '3', '0', null, '1', '0', null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('111', 'mgr_freeze', 'mgr', '[0],[system],[mgr],', '冻结用户', null, '/mgr/freeze', '5', '3', '0', null, '1', '0', null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('112', 'mgr_unfreeze', 'mgr', '[0],[system],[mgr],', '解除冻结用户', null, '/mgr/unfreeze', '6', '3', '0', null, '1', '0', null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('113', 'mgr_setRole', 'mgr', '[0],[system],[mgr],', '分配角色', null, '/mgr/setRole', '7', '3', '0', null, '1', '0', null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('114', 'role', 'system', '[0],[system],', '角色管理', null, '/role', '2', '2', '1', null, '1', '0', null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('115', 'role_add', 'role', '[0],[system],[role],', '添加角色', null, '/role/add', '1', '3', '0', null, '1', '0', null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('116', 'role_edit', 'role', '[0],[system],[role],', '修改角色', null, '/role/edit', '2', '3', '0', null, '1', '0', null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('117', 'role_remove', 'role', '[0],[system],[role],', '删除角色', null, '/role/remove', '3', '3', '0', null, '1', '0', null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('118', 'role_setAuthority', 'role', '[0],[system],[role],', '配置权限', null, '/role/setAuthority', '4', '3', '0', null, '1', '0', null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('119', 'menu', 'system', '[0],[system],', '菜单管理', null, '/menu', '4', '2', '1', null, '1', '0', null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('120', 'menu_add', 'menu', '[0],[system],[menu],', '添加菜单', null, '/menu/add', '1', '3', '0', null, '1', '0', null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('121', 'menu_edit', 'menu', '[0],[system],[menu],', '修改菜单', null, '/menu/edit', '2', '3', '0', null, '1', '0', null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('122', 'menu_remove', 'menu', '[0],[system],[menu],', '删除菜单', null, '/menu/remove', '3', '3', '0', null, '1', '0', null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('128', 'log', 'system', '[0],[system],', '业务日志', null, '/log', '6', '2', '1', null, '1', '0', null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('130', 'druid', 'system', '[0],[system],', '监控管理', null, '/druid', '7', '2', '1', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('131', 'dept', 'system', '[0],[system],', '部门管理', null, '/dept', '3', '2', '1', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('132', 'dict', 'system', '[0],[system],', '字典管理', null, '/dict', '4', '2', '1', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('133', 'loginLog', 'system', '[0],[system],', '登录日志', null, '/loginLog', '6', '2', '1', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('134', 'log_clean', 'log', '[0],[system],[log],', '清空日志', null, '/log/delLog', '3', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('135', 'dept_add', 'dept', '[0],[system],[dept],', '添加部门', null, '/dept/add', '1', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('136', 'dept_update', 'dept', '[0],[system],[dept],', '修改部门', null, '/dept/update', '1', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('137', 'dept_delete', 'dept', '[0],[system],[dept],', '删除部门', null, '/dept/delete', '1', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('138', 'dict_add', 'dict', '[0],[system],[dict],', '添加字典', null, '/dict/add', '1', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('139', 'dict_update', 'dict', '[0],[system],[dict],', '修改字典', null, '/dict/update', '1', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('140', 'dict_delete', 'dict', '[0],[system],[dict],', '删除字典', null, '/dict/delete', '1', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('141', 'notice', 'system', '[0],[system],', '通知管理', null, '/notice', '9', '2', '1', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('142', 'notice_add', 'notice', '[0],[system],[notice],', '添加通知', null, '/notice/add', '1', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('143', 'notice_update', 'notice', '[0],[system],[notice],', '修改通知', null, '/notice/update', '2', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('144', 'notice_delete', 'notice', '[0],[system],[notice],', '删除通知', null, '/notice/delete', '3', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('145', 'notice', '0', '[0],', '通知', 'fa-rocket', '/notice/hello', '1', '1', '1', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('148', 'code', '0', '[0],', '代码生成', 'fa-code', '/code', '3', '1', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('149', 'api_mgr', '0', '[0],', '接口文档', 'fa-leaf', '/swagger-ui.html', '2', '1', '1', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('150', 'to_menu_edit', 'menu', '[0],[system],[menu],', '菜单编辑跳转', '', '/menu/menu_edit', '4', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('151', 'menu_list', 'menu', '[0],[system],[menu],', '菜单列表', '', '/menu/list', '5', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('152', 'to_dept_update', 'dept', '[0],[system],[dept],', '修改部门跳转', '', '/dept/dept_update', '4', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('153', 'dept_list', 'dept', '[0],[system],[dept],', '部门列表', '', '/dept/list', '5', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('154', 'dept_detail', 'dept', '[0],[system],[dept],', '部门详情', '', '/dept/detail', '6', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('155', 'to_dict_edit', 'dict', '[0],[system],[dict],', '修改菜单跳转', '', '/dict/dict_edit', '4', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('156', 'dict_list', 'dict', '[0],[system],[dict],', '字典列表', '', '/dict/list', '5', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('157', 'dict_detail', 'dict', '[0],[system],[dict],', '字典详情', '', '/dict/detail', '6', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('159', 'log_detail', 'log', '[0],[system],[log],', '日志详情', '', '/log/detail', '3', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('160', 'del_login_log', 'loginLog', '[0],[system],[loginLog],', '清空登录日志', '', '/loginLog/delLoginLog', '1', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('161', 'login_log_list', 'loginLog', '[0],[system],[loginLog],', '登录日志列表', '', '/loginLog/list', '2', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('162', 'to_role_edit', 'role', '[0],[system],[role],', '修改角色跳转', '', '/role/role_edit', '5', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('163', 'to_role_assign', 'role', '[0],[system],[role],', '角色分配跳转', '', '/role/role_assign', '6', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('164', 'role_list', 'role', '[0],[system],[role],', '角色列表', '', '/role/list', '7', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('165', 'to_assign_role', 'mgr', '[0],[system],[mgr],', '分配角色跳转', '', '/mgr/role_assign', '8', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('166', 'to_user_edit', 'mgr', '[0],[system],[mgr],', '编辑用户跳转', '', '/mgr/user_edit', '9', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('167', 'mgr_list', 'mgr', '[0],[system],[mgr],', '用户列表', '', '/mgr/list', '10', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('198', 'cfg', 'system', '[0],[system],', '参数管理', '', '/cfg', '10', '2', '1', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('199', 'cfg_add', 'cfg', '[0],[system],[cfg],', '添加系统参数', '', '/cfg/add', '1', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('200', 'cfg_update', 'cfg', '[0],[system],[cfg],', '修改系统参数', '', '/cfg/update', '2', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('201', 'cfg_delete', 'cfg', '[0],[system],[cfg],', '删除系统参数', '', '/cfg/delete', '3', '3', '0', null, '1', null, null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('202', 'task', 'system', '[0],[system],', '任务管理', '', '/task', '11', '2', '1', '', '1', null, null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('203', 'task_add', 'task', '[0],[system],[task],', '添加任务', '', '/task/add', '1', '3', '0', '', '1', null, null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('204', 'task_update', 'task', '[0],[system],[task],', '修改任务', '', '/task/update', '2', '3', '0', '', '1', null, null, null, null, null);
INSERT INTO `t_sys_menu_admin` VALUES ('205', 'task_delete', 'task', '[0],[system],[task],', '删除任务', '', '/task/delete', '3', '3', '0', '', '1', null, null, null, null, null);

-- ----------------------------
-- Table structure for `t_sys_notice`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_notice`;
CREATE TABLE `t_sys_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `type` int(11) DEFAULT NULL COMMENT '类型',
  `content` text COMMENT '内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(11) DEFAULT NULL COMMENT '创建人',
  `modify_time` datetime DEFAULT NULL,
  `modify_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='通知表';

-- ----------------------------
-- Records of t_sys_notice
-- ----------------------------
INSERT INTO `t_sys_notice` VALUES ('1', '世界', '10', '欢迎使用guns-lite后台管理系统', '2017-01-11 08:53:20', '1', '2019-01-08 23:30:58', '1');

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
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `succeed` varchar(255) DEFAULT NULL COMMENT '是否成功',
  `message` text COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COMMENT='操作日志';

-- ----------------------------
-- Records of t_sys_operation_log
-- ----------------------------

-- ----------------------------
-- Table structure for `t_sys_relation`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_relation`;
CREATE TABLE `t_sys_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `menuid` bigint(11) DEFAULT NULL COMMENT '菜单id',
  `roleid` int(11) DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=613 DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of t_sys_relation
-- ----------------------------
INSERT INTO `t_sys_relation` VALUES ('281', '105', '3');
INSERT INTO `t_sys_relation` VALUES ('282', '106', '3');
INSERT INTO `t_sys_relation` VALUES ('283', '107', '3');
INSERT INTO `t_sys_relation` VALUES ('284', '108', '3');
INSERT INTO `t_sys_relation` VALUES ('285', '109', '3');
INSERT INTO `t_sys_relation` VALUES ('286', '110', '3');
INSERT INTO `t_sys_relation` VALUES ('287', '111', '3');
INSERT INTO `t_sys_relation` VALUES ('288', '112', '3');
INSERT INTO `t_sys_relation` VALUES ('289', '113', '3');
INSERT INTO `t_sys_relation` VALUES ('290', '165', '3');
INSERT INTO `t_sys_relation` VALUES ('291', '166', '3');
INSERT INTO `t_sys_relation` VALUES ('292', '167', '3');
INSERT INTO `t_sys_relation` VALUES ('293', '114', '3');
INSERT INTO `t_sys_relation` VALUES ('294', '115', '3');
INSERT INTO `t_sys_relation` VALUES ('295', '116', '3');
INSERT INTO `t_sys_relation` VALUES ('296', '117', '3');
INSERT INTO `t_sys_relation` VALUES ('297', '118', '3');
INSERT INTO `t_sys_relation` VALUES ('298', '162', '3');
INSERT INTO `t_sys_relation` VALUES ('299', '163', '3');
INSERT INTO `t_sys_relation` VALUES ('300', '164', '3');
INSERT INTO `t_sys_relation` VALUES ('301', '119', '3');
INSERT INTO `t_sys_relation` VALUES ('302', '120', '3');
INSERT INTO `t_sys_relation` VALUES ('303', '121', '3');
INSERT INTO `t_sys_relation` VALUES ('304', '122', '3');
INSERT INTO `t_sys_relation` VALUES ('305', '150', '3');
INSERT INTO `t_sys_relation` VALUES ('306', '151', '3');
INSERT INTO `t_sys_relation` VALUES ('307', '128', '3');
INSERT INTO `t_sys_relation` VALUES ('308', '134', '3');
INSERT INTO `t_sys_relation` VALUES ('309', '159', '3');
INSERT INTO `t_sys_relation` VALUES ('310', '131', '3');
INSERT INTO `t_sys_relation` VALUES ('311', '135', '3');
INSERT INTO `t_sys_relation` VALUES ('312', '136', '3');
INSERT INTO `t_sys_relation` VALUES ('313', '137', '3');
INSERT INTO `t_sys_relation` VALUES ('314', '152', '3');
INSERT INTO `t_sys_relation` VALUES ('315', '153', '3');
INSERT INTO `t_sys_relation` VALUES ('316', '154', '3');
INSERT INTO `t_sys_relation` VALUES ('317', '132', '3');
INSERT INTO `t_sys_relation` VALUES ('318', '138', '3');
INSERT INTO `t_sys_relation` VALUES ('319', '139', '3');
INSERT INTO `t_sys_relation` VALUES ('320', '140', '3');
INSERT INTO `t_sys_relation` VALUES ('321', '155', '3');
INSERT INTO `t_sys_relation` VALUES ('322', '156', '3');
INSERT INTO `t_sys_relation` VALUES ('323', '157', '3');
INSERT INTO `t_sys_relation` VALUES ('324', '133', '3');
INSERT INTO `t_sys_relation` VALUES ('325', '160', '3');
INSERT INTO `t_sys_relation` VALUES ('326', '161', '3');
INSERT INTO `t_sys_relation` VALUES ('327', '198', '3');
INSERT INTO `t_sys_relation` VALUES ('328', '199', '3');
INSERT INTO `t_sys_relation` VALUES ('329', '200', '3');
INSERT INTO `t_sys_relation` VALUES ('330', '201', '3');
INSERT INTO `t_sys_relation` VALUES ('331', '202', '3');
INSERT INTO `t_sys_relation` VALUES ('332', '203', '3');
INSERT INTO `t_sys_relation` VALUES ('333', '204', '3');
INSERT INTO `t_sys_relation` VALUES ('334', '205', '3');
INSERT INTO `t_sys_relation` VALUES ('534', '105', '2');
INSERT INTO `t_sys_relation` VALUES ('535', '106', '2');
INSERT INTO `t_sys_relation` VALUES ('536', '107', '2');
INSERT INTO `t_sys_relation` VALUES ('537', '108', '2');
INSERT INTO `t_sys_relation` VALUES ('538', '109', '2');
INSERT INTO `t_sys_relation` VALUES ('539', '110', '2');
INSERT INTO `t_sys_relation` VALUES ('540', '111', '2');
INSERT INTO `t_sys_relation` VALUES ('541', '112', '2');
INSERT INTO `t_sys_relation` VALUES ('542', '113', '2');
INSERT INTO `t_sys_relation` VALUES ('543', '165', '2');
INSERT INTO `t_sys_relation` VALUES ('544', '166', '2');
INSERT INTO `t_sys_relation` VALUES ('545', '167', '2');
INSERT INTO `t_sys_relation` VALUES ('547', '105', '1');
INSERT INTO `t_sys_relation` VALUES ('548', '106', '1');
INSERT INTO `t_sys_relation` VALUES ('549', '107', '1');
INSERT INTO `t_sys_relation` VALUES ('550', '108', '1');
INSERT INTO `t_sys_relation` VALUES ('551', '109', '1');
INSERT INTO `t_sys_relation` VALUES ('552', '110', '1');
INSERT INTO `t_sys_relation` VALUES ('553', '111', '1');
INSERT INTO `t_sys_relation` VALUES ('554', '112', '1');
INSERT INTO `t_sys_relation` VALUES ('555', '113', '1');
INSERT INTO `t_sys_relation` VALUES ('556', '165', '1');
INSERT INTO `t_sys_relation` VALUES ('557', '166', '1');
INSERT INTO `t_sys_relation` VALUES ('558', '167', '1');
INSERT INTO `t_sys_relation` VALUES ('559', '114', '1');
INSERT INTO `t_sys_relation` VALUES ('560', '115', '1');
INSERT INTO `t_sys_relation` VALUES ('561', '116', '1');
INSERT INTO `t_sys_relation` VALUES ('562', '117', '1');
INSERT INTO `t_sys_relation` VALUES ('563', '118', '1');
INSERT INTO `t_sys_relation` VALUES ('564', '162', '1');
INSERT INTO `t_sys_relation` VALUES ('565', '163', '1');
INSERT INTO `t_sys_relation` VALUES ('566', '164', '1');
INSERT INTO `t_sys_relation` VALUES ('567', '119', '1');
INSERT INTO `t_sys_relation` VALUES ('568', '120', '1');
INSERT INTO `t_sys_relation` VALUES ('569', '121', '1');
INSERT INTO `t_sys_relation` VALUES ('570', '122', '1');
INSERT INTO `t_sys_relation` VALUES ('571', '150', '1');
INSERT INTO `t_sys_relation` VALUES ('572', '151', '1');
INSERT INTO `t_sys_relation` VALUES ('573', '128', '1');
INSERT INTO `t_sys_relation` VALUES ('574', '134', '1');
INSERT INTO `t_sys_relation` VALUES ('575', '159', '1');
INSERT INTO `t_sys_relation` VALUES ('576', '131', '1');
INSERT INTO `t_sys_relation` VALUES ('577', '135', '1');
INSERT INTO `t_sys_relation` VALUES ('578', '136', '1');
INSERT INTO `t_sys_relation` VALUES ('579', '137', '1');
INSERT INTO `t_sys_relation` VALUES ('580', '152', '1');
INSERT INTO `t_sys_relation` VALUES ('581', '153', '1');
INSERT INTO `t_sys_relation` VALUES ('582', '154', '1');
INSERT INTO `t_sys_relation` VALUES ('583', '132', '1');
INSERT INTO `t_sys_relation` VALUES ('584', '138', '1');
INSERT INTO `t_sys_relation` VALUES ('585', '139', '1');
INSERT INTO `t_sys_relation` VALUES ('586', '140', '1');
INSERT INTO `t_sys_relation` VALUES ('587', '155', '1');
INSERT INTO `t_sys_relation` VALUES ('588', '156', '1');
INSERT INTO `t_sys_relation` VALUES ('589', '157', '1');
INSERT INTO `t_sys_relation` VALUES ('590', '133', '1');
INSERT INTO `t_sys_relation` VALUES ('591', '160', '1');
INSERT INTO `t_sys_relation` VALUES ('592', '161', '1');
INSERT INTO `t_sys_relation` VALUES ('593', '198', '1');
INSERT INTO `t_sys_relation` VALUES ('594', '199', '1');
INSERT INTO `t_sys_relation` VALUES ('595', '200', '1');
INSERT INTO `t_sys_relation` VALUES ('596', '201', '1');
INSERT INTO `t_sys_relation` VALUES ('597', '202', '1');
INSERT INTO `t_sys_relation` VALUES ('598', '203', '1');
INSERT INTO `t_sys_relation` VALUES ('599', '204', '1');
INSERT INTO `t_sys_relation` VALUES ('600', '205', '1');
INSERT INTO `t_sys_relation` VALUES ('605', '206', '1');
INSERT INTO `t_sys_relation` VALUES ('606', '207', '1');
INSERT INTO `t_sys_relation` VALUES ('607', '208', '1');
INSERT INTO `t_sys_relation` VALUES ('608', '209', '1');
INSERT INTO `t_sys_relation` VALUES ('609', '210', '1');
INSERT INTO `t_sys_relation` VALUES ('610', '211', '1');
INSERT INTO `t_sys_relation` VALUES ('611', '214', '1');
INSERT INTO `t_sys_relation` VALUES ('612', '215', '1');

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
  `create_time` datetime DEFAULT NULL,
  `create_by` bigint(20) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `modify_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of t_sys_role
-- ----------------------------
INSERT INTO `t_sys_role` VALUES ('1', '1', '0', '超级管理员', '24', 'administrator', '1', null, null, null, null);
INSERT INTO `t_sys_role` VALUES ('2', '1', '1', '开发人员', '25', 'developer', null, null, null, null, null);
INSERT INTO `t_sys_role` VALUES ('3', '3', '0', 'test', '24', '测试', null, null, null, null, null);

-- ----------------------------
-- Table structure for `t_sys_task`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_task`;
CREATE TABLE `t_sys_task` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `name` varchar(50) DEFAULT NULL COMMENT '任务名',
  `job_group` varchar(50) DEFAULT NULL COMMENT '任务组',
  `job_class` varchar(255) DEFAULT NULL COMMENT '执行类',
  `note` varchar(255) DEFAULT NULL COMMENT '任务说明',
  `cron` varchar(50) DEFAULT NULL COMMENT '定时规则',
  `data` text COMMENT '执行参数',
  `exec_at` datetime DEFAULT NULL COMMENT '执行时间',
  `exec_result` text COMMENT '执行结果',
  `disabled` tinyint(1) DEFAULT NULL COMMENT '是否禁用',
  `create_time` datetime DEFAULT NULL,
  `create_by` bigint(20) DEFAULT NULL,
  `concurrent` tinyint(4) DEFAULT '0' COMMENT '是否允许并发',
  `modify_time` datetime DEFAULT NULL,
  `modify_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='定时任务';

-- ----------------------------
-- Records of t_sys_task
-- ----------------------------
INSERT INTO `t_sys_task` VALUES ('1', '测试任务', 'default', 'cn.enilu.guns.service.task.job.HelloJob', '测试任务\n            \n            \n            \n            ', '0 47 11 * * ?', '{\n\"appname\": \"guns-lite\",\n\"version\":1\n}\n            \n            \n            \n            \n            \n            \n            \n            \n            \n            \n            \n            ', '2019-03-27 11:47:00', '执行成功', '0', '2018-12-28 09:54:00', '1', '0', '2019-03-27 11:47:11', '-1');

-- ----------------------------
-- Table structure for `t_sys_task_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_task_log`;
CREATE TABLE `t_sys_task_log` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `name` varchar(50) DEFAULT NULL COMMENT '任务名',
  `exec_at` datetime DEFAULT NULL COMMENT '执行时间',
  `exec_success` int(11) DEFAULT NULL COMMENT '执行结果（成功:1、失败:0)',
  `job_exception` varchar(255) DEFAULT NULL COMMENT '抛出异常',
  `id_task` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='定时任务日志';

-- ----------------------------
-- Records of t_sys_task_log
-- ----------------------------

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
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `version` int(11) DEFAULT NULL COMMENT '保留字段',
  `create_by` bigint(20) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `modify_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of t_sys_user
-- ----------------------------
INSERT INTO `t_sys_user` VALUES ('-1', null, 'system', null, null, '应用系统', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_sys_user` VALUES ('1', null, 'admin', '6ab1f386d715cfb6be85de941d438b02', '8pgby', '管理员', '2017-05-05 00:00:00', '2', 'eniluzt@qq.com', null, '1', '27', '1', '2016-01-29 08:49:53', '25', null, '2019-03-20 23:45:24', '1');
INSERT INTO `t_sys_user` VALUES ('45', null, 'boss', '71887a5ad666a18f709e1d4e693d5a35', '1f7bf', '老板', '2017-12-04 00:00:00', '1', '', '', '1,2,', '24', '1', '2017-12-04 22:24:02', null, null, '2019-01-09 23:06:09', '1');
INSERT INTO `t_sys_user` VALUES ('46', null, 'manager', 'b53cac62e7175637d4beb3b16b2f7915', 'j3cs9', '经理', '2017-12-04 00:00:00', '1', '', '', '1', '24', '1', '2017-12-04 22:24:24', null, null, null, null);
INSERT INTO `t_sys_user` VALUES ('47', null, 'developer', '4552805b07a4bf92ce1cea0373aab868', 'vscp9', '开发人员', '2017-12-31 00:00:00', '1', 'eniluzt@qq.com', '', '2,', '25', '1', '2018-09-13 17:21:02', null, null, '2019-01-09 23:05:51', '1');

-- ----------------------------
-- Table structure for `t_test_boy`
-- ----------------------------
DROP TABLE IF EXISTS `t_test_boy`;
CREATE TABLE `t_test_boy` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint(20) DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `birthday` varchar(12) DEFAULT NULL COMMENT '生日',
  `has_girl_friend` tinyint(4) DEFAULT NULL COMMENT '是否有女朋友',
  `name` varchar(32) DEFAULT NULL COMMENT '姓名',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='男孩';

-- ----------------------------
-- Records of t_test_boy
-- ----------------------------
INSERT INTO `t_test_boy` VALUES ('1', null, null, null, null, '18', '2000-01-01', '1', '张三');

-- ----------------------------
-- Table structure for `t_test_girl`
-- ----------------------------
DROP TABLE IF EXISTS `t_test_girl`;
CREATE TABLE `t_test_girl` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint(20) DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `has_boy_friend` tinyint(4) DEFAULT NULL COMMENT '是否有男朋友',
  `name` varchar(32) DEFAULT NULL COMMENT '姓名',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='女孩';

-- ----------------------------
-- Records of t_test_girl
-- ----------------------------
