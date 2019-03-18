package cn.enilu.guns.bean.entity.system;

import cn.enilu.guns.bean.entity.BaseEntity;
import lombok.Data;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;

@Data
@Entity
@Table(name="t_sys_file_info")
@EntityListeners(AuditingEntityListener.class)
public class FileInfo extends BaseEntity {
    @Column
    private String originalFileName;
    @Column
    private String realFileName;
    @Transient
    private String ablatePath;

}
