
package cn.enilu.guns.dao.system;


import cn.enilu.guns.bean.entity.system.Task;
import cn.enilu.guns.dao.BaseRepository;

import java.util.List;

public interface TaskRepository extends BaseRepository<Task, Long> {

    long countByNameLike(String name);

    List<Task> findByNameLike(String name);
    List<Task> findAllByDisabled(boolean disable);
}
