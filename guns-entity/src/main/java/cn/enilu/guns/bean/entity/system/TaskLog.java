package cn.enilu.guns.bean.entity.system;


import lombok.Data;

import javax.persistence.*;
import java.util.Date;

/**
 * <p>
 * User: Yao
 * Date: 2017-06-22 11:12:48
 */
@Table(name="t_sys_task_log")
@Entity
@Data
public class TaskLog{
    public static final int EXE_FAILURE_RESULT = 0;
    public static final int EXE_SUCCESS_RESULT = 1;


    @Id
    @GeneratedValue
    private Long id;
    @Column
    private Long idTask;
    @Column(columnDefinition = "VARCHAR(50) COMMENT '任务名'")
    private String name;

    @Column(columnDefinition = "DATETime COMMENT '执行时间'")
    private Date execAt;

    @Column(columnDefinition = "INTEGER COMMENT '执行结果（成功:1、失败:0)'")
    private int execSuccess;

    @Column(columnDefinition = "VARCHAR(500) COMMENT '抛出异常'")
    private String jobException;
}