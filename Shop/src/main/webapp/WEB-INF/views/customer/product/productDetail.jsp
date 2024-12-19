<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<meta charset="UTF-8">
<title>Insert title here</title>
<head>
<link rel="icon" type="image/x-icon"
	href="/shop/resources/img/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/shop/resources/css/style1.css" rel="stylesheet" />
<link href="/shop/resources/css/style2.css" rel="stylesheet" />
<link href="/shop/resources/css/style3.css" rel="stylesheet" />
<link href="/shop/resources/css/style4.css" rel="stylesheet" />
<link href="/shop/resources/css/style5.css" rel="stylesheet" />
<link href="/shop/resources/css/style6.css" rel="stylesheet" />
</head>

<body>
	<jsp:include page="../header/header.jsp"></jsp:include>

	<input type="hidden" value=${vo.product_idx } name="product_idx">
	<input type="hidden" value=${vo.selleridx } name="selleridx">
	<input type="hidden" value=${vo.inventory } id="inventory">

	<div class="container1">
		<div>
			<a href="/shop/">홈</a> > <a
				href="/shop/product?division=${vo.division}&category=">${vo.division}</a>
			> <a
				href="/shop/product?division=${vo.division}&category=${vo.category}">${vo.category}</a>
			<br> <br> <img alt=""
				src="/shop/resources/img/${vo.filepath }">

		</div>

		<div>
			<br>${vo.name } <br>
			<hr>
			${vo.price }원 ( 할인율 : ${vo.discount }% )<br> 남은수량 :
			${vo.inventory }개
			<hr>
			배송비 : <br>
			<hr>

			${vo.explain }

			<div class="counter-container">
				<input id="amount" name="amount" value="1">

				<button id="decrease" onclick="decrease()">▼</button>
				<button id="increase" onclick="increase()">▲</button>
				<input type="button" value="장바구니 담기" onclick="cartAdd()"> <input
					type="button" value="바로 구매" onclick="">
			</div>

		</div>



	</div>
	<script src="/shop/resources/js/amount_counter.js"></script>
	<script src="/shop/resources/js/httpRequest.js"></script>
	<script>
	function cartAdd(){
		if(${!empty users}){
			 let usersExist = true;
		}
				else{
					 alert("로그인이 필요한 서비스입니다");
				     location.href="signin_form";
				     return;
				}
			    
			    let quantity=document.getElementById("amount").value;
			   
			    let url="cart_insert";
			    let param="inventory=${vo.inventory}&user_idx=${sessionScope.users.user_idx}&product_idx=${vo.product_idx}&quantity="+quantity+"&name=${vo.name}&price=${vo.price}&discount=${vo.discount}&filepath=${vo.filepath}";
			
			    sendRequest(url,param,addFn,"post");
	}
			
			function addFn(){
				if(xhr.readyState==4 && xhr.status == 200){
					let data=xhr.responseText;
					if(data =='fail'){
						alert("장바구니에 넣지못함");
						return;
					}else if(data=='duplicate'){
						alert("이미 장바구니에 있습니다");
					}else if(data =='success') {
						 if (confirm("장바구니에 넣었습니다. 장바구니로 이동하시겠습니까?")) {
						        location.href='/shop/cart?user_idx=${sessionScope.users.user_idx}';
						    }
					}
			
				
				}
			}
	</script>
</body>
</html>