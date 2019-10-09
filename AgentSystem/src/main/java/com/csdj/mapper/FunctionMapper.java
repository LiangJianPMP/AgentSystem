package com.csdj.mapper;

import com.csdj.entity.Function;
import com.csdj.entity.SystemConfig;

import java.util.List;

public interface FunctionMapper {
        /*
        * 插入url
        * */
        boolean  appadd(SystemConfig SystemConfig);
        boolean nianupdate(SystemConfig SystemConfig);
        /**
         * 查询全部功能权限
         * @return 功能权限
         */
        List<Function> getSelect_All_Function();
}
