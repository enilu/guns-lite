package cn.enilu.guns.api.controller.front.officialSite;

import cn.enilu.guns.api.controller.BaseController;
import cn.enilu.guns.bean.vo.front.Rets;
import com.alibaba.fastjson.JSON;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/offcialSite/contact")
public class ContactController extends BaseController {
    private Logger logger = LoggerFactory.getLogger(getClass());
    @RequestMapping(method = RequestMethod.POST)
    public Object save(Contact contact){
        logger.info(JSON.toJSONString(contact));
        return Rets.success();
    }
}
