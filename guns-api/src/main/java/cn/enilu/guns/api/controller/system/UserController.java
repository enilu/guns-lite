package cn.enilu.guns.api.controller.system;

import cn.enilu.guns.api.controller.BaseController;
import cn.enilu.guns.bean.entity.system.User;
import cn.enilu.guns.bean.enumeration.BizExceptionEnum;
import cn.enilu.guns.bean.exception.GunsException;
import cn.enilu.guns.bean.vo.front.Rets;
import cn.enilu.guns.dao.system.UserRepository;
import cn.enilu.guns.service.system.LogObjectHolder;
import cn.enilu.guns.service.system.UserService;
import cn.enilu.guns.service.system.impl.ConstantFactory;
import cn.enilu.guns.utils.BeanUtil;
import cn.enilu.guns.utils.ToolUtil;
import cn.enilu.guns.warpper.UserWarpper;
import com.alibaba.fastjson.JSON;
import com.google.common.base.Strings;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * UserController
 *
 * @author zt
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
        List<User> users = userService.findAll(params);
        return Rets.success(new UserWarpper(BeanUtil.objectsToMaps(users)).warp());
    }
    @RequestMapping(method = RequestMethod.POST)
    public Object save(@ModelAttribute User user){
        logger.info(JSON.toJSONString(user));

//        userRepository.save(user);
        return Rets.success();
    }
    @RequestMapping(method = RequestMethod.DELETE)
    public Object delete(Integer id){
        logger.info("id:{}",id);
        if (ToolUtil.isEmpty(id)) {
            throw new GunsException(BizExceptionEnum.REQUEST_NULL);
        }
        LogObjectHolder.me().set(ConstantFactory.me().getDeptName(id));

        return Rets.success();
    }
}
