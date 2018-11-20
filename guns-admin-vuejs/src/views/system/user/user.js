
import { deleteUser , getList , saveUser }  from '@/api/system/user'
import { getDeptTree }  from '@/api/system/dept'



export default {
  data() {
    return {
      formVisible: false,
      formTitle: '添加用户',
      deptList:[],
      isAdd: true,
      form: {
        id: '',
        account: '',
        name: '',
        birthday: '',
        sex: 1,
        email: '',
        password: '',
        rePassword: '',
        dept: '',
        status: true,
        deptid:1
      },
      rules: {
        account: [
          { required: true, message: '请输入登录账号', trigger: 'blur' },
          { min: 3, max: 20, message: '长度在 3 到 20 个字符', trigger: 'blur' }
        ],
        name: [
          { required: true, message: '请输入用户名', trigger: 'blur' },
          { min: 2, max: 20, message: '长度在 2 到 20 个字符', trigger: 'blur' }
        ],
        email: [
          { required: true, message: '请输入email', trigger: 'blur' }
        ],
        phone: [
          { required: true, message: '请输入联系电话', trigger: 'blur' }
        ]
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
    this.init()
  },
  methods: {
    init() {
      getDeptTree().then(response => {
        this.deptList = response.data.items
      })
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
      this.listQuery.account = ''
      this.listQuery.name = ''
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
        account: '',
        name: '',
        birthday: '',
        sex: 1,
        email: '',
        password: '',
        rePassword: '',
        dept: '',
        status: true,
        deptid:1
      }
    },
    add() {
      this.resetForm()
      this.formTitle = '添加用户'
      this.formVisible = true
      this.isAdd = true
    },
    validPasswd() {
      if(!this.isAdd){
        return true
      }
      if(this.form.password != this.form.rePassword){
        console.log('password is not right')
        return false
      }
      if(this.form.password == '' || this.form.rePassword == ''){
        console.log('password is null')
        return false
      }
      return true
    },
    saveUser() {
      var self = this
      this.$refs['form'].validate((valid) => {
        if (valid) {

          if(this.validPasswd()){
            saveUser(this.form).then(response => {
              console.log(response)
              this.$message({
                message: '提交成功',
                type: 'success'
              })
              this.fetchData()
              this.formVisible = false

            })

          }else{
            this.$message({
              message: '提交失败',
              type: 'error'
            });
          }

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
        this.formTitle = '修改用户'
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
