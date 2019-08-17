package cn.enilu.guns.admin.modular.system.controller;

import cn.enilu.guns.admin.config.properties.GunsProperties;
import cn.enilu.guns.admin.core.base.controller.BaseController;
import cn.enilu.guns.admin.core.base.tips.Tip;
import cn.enilu.guns.bean.annotion.core.BussinessLog;
import cn.enilu.guns.bean.annotion.core.Permission;
import cn.enilu.guns.bean.constant.Const;
import cn.enilu.guns.bean.constant.state.ManagerStatus;
import cn.enilu.guns.bean.core.ShiroUser;
import cn.enilu.guns.bean.dictmap.UserDict;
import cn.enilu.guns.bean.dto.UserDto;
import cn.enilu.guns.bean.entity.system.User;
import cn.enilu.guns.bean.enumeration.BizExceptionEnum;
import cn.enilu.guns.bean.exception.GunsException;
import cn.enilu.guns.factory.UserFactory;
import cn.enilu.guns.service.system.LogObjectHolder;
import cn.enilu.guns.service.system.UserService;
import cn.enilu.guns.service.system.impl.ConstantFactory;
import cn.enilu.guns.shiro.ShiroKit;
import cn.enilu.guns.utils.BeanUtil;
import cn.enilu.guns.utils.MD5;
import cn.enilu.guns.utils.ToolUtil;
import cn.enilu.guns.warpper.UserWarpper;
import com.google.common.base.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.naming.NoPermissionException;
import javax.validation.Valid;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * 系统管理员控制器
 *
 * @author fengshuonan
 * @Date 2017年1月11日 下午1:08:17
 */
@Controller
@RequestMapping("/mgr")
public class UserMgrController extends BaseController {

    private static String PREFIX = "/system/user/";

    @Resource
    private GunsProperties gunsProperties;

    @Autowired
    private UserService userService;

    /**
     * 跳转到查看管理员列表的页面
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "user.html";
    }

    /**
     * 跳转到查看管理员列表的页面
     */
    @RequestMapping("/user_add")
    public String addView() {
        return PREFIX + "user_add.html";
    }

    /**
     * 跳转到角色分配页面
     */
    @Permission
    @RequestMapping("/role_assign/{userId}")
    public String roleAssign(@PathVariable Long userId, Model model) {
        if (ToolUtil.isEmpty(userId)) {
            throw new GunsException(BizExceptionEnum.REQUEST_NULL);
        }

        User user = userService.get(userId);
        model.addAttribute("userId", userId);
        model.addAttribute("userAccount", user.getAccount());
        return PREFIX + "user_roleassign.html";
    }

    /**
     * 跳转到编辑管理员页面
     */
    @Permission
    @RequestMapping("/user_edit/{userId}")
    public String userEdit(@PathVariable Long userId, Model model) {
        if (ToolUtil.isEmpty(userId)) {
            throw new GunsException(BizExceptionEnum.REQUEST_NULL);
        }
        assertAuth(userId);
        User user = userService.get(userId);
        model.addAttribute(user);
        model.addAttribute("roleName", ConstantFactory.me().getRoleName(user.getRoleid()));
        model.addAttribute("deptName", ConstantFactory.me().getDeptName(user.getDeptid()));

        LogObjectHolder.me().set(user);
        return PREFIX + "user_edit.html";
    }

    /**
     * 跳转到查看用户详情页面
     */
    @RequestMapping("/user_info")
    public String userInfo(Model model) {
        Long userId = ShiroKit.getUser().getId();
        if (ToolUtil.isEmpty(userId)) {
            throw new GunsException(BizExceptionEnum.REQUEST_NULL);
        }
        User user = userService.get(userId);
        model.addAttribute(user);
        model.addAttribute("roleName", ConstantFactory.me().getRoleName(user.getRoleid()));
        model.addAttribute("deptName", ConstantFactory.me().getDeptName(user.getDeptid()));
        LogObjectHolder.me().set(user);
        return PREFIX + "user_view.html";
    }

    /**
     * 跳转到修改密码界面
     */
    @RequestMapping("/user_chpwd")
    public String chPwd() {
        return PREFIX + "user_chpwd.html";
    }

