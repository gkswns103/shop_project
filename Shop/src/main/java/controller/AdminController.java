package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import common.Common;
import dao.BannerDAO;
import dao.CartDAO;
import dao.ProductDAO;
import dao.UsersDAO;
import vo.BannerVO;
import vo.CartVO;
import vo.ProductVO;
import vo.UsersVO;

@Controller
public class AdminController {
	
	@Autowired
	HttpSession session;
	
	UsersDAO users_dao;
	ProductDAO product_dao;
	CartDAO cart_dao;
	BannerDAO banner_dao;

	public void setUsers_dao(UsersDAO users_dao) {
		this.users_dao = users_dao;
	}

	public void setProduct_dao(ProductDAO product_dao) {
		this.product_dao = product_dao;
	}

	public void setCart_dao(CartDAO cart_dao) {
		this.cart_dao = cart_dao;
	}
	
	public void setBanner_dao(BannerDAO banner_dao) {
		this.banner_dao = banner_dao;
	}
	
	@RequestMapping("/admin/admin_login")
	public String admin_page(String id) {
		if(session.getAttribute("admin") == null) {
			session.setAttribute("admin",id);
		}
		
		return Common.Path.ADMIN_PATH + "admin.jsp";
	}
	
	@RequestMapping("/admin/admin_logout")
	public String admin_logout() {
		
		session.removeAttribute("admin");
		
		return "redirect:/";
	}
	
	@RequestMapping("/admin/userManagement")
	public String userManagement(Model model) {
		List<UsersVO> list = users_dao.list();
		
		model.addAttribute("list", list);
		
		return Common.Path.ADMIN_PATH + "userManagement.jsp";
	}
	
	@RequestMapping("/admin/productManagement")
	public String productManagement(Model model) {
		List<ProductVO> list = product_dao.select_list();
		
		model.addAttribute("list", list);

		return Common.Path.ADMIN_PATH + "productManagement.jsp";
	}
	
	@RequestMapping("/admin/delete_user")
	public String user_delete(int user_idx) {
		int res = users_dao.delete_user(user_idx);
		return "redirect:/admin/userManagement";
	}
	
	@RequestMapping("/admin/delete_product")
	public String product_delete(int product_idx) {
		int res = product_dao.delete_product(product_idx);	
		return "redirect:/admin/productManagement";
	}
	
	@RequestMapping("/admin/orderlist")
	public String orderlist(Model model) {
		
		List<CartVO> list = cart_dao.select_list();
		
		model.addAttribute("list", list);
		
		return Common.Path.ADMIN_PATH + "orderlist.jsp";
	}
	
	@RequestMapping("/admin/apply_product")
	public String apply_product(Model model) {
		List<ProductVO> list = product_dao.new_Product_select();
		
		model.addAttribute("list", list);
		
		return Common.Path.ADMIN_PATH + "applyProduct.jsp";
	}

	
	@RequestMapping("/admin/apply")
	public String apply(int product_idx) {
		ProductVO vo = product_dao.new_Product_select_one(product_idx);
		int del = product_dao.delete_apply_product(product_idx);
		int res = product_dao.insertProduct(vo);
		
		return "redirect:/admin/apply_product";
	}
	
	@RequestMapping("/admin/apply_del")
	public String apply_product_delete(int product_idx) {
		int res = product_dao.delete_apply_product(product_idx);
		
		return "redirect:/admin/apply_product";
	}
	
}
























