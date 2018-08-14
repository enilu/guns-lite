package cn.enilu.guns.service.system.impl;

import cn.enilu.guns.bean.vo.node.MenuNode;
import cn.enilu.guns.bean.vo.node.ZTreeNode;
import cn.enilu.guns.bean.entity.system.Menu;
import cn.enilu.guns.dao.system.MenuRepository;
import cn.enilu.guns.service.system.MenuService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created  on 2018/3/23 0023.
 *
 * @author enilu
 */
@Service
public class MenuServiceImpl implements MenuService {
    private Logger logger = LoggerFactory.getLogger(MenuServiceImpl.class);
    @Autowired
    private MenuRepository menuRepository;


    @Override
    public void delMenu(Long menuId) {

        //删除菜单
        this.menuRepository.delete(menuId);
        //删除关联的relation
        this.menuRepository.deleteRelationByMenu(menuId);

    }

    @Override
    public void delMenuContainSubMenus(Long menuId) {
        Menu menu = menuRepository.findOne(menuId);
        //删除所有子菜单
        List<Menu> menus = menuRepository.findByPcodesLike("%[" + menu.getCode() + "]%");
        menuRepository.delete(menus);

        //删除当前菜单
        delMenu(menuId);

    }
    @Override
    public List<MenuNode> getMenusByRoleIds(List<Integer> roleList) {
        List menus = menuRepository.getMenusByRoleIds(roleList);
        List<MenuNode> menuNodes = new ArrayList<>();
        try {
            for(int i=0;i<menus.size();i++){
                Object[] source = (Object[]) menus.get(i);
                MenuNode menuNode = new MenuNode();
                menuNode.setId(Long.valueOf(source[0].toString()));
                menuNode.setIcon(String.valueOf(source[1]));
                menuNode.setParentId(Long.valueOf(source[2].toString()));
                menuNode.setName(String.valueOf(source[3]));
                menuNode.setUrl(String.valueOf(source[4]));
                menuNode.setLevels((Integer) source[5]);
                menuNode.setIsmenu((Integer) source[6]);
                menuNode.setNum((Integer) source[7]);
                menuNodes.add(menuNode);

            }
        }catch (Exception e){
            logger.error(e.getMessage(),e);
        }
        return menuNodes;

    }

    @Override
    public List<ZTreeNode> menuTreeList() {
        List list = menuRepository.menuTreeList();
        List<ZTreeNode> nodes  =new ArrayList<>();
        for(int i=0;i<list.size();i++){
           Object[] source = (Object[]) list.get(i);
            ZTreeNode node = new ZTreeNode();
            node.setId(Long.valueOf(source[0].toString()));
            node.setpId(Long.valueOf(source[1].toString()));
            node.setName(source[2].toString());
            node.setIsOpen(Boolean.valueOf(source[3].toString()));
            nodes.add(node);
        }
        return nodes;
    }

    @Override
    public List<ZTreeNode> menuTreeListByMenuIds(List<Long> menuIds) {
        List list = menuRepository.menuTreeListByMenuIds(menuIds);
        List<ZTreeNode> nodes  =new ArrayList<>();
        for(int i=0;i<list.size();i++){
            Object[] source = (Object[]) list.get(i);
            ZTreeNode node = new ZTreeNode();
            node.setId(Long.valueOf(source[0].toString()));
            node.setpId(Long.valueOf(source[1].toString()));
            node.setName(source[2].toString());
            node.setIsOpen(Boolean.valueOf(source[3].toString()));
            node.setChecked(Boolean.valueOf(source[4].toString()));
            nodes.add(node);
        }
        return nodes;
    }

}
