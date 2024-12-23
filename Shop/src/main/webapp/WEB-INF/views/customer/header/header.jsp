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
         <a class="navbar-brand" href="/shop/"><img src="/shop/resources/images/icons/로고.png" style="width:50px; height:50px;">Want It</a>
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
                  onclick="location.href='/shop/product?division=의류&category='"
                  role="button" aria-expanded="false">의류</a>
                  
                  <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                     <li><a class="dropdown-item" href="/shop/product?division=의류&category=남성">남성</a></li>
                     <li><a class="dropdown-item" href="/shop/product?division=의류&category=여성">여성</a></li>
                     <li><a class="dropdown-item" href="/shop/product?division=의류&category=유아">유아</a></li>
                     <li><a class="dropdown-item" href="/shop/product?division=의류&category=잠옷">잠옷</a></li>
                     <li><a class="dropdown-item" href="/shop/product?division=의류&category=속옷">속옷</a></li>
                     <li><a class="dropdown-item" href="/shop/product?division=의류&category=신발">신발</a></li>
                  </ul>
                 </li>

               <li class="nav-item dropdown"><a
                  class="nav-link dropdown-toggle" id="navbarDropdown" 
                  onclick="location.href='/shop/product?division=식품&category='"
                  role="button" aria-expanded="false">식품</a>
                  <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                     <li><a class="dropdown-item" href="/shop/product?division=식품&category=육류">육류</a></li>
                     <li><a class="dropdown-item" href="/shop/product?division=식품&category=채소">채소</a></li>
                     <li><a class="dropdown-item" href="/shop/product?division=식품&category=해산물">해산물</a></li>
                     <li><a class="dropdown-item" href="/shop/product?division=식품&category=조미료">조미료</a></li>
                  </ul></li>

               <li class="nav-item dropdown"><a
                  class="nav-link dropdown-toggle" id="navbarDropdown"
                  onclick="location.href='/shop/product?division=전자&category='"
                  role="button" aria-expanded="false">전자
                     ⦁ 가전</a>
                  <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                     <li><a class="dropdown-item" href="/shop/product?division=전자&category=TV">TV</a></li>
                     <li><a class="dropdown-item" href="/shop/product?division=전자&category=냉장고">냉장고</a></li>
                     <li><a class="dropdown-item" href="/shop/product?division=전자&category=세탁기">세탁기</a></li>
                     <li><a class="dropdown-item" href="/shop/product?division=전자&category=건조기">건조기</a></li>
                     <li><a class="dropdown-item" href="/shop/product?division=전자&category=청소기">청소기</a></li>
                     <li><a class="dropdown-item" href="/shop/product?division=전자&category=PC">PC</a></li>
                     <li><a class="dropdown-item" href="/shop/product?division=전자&category=휴대폰">휴대폰</a></li>
                  </ul></li>

               <li class="nav-item dropdown"><a
                  class="nav-link dropdown-toggle" id="navbarDropdown"
                  onclick="location.href='/shop/product?division=인테리어&category='"
                  role="button" aria-expanded="false">인테리어</a>
                  <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                     <li><a class="dropdown-item" href="/shop/product?division=인테리어&category=디퓨저">디퓨저</a></li>
                     <li><a class="dropdown-item" href="/shop/product?division=인테리어&category=침구류">침구류</a></li>
                     <li><a class="dropdown-item" href="/shop/product?division=인테리어&category=커튼">커튼</a></li>
                     <li><a class="dropdown-item" href="/shop/product?division=인테리어&category=조명">조명</a></li>
                     <li><a class="dropdown-item" href="/shop/product?division=인테리어&category=생활용품">생활용품</a></li>
                     <li><a class="dropdown-item" href="/shop/product?division=인테리어&category=욕실용품">욕실용품</a></li>
                     <li><a class="dropdown-item" href="/shop/product?division=인테리어&category=가구">가구</a></li>
                     <li><a class="dropdown-item" href="/shop/product?division=인테리어&category=원예">원예</a></li>
                     <li><a class="dropdown-item" href="/shop/product?division=인테리어&category=셀프인테리어">셀프인테리어</a></li>
                  </ul></li>

               <li class="nav-item dropdown"><a
                  class="nav-link dropdown-toggle" id="navbarDropdown"
                  onclick="location.href='/shop/product?division=유아&category='"
                  role="button" aria-expanded="false">유아</a>
                  <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                     <li><a class="dropdown-item" href="/shop/product?division=유아&category=생필품">생필품</a></li>
                     <li><a class="dropdown-item" href="/shop/product?division=유아&category=완구">완구</a></li>
                     <li><a class="dropdown-item" href="/shop/product?division=유아&category=가구">가구</a></li>
                     <li><a class="dropdown-item" href="/shop/product?division=유아&category=식품">식품</a></li>
                  </ul></li>

               <li class="nav-item dropdown"><a
                  class="nav-link dropdown-toggle" id="navbarDropdown"
                  onclick="location.href='/shop/product?division=취미&category='"
                  role="button" aria-expanded="false">취미</a>
                  <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                     <li><a class="dropdown-item" href="/shop/product?division=취미&category=스포츠">스포츠</a></li>
                     <li><a class="dropdown-item" href="/shop/product?division=취미&category=헬스">헬스</a></li>
                     <li><a class="dropdown-item" href="/shop/product?division=취미&category=용품">용품</a></li>
                     <li><a class="dropdown-item" href="/shop/product?division=취미&category=자전거">자전거</a></li>
                     <li><a class="dropdown-item" href="/shop/product?division=취미&category=낚시">낚시</a></li>
                  </ul></li>


               <li class="nav-item dropdown"><a
                  class="nav-link dropdown-toggle" id="navbarDropdown"
                  onclick="location.href='/shop/product?division=반려동물&category='"
                  role="button" aria-expanded="false">반려동물</a>
                  <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                     <li><a class="dropdown-item" href="/shop/product?division=반려동물&category=반려식품">반려식품</a></li>
                     <li><a class="dropdown-item" href="/shop/product?division=반려동물&category=반려용품">반려용품</a></li>
                     <li><a class="dropdown-item" href="/shop/product?division=반려동물&category=반려의류">반려의류</a></li>
                  </ul></li>

               <li class="nav-item dropdown"><a
                  class="nav-link dropdown-toggle" id="navbarDropdown"
                  onclick="location.href='/shop/product?division=생활용품&category='"
                  role="button" aria-expanded="false">생활용품</a>
                  <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                     <li><a class="dropdown-item" href="/shop/product?division=생활용품&category=생활">생활</a></li>
                     <li><a class="dropdown-item" href="/shop/product?division=생활용품&category=주방">주방</a></li>
                     <li><a class="dropdown-item" href="/shop/product?division=생활용품&category=청소">청소</a></li>
                     <li><a class="dropdown-item" href="/shop/product?division=생활용품&category=빨래">빨래</a></li>
                  </ul></li>
                  
               <li class="nav-item dropdown"><a
                  class="nav-link dropdown-toggle" id="navbarDropdown"
                  onclick="location.href='/shop/product?division=뷰티&category='"
                  role="button" aria-expanded="false">뷰티</a>
                  <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                     <li><a class="dropdown-item" href="/shop/product?division=뷰티&category=화장품">화장품</a></li>
                     <li><a class="dropdown-item" href="/shop/product?division=뷰티&category=스킨케어">스킨케어</a></li>
                     <li><a class="dropdown-item" href="/shop/product?division=뷰티&category=향수">향수</a></li>
                  </ul>
               </li>
            </ul>
            
             <c:if test="${empty users}"> 
            <a href="signin_form" class="nav-link active me-3">SignIn</a> <a
               href="signup" class="nav-link active me-3">SignUp</a>
            </c:if>
            
            <c:if test="${!empty users}">
               <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
               	  <li class="nav-item dropdown">
               		  <a class="nav-link dropdown-toggle" id="navbarDropdown"
                  onclick="" role="button" aria-expanded="false">${users.name}님 </a>
               		  <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
               		  <li><a class="dropdown-item" href="purchaseList?user_idx=${users.user_idx }">주문목록</a></li>
               		  <li><a class="dropdown-item">찜목록</a></li>
               		  <li><a class="dropdown-item" href="registerForm">상품등록</a></li>
               		  <li><a class="dropdown-item" href="my_imformation?user_idx=${users.user_idx}">내정보</a></li>
               		  </ul>
               	  </li>
               </ul>
               <a href="logout" class="nav-link active me-3">로그아웃</a>
            </c:if>

            <c:if test="${!empty users}">
	            <form class="d-flex">
	               <a href="/shop/cart?user_idx=${sessionScope.users.user_idx}" class="btn btn-outline-dark">
	   				  <i class="bi-cart-fill me-1"></i> Cart 
	   				  <span class="badge bg-dark text-white ms-1 rounded-pill">${sessionScope.cart_count }</span>
				   </a>
	            </form>
            </c:if>

            
         </div>
      </div>
   </nav>
</body>
</html>