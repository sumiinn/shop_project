package com.shop_final.project.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.shop_final.project.model.CartVO;
import com.shop_final.project.model.MemberVO;
import com.shop_final.project.model.OrderInfoVO;

public interface ICartService {
	// 장바구니
	// 장바구니에 추가
	public void insertCart(CartVO vo);
	// 동일 상품 존재 여부 확인
	public int checkPrdInCart(String prdNo, String memId);
	// 동일 상품이 존재하면 수량만 변경
	public void updateQtyInCart(CartVO vo);
	// 장바구니 조회
	public ArrayList<CartVO> cartList(String memId);
	// 장바구니에서 상품 삭제
	public void deleteCart(ArrayList<String> chkArr);

	// 주문서
	// 회원정보에 따른 주문서
	public MemberVO getMemberInfo(String memId);
	// 장바구니 수정
	public void updateCart(CartVO vo);
	// 주문 정보 저장
	public void insertOrderInfo(OrderInfoVO ordInfoVo);
	// 주문 상품 정보 저장
	public void insertOrderProduct(HashMap<String, Object> map);
	// 주문 후 장바구니 비우기
	public void deleteCartAfterOrder(String memId);
}
