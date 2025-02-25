package com.shop_final.project.dao;

import java.util.HashMap;

import com.shop_final.project.model.MemberVO;

public interface IMemberDAO {
	
	// 로그인 체크
	public String loginCheck(HashMap<String, Object> map);
	// 회원가입
	public void insertMember(MemberVO vo);
	// 관리자 확인
	public String managerCheck(String id);
	// 아이디 체크
	public String memIdCheck(String id);
	// 아이디 찾기
	public String memIdFind(String memName, String memEmail);
}
