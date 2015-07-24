package com.excareers.dao;

import java.util.List;

import com.excareers.data.Employee;

public interface EmployeeMapper extends SqlMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Employee record);

    int insertSelective(Employee record);

    Employee selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Employee record);

    int updateByPrimaryKey(Employee record);
    
	List<Employee> getEmployeeListByUsername(String username);

	int updateEmployee(Employee record);
}