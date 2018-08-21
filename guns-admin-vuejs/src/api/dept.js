import request from '@/utils/request'

export function getAll() {
  return request({
    url: '/dept/all',
    method: 'get',
  })
}
