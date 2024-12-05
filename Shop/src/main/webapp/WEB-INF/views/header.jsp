<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="#!">Want It</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">의류</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#!">겉옷</a></li>
							<li><a class="dropdown-item" href="#!">상의</a></li>
							<li><a class="dropdown-item" href="#!">하의</a></li>
							<li><a class="dropdown-item" href="#!">잠옷 ⦁ 속옷</a></li>
							<li><a class="dropdown-item" href="#!">신발</a></li>
						</ul></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">식품</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#!">육류</a></li>
							<li><a class="dropdown-item" href="#!">채소</a></li>
							<li><a class="dropdown-item" href="#!">조미료</a></li>
						</ul></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">전자
							⦁ 가전</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#!">TV</a></li>
							<li><a class="dropdown-item" href="#!">냉장고</a></li>
							<li><a class="dropdown-item" href="#!">세탁기</a></li>
							<li><a class="dropdown-item" href="#!">건조기</a></li>
							<li><a class="dropdown-item" href="#!">청소기</a></li>
							<li><a class="dropdown-item" href="#!">PC</a></li>
							<li><a class="dropdown-item" href="#!">휴대폰</a></li>
						</ul></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">인테리어</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#!">디퓨저</a></li>
							<li><a class="dropdown-item" href="#!">침구류</a></li>
							<li><a class="dropdown-item" href="#!">커튼 ⦁ 블라인드</a></li>
							<li><a class="dropdown-item" href="#!">조명</a></li>
							<li><a class="dropdown-item" href="#!">생활용품</a></li>
							<li><a class="dropdown-item" href="#!">가구</a></li>
						</ul></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">유아</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#!">생필품</a></li>
							<li><a class="dropdown-item" href="#!">완구</a></li>
							<li><a class="dropdown-item" href="#!">가구</a></li>
							<li><a class="dropdown-item" href="#!">식품</a></li>
						</ul></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">취미</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#!">생필품</a></li>
							<li><a class="dropdown-item" href="#!">완구</a></li>
							<li><a class="dropdown-item" href="#!">가구</a></li>
							<li><a class="dropdown-item" href="#!">식품</a></li>
						</ul></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">반려동물</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#!">생필품</a></li>
							<li><a class="dropdown-item" href="#!">완구</a></li>
							<li><a class="dropdown-item" href="#!">가구</a></li>
							<li><a class="dropdown-item" href="#!">식품</a></li>
						</ul></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">생활용품</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#!">생필품</a></li>
							<li><a class="dropdown-item" href="#!">완구</a></li>
							<li><a class="dropdown-item" href="#!">가구</a></li>
							<li><a class="dropdown-item" href="#!">식품</a></li>
						</ul></li>
				</ul>

				<a href="#" class="nav-link active me-3">LogIn</a> <a href="#"
					class="nav-link active me-3">LogOut</a>
				<form class="d-flex">
					<button class="btn btn-outline-dark" type="submit">
						<i class="bi-cart-fill me-1"></i> Cart <span
							class="badge bg-dark text-white ms-1 rounded-pill">0</span>
					</button>
				</form>
			</div>
		</div>
	</nav>
	<!-- Header-->
	<header class="py-5"
		style="background-image: url('/shop/resources/img/당근.jpg')">
		<div class="container px-4 px-lg-5 my-5">
			<div class="text-center text-white">
				<h1 class="display-4 fw-bolder">Shop in style</h1>
				<p class="lead fw-normal text-white-50 mb-0">With this shop
					hompeage template</p>
			</div>
		</div>
	</header>
</body>
</html>