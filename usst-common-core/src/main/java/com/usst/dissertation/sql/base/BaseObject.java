package com.usst.dissertation.sql.base;

import java.io.Serializable;

public abstract class BaseObject implements Serializable {    
    
	private static final long serialVersionUID = -1L;
	
	private String id;
	
	private String enabled;
	
	private String createOn;
	
	private String createBy;

	private String lstUpdateOn;
	
	private String lstUpdateBy;

	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEnabled() {
		return enabled;
	}

	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}

	public String getCreateOn() {
		return createOn;
	}

	public void setCreateOn(String createOn) {
		this.createOn = createOn;
	}

	public String getCreateBy() {
		return createBy;
	}

	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}

	public String getLstUpdateOn() {
		return lstUpdateOn;
	}

	public void setLstUpdateOn(String lstUpdateOn) {
		this.lstUpdateOn = lstUpdateOn;
	}

	public String getLstUpdateBy() {
		return lstUpdateBy;
	}

	public void setLstUpdateBy(String lstUpdateBy) {
		this.lstUpdateBy = lstUpdateBy;
	}

}
