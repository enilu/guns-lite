package cn.enilu.guns.api.controller.system;

import cn.enilu.guns.api.controller.BaseController;
import cn.enilu.guns.bean.entity.system.Dept;
import cn.enilu.guns.bean.enumeration.BizExceptionEnum;
import cn.enilu.guns.bean.exception.GunsException;
import cn.enilu.guns.bean.vo.front.Rets;
import cn.enilu.guns.bean.vo.node.DeptNode;
import cn.enilu.guns.dao.system.DeptRepository;
import cn.enilu.guns.service.system.DeptService;
import cn.enilu.guns.service.system.LogObjectHolder;
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
 * DeptContoller
 *
 * @author zt
 * @version 2018/9/15 0015
 */
@RestController
@RequestMapping("/dept")
public class DeptContoller extends BaseController {
    private Logger logger = LoggerFactory.getLogger(MenuController.class);
    @Autowired
    private DeptRepository deptRepository;
    @Autowired
    private DeptService deptService;
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public Object list(){
        List<DeptNode> list = deptService.queryAll();
        return Rets.success(list);
    }
    @RequestMapping(method = RequestMethod.POST)
    public Object save(@ModelAttribute Dept dept){
        logger.info(JSON.toJSONString(dept));
        if (ToolUtil.isOneEmpty(dept, dept.getSimplename())) {
            throw new GunsException(BizExceptionEnum.REQUEST_NULL);
        }

        //完善pids,根据pid拿到pid的pids
        deptService.deptSetPids(dept);
        deptRepository.save(dept);
        return Rets.success();
    }
    @RequestMapping(method = RequestMethod.DELETE)
    public Object delete(Integer id){
        logger.info("id:{}",id);
        if (ToolUtil.isEmpty(id)) {
            throw new GunsException(BizExceptionEnum.REQUEST_NULL);
        }
        LogObjectHolder.me().set(ConstantFactory.me().getDeptName(id));
        deptService.deleteDept(id);
        return Rets.success();
    }
}
