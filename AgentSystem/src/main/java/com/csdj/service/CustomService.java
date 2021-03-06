package com.csdj.service;

import com.csdj.entity.Contact;
import com.csdj.entity.Custom;
import java.util.List;


/**
 * 客户管理
 */
public interface CustomService {
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
	 * isExitCustomName
	 * @param custom
	 * @return
	 */
	public int isExitCustomName(Custom custom) throws Exception;
	
	public boolean hl_addCustomContact(Custom custom, List<Contact> contactList) throws Exception;
	
	public boolean hl_modifyCustomContact(Custom custom, List<Contact> contactList) throws Exception;
	
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
}
