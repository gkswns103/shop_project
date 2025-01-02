<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>관심상품</title>
		<!-- Favicon--> 
		<link rel="icon" type="image/x-icon" href="/shop/resources/img/favicon.ico" />
		<!-- Bootstrap icons-->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
		<!-- Core theme CSS (includes Bootstrap)-->
		<link href="/shop/resources/css/style1.css" rel="stylesheet" />
		<link href="/shop/resources/css/style2.css" rel="stylesheet" />
		<link href="/shop/resources/css/style3.css" rel="stylesheet" />
		<link href="/shop/resources/css/style4.css" rel="stylesheet" />
		<link href="/shop/resources/css/style5.css" rel="stylesheet" />
		<link href="/shop/resources/css/style6.css" rel="stylesheet" />
			
			<script>
	
		    function cartAdd(formId) {
		    	if (${empty users}) {
			        alert("로그인이 필요한 서비스입니다");
			        location.href = "signin_form";
			        return;
			    }
		    	
		        let form = document.getElementById(formId);
		        if (!form) {
		            alert("폼을 찾을 수 없습니다.");
		            return;
		        }
	
		        let formData = new FormData(form);
		        let xhr = new XMLHttpRequest();
		        let params = new URLSearchParams(formData).toString();
	
		        xhr.open("POST", "/shop/interes_cart", true);
		        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	
		        xhr.onreadystatechange = function () {
		            if (xhr.readyState === 4) {
		                if (xhr.status === 200) {
		                    let result = xhr.responseText;
	
		                    if (result === "success") {
		                        alert("장바구니에 상품이 추가되었습니다.");
		                        location.reload(); // 장바구니 추가 후 새로고침
		                    } else if (result === "duplicate") {
		                        alert("이미 장바구니에 추가된 상품입니다.");
		                    } else if (result === "notfound") {
		                        alert("해당 관심 상품을 찾을 수 없습니다.");
		                    } else if (result === "fail") {
		                        alert("상품을 장바구니로 이동하지 못했습니다.");
		                    }
		                }
		            }
		        };
	
		        xhr.send(params);
		    }
	
		    function del(interestIdx, userIdx) {
		        let xhr = new XMLHttpRequest();
		        xhr.open("POST", "/shop/interest_delete", true);
		        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	
		        xhr.onload = function () {
		            if (xhr.status === 200) {
		                let response = xhr.responseText;
	
		                if (response === "success") {
		                    alert("관심목록에서 삭제되었습니다.");
		                    location.reload(); // 삭제 후 페이지 새로 고침
		                } else if (response === "fail") {
		                    alert("삭제에 실패했습니다.");
		                } else {
		                    alert("알 수 없는 오류가 발생했습니다.");
		                }
		            } else {
		                alert("서버 통신에 실패했습니다. 상태 코드: " + xhr.status);
		            }
		        };
	
		        // 데이터 전송
		        xhr.send("interest_idx=" + interestIdx + "&user_idx=" + userIdx);
		    }
	
	
		</script> 



	
	</head>
	<body>
		<!-- Header-->
		<jsp:include page="../customer/header/header.jsp"></jsp:include>
		
		<br><br>
    	<div class="container">
			<h1 class="display-5 text-center mb-4">관심상품</h1>
			<hr>
			<h4>현재 관심상품 목록 개수: ${sessionScope.interest_count}</h4>

			<c:if test="${empty list}">
				<p>관심상품 목록이 없습니다.</p>
				<br><br><br><br><br><br><br><br><hr>    
			</c:if>
		    
			<c:if test="${not empty list}">
			<table align="center" class="text-center mb-5">
				<c:forEach var="item" items="${list}" varStatus="status">
					<c:if test="${status.index % 4 == 0}">
					<tr>
					</c:if>
					<td style="padding: 10px; text-align: center;">
						<img src="/shop/resources/img/${item.filepath}" 
							 style="width: 250px; height: 250px; cursor: pointer;" 
							 alt="${item.name}" 
							 onclick="location.href='/shop/detail?product_idx=${item.product_idx}'"><br>
						${item.name}<br>
						${item.price}원<br>
						<span style="color: red;">${item.discount}%</span><br> 
						
						<div style="display: flex; justify-content: center; align-items: center; gap: 20px;">
						    <!-- 관심 상품 삭제 -->
						    <form method="post" action="javascript:void(0);" style="margin: 0;">
							    <input type="hidden" name="interest_idx" value="${item.interest_idx}">
							    <input type="hidden" name="user_idx" value="${item.user_idx}">
							    <button type="button" onclick="del(${item.interest_idx}, ${item.user_idx});" style="background: none; border: none; cursor: pointer;">
							        <img src="/shop/resources/images/02.jpg" alt="관심 삭제" style="width: 50px; height: 50px;">
							    </button>
							</form>
						
						    <!-- 장바구니 추가 -->
						   <form id="cartForm_${item.interest_idx}" style="display: inline;">
							    <input type="hidden" name="interest_idx" value="${item.interest_idx}">
							    <button type="button" onclick="cartAdd('cartForm_${item.interest_idx}');" style="background: none; border: none; cursor: pointer;">
							        <img src="/shop/resources/images/03.jpg" alt="장바구니 추가" style="width: 50px; height: 50px;">
							    </button>
							</form>
 
						</div>
 
					</td>
					<!-- 행 끝 -->
					<c:if test="${status.index % 4 == 3}">
						</tr>
					</c:if>
				</c:forEach>
			</table>
			<hr>
			</c:if>
		</div>
	
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		<!-- Footer-->
		<footer class="py-5 bg-dark">
			<div class="container">
				<p class="m-0 text-center text-white">Want It<br>대표이사:없음<br>서울특별시 강남구 강남구 테헤란로14길 6</p>
				<p class="m-0 text-center text-white fw-bold" style="font-size: 20px">고객센터 : 010-3239-5204</p>
				<p class="m-0 text-center text-white">Want It<br>대표이사:없음<br>서울특별시 강남구 강남구 테헤란로14길 6<br>후원계좌 : 국민 852502-04-255054 </p>
			</div>
		</footer>
		<!-- Bootstrap core JS-->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
		<!-- Core theme JS-->
		<script src="/shop/resources/js/scripts.js"></script>
	</body>
</html>
