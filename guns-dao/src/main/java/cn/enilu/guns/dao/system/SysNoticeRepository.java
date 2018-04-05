package cn.enilu.guns.dao.system;


import cn.enilu.guns.bean.entity.system.Notice;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

/**
 * Created  on 2018/3/21 0021.
 *
 * @author enilu
 */
public interface SysNoticeRepository extends PagingAndSortingRepository<Notice,Integer> {
    List<Notice> findByTitleLike(String name);
}
