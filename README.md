# Guns-lite

## 前言

 - guns-lite是在[guns](https://github.com/stylefeng/Guns)的基础上将数据库层由mybatis替换为spring data jpa的系统。
 - guns-lite是一个基于spring boot的后台管理系统。
 - 另提供前后端分离（vue）版本[web-flash](https://github.com/enilu/web-flash)

## 分支
- master，主分支，稳定版
- admin-flat 该分支将guns-admin页面更改为扁平化风格，去掉iframe+标签页的形式，（已经停止维护，不再添加新功能和修复bug）

 ![flat](https://user-images.githubusercontent.com/3115814/38806871-49f57248-41ad-11e8-932b-e06dc1941107.jpg)

- oracle, 该分支将底层数据使用oracle。(已停止维护该分支-，建议用户如果需要用到oracle，可以基于master分支进行改造，改造过程可以参考该分支)
- dev,开发分支，新功能都会在改分支上开发，不建议使用该分支，不稳定

## 目录说明
- guns-admin 一个成熟的后台管理系统，完全具备了后台管理系统的基本功能
- guns-utils 工具包
- guns-dao  dao层
- guns-entity 实体层
- guns-service 服务层

## 演示
- http://guns-lite.enilu.cn/

## 技术选型

- 核心框架：spring boot
- 数据库层：spring data jpa
- 安全框架：Shiro
- 数据库连接池：Druid
- 缓存：Ehcache
- 前端：Beetl模版+Bootstrap

## 包含的功能
guns-lite包含了成熟的后台管理功能guns-admin
上面两者包含的功能一致：
- 部门管理
- 用户管理
- 角色管理
- 菜单管理
- 权限分配
- 参数管理
- 数据字典
- 定时任务
- 业务日志
- 登录日志



## 使用

- 克隆本项目
- 导入idea或者eclipse，确保开发工具安装了lombok插件，如果不了解该插件，请自行google
- 创建数据库： 
```sql
CREATE DATABASE IF NOT EXISTS gunslite DEFAULT CHARSET utf8 COLLATE utf8_general_ci; 
CREATE USER 'gunslite'@'%' IDENTIFIED BY 'gunslite123';
GRANT ALL privileges ON gunslite.* TO 'gunslite'@'%';
flush privileges;

```
- 更改配置文件中相应数据库配置
- guns-dmin启动的时候回自动创建表并导入src/main/resources/import.sql到数据库中，所以无需开发人员自己初始化表结构
- 启动guns-admin
- 访问 http://localhost:8080，   登录，用户名密码:admin/admin
- ![demo](http://www.enilu.cn/github/guns-lite.gif)

## 文档

- [http://enilu.github.io/guns-lite](http://enilu.github.io/guns-lite)
- [http://enilu.gitee.io/guns-lite](http://enilu.gitee.io/guns-lite)

## 感谢

- [stylefeng](https://github.com/stylefeng) 没有他就没有guns，没有guns就没有这个guns-lite

## 交流
- Bugs: [Issues](https://github.com/enilu/guns-lite/issues/new)
- QQ: 欢迎加入qq交流群 740230743
- Gitter: [Gitter channel](https://gitter.im/guns-lite/community)
