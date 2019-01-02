package cn.enilu.guns.service.task;

import cn.enilu.guns.bean.entity.system.Task;
import cn.enilu.guns.bean.exception.GunsException;
import cn.enilu.guns.bean.exception.GunsExceptionEnum;
import cn.enilu.guns.bean.vo.QuartzJob;
import cn.enilu.guns.dao.system.TaskRepository;
import com.alibaba.fastjson.JSON;
import org.apache.commons.lang3.StringUtils;
import org.quartz.*;
import org.quartz.impl.matchers.GroupMatcher;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Service
public class JobServiceImpl implements JobService{

    private static final Logger logger = LoggerFactory.getLogger(JobServiceImpl.class);

    @Autowired
    private Scheduler scheduler;

    @Autowired
    private TaskRepository taskRepository;

    /**
     * 获取单个任务
     *
     * @param jobName
     * @param jobGroup
     * @return
     * @throws SchedulerException
     */
    @Override
    public QuartzJob getJob(String jobName, String jobGroup) throws SchedulerException {
        QuartzJob job = null;
        TriggerKey triggerKey = TriggerKey.triggerKey(jobName, jobGroup);
        Trigger trigger = scheduler.getTrigger(triggerKey);
        if (null != trigger) {
            job = new QuartzJob();
            job.setJobName(jobName);
            job.setJobGroup(jobGroup);
            job.setDescription("触发器:" + trigger.getKey());
            job.setNextTime(trigger.getNextFireTime());
            job.setPreviousTime(trigger.getPreviousFireTime());
            Trigger.TriggerState triggerState = scheduler.getTriggerState(trigger.getKey());
            job.setJobStatus(triggerState.name());
            if (trigger instanceof CronTrigger) {
                CronTrigger cronTrigger = (CronTrigger) trigger;
                String cronExpression = cronTrigger.getCronExpression();
                job.setCronExpression(cronExpression);
            }
        }
        return job;
    }

    /**
     * 获取所有任务
     *
     * @return
     * @throws SchedulerException
     */
    @Override
    public List<QuartzJob> getAllJobs() throws SchedulerException {
        GroupMatcher<JobKey> matcher = GroupMatcher.anyJobGroup();
        Set<JobKey> jobKeys = scheduler.getJobKeys(matcher);
        List<QuartzJob> jobList = new ArrayList<QuartzJob>();
        for (JobKey jobKey : jobKeys) {
            List<? extends Trigger> triggers = scheduler.getTriggersOfJob(jobKey);
            for (Trigger trigger : triggers) {
                QuartzJob job = new QuartzJob();
                job.setJobName(jobKey.getName());
                job.setJobGroup(jobKey.getGroup());
                job.setDescription("触发器:" + trigger.getKey());
                job.setNextTime(trigger.getNextFireTime());
                job.setPreviousTime(trigger.getPreviousFireTime());
                Trigger.TriggerState triggerState = scheduler.getTriggerState(trigger.getKey());
                job.setJobStatus(triggerState.name());
                if (trigger instanceof CronTrigger) {
                    CronTrigger cronTrigger = (CronTrigger) trigger;
                    String cronExpression = cronTrigger.getCronExpression();
                    job.setCronExpression(cronExpression);
                }
                jobList.add(job);
            }
        }
        return jobList;
    }

    /**
     * 所有正在运行的job
     *
     * @return
     * @throws SchedulerException
     */
    @Override
    public List<QuartzJob> getRunningJob() throws SchedulerException {
        List<JobExecutionContext> executingJobs = scheduler.getCurrentlyExecutingJobs();
        List<QuartzJob> jobList = new ArrayList<QuartzJob>(executingJobs.size());
        for (JobExecutionContext executingJob : executingJobs) {
            QuartzJob job = new QuartzJob();
            JobDetail jobDetail = executingJob.getJobDetail();
            JobKey jobKey = jobDetail.getKey();
            Trigger trigger = executingJob.getTrigger();
            job.setJobName(jobKey.getName());
            job.setJobGroup(jobKey.getGroup());
            job.setDescription("触发器:" + trigger.getKey());
            Trigger.TriggerState triggerState = scheduler.getTriggerState(trigger.getKey());
            job.setJobStatus(triggerState.name());
            if (trigger instanceof CronTrigger) {
                CronTrigger cronTrigger = (CronTrigger) trigger;
                String cronExpression = cronTrigger.getCronExpression();
                job.setCronExpression(cronExpression);
            }
            jobList.add(job);
        }
        return jobList;
    }

    /**
     * 查询任务列表
     *
     * @return
     */
    @Override
    public List<QuartzJob> getTaskList() {
        List<Task> tasks = taskRepository.findAllByDisabled(false);
        List<QuartzJob> jobs = new ArrayList<>();
        for (Task task : tasks) {
            jobs.add(getJob(task));
        }
        return jobs;
    }

