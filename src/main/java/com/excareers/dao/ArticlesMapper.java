package com.excareers.dao;

import java.util.List;

import com.excareers.data.Articles;

public interface ArticlesMapper extends SqlMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Articles record);

    int insertSelective(Articles record);

    Articles selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Articles record);

    int updateByPrimaryKeyWithBLOBs(Articles record);

    int updateByPrimaryKey(Articles record);

	List<Articles> selectByUserid(Long id);
}