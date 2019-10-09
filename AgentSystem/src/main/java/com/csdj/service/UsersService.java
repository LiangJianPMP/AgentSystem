package com.csdj.service;

import com.csdj.entity.SystemConfig;
import com.csdj.entity.User;


import java.util.List;

public interface UsersService {

    /**
     * 代理商余额查询
     */
    List<User> getAgentBalance();

    /**
     * 预付款、代理商流水报表
     * @return
     */
    List<User> getPayment();

    /**
     * 产品分类数量/金额总汇
     */
    List<SystemConfig> totalsummoney();


}
