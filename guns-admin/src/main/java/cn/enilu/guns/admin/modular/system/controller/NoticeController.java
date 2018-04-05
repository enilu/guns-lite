package cn.enilu.guns.admin.modular.system.controller;

import cn.enilu.guns.admin.common.annotion.BussinessLog;
import cn.enilu.guns.admin.common.constant.dictmap.NoticeMap;
import cn.enilu.guns.admin.common.exception.BizExceptionEnum;
import cn.enilu.guns.admin.core.base.controller.BaseController;
import cn.enilu.guns.admin.core.exception.GunsException;
import cn.enilu.guns.admin.core.shiro.ShiroKit;
import cn.enilu.guns.admin.core.util.BeanUtil;
import cn.enilu.guns.admin.modular.system.warpper.NoticeWrapper;
import cn.enilu.guns.bean.entity.system.Notice;
import cn.enilu.guns.dao.system.SysNoticeRepository;
import cn.enilu.guns.service.system.LogObjectHolder;
import cn.enilu.guns.service.system.impl.ConstantFactory;
import cn.enilu.guns.utils.ToolUtil;
import com.google.common.base.Strings;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * 通知控制器
 *
 * @author fengshuonan
 * @Date 2017-05-09 23:02:21
 */
@Controller
@RequestMapping("/notice")
public class NoticeController extends BaseController {

    private String PREFIX = "/system/notice/";

    @Resource
    private SysNoticeRepository sysNoticeRepository;



    /**
     * 跳转到通知列表首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "notice.html";
    }

    /**
     * 跳转到添加通知
     */
    @RequestMapping("/notice_add")
    public String noticeAdd() {
        return PREFIX + "notice_add.html";
    }

    /**
     * 跳转到修改通知
     */
    @RequestMapping("/notice_update/{noticeId}")
    public String noticeUpdate(@PathVariable Integer noticeId, Model model) {
        Notice notice = sysNoticeRepository.findOne(noticeId);
        model.addAttribute("notice",notice);
        LogObjectHolder.me().set(notice);
        return PREFIX + "notice_edit.html";
    }

    /**
     * 跳转到首页通知
     */
    @RequestMapping("/hello")
    public String hello() {
        List<Notice> notices = (List<Notice>) sysNoticeRepository.findAll();
        super.setAttr("noticeList",notices);
        return "/blackboard.html";
    }

    /**
     * 获取通知列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
        List<Notice> list = null;
        if(Strings.isNullOrEmpty(condition)) {
         list = (List<Notice>) this.sysNoticeRepository.findAll();
        }else{
            list = sysNoticeRepository.findByTitleLike("%"+condition+"%");
        }
        return super.warpObject(new NoticeWrapper(BeanUtil.objectsToMaps(list)));
    }

    /**
     * 新增通知
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    @BussinessLog(value = "新增通知",key = "title",dict = NoticeMap.class)
    public Object add(Notice notice) {
        if (ToolUtil.isOneEmpty(notice, notice.getTitle(), notice.getContent())) {
            throw new GunsException(BizExceptionEnum.REQUEST_NULL);
        }
        notice.setCreater(ShiroKit.getUser().getId().intValue());
        notice.setCreatetime(new Date());
       sysNoticeRepository.save(notice);
        return SUCCESS_TIP;
    }

    /**
     * 删除通知
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    @BussinessLog(value = "删除通知",key = "noticeId",dict = NoticeMap.class)
    public Object delete(@RequestParam Integer noticeId) {

        //缓存通知名称
        LogObjectHolder.me().set(ConstantFactory.me().getNoticeTitle(noticeId));

        this.sysNoticeRepository.delete(noticeId);

        return SUCCESS_TIP;
    }

    /**
     * 修改通知
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    @BussinessLog(value = "修改通知",key = "title",dict = NoticeMap.class)
    public Object update(Notice notice) {
        if (ToolUtil.isOneEmpty(notice, notice.getId(), notice.getTitle(), notice.getContent())) {
            throw new GunsException(BizExceptionEnum.REQUEST_NULL);
        }
        Notice old = sysNoticeRepository.findOne(notice.getId());
        old.setTitle(notice.getTitle());
        old.setContent(notice.getContent());
        sysNoticeRepository.save(old);
        return SUCCESS_TIP;
    }

}
