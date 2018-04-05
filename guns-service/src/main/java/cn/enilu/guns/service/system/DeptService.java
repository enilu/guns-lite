package cn.enilu.guns.service.system;

import cn.enilu.guns.bean.vo.node.ZTreeNode;
import cn.enilu.guns.bean.entity.system.Dept;

import java.util.List;

/**
 * Created  on 2018/3/21 0021.
 *
 * @author enilu
 */
public interface DeptService {
    List<ZTreeNode> tree();

    List<Dept> list(String condition);
    void deleteDept(Integer deptId);
}
