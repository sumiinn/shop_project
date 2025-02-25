package com.shop_final.project.dao;

import java.util.ArrayList;

import com.shop_final.project.model.EventVO;

public interface IEventDAO {
	// 이벤트 상품 삽입
	public void insertEvent(EventVO vo); 
	
	// 전체 이벤트 상품 조회
	public ArrayList<EventVO> listAllEventProduct(); 
	
	// 이벤트 카테고리 별 상품 조회
	public ArrayList<EventVO> eventCtgListProduct(String eventCtgId); 
	
}
