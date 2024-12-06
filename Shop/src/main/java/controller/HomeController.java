package controller;

import java.lang.ProcessBuilder.Redirect;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import common.Common;
import dao.ProductDAO;
import dao.UsersDAO;
import vo.ProductVO;
import vo.UsersVO;

@Controller
public class HomeController {

	UsersDAO users_dao;
	ProductDAO product_dao;

	@Autowired
	HttpSession session;

	@Autowired
	HttpServletRequest request;

	public void setUsers_dao(UsersDAO users_dao) {
		this.users_dao = users_dao;
	}

	public void setProduct_dao(ProductDAO product_dao) {
		this.product_dao = product_dao;
	}

	@RequestMapping(value = "/", produces = "text/plain; charset=UTF-8")
	public String home(Model model) {
		List<ProductVO> list = product_dao.select_list();

		model.addAttribute("list", list);

		return Common.Path.VIEW_PATH + "home.jsp";
	}

	@RequestMapping("/logout")
	public String logout() {
		session.removeAttribute("users");

		return "redirect:/";
	}

	@RequestMapping("/signin")
	@ResponseBody
	public String signin(String id, String pwd) {
		UsersVO user = users_dao.selectone(id);
		// 복호화 할 자리

		if (user == null) {
			return "no_id";
		} else {
			if (user.getPwd().equals(pwd)) {
				session.setAttribute("users", user);
				return "ok";
			} else {
				return "no_pwd";
			}
		}

	}
	
	@RequestMapping("/signin_form")
	public String signin_form() {
		return Common.Path.VIEW_PATH + "signin.jsp";
	}

	@RequestMapping(value = "/signup", produces = "text/plain; charset=UTF-8")
	public String signup() {
		return Common.Path.VIEW_PATH + "signup.jsp";
	}

	@RequestMapping(value = "/signup_form", produces = "text/plain; charset=UTF-8")
	@ResponseBody
	public String signup_form(UsersVO users) {
		if (users_dao.selectone(users.getId()) == null) { // 회원이 없는경우
			
			//암호화 할 자리
			//암호화 하고 다시 set
			
			int res = users_dao.insert(users);

			session.setAttribute("users", users);
			return "가입 성공";
		}
		return "중복된 아이디 입니다.";
	}

}
