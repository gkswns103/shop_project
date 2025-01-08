<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
			<span style="font-weight: bold; font-size: 20px; margin-right: 10px;">${vo.name }</span>
 			<!-- 관심 상품 여부에 따라 이미지 변경 -->
		    <c:if test="${isInterest}">
		        <img id="productImage" src="/shop/resources/images/02.jpg" onclick="toggleHeart(${vo.product_idx}, ${sessionScope.users.user_idx})">
		    </c:if>
		    <c:if test="${!isInterest}">
		        <img id="productImage" src="/shop/resources/images/01.jpg" onclick="toggleHeart(${vo.product_idx}, ${sessionScope.users.user_idx})">
		    </c:if>
			<hr>
			${vo.price }원 ( 할인율 : ${vo.discount }% )<br> 남은수량 :
			${vo.inventory }개
			<hr>
			배송비 : <br>
			<hr>

			${vo.explain }

			<div class="counter-container">
				<input id="amount" name="amount" value="1" onchange="amountAlert()">

				<button id="decrease" onclick="decrease()">▼</button>
				<button id="increase" onclick="increase()">▲</button>
				<input type="button" value="장바구니 담기" onclick="cartAdd()"> 
				<input type="button" value="바로 구매" onclick="buyNow()">
				
			</div>
			
		</div>
		
	</div>
	
	<div class="details-container">
	    <ul class="tab-menu">
	        <li onclick="showTab(0)" class="active">상품상세</li>
	        <li onclick="showTab(1)">상품평 (${count})</li>
	        <li onclick="showTab(2)">상품문의</li>
	        <li onclick="showTab(3)">교환/반품</li>
	    </ul>
	    
	    <div class="tab-content">
	        <div class="tab-view" id="tab-0">
	        	상품 상세 내용
	        </div>
	        
	        <div class="tab-view" id="tab-1" style="display: none;">
	        	
	        	<div>
	        	<input type="button" value="추천순">
	        	<input type="button" value="최신순">
	        	</div>
	        	
	        	<div style="padding-left: 20px;">
		        	<span style="font-weight: bold; font-size: 25px;">상품평</span> 
		        	<input type="button" value="상품평 쓰기 " onclick="purchaseList();" style="float: right;"> <br>
	        		<img src="" id="ratingAvg" style="width:200px;">
	        		 <span style="font-weight: bold; font-size:20px;">(${ratingAvg} / 5.0)</span><br><br>
	        	</div><hr>
	       		
	        	<c:forEach var="review" items="${reviewList}">
	        		<div style="padding-left: 20px;">
	        		${review.name} <br>
	        		<c:if test="${review.rating == 1}">
    					<img src="/shop/resources/reviewImg/1.png" id="rating" style="width:100px;">
					</c:if>
					<c:if test="${review.rating == 2}">
					    <img src="/shop/resources/reviewImg/2.png" id="rating" style="width:100px;">
					</c:if>
					<c:if test="${review.rating == 3}">
					    <img src="/shop/resources/reviewImg/3.png" id="rating" style="width:100px;">
					</c:if>
					<c:if test="${review.rating == 4}">
					    <img src="/shop/resources/reviewImg/4.png" id="rating" style="width:100px;">
					</c:if>
					<c:if test="${review.rating == 5}">
					    <img src="/shop/resources/reviewImg/5.png" id="rating" style="width:100px;">
					</c:if>
					
					${review.date.substring(0, 10)}<br>
					${review.product_name }<br>
					
	        		<c:if test="${review.filepath != 'no_file' }">
	               		<img src="/shop/resources/reviewImg/${review.filepath }" style="width:80px;">
	                </c:if> 
	               
	                <br>
	               
	        		<span style="font-weight:bold;">${review.title }</span><br>
	        		<span>${review.comment }</span><br>
	        		<img src="/shop/resources/reviewImg/likebutton.png" style="width:30px;" onclick="likeup(${review.review_idx});">
	        		<span id="likeCount_${review_idx }">${review.likecount }</span>
	        		
	        		</div>
	        		<hr>
	        	</c:forEach>
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
	
	function likeup(review_idx){
		if (${empty users}) {
	    	alert("로그인이 필요한 서비스입니다");
	    	location.href="signin_form?redirect="+encodeURIComponent(window.location.href);
		return;
		}

	    let url = "likeup";
	    let param = 'user_idx=${users.user_idx}&review_idx='+review_idx;
	    sendRequest(url, param, likeupFn, "post");
	}

	function likeupFn() {
	    if (xhr.readyState == 4 && xhr.status == 200) {
	        let data = xhr.responseText.trim();
	        alert("추천되었습니다.");

	         window.location.reload()

	    }
	}
	
	
	

	
	window.onload=function(){
		let rating=document.getElementById("ratingAvg");
		
		ratingImg(rating,${ratingAvg});
		
		showTab(1);
	}
	
	function ratingImg(rating,ratingNum){
		
		if(ratingNum>=0 && ratingNum<0.5){
			rating.src="/shop/resources/reviewImg/0.5.png";
		}else if(${ratingAvg}>=0.5 && ${ratingAvg}<1){
			rating.src="/shop/resources/reviewImg/1.png";
		}else if(${ratingAvg}>=1 && ${ratingAvg}<1.5){
			rating.src="/shop/resources/reviewImg/1.5.png";
		}else if(${ratingAvg}>=1.5 && ${ratingAvg}<2){
			rating.src="/shop/resources/reviewImg/2.png";
		}else if(${ratingAvg}>=2 && ${ratingAvg}<2.5){
			rating.src="/shop/resources/reviewImg/2.5.png";
		}else if(${ratingAvg}>=2.5 && ${ratingAvg}<3){
			rating.src="/shop/resources/reviewImg/3.png";
		}else if(ratingNum>=3 && ratingNum<3.5){
			rating.src="/shop/resources/reviewImg/3.5.png";
		}else if(ratingNum>=3.5 && ratingNum<4){
			rating.src="/shop/resources/reviewImg/4.png";
		}else if(${ratingAvg}>=4 && ${ratingAvg}<4.5){
			rating.src="/shop/resources/reviewImg/4.5.png";
		}else if(${ratingAvg}>=4.5 && ${ratingAvg}<5){
			rating.src="/shop/resources/reviewImg/5.png";
		}
		
	}

	
	function amountAlert() {
	    let amountInput = document.getElementById("amount");
	    let amount = parseInt(amountInput.value);

	    if (amount > 50) {
	      alert("1회 구매한도는 최대 50개 입니다.");
	      amountInput.value = 50;
	      return;
	    }

	    if (amount > ${vo.inventory}) {
	      alert(' 제품 수량 ${vo.inventory}개 이상 구매할수 없습니다.');
	      amountInput.value = ${vo.inventory};
	      return;
	    }

	    amountInput.value = amount;
	  }
	
	function purchaseList(){
		if (${empty users}) {
	    	alert("로그인이 필요한 서비스입니다");
	    	location.href="signin_form?redirect="+encodeURIComponent(window.location.href);
		return;
		}
		
		location.href='/shop/purchaseList?user_idx=${users.user_idx}';
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
	
    
	function toggleHeart() {
	    if (${empty users}) {
	        alert("로그인이 필요한 서비스입니다");
	        location.href="signin_form?redirect="+encodeURIComponent(window.location.href);
	        return;
	    }

	    let url = "interest_insert";
	    let param = 'user_idx=${sessionScope.users.user_idx}&product_idx=${vo.product_idx}&name=${vo.name}&price=${vo.price}&discount=${vo.discount}&filepath=${vo.filepath}&inventory=${vo.inventory}';
	    sendRequest(url, param, insertFn, "post");
	}

	function insertFn() {
	    let productImage = document.getElementById("productImage");

	    if (xhr.readyState == 4 && xhr.status == 200) {
	        let data = xhr.responseText;

	        if (data === "fail") {
	            alert("등록에 실패했습니다.");
	        } else if (data === "success") {
	            productImage.src = "/shop/resources/images/02.jpg";
	            alert("관심 상품에 등록되었습니다.");
	        } else if (data === "duplicate") {
	            alert("이미 등록된 상품입니다.");
	        } else if (data === "deletefail") {
	            alert("삭제에 실패했습니다.");
	        } else if (data === "deleted") {
	            productImage.src = "/shop/resources/images/01.jpg";
	            alert("관심 상품에서 삭제되었습니다.");
	        }
	    }
	}



	// 수정된 부분: 바로 구매 로직 수정
	function buyNow(){
		if(${empty users}){
			 alert("로그인이 필요한 서비스입니다");
		     location.href="signin_form?redirect="+encodeURIComponent(window.location.href);
		     return;
		}
		 let quantity=document.getElementById("amount").value;
		location.href="/shop/buyNow?inventory=${vo.inventory}&user_idx=${sessionScope.users.user_idx}&product_idx=${vo.product_idx}&quantity="+quantity+"&name=${vo.name}&price=${vo.price}&discount=${vo.discount}&filepath=${vo.filepath}";
		
	}
	
	// 수정된 부분: 장바구니 추가 로직 수정
	function cartAdd(){
		if(${empty users}){
				 alert("로그인이 필요한 서비스입니다");
				 location.href="signin_form?redirect="+encodeURIComponent(window.location.href);
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
