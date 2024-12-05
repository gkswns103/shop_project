package controller;

import java.lang.ProcessBuilder.Redirect;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import common.Common;
import dao.UsersDAO;
import vo.UsersVO;

@Controller
public class HomeController {
	
	UsersDAO users_dao;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	HttpServletRequest request;
	
	public void setUsers_dao(UsersDAO users_dao) {
		this.users_dao = users_dao;
	}
	
	@RequestMapping(value = "/", produces = "text/plain; charset=UTF-8")
	public String home() {
		return Common.Path.VIEW_PATH + "home.jsp";
	}
	
	@RequestMapping("/logout")
	public String logout() {
		session.removeAttribute("users");
		
		return "redirect:/";
	}
	
	@RequestMapping("/signin")
	public String signin(Model model) {

		return Common.Path.VIEW_PATH + "signin.jsp";
	}
	
	@RequestMapping(value = "/signup", produces = "text/plain; charset=UTF-8")
	public String signup() {
		return Common.Path.VIEW_PATH + "signup.jsp";
	}
	
	@RequestMapping(value = "/signup_form", produces = "text/plain; charset=UTF-8")
	@ResponseBody
	public String signup_form(UsersVO users) {
		if(users_dao.selectone(users.getId()) == null) { //회원이 없는경우
			int res = users_dao.insert(users);
			
			session.setAttribute("users", users);
			return "가입 성공";
		}
		return "중복된 아이디 입니다.";
	}
}
