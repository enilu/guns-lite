'use strict'
const merge = require('webpack-merge')
const prodEnv = require('./prod.env')

module.exports = merge(prodEnv, {
  NODE_ENV: '"development"',
  // BASE_API: '"https://easy-mock.com/mock/5ac8dac39724db4f80cc8733"',
  // BASE_API: '"http://mock.xinshucredit.com/mock/5b8a4565f7c96d3d52e3a770"'
  BASE_API: '"http://127.0.0.1:8082"'
})
