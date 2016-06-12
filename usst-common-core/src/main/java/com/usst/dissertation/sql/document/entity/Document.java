package com.usst.dissertation.sql.document.entity;

import com.usst.dissertation.sql.base.BaseObject;

public class Document extends BaseObject{
	
	private String userId;

	private String articleAuthor;
	
	private String articleTitle;
	
	private String articleType;
	
	private String articleKey;
	
	private String articleDigest;
	
	private String articleContent;
	
	private String isDrafts;
	
	private String articleStatus;
	
	private String auditorId;
	
	private String auditorOpinion;
	
	private String isAudit;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getArticleAuthor() {
		return articleAuthor;
	}

	public void setArticleAuthor(String articleAuthor) {
		this.articleAuthor = articleAuthor;
	}

	public String getArticleTitle() {
		return articleTitle;
	}

	public void setArticleTitle(String articleTitle) {
		this.articleTitle = articleTitle;
	}

	public String getArticleType() {
		return articleType;
	}

	public void setArticleType(String articleType) {
		this.articleType = articleType;
	}

	public String getArticleKey() {
		return articleKey;
	}

	public void setArticleKey(String articleKey) {
		this.articleKey = articleKey;
	}

	public String getArticleDigest() {
		return articleDigest;
	}

	public void setArticleDigest(String articleDigest) {
		this.articleDigest = articleDigest;
	}	

	public String getArticleContent() {
		return articleContent;
	}

	public void setArticleContent(String articleContent) {
		this.articleContent = articleContent;
	}	

	public String getIsDrafts() {
		return isDrafts;
	}

	public void setIsDrafts(String isDrafts) {
		this.isDrafts = isDrafts;
	}

	public String getArticleStatus() {
		return articleStatus;
	}

	public void setArticleStatus(String articleStatus) {
		this.articleStatus = articleStatus;
	}

	public String getAuditorId() {
		return auditorId;
	}

	public void setAuditorId(String auditorId) {
		this.auditorId = auditorId;
	}

	public String getAuditorOpinion() {
		return auditorOpinion;
	}

	public void setAuditorOpinion(String auditorOpinion) {
		this.auditorOpinion = auditorOpinion;
	}

	public String getIsAudit() {
		return isAudit;
	}

	public void setIsAudit(String isAudit) {
		this.isAudit = isAudit;
	}
	
	
	
	
	
}
