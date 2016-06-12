package com.usst.dissertation.menu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.usst.dissertation.menu.service.imp.IMenuService;
import com.usst.dissertation.sql.menu.dao.MenuDao;
import com.usst.dissertation.sql.menu.entity.Menu;

@Service("menuService")
public class MenuServiceImp implements IMenuService{
	
	@Autowired
	private MenuDao  menuDao;
	
	@Override
	public List<Menu> getMenus(Menu menu) {
		List<Menu> menuList = menuDao.getMenus(menu);
		return menuList;
	}

}
