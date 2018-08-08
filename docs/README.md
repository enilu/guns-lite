# guns-lite 使用向导(编写中...)

以向导的方式引导用户使用guns-lite系统做二次开发，
guns-lite项目本身有readme文件，如果你有使用spring boot的和beetl的经验，那么基本上你是用不上本文档了，
有什么问题直接看代码即可。

但是考虑到有的开发者可能初次使用上述组件，有的甚至刚接触java不久，那么本文当将引导你一步步使用本系统搭建一个后台管理系统，并做二次开发。

## table of contents

* 基本准备
  * [基本环境准备](base/jdkAndMaven.md)

* 30分钟将本项目跑起来
  * [克隆项目](quickstart/clone.md)
  * [初始化数据](quickstart/initDb.md)
  * [配置项目](quickstart/config.md)
  * [启动项目](quickstart/startup.md)

* 开发第一个功能
 * [建表](first/createTable.md)
 * [基础代码](first/base.md)
 * [添加菜单和分配权限](first/menuAndPermission.md)
 * [业务代码](first/business.md)
 
* 项目基本功能介绍
  * [模块介绍](feature/modules.md)
  * [权限管理](feature/permissionMgr.md)
  * [日志管理](feature/log.md)
  * [部门管理](feature/dept.md)
  * [系统配置](feature/sysConfig.md)

* 来个增删改查
  * [创建表](crud/permissionMgr.md)
  * [创建对应实体](crud/log.md)
  * [dao层](crud/dept.md)
  * [add](crud/add.md)
  * [update](crud/add.md)
  * [delete](crud/add.md)
  * [query](crud/add.md)
  * [add](crud/add.md)
* 分页查询
  * [简单查询](page/simple.md)
  * [复杂查询](page/complex.md)
  

* 系统配置全解
  * [application.properties](sysconfig/application.md)
  * [Web config](sysconfig/web.md)
  * [Shiro config](sysconfig/shiro.md)
  * [Beetl config](sysconfig/beetl.md)
  * [EhCache config](sysconfig/ehcache.md)
  * [Swagger config](sysconfig/swagger.md)

* 权限控制
  * [控制菜单](permission/menu.md)
  * [后台增强权限控制](permission/backPermission.md)
  * [spring boot 集成shiro权限控制](permission/shiro.md)
  
* 日志记录
  * [业务日志](log/business.md)
  * [异常日志](log/error.md)

* 缓存使用
  * [缓存工具类](cache/tool.md)
  * [cache集成](cache/springCache.md)
  * [缓存变更管理](cache/change.md)
  
    