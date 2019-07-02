package com.whhp.k9501.mapper;

import com.whhp.k9501.entity.Job;
import com.whhp.k9501.entity.JobExample;
import java.util.List;

public interface JobMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Job record);

    int insertSelective(Job record);

    List<Job> selectByExample(JobExample example);

    Job selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Job record);

    int updateByPrimaryKey(Job record);
}