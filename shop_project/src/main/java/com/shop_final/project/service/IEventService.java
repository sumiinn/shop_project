package com.shop_final.project.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.shop_final.project.model.EventVO;

@Service
public interface IEventService {
	// 이벤트 상품 삽입
	public void insertEvent(EventVO vo); 
	
	// 전체 이벤트 상품 조회
	public ArrayList<EventVO> listAllEventProduct(); 
		
	// 이벤트 카테고리 별 상품
	public ArrayList<EventVO> eventCtgListProduct(String eventCtgId); 
}
