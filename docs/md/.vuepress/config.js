module.exports = {
    title: 'guns-lite',
    description: '使用guns-lite快速构建web应用程序',
    base: '/guns-lite/',
    evergreen: true,
    port: 8081,
    ga: 'UA-71886989-13',
    themeConfig: {
        nav: [
            {text: '文档', link: '/'},
            {text: '公告', link: 'https://www.oschina.net/p/guns-lite'},
            {text: '案例',link:'https://github.com/enilu/guns-lite/issues/4'},
            {text: '捐赠',link:'/donate'},
            {text: '项目主页', link: 'https://github.com/enilu/guns-lite'},

        ],
        sidebar: [
            {
                title: '基本准备',
                collapsable: false,
                children: [
                    '/base/jdkAndMaven',
                    '/base/modules',
                    '/base/guns-admin-vuejs.md'
                ]
            },

            {
                title: '30分钟将本项目跑起来',
                collapsable: false,
                children: [
                    '/quickstart/quickstart',
                    '/quickstart/clone',
                    '/quickstart/initDb',
                    '/quickstart/config',
                    '/quickstart/startup'
                ]
            },
            {
                title: '开发第一个功能',
                collapsable: false,
                children: [
                    '/hello_guns/hello_guns',
                    '/hello_guns/create_table',
                    '/hello_guns/base',
                    '/hello_guns/list',
                    '/hello_guns/add',
                    '/hello_guns/delete',
                    '/hello_guns/update',
                    '/hello_guns/menuAndPermission'
                ]
            },
            {
                title: '基本功能介绍',
                collapsable: false,
                children: [
                    '/feature/modules',
                    '/feature/menu',
                    '/feature/dict',
                    '/feature/log',
                    '/feature/permissionMgr',
                    '/feature/permissionMgrVue',
                    '/feature/monitor',
                    '/feature/sysConfig',
                    '/feature/fileMgr'
                ]
            },{
                title: '进阶',
                collapsable: false,
                children: [
                    '/action/i18n',
                    '/action/sqlite',
                    '/action/cache',
                    '/action/task',
                    '/action/jpaauditing.md'

                ]
            }
        ]

    }
}
