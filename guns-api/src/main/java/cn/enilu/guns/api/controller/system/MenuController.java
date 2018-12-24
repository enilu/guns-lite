package cn.enilu.guns.api.controller.system;

import cn.enilu.guns.api.controller.BaseController;
import cn.enilu.guns.bean.annotion.core.BussinessLog;
import cn.enilu.guns.bean.constant.state.MenuStatus;
import cn.enilu.guns.bean.dictmap.MenuDict;
import cn.enilu.guns.bean.entity.system.Menu;
import cn.enilu.guns.bean.enumeration.BizExceptionEnum;
import cn.enilu.guns.bean.exception.GunsException;
import cn.enilu.guns.bean.vo.front.Rets;
import cn.enilu.guns.bean.vo.node.MenuNode;
import cn.enilu.guns.bean.vo.node.Node;
import cn.enilu.guns.bean.vo.node.ZTreeNode;
import cn.enilu.guns.dao.system.MenuRepository;
import cn.enilu.guns.service.system.LogObjectHolder;
import cn.enilu.guns.service.system.MenuService;
import cn.enilu.guns.service.system.impl.ConstantFactory;
import cn.enilu.guns.utils.Maps;
import cn.enilu.guns.utils.ToolUtil;
import com.alibaba.fastjson.JSON;
import com.google.common.collect.Lists;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * MenuController
 *
 * @author enilu
 * @version 2018/9/12 0012
 */
@RestController
@RequestMapping("/menu")
public class MenuController extends BaseController {

    private Logger logger = LoggerFactory.getLogger(MenuController.class);
    @Autowired
    private MenuRepository menuRepository;
    @Autowired
    private MenuService menuService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public Object list() {
        List<MenuNode> list = menuService.getMenus();
        return Rets.success(list);
    }

    @RequestMapping(method = RequestMethod.POST)
    @BussinessLog(value = "编辑菜单", key = "name", dict = MenuDict.class)
    public Object save(@ModelAttribute Menu menu) {
        logger.info(JSON.toJSONString(menu));

        //判断是否存在该编号
        if(menu.getId()==null) {
            String existedMenuName = ConstantFactory.me().getMenuNameByCode(menu.getCode());
            if (ToolUtil.isNotEmpty(existedMenuName)) {
                throw new GunsException(BizExceptionEnum.EXISTED_THE_MENU);
            }
            menu.setStatus(MenuStatus.ENABLE.getCode());
        }

        //设置父级菜单编号
        menuService.menuSetPcode(menu);

        this.menuRepository.save(menu);
        return Rets.success();
    }

    @RequestMapping(method = RequestMethod.DELETE)
    @BussinessLog(value = "删除菜单", key = "id", dict = MenuDict.class)
    public Object remove(Long id) {
        logger.info("id:{}", id);
        if (ToolUtil.isEmpty(id)) {
            throw new GunsException(BizExceptionEnum.REQUEST_NULL);
        }

        //缓存菜单的名称
        LogObjectHolder.me().set(ConstantFactory.me().getMenuName(id));
        menuService.delMenuContainSubMenus(id);
        return Rets.success();
    }

    /**
     * 获取角色列表
     */
    @RequestMapping(value = "/menuTreeListByRoleId", method = RequestMethod.GET)
    public Object menuTreeListByRoleId(Integer roleId) {
        List<Long> menuIds = this.menuRepository.getMenuIdsByRoleId(roleId);
        List<ZTreeNode> roleTreeList = null;
        if (ToolUtil.isEmpty(menuIds)) {
            roleTreeList = this.menuService.menuTreeList();
        } else {
            roleTreeList = this.menuService.menuTreeListByMenuIds(menuIds);

        }
        List<Node> list = menuService.generateMenuTreeForRole(roleTreeList);
        List<Long> checkedIds = Lists.newArrayList();
        for (ZTreeNode zTreeNode : roleTreeList) {
            if (zTreeNode.getChecked() != null && zTreeNode.getChecked()) {
                checkedIds.add(zTreeNode.getId());
            }
        }
        return Rets.success(Maps.newHashMap("treeData", list, "checkedIds", checkedIds));
    }
}
