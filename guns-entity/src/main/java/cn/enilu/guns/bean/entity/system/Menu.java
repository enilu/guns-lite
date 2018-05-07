package cn.enilu.guns.bean.entity.system;

import javax.persistence.*;

/**
 * Created  on 2018/4/2 0002.
 *
 * @author enilu
 */
@Entity
@Table(name = "T_SYS_MENU")
public class Menu {
    private Long id;
    private String code;
    private String pcode;
    private String pcodes;
    private String name;
    private String icon;
    private String url;
    private Integer num;
    private Integer levels;
    private Integer ismenu;
    private String tips;
    private Integer status;
    private Integer isopen;

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "sequence")
    @SequenceGenerator(name="sequence",sequenceName = "SEQ_SYS_MENU", initialValue=1, allocationSize=1)
    @Column(name = "ID")
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Basic
    @Column(name = "CODE")
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @Basic
    @Column(name = "PCODE")
    public String getPcode() {
        return pcode;
    }

    public void setPcode(String pcode) {
        this.pcode = pcode;
    }

    @Basic
    @Column(name = "PCODES")
    public String getPcodes() {
        return pcodes;
    }

    public void setPcodes(String pcodes) {
        this.pcodes = pcodes;
    }

    @Basic
    @Column(name = "NAME")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "ICON")
    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    @Basic
    @Column(name = "URL")
    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
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
    @Column(name = "LEVELS")
    public Integer getLevels() {
        return levels;
    }

    public void setLevels(Integer levels) {
        this.levels = levels;
    }

    @Basic
    @Column(name = "ISMENU")
    public Integer getIsmenu() {
        return ismenu;
    }

    public void setIsmenu(Integer ismenu) {
        this.ismenu = ismenu;
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
    @Column(name = "STATUS")
    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Basic
    @Column(name = "ISOPEN")
    public Integer getIsopen() {
        return isopen;
    }

    public void setIsopen(Integer isopen) {
        this.isopen = isopen;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Menu tSysMenu = (Menu) o;

        if (id != null ? !id.equals(tSysMenu.id) : tSysMenu.id != null) return false;
        if (code != null ? !code.equals(tSysMenu.code) : tSysMenu.code != null) return false;
        if (pcode != null ? !pcode.equals(tSysMenu.pcode) : tSysMenu.pcode != null) return false;
        if (pcodes != null ? !pcodes.equals(tSysMenu.pcodes) : tSysMenu.pcodes != null) return false;
        if (name != null ? !name.equals(tSysMenu.name) : tSysMenu.name != null) return false;
        if (icon != null ? !icon.equals(tSysMenu.icon) : tSysMenu.icon != null) return false;
        if (url != null ? !url.equals(tSysMenu.url) : tSysMenu.url != null) return false;
        if (num != null ? !num.equals(tSysMenu.num) : tSysMenu.num != null) return false;
        if (levels != null ? !levels.equals(tSysMenu.levels) : tSysMenu.levels != null) return false;
        if (ismenu != null ? !ismenu.equals(tSysMenu.ismenu) : tSysMenu.ismenu != null) return false;
        if (tips != null ? !tips.equals(tSysMenu.tips) : tSysMenu.tips != null) return false;
        if (status != null ? !status.equals(tSysMenu.status) : tSysMenu.status != null) return false;
        if (isopen != null ? !isopen.equals(tSysMenu.isopen) : tSysMenu.isopen != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (code != null ? code.hashCode() : 0);
        result = 31 * result + (pcode != null ? pcode.hashCode() : 0);
        result = 31 * result + (pcodes != null ? pcodes.hashCode() : 0);
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (icon != null ? icon.hashCode() : 0);
        result = 31 * result + (url != null ? url.hashCode() : 0);
        result = 31 * result + (num != null ? num.hashCode() : 0);
        result = 31 * result + (levels != null ? levels.hashCode() : 0);
        result = 31 * result + (ismenu != null ? ismenu.hashCode() : 0);
        result = 31 * result + (tips != null ? tips.hashCode() : 0);
        result = 31 * result + (status != null ? status.hashCode() : 0);
        result = 31 * result + (isopen != null ? isopen.hashCode() : 0);
        return result;
    }
}
