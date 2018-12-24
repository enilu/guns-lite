package cn.enilu.guns.api.controller.system;

import cn.enilu.guns.api.controller.BaseController;
import cn.enilu.guns.bean.constant.factory.PageFactory;
import cn.enilu.guns.bean.constant.state.BizLogType;
import cn.enilu.guns.bean.entity.system.OperationLog;
import cn.enilu.guns.bean.vo.front.Rets;
import cn.enilu.guns.dao.system.OperationLogRepository;
import cn.enilu.guns.service.system.OperationLogService;
import cn.enilu.guns.utils.BeanUtil;
import cn.enilu.guns.utils.factory.Page;
import cn.enilu.guns.warpper.LogWarpper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * LogController
 *
 * @author enilu
 * @version 2018/10/5 0005
 */
@RestController
@RequestMapping("/log")
public class LogController extends BaseController {

    @Resource
    private OperationLogRepository operationLogRepository;
    @Autowired
    private OperationLogService operationLogService;
    /**
     * 查询操作日志列表
     */
    @RequestMapping("/list")
    @ResponseBody
    public Object list(@RequestParam(required = false) String beginTime, @RequestParam(required = false) String endTime, @RequestParam(required = false) String logName, @RequestParam(required = false) Integer logType) {
        Page<OperationLog> page = new PageFactory<OperationLog>().defaultPage();

        page = operationLogService.getOperationLogs(page, beginTime, endTime, logName, BizLogType.valueOf(logType));
        page.setRecords((List<OperationLog>) new LogWarpper(BeanUtil.objectsToMaps(page.getRecords())).warp());
        return Rets.success(page);
    }


    /**
     * 清空日志
     */
    @RequestMapping(method = RequestMethod.DELETE)
    public Object delLog() {
        operationLogRepository.clear();
        return Rets.success();
    }
}
