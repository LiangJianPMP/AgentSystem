package com.csdj.service.keywords;

import com.csdj.entity.Keywords;

import java.util.List;

/**
 * 关键词业务接口
 */
public interface KeywordsService {

    /**
     * 显示全部关键词
     * @return 关键词
     */
    List<Keywords> show_All_Keywords(int page,int limit,String keywords);

    /**
     * 显示关键词数量
     * @return 数量
     */
    int show_keywords_Count();

    /**
     * 修改关键词信息
     * @param keywords 关键词信息
     * @return 成功，失败
     */
    boolean upd_Keywords(Keywords keywords);

    /**
     * 修改关键词状态
     * @param id 关键词id
     * @param isUse 状态
     * @return 成功，失败
     */
    boolean del_Keywords(int id,int isUse);

}
