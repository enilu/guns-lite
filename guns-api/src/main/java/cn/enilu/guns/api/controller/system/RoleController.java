package cn.enilu.guns.api.controller.system;

import cn.enilu.guns.api.controller.BaseController;
import cn.enilu.guns.bean.constant.Const;
import cn.enilu.guns.bean.constant.cache.Cache;
import cn.enilu.guns.bean.constant.state.MenuStatus;
import cn.enilu.guns.bean.entity.system.Menu;
import cn.enilu.guns.bean.entity.system.Role;
import cn.enilu.guns.bean.enumeration.BizExceptionEnum;
import cn.enilu.guns.bean.exception.GunsException;
import cn.enilu.guns.bean.vo.front.Rets;
import cn.enilu.guns.dao.system.RoleRepository;
import cn.enilu.guns.service.system.LogObjectHolder;
import cn.enilu.guns.service.system.RoleService;
import cn.enilu.guns.service.system.impl.ConstantFactory;
import cn.enilu.guns.utils.BeanUtil;
import cn.enilu.guns.utils.ToolUtil;
import cn.enilu.guns.warpper.RoleWarpper;
import com.alibaba.fastjson.JSON;
import com.google.common.base.Strings;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

/**
 * Created by maggie on 18/9/16.
 */
@RestController
@RequestMapping("/role")
public class RoleController extends BaseController {
    private Logger logger = LoggerFactory.getLogger(RoleController.class);
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private RoleService roleService;
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public Object list(String name){
        logger.info("role:{}",name);
        List roles = null;
        if(Strings.isNullOrEmpty(name)) {
            roles = (List) roleRepository.findAll();
        }else{
            roles = roleRepository.findByName(name);
        }
        return Rets.success(new RoleWarpper(BeanUtil.objectsToMaps(roles)).warp());
    }

    @RequestMapping(method = RequestMethod.POST)
    public Object save(@Valid Role role, BindingResult result){
        logger.info(JSON.toJSONString(role));
        if (result.hasErrors()) {
            throw new GunsException(BizExceptionEnum.REQUEST_NULL);
        }
        roleRepository.save(role);
        return Rets.success();
    }
    @RequestMapping(method = RequestMethod.DELETE)
    public Object remove(Integer id){
        logger.info("id:{}",id);
        if (ToolUtil.isEmpty(id)) {
            throw new GunsException(BizExceptionEnum.REQUEST_NULL);
        }

        //不能删除超级管理员角色
        if(id.equals(Const.ADMIN_ROLE_ID)){
            throw new GunsException(BizExceptionEnum.CANT_DELETE_ADMIN);
        }
        //缓存被删除的角色名称
        LogObjectHolder.me().set(ConstantFactory.me().getSingleRoleName(id));
        this.roleService.delRoleById(id);
        return Rets.success();
    }
}
