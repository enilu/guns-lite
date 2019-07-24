package cn.enilu.guns.admin.modular.message;

import cn.enilu.guns.admin.core.base.controller.BaseController;
import cn.enilu.guns.bean.annotion.core.BussinessLog;
import cn.enilu.guns.bean.constant.factory.PageFactory;
import cn.enilu.guns.bean.dictmap.CommonDict;
import cn.enilu.guns.bean.entity.message.MessageSender;
import cn.enilu.guns.bean.enumeration.BizExceptionEnum;
import cn.enilu.guns.bean.exception.GunsException;
import cn.enilu.guns.bean.vo.query.Page;
import cn.enilu.guns.service.message.MessagesenderService;
import cn.enilu.guns.utils.ToolUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/message/sender")
public class MessagesenderController extends BaseController {

    private static String PREFIX = "/message/sender/";
    @Autowired
    private MessagesenderService messagesenderService;

    /**
     * 跳转到首页
     */
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String index() {
        return PREFIX + "sender.html";
    }

    /**
     * 跳转到添加参数
     */
    @RequestMapping("/add")
    public String add() {
        return PREFIX + "sender_add.html";
    }

    /**
     * 跳转到修改参数
     */
    @RequestMapping("/update/{id}")
    public String update(@PathVariable Long id, Model model) {
        MessageSender sender = messagesenderService.get(id);
        model.addAttribute("item", sender);
        return PREFIX + "sender_edit.html";
    }

    @RequestMapping(value = "/list", method = RequestMethod.POST)
    @ResponseBody
    public Object list() {
        Page<MessageSender> page = new PageFactory<MessageSender>().defaultPage();
        page = messagesenderService.queryPage(page);
        page.setRecords(page.getRecords());
        return packForBT(page);
    }


    @RequestMapping(method = RequestMethod.POST)
    @BussinessLog(value = "保存消息发送器", key = "name", dict = CommonDict.class)
    @ResponseBody
    public Object save(@ModelAttribute MessageSender tMessageSender) {
        messagesenderService.save(tMessageSender);
        return SUCCESS_TIP;
    }

    @RequestMapping(method = RequestMethod.DELETE)
    @BussinessLog(value = "删除消息发送器", key = "id", dict = CommonDict.class)
    @ResponseBody
    public Object remove(Long id) throws GunsException {
        if (ToolUtil.isEmpty(id)) {
            throw new GunsException(BizExceptionEnum.REQUEST_NULL);
        }
        messagesenderService.delete(id);
        return SUCCESS_TIP;


    }
}