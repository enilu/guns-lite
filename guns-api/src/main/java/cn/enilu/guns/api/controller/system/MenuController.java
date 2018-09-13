package cn.enilu.guns.api.controller.system;

import cn.enilu.guns.api.controller.BaseController;
import cn.enilu.guns.bean.entity.system.Menu;
import cn.enilu.guns.bean.vo.front.Rets;
import cn.enilu.guns.bean.vo.node.MenuNode;
import cn.enilu.guns.dao.system.MenuRepository;
import cn.enilu.guns.service.system.MenuService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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
    MenuService menuService;
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public Object list(){
        List<MenuNode> list = menuService.getMenus();
        return Rets.success(list);
    }
    @RequestMapping(value = "/",method = RequestMethod.POST)
    public Object save(@ModelAttribute Menu menu){
        logger.info(menu.toString());
        return Rets.success();
    }
    @RequestMapping(value = "/",method = RequestMethod.DELETE)
    public Object delete(Long id){
        logger.info("id:{}",id);
        return Rets.success();
    }
}
