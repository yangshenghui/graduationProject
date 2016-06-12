package com.usst.dissertation.sql.document.entity;

import com.usst.dissertation.sql.base.BaseObject;

public class DocumentType extends BaseObject{
	
	private static final long serialVersionUID = 1L;

	private String typeName;
	
	private int order;
	
	private int sum;

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public int getOrder() {
		return order;
	}

	public void setOrder(int order) {
		this.order = order;
	}

	public int getSum() {
		return sum;
	}

	public void setSum(int sum) {
		this.sum = sum;
	}
	
}
