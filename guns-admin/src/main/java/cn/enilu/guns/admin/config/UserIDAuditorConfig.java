package cn.enilu.guns.admin.config;

import cn.enilu.guns.bean.core.ShiroUser;
import cn.enilu.guns.shiro.ShiroKit;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.domain.AuditorAware;

/**
 * UserIDAuditorBean
 *
 * @author zt
 * @version 2019/1/8 0008
 */
@Configuration
public class UserIDAuditorConfig implements AuditorAware<Long> {
    @Override
    public Long getCurrentAuditor() {
        ShiroUser shiroUser = ShiroKit.getUser();
        if(shiroUser!=null){
            return shiroUser.getId();
        }
        return null;
    }
}
