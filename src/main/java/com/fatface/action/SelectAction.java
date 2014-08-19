package com.fatface.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fatface.dao.CompanyMapper;
import com.fatface.dao.EmployeeMapper;
import com.fatface.data.Company;
import com.fatface.data.Employee;

@Controller
public class SelectAction {
    @Resource
    private EmployeeMapper employeeMapper;
    @Resource
    private CompanyMapper  companyMapper;

    @RequestMapping(value = "/select/index")
    public ModelAndView index() {
        ModelAndView mav = new ModelAndView("/select/index");
        List<Employee> employeeList = employeeMapper.selectAll();
        mav.addObject("result", employeeList);
        return mav;
    }

    @RequestMapping(value = "/oper/upload")
    public ModelAndView upload() {
        ModelAndView mav = new ModelAndView("/oper/upload");
        List<Company> companyList = companyMapper.selectAll();
        mav.addObject("result", companyList);
        return mav;
    }
}
