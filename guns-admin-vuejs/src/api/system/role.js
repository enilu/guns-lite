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

export  function roleTreeListByIdUser(idUser){
  return request({
    url: '/role/roleTreeListByIdUser',
    method: 'get',
    params: {
      idUser: idUser
    }
  })
}
