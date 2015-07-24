package com.excareers.service.employee;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.excareers.dao.EmployeeMapper;
import com.excareers.data.Employee;
import com.excareers.data.SysUsers;
import com.excareers.service.auth.UserService;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	@Resource
	private UserService userService;
	@Resource
	private EmployeeMapper employeeMapper;

	@Override
	public int createEmployee(Employee employee) {
		SysUsers currentUser = userService.getCurrentUser();
		employee.setName(currentUser.getName());
		employee.setUsername(currentUser.getUsername());
		return employeeMapper.insertSelective(employee);
	}

	@Override
	public List<Employee> getEmployeeListByUsername(String username) {
		return employeeMapper.getEmployeeListByUsername(username);
	}

	@Override
	public Employee getEmployeeById(long id) {
		return employeeMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateEmployee(Employee employee) {
		return employeeMapper.updateEmployee(employee);
	}
}
