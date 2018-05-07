package cn.enilu.guns.dao.system;

import cn.enilu.guns.bean.entity.system.Menu;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

/**
 * Created  on 2018/3/21 0021.
 *
 * @author enilu
 */
public interface MenuRepository extends PagingAndSortingRepository<Menu,Long> {
    Menu findByCode(String code);
    List<Menu> findByPcodesLike(String code);
    List<Menu> findByNameLikeAndLevels(String name,Integer levels);
    @Query(nativeQuery = true,value = "select URL from T_SYS_RELATION rel inner join T_SYS_MENU m on rel.MENUID = m.ID where m.STATUS=1 and  rel.ROLEID = ?1")
    List<String> getResUrlsByRoleId(Integer roleId);
    @Query(nativeQuery = true,value="SELECT m1.ID AS id, m1.ICON AS icon, ( CASE WHEN (m2.ID = 0 OR m2.ID IS NULL) THEN 0 ELSE m2.ID END ) AS parentId, m1. NAME AS NAME, m1.URL AS url, m1.LEVELS AS levels, m1.ISMENU AS ismenu, m1.NUM AS num FROM T_SYS_MENU m1 LEFT JOIN T_SYS_MENU m2 ON m1.PCODE = m2. CODE INNER JOIN ( SELECT ID FROM T_SYS_MENU WHERE ID IN ( SELECT MENUID FROM T_SYS_RELATION rela WHERE rela.ROLEID IN (?1))) m3 ON m1.id = m3.ID WHERE m1.ISMENU = 1 AND m1. STATUS = 1 ORDER BY levels, num ASC")
    List getMenusByRoleIds(List<Integer> roleList);
    @Query(nativeQuery = true,value="select MENUID from T_SYS_RELATION where ROLEID=?1")
    List getMenuIdsByRoleId(Integer roleId);
    @Query(nativeQuery = true,value = "SELECT m1.ID AS id, ( CASE WHEN (m2.ID = 0 OR m2.ID IS NULL) THEN 0 ELSE m2.ID END ) AS pId, m1. NAME AS NAME, ( CASE WHEN (m2.ID = 0 OR m2.ID IS NULL) THEN 'true' ELSE 'false' END ) AS isOpen FROM T_SYS_MENU m1 LEFT JOIN T_SYS_MENU m2 ON m1.PCODE = m2. CODE ORDER BY m1.ID ASC")
    List menuTreeList();
    @Query(nativeQuery = true,value = "SELECT m1.ID AS id, ( CASE WHEN (m2.ID = 0 OR m2.ID IS NULL) THEN 0 ELSE m2.ID END ) AS pId, m1. NAME AS NAME, ( CASE WHEN (m2.ID = 0 OR m2.ID IS NULL) THEN 'true' ELSE 'false' END ) AS isOpen, ( CASE WHEN (m3.ID = 0 OR m3.ID IS NULL) THEN 'false' ELSE 'true' END ) \"checked\" FROM T_SYS_MENU m1 LEFT JOIN T_SYS_MENU m2 ON m1.PCODE = m2. CODE LEFT JOIN ( SELECT ID FROM T_SYS_MENU WHERE ID IN (?1)) m3 ON m1.ID = m3.ID ORDER BY m1.ID ASC")
    List menuTreeListByMenuIds(List<Long> menuIds);

    List<Menu> findByNameLike(String name);

    List<Menu> findByLevels(Integer level);
}
