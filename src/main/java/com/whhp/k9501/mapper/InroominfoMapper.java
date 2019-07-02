package com.whhp.k9501.mapper;

import com.whhp.k9501.entity.Inroominfo;
import com.whhp.k9501.entity.InroominfoExample;
import java.util.List;

public interface InroominfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Inroominfo record);

    int insertSelective(Inroominfo record);

    List<Inroominfo> selectByExample(InroominfoExample example);

    Inroominfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Inroominfo record);

    int updateByPrimaryKey(Inroominfo record);
}