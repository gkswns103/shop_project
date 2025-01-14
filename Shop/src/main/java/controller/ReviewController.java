package controller;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import common.Common;
import dao.CartDAO;
import dao.ReviewDAO;
import dao.ReviewLikeDAO;
import dao.UsersDAO;
import vo.CartVO;
import vo.ReviewVO;

@Controller
public class ReviewController {

	ReviewDAO review_dao;
	CartDAO cart_dao;
	UsersDAO users_dao;

	@Autowired
	HttpSession session;
	
	@Autowired
	ServletContext application;
	
	
	public void setReview_dao(ReviewDAO review_dao) {
		this.review_dao = review_dao;
	}
	public void setCart_dao(CartDAO cart_dao) {
		this.cart_dao = cart_dao;
	}
	public void setUsers_dao(UsersDAO users_dao) {
		this.users_dao = users_dao; 
	}
	
	
	@RequestMapping("/productReview")
	public String productReview(Model model,CartVO vo) {
		
		model.addAttribute("vo",vo);
		return Common.Path.CUSTOMER_PATH+"product/productReview.jsp";	
	}
	
	@RequestMapping("/reviewInsert")
	public String reviewInsert(ReviewVO vo ,MultipartFile photo) {
		String webPath = "/resources/reviewImg/"; //상대경로
		String savePath = application.getRealPath(webPath); //절대경로
		System.out.println("절대경로 : "+savePath);
		//업로드를 위한 파일정보
		String filename = "no_file";
		
		if( !photo.isEmpty() ) {
			filename = photo.getOriginalFilename();
			
			//저장할 파일의 경로
			File saveFile = new File(savePath,filename);
			
			if(!saveFile.exists()) {
				saveFile.mkdirs();
			}
			else {
				//동일한 이름의 파일이 존재한다면 현재 업로드 시간을 붙여서 중복을 방지
				long time = System.currentTimeMillis();
				filename = String.format("%d_%s",time,filename);
				saveFile = new File(savePath,filename);
			}
			//파일을 절대 경로에 생성
			try {
				photo.transferTo(saveFile);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		vo.setFilepath(filename);
		String name=users_dao.selectname(vo.getUser_idx());
		vo.setName(name);
		
		int res=review_dao.reviewinsert(vo);
		
		return "redirect:/detail?product_idx="+vo.getProduct_idx();
	}
	
	
}
