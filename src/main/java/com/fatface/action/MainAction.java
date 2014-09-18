package com.fatface.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fatface.dao.EmployeeMapper;
import com.fatface.data.Employee;
import com.fatface.util.CookieUtils;
import com.fatface.util.QiniuFileUtils;
import com.google.common.base.Joiner;

@Controller
public class MainAction {

    private Logger         logger = Logger.getLogger(getClass());
    @Resource
    private EmployeeMapper employeeMapper;

    @RequestMapping("/linkedin/login")
    @ResponseBody
    public Map<String, String> linkedInLogin(String id, String firstName, String lastName,
                                             String emailAddress, String positions,
                                             String phoneNumbers, HttpServletResponse response) {
        Map<String, String> map = new HashMap<String, String>();
        CookieUtils.addCookie(response, "id", id);
        CookieUtils.addCookie(response, "firstName", firstName);
        CookieUtils.addCookie(response, "lastName", lastName);
        CookieUtils.addCookie(response, "emailAddress", emailAddress);
        CookieUtils.addCookie(response, "phoneNumbers", phoneNumbers);
        CookieUtils.addCookie(response, "positions", positions);
        return map;
    }

    @RequestMapping(value = "/employee/write")
    public ModelAndView oper(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("/employee/write");
        mav.addObject("id", CookieUtils.getCookie(request, "id"));
        mav.addObject("firstName", CookieUtils.getCookie(request, "firstName"));
        mav.addObject("lastName", CookieUtils.getCookie(request, "lastName"));
        mav.addObject("pictureUrl", CookieUtils.getCookie(request, "pictureUrl"));
        mav.addObject("emailAddress", CookieUtils.getCookie(request, "emailAddress"));
        String positions = CookieUtils.getCookie(request, "positions");
        if (StringUtils.isNotBlank(positions)) {
            mav.addObject("positions", JSONArray.fromObject(positions));
        }
        return mav;
    }

    @RequestMapping(value = "/employee/add")
    @ResponseBody
    public Map<String, Object> addEmployee(String empName, Integer companyId, String companyName,
                                           Integer status, String photo, String comment) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("status", "error");
        if (StringUtils.isBlank(empName) || StringUtils.isBlank(companyName)
            || StringUtils.isBlank(photo)) {
            map.put("msg", "Info is not enough!");
            return map;
        }
        //3 雇员信息
        Employee emp = new Employee();
        emp.setName(empName);
        emp.setCompanyId(companyId);
        emp.setCompanyName(companyName);
        emp.setStatus(status);
        emp.setPic(photo);
        emp.setComment(comment);
        int count = employeeMapper.insertSelective(emp);
        if (count > 0) {
            map.put("status", "success");
        }
        return map;
    }

    @RequestMapping("/pic/upload")
    @ResponseBody
    public Map<String, Object> uploadPic(MultipartFile pic) {
        Map<String, Object> map = new HashMap<String, Object>();
        List<String> urlList = new ArrayList<String>();
        map.put("status", "error");
        if (pic.getSize() == 0) {
            map.put("msg", "File is empty!");
            return map;
        }
        String picKey = Joiner.on("-").join("Beta1", UUID.randomUUID());
        String fileName = pic.getOriginalFilename();
        String suffix = fileName.substring(fileName.lastIndexOf("."), fileName.length());
        String picUrl = null;
        try {
            picUrl = QiniuFileUtils.upload(picKey + suffix, pic.getInputStream());
            map.put("status", "success");
        } catch (IOException e) {
            logger.error("upload file io exception", e);
            map.put("msg", "server side occur error");
            return map;
        }
        urlList.add(picUrl);
        map.put("result", urlList);
        return map;
    }
}
