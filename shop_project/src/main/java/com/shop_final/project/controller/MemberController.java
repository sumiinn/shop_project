package com.shop_final.project.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop_final.project.model.MemberVO;
import com.shop_final.project.service.MemberService;

import jakarta.servlet.http.HttpSession;

@Controller
public class MemberController {
	@Autowired
	MemberService memService;
	
	/*로그인 화면 폼*/
	@RequestMapping("/member/loginForm")
	public String loginForm() {
		return "login/loginForm";
	}
	/* 멤버 로그인 처리 */
	@ResponseBody
	@RequestMapping("/member/login")
	public String loginCheck(@RequestParam HashMap<String, Object> param,
							 HttpSession session) {
		String mangerC = memService.managerCheck((String)param.get("id"));
		String result = memService.loginCheck(param);
		
		
		if(result.equals("success")) {
			session.setAttribute("sid", param.get("id"));
			if (mangerC.equals("1")) {
				session.setAttribute("mid", mangerC);				
			}
		}
		return result;
	}
	
	/* 회원가입 폼 */
	@RequestMapping("/member/signUp")
	public String signUpForm() {
		return "login/signUpForm";
	}
	
	/* 아이디 중복체크 */
	@ResponseBody
	@RequestMapping("/member/idCheck")
	public String idCheck(@RequestParam("memId") String memId) {
		String memId_result = memService.memIdCheck(memId);
		String result = "fail";
		if(memId_result == null) {
			result ="success";
		}
		
		return result;
	}
	
	/* 회원가입 */
	@RequestMapping("/member/insertmem")
	public String insertMember(MemberVO vo) {
		memService.insertMember(vo);
		return "redirect:/member/loginForm";
	}
	
	// 로그아웃
	@RequestMapping("/member/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	//아이디 찾기폼
	@RequestMapping("/member/findIdForm")
	public String findIdForm() {
		return "login/findIDForm";
	}
	
	//아이디 찾기
	@ResponseBody
	@RequestMapping("/member/findId")
	public String findId(@RequestParam("memName") String memName,
						 @RequestParam("memEmail") String memEmail) {
		
		String memId = memService.memIdFind(memName, memEmail);
		return memId;
	}
	//아이디 찾기폼
	@RequestMapping("/member/idView")
	public String idView(MemberVO vo,Model model) {
		String memId = memService.memIdFind(vo.getMemName(), vo.getMemEmail());
		model.addAttribute("memId", memId);
		return "login/idView";
	}
}
