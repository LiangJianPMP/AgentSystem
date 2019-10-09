package com.csdj.service;

import java.util.List;


import com.csdj.entity.AccountDetail;
import com.csdj.mapper.AccountDetailDaotS;
import com.csdj.mapper.CustomMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("accountdetailservice")
public class AccountDetailServiceImpl implements AccountDetailService {
	@Autowired
	private AccountDetailDaotS mapper;

	@Autowired
	CustomMapper customMapper;

	@Override
	public List<AccountDetail> getAccountDetailList(AccountDetail accountDetail) throws Exception{
		// TODO Auto-generated method stub
		return mapper.getAccountDetailList(accountDetail);
	}

	@Override
	public int addAccountDetail(AccountDetail accountDetail)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.addAccountDetail(accountDetail);
	}

	@Override
	public int modifyAccountDetail(AccountDetail accountDetail)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.modifyAccountDetail(accountDetail);
	}

	@Override
	public int deleteAccountDetail(AccountDetail accountDetail)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.deleteAccountDetail(accountDetail);
	}


	@Override
	public List<AccountDetail> getAccountDetail(AccountDetail accountDetail) {
		System.out.println("-----------------查询方法执行------------");
		return customMapper.getAccountDetail(accountDetail);
	}

	public Integer count(AccountDetail accountDetail)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.count(accountDetail);
	}

	@Override
	public List<AccountDetail> repostAgentDetail(AccountDetail accountDetail)
			throws Exception {
		// TODO Auto-generated method stub
		return mapper.repostAgentDetail(accountDetail);
	}

}
