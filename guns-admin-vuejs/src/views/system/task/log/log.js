import { logList } from '@/api/system/task'

export default {
  data() {
    return {
      taskId: '',
      formVisible: false,
      formTitle: '添加参数',
      deptList: [],
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
        taskId: undefined
      },
      total: 0,
      list: null,
      listLoading: true,
      selRow: {}
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
      this.listQuery.taskId = this.$route.query.taskId
      this.fetchData()
    },
    fetchData() {
      this.listLoading = true
      logList(this.listQuery).then(response => {
        this.list = response.data.records
        this.listLoading = false
        this.total = response.data.total
      })
    },
    fetchNext() {
      this.listQuery.page = this.listQuery.page + 1
      this.fetchData()
    },
    fetchPrev() {
      this.listQuery.page = this.listQuery.page - 1
      this.fetchData()
    },
    fetchPage(page) {
      this.listQuery.page = page
      this.fetchData()
    },
    changeSize(limit) {
      this.listQuery.limit = limit
      this.fetchData()
    },
    back() {
      this.$router.go(-1)
    }

  }
}
