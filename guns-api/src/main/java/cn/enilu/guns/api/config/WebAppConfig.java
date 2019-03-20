package cn.enilu.guns.api.config;

import cn.enilu.guns.api.interceptor.SecurityInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * 系统配置<br>
 *  配置拦截器
 * @version 2018-07-24
 *
 * @author enilu
 */
@Configuration
public class WebAppConfig extends WebMvcConfigurerAdapter {
    /**
     * 定义排除拦截路径
     */
    public String[] EXCLUDE_PATH_PATTERN = {
            "/file/**","/offcialSite","/offcialSite/*",
            "/druid/**","/validate/*",
            "/account/register", "/account/login", "/account/logout",
            "/error", "/swagger-resources","/v2/api-docs","/swagger-ui.html","/webjars/**"};

    /**
     * 注册自定义拦截器，添加拦截路径和排除拦截路径
     * @param registry
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new SecurityInterceptor()).addPathPatterns("/**").excludePathPatterns(EXCLUDE_PATH_PATTERN);

    }
}
