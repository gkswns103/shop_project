package controller;

import java.util.List;

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
	
	@RequestMapping("/detail")
	public String detailView(Model model,int product_idx) {
		ProductVO vo=product_dao.selectOne(product_idx);
		
		model.addAttribute("vo",vo);
		 
		return Common.Path.CUSTOMER_PATH+"product/productDetail.jsp";
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
			
			return Common.Path.CUSTOMER_PATH + "product/productView.jsp";
	}
	
    @RequestMapping("/registerForm")
    public String showRegisterForm(Model model) {
        // 메인 카테고리 목록 가져오기
        List<String> divisions = product_dao.getDistinctDivisions();
        model.addAttribute("divisions", divisions);

        // 서브 카테고리 목록 가져오기
        List<String> categories = product_dao.getAllDistinctCategories();
        model.addAttribute("categories", categories);

        return Common.Path.CUSTOMER_PATH + "product/productInsert.jsp";
    }

    @RequestMapping("/addproduct")
    public String addProduct(ProductVO vo) {
        int res = product_dao.insertProduct(vo);
        int product_idx = product_dao.selectAdd(vo);

        System.out.println("상품 insert 결과 :" + res);
        System.out.println(product_idx);

        return "redirect:detail?product_idx=" + product_idx;
    }
}
