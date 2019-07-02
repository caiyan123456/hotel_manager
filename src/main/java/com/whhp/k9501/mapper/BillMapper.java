package com.whhp.k9501.mapper;

import com.whhp.k9501.entity.Bill;
import com.whhp.k9501.entity.BillExample;
import java.util.List;

public interface BillMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Bill record);

    int insertSelective(Bill record);

    List<Bill> selectByExample(BillExample example);

    Bill selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Bill record);

    int updateByPrimaryKey(Bill record);
}