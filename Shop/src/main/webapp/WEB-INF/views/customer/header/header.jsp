<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="/shop/resources/css/header.css">

<link rel="preconnect" href="https://fonts.googleapis.com">

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@100..900&display=swap" rel="stylesheet">
<link
   href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@100..900&display=swap"
   rel="stylesheet">
   <style>
      .container px-4 px-lg-10{
      max-width: 600px;
      }
      .collapse navbar-collapse{
      margin-left:100px;}
      
      
   </style>

</head>

<body>
    <!-- Navigation-->
   <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <div class="container px-4 px-lg-10">
         <a class="navbar-brand ms-0" href="/shop/"><img
            src="/shop/resources/images/icons/로고수정.png"
            style="width: 50px; height: 50px;">Want It</a>

         <button class="navbar-toggler" type="button"
            data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation" style="margin-right:200px;">
            <span class="navbar-toggler-icon"></span>
         </button>

         <div class="collapse navbar-collapse" id="navbarSupportedContent" style="margin-left:100px;">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4" id="navbar">
               <!-- JavaScript로 메뉴 생성 -->
            </ul>

         </div>
         
      </div>

         <form class="d-flex me-auto ms-auto" style="width: 400px;"
            action="product_search">
            <input style="width:300px;" class="form-control me-2" type="search" name="search"
               placeholder="검색어를 입력해주세요." aria-label="Search"> <input
               class="btn btn-outline-dark px-2" type="button" value="검 색"
               onclick="product_search(this.form)">
         </form>

         
            <c:if test="${empty users}">
               <a onclick="signin_form()" class="nav-link active me-3 ms-3">로그인</a>
               <a href="signup" class="nav-link active me-3 ms-3">회원가입</a>
            </c:if>

            <c:if test="${!empty users}">
               <ul class="navbar-nav me-3 mb-2 mb-lg-0 ms-lg-4">
                  <li class="nav-item dropdown"><a
                     class="nav-link dropdown-toggle me-0" id="navbarDropdown"
                     role="button" aria-expanded="false">${users.name}님</a>
                     <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item"
                           href="purchaseList?user_idx=${users.user_idx}">주문목록</a></li>
                        <li><a class="dropdown-item" href="interest?user_idx=${users.user_idx}">관심목록</a></li>
                        <li><a class="dropdown-item" href="registerForm">상품등록</a></li>
                        <li><a class="dropdown-item" href="">상품등록 수정</a></li>
                        <li><a class="dropdown-item" href="my_imformation?user_idx=${users.user_idx}">내정보</a></li>
                     </ul></li>
               </ul>
               <a style=" max-width: 70px; min-width: 70px;" onclick="logout();" class="nav-link active me-3">로그아웃</a>
         
                  <form class="d-flex ms-auto">
                     <a href="/shop/cart?user_idx=${sessionScope.users.user_idx}"
                        class="btn btn-outline-dark"> <i class="bi-cart-fill me-1"></i>
                        Cart <span class="badge bg-dark text-white ms-1 rounded-pill">${sessionScope.cart_count }</span>
                     </a>
                  </form>
               </c:if>
   </nav> 
               
   <script src="/shop/resources/js/header.js"></script>
    <script src="/shop/resources/js/httpRequest.js"></script>
    <script>
         function signin_form(){
             let currentUrl = encodeURIComponent(window.location.href);
          location.href = "signin_form?redirect="+currentUrl;
           return;
         }
         
         function logout(){
             let currentUrl = encodeURIComponent(window.location.href);
             
           let url="logout";
           let param="redirect="+currentUrl;
           
           sendRequest(url,param,logoutLog,"post");
            
         }
         function logoutLog(){
             if (xhr.readyState == 4 && xhr.status == 200) {
               let data = xhr.responseText;
               
               location.href= data;
            
            }
         }
         
         function product_search(f) {
         if(f.search.value==""){
            alert("검색어를 입력하세요");
            return;
         }
         f.submit();
         }
         

   </script>




</body>
</html>