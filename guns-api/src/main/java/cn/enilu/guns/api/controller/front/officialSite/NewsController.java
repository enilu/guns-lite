package cn.enilu.guns.api.controller.front.officialSite;

import cn.enilu.guns.api.controller.BaseController;
import cn.enilu.guns.bean.entity.cms.Article;
import cn.enilu.guns.bean.enumeration.cms.BannerTypeEnum;
import cn.enilu.guns.bean.enumeration.cms.ChannelEnum;
import cn.enilu.guns.bean.vo.front.Rets;
import cn.enilu.guns.bean.vo.offcialSite.Banner;
import cn.enilu.guns.bean.vo.offcialSite.News;
import cn.enilu.guns.service.cms.ArticleService;
import cn.enilu.guns.service.cms.BannerService;
import cn.enilu.guns.utils.factory.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@RestController
@RequestMapping("/offcialSite/news")
public class NewsController extends BaseController  {
    @Autowired
    private BannerService bannerService;
    @Autowired
    private ArticleService articleService;

    @RequestMapping(method = RequestMethod.GET)
    public Object list(){
        Map<String,Boolean> showMap = new HashMap<>();
        showMap.put("banner",true);
        showMap.put("list",true);
        showMap.put("footMenu",true);
        Map<String,Object> dataMap = new HashMap<>();
        if(showMap.get("banner")==true){
            Banner banner = bannerService.queryBanner(BannerTypeEnum.NEWS.getValue());
            dataMap.put("banner",banner);
        }
        if(showMap.get("list") ==true){
            List<News> newsList = new ArrayList<>();
            Page<Article> articlePage = articleService.query(1,10, ChannelEnum.NEWS.getId());

            for(cn.enilu.guns.bean.entity.cms.Article article:articlePage.getRecords()){
                News news = new News();
                news.setDesc(article.getTitle());
                news.setUrl("/article?id="+article.getId());
                news.setSrc("https://nutz.cn/yvr/u/enilu/avatar");
                newsList.add(news);
            }

             dataMap.put("list",newsList);
        }
        Map map = new HashMap();
        map.put("show",showMap);
        map.put("data",dataMap);
        return Rets.success(map);

    }
}
