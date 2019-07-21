package cn.enilu.guns.admin.modular.system.controller;

import cn.enilu.guns.admin.core.base.controller.BaseController;
import cn.enilu.guns.bean.annotion.core.BussinessLog;
import cn.enilu.guns.bean.constant.factory.PageFactory;
import cn.enilu.guns.bean.dictmap.TaskDict;
import cn.enilu.guns.bean.entity.system.Task;
import cn.enilu.guns.bean.entity.system.TaskLog;
import cn.enilu.guns.bean.vo.query.Page;
import cn.enilu.guns.service.task.TaskService;
import cn.enilu.guns.utils.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created  on 2018/4/9 0009.
 * 系统参数
 * @author enilu
 */
@Controller
@RequestMapping("/task")
public class TaskController extends BaseController {
    private Logger logger = LoggerFactory.getLogger(TaskController.class);

    @Autowired
    private TaskService taskService;
     private String PREFIX = "/system/task/";
    /**
     * 跳转到定时任务管理首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "task.html";
    }

    /**
     * 跳转到添加定时任务管理
     */
    @RequestMapping("/task_add")
    public String orgAdd() {
        return PREFIX + "task_add.html";
    }

    /**
     * 跳转到修改定时任务管理
     */
    @RequestMapping("/task_update/{taskId}")
    public String orgUpdate(@PathVariable Long taskId, Model model) {
        Task task = taskService.get(taskId);
        model.addAttribute("item",task);
        return PREFIX + "task_edit.html";
    }

    /**
     * 获取定时任务管理列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
        if(StringUtils.isNullOrEmpty(condition)) {
            return taskService.queryAll();
        }else{
            return taskService.findByNameLike("%"+condition+"%");
        }
    }

    /**
     * 新增定时任务管理
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    @BussinessLog(value = "添加定时任务", key = "name",dict = TaskDict.class)
    public Object add(Task task) {
        taskService.save(task);
        return SUCCESS_TIP;
    }

    /**
     * 删除定时任务管理
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    @BussinessLog(value = "删除定时任务", key = "taskId",dict = TaskDict.class)
    public Object delete(@RequestParam Long taskId) {
        taskService.delete(taskId);
        return SUCCESS_TIP;
    }

    @RequestMapping("/disable")
    @ResponseBody
    @BussinessLog(value = "禁用定时任务", key = "taskId",dict = TaskDict.class)
    public Object disable(@RequestParam Long taskId  ) {
        taskService.disable(taskId);
        return SUCCESS_TIP;
    }
    @RequestMapping("/enable")
    @ResponseBody
    @BussinessLog(value = "启用定时任务", key = "taskId",dict = TaskDict.class)
    public Object enable(@RequestParam Long taskId  ) {
        taskService.enable(taskId);
        return SUCCESS_TIP;
    }

    /**
     * 修改定时任务管理
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    @BussinessLog(value = "编辑定时任务", key = "name",dict = TaskDict.class)
    public Object update(Task task) {

        Task old = taskService.get(task.getId());
        old.setName(task.getName());
        old.setCron(task.getCron());
        old.setNote(task.getNote());
        old.setData(task.getData());
        taskService.update(old);
         return SUCCESS_TIP;
    }

    /**
     * 定时任务管理详情
     */
    @RequestMapping(value = "/detail/{taskId}")
    @ResponseBody
    public Object detail(@PathVariable("taskId") Long taskId) {
        return taskService.get(taskId);
    }

    @RequestMapping(value = "/viewLog/{taskId}")
    public String viewLog(@PathVariable("taskId") Long taskId,Model model) {
        model.addAttribute("taskId",taskId);
       return PREFIX+"task_log.html";
    }

    @RequestMapping(value="/logList/{taskId}")
    @ResponseBody
    public Object listList(@PathVariable("taskId") Long taskId) {
        Page<TaskLog> page = new PageFactory<TaskLog>().defaultPage();

        page = taskService.getTaskLogs(page,taskId);
        return super.packForBT(page);
    }

}
