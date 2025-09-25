package com.example.demo;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface WorkLineDAO {

	//회원가입
	int checkUuid(WorkLineDTO workLineDTO);
	int checkMid(WorkLineDTO workLineDTO);
	int insertSignup(WorkLineDTO workLineDTO);
	
	//로그인
	int login(WorkLineDTO workLineDTO);
	String getUuid(WorkLineDTO workLineDTO);
	
	
	
	//채팅
	int insertChat(WorkLineDTO workLineDTO);
	
	//친구추가
	int isFriend(Map<String,Object> map);
	
}
