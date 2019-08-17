package cn.enilu.guns.admin.modular.system.controller;

import cn.enilu.guns.admin.core.base.controller.BaseController;
import cn.enilu.guns.bean.annotion.core.BussinessLog;
import cn.enilu.guns.bean.annotion.core.Permission;
import cn.enilu.guns.bean.constant.Const;
import cn.enilu.guns.bean.constant.factory.PageFactory;
import cn.enilu.guns.bean.entity.system.LoginLog;
import cn.enilu.guns.bean.vo.query.Page;
import cn.enilu.guns.bean.vo.query.SearchFilter;
import cn.enilu.guns.service.system.LoginLogService;
import cn.enilu.guns.utils.BeanUtil;
import cn.enilu.guns.utils.StringUtils;
import cn.enilu.guns.warpper.LogWarpper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
        if(StringUtils.isNotEmpty(beginTime)){
            page.addFilter(SearchFilter.build("createtime", SearchFilter.Operator.GTE, beginTime));
        }
        if(StringUtils.isNotEmpty(endTime)){
            page.addFilter(SearchFilter.build("createtime", SearchFilter.Operator.LTE, endTime));
        }

        if(StringUtils.isNotEmpty(logName)){
            page.addFilter(SearchFilter.build("logname", SearchFilter.Operator.LIKE, logName));
        }

        page = loginlogService.queryPage(page);
//        page = loginlogService.getLoginLogs(page, beginTime, endTime, logName);
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
        loginlogService.clear();
        return SUCCESS_TIP;
    }
}
