package com.shop_final.project.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop_final.project.model.EventVO;
import com.shop_final.project.service.EventService;

@Controller
public class EventController {
	@Autowired
	EventService eventService;
	
	// 모든 이벤트 상품 출력(ALL)
	@RequestMapping("/event")
	public String event(Model model) {		
		ArrayList<EventVO> eventList = eventService.listAllEventProduct();
        model.addAttribute("eventList", eventList);
        
		return "event/eventCtgListView";
	}
	
	// 이벤트 카테고리 별 상품 출력
	@RequestMapping("/event/eventCtgList/{eventCtgId}")
	public String eventCtgListView(@PathVariable String eventCtgId, Model model) {
		ArrayList<EventVO> eventList = eventService.eventCtgListProduct(eventCtgId);
		
		// 뷰 페이지에 출력하기 위해 Model 설정
		model.addAttribute("eventList", eventList);
				
		return "event/eventCtgListView";
	}

}
