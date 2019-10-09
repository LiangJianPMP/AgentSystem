package com.csdj.mapper;

import com.csdj.entity.SystemConfig;
import com.csdj.entity.User;
import com.csdj.entity.as_systemconfig;

import java.util.List;

public interface UsersMapper {

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
