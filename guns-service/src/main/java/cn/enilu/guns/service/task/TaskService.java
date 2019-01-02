package cn.enilu.guns.service.task;


import cn.enilu.guns.bean.entity.system.Task;
import cn.enilu.guns.bean.entity.system.TaskLog;
import cn.enilu.guns.utils.factory.Page;

/**
 * 任务计划服务
 */
public interface TaskService {

	/**
	 * 新增任务计划
	 *
	 * @param task
	 * @return
	 */
	Task save(Task task);

	/**
	 * 更新任务计划
	 *
	 * @param task
	 * @return
	 */
	boolean update(Task task);

	/**
	 * 更新任务计划配置
	 *
	 * @param task
	 * @return
	 */
	boolean simpleUpdate(Task task);

	/**
	 * 获取任务计划
	 *
	 * @param id
	 * @return
	 */
	Task get(Long id);

	/**
	 * 禁用任务计划
	 *
	 * @param id
	 * @return
	 */
	Task disable(Long id);

	/**
	 * 启用任务计划
	 *
	 * @param id
	 * @return
	 */
	Task enable(Long id);

	/**
	 * 删除任务计划
	 *
	 * @param id
	 * @return
	 */
	Task delete(Long id);

	Page<TaskLog> getTaskLogs(Page<TaskLog> page, Long taskId);
}
