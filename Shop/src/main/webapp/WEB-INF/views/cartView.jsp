<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

<script>
function amountChange(product_idx) {
    
    let amountInput = document.getElementById("amount-" + product_idx).value;
    let inventory = document.getElementById("inventory-"+product_idx).value;
    let user_idx = "${sessionScope.users.user_idx}";
   
    if(amountInput > inventory){
       alert("남은 수량은"+inventory+"개 입니다");
       amountInput=inventory;
       location.href="amount_update?product_idx=" + product_idx + "&user_idx=" + user_idx + "&quantity=" + amountInput;
       return;
    }
    
    if(amountInput < 1){
       alert("최소수량입니다");
       amountInput=1;     
    }
    if(amountInput >50){
       alert("구매한도는 50개 입니다");
       amountInput=50;
    }

  
    location.href="amount_update?product_idx=" + product_idx + "&user_idx=" + user_idx + "&quantity=" + amountInput;
}

function decrease(product_idx) {
    let amountInput = document.getElementById("amount-" + product_idx).value;
    let inventory = document.getElementById("inventory-"+product_idx).value;
    let user_idx = "${sessionScope.users.user_idx}";
    
    if(amountInput == 1){
       alert("최소수량입니다");
       return;
    }
    amountInput = parseInt(amountInput) - 1;
   
    location.href="amount_update?product_idx=" + product_idx + "&user_idx=" + user_idx + "&quantity=" + amountInput;
}

function increase(product_idx) {
   let amountInput = document.getElementById("amount-" + product_idx).value;
    let inventory = document.getElementById("inventory-"+product_idx).value;
    let user_idx = "${sessionScope.users.user_idx}";
    
    if(amountInput == inventory){
       alert("남은 수량은"+inventory+"개 입니다");
       return;
    }
    if(amountInput.value >50){
       alert("구매한도는 50개 입니다");
       return;
    }
    amountInput= parseInt(amountInput) + 1;
    
    location.href="amount_update?product_idx=" + product_idx + "&user_idx=" + user_idx + "&quantity=" + amountInput;
}
function updateTotal() {
    let totalPrice = 0;
    let totalDiscount = 0;
    
    document.querySelectorAll('.item').forEach(item => {
        const checkbox = item.querySelector('input[type="checkbox"]');
        if (checkbox.checked) {
            const price = parseFloat(item.querySelector('#price').textContent.replace(/[^0-9.-]+/g,""));
            const realPrice = parseFloat(item.querySelector('h4').textContent.replace(/[^0-9.-]+/g,""));
            
            totalPrice += price;
            totalDiscount += (price - realPrice);
        }
    });
    
    document.getElementById('totalprice').textContent = totalPrice.toLocaleString() + '원';
    document.getElementById('totaldiscount').textContent = totalDiscount.toLocaleString() + '원';
    document.getElementById('finalsum').textContent = (totalPrice - totalDiscount).toLocaleString() + '원';
}

function check(product_idx) {
    updateTotal();
}
  


</script>

</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<c:if test="${!empty users }">

		<c:set var="totalprice" value="0" />
		<c:set var="totaldiscount" value="0" />

		<div class="cart-container">

			<c:set var="totalprice" value="0" />
			<c:set var="totaldiscount" value="0" />

			<div class="container2">
				<div class="items-container">
					<c:forEach var="vo" items="${list}">
						<c:if test=""></c:if>
						<c:set var="totalprice"
							value="${totalprice + vo.price*vo.quantity}" />
						<c:set var="totaldiscount"
							value="${totaldiscount + vo.price*vo.quantity-vo.realprice *vo.quantity}" />
						<div class="item">
							<input type="checkbox" onclick="check(${vo.product_idx})" checked>
							<div class="box1">
								<img class="cartImg" src="/shop/resources/img/${vo.filepath}"
									alt="상품 이미지"
									onclick="location.href='/shop/detail?product_idx=${vo.product_idx}'">
							</div>
							<div class="box2">
								${vo.name} <input type="hidden" id="inventory-${vo.product_idx}"
									value="${vo.inventory }">(남은 수량:${vo.inventory }개) <br>
								<span id="discount" class="discount"><fmt:formatNumber
										value="${vo.discount}" type="number" groupingUsed="true" />%</span>
								<span id="price" class="price"><fmt:formatNumber
										value="${vo.price * vo.quantity}" type="number"
										groupingUsed="true" />원</span><br>
								<h4>
									<fmt:formatNumber value="${vo.realprice * vo.quantity}"
										type="number" groupingUsed="true" />
									원
								</h4>
								<div class="counter-container">
									<input id="prodidx-${vo.product_idx}" type="hidden"
										value="${vo.product_idx}" maxlength="3"> 수량 <input
										id="amount-${vo.product_idx}" name="amount"
										value="${vo.quantity}"
										onchange="amountChange(${vo.product_idx})">

									<button id="decrease" onclick="decrease(${vo.product_idx})">▼</button>
									<button id="increase" onclick="increase(${vo.product_idx})">▲</button>
								</div>

								<br>
							</div>
							<div>
								<input type="button" value=" X "
									onclick="location.href='/shop/delete?product_idx=${vo.product_idx}&user_idx=${users.user_idx}'">
							</div>
						</div>
					</c:forEach>
				</div>

				<div class="box3">
					<h4>주문 예상 금액</h4>
					총 상품가격: <span id="totalprice"><fmt:formatNumber
							value="${totalprice}" type="number" groupingUsed="true" />원</span><br>
					총 할인: <span id="totaldiscount"><fmt:formatNumber
							value="${totaldiscount}" type="number" groupingUsed="true" />원</span><br>
					<hr>
					최종 금액: <span id="finalsum"><fmt:formatNumber
							value="${totalprice - totaldiscount}" type="number"
							groupingUsed="true" />원</span> <input type="button" value="구매하기"
						onclick="requestPay();">
				</div>
			</div>
		</div>
	</c:if>

	<c:if test="${empty users }">
		<!-- 로그인정보 없이 장바구니에 접근했을시 -->
		<jsp:include page="signin.jsp"></jsp:include>
	</c:if>

	<script src="/shop/resources/js/httpRequest.js"></script>
	<!-- <script src="/shop/resources/js/cartview.js"></script> -->
</body>
</html>