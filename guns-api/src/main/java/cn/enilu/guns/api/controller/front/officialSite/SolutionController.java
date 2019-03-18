package cn.enilu.guns.api.controller.front.officialSite;

import cn.enilu.guns.api.controller.BaseController;
import cn.enilu.guns.bean.entity.cms.Article;
import cn.enilu.guns.bean.enumeration.cms.BannerTypeEnum;
import cn.enilu.guns.bean.enumeration.cms.ChannelEnum;
import cn.enilu.guns.bean.vo.front.Rets;
import cn.enilu.guns.bean.vo.offcialSite.Banner;
import cn.enilu.guns.bean.vo.offcialSite.Solution;
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
@RequestMapping("/offcialSite/solution")
public class SolutionController extends BaseController {
    @Autowired
    private BannerService bannerService;
    @Autowired
    private ArticleService articleService;
    @RequestMapping(method = RequestMethod.GET)
    public Object index(){
        Map<String,Boolean> showMap = new HashMap<>();
        Map<String,Object> dataMap = new HashMap<>();
        showMap.put("banner",true);
        showMap.put("solutionList",true);
        showMap.put("footMenu",true);

        if(showMap.get("banner")==true){
            Banner banner = bannerService.queryBanner(BannerTypeEnum.SOLUTION.getValue());
            dataMap.put("banner",banner);
        }
        if(showMap.get("solutionList") == true){
            List<Solution> solutions = new ArrayList<>();
            Page<Article> articlePage = articleService.query(1,10, ChannelEnum.PRODUCT.getId());
            for(Article article:articlePage.getRecords()){
                solutions.add(new Solution(article.getId(),article.getTitle(),article.getImg()));
            }
            dataMap.put("solutionList",solutions);
        }
        Map map = new HashMap();
        map.put("show",showMap);
        map.put("data",dataMap);
        return Rets.success(map);

    }
}
