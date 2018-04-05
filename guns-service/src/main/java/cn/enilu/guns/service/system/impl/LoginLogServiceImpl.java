package cn.enilu.guns.service.system.impl;

import cn.enilu.guns.bean.entity.system.LoginLog;
import cn.enilu.guns.dao.system.LoginLogRepository;
import cn.enilu.guns.utils.factory.Page;
import cn.enilu.guns.service.system.LoginLogService;
import cn.enilu.guns.utils.DateUtil;
import com.google.common.base.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created  on 2018/3/26 0026.
 *
 * @author enilu
 */
@Service
public class LoginLogServiceImpl implements LoginLogService {
    @Autowired
    private LoginLogRepository loginLogRepository;


    @Override
    public Page getLoginLogs(Page<LoginLog> page, final String beginTime, final String endTime, final String logName) {
        Pageable pageable = null;
        if(page.isOpenSort()) {
            pageable = new PageRequest(page.getCurrent()-1, page.getSize(), page.isAsc() ? Sort.Direction.ASC : Sort.Direction.DESC, page.getOrderByField());
        }else{
            pageable = new PageRequest(page.getCurrent()-1,page.getSize());
        }

        org.springframework.data.domain.Page<LoginLog> page1 = loginLogRepository.findAll(new Specification<LoginLog>(){


            @Override
            public Predicate toPredicate(Root<LoginLog> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                List<Predicate> list = new ArrayList<Predicate>();
                if(!Strings.isNullOrEmpty(beginTime)){
                    list.add(criteriaBuilder.greaterThan(root.get("createtime").as(Date.class), DateUtil.parseDate(beginTime)));
                }
                if(!Strings.isNullOrEmpty(endTime)){
                    list.add(criteriaBuilder.lessThan(root.get("createtime").as(Date.class), DateUtil.parseDate(endTime)));
                }
                if(!Strings.isNullOrEmpty(logName)){
                    list.add(criteriaBuilder.like(root.get("logname").as(String.class),logName));
                }
                Predicate[] p = new Predicate[list.size()];
                return criteriaBuilder.and(list.toArray(p));
            }
        },pageable);
        page.setTotal(Integer.valueOf(page1.getTotalElements()+""));
        page.setRecords(page1.getContent());
        return page;
    }
}
