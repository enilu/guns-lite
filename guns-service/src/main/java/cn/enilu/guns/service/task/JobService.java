package cn.enilu.guns.service.task;

import cn.enilu.guns.bean.entity.system.Task;
import cn.enilu.guns.bean.vo.QuartzJob;
import org.quartz.SchedulerException;

import java.util.List;

/**
 * 任务服务
 */
public interface JobService {
    /**
     * 获取单个任务
     *
     * @param jobName
     * @param jobGroup
     * @return
     * @throws SchedulerException
     */
    QuartzJob getJob(String jobName, String jobGroup) throws SchedulerException;

    /**
     * 获取所有任务
     *
     * @return
     * @throws SchedulerException
     */
    List<QuartzJob> getAllJobs() throws SchedulerException;

    /**
     * 所有正在运行的job
     *
     * @return
     * @throws SchedulerException
     */
    List<QuartzJob> getRunningJob() throws SchedulerException;

    /**
     * 查询任务列表
     *
     * @return
     */
    List<QuartzJob> getTaskList();

    QuartzJob getJob(Task task);

    /**
     * 添加任务
     *
     * @param job
     * @throws SchedulerException
     */
    boolean addJob(QuartzJob job) throws SchedulerException;

    /**
     * 暂停任务
     *
     * @param job
     * @return
     */
    boolean pauseJob(QuartzJob job);

    /**
     * 恢复任务
     *
     * @param job
     * @return
     */
    boolean resumeJob(QuartzJob job);

    /**
     * 删除任务
     */
    boolean deleteJob(QuartzJob job);

    /**
     * 立即执行一个任务
     *
     * @param job
     * @throws SchedulerException
     */
    void testJob(QuartzJob job) throws SchedulerException;

    /**
     * 更新任务时间表达式
     *
     * @param job
     * @throws SchedulerException
     */
    void updateCronExpression(QuartzJob job) throws SchedulerException;

}
