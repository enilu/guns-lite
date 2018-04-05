package cn.enilu.guns.admin.modular.system.controller;

import cn.enilu.guns.admin.common.annotion.BussinessLog;
import cn.enilu.guns.admin.common.annotion.Permission;
import cn.enilu.guns.admin.common.constant.Const;
import cn.enilu.guns.admin.common.constant.factory.PageFactory;
import cn.enilu.guns.admin.core.base.controller.BaseController;
import cn.enilu.guns.admin.core.util.BeanUtil;
import cn.enilu.guns.admin.modular.system.warpper.LogWarpper;
import cn.enilu.guns.bean.entity.system.LoginLog;
import cn.enilu.guns.dao.system.LoginLogRepository;
import cn.enilu.guns.utils.factory.Page;
import cn.enilu.guns.service.system.LoginLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * 日志管理的控制器
 *
 * @author fengshuonan
 * @Date 2017年4月5日 19:45:36
 */
@Controller
@RequestMapping("/loginLog")
public class LoginLogController extends BaseController {

    private static String PREFIX = "/system/log/";

    @Resource
    private LoginLogRepository loginLogRepository;
    @Autowired
    private LoginLogService loginlogService;

    /**
     * 跳转到日志管理的首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "login_log.html";
    }

    /**
     * 查询登录日志列表
     */
    @RequestMapping("/list")
    @Permission(Const.ADMIN_NAME)
    @ResponseBody
    public Object list(@RequestParam(required = false) String beginTime, @RequestParam(required = false) String endTime, @RequestParam(required = false) String logName) {
        Page<LoginLog> page = new PageFactory<LoginLog>().defaultPage();

        page = loginlogService.getLoginLogs(page, beginTime, endTime, logName);
        page.setRecords((List<LoginLog>) new LogWarpper(BeanUtil.objectsToMaps(page.getRecords())).warp());
        return super.packForBT(page);

    }

    /**
     * 清空日志
     */
    @BussinessLog("清空登录日志")
    @RequestMapping("/delLoginLog")
    @Permission(Const.ADMIN_NAME)
    @ResponseBody
    public Object delLog() {
        loginLogRepository.clear();
        return SUCCESS_TIP;
    }
}
