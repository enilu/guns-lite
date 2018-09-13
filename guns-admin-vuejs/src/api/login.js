import request from '@/utils/request'

export function login(username, password) {
  return request({
    url: '/user/login',
    method: 'post',
    params: {
      "username": username,
      "password": password
    }
  })
}

export function getInfo(token) {
  return request({
    url: '/user/info',
    method: 'get'
  })
}

export function logout() {
  console.log('logout')
  return request({
    url: '/user/logout',
    method: 'post'
  })
}
