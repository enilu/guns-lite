package cn.enilu.guns.api.controller.front.officialSite;

import cn.enilu.guns.api.controller.BaseController;
import cn.enilu.guns.bean.vo.front.Rets;
import cn.enilu.guns.bean.vo.offcialSite.Article;
import cn.enilu.guns.bean.vo.offcialSite.Author;
import cn.enilu.guns.bean.vo.offcialSite.Reply;
import cn.enilu.guns.dao.cms.ArticleRepository;
import cn.enilu.guns.service.cms.ArticleService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.*;

@RestController
@RequestMapping("/offcialSite/article")
public class ArticleController extends BaseController {
    private Logger logger = LoggerFactory.getLogger(ArticleController.class);
    @Autowired
    private ArticleService articleService;
    @Autowired
    private ArticleRepository articleRepository;
    @RequestMapping(method = RequestMethod.GET)
    public Object get(@Param("id") Long id,@Param("type")String type) {
        logger.info("type:{},id:{}",type,id);
        Map<String,Boolean> showMap = new HashMap<>();
        Map<String,Object> dataMap = new HashMap<>();

        cn.enilu.guns.bean.entity.cms.Article article1 = articleRepository.getOne(id);
        Article article = new Article();
        article.setId(String.valueOf(article1.getId()));
        article.setTitle(article1.getTitle());
        article.setContent("<p>json里面有个日期字符串：Jan 13, 2018 12:00:00 AM </p><p>用 Json.fromJsonAsList(CampaignType.class,json);将json直接转换为对象的时候异常了<br/>异常信息为 无法解析日期，<br/>请问怎么处理比较好</p>");
        article.setCreateAt(new Date());
        Author author = new Author();
        author.setName("enilu");
        author.setAvatar("https://nutz.cn/yvr/u/enilu/avatar");
        article.setAuthor(author);
        dataMap.put("article",article);
        showMap.put("reply",true);
        if(showMap.get("reply") == true){
            List<Reply> replies = new ArrayList<>();
            for(int i=0;i<5;i++) {
                Reply reply = new Reply();
                reply.setCreateAt(new Date());
                reply.setContent("<p>@wendal<br/>下面代码可以：</p>\n" +
                        "<pre class='prettyprint'><code>String date = \"Jan 13, 2018 12:00:00 AM\";\n" +
                        "SimpleDateFormat sdf = new SimpleDateFormat(\"MMM dd, yyyy HH:mm:ss aa\", Locale.ENGLISH);\n" +
                        "System.out.println(sdf.parse(date));\n" +
                        "</code></pre><p>但是我用@JsonField不可以</p>\n" +
                        "<pre class='prettyprint'><code>public class OfflineTimeType {\n" +
                        "private Integer flat;\n" +
                        "@JsonField(dataFormat = \"MMM dd, yyyy HH:mm:ss aa\")\n" +
                        "private Date time;\n" +
                        "setter...;\n" +
                        "getter...;\n" +
                        "} \n" +
                        "\n" +
                        "Map map = new HashMap();\n" +
                        "map.put(\"time\",\"Jan 13, 2018 12:00:00 AM\");\n" +
                        "map.put(\"flag\",1);\n" +
                        "//报异常Caused by: java.lang.RuntimeException: Unexpect date format 'Jan 13, 2018 12:00:00 AM'\n" +
                        "OfflineTimeType offlineTimeType = Json.fromJson(OfflineTimeType.class,Json.toJson(map));\n" +
                        "\n" +
                        "</code></pre>");

                reply.setAuthor(author);
                replies.add(reply);
            }

            article.setReplies(replies);
        }
        Map map = new HashMap();
        map.put("show",showMap);
        map.put("data",dataMap);
        return Rets.success(map);
    }
}
