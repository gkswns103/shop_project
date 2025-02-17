package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import common.Common;
import dao.CartDAO;
import dao.InterestDAO;
import dao.ProductDAO;
import dao.UsersDAO;
import vo.CartVO;
import vo.ProductVO;
import vo.UsersVO;

@Controller
public class CartController {
	CartDAO cart_dao;
	ProductDAO product_dao;
	UsersDAO users_dao;
	InterestDAO interest_dao;
	
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
    public void setInterest_dao(InterestDAO interest_dao) {
        this.interest_dao = interest_dao;
    }
	
	//장바구니 조회
	@RequestMapping("/cart")
	public String cart_view(int user_idx,Model model) {
		List<CartVO> list=cart_dao.select_list(user_idx);
		
		model.addAttribute("list",list);
		
		session.removeAttribute("cart_count");
		
		int cart_count=cart_dao.cart_count(user_idx);
		
		session.setAttribute("cart_count", cart_count);
		
		return Common.Path.CUSTOMER_PATH + "buy/cartView.jsp";
	}

	//장바구니에 담기
	@RequestMapping("/cart_insert")
	@ResponseBody
	public String cartInsert(CartVO vo) {
		
		boolean isDuplicate = cart_dao.check_duplicate(vo);
		boolean isActive = cart_dao.check_Active(vo);
	
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
		 Object users = session.getAttribute("users");
		    if (users == null) {
		        // 로그인하지 않은 경우 로그인 페이지로 리다이렉트
		         return "redirect:/signin_form";
		    }
		
		List<CartVO> list=cart_dao.select_cart_list(user_idx);
		UsersVO user=users_dao.selectIdx(user_idx);

		model.addAttribute("totaldiscount",totaldiscount);
		model.addAttribute("totalprice",totalprice);
		model.addAttribute("finalAmount",finalAmount);
		model.addAttribute("list",list);
		model.addAttribute("user",user);
		
		return Common.Path.CUSTOMER_PATH + "buy/purchaseForm.jsp";
		
	}
	
	@RequestMapping("/purchase")
	public String purchase(Model model,String deliveryrequest,UsersVO vo,int totalprice,int totaldiscount,int finalAmount,String deliverymessage) {
		Object users = session.getAttribute("users");
	    if (users == null) {
	        // 로그인하지 않은 경우 로그인 페이지로 리다이렉트
	         return "redirect:/signin_form";
	    }
	    
		int user_idx=vo.getUser_idx();
		String addr=vo.getAddr();
		List<CartVO> list=cart_dao.select_cart_list(user_idx);
		
		model.addAttribute("list",list);
		model.addAttribute("user", vo);
		model.addAttribute("totaldiscount",totaldiscount);
		model.addAttribute("totalprice",totalprice);
		model.addAttribute("finalAmount",finalAmount);
			
		CartVO vo1=new CartVO();
		vo1.setOrdernumber(System.currentTimeMillis());
		vo1.setDeliverymessage(deliverymessage);
		vo1.setDeliveryrequest(deliveryrequest);
		vo1.setAddr(addr);
		vo1.setUser_idx(user_idx);
		
		//수량 깎고
		int updateInventoryResult=cart_dao.updateInventory(user_idx);
		
		//state 변경
		int updateResult=cart_dao.updateState(vo1);
		return "redirect:/purchaseList?user_idx="+user_idx;
	}
	
