package cn.enilu.guns.dao.system;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.transaction.annotation.Transactional;

import cn.enilu.guns.bean.entity.system.Relation;

/**
 * Created on 2018/3/21 0021.
 *
 * @author enilu
 */
public interface RelationRepository extends PagingAndSortingRepository<Relation, Integer> {
	@Transactional
	@Modifying
	@Query(nativeQuery = true, value = "delete from t_sys_relation where roleid=?1")
	int deleteByRoleId(Integer roleId);
}
