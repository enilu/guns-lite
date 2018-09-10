package cn.enilu.guns.bean.entity.system;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created  on 2018/4/2 0002.
 *
 * @author enilu
 */
@Entity
@Table(name = "t_sys_dict")
public class Dict implements Serializable {
    private Integer id;
    private String num;
    private Integer pid;
    private String name;
    private String tips;

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
    public String getNum() {
        return num;
    }

    public void setNum(String num) {
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
    @Column(name = "tips")
    public String getTips() {
        return tips;
    }

    public void setTips(String tips) {
        this.tips = tips;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Dict tSysDict = (Dict) o;

        if (id != null ? !id.equals(tSysDict.id) : tSysDict.id != null) return false;
        if (num != null ? !num.equals(tSysDict.num) : tSysDict.num != null) return false;
        if (pid != null ? !pid.equals(tSysDict.pid) : tSysDict.pid != null) return false;
        if (name != null ? !name.equals(tSysDict.name) : tSysDict.name != null) return false;
        if (tips != null ? !tips.equals(tSysDict.tips) : tSysDict.tips != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (num != null ? num.hashCode() : 0);
        result = 31 * result + (pid != null ? pid.hashCode() : 0);
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (tips != null ? tips.hashCode() : 0);
        return result;
    }
}
