package cn.enilu.guns.admin.core.intercept;

import cn.enilu.guns.admin.core.base.controller.BaseController;
import cn.enilu.guns.admin.core.shiro.ShiroKit;
import cn.enilu.guns.admin.core.util.ApiMenuFilter;
import cn.enilu.guns.admin.core.util.HttpSessionHolder;
import cn.enilu.guns.bean.vo.node.MenuNode;
import cn.enilu.guns.service.system.MenuService;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 静态调用session的拦截器
 *
 * @author fengshuonan
 * @date 2016年11月13日 下午10:15:42
 */
@Aspect
@Component
public class SessionInterceptor extends BaseController {
    @Autowired
    MenuService menuService;
    @Pointcut("execution(* cn.enilu.guns.admin.*..controller.*.*(..))")
    public void cutService() {
    }

    @Around("cutService()")
    public Object sessionKit(ProceedingJoinPoint point) throws Throwable {
        HttpServletRequest request = super.getHttpServletRequest();
        HttpSessionHolder.put(request.getSession());
       try{
           List<Integer> roleList = ShiroKit.getUser().getRoleList();
           List<MenuNode> menuNodes =  menuService.getMenusByRoleIds(roleList);
           List<MenuNode> titles = MenuNode.buildTitle(menuNodes);
           titles = ApiMenuFilter.build(titles);

           request.setAttribute("titles", titles);
       }catch (Exception e){

       }

        try {
            return point.proceed();

        } finally {
            HttpSessionHolder.remove();
        }
    }
}
