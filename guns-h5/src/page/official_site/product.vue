<template>
  <div>
    <swiper :list="banner.list" v-model="banner.index" @on-index-change="bannerChange" v-if="showComponent.banner"></swiper>
    <productList title="产品展示" :list="productList" type="product" v-if="showComponent.productList"></productList>
    <footMenu v-if="showComponent.footMenu" ></footMenu>

  </div>
</template>
<script src="./product.js"></script>
