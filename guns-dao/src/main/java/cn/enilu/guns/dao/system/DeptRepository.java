package cn.enilu.guns.dao.system;


import cn.enilu.guns.bean.entity.system.Dept;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

/**
 * Created  on 2018/3/21 0021.
 *
 * @author enilu
 */
public interface DeptRepository extends PagingAndSortingRepository<Dept,Integer> {
    List<Dept> findByPidsLike(String pid);
    @Query(nativeQuery = true,value = "SELECT ID, PID AS pId, SIMPLENAME AS NAME, ( CASE WHEN (pId = 0 OR pId IS NULL) THEN 'true' ELSE 'false' END ) AS isOpen FROM T_SYS_DEPT")
    List tree();

    List<Dept> findBySimplenameLikeOrFullnameLike(String name,String name2);
}
