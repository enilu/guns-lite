package cn.enilu.guns.bean.entity.cms;

import cn.enilu.guns.bean.entity.BaseEntity;
import lombok.Data;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.Table;

@Entity
@Table(name = "t_cms_article")
@Data
@EntityListeners(AuditingEntityListener.class)
public class Article extends BaseEntity {
    @Column(name = "id_channel")
    private Long idChannel;
    @Column
    private String title;
    @Column
    private String content;
    @Column
    private String author;
    @Column
    private String img;
}
