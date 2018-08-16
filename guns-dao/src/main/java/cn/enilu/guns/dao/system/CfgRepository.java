
package cn.enilu.guns.dao.system;

import cn.enilu.guns.bean.entity.system.Cfg;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.jpa.repository.JpaRepository;
@CacheConfig(cacheNames = "sysCfg")
@Cacheable
public interface CfgRepository extends JpaRepository<Cfg, Long> {

    Cfg findByCfgName(String cfgName);
}
