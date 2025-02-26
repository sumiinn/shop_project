package com.shop_final.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.shop_final.project.dao.IProductDAO;
import com.shop_final.project.model.CommunityVO;
import com.shop_final.project.model.ProductVO;
import com.shop_final.project.model.SubCategoryVO;

@Service
public class ProductService implements IProductService {
	@Autowired
	@Qualifier("IProductDAO")
	IProductDAO dao;
	
	// 카테고리 상품 조회
	@Override
	public ArrayList<ProductVO> ctgListProduct(String mcId) {
		return dao.ctgListProduct(mcId);
	}
	
	// 서브 카테고리 
	@Override
	public ArrayList<SubCategoryVO> subList(String mcId) {
		return dao.subList(mcId);
	}
	
	@Override
	public String prdNoCheck(String prdNo) {
		// TODO Auto-generated method stub
		return dao.prdNoCheck(prdNo);
	}
	
	@Override
	public void insertProduct(ProductVO vo) {
		dao.insertProduct(vo);
	}
	
	@Override
	public ProductVO prdInfoView(String prdNo) {
		return dao.prdInfoView(prdNo);
	}
	
	@Override
	public ArrayList<CommunityVO> prdReviewList(String prdNo) {
		return dao.prdReviewList(prdNo);
	}
	
	@Override
	public ArrayList<ProductVO> randomPrdList(String prdNo) {
		return dao.randomPrdList(prdNo);
	}
	
	@Override
	public void changeProduct(ProductVO vo) {
		dao.changeProduct(vo);
		
	}
	
	@Override
	public void productDelete(String prdNo) {
		dao.productDelete(prdNo);
	}
	
	@Override
	public ArrayList<ProductVO> bestPrdList() {
		return dao.bestPrdList();
	}
	
	@Override
	public ArrayList<ProductVO> newPrdList() {
		// TODO Auto-generated method stub
		return dao.newPrdList();
	}
	
}
