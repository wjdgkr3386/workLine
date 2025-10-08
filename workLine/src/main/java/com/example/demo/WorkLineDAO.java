package com.example.demo;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface WorkLineDAO {

	//회원가입
	int checkUuid(String uuid);
	int checkMid(WorkLineDTO workLineDTO);
	int insertSignup(WorkLineDTO workLineDTO);
	
	//로그인
	int login(WorkLineDTO workLineDTO);
	String getUuid(WorkLineDTO workLineDTO);

	//정보 목록 반환
	Map<String,Object> getMyInfo(String uuid);
	List<Map<String,Object>> getFriend(String uuid);
	
	//채팅
	int insertChat(WorkLineDTO workLineDTO);
	
	//친구추가
	int isFriend(Map<String,Object> map);
	int insertFriend(Map<String,Object> map);
	
	//1:1채팅방
	int checkChatRoomDirect(Map<String,Object> map);
	int insertChatRoomDirect(Map<String,Object> map);
	List<Map<String,Object>> chatList(Map<String,Object> map);
}
