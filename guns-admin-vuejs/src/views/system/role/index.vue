<template>
  <div class="app-container">
    <div class="block">
      <el-row  :gutter="20">
        <el-col :span="6">
          <el-input v-model="listQuery.name" placeholder="请输入角色名称"></el-input>
        </el-col>
        <el-col :span="6">
          <el-button type="success" icon="el-icon-search" @click.native="search">搜索</el-button>
          <el-button type="primary" icon="el-icon-refresh" @click.native="reset">重置</el-button>
        </el-col>
      </el-row>
      <br>
      <el-row>
        <el-col :span="24">
          <el-button type="success" icon="el-icon-plus" @click.native="add">添加</el-button>
          <el-button type="primary" icon="el-icon-edit" @click.native="edit">修改</el-button>
          <el-button type="danger" icon="el-icon-delete" @click.native="remove">删除</el-button>
          <el-button type="primary" icon="el-icon-setting" @click.native="openPermissions">权限配置</el-button>
        </el-col>
      </el-row>
    </div>


    <el-table :data="list" v-loading="listLoading" element-loading-text="Loading" border fit highlight-current-row
    @current-change="handleCurrentChange">

      <el-table-column label="名称">
        <template slot-scope="scope">
          {{scope.row.name}}
        </template>
      </el-table-column>
      <el-table-column label="编码">
        <template slot-scope="scope">
          {{scope.row.tips}}
        </template>
      </el-table-column>
      <el-table-column label="所在部门">
        <template slot-scope="scope">
          {{scope.row.deptName}}
        </template>
      </el-table-column>
      <el-table-column label="上级角色">
        <template slot-scope="scope">
          {{scope.row.pName}}
        </template>
      </el-table-column>

    </el-table>


    <el-dialog
      :title="formTitle"
      :visible.sync="formVisible"
      width="70%">
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="编码" prop="tips">
              <el-input v-model="form.tips" minlength=1></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="名称" prop="name">
              <el-input v-model="form.name"  minlength=1></el-input>
            </el-form-item>
          </el-col>

          <el-col :span="12">
            <el-form-item label="上级角色">
              <el-select v-model="form.pid" placeholder="请选择上级角色">
                <el-option
                  v-for="item in roleList"
                  :key="item.id"
                  :label="item.name"
                  :value="item.id">
                </el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12" >
            <el-form-item label="排序">
              <el-input v-model="form.num" type="number"></el-input>
            </el-form-item>
          </el-col>

          <el-col :span="12">
            <el-form-item label="所在部门">
              <el-select v-model="form.deptid" placeholder="请选择部门">
                <el-option
                  v-for="item in deptList"
                  :key="item.id"
                  :label="item.name"
                  :value="item.id">
                </el-option>
              </el-select>
            </el-form-item>
          </el-col>


        </el-row>
        <el-form-item>
          <el-button type="primary" @click="save">提交</el-button>
          <el-button @click.native="formVisible = false">取消</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>



        <el-dialog
          title="权限配置"
          :visible.sync="permissonVisible"
          width="25%">
          <el-form ref="permissonForm"  >
            <el-row>
              <el-col :span="12">
                <el-tree
                  :data="permissons"
                  show-checkbox
                  node-key="id"
                  ref="permissonTree"
                  :default-expanded-keys="[2, 3]"
                  :default-checked-keys="[5]"
                  :props="defaultProps">
                </el-tree>

              </el-col>
            </el-row>
            <el-form-item>
              <el-button type="primary" @click="savePermissions">提交</el-button>
            </el-form-item>
          </el-form>
        </el-dialog>
  </div>
</template>

<script src="./role.js"></script>
<style rel="stylesheet/scss" lang="scss" scoped>
  @import "src/styles/common.scss";
</style>
