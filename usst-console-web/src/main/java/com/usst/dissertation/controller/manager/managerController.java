package com.usst.dissertation.controller.manager;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.usst.dissertation.common.constant.Constants;
import com.usst.dissertation.common.util.CommonUtil;
import com.usst.dissertation.common.util.MD5Util;
import com.usst.dissertation.document.service.IDocumentService;
import com.usst.dissertation.email.service.IEmailService;
import com.usst.dissertation.sql.document.entity.Document;
import com.usst.dissertation.sql.user.entity.User;
import com.usst.dissertation.user.service.IUserService;

@Controller
@RequestMapping("/manager")
public class managerController {

	@Autowired
	private IDocumentService documentService;

	@Autowired
	private IUserService userService;

	@Autowired
	private IEmailService emailService;

	@RequestMapping("publishArticle")
	public ModelAndView publishArticle(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("/publishedArticlesM");
		try {
			Document document = new Document();
			document.setArticleStatus(Constants.PUBLISH);
			List<HashMap<String, String>> documentsMap = documentService
			        .getDocuments(document);
			mav.addObject("articles", documentsMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping("auditingArticle")
	public ModelAndView auditingArticle(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("/auditingArticlesM");
		try {
			Document document = new Document();
			document.setArticleStatus(Constants.AUDITING);
			document.setIsAudit(Constants.DISENABLED);
			List<HashMap<String, String>> documentsMap = documentService
			        .getDocuments(document);
			mav.addObject("articles", documentsMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping("auditedArticle")
	public ModelAndView auditArticle(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("/auditedArticlesM");
		try {
			Document document = new Document();
			document.setIsAudit(Constants.ENABLED);
			document.setArticleStatus(Constants.AUDITING);
			List<HashMap<String, String>> documentsMap = documentService
			        .getDocuments(document);
			mav.addObject("articles", documentsMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping("detailArticle")
	public ModelAndView detailArticle(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("detailArticleM");
		String articleId = request.getParameter("articleId");
		String nextArticleId = request.getParameter("nextArticleId");
		String preArticleId = request.getParameter("preArticleId");
		String isAudit = request.getParameter("isAudit");
		String isAssign = request.getParameter("isAssign");
		HashMap<String, String> article = documentService
		        .getDocumentById(articleId);
		mav.addObject("article", article);
		if (StringUtils.isNotEmpty(nextArticleId)) {
			mav.addObject("nextArticleId", nextArticleId);
		}
		if (StringUtils.isNotEmpty(preArticleId)) {
			mav.addObject("preArticleId", preArticleId);
		}
		User user = userService.getUserById(article.get("auditorId"));
		mav.addObject("isAudit", isAudit);
		if (user != null) {
			mav.addObject("auditor", user.getRealName());
		}
		if (isAssign != null) {
			mav.addObject("isAssign", isAssign);
		}
		return mav;
	}

	@ResponseBody
	@RequestMapping("/assignArticle")
	public String assignArticle(HttpServletRequest request) {
		String result = "erro";
		try {
			HttpSession session = request.getSession();
			String userId = (String) session.getAttribute("userId");
			User user = userService.getUserById(userId);
			String auditorId = request.getParameter("auditorId");
			String articleId = request.getParameter("articleId");
			Document document = documentService.getDocument(articleId);
			document.setAuditorId(auditorId);
			CommonUtil.setSQLUpdateCommonField(document, user.getRealName());
			documentService.updateDocument(document);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@RequestMapping("isPublishArticle")
	public ModelAndView isPublishArticle(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("isPublishArticleM");
		String articleId = request.getParameter("articleId");
		HashMap<String, String> article = documentService
		        .getDocumentById(articleId);
		mav.addObject("article", article);
		return mav;
	}

	@ResponseBody
	@RequestMapping("publish")
	public String publish(HttpServletRequest request) {
		String result = "erro";
		try {
			HttpSession session = request.getSession();
			String userId = (String) session.getAttribute("userId");
			User user = userService.getUserById(userId);
			String articleId = request.getParameter("articleId");
			String isPublish = request.getParameter("isPublish");
			Document document = documentService.getDocument(articleId);
			if ("1".equals(isPublish)) {
				document.setArticleStatus(Constants.PUBLISH);
			} else {
				document.setArticleStatus(Constants.REJECTED);
			}
			CommonUtil.setSQLUpdateCommonField(document, user.getRealName());
			documentService.updateDocument(document);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@RequestMapping("/getUsers")
	public ModelAndView getUsers(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("users");
		String userType = request.getParameter("userType");
		List<User> users = new ArrayList<User>();
		if (StringUtils.isNotEmpty(userType)) {
			User user = new User();
			user.setRoleId(userType);
			users = userService.getAllUsers(user);
		}
		mav.addObject("users", users);
		mav.addObject("userType", userType);
		return mav;
	}

	@RequestMapping("/toAddUser")
	public ModelAndView addUser(HttpServletRequest request) {
		String userType = request.getParameter("userType");
		ModelAndView mav = new ModelAndView("addUser");
		mav.addObject("userType", userType);
		return mav;
	}

	@ResponseBody
	@RequestMapping("/addUser")
	public boolean addUser(User user, HttpServletResponse respone,
	        HttpServletRequest request) {
		boolean flag = false;
		String userType = request.getParameter("userType");
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("user");
		try {
			user.setUserPsw(MD5Util.string2MD5(user.getUserPsw()));
			user.setRoleId(userType);
			CommonUtil.setSQLCommonField(user, u.getUserName());
			userService.insertUser(user);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}

	@ResponseBody
	@RequestMapping("/getAuditors")
	public List<User> getAuditors() {
		List<User> users = new ArrayList<User>();
		User user = new User();
		user.setRoleId(Constants.AUDITOR);
		user.setEnabled(Constants.ENABLED);
		users = userService.getUsers(user);
		return users;
	}

	@RequestMapping("/deleteUser")
	public ModelAndView deleteUser(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("redirect:getUsers.htm");
		String userId = request.getParameter("id");
		try {
			User user = userService.getUserById(userId);
			user.setEnabled("2");
			userService.updateUser(user);
			mav.addObject("userType", user.getRoleId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@ResponseBody
	@RequestMapping("/changeUserStatus")
	public boolean changeUserStatus(HttpServletRequest request) {
		boolean flag = false;
		String userId = request.getParameter("id");
		String status = request.getParameter("status");
		try {
			User user = userService.getUserById(userId);
			if ("0".equals(status)) {
				user.setEnabled("0");
			} else {
				user.setEnabled("1");
			}
			userService.updateUser(user);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

}
