package cn.enilu.guns.admin.modular.message;


import cn.enilu.guns.admin.core.base.controller.BaseController;
import cn.enilu.guns.bean.annotion.core.BussinessLog;
import cn.enilu.guns.bean.constant.factory.PageFactory;
import cn.enilu.guns.bean.entity.message.Message;
import cn.enilu.guns.bean.vo.front.Rets;
import cn.enilu.guns.bean.vo.query.Page;
import cn.enilu.guns.service.message.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/message/history")
public class MessageController extends BaseController {

    private static String PREFIX = "/message/history/";
    @Autowired
    private MessageService messageService;

    /**
     * 跳转到参数首页
     */
    @RequestMapping(value = "",method = RequestMethod.GET)
    public String index() {
        return PREFIX + "message.html";
    }

    /**
     * 跳转到消息详情
     */
    @RequestMapping(value = "/view/{id}",method = RequestMethod.GET)
    public String view(@PathVariable Long id, Model model) {
        Message message = messageService.get(id);
        model.addAttribute("item",message);
        return PREFIX + "message_view.html";
    }

    @RequestMapping(value = "/list", method = RequestMethod.POST)
    @ResponseBody
    public Object list() {
        Page<Message> page = new PageFactory<Message>().defaultPage();
        page = messageService.queryPage(page);
        page.setRecords(page.getRecords());
        return super.packForBT(page);
    }


    @RequestMapping(value="/clear",method = RequestMethod.POST)
    @BussinessLog(value = "清空所有历史消息")
    @ResponseBody
    public Object clear() {
        messageService.clear();
        return Rets.success();
    }
}