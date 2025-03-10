package com.shop_final.project.service;

import java.util.ArrayList;

import com.shop_final.project.model.CommentVO;

public interface ICommentService {
	// 댓글 등록
	public boolean insertComment(CommentVO vo);
	
	// 댓글 조회
	public ArrayList<CommentVO> loadComment(String postNo);

}
