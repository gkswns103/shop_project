package controller;

import java.io.File;
import java.text.DecimalFormat;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import common.Common;
import dao.CartDAO;
import dao.InterestDAO;
import dao.ProductDAO;
import dao.ReviewDAO;
import dao.ReviewLikeDAO;
import vo.InterestVO;
import vo.ProductVO;
import vo.ReviewVO;
import vo.UsersVO;


@Controller
public class ProductController {
	
	@Autowired
	ServletContext application;
	
	@Autowired
	HttpSession session;
	
	ProductDAO product_dao;
	CartDAO cart_dao;
	ReviewDAO review_dao;
	ReviewLikeDAO reviewLike_dao;
	 
	
	
	public void setReviewLike_dao(ReviewLikeDAO reviewLike_dao) {
		this.reviewLike_dao = reviewLike_dao;
	}
	public void setReview_dao(ReviewDAO review_dao) {
		this.review_dao = review_dao;
	}
	public void setProduct_dao(ProductDAO product_dao) {
		this.product_dao = product_dao;
	}
	public void setCart_dao(CartDAO cart_dao) {
		this.cart_dao = cart_dao;
	}
	
	InterestDAO interest_dao;
	public void setInterest_dao(InterestDAO interest_dao) {
		this.interest_dao = interest_dao;
	}
	
