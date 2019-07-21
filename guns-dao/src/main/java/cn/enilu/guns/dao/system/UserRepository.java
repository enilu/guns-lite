package cn.enilu.guns.dao.system;


import cn.enilu.guns.bean.entity.system.User;
import cn.enilu.guns.dao.BaseRepository;

/**
 * Created  on 2018/3/21 0021.
 *
 * @author enilu
 */
public interface UserRepository extends BaseRepository<User,Long> {
    User findByAccount(String account);
}
