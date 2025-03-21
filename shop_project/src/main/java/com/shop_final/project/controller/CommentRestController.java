package com.shop_final.project.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.shop_final.project.model.CommentVO;
import com.shop_final.project.service.CommentService;

@RestController
@RequestMapping("/comment")
public class CommentRestController {
	@Autowired
	CommentService commentService;
	
	@PostMapping
	public Map<String, Object> insertComment(@RequestBody CommentVO vo){				
		boolean insertSuccess = commentService.insertComment(vo);
		
		Map<String, Object> response = new HashMap<>();
		response.put("status", insertSuccess ? "success" : "fail");		
				
		return response;
	}
	
	@GetMapping("/{postNo}")
	public ArrayList<CommentVO> getComment(@PathVariable int postNo){
		return commentService.loadComment(postNo);
	}
	
	@PutMapping("/{commentNo}")
	public Map<String, Object> updateComment(@PathVariable int commentNo,		 
			                                 @RequestBody CommentVO vo) {		
		vo.setCommentNo(commentNo);
		boolean updateSuccess = commentService.updateComment(vo);
		
		Map<String, Object> response = new HashMap<>();
		response.put("status", updateSuccess ? "success" : "fail");
		
		return response;
	}
	
	@DeleteMapping("/{commentNo}")
	public Map<String, Object> deleteComment(@PathVariable int commentNo){	
		boolean deleteSuccess = commentService.deleteComment(commentNo);
		
		Map<String, Object> response = new HashMap<>();	
		response.put("status", deleteSuccess ? "success" : "fail");
		
		return response;
	}

}
