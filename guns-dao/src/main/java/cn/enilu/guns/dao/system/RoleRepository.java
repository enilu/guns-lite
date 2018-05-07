package cn.enilu.guns.dao.system;


import cn.enilu.guns.bean.entity.system.Role;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

/**
 * Created  on 2018/3/21 0021.
 *
 * @author enilu
 */
public interface RoleRepository extends PagingAndSortingRepository<Role,Integer> {
    @Query(nativeQuery = true,value = "SELECT ID, PID, NAME, ( CASE WHEN (PID = 0 OR PID IS NULL) THEN 'true' ELSE 'false' END ) OPEN FROM T_SYS_ROLE")
    List roleTreeList();

    @Query(nativeQuery = true,value="SELECT r.ID AS id, PID AS pId, NAME AS NAME, ( CASE WHEN (pId = 0 OR pId IS NULL) THEN 'true' ELSE 'false' END ) \"open\", ( CASE WHEN (r1.ID = 0 OR r1.ID IS NULL) THEN 'false' ELSE 'true' END ) AS checked FROM T_SYS_ROLE r LEFT JOIN ( SELECT ID FROM T_SYS_ROLE WHERE ID IN (? 1)) r1 ON r.ID = r1.ID ORDER BY pId, num ASC")
    List roleTreeListByRoleId(Integer[] ids);

    List findByName(String roleName);
}
