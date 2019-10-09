package com.csdj.service;

import java.util.List;


import com.csdj.entity.Contact;
import com.csdj.mapper.ContactMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("contactservice")
public class ContactServiceImpl implements ContactService {
	@Autowired
	private ContactMapper mapper;

	public List<Contact> getContactList(Contact contact)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.getContactList(contact);
	}


	public int addContact(Contact contact)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.addContact(contact);
	}


	public int modifyContact(Contact contact)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.modifyContact(contact);
	}


	public int deleteContact(Contact contact)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.deleteContact(contact);
	}

}
