package com.shop_final.project.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop_final.project.model.CommentVO;
import com.shop_final.project.service.CommentService;

@Controller
public class CommentController {
	@Autowired
	CommentService commentService;
	
	@PostMapping("/comment/insertComment")
	@ResponseBody
	public Map<String, Object> insertComment(@RequestParam String postNo,
			                                 @RequestParam String content,
			                                 @RequestParam String memId){
		CommentVO vo = new CommentVO();
		
		vo.setPostNo(postNo);
		vo.setMemId(memId);
		vo.setContent(content);
		
		boolean insertSuccess = commentService.insertComment(vo);
		
		Map<String, Object> response = new HashMap<>();
		
		if(insertSuccess) {
			response.put("status", "success");
		}else {
			response.put("status", "fail");
		}
		
		return response;
	}
	
	@GetMapping("/comment/loadComment/{postNo}")
	@ResponseBody
	public ArrayList<CommentVO> getComment(@PathVariable String postNo){
		return commentService.loadComment(postNo);
	}

}
