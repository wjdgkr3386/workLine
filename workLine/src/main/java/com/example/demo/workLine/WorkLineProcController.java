package com.example.demo.workLine;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.login.LoginDTO;

public class WorkLineProcController {


	@RequestMapping(value="/saveChatProc")
	public Map<String, Object> saveChatProc(
		LoginDTO workLineDTO,
		HttpSession session
	) {
		Map<String, Object> map = new HashMap<String,Object>();
		try {
			workLineService.insertChat(workLineDTO);
			LocalDateTime now = LocalDateTime.now();
			map.put("time", now.getHour() + ":" + now.getMinute());
			map.put("status", 1);
		}catch(Exception e) {
			System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
			System.out.println("WorkLineProcController에서 saveChatProc를 실행하다가 오류가 생겼습니다.");
			System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
			e.printStackTrace();
			map.put("status", -1);
			return map;
		}
		return map;
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
			if(cnt==0) {
				return cnt;
			}
			//이미 친구 추가가 되어있는지 확인
			if(workLineDAO.isFriend(map)>0) {
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
	
	@RequestMapping(value="/getChatroomDirectProc")
	public Map<String,Object> getChatroomDirectProc(
		HttpSession session,
		String friendCode
	){
		int status = 0;
		String uuid = (String)session.getAttribute("uuid");
		Map<String, Object> map = new HashMap<String,Object>();
		Map<String, Object> response = new HashMap<String, Object>();
		List<Map<String,Object>> chatList = new ArrayList<Map<String,Object>>();
		
		map.put("uuid", uuid);
		map.put("friendCode", friendCode);

		//1:1 채팅방 있으면 status=1,  없으면 생성하고 status=2,  오류뜨면 status=-1
		if(workLineDAO.checkChatRoomDirect(map)>0) {
			chatList = workLineDAO.getChatRoomDirect(map);
			status = 1;
		}else {
			try {
				map.put("room_id", Util.rCode(17));
				status = workLineService.insertChatRoomDirect(map)>0 ? 2 : 0;
			}catch(Exception e) {
				System.out.println(e);
				status = -1;
			}
		}

		response.put("chatList", chatList);
		response.put("status", status);
		response.put("uuid", uuid);
		return response;
	}
}
