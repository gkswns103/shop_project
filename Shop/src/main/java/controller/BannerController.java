package controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import common.Common;
import dao.BannerDAO;
import dao.ProductDAO;
import vo.BannerVO;
import vo.ProductVO;

@Controller
public class BannerController {
BannerDAO banner_dao;
ProductDAO product_dao;

@Autowired
ServletContext application;

@Autowired
HttpSession session;

SqlSession sqlSession;

public void setBanner_dao(BannerDAO banner_dao) {
	this.banner_dao = banner_dao;
}
public void setProduct_dao(ProductDAO product_dao) {
	this.product_dao = product_dao;
}

//----------------------------------------------------------------------------
//메인페이지 배너 불러오기
@RequestMapping("/headerimg")
public String getHeaderImages(Model model) {
    // DB에서 활성화된 배너만 가져옴
    List<BannerVO> list = banner_dao.select_active_banners();
    model.addAttribute("list", list);
    return Common.Path.CUSTOMER_PATH + "home.jsp";
}

//----------------------------------------------------------------------------
//어드민 페이지(배너)
@RequestMapping("/admin/banner")
public String banner(Model model) {
	List<BannerVO> list = banner_dao.select_banner();
	model.addAttribute("list",list);
	return Common.Path.ADMIN_PATH + "banner.jsp";
}

@RequestMapping("/admin/banner_update")
public String banner_update(Model model) {
	List<BannerVO> list = banner_dao.select_banner();
	model.addAttribute("list",list);
	return Common.Path.ADMIN_PATH + "bannerUpdate.jsp";
}

@RequestMapping("/admin/banner_insert")
public String banner_insert() {
	return Common.Path.ADMIN_PATH + "bannerInsert.jsp";
}

//----------------------------------------------------------------------------
//배너 온오프
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

//----------------------------------------------------------------------------
//배너
@RequestMapping("/banner")
public String sale_banner(Model model, String filepath) {
	List<ProductVO> list = null;
	System.out.println(filepath);
	if(filepath.equals("sale_product")) {
		list = product_dao.sale_product();
		
	}else if(filepath.equals("sale_pet")) {
		list = product_dao.sale_pet();
	}else if(filepath.equals("sale_christmas")) {
		list = product_dao.sale_christmas();
	}else if(filepath.equals("sale_it")) {
		list = product_dao.sale_it();
	}else if(filepath.equals("sale_newyear")) {
		list = product_dao.sale_newyear();
	}
	model.addAttribute("list",list);
	return Common.Path.CUSTOMER_PATH + "product/bannerSale.jsp";
}
//----------------------------------------------------------------------------
//배너 이미지



//----------------------------------------------------------------------------
//배너 수정

@RequestMapping(value="/admin/update_banner")
public String update_banner(BannerVO vo, MultipartFile newImage) {
	
	 
	        // 이미지 업로드 경로 설정
	        String uploadDir = "src/main/webapp/resources/img/";
	        String savePath = application.getRealPath(uploadDir); //절대경로
	        String imagename = "nofile";
	        // 새 이미지 파일 처리
	        if (!newImage.isEmpty()) {
	            // 확장자 추출
	        	imagename = newImage.getOriginalFilename();
	           
	        	//저장파일 경로
	        	File saveImage = new File(savePath,imagename);
	        	
	        	if(!saveImage.exists()) {
	        		saveImage.mkdirs();
	        	}else {
					//동일한 이름의 파일이 존재한다면 현재 업로드 시간을 붙여서 중복을 방지
					long time = System.currentTimeMillis();
				 imagename = String.format("%d_%s",time,imagename);
					saveImage = new File(savePath,imagename);
				}
	        	try {
					newImage.transferTo(saveImage);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	        	
	        	vo.setFilepath(imagename);

	        // DAO를 통해 배너 업데이트
	        int res = banner_dao.update_banner(vo);
	        if (res > 0) {
	            System.out.println("배너 수정 성공");
	        } else {
	            System.out.println("배너 수정 실패");
	        }
	       
	        }
	        return "redirect:/admin/banner_update";
	        }

}
    
    

