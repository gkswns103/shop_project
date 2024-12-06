package controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import common.Common;
import dao.FoodDAO;
import vo.FoodVO;

@Controller
public class FoodController {
	
FoodDAO food_dao;


public void setFood_dao(FoodDAO food_dao) {
	this.food_dao = food_dao;
}
	
	@RequestMapping(value={"/","/food_list.do"})
	public String list (Model model) {
		List<FoodVO> list = food_dao.selectList(); 
		model.addAttribute("list",list);
		return Common.Path.VIEW_PATH + "food_list.jsp";
	}
}
