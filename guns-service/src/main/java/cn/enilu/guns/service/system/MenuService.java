package cn.enilu.guns.service.system;


import cn.enilu.guns.bean.entity.system.Menu;
import cn.enilu.guns.bean.vo.node.MenuNode;
import cn.enilu.guns.bean.vo.node.Node;
import cn.enilu.guns.bean.vo.node.ZTreeNode;

import java.util.List;

/**
 * Created  on 2018/3/23 0023.
 *
 * @author enilu
 */
public interface MenuService {

    /**
     * 删除菜单
     *
     * @author stylefeng
     * @Date 2017/5/5 22:20
     */
    void delMenu(Long menuId);

    /**
     * 删除菜单包含所有子菜单
     *
     * @author stylefeng
     * @Date 2017/6/13 22:02
     */
    void delMenuContainSubMenus(Long menuId);

    /**
     * 根据角色列表查询菜单树
     * @param roleList
     * @return
     */
    List<MenuNode> getMenusByRoleIds(List<Integer> roleList);
    List<MenuNode> getMenusTreeByRoleIds(List<Integer> roleList);

    /**
     * 查询菜单树
     */
    List<MenuNode> getMenus();

    List<ZTreeNode> menuTreeList();

    List<ZTreeNode> menuTreeListByMenuIds(List<Long> menuIds);

    /**
     * 设置menu的pcodes
     * @param menu
     */
    void menuSetPcode( Menu menu);


    List<Node> generateMenuTreeForRole(List<ZTreeNode> list);
}
