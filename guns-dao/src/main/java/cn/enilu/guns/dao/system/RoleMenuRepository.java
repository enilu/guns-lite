package cn.enilu.guns.dao.system;

import org.springframework.data.repository.PagingAndSortingRepository;

import cn.enilu.guns.bean.entity.system.RoleMenu;

/**
 * Created on 2018/3/21 0021.
 *
 * @author enilu
 */
public interface RoleMenuRepository extends PagingAndSortingRepository<RoleMenu, Long> {
}
