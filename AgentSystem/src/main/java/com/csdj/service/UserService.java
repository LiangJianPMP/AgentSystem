package com.csdj.service;

import com.csdj.entity.SystemConfig;

import java.util.List;

import com.csdj.entity.User;
import org.apache.ibatis.annotations.Param;

public interface UserService{


    /*查询所有*/
    public List<SystemConfig> select();
    /*添加类型*/
    public boolean typeadd(SystemConfig SystemConfig);
    /*删除类型*/
    public boolean typedel(@Param("id") int id);
    /*修改类型*/
    public boolean typeupd(@Param("configTypeName") String configTypeName,@Param("isStart") int isStart,@Param("id") int id);

    /*查询所有*/
    public  List<SystemConfig> typeid(@Param("id") int id);

    User getUserInfoByNAP(String userCode);

    /**
     * 显示全部用户信息
     * @return 用户信息
     */
    List<User> show_All_User();

    /**
     * 显示全部用户和角色信息
     * @return 用户信息
     */
    List<User> show_All_Users_roleNames(int page,int limit,String userCode,Integer roleId,Integer isStart);

    /**
     *显示全部用户数量
     * @return 用户数量
     */
    int show_User_Count();

    /**
     * 删除用户信息
     * @param id 用户id
     * @return 成功，失败
     */
    boolean del_User(int id);

    /**
     * 添加用户信息
     * @param user 用户信息
     * @return 成功，失败
     */
    boolean add_User(User user);

    /**
     * 修改用户信息
     * @param user 用户信息
     * @return 成功，失败
     */
    boolean upd_User(User user);
}
