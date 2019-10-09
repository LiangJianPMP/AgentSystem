package com.csdj.service.role;

import com.csdj.entity.Role;
import com.csdj.mapper.role.RoleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 角色业务接口实现类
 */
@Service("roleService")
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleMapper roleMapper;

    @Override
    public List<Role> show_All_Role(int page,int limit) {
        return roleMapper.getSelect_All_Role((page-1)*limit,limit);
    }

    @Override
    public int show_Role_Count() {
        return roleMapper.getSelect_Role_Count();
    }

    @Override
    public boolean del_Role(int id) {
        return roleMapper.getDelect_Role(id);
    }

    @Override
    public boolean upd_Role(Role role) {
        return roleMapper.getUpdate_Role(role);
    }

    @Override
    public boolean add_Role(Role role) {
        return roleMapper.getInsert_Role(role);
    }

    @Override
    public List<Role> show_All_RoleName() {
        return roleMapper.getSelect_All_RoleName();
    }
}
