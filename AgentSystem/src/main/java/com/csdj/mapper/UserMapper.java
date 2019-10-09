package com.csdj.mapper;
import com.csdj.entity.SystemConfig;
import com.csdj.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
public interface UserMapper {
		/*查询所有*/
		List<SystemConfig> select();
		/*添加类型*/
		boolean typeadd(SystemConfig SystemConfig);

		/*删除类型*/
		boolean typedel(@Param("id") int id);
		/*修改类型*/
		boolean typeupd(@Param("configTypeName") String configTypeName,@Param("isStart") int isStart,@Param("id") int id);

		/*查询所有*/
		List<SystemConfig> typeid(@Param("id") int id);

	/**
	 * 查询全部用户信息
	 * @return 用户信息
	 */
	List<User> getSelect_All_User();

	/**
	 * 查询全部用户信息和角色名称
	 * @param page 当前页面
	 * @param limit 显示数量
	 * @param userCode 用户CODE
	 * @param roleId 角色id
	 * @param isStart 是否启动1为启用0为不启用
	 * @return 查询全部用户信息和角色名称
	 */
	List<User> getSelect_All_Users_roleNames(@Param("page") int page,@Param("limit") int limit,
											 @Param("userCode")String userCode,
											 @Param("roleId")Integer roleId,
											 @Param("isStart")Integer isStart);

	/**
	 * 查询用户数量
	 * @return 数量
	 */
	int getSelect_User_Count();

	/**
	 * 删除用户信息
	 * @param id 用户id
	 * @return 成功，失败
	 */
	boolean getDelete_User(@Param("id") Integer id);

	/**
	 * 添加用户信息
	 * @param user 用户信息
	 * @return 成功，失败
	 */
	boolean getInsert_User(User user);

	/**
	 * 修改用户信息
	 * @param user 用户信息
	 * @return 成功，失败
	 */
	boolean getUpdate_User(User user);


}	

