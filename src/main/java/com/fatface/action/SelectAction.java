package com.fatface.action;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fatface.dao.CompanyMapper;
import com.fatface.dao.EmployeeMapper;
import com.fatface.data.Company;
import com.fatface.data.Employee;
import com.fatface.util.QiniuFileUtils;
import com.google.common.base.Joiner;

@Controller
public class SelectAction {

    private Logger         logger = Logger.getLogger(getClass());
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

    @RequestMapping(value = "/oper/index")
    public ModelAndView oper() {
        ModelAndView mav = new ModelAndView("/oper/index");
        List<Company> companyList = companyMapper.selectAll();
        mav.addObject("result", companyList);
        return mav;
    }

    @RequestMapping(value = "/oper/upload")
    public ModelAndView upload(MultipartFile pic, String empname, String empno, Integer companyId,
                               String companyName, String comment, Integer status) {
        ModelAndView mav = new ModelAndView("/info/error");
        //1 check info
        if (StringUtils.isBlank(empname) || companyId == null || StringUtils.isBlank(companyName)
            || pic.getSize() == 0) {
            mav.addObject("msg", "上传信息不全");
            return mav;
        }
        //2 上传文件
        String picKey = Joiner.on("-").join(empname, companyName, UUID.randomUUID());
        String fileName = pic.getOriginalFilename();
        String suffix = fileName.substring(fileName.lastIndexOf("."), fileName.length());
        String picUrl = null;
        try {
            picUrl = QiniuFileUtils.upload(picKey + "." + suffix, pic.getInputStream());
        } catch (IOException e) {
            logger.error("上传文件IO错误", e);
        }
        if (StringUtils.isBlank(picUrl)) {
            mav.addObject("msg", "文件上传失败");
            return mav;
        }
        //3 雇员信息
        Employee emp = new Employee();
        emp.setName(empname);
        emp.setEmpno(empno);
        emp.setCid(companyId);
        emp.setPic(picUrl);
        emp.setComment(comment);
        emp.setStatus(status);
        int count = employeeMapper.insertSelective(emp);
        if (count > 0) {
            mav.setViewName("redirect:/select/index");
        }
        return mav;
    }
}
