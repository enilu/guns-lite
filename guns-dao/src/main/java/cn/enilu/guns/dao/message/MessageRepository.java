package cn.enilu.guns.dao.message;


import cn.enilu.guns.bean.entity.message.Message;
import cn.enilu.guns.dao.BaseRepository;

import java.util.ArrayList;


public interface MessageRepository extends BaseRepository<Message,Long> {
    void deleteAllByIdIn(ArrayList<String> list);
}

