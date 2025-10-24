package com.example.demo.workLine;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WorkLineController {

	@Autowired
	WorkLineDAO workLineDAO;
	

	//기본 주소로 리디렉트ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	@GetMapping(value = "/")
	public String workLine() {
		System.out.println("WorkLineController -- String workLine");
		return "redirect:/workLine";
	}
	
	//기본 주소ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
    @GetMapping(value = "/workLine")
    public String workLine(
    		HttpServletRequest request,
    		Model model
    	) {
		System.out.println("WorkLineController -- ModelAndView workLine");
		
        HttpSession session = request.getSession();
        String mid = (String) session.getAttribute("mid");

        Map<String,Object> myInfoMap = workLineDAO.getMyInfo(mid);
        List<Map<String,Object>> friendMapList = workLineDAO.getFriend(mid);
        
        model.addAttribute("myInfoMap", myInfoMap);
        model.addAttribute("friendMapList", friendMapList);

        return "workLine";
    }
    
}
