
package cn.enilu.guns.dao.system;

import cn.enilu.guns.bean.entity.system.Cfg;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CfgRepository extends JpaRepository<Cfg, Long> {

    Cfg findByCfgName(String cfgName);
}
