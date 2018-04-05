package cn.enilu.guns.dao.system;

import cn.enilu.guns.bean.entity.system.Cfg;
import cn.enilu.guns.dao.BaseApplicationStartTest;
import com.alibaba.fastjson.JSON;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * 测试
 *
 * @author enilu
 * @Date 2017/5/21 12:06
 */

public class CfgRepositoryTest  extends BaseApplicationStartTest{
    @Autowired
    CfgRepository cfgRepository;

    @Test
    public void findByCfgName() {
        Cfg cfg = cfgRepository.findByCfgName("ACCESS_TOKEN");
        System.out.println(JSON.toJSON(cfg));
    }
}
