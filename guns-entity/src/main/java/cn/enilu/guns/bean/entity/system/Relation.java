package cn.enilu.guns.bean.entity.system;

import lombok.Data;

import javax.persistence.*;

/**
 * Created  on 2018/4/2 0002.
 *
 * @author enilu
 */
@Entity
@Table(name = "t_sys_relation")
@Data
public class Relation {
    @Id
    @GeneratedValue
    private Long id;
    @Column
    private Long menuid;
    @Column
    private Long roleid;

}
