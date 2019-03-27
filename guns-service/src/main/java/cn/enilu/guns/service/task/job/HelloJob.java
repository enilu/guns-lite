package cn.enilu.guns.service.task.job;

import cn.enilu.guns.bean.entity.system.Cfg;
import cn.enilu.guns.dao.system.CfgRepository;
import cn.enilu.guns.service.task.JobExecuter;
import cn.enilu.guns.utils.DateUtil;
import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Map;

/**
 * HelloJob
 *
 * @author zt
 * @version 2018/12/30 0030
 */
@Component
public class HelloJob extends JobExecuter {
    @Autowired
    private CfgRepository cfgRepository;
    @Override
    public void execute(Map<String, Object> dataMap) throws Exception {
        Cfg cfg = cfgRepository.findById(1L).get();
        cfg.setCfgDesc(cfg.getCfgDesc()+"update by "+ DateUtil.getTime());
        cfgRepository.save(cfg);
        System.out.println("hello :"+JSON.toJSONString(dataMap));
    }
}
