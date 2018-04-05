# Guns-lite

## 前言

年初公司计划要上一个产品。而且是要在两周内上线（由于之前已经开发、运营过一个类似的产品，所以这次要求现将核心功能上线，当然最后没有那么快上线，这是后话）。
由于这个系统比较复杂，所以我们和以前一样计划将服务拆分，包括后台管理、微信端，api层，消息服务，调度任务等若干服务。领导既然发话了，无论看上去多模不靠谱，撸起袖子也得干。

技术方案决定使用spring boot 后，大家各自分工各干各的。

我很“荣幸”的分到后台管理等若干模块，开始干的时候我就想，两周时间写界面都不够。于是开始上网找轮子，有幸发现guns[https://github.com/stylefeng/Guns](https://github.com/stylefeng/Guns)
这个项目但是guns有个不方便的地方，数据库访问层使用的是mybatis。由于其他服务已经并行开始开发，而且都是使用spring data jpa。如果我要用guns，就没办法和别人数据库服务层连带的
service层也没办法共用了。想想以后要维护两套dao层和service层就倒吸一口凉气，这是个金融系统。dao和service层仅仅靠自动生成的代码是远远不够的。


所以等项目过了两周后，不出预料的项目要延期了（具体原因不仅仅是内部原因，还有外部投资人、客户对产品需求的变更等，这不是重点，暂且不表），于是趁着延期的那段时间，
将后台管理的dao层适配为jpa，service也使用公共的service了。

改造期间，惊心动魄，因为产品几度表明“明天测试”或者“下周上线测试”，导致同时维护两个后台管理，老版本继续在guns的基础上开发功能，新版本使用jpa和新的service不停的追赶老版本。

持续了将近两周的时间，终于新版本追上了，老版本果断丢弃。

想到也许有同样需求的开发同学，或者不喜欢mybatis的同学，也有我这样的困惑.就将guns本身具备的功能抽取出来，也就是这个guns-lite.


##版本说明

 如上文所述这是个在guns的基础上将mybatis替换为spring data jpa的的基于spring boot的后台管理系统。

## 技术选型

- 核心框架：spring boot
- 数据库层：spring data jpa
- 安全框架：Shiro
- 数据库连接池：Druid
- 缓存：Ehcache
- 前端：Beetl模版+Bootstrap



## 感谢

- [stylefeng](https://github.com/stylefeng) 没有他就没有guns，没有guns就没有这个guns-lite

## 交流
- 欢迎提issue [https://github.com/enilu/guns-lite/issues/new](https://github.com/enilu/guns-lite/issues/new)
- 欢迎加入qq交流群：740230743
