package com.csdj.servlet;

import com.csdj.entity.Logs;
import com.csdj.service.logs.LogsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class LogsServlet {
    @Autowired
    LogsService service;

    @RequestMapping(value = "logs/getLogs.json")
    @ResponseBody
    public List<Logs> getLogsInfo(){
        return service.getLogsInfo();
    }
}
