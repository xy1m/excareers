package com.fatface.dao;

import java.util.List;

import com.fatface.data.Employee;

public interface EmployeeMapper extends SqlMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Employee record);

    int insertSelective(Employee record);

    Employee selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Employee record);

    int updateByPrimaryKey(Employee record);

    List<Employee> selectAll();
}