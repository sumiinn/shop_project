package com.shop_final.project.dao;

import java.util.ArrayList;

import com.shop_final.project.model.CommunityVO;

public interface ICommunityDAO {		
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
