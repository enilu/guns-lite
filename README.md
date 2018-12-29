# Guns-lite
 
## 前言

 - guns-lite是在[guns](https://github.com/stylefeng/Guns)的基础上将数据库层由mybatis替换为spring data jpa的系统。
 - guns-lite是一个基于spring boot的后台管理系统。

### 分支
- admin-flat 该分支将guns-admin页面更改为扁平化风格，去掉iframe+标签页的形式:

 ![flat](https://user-images.githubusercontent.com/3115814/38806871-49f57248-41ad-11e8-932b-e06dc1941107.jpg)

- oracle, 该分支将底层数据使用oracle。


## 目录说明
- guns-admin 一个成熟的后台管理系统，完全具备了后台管理系统的基本功能
- guns-admin-vuejs 基于vuejs的后台管理,如果你想要前后端分离，那么该目录和下面的guns-api可以帮到你，这两个模块共同实现了上面guns-admin实现了的功能
- guns-api 基于vuejs后台管理的api服务
- guns-utils 工具包
- guns-dao  dao层
- guns-entity 实体层
- guns-service 服务层

## 技术选型

- 核心框架：spring boot
- 数据库层：spring data jpa
- 安全框架：Shiro
- 数据库连接池：Druid
- 缓存：Ehcache
- 前端：Beetl模版+Bootstrap

## 使用

- 克隆本项目
- 导入idea或者eclipse
- 创建数据库：guns-lite，将guns-admin/sql/guns-lite.sql导入数据库中，更改相应数据库配置
- 启动guns-admin
- 访问 https://localhost:8080，   登录，用户名密码:admin/admin
- ![demo](docs/md/demo.gif)
- 另外附上vue版本效果图![vue](docs/md/vuejs.gif)

## 文档

[http://www.enilu.cn/guns-lite/](http://www.enilu.cn/guns-lite/)

## 感谢

- [stylefeng](https://github.com/stylefeng) 没有他就没有guns，没有guns就没有这个guns-lite
- [PanJiaChen](https://github.com/PanJiaChen) guns-admin-vuejs克隆自他的[vue-admin-template](https://github
.com/PanJiaChen/vue-admin-template)

## 交流
- 欢迎提issue [https://github.com/enilu/guns-lite/issues/new](https://github.com/enilu/guns-lite/issues/new)
- 欢迎加入qq交流群：740230743

