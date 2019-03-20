package cn.enilu.guns.api.controller.cms;

import cn.enilu.guns.api.controller.BaseController;
import cn.enilu.guns.bean.annotion.core.BussinessLog;
import cn.enilu.guns.bean.constant.factory.PageFactory;
import cn.enilu.guns.bean.dictmap.CommonDict;
import cn.enilu.guns.bean.entity.cms.Article;
import cn.enilu.guns.bean.vo.front.Rets;
import cn.enilu.guns.dao.cms.ArticleRepository;
import cn.enilu.guns.service.cms.ArticleService;
import cn.enilu.guns.utils.Maps;
import cn.enilu.guns.utils.factory.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.*;

/**
 * 文章管理
 */
@RestController
@RequestMapping("/article")
public class ArticleMgrController extends BaseController {
    @Autowired
    private ArticleRepository articleRepository;
    @Autowired
    private ArticleService articleService;
    @RequestMapping(method = RequestMethod.POST)
    @BussinessLog(value = "编辑文章",key="name",dict = CommonDict.class)
    public Object save(){
        Article article = getFromJson(Article.class);
        articleRepository.save(article);
        return Rets.success();
    }
    @RequestMapping(method = RequestMethod.DELETE)
    @BussinessLog(value = "删除文章",key="id",dict = CommonDict.class)
    public Object remove(Long id){
        articleRepository.deleteById(id);
        return Rets.success();
    }
    @RequestMapping(method = RequestMethod.GET)
    public Object get(@Param("id") Long id) {
        Article article = articleRepository.findById(id).get();
        return Rets.success(article);
    }
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public Object list(@RequestParam(required = false) String cfgName, @RequestParam(required = false) String cfgValue) {
        Page<Article> page = new PageFactory<Article>().defaultPage();

        page = articleService.findPage(page, Maps.newHashMap("cfgName",cfgName,"cfgValue",cfgValue));
        page.setRecords(page.getRecords());
        return Rets.success(page);
    }
}
