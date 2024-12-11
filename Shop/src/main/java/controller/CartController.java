package controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import common.Common;
import dao.CartDAO;
import dao.ProductDAO;
import vo.CartVO;

@Controller
public class CartController {
	CartDAO cart_dao;
	ProductDAO product_dao;
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


	@RequestMapping("/cart_insert")
	@ResponseBody
	public String cartInsert(CartVO vo) {
		
		boolean isDuplicate = cart_dao.check_duplicate(vo);
		  
		String result="";
		
		//카트에 이미 똑같은 물건이 담겨있을 때
		//중복이면
		if(isDuplicate) {
			result="duplicate";
			return result;
		}
		
		int res=cart_dao.insert_cart(vo);
		
		System.out.println("카트 insert 결과 : "+res);
		if(res==0) {
			result="fail";
		}else {
			result="success";
		}
		return result;
	}
}
