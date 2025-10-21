package com.example.demo.workLine;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface WorkLineDAO {

	Map<String, Object> getMyInfo(String mid);
}
