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
	public ArrayList<CommentVO> loadComment(String postNo) {
		return dao.loadComment(postNo);
	}

}
