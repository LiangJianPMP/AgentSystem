package com.csdj.service.keywords;

import com.csdj.entity.*;
import com.csdj.mapper.keywords.KeywordsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 关键词业务接口实现类
 */
@Service("keywordsService")
public class keywordsServiceImp implements KeywordsService {

    @Autowired
    private KeywordsMapper keywordsMapper;

    @Override
    public List<Keywords> show_All_Keywords(int page,int limit, String keywords) {
        return keywordsMapper.getSelect_All_Keywords((page-1)*limit,limit,keywords);
    }

    @Override
    public boolean updKeywordsInfo(Keywords keywords) {
        return keywordsMapper.modifyKeywords(keywords);
    }

    @Override
    public String getProvinces(String provinces) {
        return keywordsMapper.getProvinces(provinces);
    }

    @Override
    public List<Contact> getContactes(Integer customId) {
        return keywordsMapper.getContactes(customId);
    }

    @Override
    public String getAreas(String area) {
        return keywordsMapper.getAreas(area);
    }

    @Override
    public String getCities(String city) {
        return keywordsMapper.getCities(city);
    }

    @Override
    public Custom getCustom(Integer id) {
        return keywordsMapper.getCustom(id);
    }

    @Override
    public List<Keywords> getAllKeywordsList(Integer page, Integer limit) {
        return keywordsMapper.getKeywordsList(page,limit);
    }

    @Override
    public Keywords getKeywordInfoById(Integer id) {
        return keywordsMapper.getKeywordInfo(id);
    }

    @Override
    public List<Keywords> getListByName(Integer page, Integer limit, String keywords, String customeName) {
        return keywordsMapper.getListByName(page,limit,keywords,customeName);
    }

    @Override
    public int show_keywords_Count() {
        return keywordsMapper.getSelect_Keywords_Count();
    }

    @Override
    public boolean upd_Keywords(Keywords keywords) {
        return keywordsMapper.getUpdate_Keywords(keywords);
    }

    @Override
    public boolean del_Keywords(int id,int isUse) {
        return keywordsMapper.getDelect_Keywords(id,isUse);
    }
}
