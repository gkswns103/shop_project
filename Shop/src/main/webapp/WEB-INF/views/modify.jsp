<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 수정</title>

<script src="/shop/resources/js/httpRequest.js"></script>

<script>
	let can_i = "no"
	let can_i_pass = "no"
	
	//비밀번호 변경 체크박스
	function pass(checkbox) {
		const passwordFields = document.getElementById("password_check");
		if (checkbox.checked) {
			can_i_pass = "yes";
			passwordFields.style.display = "table-row"; // 보이기
		} else {
			can_i_pass = "no";
			passwordFields.style.display = "none"; // 숨기기
		}
	}
	//아이디 중복 체크
	
	//수정하기
	function send(f) {	
		
		if (can_i === 'yes' && can_i_pass ==='yes') {
			let id = f.id.value;
			let us_pwd = f.us_pwd.value;
			let new_pwd = f.new_pwd.value;
			let name = f.name.value;
			let email = f.email.value;
			let addr = f.addr.value;

				if (id === '') {
					alert("id를 입력하세요");
					return;
				}//아이디 유무 확인

				if (us_pwd === '') {
					alert("기존 비밀번호를 입력하세요");
					return;
				}//비밀번호 유무 확인
				
				if (new_pwd === '') {
					alert("새로운 비밀번호를 입력하세요");
					return;
				}//새로운 비밀번호 유무 확인
				if (name === '') {
					alert("이름을 입력하세요");
					return;
				}//이름 유무확인
				
				if (email === '') {
					alert("메일을 입력하세요");
					return;
				}//이메일 유무 확인
				
				if (addr === '') {
					alert("주소를 입력하세요");
					return;
				}//주소 유무확인

				f.action = "modify_form";
				f.method = "post";
				f.submit();
				
			} else if ( can_i === 'yes' && can_i_pass === 'no') {
							
				let id = f.id.value;
				let name = f.name.value;
				let email = f.email.value;
				let addr = f.addr.value;

				if (id === '') {
					alert("id를 입력하세요");
					return;
					}//아이디 유무 확인
				
				if (name === '') {
						alert("이름을 입력하세요");
						return;
					}//이름 유무 확인
				
				if (email === '') {
						alert("메일을 입력하세요");
						return;
					}//이메일 유무확인
				
				if (addr === '') {
						alert("주소를 입력하세요");
						return;
					}//주소 유무확인

					f.action = "modify_form";
					f.method = "post";
					f.submit();
				
			} else {
				alert("중복체크를 먼저 해주세요");
				return;
			}//중복체크 확인

		
		
	}//send(f)
	
	function check(f) {
		let id = f.id.value;
		

		if (id === '') {
			alert("id를 입력하세요");
			return;
		}

		let url = "idEmailCheck";
		let param = "id=" + id;
		sendRequest(url, param, resultcheck, "post");

	}

	
	function resultcheck() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			let date = xhr.responseText.trim();

			if (date === "no") {
				alert("아이디가 중복입니다.");
				can_i = "no";

			} else if (date === "yes") {
				alert("사용가능합니다.");
				can_i = "yes";

			} else {
				alert("오류발생");

			}

		}
	
	}
</script>

</head>
<body>

	<form>
		<input type="hidden" name="user_idx" value="${user.user_idx}">
		<input type="hidden" name="pwd" value="${user.pwd}">
		<table>

			<tr>
				<td><input name="id" value="${ user.id }"></td>
			</tr>

			<tr>
				<td><input name="name" value="${ user.name }"></td>
			</tr>

			<tr>
				<td><input name="email" value="${ user.email }"></td>
			</tr>

			<tr>
				<td><input name="addr" value="${ user.addr }"></td>
			</tr>

			<%-- <tr>
		<td><input name="" value="${ user.age }"></td>
		</tr> --%>

			<tr>
				<td><input type="checkbox" id="passwordCheck" onclick="pass(this);">
				    <label for="passwordCheck">비밀번호 변경</label>
				</td>
			</tr>

			<tr id="password_check" style="display: none;">
				<td><input name="us_pwd" type="password" placeholder="기존 비밀번호 입력"></td>
				<td><input name="new_pwd" type="password" placeholder="새 비밀번호 입력"></td>
			</tr>

			<tr>
				<td><input type="button" value="중복체크" onclick="check(this.form);">
					<input type="button" value="수정하기" onclick="send(this.form);">
					<input type="button" value="취소" onclick="history.back();">
				</td>
			</tr>

		</table>

	</form>

</body>
</html>