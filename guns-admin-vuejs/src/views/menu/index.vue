<template>
  <div class="app-container">
    <div class="block">
      <el-button type="success" icon="el-icon-plus"  @click.native="add">添加</el-button>
      <el-button type="primary" icon="el-icon-edit"  @click.native="edit">修改</el-button>
      <el-button type="danger" icon="el-icon-delete"  @click.native="remove">删除</el-button>
    </div>

    <tree-table ref="menuTree" :data="data" :columns="columns" :expandAll="expandAll"   border highlight-current-row
    @current-change="handleCurrentChange"></tree-table>

      <el-button @click="setCurrent()">取消选择</el-button>

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
              <el-form-item label="父级菜单">
                <el-select v-model="form.pcode" placeholder="请选择父菜单">
                  <el-option
                    v-for="item in data"
                    :key="item.code"
                    :label="item.name"
                    :value="item.code">
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
import { getList } from '@/api/menu'

export default {
  name: 'treeTableDemo',
  components: { treeTable },
  data() {
    return {
      listLoading: true,
      expandAll: true,
      formTitle: '',
      formVisible: false,
      isAdd: false,
      menuList: [],
      form: {
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
    this.init()
  },
  methods: {
    init() {
      this.fetchData()
    },
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
    handleCurrentChange(currentRow,oldCurrentRow){
      console.log('-------')
      console.log(currentRow)
      this.selRow = currentRow
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
    edit() {
      if(this.checkSel()){
        console.log(this.selRow)
      }
    },
    remove() {
      if(this.checkSel()){
        console.log(this.selRow)
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
