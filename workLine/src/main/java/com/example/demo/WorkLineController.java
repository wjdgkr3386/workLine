package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WorkLineController {

	@RequestMapping( value="/workLine")
	public ModelAndView workLine(
	){
		ModelAndView mav = new ModelAndView();
		mav.setViewName( "workLine" );
		return mav;
    }


	@RequestMapping( value="/login")
	public ModelAndView login(
	){
		ModelAndView mav = new ModelAndView();
		mav.setViewName( "login" );
		return mav;
    }

	@RequestMapping( value="/signup")
	public ModelAndView signup(
	){
		ModelAndView mav = new ModelAndView();
		mav.setViewName( "signup" );
		return mav;
    }
	
}
