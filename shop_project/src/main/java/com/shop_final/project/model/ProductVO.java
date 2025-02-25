package com.shop_final.project.model;

public class ProductVO {

	private String prdNo;
	private String prdName;
	private int prdPrice;
	private String prdImg;
	private String prdInfoImg;
	private String prdColor;
	private String prdSize;
	private int prdSale;
	private String mcId;
	private String scId;
	private int saleRate;
	
	/* db에는 없으나 mapper 호출용 */
	private String mcName;
	
	public String getMcName() {
		return mcName;
	}
	public void setMcName(String mcName) {
		this.mcName = mcName;
	}
	public int getSaleRate() {
		return saleRate;
	}
	public void setSaleRate(int saleRate) {
		this.saleRate = saleRate;
	}
	public String getPrdNo() {
		return prdNo;
	}
	public void setPrdNo(String prdNo) {
		this.prdNo = prdNo;
	}
	public String getPrdName() {
		return prdName;
	}
	public void setPrdName(String prdName) {
		this.prdName = prdName;
	}
	public int getPrdPrice() {
		return prdPrice;
	}
	public void setPrdPrice(int prdPrice) {
		this.prdPrice = prdPrice;
	}
	public String getPrdImg() {
		return prdImg;
	}
	public void setPrdImg(String prdImg) {
		this.prdImg = prdImg;
	}
	public String getPrdInfoImg() {
		return prdInfoImg;
	}
	public void setPrdInfoImg(String prdInfoImg) {
		this.prdInfoImg = prdInfoImg;
	}
	public String getPrdColor() {
		return prdColor;
	}
	public void setPrdColor(String prdColor) {
		this.prdColor = prdColor;
	}
	public String getPrdSize() {
		return prdSize;
	}
	public void setPrdSize(String prdSize) {
		this.prdSize = prdSize;
	}
	public int getPrdSale() {
		return prdSale;
	}
	public void setPrdSale(int prdSale) {
		this.prdSale = prdSale;
	}
	public String getMcId() {
		return mcId;
	}
	public void setMcId(String mcId) {
		this.mcId = mcId;
	}
	public String getScId() {
		return scId;
	}
	public void setScId(String scId) {
		this.scId = scId;
	}
	
}
