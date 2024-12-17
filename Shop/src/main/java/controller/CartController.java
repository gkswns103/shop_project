package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import common.Common;
import dao.CartDAO;
import dao.ProductDAO;
import dao.UsersDAO;
import vo.CartVO;
import vo.UsersVO;

@Controller
public class CartController {
	CartDAO cart_dao;
	ProductDAO product_dao;
	UsersDAO users_dao;
	
	@Autowired
	HttpSession session;
	public void setProduct_dao(ProductDAO product_dao) {
		this.product_dao = product_dao;
	}
	public void setUsers_dao(UsersDAO users_dao) {
		this.users_dao = users_dao;
	}
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
		boolean isActive = cart_dao.check_Active(vo);
		System.out.println(isActive);
		String result="";
		
		//카트에 이미 똑같은 물건이 담겨있을 때
		//중복+Active이면 못넣음
		if(isDuplicate && isActive) {
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
	
	@RequestMapping("/updateChecked")
	@ResponseBody
	public String updateChecked(CartVO vo) {
		int res=cart_dao.updateCheck(vo);
		String result="";
		if(res>=1) {
			result="success";
		}else{
			result="fail";
		}
		
		return result;
	}
	
	@RequestMapping("/cart_purchaseForm")
	public String purchaseForm(int user_idx,int finalAmount,int totalprice,int totaldiscount,Model model) {
		List<CartVO> list=cart_dao.select_cart_list(user_idx);
		UsersVO user=users_dao.selectOne(user_idx);
		 
		model.addAttribute("totaldiscount",totaldiscount);
		model.addAttribute("totalprice",totalprice);
		model.addAttribute("finalAmount",finalAmount);
		model.addAttribute("list",list);
		model.addAttribute("user",user);
		
		return Common.Path.VIEW_PATH + "purchaseForm.jsp";
		
	}
	
	@RequestMapping("/purchase")
	public String purchase(Model model,UsersVO vo,int totalprice,int totaldiscount,int finalAmount) {
		int user_idx=vo.getUser_idx();
		List<CartVO> list=cart_dao.select_cart_list(user_idx);
		model.addAttribute("list",list);
		model.addAttribute("user", vo);
		model.addAttribute("totaldiscount",totaldiscount);
		model.addAttribute("totalprice",totalprice);
		model.addAttribute("finalAmount",finalAmount);
		
		int updateResult=cart_dao.updateState(user_idx);
		
		System.out.println("업데이트 결과:"+updateResult); 
		return Common.Path.VIEW_PATH + "myPurchaseDetail.jsp";
	}
	
	
	@RequestMapping("/myPurchaseList")
	public String myPurchaseList(int user_idx) {
		
		return "";
	}
}









