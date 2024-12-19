<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 수정</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/shop/resources/css/style1.css" rel="stylesheet" />
<link href="/shop/resources/css/style2.css" rel="stylesheet" />
<link href="/shop/resources/css/style3.css" rel="stylesheet" />
<link href="/shop/resources/css/style4.css" rel="stylesheet" />
<link href="/shop/resources/css/style5.css" rel="stylesheet" />
<link href="/shop/resources/css/style6.css" rel="stylesheet" />

<link href="/shop/resources/css/modify.css" rel="stylesheet" />

</head>
<body>

	<jsp:include page="../header/header.jsp"></jsp:include>
<main class="main-container">
	<form>

		<input type="hidden" id="user_idx" name="user_idx"
			value="${user.user_idx}"> <input type="hidden" id="pwd"
			name="pwd" value="${user.pwd}">


		<div class="id">
			<div class="base">
				<input name="id" value="${user.id}" readonly> 
				<input type="button" id="toggleButton" value="아이디 변경" onclick="toggleChange_id();">
			</div>
			
			<div class="hidden">
				<input type="hidden" name="id_update_text">
				<input type="hidden" name="id_update_button" value="중복 체크" onclick="check();">
				<input type="hidden" name="id_update_button" value="변경하기" onclick="send_id();">
			</div>
		</div>

		<div class="email">
			<div class="base">
				<input name="email" value="${ user.email }" readonly>
				<input type="button" id="toggle_e" value="이메일 변경"onclick="toggleChange_email();">
			</div>
			
			<div class="hidden">
				<input type="hidden" name="email_update_text"> 
				<input type="hidden" name="email_update_button" value="중복 체크" onclick="mail_check();">
				<input type="hidden" name="email_update_button" value="이메일 변경" onclick="send_email();">
			</div>
		</div>

		<div class="addr">
			<div class="base">
				<input name="addr" value="${ user.addr }" readonly>
				<input type="button" id="toggle_a" value="주소 변경" onclick="toggleChange_addr();">
			</div>
			
			<div class="hidden">
				<input type="hidden" id="addr_update_text" name="addr_update_text" onclick="addr_search()" readonly>
				<input type="hidden" id="addr_update_detail_text" name="addr_update_detail_text" placeholder="상세 주소 입력">
				<input type="hidden" name="addr_update_button" value="주소 변경" onclick="send_addr();">
			</div>
		</div>

		<div class="pwd">
			<div class="base">
				<input type="button" id="toggle_p" value="비밀번호 변경" onclick="toggleChange_pwd();">
			<div>
			
			<div class="hidden" style="margin-top:10px">
				<input type="hidden" name="pwd_text" placeholder="기존 비밀번호 입력"> 
				<input type="hidden" name="new_pwd_text" placeholder="새 비밀번호 입력"> 
				<input type="hidden" name="pwd_update_button" value="비밀번호 변경" onclick="send_pwd();">
			</div>
		</div>

	</form>

		<div class="back">
			<input type="button" value="뒤로가기" onclick="history.back();">
		</div>
</main>

	<script src="/shop/resources/js/httpRequest.js"></script>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5c7aefd977d4d59940d84d9223e46d62&libraries=services,clusterer,drawing"></script>
	<script>
	
	let change_id = false;
	let change_email = false;
	let change_addr = false;
	let change_pwd = false;
	
	//아이디 중복체크 변수
	let can_i = "no";
	
	//이메일 중복체크 변수
	let can_i_e = "no";
	
	//비밀번호 체크박스 변수
	let can_i_pass = "no";
	
