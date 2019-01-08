package cn.enilu.guns.bean.entity.system;

import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.util.Date;

/**
 * Created  on 2018/4/2 0002.
 *
 * @author enilu
 */
@Entity
@Table(name = "t_sys_login_log")
@Data
public class LoginLog {
    @Id
    @GeneratedValue
    private Integer id;
    @Column
    private String logname;
    @Column
    private Integer userid;
    @Column
    private String succeed;
    @Column
    private String message;
    @Column
    private String ip;
    @CreationTimestamp
    @Column(name = "create_time",columnDefinition="DATETIME COMMENT '创建时间'")
    private Date createTime;
}
