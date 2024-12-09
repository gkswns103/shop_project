package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import common.Common;
import dao.ProductDAO;
import vo.ProductVO;

@Controller
public class ProductController {
	
	ProductDAO product_dao;
	 
	public void setProduct_dao(ProductDAO product_dao) {
		this.product_dao = product_dao;
	}
	
	@RequestMapping("/product")
	public String product_list(Model model, String division, String category) {
			List<ProductVO> list;
			
			if(category == "") {
				list = product_dao.selectDivision(division);
			}
			else {
				list = product_dao.selectCategory(category);
			}
			
			model.addAttribute("list", list);
			
			return Common.Path.VIEW_PATH + "productView.jsp";
	}
	
}
