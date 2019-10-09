package com.csdj.servlet;

import com.csdj.entity.AccountDetail;
import com.csdj.entity.Contact;
import com.csdj.entity.Custom;
import com.csdj.service.AccountDetailService;
import com.csdj.service.ContactService;
import com.csdj.service.CustomService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.annotation.Resource;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("customcontroller")
public class CustomController {
    @Autowired
    CustomService service;
    @Autowired
    ContactService contactService;
    @Autowired
    AccountDetailService accountDetailService;
    @RequestMapping("get_List")
    @ResponseBody
    public List<Custom> get_list(@RequestParam(value = "obj",required = false) String map){
        Custom custom=new Custom();
        List<Custom> list=null;
        try{
            System.out.println("----------------------------传入参数"+map);
            if (map!=null){
                custom.setCustomName(map);

            }
        }catch (Exception e){
            System.out.println("--------------------------没有传值");
        }finally {
            try{
                list= service.getList(custom);
            }catch (Exception e){
                System.out.println("查询异常");
            }
        }

        return list;
    }

    @RequestMapping("get_ContactList")
    @ResponseBody
    public List<Contact> get_ContactList(){
        List<Contact> list=null;
        try {
            list=contactService.getContactList(null);
        }catch (Exception e){
            System.out.println("客户联系人查询异常");
        }
        return list;
    }

    @RequestMapping("set_client")
    public String set_client(Custom custom){
        int cus=custom.getCustomType();
        int card=custom.getCardType();
        custom.setCountry("中国");
        Map<String,String> map=transitiondata(cus,card);
        custom.setCustomTypeName(map.get("cusname"));
        custom.setCardTypeName(map.get("cardname"));
        custom.setAgentId(2);
        custom.setAgentName("admin");
        System.out.println(custom.toString());
        List<Contact> list=null;
        boolean pa=false;
        try {
            //如果没有list为空 size方法会出现异常
            list =custom.getList();
            pa=list.size()>0?true:false;
        }catch (Exception e){
            pa=false;
        }

        try {
            service.addCustom(custom);
        } catch (Exception e) {
            e.printStackTrace();
        }
        int clientid=0;
        if (pa){
            try {
                Custom custom1= service.getCustomBySearch(custom);
                clientid=custom1.getId();
                for (Contact contact:list) {
                    //如果前段传来数据为空就结束本轮循环
                    if (contact.getContactName()==null || contact.getContactName().trim()=="" ){
                        continue;
                    }
                    Contact con=contact;
                    contact.setCustomId(clientid);
                    contactService.addContact(contact);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return  "AgentManage";
    }

    public Map<String,String> transitiondata(int cus,int card){
        String cusname="数值空";
        String cardname="数值空";
        Map<String,String> map=new HashMap<>();
        switch (cus){
            case 16:
                cusname="企业";
                break;
            case 17:
                cusname="个人";
                break;
            case 18:
                cusname="政府";
                break;
        }

        switch (card){
            case 19:
                cardname="国内身份证";
                break;
            case 20:
                cardname="境外身份证";
                break;
            case 21:
                cardname="营业执照";
                break;
            case 22:
                cardname="其他证件";
                break;

        }
        map.put("cusname",cusname);
        map.put("cardname",cardname);
        return map;
    }

    @RequestMapping("update_client/{item}")
    public String update_client(@PathVariable int[] item, Custom custom) throws Exception {
        int cus=custom.getCustomType();
        int card=custom.getCardType();
        Map<String,String> map=transitiondata(cus,card);
        custom.setCustomTypeName(map.get("cusname"));
        custom.setCardTypeName(map.get("cardname"));

        System.out.println(custom.toString());
        List<Contact> list=null;
        boolean pa=false;
        try {
            //如果没有list为空 size方法会出现异常
            list =custom.getList();
            pa=list.size()>0?true:false;
        }catch (Exception e){
            pa=false;
        }
        try {
            service.modifyCustom(custom);
        } catch (Exception e) {
            e.printStackTrace();
        }
        int clientid=0;
        if (pa){
            try {
                Custom custom1= service.getCustomBySearch(custom);
                clientid=custom1.getId();
                for (Contact contact:list) {
                    //如果前段传来数据为空就结束本轮循环
                    if (contact.getContactName()==null || contact.getContactName().trim()=="" ){
                        continue;
                    }
                    Contact con=contact;
                    contact.setCustomId(clientid);
                    contactService.addContact(contact);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        System.out.println("----------------------------------------删除集合第一个下标值"+item[0]);
        if (item[0]!=-1){
            for (int i=0;i<item.length;i++){
                Contact contact=new Contact();
                contact.setId(item[i]);
                contactService.deleteContact(contact);
            }
        }
        return  "AgentManage";
    }

    @RequestMapping("update_Custom/{item}")
    @ResponseBody
    public Object update_Custom(@PathVariable int[] item){
        Custom custom=new Custom();
        System.out.println("---------------------------------得到数据主键ID"+item[0]+"-------------->改变类型"+item[1]);
        custom.setId(item[0]);
        custom.setCustomStatus(item[1]);
        int i=0;
        try {
            i=service.modifyCustomStatus(custom);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }

    @RequestMapping("getAccountDetailList")
    @ResponseBody
    public List<AccountDetail> getAccountDetailList(@RequestParam(value = "begin",required = false) Object begin, @RequestParam(value = "finish",required = false) Object finish){
        boolean account;
        try {
            account =begin.equals(null) || null==begin;
        }catch (Exception e){
            account=true;
        }
        List<AccountDetail> list= null;
        AccountDetail accountDetail=new AccountDetail();
        try {
        if (!account){
            DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
            System.out.println("-------------------------------------得到数据"+begin+""+finish);
            accountDetail.setStartTime(format1.parse(begin.toString()));
            accountDetail.setEndTime(format1.parse(finish.toString()));
        }
            System.out.println("查询方法进入I");
            list = accountDetailService.getAccountDetail(accountDetail);
        } catch (Exception e) {
            System.out.println("--------------------------------------------得到数据出现异常");
            e.printStackTrace();
        }
        return  list;
    }



}
