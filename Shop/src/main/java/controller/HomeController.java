package controller;

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
			return "가입 성공";
		}
		return "중복된 아이디 입니다.";
	}
}
