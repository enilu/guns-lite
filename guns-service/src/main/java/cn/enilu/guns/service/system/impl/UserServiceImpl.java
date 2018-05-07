package cn.enilu.guns.service.system.impl;

import cn.enilu.guns.bean.entity.system.User;
import cn.enilu.guns.dao.system.UserRepository;
import cn.enilu.guns.service.system.UserService;
import cn.enilu.guns.utils.DateUtil;
import com.google.common.base.Strings;
import net.sf.jxls.transformer.XLSTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.io.File;
import java.util.*;

/**
 * Created  on 2018/4/7 0007.
 *
 * @author enilu
 */
@Service
public class UserServiceImpl implements UserService {
    @Value("${guns.download}")
    private String downloadReportPath;
    @Autowired
    private UserRepository userRepository;
    @Override
    public List<User> findAll(Map<String, Object> params) {
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

    @Override
    public String export() {
        List<User> list = userRepository.findAll();
        Map beans = new HashMap();
        beans.put("title","用户列表");
        beans.put("dataList",list);
        beans.put("fbdate",DateUtil.format(new Date(),"yyyy-MM-dd"));
        XLSTransformer xlsTransformer = new XLSTransformer();
        String fileName = "user_"+beans.get("fbdate").toString()+".xls";

        String templateFile = getClass().getClassLoader().getResource("templates/user.xls").getPath();
        try {
            xlsTransformer.transformXLS(
                    templateFile,
                    beans, downloadReportPath + File.separator + fileName);
        }catch (Exception e){
            e.printStackTrace();
        }
        return fileName;
    }
}
