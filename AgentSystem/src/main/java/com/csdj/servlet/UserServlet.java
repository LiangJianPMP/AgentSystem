package com.csdj.servlet;

import com.csdj.entity.SystemConfig;
import com.csdj.entity.User;
import com.csdj.service.UserService;
import com.csdj.service.role.RoleService;
import com.csdj.util.JsonTools;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
public class UserServlet {
    @Autowired
    private UserService userService;

    @Autowired
    private com.csdj.service.UserService userService2;

    @Autowired
    private RoleService roleService;

    @RequestMapping(value = "/user.html",method = RequestMethod.GET)
    public String user(@ModelAttribute User user, Model model){
        model.addAttribute("roles",roleService.show_All_RoleName());
        return "user";
    }

    @RequestMapping(value = "/showUser.json")
    @ResponseBody
    public Map<String,Object> showUser(@RequestParam int page, @RequestParam int limit,
                                       @RequestParam(required = false) String userCode,
                                       @RequestParam(required = false) Integer roleId,
                                       @RequestParam(required = false) Integer isStart){
        return JsonTools.jsonData(userService2.show_User_Count(), userService2.show_All_Users_roleNames(page,limit,userCode,roleId,isStart));
    }

    @RequestMapping(value = "/delUser.html/{id}",method = RequestMethod.GET)
    public String delUser(@PathVariable int id){
        userService2.del_User(id);
        return "redirect:/user.html";
    }

    @RequestMapping(value = "/addUser.html",method = RequestMethod.POST)
    public String addUser(User user){
        user.setCreatedBy("admin");
        user.setCreationTime(new Date());
        userService2.add_User(user);
        return "redirect:/user.html";
    }

    @RequestMapping(value = "/updUser.html",method = RequestMethod.POST)
    public String updUser(User user){
        user.setLastUpdateTime(new Date());
        userService2.upd_User(user);
        return "redirect:/user.html";
    }

    /*
     * 返回json数据
     * */
    @RequestMapping(value = "show",method = RequestMethod.GET)
    @ResponseBody
    public List<SystemConfig> Show(Object json){
        System.out.println("48848484");
        List<SystemConfig> list=userService.select();
        System.out.println(list);
        return userService.select();
    }

    /*
     *类型添加
     * */
    @RequestMapping(value = "typeadd",method = RequestMethod.POST)
    public ModelAndView show(ModelAndView ModelAndView, @RequestParam("type")String type,@RequestParam("enabled")String enabled){


        int isStart=1;

        if(enabled.equals("不启用")){
            isStart=2;
        }
        SystemConfig systemConfig=new SystemConfig();
        systemConfig.setConfigType(1);
        systemConfig.setConfigTypeName(type);
        systemConfig.setConfigTypeValue(15);
        systemConfig.setConfigValue("12");
        systemConfig.setIsStart(isStart);


        boolean trueandfalse=userService.typeadd(systemConfig);
        if(trueandfalse){
            ModelAndView.setViewName("finances");
        }else{
            System.out.println("失败了");

        }
        return ModelAndView;
    }


    /*
     *类型删除
     * */
    @RequestMapping(value = "typedelete",method = RequestMethod.GET)
    public ModelAndView typede(ModelAndView ModelAndView,@RequestParam("id") int id){


        boolean trueandfalse=userService.typedel(id);

        if(trueandfalse){
            ModelAndView.setViewName("finances");
        }else{
            System.out.append("删除失败");
        }

        return  ModelAndView;
    }


    /*
     * 根据id查询
     * */
    @RequestMapping(value = "update",method = RequestMethod.GET)
    @ResponseBody
    public List<SystemConfig> typeid(@RequestParam("id" ) int id, ModelAndView ModelAndView){
        System.out.println("进来了");
        List<SystemConfig> list=userService.typeid(id);

        return  list;
    }

    /*
     *修改财务类型
     */
    @RequestMapping(value = "typeupdate",method = RequestMethod.POST)
    public ModelAndView typeupdate(ModelAndView ModelAndView, @RequestParam("id" ) int id, @RequestParam("type")String type, @RequestParam("enabled")String enabled){


        int isStart=1;
        if(enabled.equals("1")){
            isStart=1;
        }else{
            isStart=2;
        }


        boolean trueandfalse=userService.typeupd(type,isStart,id);
        if(trueandfalse){
            ModelAndView.setViewName("finances");
        }else{
            System.out.println("删除失败");
        }

        return  ModelAndView;
    }
}
