<template>
  <div class="app-container">
    <el-table :data="list" v-loading="listLoading" element-loading-text="Loading" border fit highlight-current-row>

      <el-table-column label="标题">
        <template slot-scope="scope">
          {{scope.row.title}}
        </template>
      </el-table-column>

    </el-table>
  </div>
</template>

<script>
  import { getList } from '@/api/system/notice'

  export default {
    data() {
      return {
        list: null,
        listLoading: true
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
      this.fetchData()
    },
    methods: {
      fetchData() {
        this.listLoading = true
        getList(this.listQuery).then(response => {
          this.list = response.data.items
        this.listLoading = false
      })
      }
    }
  }
</script>
