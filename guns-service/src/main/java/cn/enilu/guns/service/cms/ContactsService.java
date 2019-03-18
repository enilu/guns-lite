package cn.enilu.guns.service.cms;

import cn.enilu.guns.bean.entity.cms.Contacts;
import cn.enilu.guns.dao.cms.ContactsRepository;
import cn.enilu.guns.utils.StringUtils;
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
import java.util.List;
import java.util.Map;

@Service
public class ContactsService {
    @Autowired
    private ContactsRepository contactsRepository;

    public cn.enilu.guns.utils.factory.Page findPage(cn.enilu.guns.utils.factory.Page<Contacts> page, final Map<String, String> params) {
        Pageable pageable  = new PageRequest(page.getCurrent() - 1, page.getSize(),Sort.Direction.DESC,"id");
        org.springframework.data.domain.Page<Contacts> pageResult = contactsRepository.findAll(new Specification<Contacts>() {
            @Override
            public Predicate toPredicate(Root<Contacts> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                List<Predicate> list = new ArrayList<Predicate>();
                if (StringUtils.isNotEmpty(params.get("userName"))) {
                    list.add(criteriaBuilder.like(root.get("userName").as(String.class), "%" + params.get("userName") + "%"));
                }
                if (StringUtils.isNotEmpty(params.get("mobile"))) {
                    list.add(criteriaBuilder.like(root.get("mobile").as(String.class), "%" + params.get("mobile") + "%"));
                }
                Predicate[] p = new Predicate[list.size()];
                return criteriaBuilder.and(list.toArray(p));
            }
        }, pageable);
        page.setTotal(Integer.valueOf(pageResult.getTotalElements() + ""));
        page.setRecords(pageResult.getContent());
        return page;
    }

}
