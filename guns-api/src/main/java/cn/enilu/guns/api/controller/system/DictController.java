package cn.enilu.guns.api.controller.system;

import cn.enilu.guns.api.controller.BaseController;
import cn.enilu.guns.bean.annotion.core.BussinessLog;
import cn.enilu.guns.bean.entity.system.Dict;
import cn.enilu.guns.bean.enumeration.BizExceptionEnum;
import cn.enilu.guns.bean.exception.GunsException;
import cn.enilu.guns.bean.vo.front.Rets;
import cn.enilu.guns.dao.system.DictRepository;
import cn.enilu.guns.service.system.DictService;
import cn.enilu.guns.utils.BeanUtil;
import cn.enilu.guns.utils.StringUtils;
import cn.enilu.guns.utils.ToolUtil;
import cn.enilu.guns.warpper.DictWarpper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * DictController
 *
 * @author enilu
 * @version 2018/11/17 0017
 */
@RestController
@RequestMapping("/dict")
public class DictController extends BaseController {
    @Autowired
    private DictRepository dictRepository;
    @Autowired
    private DictService dictService;

    /**
     * 获取所有字典列表
     */
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public Object list(String name) {
        if(StringUtils.isNotEmpty(name)){
            List<Dict> list = dictRepository.findByNameLike(name);
            return Rets.success(new DictWarpper(BeanUtil.objectsToMaps(list)).warp());
        }
        List<Dict> list = dictRepository.findByPid(0L);
        return Rets.success(new DictWarpper(BeanUtil.objectsToMaps(list)).warp());
    }

    @RequestMapping(method = RequestMethod.POST)
    @BussinessLog(value = "添加字典", key = "dictName")
    public Object add(String dictName, String dictValues) {
        if (ToolUtil.isOneEmpty(dictName, dictValues)) {
            throw new GunsException(BizExceptionEnum.REQUEST_NULL);
        }
        this.dictService.addDict(dictName, dictValues);
        return Rets.success();
    }

    @RequestMapping(method = RequestMethod.PUT)
    @BussinessLog(value = "修改字典", key = "dictName")
    public Object update(Long id,String dictName, String dictValues) {
        if (ToolUtil.isOneEmpty(dictName, dictValues)) {
            throw new GunsException(BizExceptionEnum.REQUEST_NULL);
        }
        this.dictService.editDict(id,dictName, dictValues);
        return Rets.success();
    }


    @RequestMapping(method = RequestMethod.DELETE)
    @BussinessLog(value = "删除字典", key = "id")
    public Object delete(@RequestParam Long id) {
        this.dictService.delteDict(id);
        return Rets.success();
    }

}
