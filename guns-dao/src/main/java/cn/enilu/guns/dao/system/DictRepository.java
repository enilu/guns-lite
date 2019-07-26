
package cn.enilu.guns.dao.system;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import cn.enilu.guns.bean.entity.system.Dict;

public interface DictRepository extends JpaRepository<Dict, Integer> {
	List<Dict> findByPid(Integer pid);

	List<Dict> findByNameAndPid(String name, Integer pid);

	Dict findByName(String name);
}
