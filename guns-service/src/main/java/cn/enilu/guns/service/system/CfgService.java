package cn.enilu.guns.service.system;

import cn.enilu.guns.bean.entity.system.Cfg;
import cn.enilu.guns.dao.cache.ConfigCache;
import cn.enilu.guns.dao.system.CfgRepository;
import cn.enilu.guns.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * CfgService
 *
 * @author enilu
 * @version 2018/11/17 0017
 */

@Service
public class CfgService extends BaseService<Cfg,Long,CfgRepository> {
    @Autowired
    private ConfigCache configCache;
    @Override
    public Cfg saveOrUpdate(Cfg cfg) {
        super.saveOrUpdate(cfg);
        configCache.cache();
        return cfg;
    }
    @Override
    public void delete(Long id) {
        super.delete(id);
        configCache.cache();
    }

}
