package com.usst.dissertation.controller.auditor;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.usst.dissertation.common.constant.Constants;
import com.usst.dissertation.common.util.CommonUtil;
import com.usst.dissertation.document.service.IDocumentService;
import com.usst.dissertation.email.service.IEmailService;
import com.usst.dissertation.sql.document.entity.Document;
import com.usst.dissertation.sql.user.entity.User;
import com.usst.dissertation.user.service.IUserService;

@Controller
@RequestMapping("/auditor")
public class AuditorController {

	@Autowired
	private IDocumentService documentService;

	@Autowired
	private IUserService userService;

	@Autowired
	private IEmailService emailService;

	@RequestMapping("/unAudited")
	public ModelAndView unAudited(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("/unAuditedArticle");
		try {
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			Document document = new Document();
			document.setIsAudit(Constants.DISENABLED);
			document.setArticleStatus(Constants.AUDITING);
			document.setAuditorId(user.getId());
			List<HashMap<String, String>> documentsMap = documentService
			        .getDocuments(document);
			mav.addObject("articles", documentsMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping("/audited")
	public ModelAndView audited(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("/auditedArticle");
		try {
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			Document document = new Document();
			document.setIsAudit(Constants.ENABLED);
			document.setAuditorId(user.getId());
			List<HashMap<String, String>> documentsMap = documentService
			        .getDocuments(document);
			mav.addObject("articles", documentsMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping("/toAudited")
	public ModelAndView toAudited(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("audited");
		String articleId = request.getParameter("articleId");
		HashMap<String, String> article = documentService
		        .getDocumentById(articleId);
		mav.addObject("article", article);
		return mav;
	}

	@ResponseBody
	@RequestMapping("/audie")
	public String audie(HttpServletRequest request) {
		String result = "erro";
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		User user = userService.getUserById(userId);
		try {
			String articleId = request.getParameter("articleId");
			String opinion = request.getParameter("opinion");
			Document document = documentService.getDocument(articleId);
			document.setIsAudit(Constants.ENABLED);
			document.setAuditorOpinion(opinion);
			CommonUtil.setSQLUpdateCommonField(document, user.getRealName());
			documentService.updateDocument(document);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@RequestMapping("detailArticle")
	public ModelAndView detailArticle(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("detailArticleM");
		String articleId = request.getParameter("articleId");
		HashMap<String, String> article = documentService
		        .getDocumentById(articleId);
		mav.addObject("article", article);
		User user = userService.getUserById(article.get("auditorId"));
		mav.addObject("isAudit", "2");
		if (user != null) {
			mav.addObject("auditor", user.getRealName());
		}
		mav.addObject("role", "auditor");
		return mav;
	}

}
