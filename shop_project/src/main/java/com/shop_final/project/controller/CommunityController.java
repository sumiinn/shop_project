package com.shop_final.project.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
	
	// 글 작성
	@PostMapping("/community/insertPost")
	public String insertPost(CommunityVO vo, 
			                 @RequestParam(value="postImgFiles", required=false) List<MultipartFile> files) {
		try {			
			List<String> savedFileNames = saveFile(files);
			// 빈 값 저장 방지
			if(savedFileNames.isEmpty()) {
				vo.setPostImg(null);
			}else {
				vo.setPostImg(String.join(",", savedFileNames));
			}	
			
			communityService.insertPost(vo);
		} catch(IOException e) {
			e.printStackTrace();
		}

		return "redirect:/community/postListView";
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
	
	// 글 수정
	@PostMapping("/community/updatePost")
	public String updatePost(@RequestParam("postTitle") String postTitle,
			                 @RequestParam("postDetail") String postDetail,
			                 @RequestParam("postNo") int postNo,
			                 @RequestParam(value="postImgFiles", required=false) List<MultipartFile> files) {
		CommunityVO vo = new CommunityVO();
		
		vo.setPostTitle(postTitle);
		vo.setPostDetail(postDetail);
		vo.setPostNo(postNo);
		
		if(files != null && !files.isEmpty()) {
			try {
	            List<String> savedFileNames = saveFile(files);
	            if (!savedFileNames.isEmpty()) {
	                vo.setPostImg(String.join(",", savedFileNames)); // DB에 저장될 파일명 설정
	            }
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
		}		
		
		communityService.updatePost(vo);
		
		return "redirect:/community/noticeView";
	}
	
	// 글 삭제
	@GetMapping("/community/deletePost/{postNo}")
	public String deletePost(@PathVariable String postNo) {
		communityService.deletePost(postNo);
		
		return "redirect:/community/noticeView";
	}
	
	// 파일 저장
	private List<String> saveFile(List<MultipartFile> files) throws IOException{
		// 파일 저장 경로 생성
		String uploadPath = "D:/springWorkspace/semi_project_images/upload/";
		
		// 여러 개의 파일명 저장할 리스트 생성
		List<String> savedFileNameList = new ArrayList<String>();
		
		for(MultipartFile file : files) {
			// 원본 파일명 저장
			String originalFileName = file.getOriginalFilename();		
			
			// 파일 선택하지 않았을 때 UUID값 리스트에 추가되지 않도록 조건 추가
			if(originalFileName == null || originalFileName.isEmpty()) {
				continue;
			}
			
			// 파일명 변경(중복 피하기)
			UUID uuid = UUID.randomUUID();
			String shortUUID = uuid.toString().substring(0, 8);
			String savedFileName = shortUUID.toString() + "_" + originalFileName;
			
			// 저장된 파일명 리스트
			savedFileNameList.add(savedFileName);
			
			// 파일(객체) 생성
			File sendFile = new File(uploadPath + savedFileName);
			
			// 서버로 전송
			file.transferTo(sendFile);			
		}
		
		return savedFileNameList;
	}
	
}
