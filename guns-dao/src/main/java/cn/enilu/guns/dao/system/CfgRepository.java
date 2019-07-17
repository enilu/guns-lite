
package cn.enilu.guns.dao.system;

import cn.enilu.guns.bean.entity.system.Cfg;
import cn.enilu.guns.dao.BaseRepository;

public interface CfgRepository extends BaseRepository<Cfg,Long> {

    Cfg findByCfgName(String cfgName);
}
