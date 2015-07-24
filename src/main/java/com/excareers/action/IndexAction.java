package com.excareers.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexAction {

	@RequestMapping(value = "/n/{folder}/{path}")
	public ModelAndView index(@PathVariable String folder,
			@PathVariable String path) {
		ModelAndView mav = new ModelAndView(folder + "/" + path);
		return mav;
	}

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView("/index");
		return mav;
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView("/user/login");
		return mav;
	}

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public ModelAndView join() {
		ModelAndView mav = new ModelAndView("/user/join");
		return mav;
	}

	@RequestMapping(value = "/unauthorized", method = RequestMethod.GET)
	public ModelAndView unauthorized() {
		ModelAndView mav = new ModelAndView("/user/unauthorized");
		return mav;
	}

	@RequestMapping(value = "/help", method = RequestMethod.GET)
	public ModelAndView help() {
		ModelAndView mav = new ModelAndView("/info/help");
		return mav;
	}
	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public ModelAndView about() {
		ModelAndView mav = new ModelAndView("/info/about");
		return mav;
	}
}
