package cn.enilu.guns.dao.system;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import cn.enilu.guns.bean.entity.system.OperationLog;

/**
 * Created on 2018/3/21 0021.
 *
 * @author enilu
 */
public interface OperationLogRepository extends PagingAndSortingRepository<OperationLog, Integer>,
		JpaSpecificationExecutor<OperationLog>, JpaRepository<OperationLog, Integer> {
	@Modifying
	@Transactional
	@Query(nativeQuery = true, value = "delete from t_sys_operation_log")
	int clear();
}
