package cn.enilu.guns.api.controller.system;

import cn.enilu.guns.api.controller.BaseController;
import cn.enilu.guns.bean.annotion.core.BussinessLog;
import cn.enilu.guns.bean.constant.factory.PageFactory;
import cn.enilu.guns.bean.entity.system.Cfg;
import cn.enilu.guns.bean.enumeration.BizExceptionEnum;
import cn.enilu.guns.bean.exception.GunsException;
import cn.enilu.guns.bean.vo.front.Rets;
import cn.enilu.guns.service.system.CfgService;
import cn.enilu.guns.utils.Maps;
import cn.enilu.guns.utils.ToolUtil;
import cn.enilu.guns.utils.factory.Page;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * CfgController
 *
 * @author enilu
 * @version 2018/11/17 0017
 */
@RestController
@RequestMapping("/cfg")
public class CfgController extends BaseController {
    private Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired
    private CfgService cfgService;

    /**
     * 查询操作日志列表
     */
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public Object list(@RequestParam(required = false) String cfgName, @RequestParam(required = false) String cfgValue) {
        Page<Cfg> page = new PageFactory<Cfg>().defaultPage();

        page = cfgService.findPage(page, Maps.newHashMap("cfgName",cfgName,"cfgValue",cfgValue));
        page.setRecords(page.getRecords());
        return Rets.success(page);
    }
    @RequestMapping(method = RequestMethod.POST)
    @BussinessLog(value = "编辑参数", key = "cfgName")
    public Object save(@ModelAttribute Cfg cfg){
        if (ToolUtil.isOneEmpty(cfg, cfg.getCfgName(),cfg.getCfgValue())) {
            throw new GunsException(BizExceptionEnum.REQUEST_NULL);
        }
        cfgService.save(cfg);
        return Rets.success();
    }
    @RequestMapping(method = RequestMethod.DELETE)
    @BussinessLog(value = "删除参数", key = "id")
    public Object remove(Long id){
        logger.info("id:{}",id);
        if (ToolUtil.isEmpty(id)) {
            throw new GunsException(BizExceptionEnum.REQUEST_NULL);
        }
        cfgService.delete(id);
        return Rets.success();
    }
}