	@RequestMapping("/detail")
	public String detailView(Model model, int product_idx) {
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
	    session.setAttribute("viewedProducts", viewedProducts);
	    // 세션에 업데이트된 리스트 저장

	    UsersVO user = (UsersVO) session.getAttribute("users"); // 현재 로그인된 사용자 가져오기
	       boolean isInterest = false; // 기본값: 관심 상품이 아님
	       if (user != null) {
	           InterestVO interest = new InterestVO();
	           interest.setUser_idx(user.getUser_idx());
	           interest.setProduct_idx(product_idx);
	           isInterest = interest_dao.check_duplicate(interest); // DAO를 통해 중복 여부 확인
	       }
	      
	       List<ReviewVO> listOrderbyRecent = review_dao.selectList(product_idx);
	       model.addAttribute("listOrderbyRecent", listOrderbyRecent);
	       
	       List<ReviewVO> listOrderbyLike =review_dao.listbyLike(product_idx);
	       model.addAttribute("listOrderbyLike",listOrderbyLike);
	       
	       //리뷰 좋아요 갯수 갱신
	       review_dao.updateLikeCount();
	       
	       float ratingAvg=0f;
	       for(int i=0;i<listOrderbyRecent.size();i++) {
	    	   ratingAvg+=listOrderbyRecent.get(i).getRating();
	       }
	       if(ratingAvg == 0) {
	    	   model.addAttribute("ratingAvg","no_data");
	       }else {
	    	   DecimalFormat df = new DecimalFormat("#.0");
	    	   String formattedNumber = df.format(ratingAvg);
	    	   model.addAttribute("ratingAvg",formattedNumber);
	    	   ratingAvg=ratingAvg/listOrderbyRecent.size();
	       }
	      
	       model.addAttribute("count",listOrderbyRecent.size());
	       model.addAttribute("isInterest", isInterest); // 관심 여부를 뷰에 전달
	       
	  
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
	public String upload(Model model,ProductVO product, MultipartFile photo) {
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
    
    @RequestMapping(value = "/uploading", method = RequestMethod.POST)
    @ResponseBody
    public String uploadEditorImage(@RequestParam("file") MultipartFile file) {
        if (file == null || file.isEmpty()) {
            return "error: 파일이 없습니다.";
        }

        String webPath = "/resources/img/";
        String savePath = application.getRealPath(webPath);
        File dir = new File(savePath);

        if (!dir.exists()) {
            dir.mkdirs();
            System.out.println("이미지 저장 폴더 생성: " + savePath);
        }

        //  파일명에서 특수 문자 제거 (공백 -> _, 한글 제거)
        String originalFilename = file.getOriginalFilename();
        String safeFilename = originalFilename.replaceAll("[^a-zA-Z0-9.-]", "_");
        
        // 중복 방지를 위해 타임스탬프 추가
        long time = System.currentTimeMillis();
        safeFilename = time + "_" + safeFilename;

        File saveFile = new File(savePath, safeFilename);

        try {
            file.transferTo(saveFile);
            System.out.println("이미지 저장 완료: " + saveFile.getAbsolutePath());
        } catch (Exception e) {
            e.printStackTrace();
            return "error: 업로드 실패";
        }

        return "/resources/img/" + safeFilename;
    }
    
    
    
    
    
    //수정페이지 수정 삭제를 위한 controller
    @RequestMapping("/productList")
    public String productList(@RequestParam("user_idx") int user_idx, Model model) {
        List<ProductVO> productList = product_dao.getProductList(user_idx);
        List<ProductVO> applyProductList = product_dao.getApplyProductList(user_idx);

        model.addAttribute("productList", productList);
        model.addAttribute("applyProductList", applyProductList);

        return Common.Path.CUSTOMER_PATH + "product/productList.jsp";
    }


    @RequestMapping("/productEdit")
    public String productEdit(@RequestParam("product_idx") int product_idx, Model model) {
    	
        ProductVO product = product_dao.selectOne(product_idx);
        model.addAttribute("product", product);
        model.addAttribute("status", "product"); // 판매 중 상태 전달
        
        List<String> divisions = product_dao.getDistinctDivisions();
        model.addAttribute("divisions", divisions);
       
        // 서브 카테고리 목록 가져오기
        List<String> categories = product_dao.getAllDistinctCategories();
        model.addAttribute("categories", categories);
        
        return Common.Path.CUSTOMER_PATH + "product/ProductEdit.jsp";
    }

    @RequestMapping("/applyEdit")
    public String applyEdit(@RequestParam("product_idx") int product_idx, Model model) {
        ProductVO product = product_dao.new_Product_select_one(product_idx);
        model.addAttribute("product", product);
        model.addAttribute("status", "apply"); // 신청 중 상태 전달
        
        List<String> divisions = product_dao.getDistinctDivisions();
        model.addAttribute("divisions", divisions);
       
        // 서브 카테고리 목록 가져오기
        List<String> categories = product_dao.getAllDistinctCategories();
        model.addAttribute("categories", categories);
        
        return Common.Path.CUSTOMER_PATH + "product/ProductEdit.jsp";
    }
    
    @RequestMapping(value = "/updateProduct", method = RequestMethod.POST)    	
    public String updateProduct(ProductVO product, Model model, MultipartFile photo,
											@RequestParam("user_idx") int user_idx) {
		String webPath = "/resources/img/"; // 상대경로
		String savePath = application.getRealPath(webPath); // 절대경로
		System.out.println(savePath);
		
		String filename = product.getFilepath() != null ? product.getFilepath() : "no_file"; // 기존 파일명을 기본값으로 설정
		
		if (!photo.isEmpty()) { // 새로운 파일이 업로드된 경우
		filename = photo.getOriginalFilename();
		File saveFile = new File(savePath, filename);
		
		if (!saveFile.exists()) {
		saveFile.mkdirs();
		} else {
		// 동일한 이름의 파일이 존재하면 현재 업로드 시간을 붙여 중복 방지
		long time = System.currentTimeMillis();
		filename = String.format("%d_%s", time, filename);
		saveFile = new File(savePath, filename);
		}
		
		// 파일을 절대 경로에 저장
		try {
		photo.transferTo(saveFile);
		} catch (Exception e) {
		e.printStackTrace();
		}
		}
		
		product.setFilepath(filename); // 새로운 파일 또는 기존 파일 경로를 설정
   	
       product_dao.updateProduct(product);
       return "redirect:/productList?user_idx=" + user_idx;
   }
    

    @RequestMapping("/deleteProduct")
    public String deleteProduct(@RequestParam("product_idx") int product_idx, 
                                 @RequestParam("user_idx") int user_idx) {
        product_dao.delete_product(product_idx);
        return "redirect:/productList?user_idx=" + user_idx;
    }

    @RequestMapping("/deleteApplyProduct")
    public String deleteApplyProduct(@RequestParam("product_idx") int product_idx, 
                                      @RequestParam("user_idx") int user_idx) {
        product_dao.delete_apply_product(product_idx);
        return "redirect:/productList?user_idx=" + user_idx;
    }

}

