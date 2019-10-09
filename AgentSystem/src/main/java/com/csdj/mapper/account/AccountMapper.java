package com.csdj.mapper.account;

import com.csdj.entity.AccountDetail;
import org.apache.ibatis.annotations.Param;

import java.util.List;
/**
 *账户数据处理接口
 */
public interface AccountMapper {

    /**
     * 添加一个账户
     * @param accountDetail 账户信息
     * @return 成功，失败
     */
    boolean getInsert_Account(AccountDetail accountDetail);

    /**
     * 查询全部账号信息
     * @param page 当前页面
     * @param limit 页面显示数量
     * @param startTime 开始日期
     * @param endTime 结束日期
     * @return 账号信息
     */
    List<AccountDetail> getSelect_All_AccountDetail(@Param("page")int page, @Param("limit")int limit,
                                                    @Param("userId")Integer userId,
                                                    @Param("detailType")Integer detailType,
                                                    @Param("startTime")String startTime,
                                                    @Param("endTime")String endTime);

    /**
     * 查询账号数量
     * @return 数量
     */
    int getSelect_AccountDetail_Count(@Param("userId")Integer userId);

}
