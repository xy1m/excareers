package com.excareers.dao;

import com.excareers.data.SysPermissions;

public interface SysPermissionsMapper extends SqlMapper {
    int deleteByPrimaryKey(Long id);

    int insert(SysPermissions record);

    int insertSelective(SysPermissions record);

    SysPermissions selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(SysPermissions record);

    int updateByPrimaryKey(SysPermissions record);
}