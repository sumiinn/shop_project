package com.shop_final.project.service;

import java.util.ArrayList;

import com.shop_final.project.model.CommentVO;

public interface ICommentService {
	// 댓글 등록
	public boolean insertComment(CommentVO vo);
	
	// 댓글 조회
	public ArrayList<CommentVO> loadComment(int postNo);

	// 댓글 수정
	public boolean updateComment(CommentVO vo);
	
	// 댓글 삭제
	public boolean deleteComment(int commentNo);
}
