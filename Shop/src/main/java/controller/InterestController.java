package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import common.Common;
import dao.CartDAO;
import dao.ProductDAO;
import dao.InterestDAO;
import dao.UsersDAO;
import vo.InterestVO;
import vo.UsersVO;

@Controller
public class InterestController {
    InterestDAO interest_dao;
    UsersDAO users_dao;
    ProductDAO product_dao;
    CartDAO cart_dao;
    
    

    @Autowired
    HttpSession session;

    public void setInterest_dao(InterestDAO interest_dao) {
        this.interest_dao = interest_dao;
    }
    public void setUsers_dao(UsersDAO users_dao) {
        this.users_dao = users_dao;
    }
    public void setProduct_dao(ProductDAO product_dao) {
        this.product_dao = product_dao;
    }
    public void setCart_dao(CartDAO cart_dao) {
        this.cart_dao = cart_dao;
    }
    
    
    
    

    // 관심 목록 조회
    @RequestMapping("/interest")
    public String interestView(int user_idx, Model model) {
        List<InterestVO> list = interest_dao.select_list(user_idx); // 사용자 관심 목록 조회
        // 세션에 로그인된 사용자 정보 설정
        UsersVO user = (UsersVO) session.getAttribute("users");
        if (user == null) {
            return "redirect:/login"; // 로그인 페이지로 리디렉션
        }
        
        model.addAttribute("list", list); // 조회한 리스트를 모델에 추가
        session.removeAttribute("interest_count"); // 기존 관심 목록 개수 제거

        int interest_count = interest_dao.interest_count(user_idx); // 최신 관심 목록 개수 조회
        session.setAttribute("interest_count", interest_count); // 세션에 관심 목록 개수 추가
        
        return Common.Path.CUSTOMER_PATH  + "interestView.jsp"; // 관심 목록 JSP 반환
    }
    
    

    @RequestMapping("/interest_insert")
    @ResponseBody
    public String interestInsert(InterestVO vo) {
        boolean isDuplicate = interest_dao.check_duplicate(vo); // 관심 목록 중복 확인
        int res;

        if (isDuplicate) {
            Integer interest_idx = interest_dao.select_interest_idx(vo); // 중복 항목 ID 조회
            if (interest_idx == null) {
                return "deletefail"; // 삭제 실패 메시지
            }
            res = interest_dao.delete(interest_idx); // 관심 항목 삭제
            if (res == 0) {
                return "deletefail"; // 삭제 실패 메시지
            } else {
                return "deleted"; // 삭제 성공 메시지
            }
        }

        res = interest_dao.insert_interest(vo); // 관심 목록 항목 추가
        if (res == 0) {
            return "fail"; // 등록 실패 메시지
        } else {
            return "success"; // 등록 성공 메시지
        }
    }


    // 관심 목록 항목 삭제
    @RequestMapping("/interest_delete")
    public String interestDelete(InterestVO vo) {
    	
        int res = interest_dao.delete(vo.getInterest_idx()); // 관심 항목 삭제
        int user_idx = vo.getUser_idx(); // 사용자 인덱스 가져오기

        session.removeAttribute("interest_count"); // 기존 관심 목록 개수 제거
        int interest_count = interest_dao.interest_count(user_idx); // 최신 관심 목록 개수 조회
        session.setAttribute("interest_count", interest_count); // 세션에 추가

        return "redirect:/interest?user_idx=" + user_idx; // 관심 목록 페이지로 리다이렉트
    }

    // 관심 목록에서 장바구니로 이동
    @RequestMapping("/interes_cart")
    @ResponseBody
    public String interesCart(InterestVO vo) {
        int res = interest_dao.interest_cart(vo); // 관심 항목을 장바구니로 이동
        
        String result = (res >= 1) ? "성공" : "실패"; // 성공 여부에 따라 결과 반환
        return result;
    }
    


    @RequestMapping("/interest_detail")
    public String interestDetail(int interest_idx, Model model) {
        InterestVO vo = interest_dao.select_detail(interest_idx); // 관심 항목 상세 정보 조회
        model.addAttribute("vo", vo); // 조회한 데이터를 모델에 추가

        // 관심 상품 여부 확인
        UsersVO user = (UsersVO) session.getAttribute("users");
        if (user != null) {
            boolean isInterest = interest_dao.check_duplicate(vo);
            model.addAttribute("isInterest", isInterest); // 관심 여부 추가
        } else {
            model.addAttribute("isInterest", false); // 로그인되지 않은 경우 기본값
        }

        return Common.Path.HOME_PATH + "interest/interestDetail.jsp"; // 관심 항목 상세 JSP 반환
    }
    
       
    
}

































