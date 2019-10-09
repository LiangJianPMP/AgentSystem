package com.csdj.mapper.log;

import com.csdj.entity.Keywords;
import com.csdj.entity.Logs;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * 日志数据处理接口
 */
public interface LogMapper {

    /**
     * 查询log日志信息
     * @param page 当前页面
     * @param limit 页面显示数据数量
     * @param operateDatetime 数据
     * @return log日志信息
     */
    List<Logs> getSelect_All_Logs(@Param("page")Integer page,@Param("limit")Integer limit,@Param("operateDatetime")String operateDatetime);

    /**
     * 查询信息数量
     * @return 数量
     */
    int getSelect_Log_Count();

}
