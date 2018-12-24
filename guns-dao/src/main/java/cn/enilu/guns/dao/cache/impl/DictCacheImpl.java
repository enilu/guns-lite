package cn.enilu.guns.dao.cache.impl;

import cn.enilu.guns.bean.constant.cache.CacheKey;
import cn.enilu.guns.bean.entity.system.Dict;
import cn.enilu.guns.dao.cache.DictCache;
import cn.enilu.guns.dao.cache.EhcacheDao;
import cn.enilu.guns.dao.system.DictRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * DictCacheImpl
 *
 * @author zt
 * @version 2018/12/23 0023
 */
@Component
public class DictCacheImpl implements DictCache {
    @Autowired
    private DictRepository dictRepository;
    @Autowired
    private EhcacheDao ehcacheDao;
    @Override
    public List<Dict> getDictsByPid(Long dictId) {
        return (List<Dict>) ehcacheDao.hget(EhcacheDao.CONSTANT,String.valueOf(dictId));
    }

    @Override
    public List<Dict> getDictsByPname(String dictName) {
        return (List<Dict>) ehcacheDao.hget(EhcacheDao.CONSTANT,dictName);
    }

    @Override
    public String getDict(Integer dictId) {
        return (String) get(CacheKey.DICT_NAME+String.valueOf(dictId));
    }

    @Override
    public void cache() {
    List<Dict> list = dictRepository.findByPid(0);
    for(Dict dict:list){
        List<Dict> children  = dictRepository.findByPid(dict.getId());
        if(children.isEmpty()) {
           continue;
        }
        set(String.valueOf(dict.getId()), children);
        set(dict.getName(), children);
        for(Dict child:children){
            set(CacheKey.DICT_NAME+String.valueOf(child.getId()),child.getName());
        }


    }

    }

    @Override
    public Object get(String key) {
        return ehcacheDao.hget(EhcacheDao.CONSTANT,CacheKey.DICT+key);
    }

    @Override
    public void set(String key, Object val) {
        ehcacheDao.hset(EhcacheDao.CONSTANT,CacheKey.DICT+key,val);

    }
}
