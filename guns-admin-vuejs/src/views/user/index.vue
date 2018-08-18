<template>
  <div class="app-container">
    <div class="block">
      <el-button type="primary" icon="el-icon-plus" @click.native="add">添加</el-button>
      <el-button type="info" icon="el-icon-edit" @click.native="edit">修改</el-button>
      <el-button type="danger" icon="el-icon-delete" @click.native="remove">删除</el-button>
    </div>
    <el-table :data="list" v-loading="listLoading" element-loading-text="Loading" border fit highlight-current-row  highlight-current-row
    @current-change="handleCurrentChange">

      <el-table-column label="账号">
        <template slot-scope="scope">
          {{scope.row.account}}
        </template>
      </el-table-column>
      <el-table-column label="姓名">
        <template slot-scope="scope">
          {{scope.row.name}}
        </template>
      </el-table-column>
      <el-table-column label="性别">
        <template slot-scope="scope">
          {{scope.row.sexName}}
        </template>
      </el-table-column>
      <el-table-column label="角色">
        <template slot-scope="scope">
          {{scope.row.roleName}}
        </template>
      </el-table-column>
      <el-table-column label="部门">
        <template slot-scope="scope">
          {{scope.row.deptName}}
        </template>
      </el-table-column>
      <el-table-column label="邮箱">
        <template slot-scope="scope">
          {{scope.row.email}}
        </template>
      </el-table-column>
      <el-table-column label="电话">
        <template slot-scope="scope">
          {{scope.row.phone}}
        </template>
      </el-table-column>
      <el-table-column label="创建时间">
        <template slot-scope="scope">
          {{scope.row.createtime}}
        </template>
      </el-table-column>
      <el-table-column label="状态">
        <template slot-scope="scope">
          {{scope.row.statusName}}
        </template>
      </el-table-column>


    </el-table>

    <el-pagination
      background
      layout="total, sizes, prev, pager, next, jumper"
      :page-sizes="[10, 20, 50, 100,500]"
      :page-size="pageSize"
      :total="total"
      @size-change="changeSize"
      @current-change="fetchPage"
      @prev-click="fetchPrev"
      @next-click="fetchNext">
    </el-pagination>
  </div>
</template>

<script>
  import { getList, deleteUser } from '@/api/user'

  export default {
    data() {
      return {
        listQuery:{},
        total:0,
        currentPage:1,
        pageSize:10,
        list: null,
        listLoading: true,
        selRow:{}
      }
    },
    filters: {
      statusFilter(status) {
        const statusMap = {
          published: 'success',
          draft: 'gray',
          deleted: 'danger'
        }
        return statusMap[status]
      }
    },
    created() {
      this.fetchData()
    },
    methods: {
      fetchData() {
        this.listLoading = true
        this.listQuery = {pageSize:this.pageSize,page:this.currentPage}
        getList(this.listQuery).then(response => {
            this.list = response.data.items
            this.listLoading = false
            this.total = response.data.total
        })
      },
      fetchNext(){
        this.currentPage = this.currentPage + 1
        this.fetchData();
      },
      fetchPrev(){
        this.currentPage = this.currentPage - 1
        this.fetchData();
      },
      fetchPage(page){
        this.currentPage = page
        this.fetchData()
      },
      changeSize(pageSize){
        this.pageSize = pageSize;
        this.fetchData();
      },
      handleCurrentChange(currentRow,oldCurrentRow){
        this.selRow = currentRow
      },
      add(){

      },
      checkSel(){
        if(!this.selRow.id){
          console.log('没有选中')
          this.$message({
            message: '请选中操作项',
            type: 'warning'
          });
          return false
        }
        return true
      },
      edit(){
        if(this.checkSel()){
          console.log(this.selRow)
        }
      },
      remove(){
         if(this.checkSel()){
           console.log(this.selRow)
           var id = this.selRow.id
           deleteUser(id).then(response => {
               console.log(response.data)
           })
         }

      }




    }
  }
</script>


<style scoped>
.block {
  padding: 10px 0px;
}
</style>
