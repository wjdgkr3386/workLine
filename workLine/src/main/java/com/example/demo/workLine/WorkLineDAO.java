package com.example.demo.workLine;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface WorkLineDAO {

	
	Map<String, Object> getMyInfo(String mid);  //내 정보
	List<Map<String,Object>> getFriend(String mid);  //친구 정보
	
}
