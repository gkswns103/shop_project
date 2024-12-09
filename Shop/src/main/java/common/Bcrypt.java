package common;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class Bcrypt {

	//해야하는거 회원가입시 비밀번호 받아와서 암호화
	//암호화 상태로 db저장 
	//로그인 시 비밀 번호 조회 해제화
	//그리고 해
	
	//암호화
	public String encryption(String pwd) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String encodePwd = encoder.encode(pwd);
		return encodePwd;
	}
	
	
	
}
