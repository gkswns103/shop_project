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
	  장바구니임
	  <c:forEach var="vo" items="${list }">
  	  	${vo.cart_idx }
  	  	${vo.user_idx }
  	  	${vo.product_idx }
  	  	${vo.quantity }
  	  	${vo.status }
	  </c:forEach>
	</body>
</html>