//------------------------------------------------------------------------------------------
//아이디

	//아이디 변경 버튼
	function toggleChange_id(){
		
		const text = document.querySelector('input[name="id_update_text"]');
		const but = document.querySelectorAll('input[name="id_update_button"]');
		const toggleBut = document.querySelector('#toggleButton');
		
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
	
	//아이디 중복 체크
	function check() {
		const get_newId = document.querySelector('input[name="id_update_text"]').value.trim();//값 가져오기
		
		

		if (get_newId === '') {
			alert("id를 입력하세요");
			return;
		}

		let url = "idCheck";
		let param = "id=" + get_newId;
		sendRequest(url, param, resultcheck, "post");

	}//check

	
	function resultcheck() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			let date = xhr.responseText.trim();

			if (date === "no") {
				alert("아이디가 중복입니다.");
				can_i = "no";
				return;

			} else if (date === "yes") {
				alert("사용가능합니다.");
				can_i = "yes";

			} else {
				alert("오류발생 관리자에게 문의하세요");
				return;

			}

		}
	
	}//resultcheck

	//아이디 변경
	function send_id(){
		if(can_i==='yes'){
			const get_newId = document.querySelector('input[name="id_update_text"]').value.trim();//값 가져오기 1
			const user_idx =document.getElementById("user_idx").value;
			
			if(get_newId ===''){
				alert('새로운 아이디를 입력하세요');
				return;
			}
			
			let url = "update_id";
			let param = "id="+get_newId + "&user_idx=" + user_idx;
			sendRequest(url, param, resultUdtId, "post");
			
		}
	}//send_id
	
	function resultUdtId(){
		
		if (xhr.readyState == 4 && xhr.status == 200) {
			let date = xhr.responseText.trim();

			if (date === "fail") {
				alert("아이디 변경 실패");
				return;

			} else if (date === "suc") {
				alert("아이디 변경 성공");
				
			} else {
				alert("오류발생 관리자에게 문의 하세요");
				return;

			}

		}
	
	}//resultUdtId
	
//---------------------------------------------------------------------------------------------------------------
//이메일

	//이메일 변경 버튼
	function toggleChange_email(){
		const text_e = document.querySelector('input[name="email_update_text"]');
		const but_e = document.querySelectorAll('input[name="email_update_button"]');
		const toggleBut_e = document.getElementById('toggle_e');
		
		if(!change_email){
			text_e.type = "text";
			but_e.forEach((button, index) => {
				button.type = "button";
				if(index===0){
					button.setAttribute("onclick", "mail_check();");
				}else if(index===1){
					button.setAttribute("onclick", "send_email();");
				}
			}); 
			toggleBut_e.value = "이메일 변경 취소";
		}else{
			//원래 상태 복구
			text_e.type ="hidden";
			but_e.forEach((button) => {
				button.type ="hidden";
				button.removeAttribute("onclick");
			});
			toggleBut_e.value = "이메일 변경"
		}
		change_email = !change_email;
	}//이메일 변경 
	
	//메일 중복 체크
	function mail_check() {
		const get_newEmail = document.querySelector('input[name="email_update_text"]').value.trim();//값 가져오기	

		if (get_newEmail === '') {
			alert("email를 입력하세요");
			return;
		}

		let url = "emailCheck";
		let param = "email=" + get_newEmail;
		sendRequest(url, param, resultcheck_e, "post");

	}//check
	
	function resultcheck_e() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			let date = xhr.responseText.trim();

			if (date === "no") {
				alert("이메일이 중복입니다.");
				can_i_e = "no";
				return;

			} else if (date === "yes") {
				alert("사용가능합니다.");
				can_i_e = "yes";

			} else {
				alert("오류발생 관리자에게 문의 하세요");
				return;

			}

		}
	
	}//resultcheck_e
	
	//메일 변경
	function send_email(){
		const new_email = document.querySelector('input[name="email_update_text"]').value.trim();
		const user_idx = document.getElementById("user_idx").value;
		
		if(new_email === ''){
			alert("이메일을 입력하세요");
			return;
		}
		
		let url = "update_email";
		let param = "email="+new_email + "&user_idx=" + user_idx;
		
		sendRequest(url, param, resultUpd_e, "post");
		
	}//send_email
	
	function resultUpd_e(){
		if (xhr.readyState == 4 && xhr.status == 200) {
			let date = xhr.responseText.trim();
			if(date === "suc"){
				alert("이메일 변경에 성공했습니다");
			}else if(date === "fail"){
				alert("이메일 변경에 실패하였습니다");
				return;
			}else{
				alert("오류발생 관리자에게 문의하세요");
				return;
			}
	}
	}//resultUpd_e
	
