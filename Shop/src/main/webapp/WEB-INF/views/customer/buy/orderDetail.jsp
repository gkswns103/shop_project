<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Want It 주문상세</title>
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
	
	<div class="container" style="width:800px;">
		<br><br>
		<h4><b>주문 상세</b></h4>
		<span><b>${list[0].ordertime } 주문</b></span> <span style="color:gray; margin-left:30px;">주문번호 ${list[0].ordernumber }</span>
		
		<c:forEach var="vo" items="${list }">
		  <c:set var="totalprice"  value="${totalprice + vo.price*vo.quantity}" />
        <c:set var="totaldiscount"  value="${totaldiscount + vo.price*vo.quantity-vo.realprice *vo.quantity}" />
			<div class="smallbox">
			<img src="/shop/resources/img/${vo.filepath}" width="70px;" onclick="location.href='detail?product_idx=${vo.product_idx}'">
								${vo.name} ${vo.quantity}개  
								<fmt:formatNumber value="${vo.price* vo.quantity }" type="number" groupingUsed="true"/>원<br>
			</div>
		</c:forEach>
		<br>
		
		<h4>배송 정보</h4>
		<hr style="width:600px">
		
		<table style="width:600px">
			<tr>
				<th>받는사람</th>
				<td>${user.name }</td> 
			</tr> 
			<tr>
				<th>이메일 </th>
				<td>${user.email }</td> 
			</tr> 
			<tr>
				<th>받는주소</th>
				<td>${user.addr }</td> 
			</tr> 
			<tr>
				<th>배송요청사항</th>
				<td>${list[0].deliveryrequest }</td> 
			</tr> 
			<tr>
				<th>배송메시지</th>
				<td> ${list[0].deliverymessage }</td> 
			</tr> 
		</table>
		<br><br>
		<h4>결제 정보</h4>
		<hr style="width:600px">
		<div style="display: flex; gap: 20px; justify-content: space-between; width:600px; " >
		<div>
			무통장입금 (입금완료)
		</div>
		
		<div style="backgroundcolor:gray;">
			<table>
				<tr>
					<th>총 상품가격</th>
					<td><fmt:formatNumber value="${totalprice }" type="number" groupingUsed="true"/>원</td>
				</tr>
				<tr>
					<th>할인금액</th>
					<td><fmt:formatNumber value="${totaldiscount }" type="number" groupingUsed="true"/>원</td>
				</tr>
				<tr>
					<th>총 결제금액</th>
					<td><fmt:formatNumber value="${totalprice-totaldiscount }" type="number" groupingUsed="true"/>원</td>
				</tr>
			</table>
		</div>		
		</div>
	</div>
	</body>
</html>