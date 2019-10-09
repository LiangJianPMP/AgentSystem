package com.csdj.service;

import com.csdj.entity.Function;
import com.csdj.entity.SystemConfig;
import com.csdj.mapper.FunctionMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FunctioniServicemp implements FunctionService{
    @Autowired
    private FunctionMapper functionMapper;


    @Override
    public boolean appadd(SystemConfig SystemConfig) {
        return functionMapper.appadd(SystemConfig);
    }

    @Override
    public boolean nianupdate(SystemConfig SystemConfig) {
        return functionMapper.nianupdate(SystemConfig);
    }


}
