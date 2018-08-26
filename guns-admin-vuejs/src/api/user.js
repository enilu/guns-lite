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
    url: '/user/save',
    method: 'post',
    params
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
