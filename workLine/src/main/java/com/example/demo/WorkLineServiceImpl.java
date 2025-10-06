package com.example.demo;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class WorkLineServiceImpl implements WorkLineService {

	@Autowired
	WorkLineDAO workLineDAO;
	
	public int insertSignup(WorkLineDTO workLineDTO) {
		if(workLineDAO.checkUuid(workLineDTO.getUuid())>0) return -1;
		if(workLineDAO.checkMid(workLineDTO)>0) return -2;
		return workLineDAO.insertSignup(workLineDTO);
	}
	
	
	public int insertChat(WorkLineDTO workLineDTO) {
		return workLineDAO.insertChat(workLineDTO);
	}
	
	public int insertFriend(Map<String,Object> map) {
		return workLineDAO.insertFriend(map);
	}
	
	public int insertChatRoomDirect(Map<String,Object> map) {
		return workLineDAO.insertChatRoomDirect(map);
	}
}
