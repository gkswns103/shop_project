package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
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
	
	@Autowired
	HttpSession session;
	
	public void setCart_dao(CartDAO cart_dao) {
		this.cart_dao = cart_dao;
	}

	//장바구니 조회
	@RequestMapping("/cart")
	public String cart_view(int user_idx,Model model) {
		List<CartVO> list=cart_dao.select_list(user_idx);
		
		model.addAttribute("list",list);
		
		session.removeAttribute("cart_count");
		
		int cart_count=cart_dao.cart_count(user_idx);
		
		session.setAttribute("cart_count", cart_count);
		
		return Common.Path.VIEW_PATH + "cartView.jsp";
	}

	//장바구니에 담기
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
		
		session.removeAttribute("cart_count");
		int cart_count=cart_dao.cart_count(vo.getUser_idx());
		session.setAttribute("cart_count", cart_count);
		
		System.out.println("카트 insert 결과 : "+res);
		if(res==0) {
			result="fail"; 
		}else {
			result="success";
		}
		return result;
	}
	
	//장바구니 리스트 삭제
	@RequestMapping("/delete")
	public String cartDelete(CartVO vo) {
		
		int res=cart_dao.delete(vo);
		int user_idx=vo.getUser_idx();
		
		session.removeAttribute("cart_count");
		
		int cart_count=cart_dao.cart_count(user_idx);
		
		session.setAttribute("cart_count", cart_count);
		
		return "redirect:/cart?user_idx="+user_idx;
		
	}
	@RequestMapping("/amount_update")
	public String amountUpdate(CartVO vo) {
	    int user_idx=vo.getUser_idx();
		
	    int res=cart_dao.cart_update(vo);
		
	    
		return "redirect:/cart?user_idx="+user_idx;
	} 
	
}
