package cn.enilu.guns.service.task;


import cn.enilu.guns.bean.entity.system.Task;
import cn.enilu.guns.bean.entity.system.TaskLog;
import cn.enilu.guns.bean.exception.GunsException;
import cn.enilu.guns.bean.exception.GunsExceptionEnum;
import cn.enilu.guns.bean.vo.QuartzJob;
import cn.enilu.guns.bean.vo.query.Page;
import cn.enilu.guns.dao.system.TaskLogRepository;
import cn.enilu.guns.dao.system.TaskRepository;
import cn.enilu.guns.service.BaseService;
import org.quartz.SchedulerException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.List;

/**
 * 任务计划服务
 */
@Service
public class TaskService extends BaseService<Task,Long,TaskRepository> {
	private static final Logger logger = LoggerFactory.getLogger(TaskService.class);
	@Autowired
	private TaskRepository taskRepository;
	@Autowired
	private TaskLogRepository taskLogRepository;
	@Autowired
	private JobService jobService;


	public Task save(Task task) {
		logger.info("新增定时任务%s", task.getName());
		task = taskRepository.save(task);
		try {
			jobService.addJob(jobService.getJob(task));
		} catch (SchedulerException e) {
			logger.error(e.getMessage(), e);
		}
		return task;
	}

	@Override
	public Task update(Task task) {
		logger.info("更新定时任务{}", task.getName());
		taskRepository.save(task);
		try {
			QuartzJob job = jobService.getJob(task.getId().toString(), task.getJobGroup());
			if (job != null) {
				jobService.deleteJob(job);
			}
			jobService.addJob(jobService.getJob(task));
		} catch (SchedulerException e) {
			logger.error(e.getMessage(), e);
		}
		return task;
	}


	public boolean simpleUpdate(Task task) {
		taskRepository.save(task);
		return true;
	}


	public Task disable(Long id) {
		Task task = get(id);
		task.setDisabled(true);
		taskRepository.save(task);
		logger.info("禁用定时任务{}", id.toString());
		try {
			QuartzJob job = jobService.getJob(task.getId().toString(), task.getJobGroup());
			if (job != null) {
				jobService.deleteJob(job);
			}
		} catch (SchedulerException e) {
			logger.error(e.getMessage(), e);
		}
		return task;
	}


	public Task enable(Long id) {
		Task task = get(id);
		task.setDisabled(false);
		taskRepository.save(task);
		logger.info("启用定时任务{}", id.toString());
		try {
			QuartzJob job = jobService.getJob(task.getId().toString(), task.getJobGroup());
			if (job != null) {
				jobService.deleteJob(job);
			}
			if (!task.isDisabled()) {
				jobService.addJob(jobService.getJob(task));
			}
		} catch (SchedulerException e) {
			throw  new GunsException(GunsExceptionEnum.TASK_CONFIG_ERROR);
		}
		return task;
	}

	@Override
	public void delete(Long id) {
		Task task = get(id);
		task.setDisabled(true);
		taskRepository.delete(task);
		logger.info("删除定时任务{}", id.toString());

		try {
			QuartzJob job = jobService.getJob(task);
			if (job != null) {
				jobService.deleteJob(job);
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
	}


	public Page<TaskLog> getTaskLogs(Page<TaskLog> page, Long taskId) {
		Pageable pageable = null;
		if(page.isOpenSort()) {
			pageable = new PageRequest(page.getCurrent()-1, page.getSize(), page.isAsc() ? Sort.Direction.ASC : Sort.Direction.DESC, page.getOrderByField());
		}else{
			pageable = new PageRequest(page.getCurrent()-1,page.getSize(),Sort.Direction.DESC,"id");
		}

		org.springframework.data.domain.Page<TaskLog> taskLogPage = taskLogRepository.findAll(new  Specification<TaskLog>(){

			@Override
			public Predicate toPredicate(Root<TaskLog> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder
					criteriaBuilder) {
				List<Predicate> list = new ArrayList<Predicate>();
				list.add(criteriaBuilder.equal(root.get("idTask").as(Long.class),taskId));
				Predicate[] p = new Predicate[list.size()];
				return criteriaBuilder.and(list.toArray(p));
			}
		},pageable);
		page.setTotal(Integer.valueOf(taskLogPage.getTotalElements()+""));
		page.setRecords(taskLogPage.getContent());
		return page;
	}

	public Object findByNameLike(String name) {
		return taskRepository.findByNameLike(name);
	}
}
