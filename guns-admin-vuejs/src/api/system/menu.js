import request from '@/utils/request'

export function getList(params) {
  return request({
    url: '/menu/list',
    method: 'get',
    params
  })
}

export function save(params) {
  return request({
    url: '/menu',
    method: 'post',
    params
  })
}

export function delMenu(id) {
  return request({
    url: '/menu',
    method: 'delete',
    data: {
      id
    }
  })
}