	@RequestMapping("/purchaseList")
	public String purchaseList(Model model,int user_idx) {
		Object users = session.getAttribute("users");
	    if (users == null) {
	        // 로그인하지 않은 경우 로그인 페이지로 리다이렉트
	         return "redirect:/signin_form";
	    }
	    
		List<CartVO> list=cart_dao.purchaseList(user_idx);
		
		if (list == null || list.isEmpty()) {
			model.addAttribute("isempty",true);
		    return Common.Path.CUSTOMER_PATH + "buy/myPurchaseList.jsp";
		}
		
		String ordertime = list.get(0).getOrdertime();
		List<String> ordertimeList = new ArrayList<String>();
		ordertimeList.add(ordertime);
		for(int i = 0; i < list.size(); i++) {
			if(!ordertime.equals(list.get(i).getOrdertime())) {
				ordertimeList.add(list.get(i).getOrdertime());
			}
		}
		model.addAttribute("isempty",false);
		model.addAttribute("list",list);
		model.addAttribute("ordertimeList", ordertimeList);
		model.addAttribute("user_idx",user_idx);
		return Common.Path.CUSTOMER_PATH+"buy/myPurchaseList.jsp";
	}
	
	//상품1개 바로구매 버튼 클릭시
	@RequestMapping("/buyNow")
	public String buyNow(CartVO vo,Model model) {
		
		UsersVO user=users_dao.selectIdx(vo.getUser_idx());
		
		int price =vo.getPrice();
		int discount=vo.getDiscount();
		int discountprice=price-(price*(100-discount)/100);
		
		model.addAttribute("discountprice",discountprice);
		model.addAttribute("user",user);
		model.addAttribute("vo",vo);
		
		return Common.Path.CUSTOMER_PATH + "buy/buyNowForm.jsp";
	}
	
	@RequestMapping("/purchaseOne")
	public String buyNow(Model model,int user_idx,CartVO cart_vo, int totalprice,int totaldiscount,int finalAmount) {
		
		
		String addr=cart_vo.getAddr();
		cart_vo.setOrdernumber(System.currentTimeMillis());
		
		//수량,상태 입력
		int update_res=cart_dao.updateInventoryOne(cart_vo);
		
		cart_vo.setInventory(cart_vo.getInventory()-cart_vo.getQuantity());
		
		//수량 업데이트
		int upd_res=cart_dao.purchaseOne(cart_vo);
		 
		
		return "redirect:/purchaseList?user_idx="+user_idx;
	}
	
	@RequestMapping("/easyPayment")
	public String easyPayment(CartVO vo,Model model,int totalprice,String prodname) {
		//카트 1차 업데이트
		System.out.println(prodname);
		model.addAttribute("prodname",prodname);
		
		vo.setOrdernumber(System.currentTimeMillis());
		int res=cart_dao.updateFirst(vo);
		/* int ordertime=cart_dao.getOrdertime(vo); */
		 
		System.out.println("1차:"+res);
		
		model.addAttribute("totalprice",totalprice);
		model.addAttribute("ordernumber",vo.getOrdernumber());
		System.out.println(vo.getUser_idx());
		model.addAttribute("user_idx",vo.getUser_idx());
		
		/* model.addAttribute("ordertime",ordertime); */
		
		
		/*
		 * System.out.println(vo.getAddr()); System.out.println(vo.getCart_idx());
		 * System.out.println(vo.getChecked());
		 * System.out.println(vo.getDeliverymessage());
		 * System.out.println(vo.getDeliveryrequest());
		 */
		return common.Common.Path.CUSTOMER_PATH+"buy/easyPayment.jsp";
	}
	
	@RequestMapping("/purchaseSuccess")
	public String purchaseSuccess(CartVO vo) {
		
		int res=cart_dao.buyFinish(vo);
		System.out.println("수량변경:"+res);
		res=cart_dao.updateSaled(vo);
		System.out.println("상태변경:"+res);
		
		System.out.println("useridx="+vo.getUser_idx());
		return "redirect:/purchaseList?user_idx="+vo.getUser_idx();
	}
	
	
	
	@RequestMapping("/orderDetail")
	public String orderDetail(CartVO vo, Model model) {
		
		List<CartVO> list=cart_dao.select_orderList(vo);
		UsersVO user= users_dao.selectIdx(vo.getUser_idx());
		model.addAttribute("list",list);
		model.addAttribute("user",user);
		
		return common.Common.Path.CUSTOMER_PATH +"buy/orderDetail.jsp";
	}
	
}









