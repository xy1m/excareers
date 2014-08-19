package com.fatface.dao;

import java.util.List;

import com.fatface.data.Company;

public interface CompanyMapper extends SqlMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Company record);

    int insertSelective(Company record);

    Company selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Company record);

    int updateByPrimaryKey(Company record);

    List<Company> selectAll();
}