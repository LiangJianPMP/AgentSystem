package com.csdj.servlet;


import com.csdj.entity.SystemConfig;
import com.csdj.entity.User;
import com.csdj.service.UserService;
import com.csdj.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/baobiao")
public class UserController {

    @Autowired
    UsersService userService;



    @RequestMapping("/show")
    public ModelAndView show(ModelAndView model, @RequestParam("quiz") String quiz){
        String name = quiz;
        if(name.equals("代理商账户余额报表")){
            List<User> users = userService.getAgentBalance();
            model.addObject("reportForms",users);
            model.setViewName("reportForms");
        }
        else if (name.equals("预付款流水报表")){
            List<User> accountDetail = userService.getPayment();
            model.addObject("detail",accountDetail);
            model.setViewName("reportForms");
        }
        else if (name.equals("代理商流水报表")){
            List<User> accountDetail = userService.getPayment();
            model.addObject("detail",accountDetail);
            model.setViewName("reportForms");
        }
        else if (name.equals("产品分类数量")){
            List<SystemConfig> systemconfig = userService.totalsummoney();
            model.addObject("sys",systemconfig);
            model.setViewName("reportForms");
        }

        return model;
    }




}
