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
	model.addAttribute("list",list);
	return Common.Path.ADMIN_PATH + "banner.jsp";
}

@RequestMapping("/banner_off")
public String banner_off(int banner_idx) {
	int res = banner_dao.banner_off(banner_idx);
	
	if(res>0) {
	System.out.println("off성공");
	}
	 return "redirect:/admin/banner";
}
@RequestMapping("/banner_on")
public String banner_on(int banner_idx) {
	int res = banner_dao.banner_on(banner_idx);
	
	if(res>0) {
		System.out.println("on성공");
	}
	return "redirect:/admin/banner";
}

@RequestMapping("/headerimg")
public String getHeaderImages(Model model) {
    // DB에서 활성화된 배너만 가져옴
    List<BannerVO> list = banner_dao.select_active_banners();
    model.addAttribute("list", list);
    return Common.Path.CUSTOMER_PATH + "/home.jsp";
}

}
