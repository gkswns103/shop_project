package common;

import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class BCryptPwd {

	// 해야하는거 회원가입시 비밀번호 받아와서 암호화
	// 암호화 상태로 db저장
	// 로그인 시 비밀 번호 조회 복호화
	// 그리고 해

	// 암호화
	public String encryption(String pwd) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String encodePwd = encoder.encode(pwd);
		return encodePwd;
	}
	
	

	// 복호화
	// BCrypt.checkpw(입력한 비밀번호, 암호화 된 비밀 번호)
	public boolean decryption(String encodePwd, String c_pwd) {
		boolean isValid = false;
		isValid = BCrypt.checkpw(c_pwd, encodePwd);

		return isValid;
	}

}
