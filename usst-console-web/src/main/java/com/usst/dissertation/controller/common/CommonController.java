package com.usst.dissertation.controller.common;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.usst.dissertation.common.constant.Constants;
import com.usst.dissertation.common.exception.BusinessException;
import com.usst.dissertation.common.service.imp.ICommonService;
import com.usst.dissertation.common.util.CommonUtil;
import com.usst.dissertation.common.util.MD5Util;
import com.usst.dissertation.common.util.MailUtil;
import com.usst.dissertation.email.service.IEmailService;
import com.usst.dissertation.menu.service.imp.IMenuService;
import com.usst.dissertation.sql.email.entity.Email;
import com.usst.dissertation.sql.menu.entity.Menu;
import com.usst.dissertation.sql.user.entity.User;
import com.usst.dissertation.user.service.IUserService;

@Controller
public class CommonController {

	private final Logger log = LoggerFactory.getLogger(CommonController.class);

	@Autowired
	private IMenuService menuService;

	@Autowired
	private IUserService userService;

	@Autowired
	private ICommonService commonService;

	@Autowired
	private IEmailService emailService;

	@RequestMapping("register")
	public ModelAndView register(User user) {
		ModelAndView mav = new ModelAndView("register");
		return mav;
	}

	@RequestMapping("login")
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView("login");
		return mav;
	}

	@RequestMapping("/")
	public ModelAndView index1() {
		ModelAndView mav = new ModelAndView("index");
		return mav;
	}

	@RequestMapping("/index")
	public ModelAndView index2(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("index");
		String userId = request.getParameter("userId");
		try {
			User user = userService.getUserById(userId);
			mav.addObject("user", user);
		} catch (Exception e) {
			e.printStackTrace();
			throw new BusinessException("查找用户失败!");
		}
		return mav;
	}

	@RequestMapping("/header")
	public ModelAndView header(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("header");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		mav.addObject("user", user);
		return mav;
	}

	@RequestMapping("/menu")
	public ModelAndView menu(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("menu");
		List<Menu> menus = new ArrayList<Menu>();
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String roleId = user.getRoleId();
		Menu menu = new Menu();
		menu.setRoleId(roleId);
		menu.setLevel("1");
		//一级菜单
		List<Menu> firstMenus = menuService.getMenus(menu);
		for (Menu firstMenu : firstMenus) {
			Menu m = new Menu();
			m.setRoleId(roleId);
			m.setParentId(firstMenu.getId());
			m.setLevel("2");
			//二级菜单
			List<Menu> secondMenus = menuService.getMenus(m);
			firstMenu.setChildren(secondMenus);
			menus.add(firstMenu);
		}
		mav.addObject("menus", menus);
		return mav;
	}

	@RequestMapping("/content")
	public ModelAndView content() {
		ModelAndView mav = new ModelAndView("content");
		return mav;
	}

	@RequestMapping("/baseCss")
	public ModelAndView baseCss() {
		ModelAndView mav = new ModelAndView("baseCss");
		return mav;
	}

	@RequestMapping("/baseScript")
	public ModelAndView baseScript() {
		ModelAndView mav = new ModelAndView("baseScript");
		return mav;
	}

	/**
	 * 用户注册
	 * @param user
	 * @return
	 */
	@RequestMapping("/userRegister")
	public ModelAndView userRegister(User user, HttpServletResponse respone) {
		ModelAndView mav = new ModelAndView("redirect:login.htm");
		/*try {
			user.setUserPsw(MD5Util.string2MD5(user.getUserPsw()));
			user.setRoleId(Constants.author);
			CommonUtil.setSQLCommonField(user, "system");
			userService.insertUser(user);			
		} catch (Exception e) {
			log.info("注册失败：" + user.getId());
			new BusinessException("insertUser fail : " + user.getId());
		}*/
		user.setUserPsw(MD5Util.string2MD5(user.getUserPsw()));
		user.setRoleId(Constants.AUTHOR);
		CommonUtil.setSQLCommonField(user, "system");
		userService.insertUser(user);
		return mav;
	}

	/**
	 * 用户登录
	 * @param user
	 * @return
	 */
	@ResponseBody
	@RequestMapping("userLogin")
	public boolean userLogin(User user, HttpServletRequest request,
	        HttpServletResponse response) {
		boolean flag = false;
		HttpSession session = request.getSession();
		if (StringUtils.isNotEmpty(user.getUserPsw())) {
			user.setUserPsw(MD5Util.string2MD5(user.getUserPsw()));
		}
		List<User> users = null;
		try {
			users = userService.getUsers(user);
			if (users.size() == 1) {
				session.setAttribute("userId", users.get(0).getId());
				session.setAttribute("user", users.get(0));
				flag = true;
			} else {
				log.info("账号查询失败：" + user.getUserName() + "&"
				        + user.getUserPsw());
			}
		} catch (Exception e) {
			log.info("登录失败：" + user.getUserName() + "&" + user.getUserPsw());
		}
		Cookie cookie = new Cookie("status", "1");
		response.addCookie(cookie);
		return flag;
	}

	@RequestMapping("checkUserName")
	@ResponseBody
	public String checkUserName(String userName, String userId) {
		boolean isExist = false;
		isExist = commonService.checkUserName(userName);
		if (StringUtils.isNotEmpty(userId)) {
			User user = userService.getUserById(userId);
			if (userName.equals(user.getUserName())) {
				isExist = true;
			}
		}

		return String.valueOf(isExist);
	}

	/**
	 * 查看个人信息
	 * @param request
	 * @return
	 */
	@RequestMapping("information")
	public ModelAndView getInformation(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("information");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("userId");
		User user = userService.getUserById(id);
		mav.addObject("user", user);
		return mav;
	}

	/**
	 * 编辑个人信息
	 * @param request
	 * @return
	 */
	@RequestMapping("editInformation")
	public ModelAndView editInformation(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("editInformation");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("userId");
		User user = userService.getUserById(id);
		mav.addObject("user", user);
		return mav;
	}

	/**
	 * 保存个人信息
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("saveInformation")
	public String saveInformation(User user, HttpServletRequest request) {
		String result = "erro";
		User newUser = userService.getUserById(user.getId());
		newUser.setUserName(user.getUserName());
		newUser.setSex(user.getSex());
		newUser.setRealName(user.getRealName());
		newUser.setMobile(user.getMobile());
		newUser.setEmail(user.getEmail());
		newUser.setAddress(user.getAddress());
		newUser.setResDirection(user.getResDirection());
		newUser.setCompany(user.getCompany());
		CommonUtil.setSQLUpdateCommonField(user, user.getUserName());
		try {
			userService.updateUser(newUser);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@RequestMapping("logOut")
	public ModelAndView logOut(HttpServletRequest request,
	        HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("login");
		HttpSession session = request.getSession();
		session.invalidate();
		Cookie cookie = new Cookie("status", null);
		cookie.setMaxAge(0);
		response.addCookie(cookie);
		return mav;
	}

	/**
	 * 跳到发送邮件页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/toSendEmail")
	public ModelAndView toSendEmail(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("sendEmail");
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		User user = userService.getUserById(userId);
		mav.addObject("user", user);
		return mav;
	}

	/**
	 * 跳到接收邮件列表页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/toReceiveEmail")
	public ModelAndView toReceiveEmail(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("receiveEmail");
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		User user = userService.getUserById(userId);
		Email email = new Email();
		email.setUserId(userId);
		email.setReceiver(user.getEmail());
		List<HashMap<String, String>> emails = emailService.getEmails(email);
		mav.addObject("emails", emails);
		return mav;
	}

	/**
	 * 跳到已发送邮件列表页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/toSentEmail")
	public ModelAndView toSentEmail(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("sentEmail");
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		User user = userService.getUserById(userId);
		Email email = new Email();
		email.setUserId(userId);
		email.setSender(user.getEmail());
		List<HashMap<String, String>> emails = emailService.getEmails(email);
		mav.addObject("emails", emails);
		return mav;
	}

	/**
	 * 跳到已发送邮件列表页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/toReplyEmail")
	public ModelAndView toReplyEmail(HttpServletRequest request) {
		String receiverEmail = request.getParameter("receiverEmail");
		ModelAndView mav = new ModelAndView("replyEmail");
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		User user = userService.getUserById(userId);
		User u = new User();
		u.setEmail(receiverEmail);
		User receiver = userService.getUsers(u).get(0);
		mav.addObject("sender", user);
		mav.addObject("receiver", receiver);
		return mav;
	}

	/**
	 * 跳到已删除邮件列表页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/toDeleteEmail")
	public ModelAndView toDeleteEmail(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("deleteEmail");
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		try {
			List<HashMap<String, String>> emails = emailService
			        .getDeletedEmailsByUserId(userId);
			mav.addObject("emails", emails);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mav;
	}

	/**
	 * 发送邮件
	 * @param email
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/sendEmail")
	public boolean sendEmail(Email email, HttpServletRequest request) {
		boolean isSend = false;
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		User user = userService.getUserById(userId);
		try {
			Pattern pattern = Pattern.compile("[< >]+");
			String[] strs = pattern.split(email.getSender());
			email.setSender(strs[1]);
			String[] strs1 = pattern.split(email.getReceiver());
			email.setReceiver(strs1[1]);
			email.setUserId(userId);
			CommonUtil.setSQLCommonField(email, user.getRealName());
			//发送人与邮件绑定			
			emailService.sendEmail(email);
			User u = new User();
			u.setEmail(strs1[1]);
			User receiver = userService.getUsers(u).get(0);
			email.setUserId(receiver.getId());
			CommonUtil.setSQLCommonField(email, receiver.getUserName());
			emailService.sendEmail(email);
			isSend = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isSend;
	}

	/**
	 * 删除邮件
	 * @param request
	 * @return
	 */
	@RequestMapping("/deleteEmail")
	public ModelAndView deleteEmail(HttpServletRequest request) {
		ModelAndView mav;
		//判断请求来自哪个页面
		String flag = request.getParameter("flag");
		if ("1".equals(flag)) {
			mav = new ModelAndView("redirect:toSentEmail.htm");
		} else {
			mav = new ModelAndView("redirect:toReceiveEmail.htm");
		}
		try {
			String emailId = request.getParameter("id");
			emailService.deleteEmail(emailId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	/**
	 * 清空邮件
	 * @param request
	 * @return
	 */
	@RequestMapping("/clearAll")
	public ModelAndView clearAll(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("redirect:toDeleteEmail.htm");
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		try {
			emailService.clearAll(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@ResponseBody
	@RequestMapping("/getUsersByFuzzySearch")
	public List<User> getUsersByFuzzySearch(HttpServletRequest request) {
		String str = request.getParameter("str");
		List<User> users = userService.getUsersByFuzzySearch(str);
		return users;
	}

	@RequestMapping("/checkUserEmail")
	@ResponseBody
	public String checkUserEmail(String email, HttpServletRequest request) {
		boolean isExist = false;
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		isExist = commonService.checkUserEmail(email);
		if (StringUtils.isNotEmpty(userId)) {
			User user = userService.getUserById(userId);
			if (email.equals(user.getEmail())) {
				isExist = false;
			}
		}

		return String.valueOf(isExist);
	}

	@RequestMapping("/toChangePsw")
	public ModelAndView toChangePsw() {
		ModelAndView mav = new ModelAndView("changPassword");
		return mav;
	}

	@RequestMapping("/isRightPsw")
	@ResponseBody
	public String isRightPsw(String oldUserPsw, HttpServletRequest request) {
		boolean isRight = false;
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		User user = userService.getUserById(userId);
		String oldPsw = MD5Util.string2MD5(oldUserPsw);
		if (oldPsw.equals(user.getUserPsw())) {
			isRight = true;
		}
		return String.valueOf(isRight);
	}

	@RequestMapping("/changePsw")
	@ResponseBody
	public boolean changePsw(String newPsw, HttpServletRequest request) {
		boolean flag = false;
		try {
			HttpSession session = request.getSession();
			String userId = (String) session.getAttribute("userId");
			User user = userService.getUserById(userId);
			user.setUserPsw(MD5Util.string2MD5(newPsw));
			userService.updateUser(user);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	@RequestMapping("/toFindPsw")
	public ModelAndView toFindPsw() {
		ModelAndView mav = new ModelAndView("/forgetPsw");
		return mav;
	}

	@RequestMapping("forgetPsw")
	@ResponseBody
	public Map<String, Object> forgetPsw(String userName) {
		Map<String, Object> map = new HashMap<String, Object>();
		boolean isExist = false;
		isExist = commonService.checkUserName(userName);
		User u = new User();
		u.setUserName(userName);
		if (userService.getUsers(u).size() > 0) {
			User user = userService.getUsers(u).get(0);
			String email = user.getEmail();
			String userEmail = email.substring(0, 4) + "***"
			        + email.substring(email.indexOf("@"), email.length());
			map.put("userEmail", userEmail);
		}
		map.put("isExist", isExist);
		return map;
	}

	@RequestMapping("forgetPswEmail")
	@ResponseBody
	public boolean forgetPswEmail(String userName) {
		boolean flag = false;
		User u = new User();
		u.setUserName(userName);
		if (userService.getUsers(u).size() > 0) {
			User user = userService.getUsers(u).get(0);
			int i = (int) (Math.random() * 1000000 + 100000);
			String newPsw = String.valueOf(i);
			user.setUserPsw(MD5Util.string2MD5(newPsw));
			userService.updateUser(user);
			/** 邮件正文 **/
			StringBuffer theMessage = new StringBuffer();

			String html = "";
			html += "<div style=\"background:#f9f8fc;\">";
			html += "<div style=\"text-align: center;\">";
			html += "<div style=\"max-width: 640px;width: auto;margin: auto;background-color: #fff;border:1px #e8e8ea solid; border-radius: 10px;padding:30px;color: #555864;\">";
			html += "<p></p>";
			html += "<table cellpadding=\"15\" cellspacing=\"0\" border=\"0\" width=\"100%\" collapse=\"collapse\" bgcolor=\"#f9f8fc\">";
			html += "<tbody>";
			html += "<tr>";
			html += " <td colspan=\"2\" style=\"font-size:20px;font-weight:bold;line-height: 25px\">";
			html += "您的新密码为：" + newPsw;
			html += "</td>";
			html += "</tr>";
			html += "</tbody>";
			html += "</table>";
			html += "<p></p>";
			html += "</div>";
			html += "</div>";

			theMessage.append(html);

			try {
				MailUtil.sendEmail(user.getEmail(), "找回密码",
				        theMessage.toString());
				flag = true;
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return flag;
	}

	@ResponseBody
	@RequestMapping("/getSession")
	public boolean getSession(HttpServletRequest request) {
		boolean flag = false;
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		if (userId != null) {
			flag = true;
		}
		return flag;
	}
}
