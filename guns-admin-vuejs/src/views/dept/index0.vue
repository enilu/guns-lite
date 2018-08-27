<template>
  <div class="app-container">
      <div class="block">
    <el-button type="success" icon="el-icon-plus">添加</el-button>
    <el-button type="primary" icon="el-icon-edit">修改</el-button>
    <el-button type="danger" icon="el-icon-delete">删除</el-button>
  </div>

    <tree-table ref="deptTree" :data="data" :columns="columns"  :expandAll="expandAll" border
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
import { getDeptList } from '@/api/dept'

export default {
  name: 'treeTableDemo',
  components: { treeTable },
  data() {
    return {
      listLoading: true,
      expandAll: true,
      columns: [
        {
          text: '部门简称',
          value: 'simplename',
          width: 200
        },
        {
          text: 'ID',
          value: 'id'
        },
        {
          text: '部门全称',
          value: 'fullname'
        },{
          text: '顺序',
          value: 'num'
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
      getDeptList(this.listQuery).then(response => {
        this.data = response.data.items
        this.listLoading = false
      })
    },
    setCurrent(row) {
      this.$refs.deptTree.setCurrentRow(row)
    },
    handleCurrentChange(val) {
      alert(val)
      this.selRow = val
    },
    add() {
    },
    edit() {

        console.log(this.selRow)
    },
    remove(){

        console.log(this.selRow)
    }
  }
}
</script>



<style scoped>
.block {
  padding: 10px 0px;
}

</style>
