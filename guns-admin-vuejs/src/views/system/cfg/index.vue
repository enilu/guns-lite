<template>
  <div class="app-container">
    <div class="block">
      <el-row  :gutter="20">
        <el-col :span="6">
          <el-input v-model="listQuery.cfgName" placeholder="请输入参数名"></el-input>
        </el-col>
        <el-col :span="6">
          <el-input v-model="listQuery.cfgValue" placeholder="请输入参数值"></el-input>
        </el-col>
        <el-col :span="6">
          <el-button type="success" icon="el-icon-search" @click.native="search">搜索</el-button>
          <el-button type="primary" icon="el-icon-refresh" @click.native="reset">重置</el-button>
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


    <el-table :data="list" v-loading="listLoading" element-loading-text="Loading" border fit highlight-current-row
    @current-change="handleCurrentChange">

      <el-table-column label="ID">
        <template slot-scope="scope">
          {{scope.row.id}}
        </template>
      </el-table-column>
      <el-table-column label="参数名">
        <template slot-scope="scope">
          {{scope.row.cfgName}}
        </template>
      </el-table-column>
      <el-table-column label="参数值">
        <template slot-scope="scope">
          {{scope.row.cfgValue}}
        </template>
      </el-table-column>
      <el-table-column label="备注">
        <template slot-scope="scope">
          {{scope.row.cfgDesc}}
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
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="参数名" prop="cfgName">
              <el-input v-model="form.cfgName" minlength=1></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="参数值" prop="cfgValue">
              <el-input v-model="form.cfgValue"  minlength=1></el-input>
            </el-form-item>
          </el-col>


          <el-col :span="12">
            <el-form-item label="备注" prop="cfgDesc">
              <el-input v-model="form.cfgDesc"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-form-item>
          <el-button type="primary" @click="save">提交</el-button>
          <el-button @click.native="formVisible = false">取消</el-button>
        </el-form-item>

      </el-form>
    </el-dialog>
  </div>
</template>

<script>
  import { remove , getList , save }  from '@/api/system/cfg'



  export default {
    data() {
      return {
        formVisible: false,
        formTitle: '添加用户',
        deptList:[],
        isAdd: true,
        form: {
          id: '',
          cfgName: '',
          cfgValue: '',
          cfgDesc: ''
        },
        rules: {
          cfgName: [
            { required: true, message: '请输入参数名', trigger: 'blur' },
            { min: 3, max: 20, message: '长度在 3 到 20 个字符', trigger: 'blur' }
          ],
          cfgValue: [
            { required: true, message: '请输入参数值', trigger: 'blur' },
            { min: 2, max: 20, message: '长度在 2 到 20 个字符', trigger: 'blur' }
          ]

        },
        listQuery: {
          page: 1,
          limit: 20,
          cfgName: undefined,
          cfgValue: undefined
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
      this.init()
    },
    methods: {
      init() {

        this.fetchData()
      },
      fetchData() {
        this.listLoading = true
        getList(this.listQuery).then(response => {
          this.list = response.data.items
          this.listLoading = false
          this.total = response.data.total
        })
      },
      search() {
        this.fetchData()
      },
      reset() {
        this.listQuery.cfgName = ''
        this.listQuery.cfgValue = ''
        this.fetchData()
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
        console.log('-------')
        console.log(currentRow)
        this.selRow = currentRow
      },
      resetForm() {
        this.form = {
          id: '',
          cfgName: '',
          cfgValue: '',
          cfgDesc: ''
        }
      },
      add() {
        this.resetForm()
        this.formTitle = '添加参数'
        this.formVisible = true
        this.isAdd = true
      },
      save() {
        var self = this
        this.$refs['form'].validate((valid) => {
          if (valid) {
            save(this.form).then(response => {
              console.log(response)
                this.$message({
                  message: '提交成功',
                  type: 'success'
                })
                this.fetchData()
                this.formVisible = false
            })
          } else {
            console.log('error submit!!')
            return false
          }
        })

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
          this.isAdd = false
          this.form = this.selRow
          this.form.password = ''
          this.formTitle = '修改参数'
          this.formVisible = true
        }
      },
      remove(){
         if(this.checkSel()){
           var id = this.selRow.id

           this.$confirm('确定删除该记录?', '提示', {
             confirmButtonText: '确定',
             cancelButtonText: '取消',
             type: 'warning'
           }).then(() => {

             remove(id).then(response => {
               this.$message({
                 message: response.data.msg,
                 type: 'success'
               });
               this.fetchData()
             })

           }).catch(() => {

           });

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
