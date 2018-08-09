package cn.enilu.guns.bean.entity.system;

import javax.persistence.*;

/**
 * Created  on 2018/4/2 0002.
 *
 * @author enilu
 */
@Entity
@Table(name = "t_sys_relation")
public class Relation {
    private Integer id;
    private Long menuid;
    private Integer roleid;

    @Id
    @GeneratedValue
    @Column(name = "id")
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Basic
    @Column(name = "menuid")
    public Long getMenuid() {
        return menuid;
    }

    public void setMenuid(Long menuid) {
        this.menuid = menuid;
    }

    @Basic
    @Column(name = "roleid")
    public Integer getRoleid() {
        return roleid;
    }

    public void setRoleid(Integer roleid) {
        this.roleid = roleid;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Relation that = (Relation) o;

        if (id != null ? !id.equals(that.id) : that.id != null) return false;
        if (menuid != null ? !menuid.equals(that.menuid) : that.menuid != null) return false;
        if (roleid != null ? !roleid.equals(that.roleid) : that.roleid != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (menuid != null ? menuid.hashCode() : 0);
        result = 31 * result + (roleid != null ? roleid.hashCode() : 0);
        return result;
    }
}