    /**
     * 修改当前用户的密码
     */
    @RequestMapping("/changePwd")
    @ResponseBody
    public Object changePwd(@RequestParam String oldPwd, @RequestParam String newPwd, @RequestParam String rePwd) {
        if (!newPwd.equals(rePwd)) {
            throw new GunsException(BizExceptionEnum.TWO_PWD_NOT_MATCH);
        }
        Long userId = ShiroKit.getUser().getId();
        User user = userService.get(userId);
        String oldMd5 = MD5.md5(oldPwd, user.getSalt());
        if (user.getPassword().equals(oldMd5)) {
            String newMd5 = MD5.md5(newPwd, user.getSalt());
            user.setPassword(newMd5);
          userService.saveOrUpdate(user);
            return SUCCESS_TIP;
        } else {
            throw new GunsException(BizExceptionEnum.OLD_PWD_NOT_RIGHT);
        }
    }

    /**
     * 查询管理员列表
     */
    @RequestMapping("/list")
    @Permission
    @ResponseBody
    public Object list(@RequestParam(required = false) String name, @RequestParam(required = false) String beginTime, @RequestParam(required = false) String endTime, @RequestParam(required = false) Integer deptid) {
        Map<String,Object> params = new HashMap<>();
        params.put("name",name);
        params.put("beginTime",beginTime);
        params.put("endTime",endTime);
        if (ShiroKit.isAdmin()) {
            User user = new User();
            if(!Strings.isNullOrEmpty(name)){
                user.setName(name);
                user.setAccount(name);
            }
            if(deptid!=null&&deptid!=0){
               params.put("deptid",deptid);
            }

            List<User> users = userService.findAll(params);
            return new UserWarpper(BeanUtil.objectsToMaps(users)).warp();
        } else {
            params.put("deptid",deptid);
            List<User> users = userService.findAll(params);

            return new UserWarpper(BeanUtil.objectsToMaps(users)).warp();
        }
    }

    /**
     * 添加管理员
     */
    @RequestMapping("/add")
    @BussinessLog(value = "添加管理员", key = "account", dict = UserDict.class)
    @Permission(Const.ADMIN_NAME)
    @ResponseBody
    public Tip add(@Valid UserDto user, BindingResult result) {
        if (result.hasErrors()) {
            throw new GunsException(BizExceptionEnum.REQUEST_NULL);
        }

        // 判断账号是否重复
        User theUser = userService.findByAccount(user.getAccount());
        if (theUser != null) {
            throw new GunsException(BizExceptionEnum.USER_ALREADY_REG);
        }

        // 完善账号信息
        user.setSalt(ToolUtil.getRandomString(5));
        user.setPassword(MD5.md5(user.getPassword(), user.getSalt()));
        user.setStatus(ManagerStatus.OK.getCode());

        this.userService.insert(UserFactory.createUser(user,new User()));
        return SUCCESS_TIP;
    }

    /**
     * 修改管理员
     *
     * @throws NoPermissionException
     */
    @RequestMapping("/edit")
    @BussinessLog(value = "修改管理员", key = "account", dict = UserDict.class)
    @ResponseBody
    public Tip edit(@Valid UserDto user, BindingResult result) throws NoPermissionException {
        if (result.hasErrors()) {
            throw new GunsException(BizExceptionEnum.REQUEST_NULL);
        }
        User oldUser = userService.get(user.getId());
        if (ShiroKit.hasRole(Const.ADMIN_NAME)) {
            userService.update(UserFactory.updateUser(user,oldUser));
            return SUCCESS_TIP;
        } else {
            assertAuth(user.getId());
            ShiroUser shiroUser = ShiroKit.getUser();
            if (shiroUser.getId().equals(user.getId())) {
                userService.update(UserFactory.updateUser(user,oldUser));
                return SUCCESS_TIP;
            } else {
                throw new GunsException(BizExceptionEnum.NO_PERMITION);
            }
        }
    }

    /**
     * 删除管理员（逻辑删除）
     */
    @RequestMapping("/delete")
    @BussinessLog(value = "删除管理员", key = "userId", dict = UserDict.class)
    @Permission
    @ResponseBody
    public Tip delete(@RequestParam Long userId) {
        if (ToolUtil.isEmpty(userId)) {
            throw new GunsException(BizExceptionEnum.REQUEST_NULL);
        }
        //不能删除超级管理员
        if (userId.equals(Const.ADMIN_ID)) {
            throw new GunsException(BizExceptionEnum.CANT_DELETE_ADMIN);
        }
        assertAuth(userId);
        User user = userService.get(userId);
        user.setStatus(ManagerStatus.DELETED.getCode());
        userService.update(user);
        return SUCCESS_TIP;
    }

