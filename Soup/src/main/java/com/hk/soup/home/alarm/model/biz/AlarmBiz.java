package com.hk.soup.home.alarm.model.biz;

import java.util.List;

import com.hk.soup.home.alarm.dto.AlarmDto;

public interface AlarmBiz {

	public List<AlarmDto> selectAlarmList(int memberNo, String alarmGubun1, String alarmGubun2);
	
	public int insertAlarm(AlarmDto dto);
	
	public int updateAlarm(AlarmDto dto);
	
}
