package com.shop_final.project.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.shop_final.project.model.CartVO;
import com.shop_final.project.service.CartService;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/shop")
public class CartRestController {
	@Autowired
	CartService cartService;
	
	// 장바구니에 상품 추가
	@PostMapping("/cart")
	public ResponseEntity<String> insertCart(@RequestBody CartVO vo, HttpSession session) {
		// 로그인 성공 시
		String memId = (String) session.getAttribute("sid");
		
		if(memId == null) {
			return ResponseEntity.badRequest().body("로그인 후 이용해주세요");
		}
		vo.setMemId(memId);		

		boolean isSuccess;
		// count 변수를 통한 동일 상품 확인
		int count = cartService.checkPrdInCart(vo.getPrdNo(), memId);

		if (count == 0) {
			isSuccess = cartService.insertCart(vo); // 장바구니에 추가
		} else {
			isSuccess = cartService.updateQtyInCart(vo); // 수량 변경
		}
		
		if(!isSuccess) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("장바구니 처리 실패");
		}

		return ResponseEntity.ok("장바구니 추가 성공");
	}
	
	// 장바구니 수량 업데이트
	@PutMapping("/cart")
	public ResponseEntity<String> updateCart(@RequestBody ArrayList<CartVO> cartList) {
		try {
			for(CartVO vo : cartList) {
				cartService.updateCart(vo);
			}
			return ResponseEntity.ok("장바구니 수정 성공");
		} catch(Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("장바구니 수정 실패");
		}
	}
	
	// 장바구니에서 상품 삭제
	@DeleteMapping("/cart")
	public ResponseEntity<String> deleteCart(@RequestBody ArrayList<String> cartNos) {		
		if(cartNos != null && !cartNos.isEmpty()) {
			cartService.deleteCart(cartNos);				
			return ResponseEntity.ok("장바구니 삭제 성공");
		} else {
			return ResponseEntity.badRequest().body("삭제할 상품이 없습니다.");
		}		
	}

}
