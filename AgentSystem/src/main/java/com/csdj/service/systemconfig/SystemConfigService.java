package com.csdj.service.systemconfig;

import com.csdj.entity.SystemConfig;

import java.util.List;

/**
 * 系统配置业务接口
 */
public interface SystemConfigService {

    /**
     * 显示全部系统配置信息
     * @return 系统配置信息
     */
    List<SystemConfig> show_all_systemConfig();

}
