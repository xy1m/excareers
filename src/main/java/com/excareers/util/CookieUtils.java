package com.excareers.util;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @company: 搜狐

 * @author: zhenpengzhang
 
 * @createtime: 2014年8月28日 上午9:59:53

 * @version:
 
 */
public class CookieUtils {

    public final static String DOMAIN  = "excareers.com";
    public final static String PATH    = "/";
    public final static int    MAX_AGE = 60 * 60 * 24 * 60;

    public static void addCookie(HttpServletResponse response, String key, String value,
                                 String path, String domain, int maxAge) {
        Cookie cookie = new Cookie(key, value);
        cookie.setDomain(domain);
        cookie.setPath(path);
        cookie.setMaxAge(maxAge);
        response.addCookie(cookie);
    }

    public static void addCookie(HttpServletResponse response, String key, String value) {
        addCookie(response, key, value, PATH, DOMAIN, MAX_AGE);
    }

    public static String getCookie(HttpServletRequest request, String key) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(key)) {
                    return cookie.getValue();
                }
            }
        }
        return null;
    }

    public static void updateCookie(HttpServletRequest request, HttpServletResponse response,
                                    String key) {
        String value = getCookie(request, key);
        addCookie(response, key, value);
    }

    public static void clearAllCookie(HttpServletRequest request, HttpServletResponse response) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                clearCookie(response, cookie.getName());
            }
        }
    }

    public static void clearCookie(HttpServletResponse response, String key) {
        addCookie(response, key, null, PATH, DOMAIN, 0);
    }

    public static Map<String, String> toMap(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        if (cookies == null || cookies.length == 0)
            return new HashMap<String, String>();

        Map<String, String> map = new HashMap<String, String>(cookies.length * 2);
        for (Cookie c : cookies) {
            map.put(c.getName(), c.getValue());
        }
        return map;
    }

}
