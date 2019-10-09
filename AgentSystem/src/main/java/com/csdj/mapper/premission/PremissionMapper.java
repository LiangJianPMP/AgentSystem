package com.csdj.mapper.premission;

import com.csdj.entity.Premission;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 角色权限配置数据处理接口
 */
public interface PremissionMapper {

    /**
     * 查询权限id
     * @param roleId 角色id
     * @param functionId 功能id
     * @return 权限id
     */
    Integer getSelect_Id(@Param("roleId")Integer roleId,@Param("functionId")Integer functionId);

    /**
     * 添加角色权限
     * @param premission 角色权限信息
     * @return 成功，失败
     */
    boolean getInsert_Premission(Premission premission);

    /**
     * 删除角色权限
     * @param id 角色权限id
     * @return 成功，失败
     */
    boolean getDelete_Premission(@Param("id") Integer id);

    /**
     * 查询角色是否启用功能
     * @param roleId 角色
     * @return 角色启动的功能id
     */
    List<Integer> getSelect_FunctionId(@Param("roleId")int roleId);

}
