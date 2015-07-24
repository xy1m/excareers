package com.excareers.dao;

import com.excareers.data.SysUsers;

public interface SysUsersMapper extends SqlMapper {
    int deleteByPrimaryKey(Long id);

    int insert(SysUsers record);

    int insertSelective(SysUsers record);

    SysUsers selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(SysUsers record);

    int updateByPrimaryKey(SysUsers record);

	SysUsers selectByUsername(String username);

	int updateProfile(SysUsers user);
}