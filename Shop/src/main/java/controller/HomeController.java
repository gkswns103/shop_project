package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import common.BCryptPwd;
import common.Common;
import dao.CartDAO;
import dao.ProductDAO;
import dao.UsersDAO;
import vo.ProductVO;
import vo.UsersVO;

@Controller
public class HomeController {

	UsersDAO users_dao;
	ProductDAO product_dao;
	CartDAO cart_dao;

	@Autowired
	HttpSession session;

	@Autowired
	HttpServletRequest request;

	public void setUsers_dao(UsersDAO users_dao) {
		this.users_dao = users_dao;
	}

	public void setProduct_dao(ProductDAO product_dao) {
		this.product_dao = product_dao;
	}
	public void setCart_dao(CartDAO cart_dao) {
		this.cart_dao = cart_dao;
	}
	
	
	//기본 url
	@RequestMapping(value = "/", produces = "text/plain; charset=UTF-8")
	public String home(Model model) {

		List<ProductVO> list = product_dao.select_list();

		model.addAttribute("list", list);

		return Common.Path.VIEW_PATH + "home.jsp";
	}
	//로그아웃
	@RequestMapping("/logout")
	public String logout() {

		session.removeAttribute("users");

		session.removeAttribute("cart_count");
		

		return "redirect:/";
	}
	
	//로그인
	@RequestMapping("/signin")
	@ResponseBody
	public String signin(String id, String c_pwd) {
		UsersVO user = users_dao.selectone(id);

		if (user == null) {
			return "no_id";
		} 
		else {
			// 복호화 할 자리
			BCryptPwd bcp = new BCryptPwd();
			boolean isValid = bcp.decryption(user.getPwd(), c_pwd);
			if (isValid) {
				session.setAttribute("users", user);
				
				int user_idx=user.getUser_idx();
				System.out.println("useridx="+user_idx);

				int cart_count=cart_dao.cart_count(user_idx);
				session.setAttribute("cart_count", cart_count);
				return "ok";
			} else {
				return "no_pwd";
			}
		}

	}

	@RequestMapping("/signin_form")
	public String signin_form() {
		return Common.Path.VIEW_PATH + "signin.jsp";
	}

	@RequestMapping(value = "/signup", produces = "text/plain; charset=UTF-8")
	public String signup() {
		return Common.Path.VIEW_PATH + "signup.jsp";
	}

	// 회원가입
	@RequestMapping(value = "/signup_form", produces = "text/plain; charset=UTF-8")
	@ResponseBody
	public String signup_form(UsersVO users ,String addr2) {
		if (users_dao.selectone(users.getId()) == null) { // 회원이 없는경우

			// 암호화 할 자리
			BCryptPwd bcp = new BCryptPwd();
			String encodePwd = bcp.encryption(users.getPwd());
			// 암호화 하고 다시 set
			users.setPwd(encodePwd);

			users.setAddr(users.getAddr() + addr2);
			

			int res = users_dao.insert(users);

			session.setAttribute("users", users);
			return "가입 성공";
		}
		return "중복된 아이디 입니다.";
	}
	 
	@RequestMapping("/kakaologin")
	public String kakaologin(UsersVO users,Model model) {
		if(users_dao.selectone(users.getId()) == null) {
		
			return "redirect:/";
		}
		else {
			session.setAttribute("users", users);
			return "redirect:/";
		}
		
		
	}

	
	// 정보확인을 위한 1명 조회
	@RequestMapping(value = "/my_imformation")
	public String my_imformation(int user_idx, Model model) {

		System.out.println("idx=" + user_idx);
		UsersVO user = users_dao.selectIdx(user_idx);
		model.addAttribute("user", user);
		return Common.Path.VIEW_PATH + "my_imformation.jsp";
	}


	// 수정을 위한 1명 조회
	@RequestMapping(value = "/modify")
	public String select_modify(int user_idx, Model model) {
		UsersVO user = users_dao.selectIdx(user_idx);
		model.addAttribute("user", user);
		return Common.Path.VIEW_PATH + "modify.jsp";

	}

	// 수정
	@RequestMapping(value = "/modify_form")
	public String modify(UsersVO user, String new_pwd, String us_pwd) {
		
		BCryptPwd bcp = new BCryptPwd();
		
		//비밀번호 변경X 기존 비밀번호 유지
		if(us_pwd == null || us_pwd.isEmpty()) {
			System.out.println("비밀번호 교체 X");
			
			int res = users_dao.update_no_pass(user);

			if (res > 0) {
				System.out.println("정보수정 완료");
			} else {
				System.out.println("정보수정 실패");
			}
			
		}else {
			
		//비밀번호 변경 
			
		//기존 사용자 정보 조회	
		UsersVO vo = users_dao.selectIdx(user.getUser_idx());
		
		//기존 비밀 번호 검증
		boolean passRight = bcp.decryption(vo.getPwd(), us_pwd);
		
		//기존 비밀 번호가 맞다면
		if(passRight) {
		
			if(new_pwd !=null && !new_pwd.isEmpty()) {
				
				//암호화
				String encryptedPwd = bcp.encryption(new_pwd);
				
				user.setPwd(encryptedPwd);
				
				System.out.println(vo.getPwd());
			}else {
				user.setPwd(us_pwd);
			}
			
			//기존 비밀번호가 틀리다면
			}else {
				System.out.println("오류! 수정이 불가합니다");
				return "redirect:/modify?user_idx="+user.getUser_idx();
				}
			
		int res = users_dao.update(user,new_pwd);

		if (res > 0) {
			System.out.println("정보수정 완료");
		} else {
			System.out.println("정보수정 실패");
		}//res
		
		}//비밀번호 변경
		return "redirect:/my_imformation?user_idx=" + user.getUser_idx();

	}//수정

	// 아이디 이메일 중복체크
	@RequestMapping(value = "/idEmailCheck" )
	@ResponseBody
	public String check(String id) {
		UsersVO user = users_dao.selectone(id);

		if (user != null ) {
			return "no";
		} else {
			return "yes";
		}
	}
	@RequestMapping("/addr_search")
	public String addr_search() {
		return Common.Path.VIEW_PATH + "addr.jsp";
	}

}
