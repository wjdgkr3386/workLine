package com.example.demo;

import java.util.HashMap;
import java.util.Map;

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
			return -9;
		}
		return 0;
	}

	@RequestMapping(value="/addFriendProc")
	public int addFriendProc(
		String friendCode,
		HttpSession session
	) {
		//로그인 안되어있으면 리턴
		String uuid = (String) session.getAttribute("uuid");
		if(uuid==null) {
			return -1;
		}else if(uuid.equals(friendCode)) {
			return -2;
		}
		
		//검색에 사용할 데이터
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uuid", uuid);
		map.put("friendCode", friendCode);

		int cnt = 0;
		try {
			//친구 추가 코드가 이미 있는 계정인지 확인
			cnt = workLineDAO.checkUuid(uuid);
			if(cnt!=1) {
				return cnt;
			}
			//이미 친구 추가가 되어있는지 확인
			if(workLineDAO.isFriend(map)==1) {
				return -3;
			}
			
			cnt = workLineService.insertFriend(map);
			
		}catch(Exception e) {
			System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
			System.out.println("WorkLineProcController에서 addFriendProc를 실행하다가 오류가 생겼습니다.");
			System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
			e.printStackTrace();
			return -9;
		}
		return cnt;
	}
	

	@RequestMapping(value="/getChatroomProc")
	public int getChatroomProc(
		HttpSession session,
		String friendCode
	){
		System.out.println(1111);
		String uuid = (String)session.getAttribute("uuid");
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("uuid", uuid);
		map.put("friendCode", friendCode);
		
		int cnt = 0;
		//1:1 채팅방 있으면 cnt=0,  없으면 생성하고 cnt=1,  오류뜨면 cnt=-1
		if(workLineDAO.checkChatRoomDirect(map)==0) {
			try {
				cnt=workLineService.insertChatRoomDirect(map);
			}catch(Exception e) {
				System.out.println(e);
				cnt = -1;
			}
		}

		return cnt;
	}
	
}
