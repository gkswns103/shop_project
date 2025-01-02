<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Shop Home</title>
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
<!-- 상품 애니메이션 -->
<link href="/shop/resources/dist/aos.css" rel="stylesheet" />


<!-- 구글폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@100..900&display=swap" rel="stylesheet">

<style>
   /* 헤더 고정 */
   header {
       position: fixed;
       top: 0;
       width: 100%;
       z-index: 1030;
   }
   body {
       padding-top: 70px; /* 헤더 높이만큼 여백 추가 */
      /*  background-image: url('/shop/resources/img/배경예시.jpg') ; */
      background-color: white;
       background-size: cover; /* 배경 이미지를 화면에 맞게 조정 */
  	   background-repeat: no-repeat; /* 배경 이미지를 반복하지 않음 */
   	   background-attachment: fixed; /* 배경을 고정하여 스크롤에도 따라오지 않음 */
       background-position: center; /* 배경 이미지의 위치를 가운데로 설정 */
   }
   
 .section-container {
      display: flex; /* 가로 정렬 */
      justify-content: center; /* 컨테이너 중앙 정렬 */
      align-items: flex-start; /* 상단 정렬 */
   }

   /* recentView 고정 위치 */
   .recentView {
      position: fixed; /* 화면에 고정 */
      top: 50%; /* 화면 중앙 */
      transform: translateY(-50%); /* 정확히 중앙 배치 */
      right: 20px; /* 오른쪽 여백 */
      background-color: #f8f9fa; /* 배경색 */
      padding: 10px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      border-radius: 8px;
      z-index: 1000; /* 다른 요소 위로 올리기 */
   }

   /* 섹션 스타일 */
   .py-5 {
      flex: 1; /* 남은 공간을 차지 */
      margin-right: 220px; /* recentView와 간격 */
   }
     .py-5 {
      transform: scale(1); /* 75% 크기로 축소 */
      transform-origin: top center; /* 축소 기준점 */
   }

   /* 추가적인 마진 조정 */
   .py-5 .container {
      margin-top: 20px; /* 여백 조정 */
   }
</style>



</head>
<body>

   <!-- Header-->
  <header>
   <jsp:include page="./customer/header/header.jsp"></jsp:include>
   </header>
   <div class="headerimg">
     <jsp:include page="./customer/header/headerImg.jsp"></jsp:include>
     </div>
   <!-- Section-->
   <section class="py-5">
      <div class="container px-4 px-lg-5 mt-5">
         <div
            class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
            <!-- 상품 1개 시작 -->
           
            <c:forEach var="vo" items="${list}">
               <div class="col mb-5" data-aos="fade-up">
                  <div class="card h-100">
                     <!-- Product image-->
                     <img class="card-img-top" src="/shop/resources/img/${vo.filepath}"
                        alt="..." onclick="location.href='/shop/detail?product_idx=${vo.product_idx}'"/>
                     <!-- Product details-->
                     <div class="card-body p-4">
                        <div class="text-center">
                           <!-- Product name-->
                           <h5 class="fw-bolder">${vo.name}</h5>
                           <!-- Product price-->
                           <fmt:formatNumber value="${vo.price}" type="number" groupingUsed="true"/>원
                        </div>
                     </div>
                  </div>
               </div>
            </c:forEach>
            <!--상품 1개 끝  -->
            </div>
         </div>
      
   </section>
      <div class="recentView" style="text-align: center; margin-right: 80px; margin-top: 120px;">
	    <h5>최근 본 상품</h5>
	    <ul style="list-style: none; padding: 0; margin: 0;">
	        <c:forEach var="product" items="${sessionScope.viewedProducts}">
	            <li>
	                <a href="/shop/detail?product_idx=${product.product_idx}">
	                    <img src="/shop/resources/img/${product.filepath}" style="width:50px;">
	                </a>
	            </li>
	        </c:forEach>
	    </ul>
      </div>
   <!-- Footer-->
   <footer class="py-5 bg-dark" style="width: 100%;">
      <div class="container">
         <p class="m-0 text-center text-white">Want It<br>대표이사:없음<br>서울특별시 강남구 강남구 테헤란로14길 6<br>후원계좌 : 국민 852502-04-255054 </p>
         <p class="m-0 text-center text-white fw-bold" style="font-size: 20px">고객센터 : 010-3239-5204</p>
      </div>
   </footer>
   <!-- Bootstrap core JS-->
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
   <!-- Core theme JS-->
   <script src="/shop/resources/js/scripts.js"></script>
   <script src="/shop/resources/dist/aos.js"></script>
   
   <script>
   		window.onload = function(){
   			var res = '${param.res}';
   			if (res != null && res != '') {
   			    alert("상품 등록 완료");
   			}
   		}
   </script>
   
   <!-- 상품 애니메이션 -->
   <script>
    AOS.init({
        duration: 800, // 애니메이션 지속 시간 (밀리초)
        easing: 'ease-in-out', // 애니메이션 효과
        once: false, // 애니메이션을 한 번만 실행
    });
</script>
   
</body>
</html>