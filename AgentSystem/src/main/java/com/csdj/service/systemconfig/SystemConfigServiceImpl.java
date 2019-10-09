package com.csdj.service.systemconfig;

import com.csdj.entity.SystemConfig;
import com.csdj.mapper.systemconfig.SystemConfigMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 系统配置业务接口实现类
 */
@Service("systemConfigService")
public class SystemConfigServiceImpl implements SystemConfigService {

    @Autowired
    private SystemConfigMapper systemConfigMapper;

    @Override
    public List<SystemConfig> show_all_systemConfig() {
        return systemConfigMapper.getSelect_All_SystemConfig();
    }
}
