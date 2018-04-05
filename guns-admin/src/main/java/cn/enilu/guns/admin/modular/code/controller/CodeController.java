package cn.enilu.guns.admin.modular.code.controller;

import cn.enilu.guns.admin.core.base.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 代码生成控制器
 *
 * @author fengshuonan
 * @Date 2017年11月30日16:39:19
 */
@Controller
@RequestMapping("/code")
public class CodeController extends BaseController {

    private static String PREFIX = "/code";

//    @Autowired
//    private TableService tableService;
//
//    @Autowired
//    private DruidProperties druidProperties;
//
//
//    /**
//     * 跳转到代码生成主页
//     */
//    @RequestMapping("")
//    public String blackboard(Model model) {
//        model.addAttribute("tables", tableService.getAllTables());
//        model.addAttribute("params", DefaultTemplateFactory.getDefaultParams());
//        model.addAttribute("templates", DefaultTemplateFactory.getDefaultTemplates());
//        return PREFIX + "/code.html";
//    }
//
//    /**
//     * 生成代码
//     */
//    @ApiOperation("生成代码")
//    @RequestMapping(value = "/generate", method = RequestMethod.POST)
//    @ResponseBody
//    public Object generate(GenQo genQo) {
//        genQo.setUrl(druidProperties.getUrl());
//        genQo.setUserName(druidProperties.getUsername());
//        genQo.setPassword(druidProperties.getPassword());
//        WebGeneratorConfig webGeneratorConfig = new WebGeneratorConfig(genQo);
//        webGeneratorConfig.doMpGeneration();
//        webGeneratorConfig.doGunsGeneration();
//        return SUCCESS_TIP;
//    }
}
