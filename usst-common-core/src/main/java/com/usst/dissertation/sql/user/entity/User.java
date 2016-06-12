package com.usst.dissertation.sql.user.entity;

import com.usst.dissertation.sql.base.BaseObject;

public class User extends BaseObject{

	private static final long serialVersionUID = 1L;
	
	private String userName;
	
	private String userPsw;
		
	private String sex;
	
	private String roleId;
	
	private String realName;
	
	private String email;
	
	private String mobile;
	
	private String address;
	
	private String resDirection;
	
	private String company;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPsw() {
		return userPsw;
	}

	public void setUserPsw(String userPsw) {
		this.userPsw = userPsw;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getResDirection() {
		return resDirection;
	}

	public void setResDirection(String resDirection) {
		this.resDirection = resDirection;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	

}
