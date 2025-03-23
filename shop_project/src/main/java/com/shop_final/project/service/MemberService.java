package com.shop_final.project.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.shop_final.project.dao.IMemberDAO;
import com.shop_final.project.model.MemberVO;

@Service
public class MemberService implements IMemberService {
	@Autowired
	@Qualifier("IMemberDAO")
	IMemberDAO dao;
	
	@Autowired
	PasswordEncoder pwdEncoder;
	
	// 로그인 체크	
	@Override
	public String loginCheck(HashMap<String, Object> map) {
		String encodedPwd = dao.loginCheck(map);
		String result = "fail";
		
		if(encodedPwd != null && pwdEncoder.matches((String)map.get("pwd"), encodedPwd)){
			result ="success";
		}
		
		return result;
	}
	
	// 회원가입
	@Override
	public void insertMember(MemberVO vo) {
		String encodedPwd = pwdEncoder.encode(vo.getMemPw());
		vo.setMemPw(encodedPwd);
		dao.insertMember(vo);
	}
	
	// 관리자 확인
	@Override
	public String managerCheck(String id) {
		return dao.managerCheck(id);
	}
	
	// 아이디 확인
	@Override
	public String memIdCheck(String id) {
		return dao.memIdCheck(id);
	}
	
	// 아이디 찾기
	@Override
	public String memIdFind(String memName, String memEmail) {
		return dao.memIdFind(memName, memEmail);
	}
}
