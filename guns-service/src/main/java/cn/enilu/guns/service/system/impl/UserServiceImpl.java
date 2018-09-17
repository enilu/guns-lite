package cn.enilu.guns.service.system.impl;

import cn.enilu.guns.bean.entity.system.User;
import cn.enilu.guns.dao.system.UserRepository;
import cn.enilu.guns.service.system.UserService;
import cn.enilu.guns.utils.DateUtil;
import com.google.common.base.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created  on 2018/4/7 0007.
 *
 * @author enilu
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;
    @Override
    public List<User> findAll(final Map<String, Object> params) {
        return userRepository.findAll(new Specification<User>(){
            @Override
            public Predicate toPredicate(Root<User> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                List<Predicate> list = new ArrayList<Predicate>();
                if(params.get("deptid") !=null && !Strings.isNullOrEmpty(params.get("deptid").toString())){
                    list.add(criteriaBuilder.equal(root.get("deptid").as(String.class), params.get("deptid").toString()));
                }
                if(params.get("name") !=null && !Strings.isNullOrEmpty(params.get("name").toString())){
                    list.add(criteriaBuilder.equal(root.get("name").as(String.class), params.get("name").toString()));
                }
                if(params.get("beginTime") != null && !Strings.isNullOrEmpty(params.get("beginTime").toString())){
                    list.add(criteriaBuilder.greaterThan(root.get("createtime").as(Date.class), DateUtil.parseDate(params.get("beginTime").toString())));
                }
                if(params.get("endTime") != null && !Strings.isNullOrEmpty(params.get("endTime").toString())){
                    list.add(criteriaBuilder.lessThan(root.get("createtime").as(Date.class),DateUtil.parseDate(params.get("endTime").toString())));
                }


                Predicate[] p = new Predicate[list.size()];
                return criteriaBuilder.and(list.toArray(p));
            }
        });

    }
}
