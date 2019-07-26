package cn.enilu.guns.dao.system;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import cn.enilu.guns.bean.entity.system.User;

/**
 * Created on 2018/3/21 0021.
 *
 * @author enilu
 */
public interface UserRepository extends JpaRepository<User, Integer>, JpaSpecificationExecutor<User> {
	User findByAccount(String account);
}
