package com.csdj.service;

import com.csdj.entity.Function;
import com.csdj.entity.SystemConfig;
import com.csdj.mapper.FunctionMapper;
import com.csdj.mapper.ServeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class Servicemp implements Servicea{
    @Autowired
    private ServeMapper ServeMapper;



    @Override
    public List<SystemConfig> showfuwu() {
        return ServeMapper.showfuwu();
    }

    @Override
    public List<SystemConfig> selectid(int id) {
        return ServeMapper.selectid(id);
    }

    @Override
    public boolean fuwuupdate(SystemConfig SystemConfig) {
        return ServeMapper.fuwuupdate(SystemConfig);
    }

    @Override
    public boolean fuwuadd(SystemConfig SystemConfig) {
        return ServeMapper.fuwuadd(SystemConfig);
    }

    @Override
    public List<SystemConfig> showkehu() {
        return ServeMapper.showkehu();
    }

    @Override
    public List<SystemConfig> kehuid(int id) {
        return ServeMapper.kehuid(id);
    }

    @Override
    public boolean kehuupdate(SystemConfig SystemConfig) {
        return ServeMapper.kehuupdate(SystemConfig);
    }

    @Override
    public boolean kehuadd(SystemConfig SystemConfig) {
        return ServeMapper.kehuadd(SystemConfig);
    }

    @Override
    public boolean kehudel(int id) {
        return ServeMapper.kehudel(id);
    }

    @Override
    public List<SystemConfig> sfzshow() {
        return ServeMapper.sfzshow();
    }

    @Override
    public List<SystemConfig> sfzid(int id) {
        return  ServeMapper.sfzid(id);
    }

    @Override
    public boolean sfzupdate(SystemConfig SystemConfig) {
        return ServeMapper.sfzupdate(SystemConfig);
    }

    @Override
    public boolean sfzadd(SystemConfig SystemConfig) {
        return ServeMapper.sfzadd(SystemConfig);
    }

    @Override
    public boolean sfzdel(int id) {
        return ServeMapper.sfzdel(id);
    }

    @Override
    public List<SystemConfig> youhuishow() {
        return ServeMapper.youhuishow();
    }

    @Override
    public List<SystemConfig> youhuiid(int id) {
        return ServeMapper.youhuiid(id);
    }

    @Override
    public boolean youhuiupdate(SystemConfig SystemConfig) {
        return ServeMapper.youhuiupdate(SystemConfig);
    }

    @Override
    public boolean youhuiadd(SystemConfig SystemConfig) {
        return ServeMapper.youhuiadd(SystemConfig);
    }

    @Override
    public boolean youhuidel(int id) {
        return ServeMapper.youhuidel(id);
    }


}
