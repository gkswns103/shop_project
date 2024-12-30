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
	    function cartAdd(interestIdx, userIdx, productIdx, inventory) {
	    	
	        if (${empty sessionScope.users}) {
	            alert("로그인이 필요한 서비스입니다");
	            location.href = "/shop/signin_form";
	            return;
	        }
	        
	        // JSP에서 JavaScript 변수로 데이터 삽입
	        let itemName = encodeURIComponent('${item.name}');
	        let itemPrice = encodeURIComponent('${item.price}');
	        let itemDiscount = encodeURIComponent('${item.discount}');
	        let itemFilepath = encodeURIComponent('${item.filepath}');
	        
	        
	        let url = "/shop/cart_insert";
	        let param = `inventory=${inventory}&user_idx=${userIdx}&product_idx=${productIdx}&name=${itemName}&price=${itemPrice}&discount=${itemDiscount}&filepath=${itemFilepath}`;
		    sendRequest(url, param, addFn, "POST");
	    }

		// Ajax 요청 함수
		function sendRequest(url, param, callback, method) {
			let xhr = new XMLHttpRequest();
		    xhr.open(method, url, true);
		    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		    xhr.onreadystatechange = function () {
		        if (xhr.readyState === 4 && xhr.status === 200) {
		            callback(xhr.responseText);
		        }
		    };
		    xhr.send(param);
		}

		// Ajax 응답 처리 함수
		function addFn(response) {
		    if (response === 'fail') {
		        alert("장바구니에 넣지 못했습니다.");
		    } else if (response === 'duplicate') {
		        alert("이미 장바구니에 있는 상품입니다.");
		    } else if (response === 'success') {
		        if (confirm("장바구니에 넣었습니다. 장바구니로 이동하시겠습니까?")) {
		            location.href = `/shop/cart?user_idx=${sessionScope.users.user_idx}`;
		        }
		    }
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
						
						<form method="post">
						    <!-- 관심 상품 삭제 -->
						    <input type="hidden" name="interest_idx" value="${item.interest_idx}">
						    <img src="/shop/resources/images/02.jpg"
						         alt="관심 삭제"
						         style="width: 50px; height: 50px; cursor: pointer;"
						         onclick="location.href='/shop/interest_delete?interest_idx=${item.interest_idx}&user_idx=${item.user_idx}'">
						
						    <!-- 장바구니로 이동 -->
						    <img src="/shop/resources/images/03.jpg"
					     alt="장바구니 추가"
					     style="width: 50px; height: 50px; cursor: pointer;"
					     onclick="cartAdd('${item.interest_idx}', '${item.user_idx}', '${item.product_idx}', '${item.inventory}', '${item.name}', '${item.price}', '${item.discount}', '${item.filepath}')">

						    <!-- 필요한 데이터 히든 입력 -->
						    <input type="hidden" name="user_idx" value="${item.user_idx}">
							<input type="hidden" name="product_idx" value="${item.product_idx}">
							<input type="hidden" name="name" value="${item.name}">
							<input type="hidden" name="price" value="${item.price}">
							<input type="hidden" name="discount" value="${item.discount}">
							<input type="hidden" name="filepath" value="${item.filepath}">
							<input type="hidden" name="inventory" value="${item.inventory}">

						</form>

					</td>
					<!-- 행 끝 -->
					<c:if test="${status.index % 4 == 3}">
						</tr>
					</c:if>
				</c:forEach>
			</table>
			<hr>
			</c:if>
			<input type="button" value="home" onclick="location.href='/shop/'">
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
