package cn.enilu.guns.bean.entity.system;

import cn.enilu.guns.bean.entity.BaseEntity;
import lombok.Data;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.Table;

/**
 * Created  on 2018/4/2 0002.
 *
 * @author enilu
 */
@Entity
@Table(name = "t_sys_role")
@Data
@EntityListeners(AuditingEntityListener.class)
public class Role extends BaseEntity {
    @Column
    private Integer num;
    @Column
    private Long pid;
    @Column
    private String name;
    @Column
    private Long deptid;
    @Column
    private String tips;
    @Column
    private Integer version;

}
