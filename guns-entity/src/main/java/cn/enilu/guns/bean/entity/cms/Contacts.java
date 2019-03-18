package cn.enilu.guns.bean.entity.cms;

import cn.enilu.guns.bean.entity.BaseEntity;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Data
@Table(name="t_cms_contacts")
public class Contacts extends BaseEntity {
    private String userName;
    private String mobile;
    private String email;
    private String remark;
}
