package com.usst.dissertation.common.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.usst.dissertation.common.exception.BusinessException;
import com.usst.dissertation.common.service.imp.ICommonService;
import com.usst.dissertation.sql.user.entity.User;
import com.usst.dissertation.user.service.IUserService;


@Service("commonService")
public class CommonServiceImp implements ICommonService{

	@Autowired
	private IUserService userService;
	
	@Override
	public boolean checkUserName(String userName) {
		boolean flag = true;
		User user = new User();
		user.setUserName(userName);
		try {			
			List<User> users = userService.getUsers(user);
			if(users != null && users.size() > 0){
				flag = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw  new BusinessException("根据用户名查找失败！");
		}
		return flag;
	}

	@Override
	public boolean checkUserEmail(String email) {
		boolean flag = false;
		User user = new User();
		user.setEmail(email);
		try {			
			List<User> users = userService.getUsers(user);
			if(users != null && users.size() > 0){
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw  new BusinessException("根据用户名查找失败！");
		}
		return flag;
	}

}
