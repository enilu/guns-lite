
import { remove , getList , save , getRoleTree ,getPermissons , savePermissons }  from '@/api/system/role'
import { list as getDeptList }  from '@/api/system/dept'



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
      deptTree:{
        show: false,
        defaultProps: {
          id: "id",
          label: 'simplename',
          children: 'children'
        }
      },
      roleTree:{
        show: false,
        defaultProps: {
          id: "id",
          label: 'name',
          children: 'children'
        }
      },

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
       getDeptList().then(response => {
         this.deptList = response.data.items
       })
       getRoleTree().then(response => {
         this.roleList = response.data.items
       })
      this.fetchData()
    },
    fetchData() {
      this.listLoading = true
      getList(this.listQuery).then(response => {
        this.list = response.data.records
        this.listLoading = false
        this.total = response.data.total
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
              message: '提交成功',
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
    },
    handleDeptNodeClick(data, node) {
      console.log(data)
      this.form.deptid = data.id
      this.form.deptName = data.simplename
      this.deptTree.show = false;
    },
    handleRoleNodeClick(data, node) {
      console.log(data)
      this.form.pid = data.id
      this.form.pName = data.name
      this.roleTree.show = false;
    }

  }
}
