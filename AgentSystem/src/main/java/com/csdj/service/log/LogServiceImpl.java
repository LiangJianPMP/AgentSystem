package com.csdj.service.log;

import com.csdj.entity.Logs;
import com.csdj.mapper.log.LogMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * 日志业务接口实现类
 */
@Service("logService")
public class LogServiceImpl implements LogService {

    @Autowired
    private LogMapper logMapper;

    @Override
    public List<Logs> show_All_Logs(Integer page, Integer limit, String operateDatetime) {
        return logMapper.getSelect_All_Logs((page-1)*limit,limit,operateDatetime);
    }

    @Override
    public int show_Log_Count() {
        return logMapper.getSelect_Log_Count();
    }
}
