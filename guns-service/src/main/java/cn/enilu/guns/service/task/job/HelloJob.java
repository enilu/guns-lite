package cn.enilu.guns.service.task.job;

import cn.enilu.guns.bean.entity.system.Cfg;
import cn.enilu.guns.service.system.CfgService;
import cn.enilu.guns.service.task.JobExecuter;
import cn.enilu.guns.utils.DateUtil;
import com.alibaba.fastjson.JSON;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
    private Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired
    private CfgService cfgService;
    @Override
    public void execute(Map<String, Object> dataMap) throws Exception {
        Cfg cfg = cfgService.get(1L);
        cfg.setCfgDesc("update by "+ DateUtil.getTime());
        cfgService.update(cfg);
        logger.info("hello :"+JSON.toJSONString(dataMap));
    }
}
