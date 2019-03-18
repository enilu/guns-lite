package cn.enilu.guns.api.controller.front.officialSite;

import cn.enilu.guns.api.controller.BaseController;
import cn.enilu.guns.bean.entity.cms.Contacts;
import cn.enilu.guns.bean.vo.front.Rets;
import cn.enilu.guns.dao.cms.ContactsRepository;
import com.alibaba.fastjson.JSON;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/offcialSite/contact")
public class ContactController extends BaseController {
    private Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired
    private ContactsRepository contactsRepository;
    @RequestMapping(method = RequestMethod.POST)
    public Object save(Contacts contacts){
        logger.info(JSON.toJSONString(contacts));
        contactsRepository.save(contacts);
        return Rets.success();
    }
}
