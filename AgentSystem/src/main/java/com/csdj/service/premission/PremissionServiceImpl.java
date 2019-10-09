package com.csdj.service.premission;

import com.csdj.entity.Premission;
import com.csdj.mapper.premission.PremissionMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 角色权限配置业务接口实现类
 */
@Service
public class PremissionServiceImpl implements PremissionService {

    @Autowired
    private PremissionMapper premissionMapper;

    @Override
    public boolean add_Premission(Premission premission) {
        return premissionMapper.getInsert_Premission(premission);
    }

    @Override
    public Integer show_Id(Integer roleId, Integer functionId) {
        return premissionMapper.getSelect_Id(roleId,functionId);
    }

    @Override
    public List<Integer> show_FunctionId(int roleId) {
        return premissionMapper.getSelect_FunctionId(roleId);
    }

    @Override
    public boolean del_Premission(Integer id) {
        return premissionMapper.getDelete_Premission(id);
    }

}
