import {XHeader, Panel, Swiper, SwiperItem} from 'vux'
import footMenu from '../../components/footer/footMenu'
import api from '../../fetch/api'

export default {
  components: {
    XHeader, footMenu, Panel, Swiper, SwiperItem
  },
  data () {
    return {
      showComponent: {
        banner: true,
        list: true,
        footMenu: true
      },
      banner: {},
      newsList: [],
      userName: 'enilu'
    }
  },
  created () {
    this.init()
  },
  methods: {
    init () {
      api.getNewsList().then(res => {
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
    }
  }
}
