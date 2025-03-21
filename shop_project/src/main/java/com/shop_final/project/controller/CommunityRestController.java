package com.shop_final.project.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.shop_final.project.model.CommunityVO;
import com.shop_final.project.service.CommunityService;

@RestController
@RequestMapping("/community")
public class CommunityRestController {
	@Autowired
	CommunityService communityService;
	
	// 글 작성
	@PostMapping("/insertPost")
	public ResponseEntity<String> insertPost(CommunityVO vo,
			                                 @RequestParam(value = "postImgFiles", required = false) List<MultipartFile> files) {
		try {
			List<String> savedFileNames = saveFile(files);
			// 빈 값 저장 방지
			if (savedFileNames.isEmpty()) {
				vo.setPostImg(null);
			} else {
				vo.setPostImg(String.join(",", savedFileNames));
			}

			communityService.insertPost(vo);
			
			return ResponseEntity.ok("글 작성 성공!");
		} catch (IOException e) {
			e.printStackTrace();
			
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("파일 업로드 실패");
		}

	}
	
	// 글 수정
	@PostMapping("/updatePost")
	public ResponseEntity<String> updatePost(@RequestParam("postTitle") String postTitle, 
			                 @RequestParam("postDetail") String postDetail,
			                 @RequestParam("postNo") int postNo,
			                 @RequestParam(value = "postImgFiles", required = false) List<MultipartFile> files) {
		CommunityVO vo = new CommunityVO();

		vo.setPostTitle(postTitle);
		vo.setPostDetail(postDetail);
		vo.setPostNo(postNo);

		if (files != null && !files.isEmpty()) {
			try {
				List<String> savedFileNames = saveFile(files);
				if (!savedFileNames.isEmpty()) {
					vo.setPostImg(String.join(",", savedFileNames)); // DB에 저장될 파일명 설정
				}
			} catch (IOException e) {
				e.printStackTrace();
				
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("파일 업로드 실패");
			}
		}

		communityService.updatePost(vo);

		return ResponseEntity.ok("글 수정 성공!");
	}
	
	// 글 삭제
	@DeleteMapping("/deletePost/{postNo}")
	public ResponseEntity<String> deletePost(@PathVariable String postNo) {
		communityService.deletePost(postNo);

		return ResponseEntity.ok("글 삭제 성공!");
	}
	
	// 파일 저장
	private List<String> saveFile(List<MultipartFile> files) throws IOException {
		// 파일 저장 경로 생성
		String uploadPath = "D:/springWorkspace/semi_project_images/upload/";

		// 여러 개의 파일명 저장할 리스트 생성
		List<String> savedFileNameList = new ArrayList<String>();

		for (MultipartFile file : files) {
			// 원본 파일명 저장
			String originalFileName = file.getOriginalFilename();

			// 파일 선택하지 않았을 때 UUID값 리스트에 추가되지 않도록 조건 추가
			if (originalFileName == null || originalFileName.isEmpty()) {
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
