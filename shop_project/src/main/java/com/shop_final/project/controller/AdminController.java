package com.shop_final.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {
	// 상품 추가 화면
	@GetMapping("/product/insertPrdForm")
	public String insertPrdForm(Model model) {
		return "shop/insertPrdFormView";
	}
	
	// 상품 변경 화면
	@GetMapping("/product/changePrdForm")
	public String changePrdForm() {
		return "shop/changePrdFormView";
	}

}
