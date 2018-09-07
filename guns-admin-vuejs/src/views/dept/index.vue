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

    <el-table-column label="操作" width="200">
      <template slot-scope="scope">
        <el-button type="text" @click="remove(scope.row)">删除</el-button>
      </template>
    </el-table-column>
      <el-table-column label="简称" width="200">
        <template slot-scope="scope">
          <el-button type="text" @click="edit(scope.row)">{{scope.row.simplename}}</el-button>

        </template>
      </el-table-column>
      <el-table-column label="ID" width="200">
        <template slot-scope="scope">
          <span >{{scope.row.id}}</span>
        </template>
      </el-table-column>
      <el-table-column label="全称" width="200">
        <template slot-scope="scope">
          <span >{{scope.row.fullname}}</span>
        </template>
      </el-table-column>
      <el-table-column label="顺序" width="200">
        <template slot-scope="scope">
          <span >{{scope.row.num}}</span>
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
            <el-form-item label="父部门">
              <el-select v-model="form.pid" placeholder="请选择父部门">
                <el-option
                  v-for="item in data"
                  :key="item.id"
                  :label="item.name"
                  :value="item.id">
                </el-option>
              </el-select>
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
/**
  Auth: Lei.j1ang
  Created: 2018/1/19-14:54
*/
import treeTable from '@/components/TreeTable'
import { getDeptList } from '@/api/dept'
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
      form: {
        id:'',
        simplename: '',
        fullname: '',
        pid: '',
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
      getDeptList(this.listQuery).then(response => {
        this.data = response.data.items
        this.listLoading = false
      })
    },
    message(row) {
      console.log(row)
    },
    add() {
      this.formTitle = '添加菜单'
      this.formVisible = true
      this.isAdd = true
    },
    edit(row) {
      console.log(row)
      this.form = row
      this.formTitle = '编辑部门'
      this.formVisible = true
      this.isAdd = false
    },
    remove(row) {
       console.log(row)
    }
  }
}
</script>
