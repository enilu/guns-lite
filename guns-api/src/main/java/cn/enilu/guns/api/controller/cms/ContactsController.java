package cn.enilu.guns.api.controller.cms;

import cn.enilu.guns.api.controller.BaseController;
import cn.enilu.guns.bean.constant.factory.PageFactory;
import cn.enilu.guns.bean.entity.cms.Contacts;
import cn.enilu.guns.bean.vo.front.Rets;
import cn.enilu.guns.service.cms.ContactsService;
import cn.enilu.guns.utils.Maps;
import cn.enilu.guns.utils.factory.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/contacts")
public class ContactsController extends BaseController {
    @Autowired
    private ContactsService contactsService;
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public Object list(@RequestParam(required = false) String userName,
                       @RequestParam(required = false) String mobile) {
        Page<Contacts> page = new PageFactory<Contacts>().defaultPage();
        page = contactsService.findPage(page, Maps.newHashMap("userName",userName,"mobile",mobile));
        page.setRecords(page.getRecords());
        return Rets.success(page);
    }
}
