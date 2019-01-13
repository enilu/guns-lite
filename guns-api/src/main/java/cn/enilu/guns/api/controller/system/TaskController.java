package cn.enilu.guns.api.controller.system;

import cn.enilu.guns.api.controller.BaseController;
import cn.enilu.guns.bean.annotion.core.BussinessLog;
import cn.enilu.guns.bean.constant.factory.PageFactory;
import cn.enilu.guns.bean.dictmap.TaskDict;
import cn.enilu.guns.bean.entity.system.Task;
import cn.enilu.guns.bean.entity.system.TaskLog;
import cn.enilu.guns.bean.vo.front.Rets;
import cn.enilu.guns.dao.system.TaskRepository;
import cn.enilu.guns.service.task.TaskService;
import cn.enilu.guns.utils.StringUtils;
import cn.enilu.guns.utils.factory.Page;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * Created  on 2018/4/9 0009.
 * 系统参数
 * @author enilu
 */
@RestController
@RequestMapping("/task")
public class TaskController extends BaseController {
    private Logger logger = LoggerFactory.getLogger(TaskController.class);
    @Autowired
    private TaskRepository taskRepository;
    @Autowired
    private TaskService taskService;


    /**
     * 获取定时任务管理列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String name) {
        if(StringUtils.isNullOrEmpty(name)) {
            return Rets.success(taskRepository.findAll());
        }else{
            return Rets.success(taskRepository.findByNameLike("%"+name+"%"));
        }
    }

    /**
     * 新增定时任务管理
     */
    @RequestMapping(method = RequestMethod.POST)

    @BussinessLog(value = "编辑定时任务", key = "name",dict = TaskDict.class)
    public Object add(@ModelAttribute Task task,
                      HttpServletRequest request) {
        if(task.getId()==null) {
            taskService.save(task);
        }else{
            Task old = taskService.get(task.getId());
            old.setName(task.getName());
            old.setCron(task.getCron());
            old.setNote(task.getNote());
            old.setData(task.getData());
            taskService.update(old);
        }
        return Rets.success();
    }

    /**
     * 删除定时任务管理
     */
    @RequestMapping(method = RequestMethod.DELETE)

    @BussinessLog(value = "删除定时任务", key = "taskId",dict = TaskDict.class)
    public Object delete(@RequestParam Long id) {
        taskService.delete(id);
        return Rets.success();
    }

    @RequestMapping(value = "/disable",method = RequestMethod.POST)

    @BussinessLog(value = "禁用定时任务", key = "taskId",dict = TaskDict.class)
    public Object disable(@RequestParam Long taskId  ) {
        taskService.disable(taskId);
        return Rets.success();
    }
    @RequestMapping(value = "/enable",method = RequestMethod.POST)
    @BussinessLog(value = "启用定时任务", key = "taskId",dict = TaskDict.class)
    public Object enable(@RequestParam Long taskId  ) {
        taskService.enable(taskId);
        return Rets.success();
    }


    @RequestMapping(value="/logList")
    public Object logList(@Param("taskId") Long taskId) {
        Page<TaskLog> page = new PageFactory<TaskLog>().defaultPage();
        page = taskService.getTaskLogs(page,taskId);
        return Rets.success(page);
    }

}
