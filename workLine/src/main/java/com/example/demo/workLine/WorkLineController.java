package com.example.demo.workLine;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.login.LoginDAO;

public class WorkLineController {

	@Autowired
	WorkLineDAO workLineDAO;
	

	//기본 주소로 리디렉트ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	@RequestMapping(value = "/")
	public String workLine() {
		System.out.println("WorkLineController -- String workLine");
		return "redirect:/workLine";
	}
	
	//기본 주소ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
    @RequestMapping(value = "/workLine")
    public ModelAndView workLine(
    		HttpServletRequest request
    	) {
		System.out.println("WorkLineController -- ModelAndView workLine");
		
        ModelAndView mav = new ModelAndView();
        HttpSession session = request.getSession();
        String mid = (String) session.getAttribute("mid");

        Map<String,Object> myInfoMap = workLineDAO.getMyInfo(mid);
        List<Map<String,Object>> friendMapList = workLineDAO.getFriend(mid);
        mav.setViewName("workLine");
        mav.addObject("myInfoMap", myInfoMap);
        mav.addObject("friendMapList", friendMapList);

        return mav;
    }
    
}
