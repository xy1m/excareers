package com.fatface.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fatface.dao.EmployeeMapper;
import com.fatface.data.Employee;

@Controller
public class IndexAction {

    @Resource
    private EmployeeMapper employeeMapper;

    @RequestMapping(value = "/n/{folder}/{path}")
    public ModelAndView index(@PathVariable String folder, @PathVariable String path) {
        ModelAndView mav = new ModelAndView(folder + "/" + path);
        return mav;
    }

    @RequestMapping("/user/login")
    public ModelAndView login() {
        ModelAndView mav = new ModelAndView("/user/login");
        return mav;
    }

    @RequestMapping(value = "/select/index")
    public ModelAndView index() {
        ModelAndView mav = new ModelAndView("/select/index");
        List<Employee> employeeList = employeeMapper.selectAll();
        mav.addObject("result", employeeList);
        return mav;
    }

}
