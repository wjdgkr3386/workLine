package com.example.demo;

import java.util.Arrays;
import java.util.List;
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

        Map<String,Object> myInfoMap = workLineDAO.getMyInfo(uuid);
        List<Map<String,Object>> friendMapList = workLineDAO.getFriend(uuid);
        mav.setViewName("workLine");
        mav.addObject("myInfoMap", myInfoMap);
        mav.addObject("friendMapList", friendMapList);

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
