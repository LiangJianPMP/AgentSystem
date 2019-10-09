package com.csdj.mapper.role;

import com.csdj.entity.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 *角色数据处理接口
 */
public interface RoleMapper {

    /**
     * 查询全部角色信息
     * @param page 开始
     * @param limit 显示数量
     * @return 角色信息
     */
    List<Role> getSelect_All_Role(@Param("page") Integer page,@Param("limit")Integer limit);

    /**
     * 查询角色的数量
     * @return 数量
     */
    int getSelect_Role_Count();

    /**
     * 删除角色
     * @param id 角色id
     * @return 成功，失败
     */
    boolean getDelect_Role(@Param("id") Integer id);

    /**
     * 修改角色
     * @param role 角色信息
     * @return 成功，失败
     */
    boolean getUpdate_Role(Role role);

    /**
     * 添加角色
     * @param role 角色信息
     * @return 成功，失败
     */
    boolean getInsert_Role(Role role);

    /**
     * 查询角色名称
     * @return 角色信息
     */
    List<Role> getSelect_All_RoleName();

}
