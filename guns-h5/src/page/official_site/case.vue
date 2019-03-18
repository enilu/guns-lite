<template>
  <div>
    <swiper :list="banner.list" v-model="banner.index" @on-index-change="bannerChange" v-if="showComponent.banner"></swiper>
    <productList title="精选案例" :list="caseList" type="case"  column="1" v-if="showComponent.caseList"></productList>
    <footMenu v-if="showComponent.footMenu" ></footMenu>

  </div>
</template>
<script src="./case.js"></script>
