package cn.enilu.guns.dao.system;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import cn.enilu.guns.bean.entity.system.Dept;

/**
 * Created on 2018/3/21 0021.
 *
 * @author enilu
 */
public interface DeptRepository extends PagingAndSortingRepository<Dept, Integer> {
	List<Dept> findByPidsLike(String pid);

	@Query(nativeQuery = true, value = "SELECT id, pid AS pId, simplename AS NAME, ( CASE WHEN (pId = 0 OR pId IS NULL) THEN 'true' ELSE 'false' END ) AS isOpen FROM t_sys_dept")
	List tree();

	List<Dept> findBySimplenameLikeOrFullnameLike(String name, String name2);
}
