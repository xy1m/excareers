package com.fatface.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexAction {
    @RequestMapping(value = "/n/{folder}/{path}")
    public ModelAndView index(@PathVariable String folder, @PathVariable String path) {
        ModelAndView mav = new ModelAndView(folder + "/" + path);
        return mav;
    }
}
