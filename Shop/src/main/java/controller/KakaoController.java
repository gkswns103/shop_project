package controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import common.Common;
import dao.UsersDAO;
import vo.UsersVO;

@Controller
public class KakaoController {

	@Autowired
	HttpSession session;

	UsersDAO users_dao;

	public void setUsers_dao(UsersDAO users_dao) {
		this.users_dao = users_dao;
	}

	@ResponseBody
	@RequestMapping(value="/setRedirect")
    public String setRedirect(@RequestParam String redirect, HttpSession session) {
        // redirect 값을 세션에 저장
        session.setAttribute("redirect", redirect);
        return "success";
    }

	@RequestMapping(value = "/getKakaoAuthUrl")
	public @ResponseBody String getKakaoAuthUrl(HttpServletRequest request) throws Exception {
		String reqUrl = "https://kauth.kakao.com/oauth/authorize" + "?client_id=45484c448a366908d833bb7f9a36a50b"
				+ "&redirect_uri=http://192.168.0.15:9090/shop/oauth_kakao"// 리다이렉트 URI
				+ "&response_type=code"; // 응답 타입

		return reqUrl;
	}

	// 카카오 연동정보 조회
	@RequestMapping(value = "/oauth_kakao")
	public String oauthKakao(@RequestParam(value = "code", required = false) String code, Model model)
			throws Exception {

		String access_Token = getAccessToken(code);

		HashMap<String, Object> userInfo = getUserInfo(access_Token);
		JSONObject kakaoInfo = new JSONObject(userInfo);

		String name = (String) kakaoInfo.get("nickname");
		String email = (String) kakaoInfo.get("email");
		UsersVO user = new UsersVO();
		if (users_dao.selectId(email) != null) { // 카카오로 회원가입 한경우
			user = users_dao.selectId(email);
			session.setAttribute("users", user);
			String redirect=(String)session.getAttribute("redirect");

			if (redirect == "" ) {
	            // redirect 값이 존재하면 해당 URL로 리디렉션
				session.removeAttribute("redirect");
				return "redirect:/";
	        } else {
	            // 없으면 기본 페이지로 리디렉션
	        	session.removeAttribute("redirect");
	            return "redirect:" + redirect;
	        }
			
		} else {
			user.setEmail(email);
			user.setName(name);
			user.setPwd(access_Token);
			user.setId(email);

			model.addAttribute("user", user);

			return Common.Path.CUSTOMER_PATH + "login/kakao_signup.jsp";
		}
	}

	@RequestMapping("/kakao_signup")
	public String kakao_signup(UsersVO user,String addr2, Model model) {
		user.setAddr(user.getAddr() + " " + addr2);
		users_dao.insert(user);
		System.out.println("가입성공");
		
		UsersVO new_user = users_dao.selectId(user.getId());
		
		session.setAttribute("users", new_user);
		return "redirect:/"; // 본인 원하는 경로 설정
	}

	// 토큰발급
	public String getAccessToken(String authorize_code) {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			// URL연결은 입출력에 사용 될 수 있고, POST 혹은 PUT 요청을 하려면 setDoOutput을 true로 설정해야함.
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);

			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=45484c448a366908d833bb7f9a36a50b"); // 본인이 발급받은 key
			sb.append("&redirect_uri=http://192.168.0.15:9090/shop/oauth_kakao"); // 본인이 설정해 놓은 경로
			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();

			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();

			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}

			// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
			JsonElement element = JsonParser.parseString(result.toString());

			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

			br.close();
			bw.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return access_Token;
	}

	// 유저정보조회
	public HashMap<String, Object> getUserInfo(String access_Token) {

		// 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");

			// 요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);

			int responseCode = conn.getResponseCode();

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}

			JsonElement element = JsonParser.parseString(result.toString());

			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
			String email = kakao_account.getAsJsonObject().get("email").getAsString();

			userInfo.put("accessToken", access_Token);
			userInfo.put("nickname", nickname);
			userInfo.put("email", email);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return userInfo;
	}
}
