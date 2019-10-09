package com.csdj.servlet;

import com.csdj.entity.Role;
import com.csdj.service.role.RoleService;
import com.csdj.util.JsonTools;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * 角色业务分配器
 */
@Controller
public class RoleServlet {

    @Autowired
    private RoleService roleService;

    @RequestMapping(value = "/role.html",method = RequestMethod.GET)
    public String role(@ModelAttribute Role role){
        return "role";
    }

    @RequestMapping(value = "/showRole.json",method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> showRole(@RequestParam int page,@RequestParam int limit){
        return JsonTools.jsonData(roleService.show_Role_Count(), roleService.show_All_Role(page,limit));
    }

    @RequestMapping(value = "/delRole.html/{id}",method = RequestMethod.GET)
    public String delRole(@PathVariable int id){
        roleService.del_Role(id);
        return "redirect:/role.html";
    }

    @RequestMapping(value = "/updRole.html",method = RequestMethod.POST)
    public String updRole(Role role){
        role.setLastUpdateTime(new Date());
        roleService.upd_Role(role);
        return "redirect:/role.html";
    }

    @RequestMapping(value = "/addRole.html",method = RequestMethod.POST)
    public String addRole(Role role){
        role.setCreatedBy("admin");
        role.setCreationTime(new Date());
        roleService.add_Role(role);
        return "redirect:/role.html";
    }

}
