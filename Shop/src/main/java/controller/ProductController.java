package controller;

import java.io.File;
import java.lang.ProcessBuilder.Redirect;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import common.Common;
import dao.ProductDAO;
import vo.ProductVO;

@Controller
public class ProductController {
	
	@Autowired
	ServletContext application;
	
	@Autowired
	HttpSession session;
	
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
    public String showRegisterForm(Model model, String res) {
        // 메인 카테고리 목록 가져오기
        List<String> divisions = product_dao.getDistinctDivisions();
        model.addAttribute("divisions", divisions);

        // 서브 카테고리 목록 가져오기
        List<String> categories = product_dao.getAllDistinctCategories();
        model.addAttribute("categories", categories);

		if(res == null || res == "") {
			return Common.Path.CUSTOMER_PATH + "product/productInsert.jsp";
		}
        return Common.Path.CUSTOMER_PATH + "product/productInsert.jsp?res=" + res;
    }
    
    @RequestMapping("/addproduct")
	public String upload(Model model,ProductVO product,MultipartFile photo) {
		String webPath = "/resources/img/"; //상대경로
		String savePath = application.getRealPath(webPath); //절대경로
		System.out.println(savePath);
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
		
		product.setFilepath(filename);
		
		int res = product_dao.insertProduct(product);
		
		if(res == 1)
			return "redirect:/?res=" + res;
		else
			return "redirect:/registerForm?res=" + res;
	}
}
