package com.shop_final.project.model;

public class OrderProductVO {
	private String ordNo;
	private String prdNo;
	private int ordQty;
	private String ordColor;
	private String ordSize;
	
	public String getOrdColor() {
		return ordColor;
	}
	public void setOrdColor(String ordColor) {
		this.ordColor = ordColor;
	}
	public String getOrdSize() {
		return ordSize;
	}
	public void setOrdSize(String ordSize) {
		this.ordSize = ordSize;
	}
	
	public String getOrdNo() {
		return ordNo;
	}
	public void setOrdNo(String ordNo) {
		this.ordNo = ordNo;
	}
	public String getPrdNo() {
		return prdNo;
	}
	public void setPrdNo(String prdNo) {
		this.prdNo = prdNo;
	}
	public int getOrdQty() {
		return ordQty;
	}
	public void setOrdQty(int ordQty) {
		this.ordQty = ordQty;
	}
	
}
