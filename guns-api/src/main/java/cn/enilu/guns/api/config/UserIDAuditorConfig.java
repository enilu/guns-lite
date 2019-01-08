package cn.enilu.guns.api.config;

import cn.enilu.guns.dao.cache.TokenCache;
import cn.enilu.guns.utils.HttpKit;
import cn.enilu.guns.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
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
    @Autowired
    private TokenCache tokenCache;
    @Override
    public Long getCurrentAuditor() {
        String token = HttpKit.getRequest().getHeader("Authorization");
        if(StringUtils.isNotEmpty(token)) {
            return tokenCache.get(token);
        }
        return null;
    }
}
