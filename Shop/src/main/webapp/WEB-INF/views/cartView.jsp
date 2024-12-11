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
	  장바구니임 <br>
	  <c:forEach var="vo" items="${list }">
  	  cart_idx : ${vo.cart_idx }
  	  user_idx : ${vo.user_idx }
  	  product_idx :	${vo.product_idx }
  	  quantity : ${vo.quantity }
  	  status : ${vo.status }
  	  name : ${vo.name }
  	  price : ${vo.price }
  	  discount : ${vo.discount }
	  filepath : ${vo.filepath }

  	  	<br>
	  </c:forEach>
	</body>
</html>