<template>

  <div class="app-container">
    <el-form ref="form" :model="form"  >
      <el-input type="hidden" ref="content" v-model="form.content"></el-input>
      <el-row :gutter="20">
        <el-col :span="4"  >
          <el-select v-model="form.type" placeholder="选择栏目">
            <el-option
              v-for="item in options"
              :key="item.value"
              :label="item.label"
              :value="item.value">
            </el-option>
          </el-select>
        </el-col>
        <el-col :span="14"  >
          <el-input v-model="form.title" minlength=1 placeholder="文章标题"></el-input>
        </el-col>

        <el-col :span="4"  >
          <el-input v-model="form.author" minlength=1 placeholder="作者"></el-input>
        </el-col>
        <el-col :span="2"  >
          <el-button type="primary" @click="save">{{ $t('button.submit') }}</el-button>
        </el-col>

      </el-row>
      <br>
    </el-form>
    <div :class="{fullscreen:fullscreen}" class="tinymce-container editor-container">
      <textarea :id="tinymceId" class="tinymce-textarea"/>
      <div class="editor-custom-btn-container">
        <editorImage color="#1890ff" class="editor-upload-btn" @successCBK="imageSuccessCBK"/>
      </div>
    </div>
  </div>
</template>

<script src="./edit.js"></script>

<style scoped>
  .tinymce-container {
    position: relative;
    line-height: normal;
  }

  .tinymce-container >>> .mce-fullscreen {
    z-index: 10000;
  }

  .tinymce-textarea {
    visibility: hidden;
    z-index: -1;
  }

  .editor-custom-btn-container {
    position: absolute;
    right: 4px;
    top: 4px;
    /*z-index: 2005;*/
  }

  .fullscreen .editor-custom-btn-container {
    z-index: 10000;
    position: fixed;
  }

  .editor-upload-btn {
    display: inline-block;
  }
</style>
