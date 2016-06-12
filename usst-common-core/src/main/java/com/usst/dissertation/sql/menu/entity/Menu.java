package com.usst.dissertation.sql.menu.entity;

import java.util.List;

import com.usst.dissertation.sql.base.BaseObject;

public class Menu extends BaseObject{
	
	private static final long serialVersionUID = 1L;

	//角色ID
	private String roleId;

	//名称
	private String menuName;
	
	//父菜单
	private String parentId;
		
	//菜单级别（1：一级菜单，2：二级菜单）
	private String level;
	
	//排序
	private String order;
	
	//菜单Url
	private String menuUrl;
	
	//菜单图标
	private String menuIco;
	
	//子菜单
	private List<Menu> children;

	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public String getMenuUrl() {
		return menuUrl;
	}

	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}

	public List<Menu> getChildren() {
		return children;
	}

	public void setChildren(List<Menu> children) {
		this.children = children;
	}

	public String getMenuIco() {
		return menuIco;
	}

	public void setMenuIco(String menuIco) {
		this.menuIco = menuIco;
	}	

	
}
