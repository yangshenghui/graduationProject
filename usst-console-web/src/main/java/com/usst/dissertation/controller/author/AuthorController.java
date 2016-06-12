package com.usst.dissertation.controller.author;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
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
import com.usst.dissertation.sql.document.entity.DocumentType;
import com.usst.dissertation.sql.email.entity.Email;
import com.usst.dissertation.sql.user.entity.User;
import com.usst.dissertation.user.service.IUserService;

@Controller
@RequestMapping("/author")
public class AuthorController {

	@Autowired
	private IDocumentService documentService;

	@Autowired
	private IUserService userService;

	@Autowired
	private IEmailService emailService;

	/**
	 * 已发表的文章
	 * @param request
	 * @return
	 */
	@RequestMapping("/publishedArticles")
	public ModelAndView publishedArticles(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("publishedArticles");
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		try {
			Document document = new Document();
			document.setUserId(userId);
			document.setIsDrafts(Constants.DISENABLED);
			document.setArticleStatus(Constants.PUBLISH);
			List<HashMap<String, String>> documentsMap = documentService
			        .getDocuments(document);
			mav.addObject("articles", documentsMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	/**
	 * 提交的文章（审核中，已拒绝）
	 * @param request
	 * @return
	 */
	@RequestMapping("/auditingArticles")
	public ModelAndView auditingArticles(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("auditingArticles");
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		try {
			Document document = new Document();
			document.setUserId(userId);
			document.setIsDrafts(Constants.DISENABLED);
			List<HashMap<String, String>> documentsMap = new ArrayList<HashMap<String, String>>();
			document.setArticleStatus(Constants.AUDITING);
			List<HashMap<String, String>> auditingMap = documentService
			        .getDocuments(document);
			document.setArticleStatus(Constants.REJECTED);
			List<HashMap<String, String>> rejectedMap = documentService
			        .getDocuments(document);
			documentsMap.addAll(auditingMap);
			documentsMap.addAll(rejectedMap);
			mav.addObject("articles", documentsMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	/**
	 * 草稿箱
	 * @return
	 */
	@RequestMapping("/drafts")
	public ModelAndView drafts(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("drafts");
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		try {
			Document document = new Document();
			document.setUserId(userId);
			document.setIsDrafts(Constants.ENABLED);
			List<HashMap<String, String>> documentsMap = documentService
			        .getDocuments(document);
			mav.addObject("articles", documentsMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	/**
	 * 新增新文章
	 * @return
	 */
	@RequestMapping("/addArticle")
	public ModelAndView addActical() {
		ModelAndView mav = new ModelAndView("addArticle");
		return mav;
	}

	/**
	 * 文章类型
	 * @return
	 */
	@ResponseBody
	@RequestMapping("getDocumentTypes")
	public Map<String, Object> getDocumentTypes() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<DocumentType> documentTypes = documentService.getDodumentTypes();
		map.put("data", documentTypes);
		return map;
	}

	/**
	 * 保存文章
	 * @param document
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("saveArticle")
	public String saveArticle(Document document, HttpServletRequest request) {
		String result = "erro";
		try {
			HttpSession session = request.getSession();
			String userId = (String) session.getAttribute("userId");
			User user = userService.getUserById(userId);
			if (StringUtils.isEmpty(document.getId())) {
				document.setUserId(user.getId());
				document.setArticleAuthor(user.getRealName());
				//文章状态
				document.setArticleStatus(Constants.AUDITING);
				//文章是否经过审核
				document.setIsAudit(Constants.DISENABLED);
				//文章提交
				document.setIsDrafts(Constants.DISENABLED);
				CommonUtil.setSQLCommonField(document, user.getRealName());
				documentService.saveArticle(document);
			} else {
				Document newDocument = documentService.getDocument(document
				        .getId());
				newDocument.setArticleTitle(document.getArticleTitle());
				newDocument.setArticleType(document.getArticleType());
				newDocument.setArticleKey(document.getArticleKey());
				newDocument.setArticleDigest(document.getArticleDigest());
				newDocument.setArticleAuthor(user.getRealName());
				newDocument.setArticleContent(document.getArticleContent());
				newDocument.setArticleStatus(Constants.AUDITING);
				newDocument.setIsDrafts(Constants.DISENABLED);
				CommonUtil.setSQLUpdateCommonField(newDocument,
				        user.getRealName());
				documentService.updateDocument(newDocument);
			}
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 保存为草稿
	 * @param document
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("saveDrafts")
	public String saveDrafts(Document document, HttpServletRequest request) {
		String result = "erro";
		try {
			HttpSession session = request.getSession();
			String userId = (String) session.getAttribute("userId");
			User user = userService.getUserById(userId);
			if (StringUtils.isEmpty(document.getId())) {
				document.setUserId(user.getId());
				document.setIsAudit(Constants.DISENABLED);//未审核
				document.setIsDrafts(Constants.ENABLED);//草稿
				CommonUtil.setSQLCommonField(document, user.getRealName());
				documentService.saveArticle(document);
			} else {
				Document newDocument = documentService.getDocument(document
				        .getId());
				newDocument.setArticleTitle(document.getArticleTitle());
				newDocument.setArticleType(document.getArticleType());
				newDocument.setArticleKey(document.getArticleKey());
				newDocument.setArticleDigest(document.getArticleDigest());
				newDocument.setArticleAuthor(user.getRealName());
				newDocument.setArticleContent(document.getArticleContent());
				CommonUtil.setSQLUpdateCommonField(newDocument,
				        user.getRealName());
				documentService.updateDocument(newDocument);
			}
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 文章详情
	 * @param request
	 * @return
	 */
	@RequestMapping("detailArticle")
	public ModelAndView detailArticle(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("detailArticle");
		String articleId = request.getParameter("articleId");
		HashMap<String, String> article = documentService
		        .getDocumentById(articleId);
		mav.addObject("article", article);
		return mav;
	}

	/**
	 * 编辑文章
	 * @param request
	 * @return
	 */
	@RequestMapping("editArticle")
	public ModelAndView editArticle(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("editArticle");
		String articleId = request.getParameter("articleId");
		HashMap<String, String> article = documentService
		        .getDocumentById(articleId);
		mav.addObject("article", article);
		return mav;
	}

	/**
	 * 删除草稿
	 * @param request
	 * @return
	 */
	@RequestMapping("delete")
	public ModelAndView delete(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("drafts");
		String articleId = request.getParameter("articleId");
		documentService.delete(articleId);
		return mav;
	}

}
