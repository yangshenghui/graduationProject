package com.usst.dissertation.sql.user.dao;

import java.util.List;

import com.usst.dissertation.sql.user.entity.User;

public interface UserDao {

	//插入用户
	public void insertUser(User user);
	
	//更新用户
	public void updateUser(User user);
	
	//根据Id查询用户
	public User getUserById(String id);
	
	//查询用户
	public List<User> getUsers(User user);
	
	//删除用户
	public void deleteUserById(String id);
	
	public List<User> getUsersByFuzzySearch(String str);
	
	//查询用户
	public List<User> getAllUsers(User user);
}
