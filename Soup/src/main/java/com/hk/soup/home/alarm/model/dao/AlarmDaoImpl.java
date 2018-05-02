package com.hk.soup.home.alarm.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.soup.home.alarm.dto.AlarmDto;

@Repository
public class AlarmDaoImpl implements AlarmDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private String nameSpace = "com.alarm.";
	
	@Override
	public List<AlarmDto> selectAlarmList(Map<String, String> in) {
		return sqlSession.selectList(nameSpace + "selectAlarmMessageList", in);
	}
	
	@Override
	public int insertAlarm(AlarmDto dto) {
		return sqlSession.insert(nameSpace+"insert",dto);
	}

	@Override
	public int updateAlarm(AlarmDto dto) {
		return sqlSession.update(nameSpace+"update",dto);
	}
	
	
}
