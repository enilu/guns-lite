package cn.enilu.guns.dao.system;

import org.springframework.data.repository.PagingAndSortingRepository;

import cn.enilu.guns.bean.entity.system.UserRole;

/**
 * Created on 2018/3/21 0021.
 *
 * @author enilu
 */
public interface UserRoleRepository extends PagingAndSortingRepository<UserRole, Long> {
}
