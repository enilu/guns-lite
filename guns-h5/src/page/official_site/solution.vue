<template>
  <div>
    <swiper :list="banner.list" v-model="banner.index" @on-index-change="bannerChange" v-if="showComponent.banner"></swiper>
    <productList title="解决方案" :list="solutionList" type="solution" v-if="showComponent.solutionList"></productList>
    <footMenu v-if="showComponent.footMenu" ></footMenu>

  </div>
</template>
<script src="./solution.js"></script>
