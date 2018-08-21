<template>
  <div class="app-container">
    <div class="block">
      <el-row  :gutter="20">
        <el-col :span="6">
          <el-input v-model="listQuery.account" placeholder="请输入帐号"></el-input>
        </el-col>
        <el-col :span="6">
          <el-input v-model="listQuery.name" placeholder="请输入姓名"></el-input>
        </el-col>
        <el-col :span="6">
          <el-button type="success" icon="el-icon-search" @click.native="add">搜索</el-button>
          <el-button type="primary" icon="el-icon-refresh" @click.native="edit">重置</el-button>
        </el-col>
      </el-row>
      <br>
      <el-row>
        <el-col :span="24">
          <el-button type="success" icon="el-icon-plus" @click.native="add">添加</el-button>
          <el-button type="primary" icon="el-icon-edit" @click.native="edit">修改</el-button>
          <el-button type="danger" icon="el-icon-delete" @click.native="remove">删除</el-button>
        </el-col>
      </el-row>
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
      :page-size="listQuery.limit"
      :total="total"
      @size-change="changeSize"
      @current-change="fetchPage"
      @prev-click="fetchPrev"
      @next-click="fetchNext">
    </el-pagination>

    <el-dialog
      :title="formTitle"
      :visible.sync="formVisible"
      width="70%">
      <el-form ref="form" :model="form" label-width="80px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="账户">
              <el-input v-model="form.account"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="姓名">
              <el-input v-model="form.name"></el-input>
            </el-form-item>
          </el-col>

          <el-col :span="12">
            <el-form-item label="性别">
              <el-radio-group v-model="form.sex">
                <el-radio :label="1">男</el-radio>
                <el-radio :label="2">女</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="邮箱">
              <el-input v-model="form.email"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="密码">
              <el-input v-model="form.password"  type="password"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="确认密码">
              <el-input v-model="form.rePassword"  type="password"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="电话">
              <el-input v-model="form.phone"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="部门">
              <el-select v-model="form.deptid" placeholder="请选择部门">
                <el-option
                  v-for="item in deptList"
                  :key="item.id"
                  :label="item.name"
                  :value="item.id">
                </el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="是否启用">
              <el-switch v-model="form.status"></el-switch>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="出生日期">
                <el-date-picker type="date" placeholder="选择日期" v-model="form.birthday" style="width: 100%;"></el-date-picker>
            </el-form-item>
          </el-col>
        </el-row>
        <el-form-item>
          <el-button type="primary" @click="saveUser">提交</el-button>
          <el-button @click.native="formVisible = false">取消</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>
  </div>
</template>

<script>
  import { deleteUser , getList }  from '@/api/user'
  import { getAll }  from '@/api/dept'



  export default {
    data() {
      return {
        formVisible: false,
        formTitle: '添加用户',
        deptList:[],
        form: {
          state: true,
          account: '',
          name: '',
          birthday: '',
          sex: '',
          email: '',
          password: '',
          rePassword: '',
          dept: '',
          status: true,
          deptid:1
        },
        listQuery: {
          page: 1,
          limit: 20,
          account: undefined,
          name: undefined
        },
        total:0,
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
        getList(this.listQuery).then(response => {
          this.list = response.data.items
          this.listLoading = false
          this.total = response.data.total
        })
        getAll().then(response => {
          this.deptList = response.data.items
        })
      },
      handleFilter() {
        this.listQuery.page = 1
        this.getList()
      },
      handleClose() {

      },
      fetchNext(){
        this.listQuery.page = this.listQuery.page + 1
        this.fetchData();
      },
      fetchPrev(){
        this.listQuery.page = this.listQuery.page - 1
        this.fetchData();
      },
      fetchPage(page){
        this.listQuery.page = page
        this.fetchData()
      },
      changeSize(limit){
        this.listQuery.limit = limit;
        this.fetchData();
      },
      handleCurrentChange(currentRow,oldCurrentRow){
        this.selRow = currentRow
      },
      add() {
        this.formTitle = '添加用户'
        this.formVisible = true
      },
      saveUser() {

      },
      checkSel(){
        if(this.selRow && this.selRow.id){
          return true
        }
        this.$message({
          message: '请选中操作项',
          type: 'warning'
        });
        return false
      },
      edit(){
        if(this.checkSel()){
          console.log(this.selRow)
          this.form = this.selRow
          this.form.status = this.selRow.statusName == '启用'
          this.form.password = ''
          this.formTitle = '修改用户'
          this.formVisible = true
        }
      },
      remove(){
         if(this.checkSel()){
           var id = this.selRow.id
           deleteUser(id).then(response => {
             this.$message({
               message: response.data.msg,
               type: 'info'
             });
             this.fetchData()
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
