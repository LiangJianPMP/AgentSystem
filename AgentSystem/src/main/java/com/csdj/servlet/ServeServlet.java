package com.csdj.servlet;

import com.csdj.entity.SystemConfig;
import com.csdj.service.Servicea;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class ServeServlet {
        @Autowired
        private Servicea Service ;

    @RequestMapping(value ="fuwu")
    @ResponseBody
    public List<SystemConfig> sad(){
        return  Service.showfuwu();
    }


    @RequestMapping(value ="serveupdate")
    @ResponseBody
    public List<SystemConfig> serve(ModelAndView ModelAndView,@RequestParam("id") int id){
        return  Service.selectid(id);
    }

    @RequestMapping(value ="fuwuupdate")
    public ModelAndView fuwuapdate(ModelAndView ModelAndView,SystemConfig SystemConfig ){
       boolean trueandfalse=Service.fuwuupdate(SystemConfig);
        if(trueandfalse){
            ModelAndView.setViewName("serve");
        }else{
            System.out.println("修改失败");
        }
        return  ModelAndView;
    }


    @RequestMapping(value ="fuwuadd")
    public ModelAndView fuwuadd(ModelAndView ModelAndView,SystemConfig SystemConfig ){
        boolean trueandfalse=Service.fuwuadd(SystemConfig);
        if(trueandfalse){
            ModelAndView.setViewName("serve");
        }else{
            System.out.println("修改失败");
        }
        return  ModelAndView;
    }

    @RequestMapping(value ="kehu")
    @ResponseBody
    public List<SystemConfig> kehu(){
        return  Service.showkehu();
    }

    @RequestMapping(value ="kehuid")
    @ResponseBody
    public List<SystemConfig> servea(ModelAndView ModelAndView,@RequestParam("id") int id){
        return  Service.kehuid(id);
    }

    @RequestMapping(value ="kehuupdate")
    public ModelAndView fuwuapdatesfd(ModelAndView ModelAndView,SystemConfig SystemConfig ){
        boolean trueandfalse=Service.kehuupdate(SystemConfig);
        if(trueandfalse){
            ModelAndView.setViewName("kehu");
        }else{
            System.out.println("修改失败");
        }
        return  ModelAndView;
    }

    @RequestMapping(value="del")
    public  ModelAndView asd(ModelAndView ModelAndView,@RequestParam("id") int id){
        System.out.println("sad");
                boolean trueandfalse=Service.kehudel(id);
                if(trueandfalse){
                    ModelAndView.setViewName("kehu");
                }
    return  ModelAndView;
    }

    @RequestMapping(value ="kehuadd")
    public ModelAndView kehuadd(ModelAndView ModelAndView,SystemConfig SystemConfig ){
        boolean trueandfalse=Service.kehuadd(SystemConfig);
        if(trueandfalse){
            ModelAndView.setViewName("kehu");
        }else{
            System.out.println("修改失败");
        }
        return  ModelAndView;
    }


    @RequestMapping(value ="sfzshow")
    @ResponseBody
    public List<SystemConfig> sfz(){
        return  Service.sfzshow();
    }

    @RequestMapping(value ="sfzid")
    @ResponseBody
    public List<SystemConfig> sfzid(ModelAndView ModelAndView,@RequestParam("id") int id){
        return  Service.sfzid(id);
    }

    @RequestMapping(value ="sfzupdate")
    public ModelAndView sfzupdate(ModelAndView ModelAndView,SystemConfig SystemConfig ){
        boolean trueandfalse=Service.sfzupdate(SystemConfig);
        if(trueandfalse){
            ModelAndView.setViewName("sfz");
        }else{
            System.out.println("修改失败");
        }
        return  ModelAndView;
    }

    @RequestMapping(value="sfzdel")
    public  ModelAndView sfzdel(ModelAndView ModelAndView,@RequestParam("id") int id){

        boolean trueandfalse=Service.sfzdel(id);
        if(trueandfalse){
            ModelAndView.setViewName("sfz");
        }
        return  ModelAndView;
    }

    @RequestMapping(value ="sfzadd")
    public ModelAndView sfzadd(ModelAndView ModelAndView,SystemConfig SystemConfig ){
        boolean trueandfalse=Service.sfzadd(SystemConfig);
        if(trueandfalse){
            ModelAndView.setViewName("sfz");
        }else{
            System.out.println("修改失败");
        }
        return  ModelAndView;
    }







    @RequestMapping(value ="youhuishow")
    @ResponseBody
    public List<SystemConfig> youhuishow(){
        return  Service.youhuishow();
    }

    @RequestMapping(value ="youhuiid")
    @ResponseBody
    public List<SystemConfig> youhuiid(ModelAndView ModelAndView,@RequestParam("id") int id){
        return  Service.youhuiid(id);
    }

    @RequestMapping(value ="youhuiupdate")
    public ModelAndView youhuiupdate(ModelAndView ModelAndView,SystemConfig SystemConfig ){
        boolean trueandfalse=Service.youhuiupdate(SystemConfig);
        if(trueandfalse){
            ModelAndView.setViewName("youhu");
        }else{
            System.out.println("修改失败");
        }
        return  ModelAndView;
    }

    @RequestMapping(value="youhuidel")
    public  ModelAndView youhuidel(ModelAndView ModelAndView,@RequestParam("id") int id){

        boolean trueandfalse=Service.youhuidel(id);
        if(trueandfalse){
            ModelAndView.setViewName("youhu");
        }
        return  ModelAndView;
    }

    @RequestMapping(value ="youhuiadd")
    public ModelAndView youhuiadd(ModelAndView ModelAndView,SystemConfig SystemConfig ){
        boolean trueandfalse=Service.youhuiadd(SystemConfig);
        if(trueandfalse){
            ModelAndView.setViewName("youhu");
        }else{
            System.out.println("修改失败");
        }
        return  ModelAndView;
    }


}