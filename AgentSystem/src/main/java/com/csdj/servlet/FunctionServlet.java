package com.csdj.servlet;

import com.csdj.entity.Function;
import com.csdj.entity.SystemConfig;
import com.csdj.service.FunctionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class FunctionServlet {
    @Autowired
    private FunctionService FunctionService;


    @RequestMapping(value = "appadd", method = RequestMethod.GET)
    @ResponseBody
    public Boolean appaddA(SystemConfig SystemConfig) {
        boolean ai = false;
        boolean trueandfalse=FunctionService.appadd(SystemConfig);
        if(trueandfalse){
            ai=true;
        }
        return   ai;

    }




    @RequestMapping(value = "nianadd",method = RequestMethod.GET)
    @ResponseBody
    public Boolean appadd(SystemConfig SystemConfig) {
        System.out.println(SystemConfig.getConfigValue());
        boolean ai=false;
        boolean a=FunctionService.nianupdate(SystemConfig);
        if(a){
            ai=true;
        }




        return  ai;
    }
}
