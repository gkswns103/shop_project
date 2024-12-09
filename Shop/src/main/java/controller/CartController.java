package controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import common.Common;
import dao.CartDAO;
import vo.CartVO;

@Controller
public class CartController {
	CartDAO cart_dao;

	public void setCart_dao(CartDAO cart_dao) {
		this.cart_dao = cart_dao;
	}

	//장바구니 조회
	@RequestMapping("/cart")
	public String cart_view(int user_idx,Model model) {
		List<CartVO> list=cart_dao.select_list(user_idx);
		
		model.addAttribute("list",list);
		
		return Common.Path.VIEW_PATH + "cartView.jsp";
	}


	@RequestMapping("cart_insert")
	@ResponseBody
	public String cartInsert() {
		
		return "";
	}
}
