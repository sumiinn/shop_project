package com.shop_final.project.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop_final.project.model.CommunityVO;
import com.shop_final.project.service.CommunityService;

import jakarta.servlet.http.HttpSession;

@Controller
public class CommunityController {
	@Autowired
	CommunityService communityService;
	
	// 커뮤니티 페이지 열기
	@GetMapping("/community/communityView")
	public String communityView(Model model) {
        ArrayList<CommunityVO> aboutList = communityService.communityWriteList("1");
		
		model.addAttribute("aboutList", aboutList);
		
		return "community/aboutView";
	}
	
	// ABOUT 페이지 열기
	@GetMapping("/community/noticeView")
	public String aboutView(Model model) {
        ArrayList<CommunityVO> noticeList =communityService.communityWriteList("2");
		
		model.addAttribute("noticeList", noticeList);
		
		return "community/noticeView";
	}
	
	/* 공지글 작성 페이지 뷰 */
	@RequestMapping("/community/notification/Write")
	public String notificationWrite(HttpSession session,Model model) {
		String memId = (String)session.getAttribute("sid");
		model.addAttribute("memId", memId);
		return "community/write1";
	}
	@RequestMapping("/community/review/Write")
	public String reviewWrite(HttpSession session,Model model) {
		String memId = (String)session.getAttribute("sid");
		model.addAttribute("memId", memId);
		return "community/write2";
	}
	@RequestMapping("/community/qa/Write")
	public String qaWrite(HttpSession session,Model model) {
		String memId = (String)session.getAttribute("sid");
		model.addAttribute("memId", memId);
		return "community/write3";
	}
	/* 글 작성 */
	@RequestMapping("/community/insert")
	public String insertWrite(CommunityVO vo) {
		communityService.insertWrite(vo);
		return"redirect:/";
	}
	/* 작성글 호출 */
	@RequestMapping("/community/read/{postNo}")
	public String communityRead(@PathVariable String postNo,Model model) {
		CommunityVO postVO=communityService.comRead(postNo);
		model.addAttribute("postVO", postVO);
		return"community/read1";
	}
}
