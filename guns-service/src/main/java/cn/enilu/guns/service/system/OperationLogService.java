package cn.enilu.guns.service.system;

import cn.enilu.guns.bean.entity.system.OperationLog;
import cn.enilu.guns.utils.factory.Page;

/**
 * Created  on 2018/3/26 0026.
 *
 * @author enilu
 */
public interface OperationLogService {

    Page getOperationLogs(Page<OperationLog> page, final String beginTime, final String endTime, final String logName, final String logType);
}
