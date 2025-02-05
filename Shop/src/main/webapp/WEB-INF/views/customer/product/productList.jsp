<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록 수정 List</title>
<link rel="icon" type="image/x-icon" href="/shop/resources/img/favicon.ico" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<link href="/shop/resources/css/style1.css" rel="stylesheet" />
<link href="/shop/resources/css/style2.css" rel="stylesheet" />
<link href="/shop/resources/css/style3.css" rel="stylesheet" />
<link href="/shop/resources/css/style4.css" rel="stylesheet" />
<link href="/shop/resources/css/style5.css" rel="stylesheet" />
<link href="/shop/resources/css/style6.css" rel="stylesheet" />

<style>


    .product-table {
        width: 100%;
        border-collapse: collapse;
    }

    .product-table th {
        padding: 10px;
        text-align: center;
        border-bottom: 2px solid #ddd;
    }

    .product-table td {
        padding: 10px;
        text-align: center;
        border-bottom: 1px solid #ddd;
    }

    .product-description {
        text-align: left;
        padding-left: 120px;
        font-size: 14px;
    }

    .edit-btn, .delete-btn {
        display: inline-block;
        padding: 5px 10px;
        margin-top: 5px;
        text-decoration: none;
        border-radius: 5px;
    }

    .edit-btn { background: blue; color: white; }
    .delete-btn { background: red; color: white; }

	.product-description {
	    text-align: left;
	    padding-left: 20px; /* 왼쪽 정렬 유지 */
	    margin-top: -15px !important; /* 위쪽 여백을 줄여서 삭제 버튼과 가까워지도록 */
	    font-size: 14px; /* 글씨 크기 조정 */
	    line-height: 1.4; /* 줄 간격 조정 */
	}
	
    .product-table th, .product-table td {
        padding: 10px;
        text-align: center;
    }

    .product-image {
        width: 150px;
        height: 150px;
        object-fit: cover;
        border-radius: 5px;
    }

    .edit-btn, .delete-btn {
        padding: 5px 10px;
        border-radius: 5px;
        text-decoration: none;
        font-size: 14px;
        display: inline-block;
    }

    .edit-btn {
        color: white;
        background-color: #007bff;
    }

    .delete-btn {
        color: white;
        background-color: #dc3545;
    }

    .status {
        font-weight: bold;
        color: white;
        padding: 5px 10px;
        border-radius: 5px;
    }

    .status.approved {
        background-color: #28a745; /* 초록색 - 판매 중 */
    }

    .status.pending {
        background-color: #ffc107; /* 노란색 - 승인 대기 */
    }
</style>

<script>
	window.onload = function(){
		if(${empty users}){
			alert("로그인 필요");	
			location.href="signin_form";
		}
	}	
	function openDetailPopup(details) {
	    let previewWindow = window.open("", "내용 확인", "width=800,height=600,scrollbars=yes");
	
	    previewWindow.document.write(`
	        <html>
	        <head>
	            <title>내용 확인</title>
	            <style>
	                body { font-family: Arial, sans-serif; padding: 20px; }
	                .content { max-width: 750px; margin: auto; white-space: pre-wrap; word-wrap: break-word; }
	                img { max-width: 100%; height: auto; display: block; margin: 10px 0; }
	                .content {
	                    max-width: none !important;  /* 너비 제한 해제 */
	                    display: inline-block !important;
	                    white-space: nowrap !important;
	                }
	            </style>
	        </head>
	        <body>
	            <div class="content">
	                <h2>내용 확인</h2>
	                <hr>
	                <div id="previewContent"></div> <!-- editorContent를 innerHTML로 삽입할 공간 --> 
	            </div>
	        </body>
	        </html>
	    `);
	    previewWindow.document.close();
	
	    //  HTML이 렌더링된 후 details를 innerHTML로 추가 (HTML 태그 유지)
	    previewWindow.document.getElementById("previewContent").innerHTML = details;
	}


</script>

</head>

