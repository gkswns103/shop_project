<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Want It 주문목록</title>
</head>
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

<style>
.container {
	width: 1000px;
	border-radius: 5mm;
}

.bigbix {
	border: 1px solid black;
	
}
 
.smallbox {
	border: 1px solid black;
	margin-top: 10px;
	margin-bottom: 10px;
	padding: 10px;
	border-radius: 5mm;
}
.detail{
	float: right;
}
h4 {
    display: inline; 
}

.review{
	float:right;
}
</style>

<body>
	<jsp:include page="../header/header.jsp"></jsp:include>
	
	<c:if test="${not isempty}">
	<br>
	<div class="container">

		<c:forEach var="ordertime" items="${ordertimeList}">
			<!-- 주문번호가 이전 주문번호와 다르면, 새로운 div로 묶기 -->
			<div class="bigbox" style="border: 1px solid black; padding: 10px; border-radius: 5mm;">
				<br>
				<h4>${ordertime}주문</h4>
				<br>

				<c:set var="previousOrdernumber" value="1" />

				<div class="smallbox">
					<h4>주문 완료</h4><br><a class="detail" onclick="location.href='orderDetail?ordertime=${ordertime}&user_idx=${user_idx }'">상세보기</a> <br>
					<c:forEach var="vo2" items="${list}">
						<c:if test="${vo2.ordertime eq ordertime }">
							<c:if test="${previousOrdernumber != vo2.ordernumber }">
								<c:set var="previousOrdernumber" value="${vo2.ordernumber}" />
							</c:if>
							<c:if test="${previousOrdernumber eq vo2.ordernumber}">
								<img src="/shop/resources/img/${vo2.filepath}" width="70px;" onclick="location.href='detail?product_idx=${vo2.product_idx}'">
								${vo2.name} ${vo2.quantity}개 
								<fmt:formatNumber value="${vo2.price* vo2.quantity }" type="number" groupingUsed="true"/> 원
								<br><a class="review" onclick=
								"location.href='productReview?product_idx=${vo2.product_idx}&user_idx=${vo2.user_idx }&filepath=${vo2.filepath }&name=${vo2.name }'">리뷰 작성</a><br>
								
							</c:if>
						</c:if>
					</c:forEach>
					
				</div>

				<!-- 이전 ordernumber를 갱신 -->

				<!-- 주문번호가 변경되었으면 bigbox 닫기 -->
				<!-- bigbox div 종료 -->
			</div>
				<br>
		</c:forEach>

	</div>
	
	<input type="button" value="home" onclick="location.href='/shop/'">
	</c:if>
	<c:if test="${isempty}">
		주문목록 없음
	</c:if>
</body>
</html>