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
<style>
/* 장바구니 담기 & 바로 구매 버튼 색상 */
.button-green {
    background-color: #4CAF50; /* 초록색 */
    border: none;
    color: white;
    padding: 10px 16px;
    font-size: 14px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.button-green:hover {
    background-color: #45a049;
}

.button-green:active {
    background-color: #3e8e41;
}

<style>
.tab-content {
    display: flex;
    flex-direction: column;
    width: 100%;
}

.tab-view {
    white-space: pre-wrap; /* 줄바꿈 유지 */
    word-wrap: break-word; /* 단어 단위 줄바꿈 */
    width: 100%;
    min-height: auto; /* 높이 자동 조정 */
    height: auto;
}
</style>


</style>

</head>

<body>
	<jsp:include page="../header/header.jsp"></jsp:include>

	<input type="hidden" value=${vo.product_idx } name="product_idx">
	<input type="hidden" value=${vo.selleridx } name="selleridx">
	<input type="hidden" value=${vo.inventory } id="inventory">

	<div class="container1">
		<div class="small1">
			<a href="/shop/">홈</a> 
			<a href="/shop/product?division=${vo.division}&category=">${vo.division}</a>
		 <a href="/shop/product?division=${vo.division}&category=${vo.category}">${vo.category}</a>
			<br> <br> <img alt="" src="/shop/resources/img/${vo.filepath}">

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
			가격 : <fmt:formatNumber value="${vo.price}" type="number" groupingUsed="true" />원<br>
			( 할인율 : ${vo.discount }% )<br> 남은 수량 :
			${vo.inventory }개
			<hr>
			배송비 : <br>
			<hr>
			
			${vo.explain }

			<div class="counter-container">
			    <div class="custom-number-input">
			        <button class="decrease"  onclick="decrease()">▼</button>
			        <input id="amount"  name="amount" value="1" readonly>
			        <button class="increase"  onclick="increase()">▲</button> 
			    </div>
			
			    <input type="button" value="장바구니 담기" class="button-green" onclick="cartAdd()"> 
			    <input type="button" value="바로 구매" class="button-green" onclick="buyNow()">
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
			<h2>상품 상세 설명</h2><br>
			<hr><br>
		        ${vo.details}
	        </div>
	        <div class="tab-view" id="tab-1" style="display: none;">
	        	<h2>상품평</h2><br>
			<hr><br> 
	        	<input type="button" value="상품평 쓰기 " onclick="purchaseList();" >
	        </div>
	        <div class="tab-view" id="tab-2" style="display: none;">
	       		 <h2>상품 문의</h2><br>
			<hr><br>📌 상품 문의 전 아래 내용을 참고해 주세요!<br>
			<br> 
			1️⃣ 제품 정보 및 재고 문의<br>
			Q. 상품의 재고가 있나요?<br>
			➝ 실시간 재고 변동으로 인해 상세 페이지에서 재고 상태를 확인해 주세요.<br>
			Q. 상품 상세 정보가 궁금해요.<br>
			➝ 상품 상세 페이지에 사이즈, 색상, 소재 등의 정보가 기재되어 있습니다. 추가 정보가 필요하시면 문의해 주세요.<br>
			<br>
			2️⃣ 배송 관련 문의<br>
			Q. 주문 후 배송 기간은 얼마나 걸리나요?<br>
			➝ 일반적으로 주문 후 1~3일 내 출고되며, 지역에 따라 배송 기간이 다를 수 있습니다.<br>
			Q. 배송 조회는 어디서 하나요?<br>
			➝ 마이페이지 > 주문목록에서 확인 가능하며, 송장 번호를 통해 택배사에서도 조회할 수 있습니다.<br>
			<br>
			3️⃣ 사이즈 및 착용감 관련 문의<br>
			Q. 사이즈가 어떻게 나오나요?<br>
			➝ 상품마다 사이즈 차이가 있을 수 있으니, 상세 페이지의 사이즈표를 확인해 주세요.<br>
			Q. 착용감이나 핏이 궁금해요.<br>
			➝ 상세 페이지 또는 리뷰 참고 및 궁금한 사항은  추가 문의를 이용해 주세요.<br>
			<br>
			4️⃣ 추가 문의 방법<br>
			📞 고객센터: 0000-0000 (운영시간: 평일 09:00~18:00)<br>
			📧 이메일 문의: kh@yourshop.com<br>
	        </div>
	        <div class="tab-view" id="tab-3" style="display: none;">
	        	<h2> 교환/반품 </h2><br>
	           <hr><br> 교환 및 반품 안내<br>
				고객님의 편리한 쇼핑을 위해 교환 및 반품 절차를 아래와 같이 안내드립니다. 상품을 반품하시기 전 반드시 확인해 주세요.<br>
				<br>
				
				📌 교환 및 반품이 가능한 경우
				상품을 수령한 날로부터 7일 이내 요청한 경우 배송된 상품이 주문한 상품과 다르거나,<br> 
				불량·파손이 발생한 경우 상품의 라벨, 태그, 포장 상태가 유지된 경우 (사용 흔적이 없어야 함)<br>
				<br>
				❌ 교환 및 반품이 불가능한 경우❌
				<br>
				상품을 이미 사용했거나, 세탁/수선을 한 경우 개봉 후 재판매가 어려운 제품 <br>
				(예: 화장품, 식품, 속옷 등)
				주문 제작 상품 및 한정 판매 상품
				구성품이 빠져있거나, 포장 상태가 훼손된 경우<br>
				<br>
				📦 교환 및 반품 신청 방법<br>
				홈페이지 > 주문내역 > 반품/교환 신청 고객센터(📞0000-0000) 또는 1:1 문의를 통해 접수 지정된 택배사를 통해 상품 회수 진행 <br>
				<br>
				🚚 반품/교환 배송비 안내 <br>
				단순 변심 : 왕복 배송비 3,000 ~ 5,000원 (고객 부담) <br>
				상품 불량, 오배송: 무료 교환/반품 가능 (판매자 부담)<br>
				<br>
				💰 환불 절차<br>
				반품 도착 후 검수 완료 시, 최대 5일 이내 환불 처리됩니다. 신용카드 결제: 카드사 정책에 따라 최대 7일 소요될 수 있음<br>
				계좌 이체 및 무통장 입금: 영업일 기준 2~3일 이내 환불<br>
				<br>
				📞 문의사항: 고객센터 0000-0000 (운영시간: 평일 09:00~18:00)<br>
				📧 이메일 문의: kh@yourshop.com<br> 
				
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
	    let param = `user_idx=${sessionScope.users.user_idx}&product_idx=${vo.product_idx}&name=${vo.name}&price=${vo.price}&discount=${vo.discount}&filepath=${vo.filepath}&inventory=${vo.inventory}`;
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
