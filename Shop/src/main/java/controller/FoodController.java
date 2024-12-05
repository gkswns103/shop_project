package controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.FoodDAO;
import vo.FoodVO;

@Controller
public class FoodController {

	FoodDAO food_dao;
	
	public void setFood_dao(FoodDAO food_dao) {
		this.food_dao = food_dao;
	}
	
	@RequestMapping(value={"/","food.do"})
	public String test(Model model) {
		List<FoodVO> list = food_dao.select();
		
		model.addAttribute("list", list);
		
		return "/WEB-INF/views/home.jsp";
	}
	
}
