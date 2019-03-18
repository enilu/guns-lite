package cn.enilu.guns.bean.entity.cms;

import cn.enilu.guns.bean.entity.BaseEntity;
import lombok.Data;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.Table;

@Entity
@Table(name = "t_cms_banner")
@Data
@EntityListeners(AuditingEntityListener.class)
public class Banner extends BaseEntity {
    private String url;
    private String title;
    private String type;
    private Long idFile;
}
