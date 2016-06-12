package com.usst.dissertation.sql.menu.dao;

import java.util.List;

import com.usst.dissertation.sql.menu.entity.Menu;

public interface MenuDao {
	public List<Menu> getMenus(Menu menu);
}
