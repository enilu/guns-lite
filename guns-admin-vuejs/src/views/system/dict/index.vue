<template>
  <div class="app-container">
    <div class="block">
      <el-row  :gutter="20">
        <el-col :span="6">
          <el-input v-model="listQuery.name" placeholder="请输入字典名称"></el-input>
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
      <el-table-column label="名称">
        <template slot-scope="scope">
          {{scope.row.name}}
        </template>
      </el-table-column>
      <el-table-column label="详情">
        <template slot-scope="scope">
          {{scope.row.detail}}
        </template>
      </el-table-column>

    </el-table>


    <el-dialog
      :title="formTitle"
      :visible.sync="formVisible"
      width="60%">
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">

        <el-form-item label="名称" prop="name">
          <el-input v-model="form.name"  minlength=1></el-input>
        </el-form-item>
        <el-form-item
          v-for="(rec, index) in form.details"
          :label="'字典' + (index+1)"
          :key="rec.key"
          :prop="'details.' + index + '.value'"
          :rules="{
            required: true, message: '不能为空', trigger: 'blur'
          }"
        >
          <el-col :span="10">
          <el-input v-model="rec.key" placeholder="值"></el-input>
          </el-col>
          <el-col class="line" :span="1">&nbsp; </el-col>
          <el-col :span="10">
          <el-input v-model="rec.value" placeholder="名称"></el-input>
          </el-col>
          <el-col :span="3">&nbsp;
          <el-button @click.prevent="removeDetail(rec)" type="danger" icon="el-icon-delete" >删除</el-button>
          </el-col>
        </el-form-item>

        <el-form-item>
          <el-button type="primary" @click="save">提交</el-button>
          <el-button @click="addDetail">新增字典</el-button>
          <el-button @click.native="formVisible = false">取消</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>

  </div>
</template>

<script>
  import { remove , getList , save , update }  from '@/api/system/dict'


  export default {
    data() {
      return {
        formVisible: false,
        formTitle: '添加字典',
        deptList:[],
        roleList:[],
        isAdd: true,
        permissons:[],
        permissonVisible:false,
        form: {
          name: '',
          id: '',
          detail:'',
          details:[]
        },
        rules: {
          name: [
            { required: true, message: '请输入字典名称', trigger: 'blur' },
            { min: 3, max: 20, message: '长度在 3 到 20 个字符', trigger: 'blur' }
          ],

        },
        listQuery: {
          name: undefined
        },
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
          this.list = response.data
          this.listLoading = false
        }).catch(err => {

       });
      },
      search() {
        this.fetchData()
      },
      reset() {
        this.listQuery.name = ''
        this.fetchData()
      },
      handleFilter() {
        this.listQuery.page = 1
        this.getList()
      },
      handleClose() {

      },

      handleCurrentChange(currentRow,oldCurrentRow){
        this.selRow = currentRow
      },
      resetForm() {
        this.form  = {
            name: '',
            id: '',
            details:[],
            detail:[]

        }
      },
      add() {
        this.resetForm()
        this.formTitle = '添加字典'
        this.formVisible = true
        this.isAdd = true
      },
      save() {
        var self = this
        this.$refs['form'].validate((valid) => {
          if (valid) {
            var dictName = self.form.name
            var dictValues =''
            for(var key in self.form.details){
             var item = self.form.details[key];
              dictValues += item['key']+':'+item['value']+';'
            }
            if(this.form.id!=''){
              update({id:self.form.id,dictName: dictName, dictValues: dictValues}).then(response => {
                this.$message({
                  message: '提交成功',
                  type: 'success'
                })
                self.fetchData()
                self.formVisible = false

              })
            }else {
              save({dictName: dictName, dictValues: dictValues}).then(response => {
                this.$message({
                  message: '提交成功',
                  type: 'success'
                })
                self.fetchData()
                self.formVisible = false

              })
            }
          } else {
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
          this.formTitle = '修改字典'
          var detail = this.selRow.detail.split(',');
          var details = new Array()
          detail.forEach(function(val,index){
            var arr = val.split(':')
            details.push({'key':arr[0],'value':arr[1]})
         })
          this.form = {name:this.selRow.name,id:this.selRow.id,details:details,detail:this.selRow.detail}
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
                 message: '操作成功',
                 type: 'success'
               });
               this.fetchData()
             })

           }).catch(() => {

           });

         }
      },
      addDetail() {
        var details = this.form.details

       details.push({
         value: '',
         key: ''
       });
        this.form.details = details
     },
     removeDetail(detail) {
        var details = new Array()
       this.form.details.forEach(function(val,index){
         if(detail.key != val.key){
           details.push(val)
         }
       })
       this.form.details = details
     }


    }
  }
</script>


<style scoped>
.block {
  padding: 10px 0px;
}
</style>
