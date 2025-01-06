package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import common.Common;
import dao.BannerDAO;
import vo.BannerVO;

@Controller
public class BannerController {
BannerDAO banner_dao;

@Autowired
HttpSession session;

SqlSession sqlSession;

public void setBanner_dao(BannerDAO banner_dao) {
	this.banner_dao = banner_dao;
}

@RequestMapping("/admin/banner")
public String banner(Model model) {
	List<BannerVO> list = banner_dao.select_banner();
	
	if(list == null) {
		System.out.println("값을 받아오지 못함");
	}
	
	model.addAttribute("list",list);
	return Common.Path.ADMIN_PATH + "banner.jsp";
}

}
