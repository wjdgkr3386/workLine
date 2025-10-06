package com.example.demo;

import java.util.Map;

public interface WorkLineService {

	int insertSignup(WorkLineDTO workLineDTO) throws Exception;
	
	int insertChat(WorkLineDTO workLineDTO) throws Exception;
	
	int insertFriend(Map<String,Object> map) throws Exception;
	
	int insertChatRoomDirect(Map<String,Object> map) throws Exception;
}
