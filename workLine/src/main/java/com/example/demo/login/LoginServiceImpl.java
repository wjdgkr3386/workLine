package com.example.demo.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	LoginDAO loginDAO;
	
	final int ALREADY_EXISTS = -1;
	
	
	public int insertMember(LoginDTO loginDTO) {
		if(loginDAO.checkMid(loginDTO)>0) return ALREADY_EXISTS;
		return loginDAO.insertMember(loginDTO);
	}
}
