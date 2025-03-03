package com.shop_final.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.shop_final.project.dao.ICommunityDAO;
import com.shop_final.project.model.CommunityVO;

@Service
public class CommunityService implements ICommunityService {
	@Autowired
	@Qualifier("ICommunityDAO")
	ICommunityDAO dao;
	
	@Override
	public ArrayList<CommunityVO> communityPostList(String comuCateId) {
		return dao.communityPostList(comuCateId);
	}
	@Override
	public CommunityVO detailViewPost(String postNo) {
		return dao.detailViewPost(postNo);
	}

	@Override
	public void insertPost(CommunityVO vo) {
		dao.insertPost(vo);
	}
	
	@Override
	public void updatePost(CommunityVO vo) {
		dao.updatePost(vo);		
	}
	
	@Override
	public void deletePost(String postNo) {
		dao.deletePost(postNo);		
	}

}
