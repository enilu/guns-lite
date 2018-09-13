package cn.enilu.guns.dao.cache;


public interface ValidCache {

	String REGISTER = "register";
	String RESET_PASSWD = "resetPasswd";
	String FIND_PASSWD = "findPasswd";
	String BORROW_CONFIRM = "borrowConfirm";
	String VALID2 = "valid2";
	String LOGIN = "login";
	String TOTAL_COUNT = "totalCount";
	String ERROR_COUNT = "errorCount";
	int CODE_EXPIRE = 60 * 5;
	int COUNT_EXPIRE = 60 * 60 * 24;

	/**
	 * 设置验证码
	 *
	 * @param key   设备号码：手机号/邮箱号
	 * @param topic 校验主题
	 * @param code  验证码
	 */
	void setValidCode(String key, String topic, String code);

	/**
	 * 校验验证码
	 *
	 * @param key   设备号码：手机号/邮箱号
	 * @param topic 校验主题
	 * @param code  待校验验证码
	 * @return
	 */
	boolean checkValidCode(String key, String topic, String code);

	/**
	 * 获取设备已发送验证码总次数
	 *
	 * @param key 设备号码：手机号/邮箱号
	 * @return
	 */
	int getTotalCount(String key);

	/**
	 * 获取验证码校验错误次数
	 *
	 * @param key   设备号码：手机号/邮箱号
	 * @param topic 校验主题
	 * @return
	 */
	int getErrorCount(String key, String topic);

	/**
	 * 获取设备已发送验证码最大次数
	 *
	 * @param key 设备号码：手机号/邮箱号
	 * @return
	 */
	int getMaxTotalCount(String key);

	/**
	 * 获取验证码校验最大错误次数
	 *
	 * @param key 设备号码：手机号/邮箱号
	 * @return
	 */
	int getMaxErrorCount(String key);

}
