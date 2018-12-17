import Vue from 'vue'
import Router from 'vue-router'

// in development-env not use lazy-loading, because lazy-loading too many pages will cause webpack hot update too slow. so only in production use lazy-loading;
// detail: https://panjiachen.github.io/vue-element-admin-site/#/lazy-loading

Vue.use(Router)

/* Layout */
import Layout from '../views/layout/Layout'

/**
 * hidden: true                   if `hidden:true` will not show in the sidebar(default is false)
 * alwaysShow: true               if set true, will always show the root menu, whatever its child routes length
 *                                if not set alwaysShow, only more than one route under the children
 *                                it will becomes nested mode, otherwise not show the root menu
 * redirect: noredirect           if `redirect:noredirect` will no redirct in the breadcrumb
 * name:'router-name'             the name is used by <keep-alive> (must set!!!)
 * meta : {
    title: 'title'               the name show in submenu and breadcrumb (recommend set)
    icon: 'svg-name'             the icon show in the sidebar,
  }
 **/
export const constantRouterMap = [
  {path: '/login', component: () => import('@/views/login/index'), hidden: true},


  {
    path: '/',
    component: Layout,
    redirect: '/dashboard',
    name: 'Dashboard',
    hidden: false,
    children: [{
      path: 'dashboard',
      component: () => import('@/views/dashboard/index'),
      meta: {title: 'dashboard', icon: 'dashboard', noCache: true}
    }]
  }

]

export default new Router({
  // mode: 'history', //后端支持可开
  scrollBehavior: () => ({y: 0}),
  routes: constantRouterMap
})

export const asyncRouterMap = [
  {
    path: '/system',
    component: Layout,
    redirect: '#',
    name: '系统管理',
    alwaysShow: true,
    meta: {
      roles: ['administrator'],
      title: '系统管理',
      icon: 'table'
    },
    children: [
      {
        path: 'menuMgr',
        name: '菜單管理',
        component: () => import('@/views/system/menu/index'),
        meta: {
          title: '菜单管理'
        }
      },
      {
        path: 'deptMgr',
        name: '部门管理',
        component: () => import('@/views/system/dept/index'),
        meta: {
          title: '部门管理'
        }
      },
      {
        path: 'userMgr',
        name: '用户管理',
        component: () => import('@/views/system/user/index'),
        meta: {title: '用户管理'}
      },
      {
        path: 'roleMgr',
        name: '角色管理',
        component: () => import('@/views/system/role/index'),
        meta: {title: '角色管理'}
      }
    ]
  },
  {
    path: '/operation',
    component: Layout,
    redirect: '#',
    name: '运维管理',
    alwaysShow: true,
    meta: {
      roles: ['administrator','developer'],
      title: '运维管理',
      icon: 'bug'
    },
    children: [
      {
        path: 'dictMgr',
        name: '字典管理',
        component: () => import('@/views/system/dict/index'),
        meta: {title: '字典管理'}
      },
      {
        path: 'loginLog',
        name: '登录日志',
        component: () => import('@/views/system/loginLog/index'),
        meta: {title: '登录日志'}
      },
      {
        path: 'businessLog',
        name: '业务日志',
        component: () => import('@/views/system/log/index'),
        meta: {title: '业务日志'}
      },
      {
        path: 'sysCfg',
        name: '参数管理',
        component: () => import('@/views/system/cfg/index'),
        meta: {
          title: '参数管理',
        }
      }
    ]
  },
  {path: '/404', component: () => import('@/views/404'), hidden: true}
];
