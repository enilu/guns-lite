package cn.enilu.guns.dao.system;


import cn.enilu.guns.bean.entity.system.Notice;
import cn.enilu.guns.dao.BaseRepository;

import java.util.List;

/**
 * Created  on 2018/3/21 0021.
 *
 * @author enilu
 */
public interface SysNoticeRepository extends BaseRepository<Notice,Long> {
    List<Notice> findByTitleLike(String name);
}
