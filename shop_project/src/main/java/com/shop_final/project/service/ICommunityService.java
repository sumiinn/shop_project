package com.shop_final.project.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.shop_final.project.model.CommunityVO;

@Service
public interface ICommunityService {	
	// 공지 글 작성
	public void insertWrite(CommunityVO vo);
	
	// 작성글 리스트 불러오기
	public ArrayList<CommunityVO> communityWriteList(String comuCateId);
	
	// 글 하나 불러오기
	public CommunityVO comRead(String postNo);
}
