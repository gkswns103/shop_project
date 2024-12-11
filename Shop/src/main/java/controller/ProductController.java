package controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
    public String detailView(Model model, int product_idx) {
        ProductVO vo = product_dao.selectOne(product_idx);
        model.addAttribute("vo", vo);
        return Common.Path.VIEW_PATH + "/productDetail.jsp";
    }

    @RequestMapping("/product")
    public String product_list(Model model, String division, String category) {
        List<ProductVO> list;
        if (category == "") {
            list = product_dao.selectDivision(division);
        } else {
            list = product_dao.selectCategory(category);
        }
        model.addAttribute("list", list);
        return Common.Path.VIEW_PATH + "productView.jsp";
    }

    // 상품 등록 페이지로 이동
    @RequestMapping("/product/registerForm")
    public String showRegisterForm() {
        return Common.Path.VIEW_PATH + "register.jsp";
    }

    @RequestMapping("/product/updateForm")
    public String showUpdateForm(Model model, @RequestParam(required = false) Integer product_idx) {

		/*
		 * ProductVO vo = product_dao.selectOne(product_idx); model.addAttribute("vo",
		 * vo);
		 * 
		 * List<String> categories = product_dao.getCategories(); List<String> divisions
		 * = product_dao.getDivisions(); model.addAttribute("categories", categories);
        model.addAttribute("divisions", divisions);
		 */

        return Common.Path.VIEW_PATH + "update.jsp"; // JSP 파일 경로 반환
    }


}
