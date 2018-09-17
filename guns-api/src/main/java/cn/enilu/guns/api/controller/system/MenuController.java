package cn.enilu.guns.api.controller.system;

import cn.enilu.guns.api.controller.BaseController;
import cn.enilu.guns.bean.constant.state.MenuStatus;
import cn.enilu.guns.bean.entity.system.Menu;
import cn.enilu.guns.bean.enumeration.BizExceptionEnum;
import cn.enilu.guns.bean.exception.GunsException;
import cn.enilu.guns.bean.vo.front.Rets;
import cn.enilu.guns.bean.vo.node.MenuNode;
import cn.enilu.guns.dao.system.MenuRepository;
import cn.enilu.guns.service.system.LogObjectHolder;
import cn.enilu.guns.service.system.MenuService;
import cn.enilu.guns.service.system.impl.ConstantFactory;
import cn.enilu.guns.utils.ToolUtil;
import com.alibaba.fastjson.JSON;
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
 * @author zt
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
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public Object list(){
        List<MenuNode> list = menuService.getMenus();
        return Rets.success(list);
    }
    @RequestMapping(method = RequestMethod.POST)
    public Object save(@ModelAttribute  Menu menu){
        logger.info(JSON.toJSONString(menu));
        //判断是否存在该编号
        String existedMenuName = ConstantFactory.me().getMenuNameByCode(menu.getCode());
        if (ToolUtil.isNotEmpty(existedMenuName)) {
            throw new GunsException(BizExceptionEnum.EXISTED_THE_MENU);
        }

        //设置父级菜单编号
        menuService.menuSetPcode(menu);

        menu.setStatus(MenuStatus.ENABLE.getCode());
        this.menuRepository.save(menu);
        return Rets.success();
    }
    @RequestMapping(method = RequestMethod.DELETE)
    public Object remove(Long id){
        logger.info("id:{}",id);
        if (ToolUtil.isEmpty(id)) {
            throw new GunsException(BizExceptionEnum.REQUEST_NULL);
        }

        //缓存菜单的名称
        LogObjectHolder.me().set(ConstantFactory.me().getMenuName(id));
        menuService.delMenuContainSubMenus(id);
        return Rets.success();
    }
}
