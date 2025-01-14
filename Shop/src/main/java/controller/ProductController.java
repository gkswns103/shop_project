package controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.LinkedList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
	public String detailView(Model model, int product_idx, HttpSession session) {
		// 현재 상품 정보 가져오기
		ProductVO vo = product_dao.selectOne(product_idx);
		model.addAttribute("vo", vo);

		// 세션에서 방문한 상품 목록 가져오기
		@SuppressWarnings("unchecked") // 경고 무시
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
		UsersVO user = (UsersVO) session.getAttribute("users"); // 현재 로그인된 사용자 가져오기
		boolean isInterest = false; // 기본값: 관심 상품이 아님
		if (user != null) {
			InterestVO interest = new InterestVO();
			interest.setUser_idx(user.getUser_idx());
			interest.setProduct_idx(product_idx);
			isInterest = interest_dao.check_duplicate(interest); // DAO를 통해 중복 여부 확인
		}
		if (interest_dao != null) {
			model.addAttribute("isInterest", isInterest); // 관심 여부를 뷰에 전달
		}

		// 리뷰 좋아요 갯수 갱신
		review_dao.updateLikeCount();

		List<ReviewVO> list = review_dao.selectList(product_idx);
		model.addAttribute("reviewList", list);

		float ratingAvg = 0f;
		for (int i = 0; i < list.size(); i++) {
			ratingAvg += list.get(i).getRating();
		}
		ratingAvg = ratingAvg / list.size();
		DecimalFormat df = new DecimalFormat("#.0");
		String formattedNumber = df.format(ratingAvg);
		model.addAttribute("ratingAvg", formattedNumber);
		model.addAttribute("count", list.size());

		// 상세 페이지로 이동
		return Common.Path.CUSTOMER_PATH + "product/productDetail.jsp";
	}

	@RequestMapping("/product")
	public String product_list(Model model, String division, String category) {

		List<ProductVO> list;

		if (category == "") {
			list = product_dao.selectDivision(division);
		} else {
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

		if (res == null || res == "") {
			return Common.Path.CUSTOMER_PATH + "product/productInsert.jsp";
		}
		return Common.Path.CUSTOMER_PATH + "product/productInsert.jsp?res=" + res;
	}

	@RequestMapping("/addproduct")
	public String upload(Model model, ProductVO product, MultipartFile photo) {
		String webPath = "/resources/img/"; // 상대경로
		String savePath = application.getRealPath(webPath); // 절대경로
		System.out.println("절대경로 : " + savePath);
		// 업로드를 위한 파일정보
		String filename = "no_file";

		if (!photo.isEmpty()) {
			filename = photo.getOriginalFilename();

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
				photo.transferTo(saveFile);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		product.setFilepath(filename);

		int res = product_dao.new_Product(product);

		if (res == 1)
			return "redirect:/?res=" + res;
		else
			return "redirect:/registerForm?res=" + res;
	}

	@RequestMapping("/product_search")
	public String product_search(String search, Model model) {
		List<ProductVO> list = product_dao.product_search(search);

		model.addAttribute("list", list);
		model.addAttribute("search", search);

		return Common.Path.CUSTOMER_PATH + "product/productSearch.jsp";

	}

	@RequestMapping("/sale_product")
	public String sale_product(Model model) {
		List<ProductVO> list = product_dao.sale_product();

		model.addAttribute("list", list);

		return Common.Path.CUSTOMER_PATH + "product/sale_product.jsp";
	}

	@RequestMapping("/sale_pet")
	public String sale_pet(Model model) {
		List<ProductVO> list = product_dao.sale_pet();
		model.addAttribute("list", list);
		return Common.Path.CUSTOMER_PATH + "product/sale_product.jsp";
	}

	@RequestMapping("/sale_christmas")
	public String sale_christmas(Model model) {
		List<ProductVO> list = product_dao.sale_christmas();
		model.addAttribute("list", list);
		return Common.Path.CUSTOMER_PATH + "product/sale_christmas.jsp";
	}

	@RequestMapping("/sale_it")
	public String sale_it(Model model) {
		List<ProductVO> list = product_dao.sale_it();
		model.addAttribute("list", list);
		return Common.Path.CUSTOMER_PATH + "product/sale_it.jsp";
	}

	@RequestMapping("/sale_newyear")
	public String sale_newyear(Model model) {
		List<ProductVO> list = product_dao.sale_newyear();
		model.addAttribute("list", list);
		return Common.Path.CUSTOMER_PATH + "product/sale_newyear.jsp";
	}

	@RequestMapping(value="/singleImageUploader")
    public void smarteditorImageUpload2(MultipartFile file,HttpServletRequest request, HttpServletResponse response) throws IOException {
    	try {
			//파일정보
			String sFileInfo = "";
			//파일명을 받는다 - 일반 원본파일명
			String sFilename = request.getHeader("file-name");
			//파일 확장자
			String sFilenameExt = sFilename.substring(sFilename.lastIndexOf(".")+1);
			//확장자를소문자로 변경
			sFilenameExt = sFilenameExt.toLowerCase();
				
			//이미지 검증 배열변수
			String[] allowFileArr = {"jpg","png","bmp","gif"};

			//확장자 체크
			int nCnt = 0;
			for(int i=0; i<allowFileArr.length; i++) {
				if(sFilenameExt.equals(allowFileArr[i])){
					nCnt++;
				}
			}

			//이미지가 아니라면
			if(nCnt == 0) {
				PrintWriter print = response.getWriter();
				print.print("NOTALLOW_"+sFilename);
				print.flush();
				print.close();
			} else {
				//디렉토리 설정 및 업로드	
				
				//파일경로
				 String webPath = "/resources/img/"; //상대경로
			      String filePath = application.getRealPath(webPath); //절대경로
				File file2 = new File(filePath);
				
				if(!file2.exists()) {
					file2.mkdirs();
				}
				
				String sRealFileNm = "";
				SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
				String today= formatter.format(new java.util.Date());
				sRealFileNm = today+UUID.randomUUID().toString() + sFilename.substring(sFilename.lastIndexOf("."));
				String rlFileNm = filePath + sRealFileNm;
				
				///////////////// 서버에 파일쓰기 ///////////////// 
				InputStream inputStream = request.getInputStream();
				OutputStream outputStream=new FileOutputStream(rlFileNm);
				int numRead;
				byte bytes[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
				while((numRead = inputStream.read(bytes,0,bytes.length)) != -1){
					outputStream.write(bytes,0,numRead);
				}
				if(inputStream != null) {
					inputStream.close();
				}
				outputStream.flush();
				outputStream.close();
				
				///////////////// 이미지 /////////////////
				// 정보 출력
				sFileInfo += "&bNewLine=true";
				// img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
				sFileInfo += "&sFileName="+ sFilename;
				sFileInfo += "&sFileURL="+filePath+sRealFileNm;
				PrintWriter printWriter = response.getWriter();
				printWriter.print(sFileInfo);
				printWriter.flush();
				printWriter.close();
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
}
