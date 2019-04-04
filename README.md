# Guns-lite

## 前言

 - guns-lite是在[guns](https://github.com/stylefeng/Guns)的基础上将数据库层由mybatis替换为spring data jpa的系统。
 - guns-lite是一个基于spring boot的后台管理系统。

## 分支
- admin-flat 该分支将guns-admin页面更改为扁平化风格，去掉iframe+标签页的形式:

 ![flat](https://user-images.githubusercontent.com/3115814/38806871-49f57248-41ad-11e8-932b-e06dc1941107.jpg)

- oracle, 该分支将底层数据使用oracle。

## 目录说明
- guns-admin 一个成熟的后台管理系统，完全具备了后台管理系统的基本功能
- guns-admin-vuejs 基于vuejs的后台管理,如果你想要前后端分离，那么该目录和下面的guns-api可以帮到你，这两个模块共同实现了上面guns-admin实现了的功能
- guns-api 基于vuejs后台管理的api服务
- guns-h5 移动端内容系统，基于后台管理CMS内容管理模块的内容进行展示。
- guns-utils 工具包
- guns-dao  dao层
- guns-entity 实体层
- guns-service 服务层

## 演示
- 后台管理(vue版本) http://106.75.35.53:8082/vue
- 前端 http://106.75.35.53:8082/mobile/#/index


## 技术选型

- 核心框架：spring boot
- 数据库层：spring data jpa
- 安全框架：Shiro
- 数据库连接池：Druid
- 缓存：Ehcache
- 前端：Beetl模版+Bootstrap

## 包含的功能
guns-lite包含了成熟的后台管理功能guns-admin，以及前后端分离的的后端管理系统(guns-admin-vuejs和guns-api)
上面两者包含的功能一致：
- 部门管理
- 用户管理
- 角色管理
- 菜单管理：配置菜单功能
- 权限分配：为指定的角色配置特定的功能菜单
- 参数管理：维护系统参数，并缓存系统参数提供高效的读取
- 数据字典管理：配置维护数据字典
- 定时任务管理：编写、配置、执行定时任务
- 业务日志：通过注解的方式记录用户操作日志，并提供日志查询功能
- 登录日志：查看用户登录登出日志
- 国际化（vue版本实现）

**后续考虑添加的功能**
- 消息管理：配置并发送消息的功能，短信类型可以包括：短信，邮件，微信模版消息，钉钉提醒等。
- cms内容管理功能[完善中]
- 移动端方案[完善中]


## 使用

- 克隆本项目
- 导入idea或者eclipse，确保开发工具安装了lombok插件，如果不了解该插件，请自行google
- 创建数据库：guns-lite，将guns-admin/sql/guns-lite.sql导入数据库中，更改相应数据库配置
- 启动guns-admin
- 访问 http://localhost:8080，   登录，用户名密码:admin/admin
- ![demo](docs/md/demo.gif)
- 另外附上vue版本效果图![vue](docs/md/vuejs.gif)
- vue版本用法如下：
  - 启动guns-api，运行ApiApplication启动即可
  - 启动guns-admin-vuejs
  - 访问http://localhost:8082

## 文档

[http://www.enilu.cn/guns-lite/](http://www.enilu.cn/guns-lite/)

## 感谢

- [stylefeng](https://github.com/stylefeng) 没有他就没有guns，没有guns就没有这个guns-lite
- [PanJiaChen](https://github.com/PanJiaChen) guns-admin-vuejs 克隆自他的 [vue-admin-template](https://github.com/PanJiaChen/vue-admin-template)

## 交流
- Bugs: [Issues](https://github.com/enilu/guns-lite/issues/new)
- QQ: 欢迎加入qq交流群 740230743
- Gitter: [Gitter channel](https://gitter.im/guns-lite/community)
