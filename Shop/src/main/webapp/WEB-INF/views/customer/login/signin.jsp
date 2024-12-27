<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Sign In</title>
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
</head>
<body>

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-110 p-r-110 p-t-62 p-b-33">
				<form class="login100-form validate-form flex-sb flex-w">
					<input type="hidden" value="${redirect }" name="redirect">

					<span class="login100-form-title p-b-53"> Want It </span>

					<div class="p-t-31 p-b-9">
						<span class="txt1"> Username </span>
					</div>
					<div class="wrap-input100 validate-input"
						data-validate="Username is required">
						<input class="input100" type="text" name="id"> <span
							class="focus-input100"></span>
					</div>


					<div class="p-t-13 p-b-9">
						<span class="txt1"> Password </span> <a href="#"
							class="txt2 bo1 m-l-5"> Forgot? </a>
					</div>

					<div class="wrap-input100 validate-input"
						data-validate="Password is required">
						<input class="input100" type="password" name="c_pwd"> <span
							class="focus-input100"></span>
					</div>


					<div class="container-login100-form-btn m-t-17">
						<img alt=".." src="/shop/resources/images/icons/카카오로그인.png"
							style="width: 460px; height: 60px; border-radius: 10px"
							onclick="kakaoLogin();">
					</div>

					<div class="container-login100-form-btn m-t-17">
						<input type="button" class="login100-form-btn" value="Sign Up"
							onclick="send(this.form)" />
					</div>
  
					<div class="w-full text-center p-t-55">
						<span class="txt2"> Not a member? </span> <a href="/shop/signup"
							class="txt2 bo1"> Sign up now </a>
					</div>
				</form>
			</div>
		</div>
	</div>
	<% %>
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
	<script src="/shop/resources/js/signin.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
		//카카오로그인
		function kakaoLogin() {
    $.ajax({
        url: '/shop/setRedirect',  // redirect 값을 세션에 저장하는 엔드포인트
        type: 'post',
        data: { redirect: '${redirect}' },
        success: function(response) {
            // 세션에 redirect 값이 저장된 후 카카오 인증 URL로 리다이렉트
            $.ajax({
                url: '/shop/getKakaoAuthUrl',
                type: 'get',
                async: false,
                dataType: 'text',
                success: function(res) {
                    location.href = res;
                }
            });
        }
    });
}

		$(document).ready(
				function() {

					var kakaoInfo = '${kakaoInfo}';

					if (kakaoInfo != "") {
						var data = JSON.parse(kakaoInfo);

						alert("카카오로그인 성공 \n accessToken : "
								+ data['accessToken']);
						alert("user : \n" + "email : " + data['email']
								+ "\n nickname : " + data['nickname']);
					}
				});
	</script>
</body>
</html>