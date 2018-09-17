<template>
  <div class="app-container">
    <div class="block">
      <el-row  :gutter="20">
        <el-col :span="6">
          <el-input v-model="listQuery.name" placeholder="请输入角色名称"></el-input>
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
          <el-button type="primary" icon="el-icon-setting" @click.native="openPermissions">权限配置</el-button>
        </el-col>
      </el-row>
    </div>


    <el-table :data="list" v-loading="listLoading" element-loading-text="Loading" border fit highlight-current-row
    @current-change="handleCurrentChange">

      <el-table-column label="名称">
        <template slot-scope="scope">
          {{scope.row.name}}
        </template>
      </el-table-column>
      <el-table-column label="编码">
        <template slot-scope="scope">
          {{scope.row.tips}}
        </template>
      </el-table-column>
      <el-table-column label="所在部门">
        <template slot-scope="scope">
          {{scope.row.deptName}}
        </template>
      </el-table-column>
      <el-table-column label="上级角色">
        <template slot-scope="scope">
          {{scope.row.pName}}
        </template>
      </el-table-column>

    </el-table>


    <el-dialog
      :title="formTitle"
      :visible.sync="formVisible"
      width="70%">
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="编码" prop="tips">
              <el-input v-model="form.tips" minlength=1></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="名称" prop="name">
              <el-input v-model="form.name"  minlength=1></el-input>
            </el-form-item>
          </el-col>

          <el-col :span="12">
            <el-form-item label="上级角色">
              <el-select v-model="form.pid" placeholder="请选择上级角色">
                <el-option
                  v-for="item in roleList"
                  :key="item.id"
                  :label="item.name"
                  :value="item.id">
                </el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12" >
            <el-form-item label="排序">
              <el-input v-model="form.num" type="number"></el-input>
            </el-form-item>
          </el-col>

          <el-col :span="12">
            <el-form-item label="所在部门">
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


        </el-row>
        <el-form-item>
          <el-button type="primary" @click="save">提交</el-button>
          <el-button @click.native="formVisible = false">取消</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>



        <el-dialog
          title="权限配置"
          :visible.sync="permissonVisible"
          width="25%">
          <el-form ref="permissonForm"  >
            <el-row>
              <el-col :span="12">
                <el-tree
                  :data="permissons"
                  show-checkbox
                  node-key="id"
                  ref="permissonTree"
                  :default-expanded-keys="[2, 3]"
                  :default-checked-keys="[5]"
                  :props="defaultProps">
                </el-tree>

              </el-col>
            </el-row>
            <el-form-item>
              <el-button type="primary" @click="savePermissions">提交</el-button>
            </el-form-item>
          </el-form>
        </el-dialog>
  </div>
</template>

<script>
  import { remove , getList , save , getRoleTree ,getPermissons , savePermissons }  from '@/api/system/role'
  import { getList as getDeptList }  from '@/api/system/dept'



  export default {
    data() {
      return {
        formVisible: false,
        formTitle: '添加角色',
        deptList:[],
        roleList:[],
        isAdd: true,
        permissons:[],
        defaultProps: {
          id: "id",
          label: 'name',
          children: 'children'
        },
        permissonVisible:false,
        form: {
          tips: '',
          name: '',
          deptid: '',
          pid: '',
          id: '',
          version: '',
          deptName: '',
          pName: '',
          num:1
        },
        rules: {
          tips: [
            { required: true, message: '请输入角色编码', trigger: 'blur' },
            { min: 3, max: 20, message: '长度在 3 到 20 个字符', trigger: 'blur' }
          ],
          name: [
            { required: true, message: '请输入角色名称', trigger: 'blur' },
            { min: 2, max: 20, message: '长度在 2 到 20 个字符', trigger: 'blur' }
          ]
        },
        listQuery: {
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
      this.init()
    },
    methods: {
      init() {
//        getDeptList().then(response => {
//          this.deptList = response.data.items
//        })
//        getRoleTree().then(response => {
//          this.roleList = response.data.items
//        })
        this.fetchData()
      },
      fetchData() {
        this.listLoading = true
        getList(this.listQuery).then(response => {
          this.list = response.data
          this.listLoading = false
        })
      },
      search() {
        this.fetchData()
      },
      reset() {
        this.listQuery.name = ''
        this.fetchData()
      },
      handleFilter() {
        this.getList()
      },
      handleClose() {

      },
      handleCurrentChange(currentRow,oldCurrentRow){
        console.log('-------')
        console.log(currentRow)
        this.selRow = currentRow
      },
      resetForm() {
        this.form  = {
            tips: '',
            name: '',
            deptid: '',
            pid: '',
            id: '',
            version: '',
            deptName: '',
            pName: '',
            num:1

        }
      },
      add() {
        this.resetForm()
        this.formTitle = '添加角色'
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
          console.log(this.selRow)
          this.form = this.selRow
          this.form.status = this.selRow.statusName == '启用'
          this.form.password = ''
          this.formTitle = '修改角色'
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
      },

      openPermissions() {
        if(this.checkSel()){
            console.log(this.selRow)
            getPermissons(this.selRow.id).then(response => {
              console.log(response.data)
              this.permissons = response.data.items
              this.permissonVisible = true
            })

        }
      },
      savePermissions() {
        var checkedPermissons = this.$refs.permissonTree.getCheckedKeys()
        console.log(checkedPermissons)
        var data = {
          id:this.selRow.id,
          permissons:checkedPermissons
        }
        savePermissons(data).then(response => {
          console.log(response.data)
          this.permissonVisible = false
          this.$message({
            message: response.data.msg,
            type: 'success'
          });
        })
      }


    }
  }
</script>


<style scoped>
.block {
  padding: 10px 0px;
}
</style>
