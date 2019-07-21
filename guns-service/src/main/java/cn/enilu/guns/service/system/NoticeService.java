package cn.enilu.guns.service.system;

import cn.enilu.guns.bean.entity.system.Notice;
import cn.enilu.guns.dao.system.SysNoticeRepository;
import cn.enilu.guns.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author ：enilu
 * @date ：Created in 2019/7/21 21:29
 */
@Service
public class NoticeService extends BaseService<Notice,Long, SysNoticeRepository> {
    @Autowired
    private SysNoticeRepository sysNoticeRepository;
    public List<Notice> findByTitleLike(String title) {
        return sysNoticeRepository.findByTitleLike(title);
    }
}
