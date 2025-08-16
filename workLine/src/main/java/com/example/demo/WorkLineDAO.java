package com.example.demo;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface WorkLineDAO {

	//회원가입
	int checkUuid(WorkLineDTO workLineDTO);
	int checkMid(WorkLineDTO workLineDTO);
	int insertSignup(WorkLineDTO workLineDTO);
	
	//로그인
	int login(WorkLineDTO workLineDTO);
}
