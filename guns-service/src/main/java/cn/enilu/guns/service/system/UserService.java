package cn.enilu.guns.service.system;

import cn.enilu.guns.bean.entity.system.User;
import cn.enilu.guns.utils.factory.Page;

import java.util.List;
import java.util.Map;

/**
 * Created  on 2018/3/23 0023.
 *
 * @author enilu
 */
public interface UserService {
    List<User> findAll(Map<String,Object> params);

    Page<User> findPage(Page<User> page, Map<String,Object> params);
}
