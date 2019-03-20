import { constantRouterMap } from '@/router'

import Layout from '../../views/layout/Layout'

/**
 * 通过meta.role判断是否与当前用户权限匹配
 * @param roles
 * @param route
 */
function hasPermission(roles, route) {
  if (route.meta && route.meta.roles) {
    return roles.some(role => route.meta.roles.indexOf(role) >= 0)
  } else {
    return true
  }
}

/**
 * 递归过滤异步路由表，返回符合用户角色权限的路由表
 * @param asyncRouterMap
 * @param roles
 */
function filterAsyncRouter(asyncRouterMap, roles) {
  const accessedRouters = asyncRouterMap.filter(route => {
    // if (hasPermission(roles, route)) {
    if (route.children && route.children.length) {
      route.children = filterAsyncRouter(route.children, roles)
    }
    return true
    // }
    return false
  })
  return accessedRouters
}

const permission = {
  state: {
    routers: constantRouterMap,
    addRouters: []
  },
  mutations: {
    SET_ROUTERS: (state, routers) => {
      state.addRouters = routers
      state.routers = constantRouterMap.concat(routers)
    }
  },
  actions: {
    GenerateRoutes({ commit }, data) {
      return new Promise(resolve => {
        const asyncRouterMapFromServer = data.routers
        const asyncRouterMap = convertRouter(asyncRouterMapFromServer)
        commit('SET_ROUTERS', asyncRouterMap)
        resolve()
      })
    }
  }
}

/**
 *将后台的路由表进行格式化
 * @param {*} asyncRouterMap
 */
function convertRouter(asyncRouterMap) {
  const accessedRouters = []
  if (asyncRouterMap) {
    // 默认支持二级菜单，如果需要生成三级菜单路由表，需要在这里做调整
    asyncRouterMap.forEach(item => {
      var parent = generateRouter(item, true)
      var children = []
      if (item.children) {
        item.children.forEach(child => {
          const router = generateRouter(child, false)
          children.push(router)
        })
      }
      parent.children = children
      accessedRouters.push(parent)
    })
  }
  return accessedRouters
}

function generateRouter(item, isParent) {
  const router = {
    path: item.path,
    name: item.name,
    meta: { title: item.name },
    children: item.children,
    component: isParent ? Layout : componentsMap[item.path]
  }
  return router
}

/**
 * 组件映射表
 * @type
 */
export const componentsMap = {
  '/mgr': () => import('@/views/system/user/index'),
  '/menu': () => import('@/views/system/menu/index'),
  '/role': () => import('@/views/system/role/index'),
  '/dept': () => import('@/views/system/dept/index'),
  '/dict': () => import('@/views/system/dict/index'),
  '/log': () => import('@/views/system/log/index'),
  '/loginLog': () => import('@/views/system/loginLog/index'),
  '/cfg': () => import('@/views/system/cfg/index'),
  '/task': () => import('@/views/system/task/index'),
  '/banner': () => import('@/views/cms/banner/index'),
  '/channel': () => import('@/views/cms/channel/index'),
  '/article': () => import('@/views/cms/article/index'),
  '/contacts': () => import('@/views/cms/contacts/index'),
  '/fileMgr': () => import('@/views/cms/file/index')
}
export default permission
