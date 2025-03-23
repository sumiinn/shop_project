package com.shop_final.project.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.shop_final.project.model.MemberVO;
import com.shop_final.project.service.MemberService;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/member")
public class MemberRestController {
	@Autowired
	MemberService memberService;
	
	// 로그인
	@PostMapping("/login")
	public ResponseEntity<String> loginCheck(@RequestBody HashMap<String, Object> param,
							                 HttpSession session) {
		String mangerC = memberService.managerCheck((String)param.get("id"));
		String result = memberService.loginCheck(param);	
		
		if(result.equals("success")) {
			session.setAttribute("sid", param.get("id"));
			if (mangerC.equals("1")) {
				session.setAttribute("mid", mangerC);				
			}
		}
		
		return ResponseEntity.ok(result);
	}
	
	// 로그아웃
	@PostMapping("/logout")
	public ResponseEntity<String> logout(HttpSession session) {
		session.invalidate();
		return ResponseEntity.ok("success");
	}
	
	// 아이디 중복 체크
	@PostMapping("/idCheck")
	public ResponseEntity<String> idCheck(@RequestBody HashMap<String, String> map) {
		String memId = map.get("memId");
		String memId_result = memberService.memIdCheck(memId);
		String result = "fail";
		
		if(memId_result == null) {
			result ="success";
		}
		
		return ResponseEntity.ok(result);
	}
	
	// 회원가입
	@PostMapping("/join")
	public ResponseEntity<String> insertMember(@RequestBody MemberVO vo) {
		try {
			memberService.insertMember(vo);
			return ResponseEntity.ok("success");
		} catch (Exception e){
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("fail");
		}
		
	}
	
	//아이디 찾기
	@PostMapping("/findId")
	public ResponseEntity<String> findId(@RequestBody HashMap<String, String> map) {
		String memName = map.get("memName");
		String memEmail = map.get("memEmail");

		String memId = memberService.memIdFind(memName, memEmail);
		
		if(memId != null) {
			return ResponseEntity.ok(memId);
		}else {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body("아이디가 존재하지 않습니다.");
		}
	}

}
