package cn.enilu.guns.bean.entity.system;

import javax.persistence.*;

/**
 * Created  on 2018/4/2 0002.
 *
 * @author enilu
 */
@Entity
@Table(name = "t_sys_role")
public class Role {
    private Integer id;
    private Integer num;
    private Integer pid;
    private String name;
    private Integer deptid;
    private String tips;
    private Integer version;

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
    @Column(name = "num")
    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    @Basic
    @Column(name = "pid")
    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    @Basic
    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "deptid")
    public Integer getDeptid() {
        return deptid;
    }

    public void setDeptid(Integer deptid) {
        this.deptid = deptid;
    }

    @Basic
    @Column(name = "tips")
    public String getTips() {
        return tips;
    }

    public void setTips(String tips) {
        this.tips = tips;
    }

    @Basic
    @Column(name = "version")
    public Integer getVersion() {
        return version;
    }

    public void setVersion(Integer version) {
        this.version = version;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Role tSysRole = (Role) o;

        if (id != null ? !id.equals(tSysRole.id) : tSysRole.id != null) return false;
        if (num != null ? !num.equals(tSysRole.num) : tSysRole.num != null) return false;
        if (pid != null ? !pid.equals(tSysRole.pid) : tSysRole.pid != null) return false;
        if (name != null ? !name.equals(tSysRole.name) : tSysRole.name != null) return false;
        if (deptid != null ? !deptid.equals(tSysRole.deptid) : tSysRole.deptid != null) return false;
        if (tips != null ? !tips.equals(tSysRole.tips) : tSysRole.tips != null) return false;
        if (version != null ? !version.equals(tSysRole.version) : tSysRole.version != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (num != null ? num.hashCode() : 0);
        result = 31 * result + (pid != null ? pid.hashCode() : 0);
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (deptid != null ? deptid.hashCode() : 0);
        result = 31 * result + (tips != null ? tips.hashCode() : 0);
        result = 31 * result + (version != null ? version.hashCode() : 0);
        return result;
    }
}
