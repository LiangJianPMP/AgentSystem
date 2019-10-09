package com.csdj.servlet;

import com.csdj.entity.Premission;
import com.csdj.service.function.FunctionService;
import com.csdj.service.premission.PremissionService;
import com.csdj.service.role.RoleService;
import com.csdj.util.JsonTools;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 用户权限业务分配器
 */
@Controller
public class AuthorityServlet {

    @Autowired
    private PremissionService premissionService;

    @Autowired
    private FunctionService functionService;

    @Autowired
    private RoleService roleService;

    @RequestMapping(value = "/authority.html",method = RequestMethod.GET)
    public String authority(Model model, @ModelAttribute Premission premission){
        model.addAttribute("roles",roleService.show_All_RoleName());
        model.addAttribute("functions",functionService.show_All_Function());
        return "authority";
    }

    @RequestMapping(value = "/showFunction.json",method = RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> showFunction(){
        return JsonTools.jsonData(functionService.show_All_Function().size(), functionService.show_All_Function());
    }

    @RequestMapping(value = "/updFunction.html",method = RequestMethod.POST)
    public String updFunction(Premission premission){
        Integer id = premissionService.show_Id(premission.getRoleId(),premission.getFunctionId());
        if (id!=null && premission.getIsStart()==0){
            premissionService.del_Premission(id);
        }else if (id==null){
            premission.setCreatedBy("admin");
            premission.setCreationTime(new Date());
            premissionService.add_Premission(premission);
        }
        return "redirect:/authority.html";
    }

    @RequestMapping(value = "/showFunctionId.json",method = RequestMethod.GET)
    @ResponseBody
    public List<Integer> showFunction(@RequestParam int roleId){
        return premissionService.show_FunctionId(roleId);
    }

}
