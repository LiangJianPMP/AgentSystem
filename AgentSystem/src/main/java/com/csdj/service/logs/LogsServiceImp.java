package com.csdj.service.logs;

import com.csdj.entity.Logs;
import com.csdj.mapper.LogsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LogsServiceImp implements  LogsService {
    @Autowired
    LogsMapper logsMapper;

    @Override
    public List<Logs> getLogsInfo() {
       return  logsMapper.getLogsInfo();
    }
}
