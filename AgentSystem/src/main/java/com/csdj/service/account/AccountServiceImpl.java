package com.csdj.service.account;

import com.csdj.entity.AccountDetail;
import com.csdj.mapper.account.AccountMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
/**
 * 账户业务接口实现类
 */
@Service("accountService")
public class AccountServiceImpl implements AccountService {

    @Autowired
    private AccountMapper accountMapper;

    @Override
    public boolean add_Account(AccountDetail accountDetail) {
        return accountMapper.getInsert_Account(accountDetail);
    }

   @Override
    public List<AccountDetail> show_All_AccountDetail(int page, int limit, Integer userId, Integer detailType,String startTime, String endTime) {
        return accountMapper.getSelect_All_AccountDetail((page-1)*limit,limit,userId,detailType,startTime,endTime);
    }

    @Override
    public int show_AccountDetail_Count(Integer userId) {
        return accountMapper.getSelect_AccountDetail_Count(userId);
    }
}
