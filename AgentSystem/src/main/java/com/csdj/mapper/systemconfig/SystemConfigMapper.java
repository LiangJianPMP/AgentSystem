package com.csdj.mapper.systemconfig;

import com.csdj.entity.SystemConfig;

import java.util.List;

/**
 * 系统配置数据处理接口
 */
public interface SystemConfigMapper {

    /**
     * 查询全部系统配置信息
     * @return 系统配置信息
     */
    List<SystemConfig> getSelect_All_SystemConfig();

}
