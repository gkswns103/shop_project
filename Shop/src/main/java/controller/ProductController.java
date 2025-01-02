package controller;

import java.io.File;

import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import common.Common;
import dao.CartDAO;
import dao.InterestDAO;
import dao.ProductDAO;
import vo.InterestVO;
import vo.ProductVO;
import vo.UsersVO;

@Controller
public class ProductController {
	
	@Autowired
	ServletContext application;
	
	@Autowired
	HttpSession session;
	
	ProductDAO product_dao;
	CartDAO cart_dao;

	public void setProduct_dao(ProductDAO product_dao) {
		this.product_dao = product_dao;
	}
	
	public void setCart_dao(CartDAO cart_dao) {
		this.cart_dao = cart_dao;
	}
	
	@RequestMapping("/detail")
	public String detailView(Model model, int product_idx, HttpSession session) {
	    // 현재 상품 정보 가져오기
	    ProductVO vo = product_dao.selectOne(product_idx);
	    model.addAttribute("vo", vo);

	    // 세션에서 방문한 상품 목록 가져오기
	    @SuppressWarnings("unchecked") //경고 무시
	    LinkedList<ProductVO> viewedProducts = (LinkedList<ProductVO>) session.getAttribute("viewedProducts");

	    if (viewedProducts == null) {
	        // 세션에 데이터가 없으면 새 LinkedList 생성
	        viewedProducts = new LinkedList<ProductVO>();
	    }
	    // 리스트에 현재 상품 추가
	    if (viewedProducts.contains(vo)) {
	        // 이미 존재하는 상품은 삭제 후 다시 추가하여 최신 순으로 정렬
	        viewedProducts.remove(vo);
	    } else if (viewedProducts.size() == 5) {
	        // 최대 크기 초과 시 가장 오래된 상품 제거
	        viewedProducts.removeFirst();
	    }
	    viewedProducts.add(vo);
	    // 세션에 업데이트된 리스트 저장
	    session.setAttribute("viewedProducts", viewedProducts);
	    // 상세 페이지로 이동
	    return Common.Path.CUSTOMER_PATH + "product/productDetail.jsp";

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
		
		int res = product_dao.new_Product(product);
		
		if(res == 1)
			return "redirect:/?res=" + res;
		else
			return "redirect:/registerForm?res=" + res;
	}
    
    @RequestMapping("/product_search")
    public String product_search(String search, Model model) {
    	List<ProductVO> list = product_dao.product_search(search);

    	model.addAttribute("list", list);
    	model.addAttribute("search",search);
    	
    	return Common.Path.CUSTOMER_PATH + "product/productSearch.jsp";
    	
    }
}
