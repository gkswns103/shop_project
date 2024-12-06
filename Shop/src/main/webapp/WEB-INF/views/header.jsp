<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head> 

<body>
	<c:forEach var="menu" items="${menu }">
		${menu.category }
	</c:forEach>

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
   <header class="py-5" id="headerImg"> 
      <div class="container px-4 px-lg-5 my-5">
          <div class="text-center text-white">
            <h1 class="display-4 fw-bolder"> </h1>
            <p class="lead fw-normal text-white-50 mb-0"> </p>
         </div>
      </div>
   </header>
</body>
</html>