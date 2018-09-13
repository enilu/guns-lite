import request from '@/utils/request'

export function getList() {
  return request({
    url: '/menu/list',
    method: 'get'
  })
}

export function save(params) {
  return request({
    url: '/menu',
    method: 'post',
    params:params
  })
}

export function delMenu(id) {
  return request({
    url: '/menu',
    method: 'delete',
    params: {
      id:id
    }
  })
}
