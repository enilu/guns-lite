package cn.enilu.guns.bean.entity.system;

import cn.enilu.guns.bean.entity.BaseEntity;
import lombok.Data;
import org.hibernate.annotations.Table;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;

/**
 * Created  on 2018/4/2 0002.
 *
 * @author enilu
 */
@Entity(name="t_sys_dict")
@Table(appliesTo = "t_sys_dict",comment = "字典")
@Data
@EntityListeners(AuditingEntityListener.class)
public class Dict extends BaseEntity {
    @Column(columnDefinition = "BIGINT COMMENT '字典组id'")
    private Long pid;
    @Column(columnDefinition = "VARCHAR(32) COMMENT '字典值'")
    private String value;
    @Column(columnDefinition = "VARCHAR(32) COMMENT '字典显示值'")
    private String name;

}
