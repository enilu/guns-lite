# 前言


本文档以向导的方式引导用户使用guns-lite系统做二次开发，
guns-lite项目本身有readme文件，如果你有使用spring boot的和beetl的经验，那么基本上你是用不上本文档了，
有什么问题直接看代码即可。大多数功能都可以参考代码，即使找不到的google和百度也能帮到你。

但是考虑到有的开发者可能初次使用上述组件，有的甚至刚接触java不久，那么本文当将引导你一步步使用本系统搭建一个后台管理系统，并做二次开发。


## 版本说明

 - guns-lite是在[guns](https://github.com/stylefeng/Guns)的基础上将数据库层由mybatis替换为spring data jpa的系统。
 - guns-lite是一个基于spring boot的后台管理系统。

### 分支
- admin-flat 该分支将页面更改为扁平化风格，去掉iframe+标签页的形式:

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
- ![demo](demo.gif)

## 文档

[http://www.enilu.cn/guns-lite/](http://www.enilu.cn/guns-lite/)

## 感谢

- [stylefeng](https://github.com/stylefeng) 没有他就没有guns，没有guns就没有这个guns-lite

## 交流
- 欢迎提issue [https://github.com/enilu/guns-lite/issues/new](https://github.com/enilu/guns-lite/issues/new)
- 欢迎加入qq交流群：740230743


也欢迎你在github给该项目点个赞：[https://github.com/enilu/guns-lite](https://github.com/enilu/guns-lite)
 