<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Sign up</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png"
	href="/shop/resources/images/icons/favicon.ico" />
<link rel="stylesheet" type="text/css"
	href="/shop/resources/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="/shop/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="/shop/resources/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<link rel="stylesheet" type="text/css"
	href="/shop/resources/vendor/animate/animate.css">
<link rel="stylesheet" type="text/css"
	href="/shop/resources/vendor/css-hamburgers/hamburgers.min.css">
<link rel="stylesheet" type="text/css"
	href="/shop/resources/vendor/animsition/css/animsition.min.css">
<link rel="stylesheet" type="text/css"
	href="/shop/resources/vendor/select2/select2.min.css">
<link rel="stylesheet" type="text/css"
	href="/shop/resources/vendor/daterangepicker/daterangepicker.css">
<link rel="stylesheet" type="text/css"
	href="/shop/resources/css/util.css">
<link rel="stylesheet" type="text/css"
	href="/shop/resources/css/main.css">

<script>
	function signup(f) {
		
		let email_p = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
		
		if(!email_p.test(f.email.value)){
			alert("잘못된 이메일 형식입니다.");
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
</script>

</head>
<body>

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-110 p-r-110 p-b-33">
				<form class="login100-form validate-form flex-sb flex-w">
					<span class="login100-form-title p-b-53"> Want It </span>

					<div class="p-t-10 p-b-9">
						<span class="txt1"> 아이디 </span>
					</div>
					<div class="wrap-input100 validate-input"
						data-validate="Id is required">
						<input class="input100" type="text" name="id"> <span
							class="focus-input100"></span>
					</div>
					
					<div class="p-t-10 p-b-9">
						<span class="txt1"> 비밀번호 </span>
					</div>
					<div class="wrap-input100 validate-input"
						data-validate="Password is required">
						<input class="input100" type="password" name="pwd"> <span
							class="focus-input100"></span>
					</div>

					<div class="p-t-10 p-b-9">
						<span class="txt1"> 이름 </span>
					</div>
					<div class="wrap-input100 validate-input"
						data-validate="Name is required">
						<input class="input100" type="text" name="name"> <span
							class="focus-input100"></span>
					</div>

					<div class="p-t-10 p-b-9">
						<span class="txt1"> 이메일 </span>
					</div>
					<div class="wrap-input100 validate-input"
						data-validate="Email is required">
						<input class="input100" type="email" name="email"> <span
							class="focus-input100"></span>
					</div>

					<div class="p-t-10 p-b-9">
						<span class="txt1"> 주소 </span>
					</div>
					<div class="wrap-input100 validate-input"
						data-validate="Addr is required">
						<input class="input100" type="text" name="addr"> <span
							class="focus-input100"></span>
					</div>


					<div class="container-login100-form-btn m-t-50">
						<input type="button" class="login100-form-btn" onclick="signup(this.form)" value="Sign Up">
					</div>
				</form>
			</div>
		</div>
	</div>


	<div id="dropDownSelect1"></div>

	<script src="/shop/resources/vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="/shop/resources/vendor/animsition/js/animsition.min.js"></script>
	<script src="/shop/resources/vendor/bootstrap/js/popper.js"></script>
	<script src="/shop/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="/shop/resources/vendor/select2/select2.min.js"></script>
	<script src="/shop/resources/vendor/daterangepicker/moment.min.js"></script>
	<script src="/shop/resources/vendor/daterangepicker/daterangepicker.js"></script>
	<script src="/shop/resources/vendor/countdowntime/countdowntime.js"></script>
	<script src="/shop/resources/js/main.js"></script>
	<script src="/shop/resources/js/httpRequest.js"></script>

</body>
</html>