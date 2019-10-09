package com.csdj.service.function;

import  com.csdj.mapper.FunctionMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import  com.csdj.entity.Function;

import java.util.List;

/**
 * 功能权限业务接口实现类
 */
@Service("functionService")
public class FunctionServiceImpl implements FunctionService {

    @Autowired
    private FunctionMapper functionMapper;

    @Override
    public List<Function> show_All_Function() {
        return functionMapper.getSelect_All_Function();
    }
}
