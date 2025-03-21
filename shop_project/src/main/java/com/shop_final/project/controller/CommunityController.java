package com.shop_final.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.shop_final.project.model.CommunityVO;
import com.shop_final.project.service.CommunityService;

import jakarta.servlet.http.HttpSession;

@Controller
public class CommunityController {
	@Autowired
	CommunityService communityService;
	
	// 커뮤니티 페이지 열기(ABOUT)
	@GetMapping("/community/communityView")
	public String communityView(Model model) {      
		// about 조회, 모델에 추가
		model.addAttribute("aboutList", communityService.detailViewPost("5"));
		
		return "community/aboutView";
	}
	
	// 공지 페이지 열기
	@GetMapping("/community/noticeView")
	public String aboutView(Model model) {		
		// 공지사항 목록 조회, 모델에 추가
		model.addAttribute("noticeList", communityService.communityPostList("2"));
		
		return "community/postListView";
	}	
	
	// 공지글 작성 페이지 열기
	@GetMapping("/community/noticePostView")
	public String noticePostView(HttpSession session, Model model) {
		String memId = (String)session.getAttribute("sid");
		
		model.addAttribute("memId", memId);
		
		return "community/insertPostForm";
	}
	
	// 상세 글 조회
	@GetMapping("/community/detailViewPost/{postNo}")
	public String detailViewPost(@PathVariable String postNo, Model model) {
		CommunityVO post = communityService.detailViewPost(postNo);
		
		model.addAttribute("post", post);
		
		return "community/postDetailView";
	}
	
	// 글 수정 페이지 열기
	@GetMapping("/community/updatePostForm/{postNo}")
	public String updatePostForm(@PathVariable String postNo, Model model) {
		CommunityVO post = communityService.detailViewPost(postNo);
		
		model.addAttribute("post", post);
		
		return "community/updatePostForm";
	}
	
	// 자주 묻는 질문 페이지 열기
	@GetMapping("/community/faqView")
	public String faqView() {
		return "community/faqView";
	}
	
	// 리뷰 페이지 열기
	@GetMapping("/community/reviewView")
	public String reviewView(Model model) {
		model.addAttribute("reviewList", communityService.communityPostList("4"));
		
		return "community/reviewListView";
	}
	
	// 상세 리뷰 페이지
	@GetMapping("/community/detailViewReview/{postNo}")
	public String detailViewReview(@PathVariable String postNo, Model model) {
		CommunityVO review = communityService.detailViewPost(postNo);
		
		model.addAttribute("review", review);
		
		return "community/reviewDetailView";
	}
	
}
