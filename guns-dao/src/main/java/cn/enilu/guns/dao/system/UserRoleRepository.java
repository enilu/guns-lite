package cn.enilu.guns.dao.system;


import cn.enilu.guns.bean.entity.system.UserRole;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * Created  on 2018/3/21 0021.
 *
 * @author enilu
 */
public interface UserRoleRepository extends PagingAndSortingRepository<UserRole,Long> {
}
