package cn.enilu.guns.api.controller.cms;

import cn.enilu.guns.api.controller.BaseController;
import cn.enilu.guns.bean.annotion.core.BussinessLog;
import cn.enilu.guns.bean.dictmap.CommonDict;
import cn.enilu.guns.bean.entity.cms.Channel;
import cn.enilu.guns.bean.vo.front.Rets;
import cn.enilu.guns.dao.cms.ChannelRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 栏目管理
 */
@RestController
@RequestMapping("/channel")
public class ChannelMgrController extends BaseController {
    @Autowired
    private ChannelRepository channelRepository;
    @RequestMapping(method = RequestMethod.POST)
    @BussinessLog(value = "编辑栏目",key="name",dict = CommonDict.class)
    public Object save(@ModelAttribute Channel channel){
        channelRepository.save(channel);
        return Rets.success();
    }
    @RequestMapping(method = RequestMethod.DELETE)
    @BussinessLog(value = "删除栏目",key="id",dict = CommonDict.class)
    public Object remove(Long id){
        channelRepository.deleteById(id);
        return Rets.success();
    }

    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public Object list(){
        List<Channel> list = channelRepository.findAll();
        return Rets.success(list);
    }
}
