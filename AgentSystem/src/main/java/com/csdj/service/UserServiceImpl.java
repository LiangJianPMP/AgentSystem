package com.csdj.service;


import com.csdj.entity.SystemConfig;
import com.csdj.entity.User;
import com.csdj.mapper.UsersMapper;

import com.csdj.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("service")
public class UserServiceImpl implements UsersService {


    @Autowired
    UsersMapper userMapper;

    @Override
    public List<User> getAgentBalance() {
        return userMapper.getAgentBalance();
    }

    @Override
    public List<User> getPayment() {
        return userMapper.getPayment();
    }

    @Override
    public List<SystemConfig> totalsummoney() {
        return userMapper.totalsummoney();
    }


}
