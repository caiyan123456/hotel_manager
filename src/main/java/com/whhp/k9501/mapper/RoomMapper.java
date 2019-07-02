package com.whhp.k9501.mapper;

import com.whhp.k9501.entity.Room;
import com.whhp.k9501.entity.RoomExample;
import java.util.List;

public interface RoomMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Room record);

    int insertSelective(Room record);

    List<Room> selectByExample(RoomExample example);

    Room selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Room record);

    int updateByPrimaryKey(Room record);
}