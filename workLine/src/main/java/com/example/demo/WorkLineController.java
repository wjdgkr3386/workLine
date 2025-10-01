package com.example.demo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WorkLineController {

    private final WorkLineProcController workLineProcController;

    WorkLineController(WorkLineProcController workLineProcController) {
        this.workLineProcController = workLineProcController;
    }

	@RequestMapping( value="/workLine")
	public ModelAndView workLine(
		HttpServletRequest request,
		HttpServletResponse response 
	){
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();  
		String uuid = (String)session.getAttribute("uuid");
		try {
			if(uuid==null) {
				response.sendRedirect( "/login" );
			}else {
				mav.setViewName( "workLine" );
			}
		}catch(Exception e) {
			System.out.println(e);
		}
		return mav;
    }


	@RequestMapping( value="/login")
	public ModelAndView login(
		HttpSession session
	){
		session.removeAttribute("uuid");
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
