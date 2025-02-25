package com.shop_final.project.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.shop_final.project.dao.ICartDAO;
import com.shop_final.project.model.CartVO;
import com.shop_final.project.model.MemberVO;
import com.shop_final.project.model.OrderInfoVO;

@Service
public class CartService implements ICartService {
	@Autowired
	@Qualifier("ICartDAO")
	ICartDAO dao;

	@Override
	public void insertCart(CartVO vo) {
		dao.insertCart(vo);
	}

	@Override
	public int checkPrdInCart(String prdNo, String memId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("prdNo", prdNo);
		map.put("memId", memId);
		
		return dao.checkPrdInCart(map);
	}

	@Override
	public void updateQtyInCart(CartVO vo) {
		dao.updateQtyInCart(vo);
	}

	@Override
	public ArrayList<CartVO> cartList(String memId) {
		return dao.cartList(memId);
	}

	@Override
	public void deleteCart(ArrayList<String> chkArr) {
		dao.deleteCart(chkArr);
	}

	@Override
	public MemberVO getMemberInfo(String memId) {
		return dao.getMemberInfo(memId);
	}

	@Override
	public void updateCart(CartVO vo) {
		dao.updateCart(vo);		
	}

	@Override
	public void insertOrderInfo(OrderInfoVO ordInfoVo) {
		// (1) 주문 정보 저장 (order_info 테이블에 저장)
		dao.insertOrderInfo(ordInfoVo);

		// (2) 주문 상품 내용 저장 (order_product 테이블에 저장)
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("ordNo", ordInfoVo.getOrdNo());
		map.put("memId", ordInfoVo.getMemId());
		dao.insertOrderProduct(map); 

		// (3) 주문 완료 후 장바구니 비우기
		dao.deleteCartAfterOrder(ordInfoVo.getMemId());		
	}

	@Override
	public void insertOrderProduct(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteCartAfterOrder(String memId) {
		// TODO Auto-generated method stub
		
	}
}
