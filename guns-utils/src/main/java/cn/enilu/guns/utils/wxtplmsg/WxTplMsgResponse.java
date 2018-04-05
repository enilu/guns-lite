package cn.enilu.guns.utils.wxtplmsg;

/**
 * Created by zt on 2017/3/4 0004.
 */
public class WxTplMsgResponse {
    private boolean success = false;
    private String code;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }
}
