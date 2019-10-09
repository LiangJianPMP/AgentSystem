package com.csdj.servlet;

import com.csdj.entity.AccountDetail;
import com.csdj.entity.SystemConfig;
import com.csdj.service.account.AccountService;
import com.csdj.service.systemconfig.SystemConfigService;
import com.csdj.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * 分配器
 */
@Controller
public class FinanceServlet {

    @Autowired
    private UserService userService;

    @Autowired
    private SystemConfigService systemConfigService;

    @Autowired
    private AccountService accountService;

    @RequestMapping(value = "/finance.html",method = RequestMethod.GET)
    public String finance(Model model, @ModelAttribute AccountDetail accountDetail){
        model.addAttribute("systemConfigs",systemConfigService.show_all_systemConfig());
        model.addAttribute("users",userService.show_All_User());
        return "finance";
    }

    @RequestMapping(value = "/addFinance.html",method = RequestMethod.POST)
    public String finance(AccountDetail accountDetail, HttpServletRequest request){
        List<SystemConfig> systemConfigs = systemConfigService.show_all_systemConfig();
        for (SystemConfig data : systemConfigs){
            if (data.getId().equals(accountDetail.getDetailType())){
                accountDetail.setDetailTypeName(data.getConfigTypeName());
                break;
            }
        }
        accountDetail.setDetailDateTime(new Date());
        boolean is = accountService.add_Account(accountDetail);
        if (is){
            request.setAttribute("show","恭喜你，添加成功！");
            return "redirect:/finance.html";
        }else{
            request.setAttribute("show","对不起，添加失败！");
            return "finance";
        }

    }

}
