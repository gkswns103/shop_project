<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head> 

<body>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="/shop/">Want It</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdown" 
						onclick="location.href='/shop/fashion.do?product=의류&category='"
						role="button" aria-expanded="false">의류</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="/shop/fashion.do?product=의류&category=겉옷">겉옷</a></li>
							<li><a class="dropdown-item" href="/shop/fashion.do?product=의류&category=상의">상의</a></li>
							<li><a class="dropdown-item" href="/shop/fashion.do?product=의류&category=하의">하의</a></li>
							<li><a class="dropdown-item" href="/shop/fashion.do?product=의류&category=잠옷속옷">잠옷 ⦁ 속옷</a></li>
							<li><a class="dropdown-item" href="/shop/fashion.do?product=의류&category=신발">신발</a></li>
						</ul></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdown" 
						onclick="location.href='/shop/food.do?product=식품&category='"
						role="button" aria-expanded="false">식품</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="/shop/food.do?product=식품&category=육류">육류</a></li>
							<li><a class="dropdown-item" href="/shop/food.do?product=식품&category=채소">채소</a></li>
							<li><a class="dropdown-item" href="/shop/food.do?product=식품&category=조미료">조미료</a></li>
						</ul></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdown"
						onclick="location.href='/shop/electronic.do?product=전자&category='"
						role="button" aria-expanded="false">전자
							⦁ 가전</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="/shop/electronic.do?product=전자&category=TV">TV</a></li>
							<li><a class="dropdown-item" href="/shop/electronic.do?product=전자&category=냉장고">냉장고</a></li>
							<li><a class="dropdown-item" href="/shop/electronic.do?product=전자&category=세탁기">세탁기</a></li>
							<li><a class="dropdown-item" href="/shop/electronic.do?product=전자&category=건조기">건조기</a></li>
							<li><a class="dropdown-item" href="/shop/electronic.do?product=전자&category=청소기">청소기</a></li>
							<li><a class="dropdown-item" href="/shop/electronic.do?product=전자&category=PC">PC</a></li>
							<li><a class="dropdown-item" href="/shop/electronic.do?product=전자&category=휴대폰">휴대폰</a></li>
						</ul></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdown"
						onclick="location.href='/shop/interior.do?product=인테리어&category='"
						role="button" aria-expanded="false">인테리어</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="/shop/interior.do?product=인테리어&category=디퓨저">디퓨저</a></li>
							<li><a class="dropdown-item" href="/shop/interior.do?product=인테리어&category=침구류">침구류</a></li>
							<li><a class="dropdown-item" href="/shop/interior.do?product=인테리어&category=커튼블라인드">커튼 ⦁ 블라인드</a></li>
							<li><a class="dropdown-item" href="/shop/interior.do?product=인테리어&category=조명">조명</a></li>
							<li><a class="dropdown-item" href="/shop/interior.do?product=인테리어&category=생활용품">생활용품</a></li>
							<li><a class="dropdown-item" href="/shop/interior.do?product=인테리어&category=가구">가구</a></li>
						</ul></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdown"
						onclick="location.href='/shop/baby.do?product=유아&category='"
						role="button" aria-expanded="false">유아</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="/shop/baby.do?product=유아&category=생필품">생필품</a></li>
							<li><a class="dropdown-item" href="/shop/baby.do?product=유아&category=완구">완구</a></li>
							<li><a class="dropdown-item" href="/shop/baby.do?product=유아&category=가구">가구</a></li>
							<li><a class="dropdown-item" href="/shop/baby.do?product=유아&category=식품">식품</a></li>
						</ul></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdown"
						onclick="location.href='/shop/hobby.do?product=취미&category='"
						role="button" aria-expanded="false">취미</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="/shop/hobby.do?product=취미&category=생필품">생필품</a></li>
							<li><a class="dropdown-item" href="/shop/hobby.do?product=취미&category=완구">완구</a></li>
							<li><a class="dropdown-item" href="/shop/hobby.do?product=취미&category=가구">가구</a></li>
							<li><a class="dropdown-item" href="/shop/hobby.do?product=취미&category=식품">식품</a></li>
						</ul></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdown"
						onclick="location.href='/shop/pet.do?product=반려동물&category='"
						role="button" aria-expanded="false">반려동물</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="/shop/pet.do?product=반려동물&category=생필품">생필품</a></li>
							<li><a class="dropdown-item" href="/shop/pet.do?product=반려동물&category=완구">완구</a></li>
							<li><a class="dropdown-item" href="/shop/pet.do?product=반려동물&category=가구">가구</a></li>
							<li><a class="dropdown-item" href="/shop/pet.do?product=반려동물&category=식품">식품</a></li>
						</ul></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdown"
						onclick="location.href='/shop/life.do?product=생활용품&category='"
						role="button" aria-expanded="false">생활용품</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="/shop/life.do?product=생활용품&category=생필품">생필품</a></li>
							<li><a class="dropdown-item" href="/shop/life.do?product=생활용품&category=완구">완구</a></li>
							<li><a class="dropdown-item" href="/shop/life.do?product=생활용품&category=가구">가구</a></li>
							<li><a class="dropdown-item" href="/shop/life.do?product=생활용품&category=식품">식품</a></li>
						</ul></li>
				</ul>
				
				<c:if test="${empty users}">
				<a href="/shop/signin" class="nav-link active me-3">SignIn</a> <a
					href="/shop/signup" class="nav-link active me-3">SignUp</a>
				</c:if>
				<c:if test="${!empty users}">
					<a href="#" class="nav-link active me-3">${users.name}님 환영합니다</a>
					<a href="logout" class="nav-link active me-3">로그아웃</a>
				</c:if>
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
					homepage template</p>
			</div>
		</div>
	</header>
</body>
</html>