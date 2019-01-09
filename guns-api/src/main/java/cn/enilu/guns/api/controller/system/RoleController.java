package cn.enilu.guns.api.controller.system;

import cn.enilu.guns.api.controller.BaseController;
import cn.enilu.guns.bean.annotion.core.BussinessLog;
import cn.enilu.guns.bean.constant.Const;
import cn.enilu.guns.bean.dictmap.RoleDict;
import cn.enilu.guns.bean.entity.system.Role;
import cn.enilu.guns.bean.entity.system.User;
import cn.enilu.guns.bean.enumeration.BizExceptionEnum;
import cn.enilu.guns.bean.exception.GunsException;
import cn.enilu.guns.bean.vo.front.Rets;
import cn.enilu.guns.bean.vo.node.Node;
import cn.enilu.guns.bean.vo.node.ZTreeNode;
import cn.enilu.guns.dao.system.RoleRepository;
import cn.enilu.guns.dao.system.UserRepository;
import cn.enilu.guns.service.system.LogObjectHolder;
import cn.enilu.guns.service.system.RoleService;
import cn.enilu.guns.service.system.impl.ConstantFactory;
import cn.enilu.guns.utils.BeanUtil;
import cn.enilu.guns.utils.Convert;
import cn.enilu.guns.utils.Maps;
import cn.enilu.guns.utils.ToolUtil;
import cn.enilu.guns.warpper.RoleWarpper;
import com.alibaba.fastjson.JSON;
import com.google.common.base.Strings;
import com.google.common.collect.Lists;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.util.List;

/**
 * Created by enilu on 18/9/16.
 */
@RestController
@RequestMapping("/role")
public class RoleController extends BaseController {
    private Logger logger = LoggerFactory.getLogger(RoleController.class);
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private RoleService roleService;
    @Autowired
    private UserRepository userRepository;
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
    @BussinessLog(value = "编辑角色", key = "name", dict = RoleDict.class)
    public Object save(@Valid Role role, BindingResult result){
        logger.info(JSON.toJSONString(role));
        if (result.hasErrors()) {
            throw new GunsException(BizExceptionEnum.REQUEST_NULL);
        }
        roleRepository.save(role);
        return Rets.success();
    }
    @RequestMapping(method = RequestMethod.DELETE)
    @BussinessLog(value = "删除角色", key = "roleId", dict = RoleDict.class)
    public Object remove(Long roleId){
        logger.info("id:{}",roleId);
        if (ToolUtil.isEmpty(roleId)) {
            throw new GunsException(BizExceptionEnum.REQUEST_NULL);
        }

        //不能删除超级管理员角色
        if(roleId.equals(Const.ADMIN_ROLE_ID)){
            throw new GunsException(BizExceptionEnum.CANT_DELETE_ADMIN);
        }
        //缓存被删除的角色名称
        LogObjectHolder.me().set(ConstantFactory.me().getSingleRoleName(roleId));
        this.roleService.delRoleById(roleId);
        return Rets.success();
    }

    @RequestMapping(value = "/savePermisson",method = RequestMethod.POST)
    @BussinessLog(value = "配置角色权限", key = "roleId", dict = RoleDict.class)
    public Object setAuthority(Long roleId, String
            permissions) {
        if (ToolUtil.isOneEmpty(roleId)) {
            throw new GunsException(BizExceptionEnum.REQUEST_NULL);
        }
        roleService.setAuthority(roleId, permissions);
        return Rets.success();
    }


    /**
     * 获取角色树
     */
    @RequestMapping(value = "/roleTreeListByIdUser", method = RequestMethod.GET)
    public Object roleTreeListByIdUser(Long idUser) {
        User user = userRepository.findOne(idUser);
        String roleIds = user.getRoleid();
        List<ZTreeNode> roleTreeList = null;
        if (ToolUtil.isEmpty(roleIds)) {
            roleTreeList = roleService.roleTreeList();
        } else {
            Long[] roleArray = Convert.toLongArray(",", roleIds);
            roleTreeList = roleService.roleTreeListByRoleId(roleArray);

        }
        List<Node> list = roleService.generateRoleTree(roleTreeList);
        List<Long> checkedIds = Lists.newArrayList();
        for (ZTreeNode zTreeNode : roleTreeList) {
            if (zTreeNode.getChecked() != null && zTreeNode.getChecked()) {
                checkedIds.add(zTreeNode.getId());
            }
        }
        return Rets.success(Maps.newHashMap("treeData", list, "checkedIds", checkedIds));
    }
}
