package com.csdj.service.account;

import com.csdj.entity.AccountDetail;

import java.util.List;

/**
 *账户业务接口
 */
public interface AccountService {

    /**
     * 添加一个账户
     * @param accountDetail 账户信息
     * @return 成功，失败
     */
    boolean add_Account(AccountDetail accountDetail);

    /**
     * 查询全部账号信息
     * @param page 当前页面
     * @param limit 页面显示数量
     * @param startTime 开始日期
     * @param endTime 结束日期
     * @return 账号信息
     */
    List<AccountDetail> show_All_AccountDetail(int page, int limit,Integer userId,Integer detailType, String startTime, String endTime);

    /**
     * 查询账号数量
     * @return 数量
     */
    int show_AccountDetail_Count(Integer userId);

}