    /**
     * 查看管理员详情
     */
    @RequestMapping("/view/{userId}")
    @ResponseBody
    public User view(@PathVariable Long userId) {
        if (ToolUtil.isEmpty(userId)) {
            throw new GunsException(BizExceptionEnum.REQUEST_NULL);
        }
        assertAuth(userId);
        return userService.get(userId);
    }

    /**
     * 重置管理员的密码
     */
    @RequestMapping("/reset")
    @BussinessLog(value = "重置管理员密码", key = "userId", dict = UserDict.class)
    @Permission(Const.ADMIN_NAME)
    @ResponseBody
    public Tip reset(@RequestParam Long userId) {
        if (ToolUtil.isEmpty(userId)) {
            throw new GunsException(BizExceptionEnum.REQUEST_NULL);
        }
        assertAuth(userId);
        User user = userService.get(userId);
        user.setSalt(ToolUtil.getRandomString(5));
        user.setPassword(MD5.md5(Const.DEFAULT_PWD, user.getSalt()));
        userService.update(user);
        return SUCCESS_TIP;
    }

    /**
     * 冻结用户
     */
    @RequestMapping("/freeze")
    @BussinessLog(value = "冻结用户", key = "userId", dict = UserDict.class)
    @Permission(Const.ADMIN_NAME)
    @ResponseBody
    public Tip freeze(@RequestParam Long userId) {
        if (ToolUtil.isEmpty(userId)) {
            throw new GunsException(BizExceptionEnum.REQUEST_NULL);
        }
        //不能冻结超级管理员
        if (userId.equals(Const.ADMIN_ID)) {
            throw new GunsException(BizExceptionEnum.CANT_FREEZE_ADMIN);
        }
        assertAuth(userId);
        User user = userService.get(userId);
        user.setStatus(ManagerStatus.FREEZED.getCode());
        userService.update(user);
        return SUCCESS_TIP;
    }

    /**
     * 解除冻结用户
     */
    @RequestMapping("/unfreeze")
    @BussinessLog(value = "解除冻结用户", key = "userId", dict = UserDict.class)
    @Permission(Const.ADMIN_NAME)
    @ResponseBody
    public Tip unfreeze(@RequestParam Long userId) {
        if (ToolUtil.isEmpty(userId)) {
            throw new GunsException(BizExceptionEnum.REQUEST_NULL);
        }
        assertAuth(userId);
        User user = userService.get(userId);
        user.setStatus(ManagerStatus.OK.getCode());
        userService.update(user);
        return SUCCESS_TIP;
    }

    /**
     * 分配角色
     */
    @RequestMapping("/setRole")
    @BussinessLog(value = "分配角色", key = "userId", dict = UserDict.class)
    @Permission(Const.ADMIN_NAME)
    @ResponseBody
    public Tip setRole(@RequestParam("userId") Long userId, @RequestParam("roleIds") String roleIds) {
        if (ToolUtil.isOneEmpty(userId, roleIds)) {
            throw new GunsException(BizExceptionEnum.REQUEST_NULL);
        }
        //不能修改超级管理员
        if (userId.equals(Const.ADMIN_ID)) {
            throw new GunsException(BizExceptionEnum.CANT_CHANGE_ADMIN);
        }
        assertAuth(userId);
        User user = userService.get(userId);
        user.setRoleid(roleIds);
        userService.update(user);
        return SUCCESS_TIP;
    }

    /**
     * 上传图片(上传到项目的webapp/static/img)
     */
    @RequestMapping(method = RequestMethod.POST, path = "/upload")
    @ResponseBody
    public String upload(@RequestPart("file") MultipartFile picture) {
        String pictureName = UUID.randomUUID().toString() + ".jpg";
        try {
            String fileSavePath = gunsProperties.getFileUploadPath();
            picture.transferTo(new File(fileSavePath + pictureName));
        } catch (Exception e) {
            throw new GunsException(BizExceptionEnum.UPLOAD_ERROR);
        }
        return pictureName;
    }

    /**
     * 判断当前登录的用户是否有操作这个用户的权限
     */
    private void assertAuth(Long userId) {
        if (ShiroKit.isAdmin()) {
            return;
        }
        List<Long> deptDataScope = ShiroKit.getDeptDataScope();
        User user = userService.get(userId);
        Long deptid = user.getDeptid();
        if (deptDataScope.contains(deptid)) {
            return;
        } else {
            throw new GunsException(BizExceptionEnum.NO_PERMITION);
        }

    }
}
