<template>
  <div class="app-container">
    <div class="block">
      <el-row  :gutter="24">
        <el-col :span="4">
          <el-date-picker type="date" placeholder="起始日期" v-model="listQuery.beginTime" value-format="yyyy-MM-dd"
                          style="width: 100%;"></el-date-picker>
        </el-col>
        <el-col :span="4">
          <el-date-picker type="date" placeholder="结束日期" v-model="listQuery.endTime"  value-format="yyyy-MM-dd"
                          style="width: 100%;"></el-date-picker>
        </el-col>
        <el-col :span="4">
          <el-input v-model="listQuery.logname" placeholder="日志名称"></el-input>
        </el-col>

        <el-col :span="8">
          <el-button type="success" icon="el-icon-search" @click.native="search">搜索</el-button>
          <el-button type="primary" icon="el-icon-refresh" @click.native="reset">重置</el-button>
          <el-button type="danger" icon="el-icon-delete" @click.native="clear">清空日志</el-button>
        </el-col>
      </el-row>
      <br>

    </div>

    <el-table :data="list" v-loading="listLoading" element-loading-text="Loading" border fit highlight-current-row
    @current-change="handleCurrentChange">
     <el-table-column type="expand">
       <template slot-scope="props">
         <el-form label-position="left" inline class="demo-table-expand">
           <el-form-item label="用户id">
             <span>{{ props.row.userid }}</span>
           </el-form-item>
           <el-form-item label="日志名称">
             <span>{{ props.row.logname }}</span>
           </el-form-item>
           <el-form-item label="用户">
             <span>{{ props.row.userName }}</span>
           </el-form-item>
           <el-form-item label="IP">
             <span>{{ props.row.ip }}</span>
           </el-form-item>
           <el-form-item label="结果">
             <span>{{ props.row.succeed }}</span>
           </el-form-item>
           <el-form-item label="时间">
             <span>{{ props.row.createtime }}</span>
           </el-form-item>
           <el-form-item label="内容">
             <span>{{ props.row.regularMessage }}</span>
           </el-form-item>
         </el-form>
       </template>
     </el-table-column>

     <el-table-column
       label="用户"
       prop="userName">
     </el-table-column>
     <el-table-column
       label="IP"
       prop="ip">
     </el-table-column>
     <el-table-column
       label="日志名称"
       prop="logname">
     </el-table-column>
     <el-table-column
       label="时间"
       prop="createtime">
     </el-table-column>
   </el-table>

    <el-pagination
      background
      layout="total, sizes, prev, pager, next, jumper"
      :page-sizes="[10, 20, 50, 100,500]"
      :page-size="listQuery.limit"
      :total="total"
      @size-change="changeSize"
      @current-change="fetchPage"
      @prev-click="fetchPrev"
      @next-click="fetchNext">
    </el-pagination>

  </div>
</template>

<script>
  import { clear , getList  }  from '@/api/system/loginLog'


  export default {
    data() {
      return {
        form: {
          logname: '',
        },
        listQuery: {
          page: 1,
          limit: 20,
          logname: undefined,
          beginTime: undefined,
          endTime: undefined
        },
        total:0,
        list: null,
        listLoading: true,
        selRow:{}
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
        this.listQuery.logname = ''
        this.listQuery.beginTime = ''
        this.listQuery.endTime = ''
        this.fetchData()
      },
      handleFilter() {
        this.listQuery.page = 1
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
      clear(){
        this.$confirm('确定清空数据?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          clear().then(response => {
            this.$message({
              message: '清空成功',
              type: 'sucess'
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
</style>
