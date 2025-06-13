package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WorkLineController {

	@RequestMapping( value="/workLine.do")
	public ModelAndView workLine(
	){
		ModelAndView mav = new ModelAndView();
		mav.setViewName( "workLine.jsp" );
		return mav;
    }
}
