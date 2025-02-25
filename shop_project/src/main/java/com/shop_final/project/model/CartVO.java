package com.shop_final.project.model;

public class CartVO {
	//DB 테이블에 있는 필드
	private int cartNo;
	private String memId;
	private String prdNo;
	private int cartQty;
	private String cartColor;
	private String cartSize;
	
	// DB 테이블에는 없지만 
	// Mapper에서 받아서 뷰 페이지에 출력할 때 필요한 필드 추가
	private String prdName;
	private String prdPrice;
	private String prdInfoImg;
	private String mcId;
	
	public String getMcId() {
		return mcId;
	}
	public void setMcId(String mcId) {
		this.mcId = mcId;
	}
	public int getCartNo() {
		return cartNo;
	}
	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getPrdNo() {
		return prdNo;
	}
	public void setPrdNo(String prdNo) {
		this.prdNo = prdNo;
	}
	public int getCartQty() {
		return cartQty;
	}
	public void setCartQty(int cartQty) {
		this.cartQty = cartQty;
	}
	public String getCartColor() {
		return cartColor;
	}
	public void setCartColor(String cartColor) {
		this.cartColor = cartColor;
	}
	public String getCartSize() {
		return cartSize;
	}
	public void setCartSize(String cartSize) {
		this.cartSize = cartSize;
	}
	public String getPrdName() {
		return prdName;
	}
	public void setPrdName(String prdName) {
		this.prdName = prdName;
	}
	public String getPrdPrice() {
		return prdPrice;
	}
	public void setPrdPrice(String prdPrice) {
		this.prdPrice = prdPrice;
	}
	public String getPrdInfoImg() {
		return prdInfoImg;
	}
	public void setPrdInfoImg(String prdInfoImg) {
		this.prdInfoImg = prdInfoImg;
	}

}
