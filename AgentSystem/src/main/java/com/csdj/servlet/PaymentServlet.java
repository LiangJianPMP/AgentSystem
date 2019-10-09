package com.csdj.servlet;

import com.csdj.service.account.AccountService;
import com.csdj.service.systemconfig.SystemConfigService;
import com.csdj.util.JsonTools;
import net.sf.jsqlparser.statement.select.Limit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * 预支付业务分配器
 */
@Controller
public class PaymentServlet {

    @Autowired
    private AccountService accountService;

    @Autowired
    private SystemConfigService systemConfigService;

    @RequestMapping(value = "/payment.html",method = RequestMethod.GET)
    public String payment(Model model, @RequestParam int id,@RequestParam String userName){
        model.addAttribute("id",id);
        model.addAttribute("userName",userName);
        model.addAttribute("systemConfigs",systemConfigService.show_all_systemConfig());
        return "payment";
    }

    @RequestMapping(value = "/showAccount.json",method = RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> showAccount(@RequestParam int page, @RequestParam int limit,
                            @RequestParam(required = false)Integer userId,
                            @RequestParam(required = false)Integer detailType,
                            @RequestParam(required = false)String startTime,
                            @RequestParam(required = false)String endTime){
        return JsonTools.jsonData(accountService.show_AccountDetail_Count(userId), accountService.show_All_AccountDetail(page,limit,userId,detailType,startTime,endTime));
    }

}
