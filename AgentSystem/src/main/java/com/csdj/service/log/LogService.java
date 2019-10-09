package com.csdj.service.log;

import com.csdj.entity.Logs;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * 日志业务接口
 */
public interface LogService {

    /**
     * 显示log日志信息
     * @param page 当前页面
     * @param limit 页面显示数据数量
     * @param operateDatetime 数据
     * @return log日志信息
     */
    List<Logs> show_All_Logs(@Param("page") Integer page, @Param("limit") Integer limit, @Param("operateDatetime") String operateDatetime);

    /**
     * 显示信息数量
     * @return 数量
     */
    int show_Log_Count();

}
