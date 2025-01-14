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

<style>
.purchaseInfo tr {
	border-bottom: 1px solid #dbdbdb;
}

.purchaseInfo th {
	background-color: #ebebeb;
	text-align: center;
	padding-top: 5px;
	padding-bottom: 5px;
}

.purchaseInfo td {
	padding-top: 5px;
	padding-bottom: 5px;
	padding-left: 10px;
}

.purchaseInfo {
	border-top: 3px solid #dbdbdb;
	border-bottom: 3px solid #dbdbdb;
	margin-bottom: 20px;
	margin-top: 10px;
	border-collapse: collapse;
	width: 80%
}

.buyList {
	border-top: 3px solid #dbdbdb;
	border-bottom: 3px solid #dbdbdb;
	border-collapse: collapse;
	width: 80%;
	margin-top: 10px;
	margin-bottom: 10px;
}

.buyList th {
	padding-top: 10px;
	padding-bottom: 10px;
	margin-left: 10px;
	padding-left: 10px;
	color: black;
	font-weight: normal;
}

.buyList td {
	padding-top: 10px;
	padding-bottom: 10px;
	font-size: 14px;
	color: #808080;
	text-align: left;
}

.buyList tr {
	border-bottom: 1px solid #dbdbdb;
}

input[type="checkbox"] {
	border-radius: 80%;
}

#info td {
	text-align: center;
}

.pay {
	width: 200px;
	height: 50px;
	margin-left: 400px;
}

#entryNum {
	display: none;
}
</style>

</head>
<body>
	<jsp:include page="../header/header.jsp"></jsp:include>
	<form>
		<br>
		<div class="container" style="width: 1000px;">
			<br>
			<h2>주문/결제</h2>
			<hr style="border: 3px solid #2e2e2e;">
			<br>
			<h4>구매자 정보</h4>
			<table class="purchaseInfo">
				<colgroup>
					<col style="width: 25%">
					<col style="width: 75%">
				</colgroup>
				<tr>
					<th>이름</th>
					<td>${user.name }</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${user.email }</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>010-1111-2222</td>
				</tr>
			</table>
			<br>
			<hr>
			<br>
			<h4>배송 정보</h4>
			<input type="button" value="배송지 변경" onclick="addr_search()">
			<table class="purchaseInfo">
				<tr>
					<th>배송 주소</th>
					<td>${user.addr }</td>
				</tr>
				<tr>
					<th>배송 요청사항</th>
					<td><select id="request">
							<option value="문 앞">문 앞</option>
							<option value="부재 시 문 앞">부재 시 문 앞</option>
							<option value="경비실">경비실</option>
							<option value="택배함">택배함</option>
					</select> <input placeholder="출입번호를 입력하세요" id="entryNum"> 공동현관 출입번호
						<input type="checkbox" id="entryNumCheck" onchange="entryCheck()">
						<input type="hidden" id="deliveryrequest" name="deliveryrequest"
						value=""></td>
				</tr>
				<tr>
					<th>배송메시지</th>
					<td><input name="deliverymessage"></td>
				</tr>
			</table>
			<br>
			<hr>
			<br>
			<h4>배송 목록</h4>
			<div>
				<table class="buyList">
					<colgroup>
						<col style="width: 80%">
						<col style="width: 20%">
					</colgroup>
					<tr>
						<th>${vo.name }</th>
						<td>수량 ${vo.quantity }개</td>
					</tr>
				</table>
			</div>
			<br>
			<hr>
			<br>

			<h4>결제 정보</h4>

			<table class="purchaseInfo" id="info">

				<tr>
					<th>총상품가격</th>
					<td><fmt:formatNumber value="${vo.price * vo.quantity}"
							type="number" groupingUsed="true" />원</td>
				</tr>
				<tr>
					<th>할인금액</th>
					<td>-<fmt:formatNumber value="${discountprice*vo.quantity}"
							type="number" groupingUsed="true" />원
					</td>
				</tr>
				<tr>
					<th>총결제금액</th>
					<td><fmt:formatNumber
							value="${vo.price * vo.quantity-discountprice*vo.quantity}"
							type="number" groupingUsed="true" />원</td>
				</tr>
				<tr>
					<th>결제방법</th>
					<td>
						<label>
							<input id="account_transfer" name="checkbox" type="radio" value="계좌이체">계좌이체
						</label>
		
						<label> 
							<input name="checkbox" type="radio" value="토스">토스
						</label>	
					</td>
						
				</tr>
			</table>
			<br> <input class="pay" type="button" value="주문하기"
				onclick="purchase(this.form)">
		</div>

		<input type="hidden" name="addr" value="${user.addr }"> <input
			type="hidden" name="filepath" value="${vo.filepath}"> <input
			type="hidden" name="discount" value="${vo.discount}"> <input
			type="hidden" name="price" value="${vo.price}"> <input
			type="hidden" name="product_idx" value="${vo.product_idx}"> <input
			type="hidden" name="inventory" value="${vo.inventory}"> <input
			type="hidden" name="quantity" value="${vo.quantity}"> <input
			type="hidden" name="name" value="${vo.name}"> <input
			type="hidden" name="user_idx" value="${user.user_idx}"> <input
			type="hidden" name="totalprice" value="${vo.price * vo.quantity}">
		<input type="hidden" name="totaldiscount"
			value="${discountprice*vo.quantity}"> <input type="hidden"
			name="finalAmount"
			value="${vo.price * vo.quantity-discountprice*vo.quantity}">
	</form>

	<script>
		function purchase(f) {
			let checkbox = document.getElementById('account_transfer');
			let deliverymessage = f.deliverymessage.value.trim();
			if (deliverymessage == "") {
				alert("배송메시지를 입력하세요");
				return;
			}
			if (!checkbox.checked) {
				alert("결제방법을 선택해주세요");
				return;
			}

			let request = document.getElementById("request").value;
			let entryNum = document.getElementById("entryNum");

			let deliveryrequest = request;
			if (entryNumCheck && entryNum.value.trim() !== "") {
				deliveryrequest += "(" + entryNum.value + ")";
			}

			let deliveryrequestField = document
					.getElementById("deliveryrequest");
			deliveryrequestField.value = deliveryrequest;

			alert("주문 완료");

			f.action = "purchaseOne";
			f.submit();
		}

		function entryCheck() {
			let entryNumCheck = document.getElementById('entryNumCheck');
			let entryNum = document.getElementById('entryNum');

			if (entryNumCheck.checked) {
				entryNum.style.display = 'inline-block';
			} else {
				entryNum.style.display = 'none';
			}

		}
	</script>
</body>
</html>