package cn.enilu.guns.service;

import cn.enilu.guns.bean.vo.query.DynamicSpecifications;
import cn.enilu.guns.bean.vo.query.Page;
import cn.enilu.guns.bean.vo.query.SearchFilter;
import cn.enilu.guns.dao.BaseRepository;
import cn.enilu.guns.utils.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;

import java.io.Serializable;
import java.util.Iterator;
import java.util.List;

/**
 *
 * @author ：enilu
 * @date ：Created in 2019/6/29 22:32
 */
public abstract  class BaseService<T, ID extends Serializable, R extends BaseRepository<T, ID>>
        implements CrudService<T, ID> {
    @Autowired
    private R dao;


    @Override
    public void delete(ID id) {
        dao.deleteById(id);
    }

    @Override
    public void delete(Iterable<ID> ids) {
        Iterator<ID> iterator = ids.iterator();
        while (iterator.hasNext()) {
            ID id = iterator.next();
            dao.deleteById(id);
        }
    }

    @Override
    public T insert(T record) {
        return dao.save(record);
    }

    @Override
    public T get(ID id) {
        return  dao.findById(id).get();
    }

    @Override
    public List<T> query(Iterable<ID> ids) {
        return dao.findAllById(ids);
    }

    @Override
    public List<T> queryAll() {
        return dao.findAll();
    }

    @Override
    public Page<T> queryPage(Page<T> page) {
        Pageable pageable = null;
        if(page.isOpenSort()) {
            pageable = new PageRequest(page.getCurrent()-1, page.getSize(), page.isAsc() ? Sort.Direction.ASC : Sort.Direction.DESC, page.getOrderByField());
        }else{
            pageable = new PageRequest(page.getCurrent()-1,page.getSize(), Sort.Direction.DESC,"id");
        }
        Specification<T> specification = DynamicSpecifications.bySearchFilter(page.getFilters(),dao.getDataClass());
        org.springframework.data.domain.Page<T> pageResult  = dao.findAll(specification,pageable);
        page.setTotal(Integer.valueOf(pageResult.getTotalElements()+""));
        page.setRecords(pageResult.getContent());
        return page;
    }

    @Override
    public List<T> queryAll(List<SearchFilter> filters) {
        return queryAll(filters,null);
    }

    @Override
    public List<T> queryAll(SearchFilter filter) {
        return queryAll(filter,null);
    }

    @Override
    public List<T> queryAll(List<SearchFilter> filters, Sort sort) {
        Specification<T> specification = DynamicSpecifications.bySearchFilter(filters,dao.getDataClass());
        if(sort==null){
            return dao.findAll(specification);
        }
        return dao.findAll(specification,sort);
    }

    @Override
    public List<T> queryAll(SearchFilter filter, Sort sort) {
        return queryAll(Lists.newArrayList(filter),sort);
    }

    @Override
    public T update(T record) {
        return dao.save(record);
    }

    @Override
    public T saveOrUpdate(T record) {
        return dao.save(record);
    }

    @Override
    public void clear() {
        dao.deleteAllInBatch();
    }

}
