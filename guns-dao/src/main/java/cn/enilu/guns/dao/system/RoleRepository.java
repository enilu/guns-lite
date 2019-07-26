package cn.enilu.guns.dao.system;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import cn.enilu.guns.bean.entity.system.Role;

/**
 * Created on 2018/3/21 0021.
 *
 * @author enilu
 */
public interface RoleRepository extends PagingAndSortingRepository<Role, Integer> {
	@Query(nativeQuery = true, value = "SELECT id, pId, NAME, ( CASE WHEN (pId = 0 OR pId IS NULL) THEN 'true' ELSE 'false' END ) OPEN FROM t_sys_role")
	List roleTreeList();

	@Query(nativeQuery = true, value = "SELECT r.id AS id, pId AS pId, NAME AS NAME, ( CASE WHEN (pId = 0 OR pId IS NULL) THEN 'true' ELSE 'false' END ) \"open\", ( CASE WHEN (r1.ID = 0 OR r1.ID IS NULL) THEN 'false' ELSE 'true' END ) AS checked FROM t_sys_role r LEFT JOIN ( SELECT ID FROM t_sys_role WHERE ID IN (?1)) r1 ON r.ID = r1.ID ORDER BY pId, num ASC")
	List roleTreeListByRoleId(Integer[] ids);

	List findByName(String roleName);
}
