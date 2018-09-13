<template>
  <div class="app-container">
    <div class="block">
      <el-button type="success" icon="el-icon-plus"  @click.native="add">添加</el-button>
    </div>

    <tree-table
    :data="data"
    :expandAll="expandAll"
    highlight-current-row
    border>

      <el-table-column label="名称" >
        <template slot-scope="scope">
          <el-button type="text" @click="edit(scope.row)">{{scope.row.name}}</el-button>
        </template>
      </el-table-column>
      <el-table-column label="编码" >
        <template slot-scope="scope">
          <span >{{scope.row.code}}</span>
        </template>
      </el-table-column>
      <el-table-column label="ID" >
        <template slot-scope="scope">
          <span >{{scope.row.id}}</span>
        </template>
      </el-table-column>
      <el-table-column label="是否是菜单" >
        <template slot-scope="scope">
          <span >{{scope.row.isMenuName}}</span>
        </template>
      </el-table-column>
        <el-table-column label="URL">
          <template slot-scope="scope">
            <span >{{scope.row.url}}</span>
          </template>
      </el-table-column>
      <el-table-column label="是否启用">
        <template slot-scope="scope">
          <span >{{scope.row.statusName}}</span>
        </template>
      </el-table-column>
      <el-table-column label="顺序">
        <template slot-scope="scope">
          <span >{{scope.row.num}}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" >
        <template slot-scope="scope">
          <el-button type="text" @click="remove(scope.row)">删除</el-button>
        </template>
      </el-table-column>

    </tree-table>

      <el-dialog
        :title="formTitle"
        :visible.sync="formVisible"
        width="70%">
        <el-form ref="form" :model="form" :rules="rules" label-width="120px">
          <el-row>
            <el-col :span="12">
              <el-form-item label="名称" prop="name">
                <el-input v-model="form.name" minlength=1></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="请求地址" prop="url">
                <el-input v-model="form.url"  minlength=1></el-input>
              </el-form-item>
            </el-col>

            <el-col :span="12">
              <el-form-item label="是否是菜单">
                <el-radio-group v-model="form.ismenu">
                  <el-radio :label="1">是</el-radio>
                  <el-radio :label="0">否</el-radio>
                </el-radio-group>
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="菜单编号" prop="code">
                <el-input v-model="form.code"></el-input>
              </el-form-item>
            </el-col>

            <el-col :span="12">
              <el-form-item label="图标" >
                <el-input v-model="form.icon"></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="排序" prop="num">
                <el-input type="number" v-model="form.num"></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="父菜单" >
                <el-input
                  placeholder="请选择父菜单"
                  v-model="form.pname"
                  readonly="readonly"
                  @click.native="showTree = !showTree">
                </el-input>
                <el-tree v-if="showTree"
                         empty-text="暂无数据"
                         :expand-on-click-node="false"
                         :data="data"
                         :props="defaultProps"
                         @node-click="handleNodeClick"
                         class="tree">
                </el-tree>

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
/**
  Auth: Lei.j1ang
  Created: 2018/1/19-14:54
*/
import treeTable from '@/components/TreeTable'
import { getList , save , delMenu } from '@/api/system/menu'

export default {
  name: 'treeTableDemo',
  components: { treeTable },
  data() {
    return {
      showTree:false,
      defaultProps: {
        id: "code",
        label: 'name',
        children: 'children'
      },

      listLoading: true,
      expandAll: false,
      formTitle: '',
      formVisible: false,
      isAdd: false,
      form: {
        pname:'',
        name: '',
        code: '',
        url: '',
        pcode: '',
        ismenu: 1,
        num: 1
      },
      rules: {
        name: [
          { required: true, message: '请输入菜单名称', trigger: 'blur' },
          { min: 3, max: 20, message: '长度在 3 到 20 个字符', trigger: 'blur' }
        ],
        code: [
          { required: true, message: '请输入编码', trigger: 'blur' },
          { min: 2, max: 20, message: '长度在 2 到 20 个字符', trigger: 'blur' }
        ],
        url: [
          { required: true, message: '请输入请求地址', trigger: 'blur' }
        ],
        num: [
          { required: true, message: '请输入排序', trigger: 'blur' }
        ]
      },
      data: [],
      selRow: {}
    }
  },
  created() {
    this.init()
  },
  methods: {
    // 2.方法
    // 点击巡检对象的选择器的树节点
    handleNodeClick(data, node) {
      console.log(data)
      this.form.pcode = data.code
      this.form.pname = data.name
      // 关闭选择器
      this.showTree = false;
    },
    // 加载树结点
    loadNode(node, resolve) {
      console.log(node)
    },

    init() {
      this.fetchData()
    },
    fetchData() {
      this.listLoading = true
      getList().then(response => {
        this.data = response.data
        this.listLoading = false
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
    add() {
      this.formTitle = '添加菜单'
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
    edit(row) {
      console.log(row)
      this.form = row
      if(row.isMenuName == '是'){
        this.form.ismenu = 1
      }else{
        this.form.ismenu = 0
      }
      if(row.parent){
        this.form.pcode = row.parent.code
      }
      console.log(this.form.pcode)
      this.formTitle = '编辑菜单'
      this.formVisible = true
      this.isAdd = false
    },
    remove(row) {
        console.log(row)


       this.$confirm('确定删除该记录?', '提示', {
         confirmButtonText: '确定',
         cancelButtonText: '取消',
         type: 'warning'
       }).then(() => {
          console.log(row.id)
         delMenu(row.id).then(response => {
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
</script>



<style scoped>
.block {
  padding: 10px 0px;
}
.tree {
  position: absolute;
  overflow: auto;
  z-index: 1000;
  width: 100%;
  height: auto;
  border: 1px solid #ebeef5;
  box-shadow: 0 2px 12px 0 rgba(0,0,0,.1);
}

</style>
