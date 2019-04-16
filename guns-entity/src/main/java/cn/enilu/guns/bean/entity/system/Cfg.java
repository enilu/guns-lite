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
@Entity(name="t_sys_cfg")
@Table(appliesTo = "t_sys_cfg",comment = "系统参数")
@Data
@EntityListeners(AuditingEntityListener.class)
public class Cfg  extends BaseEntity {
    @Column(name = "cfg_name")
    private String cfgName;
    @Column(name = "cfg_value")
    private String cfgValue;
    @Column(name = "cfg_desc")
    private String cfgDesc;

}
