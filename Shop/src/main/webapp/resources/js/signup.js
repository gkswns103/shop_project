
	let code;
	
	let emailch = false;
	
	
	function signup(f) {
		
		if(f.id.value == ""){
			alert("아이디를 입력해주세요");
			return;
		}
		
		if(f.pwd.value == ""){
			alert("비밀번호를 입력해주세요");
			return;
		}
		
		if(f.name.value == ""){
			alert("이름를 입력해주세요");
			return;
		}
		
		if(f.addr.value == ""){
			alert("주소를 입력해주세요");
			return;
		}
		
		
		if(!emailch){
			alert("이메일 인증을 해주세요");
			return;
		}
		
		let url = "signup_form";
		let param = "id=" + encodeURIComponent(f.id.value) + "&pwd=" + encodeURIComponent(f.pwd.value) + "&name=" + f.name.value + "&email=" + f.email.value + "&addr=" +f.addr.value;
		
		sendRequest(url,param,signupFn,"POST");
	}
	
	function signupFn() {
		if(xhr.readyState == 4 && xhr.status == 200){
			let msg = xhr.responseText;
			alert(msg);
			if(msg == "가입 성공"){
				location.href="/shop/signin_form"
			}
			else{
				return;
			}
		}
	}

	function sendEmail() {
		let email = document.getElementById('email').value;
		
		let email_p = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
		
		if (email == '') {
			alert("이메일을 작성해주세요");
			return;
		}
		
		if(!email_p.test(email)){
			alert("잘못된 이메일 형식입니다.");
			return;
		}
		
		if(!email.includes('@naver.com')){
			alert("네이버메일만 가능합니다");
			return;
		}

		let url = "send_mail";
		let param = "email=" + email;

		sendRequest(url, param, emailFn, "POST");
	}

	function emailFn() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			code = xhr.responseText;
			let verift = document.getElementById("veriftcode");
			verift.removeAttribute("readonly");
		}
	}
	
	function codecheck() {
		let verift = document.getElementById("veriftcode");
		
		if(code == verift.value){
			verift.setAttribute("readonly",true);
			alert("인증 성공");
			emailch = true;
		}
		else{
			alert("인증번호가 다릅니다.");
			return;
		}
	}