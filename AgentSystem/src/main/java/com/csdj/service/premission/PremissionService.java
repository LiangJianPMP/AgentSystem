package com.csdj.service.premission;

import com.csdj.entity.Premission;

import java.util.List;

/**
 * 角色权限配置业务接口
 */
public interface PremissionService {

    /**
     * 添加角色权限
     * @param premission 角色权限
     * @return 成功，失败
     */
    boolean add_Premission(Premission premission);

    /**
     * 查询权限id
     * @param roleId 角色id
     * @param functionId 功能id
     * @return 权限id
     */
    Integer show_Id(Integer roleId,Integer functionId);

    /**
     * 删除角色权限
     * @param id 角色权限id
     * @return 成功，失败
     */
    boolean del_Premission(Integer id);

}
