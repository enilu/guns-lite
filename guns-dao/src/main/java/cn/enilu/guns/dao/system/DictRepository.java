
package cn.enilu.guns.dao.system;


import cn.enilu.guns.bean.entity.system.Dict;
import cn.enilu.guns.dao.BaseRepository;

import java.util.List;

public interface DictRepository extends BaseRepository<Dict,Long> {
    List<Dict> findByPid(Long pid);
    List<Dict> findByNameAndPid(String name,Long pid);

    List<Dict> findByNameLike(String name);
}
