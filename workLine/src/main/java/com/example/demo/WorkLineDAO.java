package com.example.demo;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface WorkLineDAO {

	int checkUuid(WorkLineDTO workLineDTO);
	int checkMid(WorkLineDTO workLineDTO);
	int insertSignup(WorkLineDTO workLineDTO);
}
