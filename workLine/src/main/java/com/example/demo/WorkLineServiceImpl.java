package com.example.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class WorkLineServiceImpl implements WorkLineService {

	@Autowired
	WorkLineDAO workLineDAO;
	
	public int insertSignup(WorkLineDTO workLineDTO) {
		int cnt = 0;
		if(workLineDAO.checkUuid(workLineDTO)>0) return -1;
		if(workLineDAO.checkMid(workLineDTO)>0) return -2;
		
		cnt = workLineDAO.insertSignup(workLineDTO);
		
		return cnt;
	}
	
}
