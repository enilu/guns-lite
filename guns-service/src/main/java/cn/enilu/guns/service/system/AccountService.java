package cn.enilu.guns.service.system;

/**
 * AccountService
 *
 * @author zt
 * @version 2018/9/12 0012
 */
public interface AccountService {
    String login(Long idUser);

    void logout(String token);

}
