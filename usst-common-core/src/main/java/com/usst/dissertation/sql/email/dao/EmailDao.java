package com.usst.dissertation.sql.email.dao;

import java.util.HashMap;
import java.util.List;

import com.usst.dissertation.sql.email.entity.Email;

public interface EmailDao { 
	
	public List<HashMap<String,String>> getEmails(Email email);
	
	public void deleteEmail(String emailId);
	
	public void sendEmail(Email email);
	
	public List<HashMap<String,String>> getDeletedEmailsByUserId(String userId);
	
	public void clearAll(String userId);
	
}
