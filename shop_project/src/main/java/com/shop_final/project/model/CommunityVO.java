package com.shop_final.project.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class CommunityVO {
	private int postNo;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdDate;
	private String postTitle;
	private String postDetail;
	private String postImg;
	private String score;
	private String memId;
	private int commCtgId;
	private String prdNo;
	
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	public String getPostTitle() {
		return postTitle;
	}
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}
	public String getPostDetail() {
		return postDetail;
	}
	public void setPostDetail(String postDetail) {
		this.postDetail = postDetail;
	}
	public String getPostImg() {
		return postImg;
	}
	public void setPostImg(String postImg) {
		this.postImg = postImg;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public int getCommCtgId() {
		return commCtgId;
	}
	public void setCommCtgId(int commCtgId) {
		this.commCtgId = commCtgId;
	}
	public String getPrdNo() {
		return prdNo;
	}
	public void setPrdNo(String prdNo) {
		this.prdNo = prdNo;
	}
	
}
