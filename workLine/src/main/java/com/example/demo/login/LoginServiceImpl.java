package com.example.demo.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	LoginDAO loginDAO;
	
	final int NOT_MID = -1;
	
	public int insertMember(LoginDTO loginDTO) {
		if(loginDAO.checkMid(loginDTO)>0) return NOT_MID;
		return loginDAO.insertMember(loginDTO);
	}
}
