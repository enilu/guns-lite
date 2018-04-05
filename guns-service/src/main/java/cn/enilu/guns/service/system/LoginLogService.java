package cn.enilu.guns.service.system;


import cn.enilu.guns.bean.entity.system.LoginLog;
import cn.enilu.guns.utils.factory.Page;

/**
 * Created  on 2018/3/26 0026.
 *
 * @author enilu
 */
public interface LoginLogService {

    Page getLoginLogs(Page<LoginLog> page, final String beginTime, final String endTime, final String logName);
}
