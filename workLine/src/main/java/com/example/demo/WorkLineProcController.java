package com.example.demo;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class WorkLineProcController {

	
	@Autowired
	WorkLineService workLineService;
	@Autowired
	WorkLineDAO workLineDAO;

	@RequestMapping(value="/signupProc")
	public int signupProc(
		WorkLineDTO workLineDTO
	) {
		int cnt=0;
		try {
			cnt = workLineService.insertSignup(workLineDTO);
		}catch(Exception e) {
			System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
			System.out.println("WorkLineProcController에서 signupProc를 실행하다가 오류가 생겼습니다.");
			System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
			System.out.println(e);
		}
		return cnt;
	}
	
	
	@RequestMapping(value="/loginProc")
	public int loginProc(
		WorkLineDTO workLineDTO,
		HttpSession session
	) {
		int cnt=0;
		try {
			cnt=workLineDAO.login(workLineDTO);
			if(cnt==1) { session.setAttribute("mid", workLineDTO.getMid()); }
		}catch(Exception e) {
			System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
			System.out.println("WorkLineProcController에서 loginProc를 실행하다가 오류가 생겼습니다.");
			System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
			System.out.println(e);
			cnt=-1;
		}
		return cnt;
	}

	@RequestMapping(value="/saveChatProc")
	public int saveChatProc(
		WorkLineDTO workLineDTO,
		HttpSession session
	) {
		workLineService.insertChat(workLineDTO);
		return 0;
	}
}
