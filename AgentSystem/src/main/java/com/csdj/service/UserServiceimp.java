package com.csdj.service;

import com.csdj.entity.SystemConfig;
import com.csdj.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import com.csdj.mapper.UserMapper;


@Service
public class UserServiceimp implements  UserService{

    @Autowired
    private UserMapper userMapper;

    /*
    * 查询所有
    * */
    @Override
    public List<SystemConfig> select() {
        return userMapper.select();
    }

    @Override
    public boolean typeadd(SystemConfig SystemConfig) {
        return userMapper.typeadd(SystemConfig);
    }

    /*
    * 添加财务类型
    * */

        /*
        * 删除财务类型
        * */
    @Override
    public boolean typedel(int id) {
        return userMapper.typedel(id);
    }

        /*
        * 修改财务类型
        * */
    @Override
    public boolean typeupd(String configTypeName, int isStart, int id) {
        return userMapper.typeupd(configTypeName,isStart,id);
    }
    /*
     * 根据id查询财务类型
     * */
    @Override
    public List<SystemConfig> typeid(int id) {
        return userMapper.typeid(id);
    }


    @Override
    public List<User> show_All_User() {
        return userMapper.getSelect_All_User();
    }

    @Override
    public List<User> show_All_Users_roleNames(int page,int limit,String userCode,Integer roleId,Integer isStart) {
        return userMapper.getSelect_All_Users_roleNames((page-1)*limit,limit,userCode,roleId,isStart);
    }

    @Override
    public int show_User_Count() {
        return userMapper.getSelect_User_Count();
    }

    @Override
    public boolean del_User(int id) {
        return userMapper.getDelete_User(id);
    }

    @Override
    public boolean add_User(User user) {
        return userMapper.getInsert_User(user);
    }

    @Override
    public boolean upd_User(User user) {
        return userMapper.getUpdate_User(user);
    }


}
