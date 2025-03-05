package com.shop_final.project.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class CommentVO {
	private int commentNo;
	private String content;
	private String memId;
	private int postNo;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createdDate;
	
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
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
		
}
