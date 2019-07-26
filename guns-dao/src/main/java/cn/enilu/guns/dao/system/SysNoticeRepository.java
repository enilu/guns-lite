package cn.enilu.guns.dao.system;

import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;

import cn.enilu.guns.bean.entity.system.Notice;

/**
 * Created on 2018/3/21 0021.
 *
 * @author enilu
 */
public interface SysNoticeRepository extends PagingAndSortingRepository<Notice, Integer> {
	List<Notice> findByTitleLike(String name);
}
