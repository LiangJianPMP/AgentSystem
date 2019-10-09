package com.csdj.service;

import java.util.List;

import com.csdj.entity.Contact;


/**
 * 客户联系人
 */
public interface ContactService {
	/**
	 * getContactList
	 * @param contact
	 * @return
	 */
	public List<Contact> getContactList(Contact contact) throws Exception;
		
	/**
	 * addContact
	 * @param contact
	 * @return
	 */
	public int addContact(Contact contact) throws Exception;
	
	/**
	 * modifyContact
	 * @param contact
	 * @return
	 */
	public int modifyContact(Contact contact) throws Exception;
	
	/**
	 * deleteContact
	 * @param contact
	 * @return
	 */
	public int deleteContact(Contact contact) throws Exception;
}
