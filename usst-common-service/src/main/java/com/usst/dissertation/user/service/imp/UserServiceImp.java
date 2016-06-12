package com.usst.dissertation.user.service.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.usst.dissertation.sql.user.dao.UserDao;
import com.usst.dissertation.sql.user.entity.User;
import com.usst.dissertation.user.service.IUserService;

@Service("userService")
public class UserServiceImp implements IUserService{

	@Autowired
	private UserDao userDao;
	
	@Override
	public void insertUser(User user) {
		userDao.insertUser(user);
	}

	@Override
	public void updateUser(User user) {
		userDao.updateUser(user);
	}

	@Override
	public User getUserById(String id) {		
		return userDao.getUserById(id);
	}

	@Override
	public void deleteUserById(String id) {
		userDao.deleteUserById(id);		
	}

	@Override
	public List<User> getUsers(User user) {
		return userDao.getUsers(user);
	}

	@Override
	public List<User> getUsersByFuzzySearch(String str) {
		return userDao.getUsersByFuzzySearch(str);
	}

	@Override
	public List<User> getAllUsers(User user){
		return userDao.getAllUsers(user);
	}
}
