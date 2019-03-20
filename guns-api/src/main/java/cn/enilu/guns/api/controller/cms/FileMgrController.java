package cn.enilu.guns.api.controller.cms;

import cn.enilu.guns.api.controller.BaseController;
import cn.enilu.guns.bean.constant.factory.PageFactory;
import cn.enilu.guns.bean.entity.system.FileInfo;
import cn.enilu.guns.bean.vo.front.Rets;
import cn.enilu.guns.service.cms.ContactsService;
import cn.enilu.guns.service.system.FileService;
import cn.enilu.guns.utils.Maps;
import cn.enilu.guns.utils.factory.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/fileMgr")
public class FileMgrController extends BaseController {
    @Autowired
    private ContactsService contactsService;
    @Autowired
    private FileService fileService;
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public Object list(@RequestParam(required = false) String originalFileName
                       ) {
        Page<FileInfo> page = new PageFactory<FileInfo>().defaultPage();
        page = fileService.findPage(page, Maps.newHashMap("originalFileName",originalFileName));
        page.setRecords(page.getRecords());
        return Rets.success(page);
    }
}
