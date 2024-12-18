<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	주문 1개 상세정보
	<c:forEach var="vo" items="${list }">
	${vo.name} 
	${vo.quantity }개 <br>
	
	</c:forEach>
	${user.user_idx }
	<input type="button" value="홈으로" onclick="location.href='/shop/'">
	<input type="button" value="주문내역 보러가기" onclick="location.href='/shop/purchaseList?user_idx=${user.user_idx}'">
</body>
</html>