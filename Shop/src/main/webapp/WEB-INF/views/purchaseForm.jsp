<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
		<!-- 		<link href="/shop/resources/css/style1.css" rel="stylesheet" />
				<link href="/shop/resources/css/style2.css" rel="stylesheet" />
				<link href="/shop/resources/css/style3.css" rel="stylesheet" />
				<link href="/shop/resources/css/style4.css" rel="stylesheet" />
				<link href="/shop/resources/css/style5.css" rel="stylesheet" />
				<link href="/shop/resources/css/style6.css" rel="stylesheet" /> -->
		
		<style>
		.container {
    display: flex;
    flex-direction: column;
    
    justify-content: center; /* 수평 가운데 정렬 */
    gap: 20px; /* 요소 간 간격 */
    border: 1px solid #ccc;
    padding: 20px;
    max-width: 1300px; /* 최대 너비 */
    width: 100%;
    box-sizing: border-box; /* 패딩 포함 크기 계산 */
    margin: 0 auto; /* 수평 중앙 정렬 */
    min-width: 1300px; /* 최소 너비 */
    overflow-x: auto; /* 가로 스크롤 활성화 */
}
.navbar-barnd{
	padding-y: 0.3125rem;
    margin-end: 1rem;
    font-size: 1.25rem;
    color: rgba(0, 0, 0, 0.9);
    hover-color: rgba(0, 0, 0, 0.9);
}
		</style>
	</head>
	<body>
		<%-- <jsp:include page="header.jsp"></jsp:include> --%>
		 <a class="navbar-brand" href="/shop/">Want It</a>
		<div class="container">
			<br>
			<h2>주문/결제</h2>
			<hr>
			<h4>구매자 정보</h4>
			<table border=1>
				<tr>
					<th>이름</th>
					<td>${user.name }</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${user.email }</td>
				</tr>
				<tr>
					<th>배송 주소</th> 
					<td>${user.addr } <input type="button" value="변경" onclick=""></td>
				</tr>
				<tr>
					<th>연락처</th> 
					<td>010-1111-2222</td>
				</tr>
				<tr>
					<th>배송 요청사항</th> 
					<td>문 앞 배송 <input type="button" value="변경" onclick=""></td> 
				</tr>
			</table>
			
			<h4>배송 목록</h4>
			<div>
				<hr>
				<c:forEach var="vo" items="${list }">
					<div>	${vo.name }   수량${vo.quantity }개 <br>  </div> <hr>
				</c:forEach>
			</div>
			
			
			<h4>결제 정보</h4>
			<div>
				<table border=1>
					<tr>
						<th>총상품가격</th>
						<td><fmt:formatNumber value="${finalAmount}" type="number" groupingUsed="true"/>원</td>
					</tr>
					<tr>
						<th></th>
						<td></td>
					</tr>
				</table>
			</div>
			
		</div>
	</body>
</html>