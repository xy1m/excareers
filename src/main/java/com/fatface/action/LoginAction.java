package com.fatface.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fatface.dao.CompanyMapper;
import com.fatface.data.Company;
import com.fatface.util.CookieUtils;

@Controller
public class LoginAction {

    @Resource
    private CompanyMapper companyMapper;

    @RequestMapping("/user/login")
    public ModelAndView index() {
        ModelAndView mav = new ModelAndView("/user/login");
        return mav;
    }

    @RequestMapping("/user/login4linkedin")
    @ResponseBody
    public Map<String, String> login4LinkedIn(String id, String firstName, String lastName,
                                              String pictureUrl, HttpServletResponse response) {
        Map<String, String> map = new HashMap<String, String>();
        CookieUtils.addCookie(response, "id", id);
        CookieUtils.addCookie(response, "firstName", firstName);
        CookieUtils.addCookie(response, "lastName", lastName);
        CookieUtils.addCookie(response, "pictureUrl", pictureUrl);
        return map;
    }

    @RequestMapping(value = "/linkedin/upload")
    public ModelAndView oper(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("/oper/upload4linkedin");
        List<Company> companyList = companyMapper.selectAll();
        mav.addObject("result", companyList);
        mav.addObject("id", CookieUtils.getCookie(request, "id"));
        mav.addObject("firstName", CookieUtils.getCookie(request, "firstName"));
        mav.addObject("lastName", CookieUtils.getCookie(request, "lastName"));
        mav.addObject("pictureUrl", CookieUtils.getCookie(request, "pictureUrl"));
        return mav;
    }
}
