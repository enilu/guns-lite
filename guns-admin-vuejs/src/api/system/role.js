import request from '@/utils/request'

export function getList(params) {
  return request({
    url: '/role/list',
    method: 'get',
    params
  })
}


export function save(params) {
  return request({
    url: '/role',
    method: 'post',
    params
  })
}

export function remove(roleId) {
  return request({
    url: '/role',
    method: 'delete',
    params: {
      roleId: roleId
    }
  })
}

export function getPermissons(id) {
  return request({
    url: '/role/getPermissons',
    method: 'get',
    data: {
      id
    }
  })
}


export function savePermissons(params) {
  return request({
    url: '/role/savePermisson',
    method: 'post',
   params
  })
}
