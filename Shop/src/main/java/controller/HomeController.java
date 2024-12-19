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

	// 기본 url
	@RequestMapping(value = "/", produces = "text/plain; charset=UTF-8")
	public String home(Model model) {

		if (session.getAttribute("users") != null) {
			UsersVO user = (UsersVO) session.getAttribute("users");

			int cart_count = cart_dao.cart_count(user.getUser_idx());
			session.setAttribute("cart_count", cart_count);
		}

		List<ProductVO> list = product_dao.select_list();

		model.addAttribute("list", list);

		return Common.Path.HOME_PATH + "home.jsp";
	}

	// ------------------------------------------------------------------------------------------------
	// 로그인 기능

	// 로그아웃
	@RequestMapping("/logout")
	public String logout() {

		session.removeAttribute("users");

		session.removeAttribute("cart_count");

		return "redirect:/";
	}

	// 로그인
	@RequestMapping("/signin")
	@ResponseBody
	public String signin(String id, String c_pwd) {
		UsersVO user = users_dao.selectId(id);

		if (user == null) {
			return "no_id";
		} else {
			// 복호화 할 자리
			BCryptPwd bcp = new BCryptPwd();
			boolean isValid = bcp.decryption(user.getPwd(), c_pwd);
			if (isValid) {
				session.setAttribute("users", user);

				int user_idx = user.getUser_idx();

				int cart_count = cart_dao.cart_count(user_idx);
				session.setAttribute("cart_count", cart_count);
				return "ok";
			} else {
				return "no_pwd";
			}
		}

	}

	@RequestMapping("/signin_form")
	public String signin_form() {
		return Common.Path.CUSTOMER_PATH + "login/signin.jsp";
	}

	@RequestMapping("/kakaologin")
	public String kakaologin(UsersVO users, Model model) {
		session.setAttribute("users", users);
		return "redirect:/";

	}

	// ------------------------------------------------------------------------------------------------
	// 회원가입
	@RequestMapping(value = "/signup", produces = "text/plain; charset=UTF-8")
	public String signup() {
		return Common.Path.CUSTOMER_PATH + "login/signup.jsp";
	}

	// 회원가입
	@RequestMapping(value = "/signup_form", produces = "text/plain; charset=UTF-8")
	@ResponseBody
	public String signup_form(UsersVO users, String addr2) {
		if (users_dao.selectId(users.getId()) == null) { // 회원이 없는경우

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

	// 정보확인을 위한 1명 조회
	@RequestMapping(value = "/my_imformation")
	public String my_imformation(int user_idx, Model model) {
		UsersVO user = users_dao.selectIdx(user_idx);
		model.addAttribute("user", user);
		return Common.Path.CUSTOMER_PATH + "userinfo/my_imformation.jsp";
	}

	// ------------------------------------------------------------------------------------------------
	// 수정

	// 수정을 위한 1명 조회
	@RequestMapping(value = "/modify")
	public String select_modify(int user_idx, Model model) {
		UsersVO user = users_dao.selectIdx(user_idx);
		model.addAttribute("user", user);

		return Common.Path.CUSTOMER_PATH + "userinfo/modify.jsp";

	}

	// 아이디 변경
	@RequestMapping(value = "/update_id")
	@ResponseBody
	public String update_id(UsersVO user) {
		int res = users_dao.update_id(user);
		System.out.println("수정결과 : " + res);
		if (res > 0) {
			return "suc";
		} else {
			return "fail";
		}
	}

	// 이메일 변경
	@RequestMapping(value = "/update_email")
	@ResponseBody
	public String update_email(UsersVO user) {
		int res = users_dao.update_email(user);
		System.out.println("수정결과 : " + res);
		if (res > 0) {
			return "suc";
		} else {
			return "fail";
		}
	}

	// 주소 변경
	@RequestMapping(value = "/update_addr")
	@ResponseBody
	public String update_addr(UsersVO user) {
		System.out.println(user.getAddr());
		int res = users_dao.update_addr(user);
		System.out.println("수정결과 : " + res);
		if (res > 0) {
			return "suc";
		} else {
			return "fail";
		}
	}

	@RequestMapping(value = "/update_pwd")
	@ResponseBody
	public String update_pwd(UsersVO user, String new_pwd, String pwd) {
		UsersVO vo = users_dao.selectIdx(user.getUser_idx());
		BCryptPwd bcp = new BCryptPwd();

		boolean passRight = bcp.decryption(vo.getPwd(), pwd);

		if (passRight) {

			if (new_pwd != null && !new_pwd.isEmpty()) {

				// 암호화
				String encryptedPwd = bcp.encryption(new_pwd);

				user.setPwd(encryptedPwd);

				System.out.println(vo.getPwd());
			} else {
				user.setPwd(pwd);
			}
		} else {
			System.out.println("오류! 수정이 불가합니다");
			return "fail";

		}

		int res = users_dao.update_pwd(user);

		if (res > 0) {
			System.out.println("정보수정 완료");
			return "suc";
		} else {
			System.out.println("정보수정 실패");
			return "fail";
		} // res

	}

	// 아이디 중복체크
	@RequestMapping(value = "/idCheck")
	@ResponseBody
	public String check(String id) {
		UsersVO user = users_dao.selectId(id);

		if (user != null) {
			return "no";
		} else {
			return "yes";
		}
	}

	@RequestMapping("/addr_search")
	public String addr_search() {
		return Common.Path.CUSTOMER_PATH + "userinfo/addr.jsp";
	}

	@RequestMapping(value = "/delete_user")
	public String delete_account(int user_idx) {
		int aaa = cart_dao.delete_cart(user_idx);
		int res = users_dao.delete_user(user_idx);

		System.out.println(aaa);
		System.out.println(res);

		session.removeAttribute("users");
		session.removeAttribute("cart_count");
		return "redirect:/";
	}

	// ------------------------------------------------------------------------------------------------
	// 삭제

	// 비밀번호 인증
	@RequestMapping(value = "/pass")
	@ResponseBody
	public String pass_nopass(int user_idx, String pwd) {

		// 암호화 객체
		BCryptPwd bcp = new BCryptPwd();
		// 기존 비밀번호 가져오기
		UsersVO user = users_dao.selectIdx(user_idx);
		// 기존 비밀번호와 암호화된 입력받은 값이 일치하는지 비교
		boolean isValid = bcp.decryption(user.getPwd(), pwd);

		if (isValid) {
			int a = cart_dao.delete_cart(user_idx);
			int b = users_dao.delete_user(user_idx);

			System.out.println(a);
			System.out.println(b);
			session.removeAttribute("users");
			session.removeAttribute("cart_count");
			return "yes";
		} else {

			return "no";
		}
	}
}
