package controller;

import java.io.File;
import java.lang.ProcessBuilder.Redirect;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
		model.addAttribute("list", list);
		return Common.Path.ADMIN_PATH + "banner.jsp";
	}

	@RequestMapping("/admin/move_bn_update")
	public String banner_update(Model model) {
		List<BannerVO> list = banner_dao.select_banner();
		model.addAttribute("list", list);
		return Common.Path.ADMIN_PATH + "bannerUpdate.jsp";
	}

//----------------------------------------------------------------------------
//배너 온오프
	@RequestMapping("/banner_off")
	public String banner_off(int banner_idx) {
		int res = banner_dao.banner_off(banner_idx);

		if (res > 0) {
			System.out.println("off성공");
		}
		return "redirect:/admin/banner";
	}

	@RequestMapping("/banner_on")
	public String banner_on(int banner_idx) {
		int res = banner_dao.banner_on(banner_idx);

		if (res > 0) {
			System.out.println("on성공");
		}
		return "redirect:/admin/banner";
	}

//----------------------------------------------------------------------------
//배너
	@RequestMapping("/banner_view_product")
	public String sale_banner(Model model, int banner_idx) {

		List<ProductVO> list = null;
		BannerVO banner = banner_dao.selectOne_banner(banner_idx);

		if(banner.getDiscount() == 0) {
			// 할인률 0%
			list = product_dao.view_banner_product2(banner);
		}
		else{
			list = product_dao.view_banner_product1(banner);
		}
		
		if(list.isEmpty() || list == null) {
			list = product_dao.view_banner_product3(banner);
		}

		model.addAttribute("list", list);

		return Common.Path.CUSTOMER_PATH + "product/bannerSale.jsp";

	}

//----------------------------------------------------------------------------
//배너 수정

	@RequestMapping("/admin/update_banner")
	public String update_banner(int banner_idx, int new_discount , MultipartFile new_image,
								String new_name, String new_division, String new_category1,
								String new_category2, String new_keyword1, String new_keyword2) {

		if (new_image == null) {
			System.out.println("사진을 못받고 있습니다.");
		}
		System.out.println(new_division);
		System.out.println(new_category1);
		System.out.println(new_category2);
		System.out.println(new_keyword1);
		System.out.println(new_keyword2);
		System.out.println(new_discount);
		

		String webPath = "/resources/img/"; // 상대경로
		String savePath = application.getRealPath(webPath); // 절대경로
		System.out.println(savePath);
		// 업로드를 위한 파일정보
		String filename = "no_file";

		if (!new_image.isEmpty()) {
			filename = new_image.getOriginalFilename();

			// 저장할 파일의 경로
			File saveFile = new File(savePath, filename);

			if (!saveFile.exists()) {
				saveFile.mkdirs();
			} else {
				// 동일한 이름의 파일이 존재한다면 현재 업로드 시간을 붙여서 중복을 방지
				long time = System.currentTimeMillis();
				filename = String.format("%d_%s", time, filename);
				saveFile = new File(savePath, filename);
			}
			// 파일을 절대 경로에 생성
			try {
				new_image.transferTo(saveFile);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		BannerVO vo = new BannerVO();
		vo.setImage(filename);
		vo.setNew_name(new_name);
		vo.setDivision(new_division);
		vo.setCategory1(new_category1);
		vo.setCategory2(new_category2);
		vo.setKeyword1(new_keyword1);
		vo.setKeyword2(new_keyword2);
		vo.setDiscount(new_discount);
		vo.setBanner_idx(banner_idx);

		// DAO를 통해 배너 업데이트
		int res = banner_dao.update_banner(vo);
		
		if (res > 0) {
			System.out.println("배너 수정 성공");
		} else {
			System.out.println("배너 수정 실패");
		}
		
		return "redirect:/admin/move_bn_update/";
	}
//----------------------------------------------------------------------------
//배너 추가
	@RequestMapping("/admin/insert_banner")
	public String insert_banner(BannerVO vo, MultipartFile new_image) {

		if (new_image == null) {
			System.out.println("사진을 못받아왔습니다");
		}

		String webPath = "/resources/img/"; // 상대경로
		String savePath = application.getRealPath(webPath); // 절대경로

		// 업로드를 위한 파일정보
		String filename = "no_file";

		if (!new_image.isEmpty()) {
			filename = new_image.getOriginalFilename();

			// 저장할 파일의 경로
			File saveFile = new File(savePath, filename);

			if (!saveFile.exists()) {
				saveFile.mkdirs();
			} else {
				// 동일한 이름의 파일이 존재한다면 현재 업로드 시간을 붙여서 중복을 방지
				long time = System.currentTimeMillis();
				filename = String.format("%d_%s", time, filename);
				saveFile = new File(savePath, filename);
			}
			// 파일을 절대 경로에 생성
			try {
				new_image.transferTo(saveFile);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		vo.setImage(filename);

		int res = banner_dao.banner_insert(vo);
		if (res > 0) {
			System.out.println("배너 추가 성공");
		} else {
			System.out.println("배너 추가 실패");
		}

		return "redirect:/admin/move_bn_update";
	}
//----------------------------------------------------------------------------
//배너 삭제

	@RequestMapping("/admin/delete_banner")
	public String delete_banner(int banner_idx) {

		int res = banner_dao.banner_delete(banner_idx);

		return "redirect:/admin/move_bn_update";
	}

}