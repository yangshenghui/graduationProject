package com.usst.dissertation.email.service.imp;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.usst.dissertation.email.service.IEmailService;
import com.usst.dissertation.sql.email.dao.EmailDao;
import com.usst.dissertation.sql.email.entity.Email;

@Service("emailService")
public class EmailServiceImp implements IEmailService{

	@Autowired
	private EmailDao emailDao;
	
	@Override
	public List<HashMap<String, String>> getEmails(Email email) {		
		return emailDao.getEmails(email);
	}
	
	@Override
	public void deleteEmail(String emailId) {
		emailDao.deleteEmail(emailId);
	}

	@Override
	public void sendEmail(Email email) {
		emailDao.sendEmail(email);
	}

	@Override
	public List<HashMap<String, String>> getDeletedEmailsByUserId(String userId) {
		return emailDao.getDeletedEmailsByUserId(userId);
	}

	@Override
	public void clearAll(String userId) {
		emailDao.clearAll(userId);
	}
	
	
	
}
