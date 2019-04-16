package cn.enilu.guns.bean.entity.test;


import cn.enilu.guns.bean.entity.BaseEntity;
import org.hibernate.annotations.Table;

import javax.persistence.Column;
import javax.persistence.Entity;
import java.util.Date;

@Entity(name="t_test_boy")
@Table(appliesTo = "t_test_boy",comment = "男孩")
public class Boy extends BaseEntity {
    @Column(columnDefinition = "VARCHAR(32) COMMENT '姓名'")
    private String name;
    @Column(columnDefinition = "INT COMMENT '年龄'")
    private Integer age;
    @Column(columnDefinition = "DATE COMMENT '生日'")
    private Date birthday;
    @Column(name = "has_girl_friend",columnDefinition = "TINYINT COMMENT '是否有女朋友'")
    private Boolean hasGirFriend;
}
