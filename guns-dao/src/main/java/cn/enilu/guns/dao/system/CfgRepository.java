
package cn.enilu.guns.dao.system;

import cn.enilu.guns.bean.entity.system.Cfg;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

@CacheConfig(cacheNames = "sysCfg")
@Cacheable
public interface CfgRepository extends PagingAndSortingRepository<Cfg,Long>
        ,JpaRepository<Cfg,Long>,JpaSpecificationExecutor<Cfg> {

    Cfg findByCfgName(String cfgName);
}
