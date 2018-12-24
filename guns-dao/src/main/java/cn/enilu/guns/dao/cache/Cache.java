package cn.enilu.guns.dao.cache;

/**
 * 顶级缓存接口
 */
public interface Cache {
	/**
	 * 将数据加载到缓存中
	 */
	void cache();


	/**
	 * 获取全局配置参数值
	 *
	 * @param key
	 * @return
	 */
	Object get(String key);


	/**
	 * 设置全局配置参数值
	 *
	 * @param key
	 * @param val
	 */
	void set(String key, Object val);


}
