package com.csdj.service.role;

import com.csdj.entity.Role;

import java.util.List;

/**
 *角色业务接口
 */
public interface RoleService {

    /**
     * 显示全部角色信息
     * @param page 开始
     * @param limit 显示数量
     * @return 角色信息
     */
    List<Role> show_All_Role(int page,int limit);

    /**
     * 显示角色数量
     * @return 数量
     */
    int show_Role_Count();

    /**
     * 删除角色
     * @param id 用户id
     * @return 成功，失败
     */
    boolean del_Role(int id);

    /**
     * 修改角色信息
     * @param role 角色
     * @return 成功，失败
     */
    boolean upd_Role(Role role);

    /**
     * 添加角色信息
     * @param role 角色信息
     * @return 成功，失败
     */
    boolean add_Role(Role role);

    /**
     * 显示全部角色名称
     * @return 角色名称
     */
    List<Role> show_All_RoleName();

}
