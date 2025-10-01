package com.example.demo;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WorkLineController {

	@Autowired
	WorkLineDAO workLineDAO;
	
	
    @RequestMapping(value = "/workLine")
    public ModelAndView workLine(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        HttpSession session = request.getSession();
        String uuid = (String) session.getAttribute("uuid");
        
        if (uuid == null) {
            mav.setViewName("redirect:/login");
        } else {
        	System.out.println(1);
            Map<String,Object> userMap = workLineDAO.getUser(uuid);
        	System.out.println(userMap);
            mav.setViewName("workLine");
        	System.out.println(2);
            mav.addObject("userMap", userMap);
        	System.out.println(3);
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
		HttpSession session
	){
		session.removeAttribute("uuid");
		ModelAndView mav = new ModelAndView();
		mav.setViewName( "signup" );
		return mav;
    }
	
}
