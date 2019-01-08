package cn.enilu.guns.admin.modular.system.controller;

import cn.enilu.guns.admin.core.base.controller.BaseController;
import cn.enilu.guns.bean.constant.factory.PageFactory;
import cn.enilu.guns.bean.entity.system.Task;
import cn.enilu.guns.bean.entity.system.TaskLog;
import cn.enilu.guns.dao.system.TaskRepository;
import cn.enilu.guns.service.task.TaskService;
import cn.enilu.guns.utils.StringUtils;
import cn.enilu.guns.utils.factory.Page;
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
    private TaskRepository taskRepository;
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
        Task task = taskRepository.findOne(taskId);
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
            return taskRepository.findAll();
        }else{
            return taskRepository.findByNameLike("%"+condition+"%");
        }
    }

    /**
     * 新增定时任务管理
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(Task task) {
        taskService.save(task);
        return SUCCESS_TIP;
    }

    /**
     * 删除定时任务管理
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Long taskId) {
        taskService.delete(taskId);
        return SUCCESS_TIP;
    }

    @RequestMapping("/disable/{taskId}")
    @ResponseBody
    public Object disable(@PathVariable Long taskId  ) {
        taskService.disable(taskId);
        return SUCCESS_TIP;
    }
    @RequestMapping("/enable/{taskId}")
    @ResponseBody
    public Object enable(@PathVariable Long taskId  ) {
        taskService.enable(taskId);
        return SUCCESS_TIP;
    }

    /**
     * 修改定时任务管理
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(Task task) {

        Task old = taskRepository.findOne(task.getId());
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
        return taskRepository.findOne(taskId);
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
