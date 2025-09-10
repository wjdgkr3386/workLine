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
			e.printStackTrace();
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
			if(cnt==1) {
				String uuid = workLineDAO.getUuid(workLineDTO);
				session.setAttribute("uuid", uuid);
			}
		}catch(Exception e) {
			System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
			System.out.println("WorkLineProcController에서 loginProc를 실행하다가 오류가 생겼습니다.");
			System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
			e.printStackTrace();
			cnt=-1;
		}
		return cnt;
	}

	@RequestMapping(value="/saveChatProc")
	public int saveChatProc(
		WorkLineDTO workLineDTO,
		HttpSession session
	) {
		try {
			workLineService.insertChat(workLineDTO);
		}catch(Exception e) {
			System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
			System.out.println("WorkLineProcController에서 saveChatProc를 실행하다가 오류가 생겼습니다.");
			System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
			e.printStackTrace();
		}
		return 0;
	}
}
