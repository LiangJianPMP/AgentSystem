package com.csdj.servlet;

import com.csdj.service.log.LogService;
import com.csdj.util.JsonTools;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * 日志操作分配器
 */
@Controller
public class LogServlet {

    @Autowired
    private LogService logService;

    @RequestMapping(value = "/log.html",method = RequestMethod.GET)
    public String log(@RequestParam String userName, Model model){
        model.addAttribute("userName",userName);
        return "log";
    }

    @RequestMapping(value = "/showLog.json",method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> showLog(@RequestParam int page, @RequestParam int limit, @RequestParam(required = false)String operateDatetime){
        return JsonTools.jsonData(logService.show_Log_Count(), logService.show_All_Logs(page,limit,operateDatetime));
    }

}
