<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
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
				
		<style>
		.smallbox {
	border: 1px solid black;
	margin-top: 10px;
	margin-bottom: 10px;
	padding: 10px;
	border-radius: 5mm;
}
		</style>
	</head>
	<body>
	<jsp:include page="../header/header.jsp"></jsp:include>
	<div class="container">
	
		<h4>주문 상세</h4>
		<span>${list[0].ordertime } 주문</span> <span>주문번호 ${list[0].ordernumber }</span>
		
		<c:forEach var="vo" items="${list }">
			<div class="smallbox">
			<img src="/shop/resources/img/${vo.filepath}" width="70px;">
								${vo.name} ${vo.quantity}개  ${vo.price* vo.quantity }원<br>
			</div>
		</c:forEach>
		<br>
		
		<h4>배송 정보</h4>
		<hr>
		받는사람 ${user.name } <br>
		이메일 ${user.email } <br>
		받는주소 ${user.addr } <br>
		배송요청사항 ${list[0].deliveryrequest } <br>
		배송메시지 ${list[0].deliverymessage } <br><br>
		<h4>결제 정보</h4>
		<hr>
		무통장입금 (입금완료)
		
		
		
	</div>
	</body>
</html>