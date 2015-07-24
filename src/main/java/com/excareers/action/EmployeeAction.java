package com.excareers.action;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.excareers.data.Employee;
import com.excareers.service.auth.UserService;
import com.excareers.service.employee.EmployeeService;
import com.excareers.util.ResUtils;

@Controller
public class EmployeeAction {
	@Resource
	private EmployeeService employeeService;
	@Resource
	private UserService userService;

	@RequestMapping(value = "/emp/edit", method = RequestMethod.GET)
	public ModelAndView editEmployee(
			@RequestParam(value = "empid", required = false) Long empid) {

		ModelAndView mav = new ModelAndView("/employee/employee_edit");
		if (empid != null) {
			Employee employee = employeeService.getEmployeeById(empid);
			if (StringUtils.equals(userService.getCurrentUser().getUsername(),
					employee.getUsername())) {
				mav.addObject("emp", employee);
			}
		}
		return mav;
	}

	@RequestMapping(value = "/emp/save", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> saveEmployee(Employee employee) {
		Map<String, String> map = ResUtils.getMap();
		int cnt = 0;
		if (employee.getId() == null) {
			cnt = employeeService.createEmployee(employee);
		} else {
			cnt = employeeService.updateEmployee(employee);
		}
		if (cnt > 0) {
			map.put("status", "success");
		} else {
			map.put("msg", "Server error");
		}
		return map;
	}

	@RequestMapping(value = "/employees", method = RequestMethod.GET)
	public ModelAndView employees(
			@RequestParam(value = "username", required = false) String username) {
		ModelAndView mav = new ModelAndView("/employee/employee_list");
		if (StringUtils.isBlank(username)) {
			username = userService.getCurrentUser().getUsername();
		}
		mav.addObject("employeeList",
				employeeService.getEmployeeListByUsername(username));
		return mav;
	}
}
