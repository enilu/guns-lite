<template>
  <div id="article">
    <p class="title">{{article.title}}</p>
    <flexbox class="header">
      <flexbox-item :span="3">
        <img :src="article.author.avatar" class="avatar">
      </flexbox-item>
      <flexbox-item :span="9">
        <p class="author-name">{{article.author.name}}</p>
        <p class="create-at">发表于 {{article.createAt}}</p>
      </flexbox-item>
    </flexbox>
    <p class="content" v-html="article.content"></p>
  </div>
</template>

<script>
  import { Flexbox, FlexboxItem } from 'vux'

  export default {
    name: 'me-article',
    props: { article: {} },
    components: {
      Flexbox, FlexboxItem
    }
  }
</script>

<style scoped>
  #article{
    padding:10px;
  }
  #article>.title{
    font-size:1rem;
  }
  #article>.vux-flex-row>.vux-flexbox-item>.avatar{
    width:60px;
    border-radius: 50px;
  }
  #article>.vux-flex-row>.vux-flexbox-item>.author-name{
    color:#999;font-size:.7rem;
  }
  #article>.vux-flex-row>.vux-flexbox-item>.create-at{
    font-size:.7rem;
  }
  #article>p{
    font-size:.86rem;
  }
</style>
