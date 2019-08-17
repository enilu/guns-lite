package cn.enilu.guns.service.system;


import cn.enilu.guns.bean.entity.system.LoginLog;
import cn.enilu.guns.dao.system.LoginLogRepository;
import cn.enilu.guns.service.BaseService;
import org.springframework.stereotype.Service;

/**
 * Created  on 2018/3/26 0026.
 *
 * @author enilu
 */
@Service
public class LoginLogService extends BaseService<LoginLog,Long,LoginLogRepository> {
}
