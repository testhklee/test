package com.hk.soup.user.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hk.soup.home.dto.MemberDto;
import com.hk.soup.user.model.dao.UserDao;

@Service
public class UserBiz {

	@Autowired
	private UserDao dao;
	
	@Transactional
	public String bufString() {

		int index = 1;
		StringBuffer buf = new StringBuffer();
		String randPw[] = "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,0,1,2,3,4,5,6,7,8,9"
				.split(",");

		for (int i = 0; i < 8; i++) {
			index = (int) (randPw.length * Math.random());
			buf.append(randPw[index]);
		}
		return buf.toString();
	}

	//회원정보 수정
	@Transactional
	public int update(MemberDto dto) {
		return dao.update(dto);
	}
	
	//회원정보 수정
	@Transactional
	public int userOut(String memberEmail) {
		return dao.userOut(memberEmail);
	}
}
