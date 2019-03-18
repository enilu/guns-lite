<template>
  <div>
    <x-header :title="article.title"></x-header>
    <meArticle :article="article"></meArticle>
    <meReply :replies="article.replies" v-if="showComponent.reply"></meReply>
    <footMenu></footMenu>
  </div>
</template>
<script src="./article.js"></script>
<style scoped>

</style>
