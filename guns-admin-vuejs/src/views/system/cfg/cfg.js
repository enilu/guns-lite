
import { remove , getList , save }  from '@/api/system/cfg'



export default {
  data() {
    return {
      formVisible: false,
      formTitle: '添加参数',
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
        this.list = response.data.records
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
              message: '操作成功',
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
