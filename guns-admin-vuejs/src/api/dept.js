import request from '@/utils/request'

export function getDeptTree() {
  return request({
    url: '/dept/tree',
    method: 'get',
  })
}

export function getDeptList() {
  return request({
    url: '/dept/list',
    method: 'get',
  })
}
