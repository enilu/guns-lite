package cn.enilu.guns.bean.entity.cms;

import cn.enilu.guns.bean.entity.BaseEntity;
import lombok.Data;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.Table;

@Entity
@Table(name = "t_cms_channel")
@Data
@EntityListeners(AuditingEntityListener.class)
public class Channel extends BaseEntity {
    @Column
    private String name;
    @Column
    private String code;

}
