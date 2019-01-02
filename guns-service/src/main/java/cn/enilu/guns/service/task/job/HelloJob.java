package cn.enilu.guns.service.task.job;

import cn.enilu.guns.service.task.JobExecuter;
import com.alibaba.fastjson.JSON;
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
    @Override
    public void execute(Map<String, Object> dataMap) throws Exception {
        System.out.println("hello :"+JSON.toJSONString(dataMap));
    }
}
