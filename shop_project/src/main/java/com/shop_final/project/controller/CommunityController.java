package com.shop_final.project.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop_final.project.model.CommunityPostsVO;
import com.shop_final.project.service.CommunityService;

import jakarta.servlet.http.HttpSession;

@Controller
public class CommunityController {
	@Autowired
	CommunityService CommunityService;
	
	
	/* 커뮤니티뷰 */
	@RequestMapping("/community/communityView")
	public String communityView(Model model) {
		ArrayList<CommunityPostsVO> notiList =CommunityService.wirteList("1");
		ArrayList<CommunityPostsVO> reviewList =CommunityService.wirteList("2");
		ArrayList<CommunityPostsVO> qaList =CommunityService.wirteList("3");
		
		model.addAttribute("notiList", notiList);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("qaList", qaList);
		return "community/community";
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
	public String insertWrite(CommunityPostsVO vo) {
		CommunityService.insertWrite(vo);
		return"redirect:/";
	}
	/* 작성글 호출 */
	@RequestMapping("/community/read/{postNo}")
	public String communityRead(@PathVariable String postNo,Model model) {
		CommunityPostsVO postVO=CommunityService.comRead(postNo);
		model.addAttribute("postVO", postVO);
		return"community/read1";
	}
}
