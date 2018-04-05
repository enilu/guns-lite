package cn.enilu.guns.service.system;


import cn.enilu.guns.bean.vo.node.MenuNode;
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
    List<MenuNode> getMenusByRoleIds(List<Integer> roleList);

    List<ZTreeNode> menuTreeList();

    List<ZTreeNode> menuTreeListByMenuIds(List<Long> menuIds);
}
