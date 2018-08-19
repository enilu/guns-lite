import request from '@/utils/request'

export function getList(params) {
  return request({
    url: '/user/list',
    method: 'get',
    params
  })
}


export function test1(id) {
  return request({
    url: '/user/delete',
    method: 'post',
    data: {
      id
    }
  })
}

export function deleteUser(id) {
  return request({
    url: '/user/delete',
    method: 'post',
    data: {
      id
    }
  })
}
