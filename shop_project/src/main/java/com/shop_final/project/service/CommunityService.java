package com.shop_final.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.shop_final.project.dao.ICommunityDAO;
import com.shop_final.project.model.CommunityPostsVO;

@Service
public class CommunityService implements ICommunityService {
	@Autowired
	@Qualifier("ICommunityDAO")
	ICommunityDAO dao;
	
	@Override
	public void insertWrite(CommunityPostsVO vo) {
		dao.insertWrite(vo);
	}
	
	@Override
	public ArrayList<CommunityPostsVO> wirteList(String comuCateId) {
		return dao.wirteList(comuCateId);
	}
	@Override
	public CommunityPostsVO comRead(String postNo) {
		return dao.comRead(postNo);
	}


}
