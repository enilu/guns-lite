
package cn.enilu.guns.dao.system;

import org.springframework.data.jpa.repository.JpaRepository;

import cn.enilu.guns.bean.entity.system.Cfg;

public interface CfgRepository extends JpaRepository<Cfg, Long> {

	Cfg findByCfgName(String cfgName);
}
