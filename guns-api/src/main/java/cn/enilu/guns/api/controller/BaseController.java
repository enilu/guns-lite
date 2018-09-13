package cn.enilu.guns.api.controller;


import cn.enilu.guns.bean.vo.SpringContextHolder;
import cn.enilu.guns.dao.cache.TokenCache;

import javax.servlet.http.HttpServletRequest;

/**
 * 基础controller
 * @version 2018-07-25
 * @author zt
 */
public class BaseController {
    /**
     * 根据token获取用户id，如果不存在则抛出异常
     * @param request
     * @return
     */
    public Long getIdUser(HttpServletRequest request) {
        String token = request.getHeader("Authorization");

        Long idUser = SpringContextHolder.getBean(TokenCache.class).get(token);
        if (idUser == null) {
            throw new RuntimeException("用户不存在");
        }
        return idUser;
    }

    /**
     * 获取客户端token
     * @param request
     * @return
     */
    public String getToken(HttpServletRequest request) {
        return request.getHeader("Authorization");
    }

    /**
     * 获取客户端ip
     * @param req
     * @return
     */
    public String getRealIp(HttpServletRequest req) {
        String ip = req.getHeader("x-forwarded-for");

        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = req.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = req.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = req.getRemoteAddr();
        }
        if (ip == null || ip.length() == 0 || "0:0:0:0:0:0:0:1".equals(ip)) {
            ip = "127.0.0.1";
        }
        return ip;
    }
}
