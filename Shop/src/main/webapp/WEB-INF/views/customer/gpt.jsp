<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Want It</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="/shop/resources/img/파비콘_로고(완).png" />
<!-- Bootstrap icons-->
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

<!-- 구글폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@100..900&display=swap"
	rel="stylesheet">

<style>
.message {
	max-width: 60%;
	padding: 10px;
	margin: 5px;
	border-radius: 10px;
	word-wrap: break-word;
	clear: both;
}

.user {
	background-color: #007bff;
	color: white;
	text-align: right;
	float: right;
}

.bot {
	background-color: #f1f1f1;
	color: black;
	text-align: left;
	float: left;
}
/* 헤더 고정 */
header {
	position: fixed;
	top: 0;
	width: 100%;
	z-index: 1030;
}

body {
	padding-top: 70px; /* 헤더 높이만큼 여백 추가 */
	background-size: cover; /* 배경 이미지를 화면에 맞게 조정 */
	background-repeat: no-repeat; /* 배경 이미지를 반복하지 않음 */
	background-attachment: fixed; /* 배경을 고정하여 스크롤에도 따라오지 않음 */
	background-position: center; /* 배경 이미지의 위치를 가운데로 설정 */
}

.content {
	margin-left: auto;
	margin-right: auto;
	margin-bottom: 80px;
	margin-top: 80px;
	width: 80%;
	height: 600px;
	border-bottom: 5px solid #f8f9fa; 
	border-top: 5px solid #f8f9fa; 
}
</style>

</head>
<body>
	<!-- Header-->
	<header>
		<jsp:include page="../customer/header/header.jsp"></jsp:include>
	</header>

	<div class="content" align="center">
		<div id="gpt"
			style="width: 80%; height: 90%; overflow-y: auto; padding: 10px;"></div>
		<div style="height: 10%;">
			<form onsubmit="ai(this); return false;">
				<input id="msg" name="msg"
					onkeydown="if(event.key==='Enter') { event.preventDefault(); ai(this.form); }">
				<input type="button" value="클릭" onclick="ai(this.form)">
			</form>
		</div>
	</div>

	<!-- Footer-->
	<footer class="pt-4 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">
				Want It<br>대표이사:없음<br>서울특별시 강남구 강남구 테헤란로14길 6<br>후원계좌
				: 국민 852502-04-255054
			</p>
			<p class="m-0 text-center text-white fw-bold" style="font-size: 20px">고객센터
				: 010-3239-5204</p>
		</div>
	</footer>

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="/shop/resources/js/httpRequest.js"></script>

	<script>
		function ai(f) {
			if (f.msg.value.trim() === "") {
				alert("질문을 적어주세요");
				return;
			}

			let gpt = document.getElementById('gpt');

			// 질문 추가
			let userMessage = document.createElement('div');
			userMessage.innerText = "User: " + f.msg.value;
			userMessage.className = "message user"; // CSS 스타일 적용
			gpt.appendChild(userMessage);

			// 서버 요청
			let param = "msg=" + encodeURIComponent(f.msg.value);
			let url = "gpt";

			sendRequest(url, param, gptFn, "GET");

			// 입력 필드 비우기
			f.msg.value = "";

			// 스크롤 아래로 자동 이동
			gpt.scrollTop = gpt.scrollHeight;
		}

		function gptFn() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				let data = xhr.responseText;
				let gpt = document.getElementById('gpt');

				// GPT 응답 추가
				let botMessage = document.createElement('div');
				botMessage.innerText = "Ai: " + data;
				botMessage.className = "message bot"; // CSS 스타일 적용
				gpt.appendChild(botMessage);

				// 스크롤 아래로 자동 이동
				gpt.scrollTop = gpt.scrollHeight;
			}
		}
	</script>

</body>
</html>