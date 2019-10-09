package com.csdj.service;

import com.csdj.entity.SystemConfig;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface Servicea {
    List<SystemConfig> showfuwu();

    List<SystemConfig> selectid(@Param("id") int id);

    boolean fuwuupdate(SystemConfig SystemConfig);

    boolean fuwuadd(SystemConfig SystemConfig);

    List<SystemConfig> showkehu();

    List<SystemConfig> kehuid(@Param("id") int id);


    boolean kehuupdate(SystemConfig SystemConfig);


    boolean kehuadd(SystemConfig SystemConfig);

    boolean kehudel(@Param("id") int id);

    List<SystemConfig> sfzshow();

    List<SystemConfig> sfzid(@Param("id") int id);


    boolean sfzupdate(SystemConfig SystemConfig);


    boolean sfzadd(SystemConfig SystemConfig);

    boolean sfzdel(@Param("id") int id);

    List<SystemConfig> youhuishow();

    List<SystemConfig> youhuiid(@Param("id") int id);


    boolean youhuiupdate(SystemConfig SystemConfig);


    boolean youhuiadd(SystemConfig SystemConfig);

    boolean youhuidel(@Param("id") int id);
}