package com.shop_final.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.shop_final.project.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	MemberService memService;
	
	// 로그인 페이지 열기
	@GetMapping("/member/loginForm")
	public String loginForm() {
		return "login/loginForm";
	}
	
	// 회원가입 페이지 열기
	@GetMapping("/member/joinForm")
	public String signUpForm() {
		return "login/joinForm";
	}
	
	// 아이디 찾기 열기
	@GetMapping("/member/findIdForm")
	public String findIdForm() {
		return "login/findIDForm";
	}
}
