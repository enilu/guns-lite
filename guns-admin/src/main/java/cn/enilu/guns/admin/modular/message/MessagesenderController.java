package cn.enilu.guns.admin.modular.message;

import cn.enilu.guns.bean.annotion.core.BussinessLog;
import cn.enilu.guns.bean.constant.factory.PageFactory;
import cn.enilu.guns.bean.dictmap.CommonDict;
import cn.enilu.guns.bean.entity.message.MessageSender;
import cn.enilu.guns.bean.enumeration.BizExceptionEnum;
import cn.enilu.guns.bean.exception.GunsException;
import cn.enilu.guns.bean.vo.front.Rets;
import cn.enilu.guns.bean.vo.query.Page;
import cn.enilu.guns.service.message.MessagesenderService;
import cn.enilu.guns.utils.ToolUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/message/sender")
public class MessagesenderController {
    @Autowired
    private MessagesenderService messagesenderService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public Object list() {
        Page<MessageSender> page = new PageFactory<MessageSender>().defaultPage();
        page = messagesenderService.queryPage(page);
        page.setRecords(page.getRecords());
        return Rets.success(page);
    }

    @RequestMapping(value = "/queryAll", method = RequestMethod.GET)
    public Object queryAll() {
        return Rets.success(messagesenderService.queryAll());
    }

    @RequestMapping(method = RequestMethod.POST)
    @BussinessLog(value = "编辑消息发送者", key = "name", dict = CommonDict.class)
    public Object save(@ModelAttribute MessageSender tMessageSender) {
        messagesenderService.save(tMessageSender);
        return Rets.success();
    }

    @RequestMapping(method = RequestMethod.DELETE)
    @BussinessLog(value = "删除消息发送者", key = "id", dict = CommonDict.class)
    public Object remove(Long id) {
        if (ToolUtil.isEmpty(id)) {
            throw new GunsException(BizExceptionEnum.REQUEST_NULL);
        }
        try {
            messagesenderService.delete(id);
            return Rets.success();
        } catch (Exception e) {
            return Rets.failure(e.getMessage());
        }

    }
}