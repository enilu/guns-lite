package cn.enilu.guns.service.system.impl;

import cn.enilu.guns.bean.vo.node.ZTreeNode;
import cn.enilu.guns.bean.entity.system.Dept;
import cn.enilu.guns.dao.system.DeptRepository;
import cn.enilu.guns.service.system.DeptService;
import com.google.common.base.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created  on 2018/3/21 0021.
 *
 * @author enilu
 */
@Service
public class DeptServiceImpl  implements DeptService {
    @Autowired
    private DeptRepository deptRepository;

    @Override
    public List<ZTreeNode> tree() {
        List<Object[]> list = deptRepository.tree();
        List<ZTreeNode> nodes = new ArrayList<>();
        for(Object[] obj:list){
            ZTreeNode node = transfer(obj);
            nodes.add(node);
        }
        return nodes;
    }

    private ZTreeNode transfer(Object[] obj){
        ZTreeNode node = new ZTreeNode();
        node.setId(Long.valueOf(obj[0].toString()));
        node.setpId(Long.valueOf(obj[1].toString()));
        node.setName(obj[2].toString());
        node.setIsOpen(Boolean.valueOf(obj[3].toString()));
        return node;
    }
    @Override
    public List<Dept> list(String condition) {
        List<Dept> list = new ArrayList<>();
        if(Strings.isNullOrEmpty(condition)){
             list = (List<Dept>) deptRepository.findAll();
        }else{
            condition = "%"+condition+"%";
             list = deptRepository.findBySimplenameLikeOrFullnameLike(condition,condition);
        }
        return list;
    }

    @Override
    public void deleteDept(Integer deptId) {
        Dept dept = deptRepository.findOne(deptId);

        List<Dept> subDepts = deptRepository.findByPidsLike("%[" + dept.getId() + "]%");
        deptRepository.delete(subDepts);
        deptRepository.delete(dept);
    }


}
