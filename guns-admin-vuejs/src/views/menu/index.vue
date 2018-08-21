<template>
  <div class="app-container">
      <div class="block">
    <el-button type="success" icon="el-icon-plus">添加</el-button>
    <el-button type="primary" icon="el-icon-edit">修改</el-button>
    <el-button type="danger" icon="el-icon-delete">删除</el-button>
  </div>

    <tree-table ref="menuTree" :data="data" :columns="columns" border
    highlight-current-row @current-change="handleCurrentChange"
    ></tree-table>

      <el-button @click="setCurrent()">取消选择</el-button>
  </div>
</template>

<script>
/**
  Auth: Lei.j1ang
  Created: 2018/1/19-14:54
*/
import treeTable from '@/components/TreeTable'
import { getList } from '@/api/menu'

export default {
  name: 'treeTableDemo',
  components: { treeTable },
  data() {
    return {
      listLoading: true,
      columns: [
        {
          text: '菜单名称',
          value: 'name',
          width: 200
        },
        {
          text: 'ID',
          value: 'id'
        },
        {
          text: '菜单编号',
          value: 'code'
        },
        {
          text: '请求地址',
          value: 'url'
        },
        {
          text: '排序',
          value: 'num'
        },
        {
          text: '层级',
          value: 'levels'
        },
        {
          text: '是否是菜单',
          value: 'isMenuName'
        },
        {
          text: '状态',
          value: 'statusName'
        }
      ],
      data: [],
      selRow: {}
    }
  },
  created() {
    this.fetchData()
  },
  methods: {
    fetchData() {
      this.listLoading = true
      getList(this.listQuery).then(response => {
        this.data = response.data.items
        this.listLoading = false
      })
    },
    setCurrent(row) {
      this.$refs.menuTree.setCurrentRow(row)
    },
    handleCurrentChange(val) {
      alert(val)
      this.selRow = val
    }
  }
}
</script>



<style scoped>
.block {
  padding: 10px 0px;
}

</style>