    @Override
    public QuartzJob getJob(Task task) {
        QuartzJob job = null;
        if (task != null) {
            job = new QuartzJob();
            job.setJobName(String.valueOf(task.getId()));
            job.setJobGroup(task.getJobGroup());
            job.setCronExpression(task.getCron());
            job.setConcurrent(task.isConcurrent());
            job.setJobClass(task.getJobClass());
            job.setDescription(task.getName());
            job.setDisabled(task.isDisabled());
            if (StringUtils.isNotBlank(task.getData())) {
                try {
                    Map<String, Object> dataMap = JSON.parseObject( task.getData(),Map.class);
                    job.setDataMap(dataMap);
                } catch (Exception e) {
                    throw  new GunsException(GunsExceptionEnum.TASK_CONFIG_ERROR);
                }
            }
        }
        return job;
    }

    /**
     * 添加任务
     *
     * @param job
     * @throws SchedulerException
     */
    @Override
    public boolean addJob(QuartzJob job) throws SchedulerException {
        logger.info("新增任务Id：{}, name:{}", job.getJobName(), job.getDescription());
        if (job == null || job.isDisabled()) {
            return false;
        }
        if (!TaskUtils.isValidExpression(job.getCronExpression())) {
            logger.error("时间表达式错误（" + job.getJobName() + "," + job.getJobGroup() + "）," + job.getCronExpression());
            return false;
        } else {
            // 任务名称和任务组设置规则：    // 名称：task_1 ..    // 组 ：group_1 ..
            TriggerKey triggerKey = TriggerKey.triggerKey(job.getJobName(), job.getJobGroup());
            CronTrigger trigger = (CronTrigger) scheduler.getTrigger(triggerKey);
            // 不存在，创建一个
            if (null == trigger) {
                //是否允许并发执行
                Class<? extends Job> clazz = job.isConcurrent() ? BaseJob.class : NoConurrentBaseJob.class;
                JobDetail jobDetail = JobBuilder.newJob(clazz).withIdentity(job.getJobName(), job.getJobGroup()).build();
                jobDetail.getJobDataMap().put("job", job);
                // 表达式调度构建器
                CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(job.getCronExpression());
                // 按新的表达式构建一个新的trigger
                trigger = TriggerBuilder.newTrigger().withIdentity(triggerKey).withSchedule(scheduleBuilder).build();
                scheduler.scheduleJob(jobDetail, trigger);
            } else {     // trigger已存在，则更新相应的定时设置
                CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(job.getCronExpression());
                // 按新的cronExpression表达式重新构建trigger
                trigger = trigger.getTriggerBuilder().withIdentity(triggerKey).withSchedule(scheduleBuilder).build();
                // 按新的trigger重新设置job执行
                scheduler.rescheduleJob(triggerKey, trigger);
            }
        }
        return true;
    }

    /**
     * 暂停任务
     *
     * @param job
     * @return
     */
    @Override
    public boolean pauseJob(QuartzJob job) {
        logger.info("暂停任务：{}", job.getJobName());
        JobKey jobKey = JobKey.jobKey(job.getJobName(), job.getJobGroup());
        try {
            scheduler.pauseJob(jobKey);
            return true;
        } catch (SchedulerException e) {
            logger.error(e.getMessage(), e);
        }
        return false;
    }

    /**
     * 恢复任务
     *
     * @param job
     * @return
     */
    @Override
    public boolean resumeJob(QuartzJob job) {
        logger.info("恢复任务：{}", job.getJobName());
        JobKey jobKey = JobKey.jobKey(job.getJobName(), job.getJobGroup());
        try {
            scheduler.resumeJob(jobKey);
            return true;
        } catch (SchedulerException e) {
            logger.error(e.getMessage(), e);
        }
        return false;
    }

    /**
     * 删除任务
     */
    @Override
    public boolean deleteJob(QuartzJob job) {
        logger.info("删除任务：{}", job.getJobName());
        JobKey jobKey = JobKey.jobKey(job.getJobName(), job.getJobGroup());
        try {
            scheduler.deleteJob(jobKey);
            return true;
        } catch (SchedulerException e) {
            logger.error(e.getMessage(), e);
        }
        return false;
    }

    /**
     * 立即执行一个任务
     *
     * @param job
     * @throws SchedulerException
     */
    @Override
    public void testJob(QuartzJob job) throws SchedulerException {
        JobKey jobKey = JobKey.jobKey(job.getJobName(), job.getJobGroup());
        scheduler.triggerJob(jobKey);
    }

    /**
     * 更新任务时间表达式
     *
     * @param job
     * @throws SchedulerException
     */
    @Override
    public void updateCronExpression(QuartzJob job) throws SchedulerException {
        TriggerKey triggerKey = TriggerKey.triggerKey(job.getJobName(), job.getJobGroup());
        //获取trigger，即在spring配置文件中定义的 bean id="myTrigger"
        CronTrigger trigger = (CronTrigger) scheduler.getTrigger(triggerKey);
        //表达式调度构建器
        CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(job.getCronExpression());
        //按新的cronExpression表达式重新构建trigger
        trigger = trigger.getTriggerBuilder().withIdentity(triggerKey).withSchedule(scheduleBuilder).build();
        //按新的trigger重新设置job执行
        scheduler.rescheduleJob(triggerKey, trigger);
    }
}
