package com.example.demo.login;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LoginDAO {

	//회원가입
	int checkMid(LoginDTO loginDTO);
	int insertMember(LoginDTO loginDTO);
	
	//로그인
	String getPwd(LoginDTO loginDTO);
}
