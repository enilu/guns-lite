module.exports = {
    title: 'guns-lite使用向导',
    description: '快速使用guns-lite构建web应用程序',
    themeConfig: {
        nav: [
            { text: '文档', link: '/' },
            { text: '项目主页', link: 'https://github.com/enilu/guns-lite' },
        ],
        sidebar: [
            {
                title: '基本准备',
                collapsable: false,
                children:[
                    '/base/base',
                   '/base/jdkAndMaven'
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
            }
        ]

    }
}