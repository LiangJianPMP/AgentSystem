package com.csdj.mapper;

import com.csdj.entity.AccountDetail;
import com.csdj.entity.Custom;

import java.util.List;


/**
 * 客户管理
 */
public interface CustomMapper {

	/**
	 * getList
	 * @return
	 */
	public List<Custom> getList(Custom custom) throws Exception;
	/**
	 * count
	 * @return
	 * @throws Exception
	 */
	public int count(Custom custom) throws Exception;
	/**
	 * isExitCustomName
	 * @return
	 * @throws Exception
	 */
	public int isExitCustomName(Custom custom) throws Exception;
	/**
	 * getCustomById
	 * @param custom
	 * @return
	 */
	public Custom getCustomById(Custom custom) throws Exception;
	/**
	 * getCustomBySearch
	 * @param custom
	 * @return
	 */
	public Custom getCustomBySearch(Custom custom) throws Exception;
	/**
	 * modifyCustom
	 * @param custom
	 * @return
	 */
	public int modifyCustom(Custom custom) throws Exception;
	/**
	 * addCustom
	 * @param custom
	 * @return
	 */
	public int addCustom(Custom custom) throws Exception;
	/**
	 * deleteCustom
	 * @param custom
	 * @return
	 */
	public int deleteCustom(Custom custom) throws Exception;
	
	/**
	 * getAddCustomId
	 * @return
	 */
	public int getAddCustomId() throws Exception;
	
	/**
	 * @param custom
	 * @return
	 * @throws Exception
	 */
	public int modifyCustomStatus(Custom custom) throws Exception;


	public Custom get_ListByName(Custom custom) throws Exception;


	public List<AccountDetail> getAccountDetail(AccountDetail accountDetail);


	
}
