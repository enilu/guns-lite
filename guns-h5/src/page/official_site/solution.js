import {TransferDom, Panel, Swiper, SwiperItem, GroupTitle} from 'vux'
import footMenu from '../../components/footer/footMenu'
import menuGroup from '../../components/menu/menuGroup'
import productList from '../../components/product/productList'
import api from '../../fetch/api'

export default {
  components: {
    TransferDom, footMenu, Panel, Swiper, SwiperItem, menuGroup, productList, GroupTitle
  },
  data () {
    return {
      showComponent: {
        banner: false,
        solutionList: false,
        footMenu: false
      },
      productList: [],
      banner: {}
    }
  },
  mounted () {
    this.init()
  },

  methods: {
    init () {
      api.getSolutionList().then(res => {
        console.log(res)
        this.showComponent = res.data.show
        this.data = res.data.data
        for (const index in res.data.data) {
          this[index] = res.data.data[index]
        }
      })
    },
    bannerChange (index) {
      this.banner.index = index
    },
    onItemClick (index) {
      this.getTopics(this.tabData[index].key)
    },
  }
}
