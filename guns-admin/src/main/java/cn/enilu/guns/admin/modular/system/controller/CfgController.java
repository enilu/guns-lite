package cn.enilu.guns.admin.modular.system.controller;

import cn.enilu.guns.admin.core.base.controller.BaseController;
import cn.enilu.guns.bean.annotion.core.BussinessLog;
import cn.enilu.guns.bean.dictmap.CfgDict;
import cn.enilu.guns.bean.entity.system.Cfg;
import cn.enilu.guns.dao.system.CfgRepository;
import cn.enilu.guns.service.system.CfgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * CfgController
 *
 * @author enilu
 * @version 2018/8/9 0009
 */

@Controller
@RequestMapping("/cfg")
public class CfgController extends BaseController {
    @Autowired
    private CfgRepository cfgRepository;
    @Autowired
    private CfgService cfgService;
    private static String PREFIX = "/system/cfg/";
    /**
     * 跳转到参数首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "cfg.html";
    }

    /**
     * 跳转到添加参数
     */
    @RequestMapping("/cfg_add")
    public String orgAdd() {
        return PREFIX + "cfg_add.html";
    }

    /**
     * 跳转到修改参数
     */
    @RequestMapping("/cfg_update/{cfgId}")
    public String orgUpdate(@PathVariable Long cfgId, Model model) {
        Cfg cfg = cfgService.get(cfgId);
        model.addAttribute("item",cfg);
        return PREFIX + "cfg_edit.html";
    }

    /**
     * 获取参数列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list() {
        return cfgRepository.findAll();
    }

    /**
     * 新增参数
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    @BussinessLog(value = "添加参数", key = "cfgName",dict = CfgDict.class)
    public Object add(Cfg cfg) {
        cfgRepository.save(cfg);
        return SUCCESS_TIP;
    }

    /**
     * 删除参数
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    @BussinessLog(value = "删除参数", key = "cfgId",dict = CfgDict.class)
    public Object delete(@RequestParam Long cfgId) {
        cfgRepository.deleteById(cfgId);
        return SUCCESS_TIP;
    }

    /**
     * 修改参数
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    @BussinessLog(value = "编辑参数", key = "cfgName",dict = CfgDict.class)
    public Object update(Cfg cfg) {
        cfgRepository.save(cfg);
        return SUCCESS_TIP;
    }

    /**
     * 参数详情
     */
    @RequestMapping(value = "/detail/{cfgId}")
    @ResponseBody
    public Object detail(@PathVariable("cfgId") Long cfgId) {
        return cfgService.get(cfgId);
    }

}