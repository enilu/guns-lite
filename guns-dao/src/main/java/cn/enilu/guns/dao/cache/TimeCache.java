package cn.enilu.guns.dao.cache;

/**
 * TimeCache
 *
 * @author zt
 * @version 2018/9/12 0012
 */
public interface TimeCache<K,V> {

    boolean containsKey(K key);

    V get(K key);

    void put(K key, V value);

    void remove(K key);

    void refresh(K key);
}
