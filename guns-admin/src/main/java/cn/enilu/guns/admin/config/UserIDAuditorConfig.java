package cn.enilu.guns.admin.config;

import cn.enilu.guns.bean.core.ShiroUser;
import cn.enilu.guns.shiro.ShiroKit;
import cn.enilu.guns.utils.Constants;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.domain.AuditorAware;

import java.util.Optional;

/**
 * UserIDAuditorBean
 *
 * @author zt
 * @version 2019/1/8 0008
 */
@Configuration
public class UserIDAuditorConfig implements AuditorAware<Long> {
    @Override
    public Optional<Long> getCurrentAuditor() {
        ShiroUser shiroUser = ShiroKit.getUser();
        if(shiroUser!=null){
            return Optional.of(shiroUser.getId());
        }
        return Optional.of(Constants.SYSTEM_USER_ID);
    }
}
