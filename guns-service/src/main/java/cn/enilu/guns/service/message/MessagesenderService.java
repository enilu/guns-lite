package cn.enilu.guns.service.message;


import cn.enilu.guns.bean.entity.message.MessageSender;
import cn.enilu.guns.bean.entity.message.MessageTemplate;
import cn.enilu.guns.bean.enumeration.BizExceptionEnum;
import cn.enilu.guns.bean.exception.GunsException;
import cn.enilu.guns.dao.message.MessagesenderRepository;
import cn.enilu.guns.dao.message.MessagetemplateRepository;
import cn.enilu.guns.service.BaseService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * MessagesenderService
 *
 * @author enilu
 * @version 2019/05/17 0017
 */
@Service
public class MessagesenderService extends BaseService<MessageSender,Long, MessagesenderRepository> {
    private Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired
    private MessagesenderRepository messageSenderRepository;
    @Autowired
    private MessagetemplateRepository messagetemplateRepository;

    public void save(MessageSender messageSender){
        messageSenderRepository.save(messageSender);
    }
    @Override
    public void  delete(Long id) throws GunsException {
        List<MessageTemplate> templateList = messagetemplateRepository.findByIdMessageSender(id);
        if(templateList.isEmpty()) {
            messageSenderRepository.deleteById(id);
        }else{
            throw  new GunsException(BizExceptionEnum.CAN_NOT_DELETE);
        }
    }

}

