<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<!DOCTYPE html>
<html>

<meta charset="UTF-8">
<title>Insert title here</title>
<head>
<link rel="icon" type="image/x-icon"
	href="/shop/resources/img/favicon.ico" />
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
<link href="/shop/resources/css/productDetail.css" rel="stylesheet" />
</head>

<body>
	<jsp:include page="../header/header.jsp"></jsp:include>

	<input type="hidden" value=${vo.product_idx } name="product_idx">
	<input type="hidden" value=${vo.selleridx } name="selleridx">
	<input type="hidden" value=${vo.inventory } id="inventory">

	<div class="container1">
		<div class="small1">
			<a href="/shop/">홈</a> > <a
				href="/shop/product?division=${vo.division}&category=">${vo.division}</a>
			> <a
				href="/shop/product?division=${vo.division}&category=${vo.category}">${vo.category}</a>
			<br> <br> <img alt=""
				src="/shop/resources/img/${vo.filepath }">

		</div>

		<div class="small2">
			<h4>${vo.name }</h4> 
			<hr>
			 <fmt:formatNumber value="${vo.price}" type="number" groupingUsed="true"/>원 ( 할인율 : ${vo.discount }% )<br> 남은수량 :
			${vo.inventory }개
			<hr>
			배송비 : <br>
			<hr>

			${vo.explain }

			<div class="counter-container">
				<input id="amount" name="amount" value="1">

				<button id="decrease" onclick="decrease()">▼</button>
				<button id="increase" onclick="increase()">▲</button>
				<input type="button" value="장바구니 담기" onclick="cartAdd()"> <input
					type="button" value="바로 구매" onclick="buyNow()">
			</div>
			
		</div>
	
	</div>
	
	<div class="details-container">
	    <ul class="tab-menu">
	        <li onclick="showTab(0)" class="active">상품상세</li>
	        <li onclick="showTab(1)">상품평</li>
	        <li onclick="showTab(2)">상품문의</li>
	        <li onclick="showTab(3)">교환/반품</li>
	    </ul>
	    
	    <div class="tab-content">
	        <div class="tab-view" id="tab-0">
	        	상품 상세 내용
	        </div>
	        <div class="tab-view" id="tab-1" style="display: none;">
	        	상품평 <br>
	        	<input type="button" value="상품평 쓰기 " onclick="location.href='/shop/purchaseList?user_idx=${users.user_idx}'" >
	        </div>
	        <div class="tab-view" id="tab-2" style="display: none;">
	       		상품문의 내용
	        </div>
	        <div class="tab-view" id="tab-3" style="display: none;">
	        	교환/반품 내용
	        </div>
	    </div>
	</div>
	
	<footer class="py-5 bg-dark">
		<div class="container">
			 <p class="m-0 text-center text-white fw-bold" style="font-size: 20px">고객센터 : 010-3239-5204</p>
         <p class="m-0 text-center text-white">Want It<br>대표이사:없음<br>서울특별시 강남구 강남구 테헤란로14길 6<br>후원계좌 : 국민 852502-04-255054 </p>
		</div>
	</footer>
	
	<script src="/shop/resources/js/amount_counter.js"></script>
	<script src="/shop/resources/js/httpRequest.js"></script>
	<script>
	
	window.onload=function(){
		showTab(0);
	}
	
	function showTab(index) {
	    let tabs = document.querySelectorAll(".tab-view");
	    let menuItems = document.querySelectorAll(".tab-menu li");

	    // 모든 탭 내용을 숨김
	    tabs.forEach((tab) => (tab.style.display = "none"));

	    // 모든 메뉴에서 'active' 클래스 제거
	    menuItems.forEach((item) => item.classList.remove("active"));

	    // 선택된 탭 표시 및 메뉴 활성화
	    tabs[index].style.display = "block";
	    menuItems[index].classList.add("active");
	}
	
	function buyNow(){
		if(${empty users}){
			 alert("로그인이 필요한 서비스입니다");
			 //현재 url 가져오기
			 let currentUrl = window.location.href;
			 location.href = "signin_form?redirect="+currentUrl;
		     return;
		}
		 let quantity=document.getElementById("amount").value;
		 location.href="/shop/buyNow?inventory=${vo.inventory}&user_idx=${sessionScope.users.user_idx}&product_idx=${vo.product_idx}&quantity="+quantity+"&name=${vo.name}&price=${vo.price}&discount=${vo.discount}&filepath=${vo.filepath}";
		
	}
	function cartAdd(){
		if(${empty users}){
				 alert("로그인이 필요한 서비스입니다");
				//현재 url 가져오기
				 let currentUrl = encodeURIComponent(window.location.href);
				 location.href = "signin_form?redirect="+currentUrl;
			     return;
			}
		    
		    let quantity=document.getElementById("amount").value;
		   
		    let url="cart_insert";
		    let param="inventory=${vo.inventory}&user_idx=${sessionScope.users.user_idx}&product_idx=${vo.product_idx}&quantity="+quantity+"&name=${vo.name}&price=${vo.price}&discount=${vo.discount}&filepath=${vo.filepath}";
		
		    sendRequest(url,param,addFn,"post");
	}
			
			function addFn(){
				if(xhr.readyState==4 && xhr.status == 200){
					let data=xhr.responseText;
					if(data =='fail'){
						alert("장바구니에 넣지못함");
						return;
					}else if(data=='duplicate'){
						alert("이미 장바구니에 있습니다");
					}else if(data =='success') {
						 if (confirm("장바구니에 넣었습니다. 장바구니로 이동하시겠습니까?")) {
						        location.href='/shop/cart?user_idx=${sessionScope.users.user_idx}';
						    }
					}
			
				
				}
			}
	</script>
</body>
</html>