import request from '@/utils/request'

export function getList(params) {
  return request({
    url: '/user/list',
    method: 'get',
    params
  })
}


export function saveUser(params) {
  return request({
    url: '/user',
    method: 'post',
    params
  })
}

export function deleteUser(id) {
  return request({
    url: '/user',
    method: 'delete',
    data: {
      id
    }
  })
}
