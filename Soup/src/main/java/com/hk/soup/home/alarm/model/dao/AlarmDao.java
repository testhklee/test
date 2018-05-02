package com.hk.soup.home.alarm.model.dao;

import java.util.List;
import java.util.Map;

import com.hk.soup.home.alarm.dto.AlarmDto;

public interface AlarmDao {

	public List<AlarmDto> selectAlarmList(Map<String, String> in);
	
	public int insertAlarm(AlarmDto dto);
	
	public int updateAlarm(AlarmDto dto);
	
}