//-----------------------------------------------------------------------------------------------
//주소

	//주소 변경 버튼
	function toggleChange_addr() {
    
    const text_a = document.querySelector('input[name="addr_update_text"]');
    const detail_text_a = document.querySelector('input[name="addr_update_detail_text"]');
    const toggleBut_a = document.getElementById('toggle_a');
    const updateBut_a = document.querySelector('input[name="addr_update_button"]');

    if (!change_addr) {
        text_a.type = "text";
        detail_text_a.type = "text";
        updateBut_a.type = "button";
        toggleBut_a.value = "주소 변경 취소";
    } else {
        // 원래 상태로 복구
        text_a.type = "hidden";
        detail_text_a.type = "hidden";
		updateBut_a.type = "hidden";
        toggleBut_a.value = "주소 변경";
    }

    change_addr = !change_addr; // 상태 토글
    
}//toggleChange_addr

	

	//주소변경
	function send_addr(){
	const addr = document.querySelector('input[name="addr_update_text"]').value;
	const detail_addr = document.querySelector('input[name="addr_update_detail_text"]').value;
	const user_idx = document.getElementById("user_idx").value;
	
	if(addr === ''){
		alert("주소를 입력하세요");
		return;
	}
	if(detail_addr === ''){
		alert("상세주소를 입력하세요");
		return;
	}
	
	let total_addr = addr +" "+ detail_addr; 
	
	let url = "update_addr";
	let param = "addr=" + encodeURIComponent(total_addr) + "&user_idx=" + user_idx;
	
	sendRequest(url, param, resultUdtAddr, 'post');
}

	function resultUdtAddr(){
		if(xhr.readyState == 4 && xhr.status == 200){
			let date = xhr.responseText.trim();
			
			if(date === "suc"){
				alert("주소 변경 성공");
			}else if(date === "fail"){
				alert("주소 변경 실패");
				return;
			}else{
				alert("오류 발생 관리자에게 문의하세요");
				return;
			}
			
			
		}
	}
	
		let addr = ''; // 주소 변수
		function addr_search() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}
							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById("addr_update_text").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("addr_update_detail_text").focus();
						}
					}).open();
		}

	
//------------------------------------------------------------------------------------------	
//비밀번호	
	//비밀번호 변경 버튼
	function toggleChange_pwd() {
    
    const toggleBut_p = document.querySelector('#toggle_p');
    const pwd = document.querySelector('input[name="pwd_text"]');
    const new_pwd = document.querySelector('input[name="new_pwd_text"]');
    const pwd_update_button = document.querySelector('input[name="pwd_update_button"]');
    

    if (!change_pwd) {
        toggleBut_p.value = "비밀번호 변경 취소";
        pwd.type = "password";
        new_pwd.type = "password";
        pwd_update_button.type = "button";
    } else {
        // 원래 상태로 복구
        toggleBut_p.value = "비밀번호 변경";
        pwd.type = "hidden";
        new_pwd.type = "hidden";
		pwd_update_button.type = "hidden";
    }

    change_pwd = !change_pwd; // 상태 토글
    
}//toggleChange_pwd
	
	function send_pwd(){
		 const pwd = document.querySelector('input[name="pwd_text"]').value.trim();
		 const new_pwd = document.querySelector('input[name="new_pwd_text"]').value.trim();
		 const user_idx = document.getElementById("user_idx").value;
		 
		 
       let url = "update_pwd";
       let param = "pwd="+pwd+"&new_pwd="+new_pwd + "&user_idx=" + user_idx;
       
       sendRequest(url, param, resultUpdPwd, 'post');	 
}
	function resultUpdPwd(){
		
		if(xhr.readyState == 4 && xhr.status == 200){
			let date = xhr.responseText.trim();
			
			if(date === "suc"){
				alert("비밀번호 변경에 성공했습니다.");
			}else if(date === "fail"){
				alert("비밀번호 변경에 실패하였습니다.");
				return;
			}else{
				alert("오류발생 관리자에게 문의하세요");
				return;
			}
			
		}
		
	}
</script>

</body>
</html>