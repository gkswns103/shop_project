package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.ReviewDAO;
import dao.ReviewLikeDAO;
import vo.ReviewLikeVO;

@Controller
public class ReviewLikeController {
	@Autowired
	HttpSession session;
	
	ReviewLikeDAO reviewLike_dao;
	ReviewDAO review_dao;
	
	public void setReview_dao(ReviewDAO review_dao) {
		this.review_dao = review_dao;
	}
	public void setReviewLike_dao(ReviewLikeDAO reviewLike_dao) {
		this.reviewLike_dao = reviewLike_dao;
	}	
	
	@RequestMapping(value="likeup" ,produces = "text/plain; charset=UTF-8")
	@ResponseBody
	public String likeup(ReviewLikeVO vo) {
	session.removeAttribute("reviewIdx");

	int res=reviewLike_dao.check(vo); 
	if(res>=1) {
	 return "이미 추천을눌렀습니다."; 
	}
	 
	//추천수 증가
	res=reviewLike_dao.likeup(vo);
	
	//갱신
	review_dao.updateLikeCount();
	
	//해당하는 review_count 가져오기
    int review_count=review_dao.getLikeCount(vo.getReview_idx());
    session.setAttribute("reviewIdx", vo.getReview_idx());
	
		return "추천을 눌렀습니다.";
	}
	

}
