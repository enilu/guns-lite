package cn.enilu.guns.admin.core.aop;

import cn.enilu.guns.admin.common.exception.BizExceptionEnum;
import cn.enilu.guns.admin.core.exception.GunsException;
import cn.enilu.guns.admin.core.log.LogManager;
import cn.enilu.guns.admin.core.log.factory.LogTaskFactory;
import cn.enilu.guns.admin.core.shiro.ShiroKit;
import cn.enilu.guns.admin.core.support.HttpKit;
import cn.enilu.guns.admin.common.exception.InvalidKaptchaException;
import cn.enilu.guns.admin.core.base.tips.ErrorTip;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.CredentialsException;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.session.InvalidSessionException;
import org.apache.shiro.session.UnknownSessionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.UndeclaredThrowableException;

/**
 * 全局的的异常拦截器（拦截所有的控制器）（带有@RequestMapping注解的方法上都会拦截）
 *
 * @author fengshuonan
 * @date 2016年11月12日 下午3:19:56
 */
@ControllerAdvice
public class GlobalExceptionHandler {

	private Logger log = LoggerFactory.getLogger(this.getClass());

	/**
	 * 拦截业务异常
	 *
	 * @author fengshuonan
	 */
	@ExceptionHandler(GunsException.class)
	@ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
	@ResponseBody
	public ErrorTip notFount(GunsException e) {
		LogManager.me().executeLog(LogTaskFactory.exceptionLog(ShiroKit.getUser().getId(), e));
		HttpKit.getRequest().setAttribute("tip", e.getMessage());
		log.error("业务异常:", e);
		return new ErrorTip(e.getCode(), e.getMessage());
	}

	/**
	 * 用户未登录
	 *
	 * @author fengshuonan
	 */
	@ExceptionHandler(AuthenticationException.class)
	@ResponseStatus(HttpStatus.UNAUTHORIZED)
	public String unAuth(AuthenticationException e) {
		log.error("用户未登陆：", e);
		return "/login.html";
	}

	/**
	 * 账号被冻结
	 *
	 * @author fengshuonan
	 */
	@ExceptionHandler(DisabledAccountException.class)
	@ResponseStatus(HttpStatus.UNAUTHORIZED)
	public String accountLocked(DisabledAccountException e, Model model) {
		String username = HttpKit.getRequest().getParameter("username");
		LogManager.me().executeLog(LogTaskFactory.loginLog(username, "账号被冻结", HttpKit.getIp()));
		model.addAttribute("tips", "账号被冻结");
		return "/login.html";
	}

	/**
	 * 账号密码错误
	 *
	 * @author fengshuonan
	 */
	@ExceptionHandler(CredentialsException.class)
	@ResponseStatus(HttpStatus.UNAUTHORIZED)
	public String credentials(CredentialsException e, Model model) {
		String username = HttpKit.getRequest().getParameter("username");
		LogManager.me().executeLog(LogTaskFactory.loginLog(username, "账号密码错误", HttpKit.getIp()));
		model.addAttribute("tips", "账号密码错误");
		return "/login.html";
	}

	/**
	 * 验证码错误
	 *
	 * @author fengshuonan
	 */
	@ExceptionHandler(InvalidKaptchaException.class)
	@ResponseStatus(HttpStatus.BAD_REQUEST)
	public String credentials(InvalidKaptchaException e, Model model) {
		String username = HttpKit.getRequest().getParameter("username");
		LogManager.me().executeLog(LogTaskFactory.loginLog(username, "验证码错误", HttpKit.getIp()));
		model.addAttribute("tips", "验证码错误");
		return "/login.html";
	}

	/**
	 * 无权访问该资源
	 *
	 * @author fengshuonan
	 */
	@ExceptionHandler(UndeclaredThrowableException.class)
	@ResponseStatus(HttpStatus.UNAUTHORIZED)
	@ResponseBody
	public ErrorTip credentials(UndeclaredThrowableException e) {
		HttpKit.getRequest().setAttribute("tip", "权限异常");
		log.error("权限异常!", e);
		return new ErrorTip(BizExceptionEnum.NO_PERMITION.getCode(), BizExceptionEnum.NO_PERMITION.getMessage());
	}

	/**
	 * 拦截未知的运行时异常
	 *
	 * @author fengshuonan
	 */
	@ExceptionHandler(RuntimeException.class)
	@ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
	@ResponseBody
	public ErrorTip notFount(RuntimeException e) {
		LogManager.me().executeLog(LogTaskFactory.exceptionLog(ShiroKit.getUser().getId(), e));
		HttpKit.getRequest().setAttribute("tip", "服务器未知运行时异常");
		log.error("运行时异常:", e);
		return new ErrorTip(BizExceptionEnum.SERVER_ERROR.getCode(), BizExceptionEnum.SERVER_ERROR.getMessage());
	}

	/**
	 * session失效的异常拦截
	 *
	 * @author stylefeng
	 * @Date 2017/6/7 21:02
	 */
	@ExceptionHandler(InvalidSessionException.class)
	@ResponseStatus(HttpStatus.BAD_REQUEST)
	public String sessionTimeout(InvalidSessionException e, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		model.addAttribute("tips", "session超时");
		assertAjax(request, response);
		return "/login.html";
	}

	/**
	 * session异常
	 *
	 * @author stylefeng
	 * @Date 2017/6/7 21:02
	 */
	@ExceptionHandler(UnknownSessionException.class)
	@ResponseStatus(HttpStatus.BAD_REQUEST)
	public String sessionTimeout(UnknownSessionException e, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		model.addAttribute("tips", "session超时");
		assertAjax(request, response);
		return "/login.html";
	}

	private void assertAjax(HttpServletRequest request, HttpServletResponse response) {
		if (request.getHeader("x-requested-with") != null
				&& request.getHeader("x-requested-with").equalsIgnoreCase("XMLHttpRequest")) {
			// 如果是ajax请求响应头会有，x-requested-with
			response.setHeader("sessionstatus", "timeout");// 在响应头设置session状态
		}
	}

}
