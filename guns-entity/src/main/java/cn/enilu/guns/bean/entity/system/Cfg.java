package cn.enilu.guns.bean.entity.system;

import javax.persistence.*;

/**
 * Created  on 2018/4/2 0002.
 *
 * @author enilu
 */
@Entity
@Table(name = "T_SYS_CFG")
public class Cfg {
    private Long id;
    private String cfgName;
    private String cfgValue;
    private String cfgDesc;

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "sequence")
    @SequenceGenerator(name="sequence",sequenceName = "SEQ_SYS_CFG", initialValue=1, allocationSize=1)
    @Column(name = "ID")
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Basic
    @Column(name = "CFG_NAME")
    public String getCfgName() {
        return cfgName;
    }

    public void setCfgName(String cfgName) {
        this.cfgName = cfgName;
    }

    @Basic
    @Column(name = "CFG_VALUE")
    public String getCfgValue() {
        return cfgValue;
    }

    public void setCfgValue(String cfgValue) {
        this.cfgValue = cfgValue;
    }

    @Basic
    @Column(name = "CFG_DESC")
    public String getCfgDesc() {
        return cfgDesc;
    }

    public void setCfgDesc(String cfgDesc) {
        this.cfgDesc = cfgDesc;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Cfg tSysCfg = (Cfg) o;

        if (id != null ? !id.equals(tSysCfg.id) : tSysCfg.id != null) return false;
        if (cfgName != null ? !cfgName.equals(tSysCfg.cfgName) : tSysCfg.cfgName != null) return false;
        if (cfgValue != null ? !cfgValue.equals(tSysCfg.cfgValue) : tSysCfg.cfgValue != null) return false;
        if (cfgDesc != null ? !cfgDesc.equals(tSysCfg.cfgDesc) : tSysCfg.cfgDesc != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (cfgName != null ? cfgName.hashCode() : 0);
        result = 31 * result + (cfgValue != null ? cfgValue.hashCode() : 0);
        result = 31 * result + (cfgDesc != null ? cfgDesc.hashCode() : 0);
        return result;
    }
}
