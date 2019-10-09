package com.csdj.service.function;

import com.csdj.entity.Function;

import java.util.List;

/**
 * 功能权限业务接口
 */
public interface FunctionService {

    /**
     * 显示全部功能权限
     * @return 功能权限
     */
    List<Function> show_All_Function();

}
