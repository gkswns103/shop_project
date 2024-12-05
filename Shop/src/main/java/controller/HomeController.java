package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import common.Common;
import dao.UsersDAO;

@Controller
public class HomeController {
	
	UsersDAO users_dao;
	
	public void setUsers_dao(UsersDAO users_dao) {
		this.users_dao = users_dao;
	}
	
	@RequestMapping(value={"/"})
	public String test(Model model) {

		return Common.Path.VIEW_PATH + "home.jsp";
	}
	
	@RequestMapping("/login")
	public String login() {
		return Common.Path.VIEW_PATH + "login.jsp";
	}
}
