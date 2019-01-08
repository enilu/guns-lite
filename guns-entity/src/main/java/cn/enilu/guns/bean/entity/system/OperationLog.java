package cn.enilu.guns.bean.entity.system;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

/**
 * Created  on 2018/4/2 0002.
 *
 * @author enilu
 */
@Entity
@Table(name = "t_sys_operation_log")
@Data
public class OperationLog {

    @Id
    @GeneratedValue
    private Long id;
    @Column
    private String logtype;
    @Column
    private String logname;
    @Column
    private Integer userid;
    @Column
    private String classname;
    @Column
    private String method;
    @Column(name="create_time")
    private Date createTime;
    @Column
    private String succeed;
    @Column
    private String message;

}
