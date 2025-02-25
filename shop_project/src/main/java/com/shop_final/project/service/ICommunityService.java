package com.shop_final.project.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.shop_final.project.model.CommunityPostsVO;

@Service
public interface ICommunityService {
	
	// 글 작성
	public void insertWrite(CommunityPostsVO vo);
	
	// 작성글 리스트 불러오기
	public ArrayList<CommunityPostsVO> wirteList(String comuCateId);
	
	// 글 하나 불러오기
	public CommunityPostsVO comRead(String postNo);
}
