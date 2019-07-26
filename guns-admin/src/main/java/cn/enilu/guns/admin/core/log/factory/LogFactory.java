package cn.enilu.guns.admin.core.log.factory;

import cn.enilu.guns.admin.common.constant.state.LogSucceed;
import cn.enilu.guns.admin.common.constant.state.LogType;
import cn.enilu.guns.bean.entity.system.LoginLog;
import cn.enilu.guns.bean.entity.system.OperationLog;

import java.util.Date;

/**
 * 日志对象创建工厂
 *
 * @author fengshuonan
 * @date 2016年12月6日 下午9:18:27
 */
public class LogFactory {

	/**
	 * 创建操作日志
	 *
	 * @author fengshuonan
	 * @Date 2017/3/30 18:45
	 */
	public static OperationLog createOperationLog(LogType logType, Long userId, String bussinessName, String clazzName,
			String methodName, String msg, LogSucceed succeed) {
		OperationLog operationLog = new OperationLog();
		operationLog.setLogtype(logType.getMessage());
		operationLog.setLogname(bussinessName);
		operationLog.setUserid(userId.intValue());
		operationLog.setClassname(clazzName);
		operationLog.setMethod(methodName);
		operationLog.setCreatetime(new Date());
		operationLog.setSucceed(succeed.getMessage());
		operationLog.setMessage(msg);
		return operationLog;
	}

	/**
	 * 创建登录日志
	 *
	 * @author fengshuonan
	 * @Date 2017/3/30 18:46
	 */
	public static LoginLog createLoginLog(LogType logType, Long userId, String msg, String ip) {
		LoginLog loginLog = new LoginLog();
		loginLog.setLogname(logType.getMessage());
		loginLog.setUserid(userId.intValue());
		loginLog.setCreatetime(new Date());
		loginLog.setSucceed(LogSucceed.SUCCESS.getMessage());
		loginLog.setIp(ip);
		loginLog.setMessage(msg);
		return loginLog;
	}
}
