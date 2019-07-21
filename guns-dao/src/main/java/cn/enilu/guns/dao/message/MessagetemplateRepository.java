package cn.enilu.guns.dao.message;



import cn.enilu.guns.bean.entity.message.MessageTemplate;
import cn.enilu.guns.dao.BaseRepository;

import java.util.List;


public interface MessagetemplateRepository extends BaseRepository<MessageTemplate,Long> {
    MessageTemplate findByCode(String code);

    List<MessageTemplate> findByIdMessageSender(Long idMessageSender);
}

