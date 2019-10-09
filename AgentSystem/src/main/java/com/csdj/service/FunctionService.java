package com.csdj.service;

import com.csdj.entity.Function;
import com.csdj.entity.SystemConfig;
import org.apache.ibatis.annotations.Param;

public interface FunctionService {
    /*
     * 插入url
     * */
    boolean  appadd(SystemConfig SystemConfig);

    boolean nianupdate(SystemConfig SystemConfig);
}
