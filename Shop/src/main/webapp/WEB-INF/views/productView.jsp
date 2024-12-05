<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<link
    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
    rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/shop/resources/css/style1.css" rel="stylesheet" />
<link href="/shop/resources/css/style2.css" rel="stylesheet" />
<link href="/shop/resources/css/style3.css" rel="stylesheet" />
<link href="/shop/resources/css/style4.css" rel="stylesheet" />
<link href="/shop/resources/css/style5.css" rel="stylesheet" />

<!-- Bootstrap core JS-->
<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="/shop/resources/js/scripts.js"></script>
<body>

	<jsp:include page="header.jsp"></jsp:include>
	
카테고리 : ${param.category } <br>
		
		<c:forEach var="vo" items="${list}">
			 <c:if test="${param.category eq ''}"> 
				${vo.idx }  
				${vo.name }
				${vo.price }
				${vo.discount }
				${vo.inventory }
				${vo.explanation }
				${vo.selleridx }
				${vo.filepath }
				${vo.category } <br>
			</c:if> 
		</c:forEach>
		
				
		<c:forEach var="vo" items="${list}">
			 <c:if test="${vo.category eq param.category }"> 
				${vo.idx }  
				${vo.name }
				${vo.price }
				${vo.discount }
				${vo.inventory }
				${vo.explanation }
				${vo.selleridx }
				${vo.filepath }
				${vo.category } <br>
			
			</c:if> 
		</c:forEach>
</body>
</html>