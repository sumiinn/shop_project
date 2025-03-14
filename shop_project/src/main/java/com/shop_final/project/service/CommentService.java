package com.shop_final.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.shop_final.project.dao.ICommentDAO;
import com.shop_final.project.model.CommentVO;

@Service
public class CommentService implements ICommentService {
	@Autowired
	@Qualifier("ICommentDAO")
	ICommentDAO dao;

	@Override
	public boolean insertComment(CommentVO vo) {
		boolean response = dao.insertComment(vo);	
		
		return response;
	}

	@Override
	public ArrayList<CommentVO> loadComment(int postNo) {
		return dao.loadComment(postNo);
	}

	@Override
	public boolean updateComment(CommentVO vo) {
		boolean result = dao.updateComment(vo);
		
		return result;
	}

	@Override
	public boolean deleteComment(int commentNo) {
		boolean result = dao.deleteComment(commentNo);
		
		return result;
	}

}
