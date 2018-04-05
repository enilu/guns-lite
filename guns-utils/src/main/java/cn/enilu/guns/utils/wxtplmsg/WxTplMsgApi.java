package cn.enilu.guns.utils.wxtplmsg;

import cn.enilu.guns.utils.HttpClientWrapper;
import com.alibaba.fastjson.JSON;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.HashMap;
import java.util.Map;

/**
 * 微信模版消息工具类
 * Created by zt on 2017/3/4 0004.
 */
public class WxTplMsgApi {
    private static Logger logger = LoggerFactory.getLogger(WxTplMsgApi.class);

    /**
     * 发送微信模版消息
     * @param templateId 模版id
     * @param wxOpenId 微信OpenId
     * @param params 消息参数
     * @param accessToken 微信token
     * @return
     */
    public static WxTplMsgResponse send(String templateId, String wxOpenId, Map<String, Object> params, String accessToken){
        logger.info("templateId:{},wxOpenId:{}",templateId,wxOpenId);
        WxTplMsgResponse response = new WxTplMsgResponse();
        String url = "https://api.weixin.qq.com/cgi-bin/message/template/send" + "?access_token=" + accessToken;
        Map<String, Object> paramMap = new HashMap<String, Object>();

        paramMap.put("touser", wxOpenId);
        paramMap.put("template_id", templateId);
        Map<String, Object> data = new HashMap<String, Object>();
        for (Map.Entry<String, Object> entry : params.entrySet()) {
            Object value = entry.getValue();
            if(value instanceof Map){
                data.put(entry.getKey(),value);
            }else {
                Map map = new HashMap<>();
                map.put("value",entry.getValue());
                data.put(entry.getKey(), map);
            }
        }
        paramMap.put("data", data);
        String result = "";
        //当前重试次数
        int retryNum = 0;
        do {
            try {
                result = HttpClientWrapper.create().setUrl(url).addParams(paramMap).setMethod(HttpClientWrapper.HttpMethod.POST).executeStr();

                Map resultMap = (Map) JSON.parse( result);
                response.setCode(resultMap.get("errcode").toString());
                if ("0".equals(resultMap.get("errcode").toString())) {
                    response.setSuccess(true);
                }
            }catch (Exception e){
                response.setSuccess(false);
            }
            logger.info("微信调用结果：{}", result);
        } while(response.getCode() == "-1" && (++retryNum) <= 3);
        return response;
    }
}
