package cn.enilu.guns.bean.entity.system;

import javax.persistence.*;

/**
 * Created  on 2018/4/2 0002.
 *
 * @author enilu
 */
@Entity
@Table(name = "T_SYS_DEPT")
public class Dept {
    private Integer id;
    private Integer num;
    private Integer pid;
    private String pids;
    private String simplename;
    private String fullname;
    private String tips;
    private Integer version;

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "sequence")
    @SequenceGenerator(name="sequence",sequenceName = "SEQ_SYS_DEPT", initialValue=1, allocationSize=1)
    @Column(name = "ID")
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Basic
    @Column(name = "NUM")
    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    @Basic
    @Column(name = "PID")
    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    @Basic
    @Column(name = "PIDS")
    public String getPids() {
        return pids;
    }

    public void setPids(String pids) {
        this.pids = pids;
    }

    @Basic
    @Column(name = "SIMPLENAME")
    public String getSimplename() {
        return simplename;
    }

    public void setSimplename(String simplename) {
        this.simplename = simplename;
    }

    @Basic
    @Column(name = "FULLNAME")
    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    @Basic
    @Column(name = "TIPS")
    public String getTips() {
        return tips;
    }

    public void setTips(String tips) {
        this.tips = tips;
    }

    @Basic
    @Column(name = "VERSION")
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

        Dept tSysDept = (Dept) o;

        if (id != null ? !id.equals(tSysDept.id) : tSysDept.id != null) return false;
        if (num != null ? !num.equals(tSysDept.num) : tSysDept.num != null) return false;
        if (pid != null ? !pid.equals(tSysDept.pid) : tSysDept.pid != null) return false;
        if (pids != null ? !pids.equals(tSysDept.pids) : tSysDept.pids != null) return false;
        if (simplename != null ? !simplename.equals(tSysDept.simplename) : tSysDept.simplename != null) return false;
        if (fullname != null ? !fullname.equals(tSysDept.fullname) : tSysDept.fullname != null) return false;
        if (tips != null ? !tips.equals(tSysDept.tips) : tSysDept.tips != null) return false;
        if (version != null ? !version.equals(tSysDept.version) : tSysDept.version != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (num != null ? num.hashCode() : 0);
        result = 31 * result + (pid != null ? pid.hashCode() : 0);
        result = 31 * result + (pids != null ? pids.hashCode() : 0);
        result = 31 * result + (simplename != null ? simplename.hashCode() : 0);
        result = 31 * result + (fullname != null ? fullname.hashCode() : 0);
        result = 31 * result + (tips != null ? tips.hashCode() : 0);
        result = 31 * result + (version != null ? version.hashCode() : 0);
        return result;
    }
}
