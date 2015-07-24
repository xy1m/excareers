package com.excareers.i18n;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;

@Controller
public class LanguageResolver {
	@Autowired
	CookieLocaleResolver localeResolver;

	// @Autowired SessionLocaleResolver resolver;
	/**
	 * 语言切换
	 */
	@RequestMapping("language")
	public ModelAndView language(HttpServletRequest request,
			HttpServletResponse response, String lan) {
		lan = lan.toLowerCase();
		if (StringUtils.isBlank(lan)) {
			return new ModelAndView("redirect:/");
		} else {
			if (StringUtils.equals(lan, "zh_cn")) {
				localeResolver.setLocale(request, response, Locale.CHINA);
			} else if (StringUtils.equals(lan, "en")) {
				localeResolver.setLocale(request, response, Locale.ENGLISH);
			} else {
				localeResolver.setLocale(request, response, Locale.CHINA);
			}
		}
		return new ModelAndView("redirect:/");
	}
}
