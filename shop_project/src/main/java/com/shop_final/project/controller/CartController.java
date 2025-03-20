package com.shop_final.project.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop_final.project.model.CartVO;
import com.shop_final.project.model.MemberVO;
import com.shop_final.project.model.OrderInfoVO;
import com.shop_final.project.service.CartService;

import jakarta.servlet.http.HttpSession;

@Controller
public class CartController {
	@Autowired
	CartService cartService;
	
	// 장바구니 목록 보기 
	@RequestMapping("/cartList")
	public String cartList(Model model, HttpSession session) {
		// 회원에 해당하는 cartList 출력
		String memId = (String)session.getAttribute("sid");
		ArrayList<CartVO> cartList = cartService.cartList(memId);
		model.addAttribute("cartList", cartList);
		
		// 카트에 담긴 상품 개수 출력
		long prdCount = cartList.stream().map(CartVO::getPrdNo).distinct().count();
		model.addAttribute("prdCount", prdCount);

		return "shop/cartListView";
	}
	
	// 장바구니에 상품 추가
	@RequestMapping("/shop/insertCart")
	public String insertCart(CartVO vo, HttpSession session) {
		// 로그인 성공 시 
		String memId = (String)session.getAttribute("sid");
		vo.setMemId(memId);				
		
		// count 변수를 통한 동일 상품 확인
		int count = cartService.checkPrdInCart(vo.getPrdNo(), memId);
		
		if(count == 0) { 
			cartService.insertCart(vo);	// 장바구니에 추가		
		} else { 
			cartService.updateQtyInCart(vo); // 수량 변경
		}
		
		// 포워딩을 통한 장바구니 목록 출력
		return "redirect:/cartList";
	}
	
	// 장바구니에서 상품 삭제
	@ResponseBody
	@RequestMapping("/shop/deleteCart")
	public int deleteCart(@RequestParam("chkbox[]") ArrayList<String> chkArr) {
		int result = 0;

		// 서비스에게 ArrayList 그대로 전달
		if (chkArr != null) {
			cartService.deleteCart(chkArr);
			result = 1;
		}

		return result;
	}	
	
	// 장바구니 수량 업데이트
	@ResponseBody
	@RequestMapping("/shop/updateCart")
	public int updateCart(@RequestParam int[] cartNo,
                          @RequestParam int[] cartQty) {
		int result = 0;
		
		// 수량 업데이트 (변경 버튼 누르면)
	    for (int i = 0; i < cartNo.length; i++) {	    	
	        CartVO vo = new CartVO();
	        vo.setCartNo(cartNo[i]);
	        vo.setCartQty(cartQty[i]);
	        cartService.updateCart(vo);	        
	        result = 1;
	    }
	    
	    return result;	    
	}
	
	// 주문서 열기
	@RequestMapping("/orderForm")
	public String orderForm(@RequestParam("cartNo") int[] cartNo,
			                @RequestParam("cartQty") int[] cartQty,			               
			                Model model,
			                HttpSession session) {		
		String memId = (String)session.getAttribute("sid");	          		
		
		// 주문서에 출력할 회원 정보 가져오기
		MemberVO memVo = cartService.getMemberInfo(memId);
		// 전화번호 설정
		String[] hp = (memVo.getMemHP()).split("-");
		
		// model 설정
		model.addAttribute("memVo", memVo);
		model.addAttribute("hp1", hp[0]);
		model.addAttribute("hp2", hp[1]);
		model.addAttribute("hp3", hp[2]);
		
		// 주문서에 장바구니 목록 출력 
		ArrayList<CartVO> cartList = cartService.cartList(memId);
		model.addAttribute("cartList", cartList); 
		
		// 총 상품 금액 계산
	    int totalPrice = 0;
	    for (CartVO prd : cartList) {
	        totalPrice += prd.getPrdPrice() * prd.getCartQty();
	    }
	    
	    model.addAttribute("totalPrice", totalPrice);

		return "shop/orderForm";
	}
	
	// 주문완료 
	@RequestMapping("/orderComplete")
	public String orderComplete(OrderInfoVO ordInfoVo,
			                    @RequestParam String hp1,
			                    @RequestParam String hp2,
			                    @RequestParam String hp3,
			                    Model model) {		
		// 전화번호 
		String hp = hp1 + "-" + hp2 + "-" + hp3;
		ordInfoVo.setOrdRcvPhone(hp);

		// 주문번호
		long timeNum = System.currentTimeMillis();
		
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyyMMddHHmmss");
		String strTime = dayTime.format(new Date(timeNum));

		// 랜덤 숫자 4개 생성
		String rNum = "";
		for (int i = 1; i <= 4; i++) {
			rNum += (int) (Math.random() * 10);
		}

		// 주문번호 설정
		String ordNo = strTime + "_" + rNum;
		ordInfoVo.setOrdNo(ordNo);

		// 주문 정보 저장
		cartService.insertOrderInfo(ordInfoVo);
		
		// 주문 완료 페이지에서 사용할 Date 타입 설정
	    SimpleDateFormat dayTime2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    String strTime2 = dayTime2.format(new Date(timeNum));
	    
		// 모델에 추가
	    model.addAttribute("ordNo", ordNo);
	    model.addAttribute("ordDate", strTime2);

		return "shop/orderCompleteView";
	}

}
