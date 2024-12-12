<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>등록 완료</title>
    <link rel="icon" type="image/x-icon" href="/shop/resources/img/favicon.ico" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="/shop/resources/css/style1.css" rel="stylesheet" />
    <link href="/shop/resources/css/style2.css" rel="stylesheet" />
    <link href="/shop/resources/css/style3.css" rel="stylesheet" />
    <link href="/shop/resources/css/style4.css" rel="stylesheet" />
    <link href="/shop/resources/css/style5.css" rel="stylesheet" />
    <link href="/shop/resources/css/style6.css" rel="stylesheet" />
    <link href="/shop/resources/css/style7.css" rel="stylesheet" />
    <script src="/shop/resources/js/amount_counter.js"></script>
    

</head>

<body>
    <!-- 헤더 포함 -->
    <jsp:include page="header.jsp"></jsp:include>
    <jsp:include page="headerImg.jsp"></jsp:include>	
	
	
    <h1>등록이 완료되었습니다!</h1>
    <p>제품 이름: ${product.name}</p>
    <p>가격: ${product.price}</p>
    <p>카테고리: ${product.category}</p>
    <p>분류: ${product.division}</p>
    <p>할인율: ${product.discount}</p>
    <p>재고: ${product.inventory}</p>
    <p>설명: ${product.explain}</p>

    <a href="/product">목록으로 돌아가기</a>

</body>
</html>