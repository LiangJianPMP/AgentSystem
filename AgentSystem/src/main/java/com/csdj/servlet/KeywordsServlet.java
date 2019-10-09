package com.csdj.servlet;

import com.csdj.entity.Keywords;
import com.csdj.service.keywords.KeywordsService;
import com.csdj.service.systemconfig.SystemConfigService;
import com.csdj.util.JsonTools;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

/**
 * 关键词业务分配器
 */
@Controller
public class KeywordsServlet {

    @Autowired
    private KeywordsService keywordsService;

    @Autowired
    private SystemConfigService systemConfigService;

    @RequestMapping(value = "/keywords.html",method = RequestMethod.GET)
    public String keywords(@ModelAttribute Keywords keywords, Model model){
        model.addAttribute("systemConfigs",systemConfigService.show_all_systemConfig());
        return "keywords";
    }

    @RequestMapping(value = "/showKeywords.json",method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> showKeywords(@RequestParam int page,@RequestParam int limit,
                                            @RequestParam(required = false)String keywords){
        return JsonTools.jsonData(keywordsService.show_keywords_Count(), keywordsService.show_All_Keywords(page,limit,keywords));
    }

    @RequestMapping(value = "/updKeywords.html",method = RequestMethod.POST)
    public String updKeywords(Keywords keywords){
        keywordsService.upd_Keywords(keywords);
        return "keywords";
    }

    @RequestMapping(value = "/updStatus.html",method = RequestMethod.GET)
    public String updStatus(@RequestParam int id,@RequestParam int isUse){
        keywordsService.del_Keywords(id,isUse);
        return "redirect:/keywords.html";
    }

}
