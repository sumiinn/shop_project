package com.shop_final.project.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.shop_final.project.model.CommunityVO;

@Service
public interface ICommunityService {		
	// 작성글 리스트 조회
	public ArrayList<CommunityVO> communityPostList(String comuCateId);
	
	// 작성글 상세정보 조회
	public CommunityVO detailViewPost(String postNo);
	
	// 글 작성
	public void insertPost(CommunityVO vo);
	
	// 글 수정
	public void updatePost(CommunityVO vo);
	
	// 글 삭제
	public void deletePost(String postNo);
}
