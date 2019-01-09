package cn.enilu.guns.api.controller.system;

import cn.enilu.guns.api.controller.BaseController;
import cn.enilu.guns.bean.annotion.core.BussinessLog;
import cn.enilu.guns.bean.constant.Const;
import cn.enilu.guns.bean.constant.factory.PageFactory;
import cn.enilu.guns.bean.constant.state.ManagerStatus;
import cn.enilu.guns.bean.dictmap.UserDict;
import cn.enilu.guns.bean.dto.UserDto;
import cn.enilu.guns.bean.entity.system.User;
import cn.enilu.guns.bean.enumeration.BizExceptionEnum;
import cn.enilu.guns.bean.exception.GunsException;
import cn.enilu.guns.bean.vo.front.Rets;
import cn.enilu.guns.dao.system.UserRepository;
import cn.enilu.guns.factory.UserFactory;
import cn.enilu.guns.service.system.UserService;
import cn.enilu.guns.utils.BeanUtil;
import cn.enilu.guns.utils.MD5;
import cn.enilu.guns.utils.ToolUtil;
import cn.enilu.guns.utils.factory.Page;
import cn.enilu.guns.warpper.UserWarpper;
import com.alibaba.fastjson.JSON;
import com.google.common.base.Strings;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * UserController
 *
 * @author enilu
 * @version 2018/9/15 0015
 */
@RestController
@RequestMapping("/user")
public class UserController extends BaseController {
    private Logger logger = LoggerFactory.getLogger(MenuController.class);
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private UserService userService;
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public Object list(@RequestParam(required = false) String account,
                       @RequestParam(required = false) String name,
                       @RequestParam(required = false) String beginTime,
                       @RequestParam(required = false) String endTime,
                       @RequestParam(required = false) Integer deptid){
        Map<String,Object> params = new HashMap<>();
        params.put("name",name);
        params.put("beginTime",beginTime);
        params.put("endTime",endTime);
        User user = new User();
        if(!Strings.isNullOrEmpty(name)){
            user.setName(name);
            user.setAccount(name);
        }
        if(deptid!=null&&deptid!=0){
            params.put("deptid",deptid);
        }

        Page page = new PageFactory().defaultPage();

        page = userService.findPage(page, params);
        List list = (List) new UserWarpper(BeanUtil.objectsToMaps(page.getRecords())).warp();
        page.setRecords(list);
        return Rets.success(page);
    }
    @RequestMapping(method = RequestMethod.POST)
    @BussinessLog(value = "编辑管理员", key = "name", dict = UserDict.class)
    public Object save( @Valid UserDto user,BindingResult result){
        logger.info(JSON.toJSONString(user));


        if(user.getId()==null) {
            // 判断账号是否重复
            User theUser = userRepository.findByAccount(user.getAccount());
            if (theUser != null) {
                throw new GunsException(BizExceptionEnum.USER_ALREADY_REG);
            }
            // 完善账号信息
            user.setSalt(ToolUtil.getRandomString(5));
            user.setPassword(MD5.md5(user.getPassword(), user.getSalt()));
            user.setStatus(ManagerStatus.OK.getCode());
            userRepository.save(UserFactory.createUser(user, new User()));
        }else{
            User oldUser = userRepository.findOne(user.getId());
            userRepository.save(UserFactory.updateUser(user,oldUser));
        }
        return Rets.success();
    }

    @BussinessLog(value = "删除管理员", key = "userId", dict = UserDict.class)
    @RequestMapping(method = RequestMethod.DELETE)
    public Object remove(Long userId){
        logger.info("id:{}",userId);
        if (ToolUtil.isEmpty(userId)) {
            throw new GunsException(BizExceptionEnum.REQUEST_NULL);
        }
        User user = userRepository.findOne(userId);
        user.setStatus(ManagerStatus.DELETED.getCode());
        userRepository.save(user);
        return Rets.success();
    }
    @BussinessLog(value="设置用户角色",key="userId",dict=UserDict.class)
    @RequestMapping(value="/setRole",method = RequestMethod.GET)
    public Object setRole(@RequestParam("userId") Long userId, @RequestParam("roleIds") String roleIds) {
        if (ToolUtil.isOneEmpty(userId, roleIds)) {
            throw new GunsException(BizExceptionEnum.REQUEST_NULL);
        }
        //不能修改超级管理员
        if (userId.equals(Const.ADMIN_ID)) {
            throw new GunsException(BizExceptionEnum.CANT_CHANGE_ADMIN);
        }
        User user = userRepository.findOne(userId);
        user.setRoleid(roleIds);
        userRepository.save(user);
        return Rets.success();
    }

}
