package controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import common.Common;
import dao.BabyDAO;
import dao.BeautyDAO;
import dao.ElectronicDAO;
import dao.FashionDAO;
import dao.FoodDAO;
import dao.HobbyDAO;
import dao.InteriorDAO;
import dao.Life_kitchenDAO;
import dao.PetDAO;
import vo.BabyVO;
import vo.BeautyVO;
import vo.ElectronicVO;
import vo.FashionVO;
import vo.FoodVO;
import vo.HobbyVO;
import vo.InteriorVO;
import vo.Life_kitchenVO;
import vo.PetVO;

@Controller
public class ProductController {
	FoodDAO food_dao;
	BabyDAO baby_dao;
	BeautyDAO beauty_dao;
	ElectronicDAO electronic_dao;
	FashionDAO fashion_dao;
	HobbyDAO hobby_dao;
	InteriorDAO interior_dao;
	Life_kitchenDAO lifeKitchen_dao;
	PetDAO pet_dao;
	
	public void setBaby_dao(BabyDAO baby_dao) {
		this.baby_dao = baby_dao;
	}

	public void setBeauty_dao(BeautyDAO beauty_dao) {
		this.beauty_dao = beauty_dao;
	}

	public void setElectronic_dao(ElectronicDAO electronic_dao) {
		this.electronic_dao = electronic_dao;
	}

	public void setFashion_dao(FashionDAO fashion_dao) {
		this.fashion_dao = fashion_dao;
	}

	public void setHobby_dao(HobbyDAO hobby_dao) {
		this.hobby_dao = hobby_dao;
	}

	public void setInterior_dao(InteriorDAO interior_dao) {
		this.interior_dao = interior_dao;
	}

	public void setLifeKitchen_dao(Life_kitchenDAO lifeKitchen_dao) {
		this.lifeKitchen_dao = lifeKitchen_dao;
	}
	
	public void setPet_dao(PetDAO pet_dao) {
		this.pet_dao = pet_dao;
	}

	public void setFood_dao(FoodDAO food_dao) {
		this.food_dao = food_dao;
	}
	
	@RequestMapping("/fashion.do")
	public String fashionView(String category,String product,Model model) {
		List<FashionVO> list=fashion_dao.selectList();
		
		model.addAttribute("list",list);
		
		return Common.Path.VIEW_PATH+"/productView.jsp?product="+product+"&category="+category;
	}
	
	@RequestMapping("/food.do")
	public String foodView(String category,String product,Model model) {
		List<FoodVO> list=food_dao.selectList();
		
		model.addAttribute("list",list);
		
		return Common.Path.VIEW_PATH+"/productView.jsp?product="+product+"&category="+category;
	}
	
	@RequestMapping("/electronic.do")
	public String electronicView(String category,String product,Model model) {
		List<ElectronicVO> list=electronic_dao.selectList();
		
		model.addAttribute("list",list);
		
		return Common.Path.VIEW_PATH+"/productView.jsp?product="+product+"&category="+category;
	}
	@RequestMapping("/interior.do")
	public String interiorView(String category,String product,Model model) {
		List<InteriorVO> list=interior_dao.selectList();
		
		model.addAttribute("list",list);
		
		return Common.Path.VIEW_PATH+"/productView.jsp?product="+product+"&category="+category;
	}
	@RequestMapping("/baby.do")
	public String babyView(String category,String product,Model model) {
		List<BabyVO> list=baby_dao.selectList();
		
		model.addAttribute("list",list);
		
		return Common.Path.VIEW_PATH+"/productView.jsp?product="+product+"&category="+category;
	}
	@RequestMapping("/hobby.do")
	public String hobbyView(String category,String product,Model model) {
		List<HobbyVO> list=hobby_dao.selectList();
		
		model.addAttribute("list",list);
		
		return Common.Path.VIEW_PATH+"/productView.jsp?product="+product+"&category="+category;
	}
	@RequestMapping("/pet.do")
	public String petView(String category,String product,Model model) {
		List<PetVO> list=pet_dao.selectList();
		
		model.addAttribute("list",list);
		
		return Common.Path.VIEW_PATH+"/productView.jsp?product="+product+"&category="+category;
	}
	@RequestMapping("/beauty.do")
	public String beautyView(String category,String product,Model model) {
		List<BeautyVO> list=beauty_dao.selectList();
		
		model.addAttribute("list",list);
		
		return Common.Path.VIEW_PATH+"/productView.jsp?product="+product+"&category="+category;
	}
	@RequestMapping("/life.do")
	public String lifeView(String category,String product,Model model) {
		List<Life_kitchenVO> list=lifeKitchen_dao.selectList();
		
		model.addAttribute("list",list);
		
		return Common.Path.VIEW_PATH+"/productView.jsp?product="+product+"&category="+category;
	}
	
	
	 
	
	
}
