package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import common.Common;
import dao.CartDAO;
import dao.ReviewDAO;
import vo.CartVO;

@Controller
public class ReviewController {

	ReviewDAO review_dao;
	CartDAO cart_dao;
	
	public void setReview_dao(ReviewDAO review_dao) {
		this.review_dao = review_dao;
	}
	public void setCart_dao(CartDAO cart_dao) {
		this.cart_dao = cart_dao;
	}
	
	
	@RequestMapping("/productReview")
	public String productReview(Model model,CartVO vo) {
		
		model.addAttribute("vo",vo);
		
		return Common.Path.CUSTOMER_PATH+"product/productReview.jsp";	
	}
}
