<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 수정</title>

<script src="/shop/resources/js/httpRequest.js"></script>

<script>
	
	let change_id = false;
	
	//중복체크 변수
	let can_i = "no";
	
	//비밀번호 체크박스 변수
	let can_i_pass = "no";
	
	//비밀번호 변경 체크박스
	function pass(checkbox_pwd) {
		const passwordFields = document.getElementById("password_check");
		if (checkbox_pwd.checked) {
			can_i_pass = "yes";
			passwordFields.style.display = "table-row"; // 보이기
		} else {
			can_i_pass = "no";
			passwordFields.style.display = "none"; // 숨기기
		}
	}//비밀번호 체크박스
	
	//아이디 변경 체크박스
	function toggleChange(){
		
		const text = document.querySelector('input[name="id_update_text"]');
		const but = document.querySelectorAll('input[name="id_update_button"]');
		const toggleBut = document.getElementById('toggleButton');
		
		if(!change_id){
			text.type = "text";//텍스트 필드 활성화
			but.forEach((button, index) => {
				button.type = "button";//버튼 활성화
				if(index === 0 ){
					button.setAttribute("onclick", "check();");
	            } else if (index === 1) {
	                button.setAttribute("onclick", "send_id();");
					
				}
			});
			toggleBut.value = "아이디 변경 취소";
		}else{
			//원래 상태 복구
			text.type ="hidden";//텍스트 비활성
			but.forEach((button) => {
				button.type ="hidden";//버튼 비활성
				button.removeAttribute("onclick");
			});
			toggleBut.value = "아이디 변경"
		}
		
		change_id = !change_id;
		
	}//아이디 변경 체크박스
	
	//수정하기
	function send_id() {	
		alert("버튼눌림");
		//아이디 중복 체크 확인
		if(can_i === "yes"){
			
			let user_idx=document.getElementById("user_idx").value;
			alert(user_idx);
			const get_newId = document.querySelector('input[name="id_update_text"]');//값 가져오기 1
			const id = get_newId.value.trim();//공백제거 및 값 가졍오기 2
			
			if(id===''){
				alert("아이디를 입력하세요");
				return;
			}
			
			let url = "modify_id";
			let param = "id="+ id + "&user_idx=" + user_idx;
			
			sendRequest(url, param, result_id, "post");
			
			
			} else {
				alert("중복체크를 먼저 해주세요");
				return;
		}
	}//send()
	
	function result_id(){
		if (xhr.readyState == 4 && xhr.status == 200) {
			let date = xhr.responseText.trim();
		
			if(date==="yes"){
				alert("아이디가 변경되었습니다");
				
				
				
			}else{
				alert("변경에 실패하였습니다");
				return;
			}
			
		}
	}//result_id
	
	//아이디 중복 체크
	function check() {
		const get_newId = document.querySelector('input[name="id_update_text"]');//값 가져오기 1
		const id = get_newId.value.trim();//공백제거 및 값 가졍오기 2
		

		if (id === '') {
			alert("id를 입력하세요");
			return;
		}

		let url = "idCheck";
		let param = "id=" + id;
		sendRequest(url, param, resultcheck, "post");

	}//check

	
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
	
	}//resultcheck
	
</script>

</head>
<body>

	<form>
	
		<input type="hidden" id="user_idx" name="user_idx" value="${user.user_idx}">
		<input type="hidden" id="pwd" name="pwd" value="${user.pwd}">
		

			<div>
				<input name="id" value="${user.id}">
				<input type="button" id="toggleButton" value="아이디 변경" onclick="toggleChange();">
				<input type="hidden" name="id_update_text">
				<input type="hidden" name="id_update_button" value="중복 체크" onclick="check();">
				<input type="hidden" name="id_update_button" value="변경하기" onclick="send_id();">
			</div>

			<div>
				<div><input name="email" value="${ user.email }"></div>
			</div>

			<div>
				<div><input name="addr" value="${ user.addr }"></div>
			</div>

			<%-- <tr>
		<td><input name="" value="${ user.age }"></td>
		</tr> --%>

			<div>
				<div><input type="checkbox" id="passwordCheck" onclick="pass(this);">
				    <label for="passwordCheck">비밀번호 변경</label>
				</div>
			</div>

			<div id="password_check" style="display: none;">
				<div><input name="us_pwd" type="password" placeholder="기존 비밀번호 입력"></div>
				<div><input name="new_pwd" type="password" placeholder="새 비밀번호 입력"></div>
			</div>

			<div>
				<div>
					<input type="button" value="취소" onclick="history.back();">
				</div>
			</div>

		

	</form>

</body>
</html>