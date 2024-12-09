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
		
		<script src="/shop/resources/js/amount_counter.js"></script>
	</head>
	
	<body>
		<jsp:include page="header.jsp"></jsp:include>
	
		<input type="hidden" value=${vo.idx } name="idx">
		<input type="hidden" value=${vo.selleridx } name="selleridx">
		<input type="hidden" value=${vo.inventory } id="inventory">
		
		<div class="container1">
			<div>
				홈 > ${vo.category} > ${vo.division} <br><br>
				<img alt="" src="/shop/resources/img/${vo.filepath }">
			</div>
			
			<div>
				<br>${vo.name } <br>
				<hr>
				${vo.price }원 ( 할인율 : ${vo.discount }% )<br>
				남은수량 : ${vo.inventory }개
				<hr>
				배송비 : <br>
				<hr>
				${vo.explain }
				
				<div class="counter-container">
			        <input id="amount" name="amount" value="1">
			        <button id="decrease" onclick="decrease()">▼</button>
			        <button id="increase" onclick="increase()">▲</button>
			        
					<input type="button" value="장바구니 담기" onclick="">
					<input type="button" value="바로 구매" onclick="">
   			    </div>
			</div>
	
			
		</div>
		
		
		
		
		
		
		
		
		
	</body>
</html>