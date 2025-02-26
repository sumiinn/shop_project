package com.shop_final.project.dao;

import java.util.ArrayList;

import com.shop_final.project.model.CommunityVO;

public interface ICommunityDAO {	
	// 글 작성
	public void insertWrite(CommunityVO vo);
	
	// 작성글 리스트 불러오기
	public ArrayList<CommunityVO> communityWriteList(String comuCateId);
	
	// 글 하나 불러오기
	public CommunityVO comRead(String postNo);
}
