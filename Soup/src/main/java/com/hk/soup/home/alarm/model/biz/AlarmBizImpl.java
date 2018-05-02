package com.hk.soup.home.alarm.model.biz;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hk.soup.home.alarm.dto.AlarmDto;
import com.hk.soup.home.alarm.model.dao.AlarmDao;

@Service
public class AlarmBizImpl implements AlarmBiz {

	@Autowired
	private AlarmDao dao;

	@Override
	@Transactional
	public List<AlarmDto> selectAlarmList(int memberNo, String alarmGubun1, String alarmGubun2) {
		Map<String, String> in = new HashMap<String, String>();
		in.put("memberNo", String.valueOf(memberNo));
		in.put("alarmGubun1", alarmGubun1);
		in.put("alarmGubun2", alarmGubun2);
		
		return dao.selectAlarmList(in);
	}
	
	@Override
	@Transactional
	public int insertAlarm(AlarmDto dto) {
		return dao.insertAlarm(dto);
	}

	@Override
	@Transactional
	public int updateAlarm(AlarmDto dto) {
		return dao.updateAlarm(dto);
	}
}
