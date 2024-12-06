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
카테고리 : ${param.category }
		
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