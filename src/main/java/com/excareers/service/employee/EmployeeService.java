package com.excareers.service.employee;

import java.util.List;

import com.excareers.data.Employee;

public interface EmployeeService {

	int createEmployee(Employee employee);

	List<Employee> getEmployeeListByUsername(String name);

	Employee getEmployeeById(long empid);

	int updateEmployee(Employee employee);
}
