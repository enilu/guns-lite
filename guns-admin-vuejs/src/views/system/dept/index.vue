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
      <el-table-column label="简称" >
        <template slot-scope="scope">
          <el-button type="text" @click="edit(scope.row)">{{scope.row.simplename}}</el-button>

        </template>
      </el-table-column>
      <el-table-column label="全称" >
        <template slot-scope="scope">
          <span >{{scope.row.fullname}}</span>
        </template>
      </el-table-column>
      <el-table-column label="顺序" >
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
            <el-form-item label="名称" prop="simplename">
              <el-input v-model="form.simplename" minlength=1></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="全称" prop="fullname">
              <el-input v-model="form.fullname"  minlength=1></el-input>
            </el-form-item>
          </el-col>

          <el-col :span="12">
            <el-form-item label="排序" prop="num">
              <el-input type="number" v-model="form.num"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="父部门" >
              <el-input
                placeholder="请选择父部门"
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
                       class="input-tree">
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
import { list,save,del } from '@/api/system/dept'
export default {
  name: 'customTreeTableDemo',
  components: { treeTable },
  data() {
    return {
      expandAll: true,
      data: [],
      formVisible: false,
      formTitle: '',
      isAdd: false,

      showTree: false,
      defaultProps: {
        id: "id",
        label: 'simplename',
        children: 'children'
      },
      form: {
        id:'',
        simplename: '',
        fullname: '',
        pid: '',
        num:'',
        tips: ''
      },
      rules: {
        simplename: [
          { required: true, message: '请输入菜单名称', trigger: 'blur' },
          { min: 3, max: 20, message: '长度在 3 到 20 个字符', trigger: 'blur' }
        ],
        fullname: [
          { required: true, message: '请输入编码', trigger: 'blur' },
          { min: 2, max: 20, message: '长度在 2 到 20 个字符', trigger: 'blur' }
        ],
        num: [
          { required: true, message: '请输入排序', trigger: 'blur' }
        ]
      }

    }
  },
  created() {
    this.fetchData()
  },
  methods: {
    fetchData() {
      this.listLoading = true
      list().then(response => {
        this.data = response.data
        this.listLoading = false
      })
    },
    handleNodeClick(data, node) {
      console.log(data)
      this.form.pid = data.id
      this.form.pname = data.simplename
      this.showTree = false;
    },
    checkSel() {
      if (this.selRow && this.selRow.id) {
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
          console.log('form', self.form)
          let menuData = self.form
          menuData.parent = null
          save(menuData).then(response => {
            console.log(response)
            this.$message({
              message: '提交成功',
              type: 'success'
            })
            self.fetchData()
            self.formVisible = false
          })
        } else {
          return false
        }
      })
    },
    edit(row) {
      console.log(row)
      this.form = row

      if (row.parent) {
        this.form.pid = row.parent.id
        this.form.pname = row.parent.simplename
      }
      this.formTitle = '编辑部门'
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
        del(row.id).then(response => {
          this.$message({
            message: '删除成功',
            type: 'success'
          })
          this.fetchData()
        })
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
