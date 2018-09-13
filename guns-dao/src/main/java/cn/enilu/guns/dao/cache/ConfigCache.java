package cn.enilu.guns.dao.cache;

/**
 * 全局配置数据访问
 */
public interface ConfigCache extends Cache {
	/**
	 * 从支付网管获取相关参数
	 * @param type 参数名称
	 * @param prefix 环境相关参数，区分生产、测试环境，该值配置在全局参数表中
     * @return
     */
	String getRemote(String type, String prefix);

	/**
	 * 获取全局配置参数值
	 *
	 * @param key
	 * @return
	 */
	String get(String key);

	/**
	 * 获取全局配置参数值，可选本地缓存
	 * @param key
	 * @return
     */
	String get(String key, boolean local);

	/**
	 * 获取全局配置参数值(带默认值)
	 *
	 * @param key the key
	 * @param def the default value
	 * @return the config
	 */
	String get(String key, String def);

	/**
	 * * 获取全局配置参数值，可选本地缓存
	 * @param key
	 * @param def 默认值
	 * @param local
     * @return
     */
	String get(String key, String def, boolean local);

	/**
	 * 设置全局配置参数值
	 *
	 * @param key
	 * @param val
	 */
	void set(String key, String val);
}
