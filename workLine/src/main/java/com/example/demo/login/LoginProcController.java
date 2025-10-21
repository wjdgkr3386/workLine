package com.example.demo.login;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class LoginProcController {
	
	@Autowired
	LoginService loginService;
	@Autowired
	LoginDAO loginDAO;

	final int SUCCESS = 1;
	final int NOT_MID = -3;
	final int ERROR = -99;
	
	
	@RequestMapping(value="/signupProc")
	public int signupProc(
		LoginDTO loginDTO
	) {
		System.out.println("LoginProcController -- signupProc");
		
		int cnt=0;
		try {
			cnt = loginService.insertMember(loginDTO);
		}catch(Exception e) {
			System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
			System.out.println("LoginProcController에서 signupProc를 실행하다가 오류가 생겼습니다.");
			System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
			e.printStackTrace();
			cnt = ERROR;
		}
		return cnt;
	}
	
	
	@RequestMapping(value="/loginProc")
	public int loginProc(
		LoginDTO loginDTO,
		HttpSession session
	) {
		System.out.println("LoginProcController -- loginProc");
		
		int cnt=0;
		try {
			if(loginDAO.checkMid(loginDTO)==0) return NOT_MID;
			if(loginDAO.login(loginDTO)==1) {
				cnt = SUCCESS;
				session.setAttribute("mid", loginDTO.getMid());
			}
		}catch(Exception e) {
			System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
			System.out.println("WorkLineProcController에서 loginProc를 실행하다가 오류가 생겼습니다.");
			System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
			e.printStackTrace();
			cnt = ERROR;
		}
		return cnt;
	}
	
}