<body>

	<!-- 헤더 포함 -->
	<jsp:include page="../header/header.jsp"></jsp:include>
	
	<!-- 상품 등록 폼 -->
	<div class="container mt-3">
		<br>
		<h1 class="display-5 text-center mb-5">상품 등록 수정</h1>
		<hr><br><br>
	
	
	<table class="product-table">  
		<!-- 등록된 상품 (판매 중) -->
		<c:forEach var="product" items="${productList}">
			<tr>
	        <th>상품 이미지</th>
	        <th style="text-align: left; padding-left: 120px;">상품명</th>
	        <th>가격</th>
	        <th>할인율</th>
	        <th>수량</th>
	        <th>상세설명</th>
	        <th>상태</th>
	    </tr>
		    <tr style="cursor: pointer;">
		        <td rowspan="2" onclick="location.href='/shop/detail?product_idx=${product.product_idx}'" ><img src="/shop/resources/img/${product.filepath}" class="product-image"></td>
		        <td style="text-align: left; padding-left: 120px; max-width: 150px; 
	                       word-wrap: break-word; white-space: normal;">
	                ${product.name}
	            </td>
		        <td>${product.price}원</td>
		        <td>${product.discount}%</td>
		        <td>${product.inventory}</td>
		        <td onclick="location.href='/shop/detail?product_idx=${product.product_idx}'" style="cursor: pointer; color: blue; text-decoration: underline;">
			        상품확인
			    </td>
		        <td><span class="status approved">판매 중</span></td>
		    </tr>
		    <tr>
		    	<td colspan="7" style="text-align: left; padding-left: 120px;"
		    		class="product-description">
			        <strong>상품설명</strong> <br><br>${product.explain}
			    </td>
		    </tr>
		    <tr>
		    	<td>
		    	 <a href="productEdit?product_idx=${product.product_idx}&status=product&user_idx=${sessionScope.users.user_idx}" class="edit-btn">수정</a> 	
		    	 <a href="deleteProduct?product_idx=${product.product_idx}&user_idx=${product.selleridx}" 
		             	class="delete-btn"
		               onclick="return confirm('정말 삭제하시겠습니까?');">
		               삭제
		            </a>
		        </td>
		    </tr>
		</c:forEach>
		

	
	       <!-- 신청 중 상품 -->
	    <c:forEach var="product" items="${applyProductList}">
	        <tr>
	            <th>상품 이미지</th>
	            <th style="text-align: left; padding-left: 120px;">상품명</th>  
	            <th>가격</th>
	            <th>할인율</th>
	            <th>수량</th>
	            <th>상세설명</th>
	            <th>상태</th>
	        </tr>
	        <tr>
	            <td rowspan="2"><img src="/shop/resources/img/${product.filepath}" class="product-image"></td>
	            <td style="text-align: left; padding-left: 120px; max-width: 150px; 
	                       word-wrap: break-word; white-space: normal;">
	                ${product.name}
	            </td>
	            <td>${product.price}원</td>
	            <td>${product.discount}%</td>
	            <td>${product.inventory}</td>
	            <td class="description-cell" onclick="openDetailPopup('<c:out value="${product.details}" />')" style="cursor: pointer; color: blue; text-decoration: underline;">
	                내용확인
	            </td>
	            <td><span class="status pending">신청 중</span></td>
	        </tr>
	        <tr>
	            <td colspan="7" style="text-align: left; padding-left: 120px;" class="product-description">
	                <strong>상품설명</strong> <br><br>${product.explain}
	            </td>
	        </tr>
	        <tr>
	            <td>
			    	  <a href="applyEdit?product_idx=${product.product_idx}&status=apply&user_idx=${sessionScope.users.user_idx}" class="edit-btn">수정</a>
			           <a href="deleteApplyProduct?product_idx=${product.product_idx}&user_idx=${product.selleridx}" 
			           		 class="delete-btn"
			               onclick="return confirm('정말 삭제하시겠습니까?');">
			               삭제
			            </a>
			        </td>
	        </tr>
	    </c:forEach>
	</table>
	<br><br><br><br><br><br>
</body>
</html>
