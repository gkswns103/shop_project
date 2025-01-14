<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<<<<<<< HEAD
<head>
<meta charset="UTF-8">
<title>Want It 장바구니</title>
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
.xBtn {
	background: white;
	color: red;
	border: none;
}

/* 테이블 스타일 */
.styled-table {
	border-collapse: separate;
	border-spacing: 0;
	border: 1px solid #ccc; /* 테두리 색상 */
	border-radius: 8px; /* 테두리 둥글게 */
	overflow: hidden;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 추가 */
	font-family: Arial, sans-serif;
	background-color: #fdfdfd; /* 테이블 배경색 */
}

.styled-table td {
	padding: 1px 6px; /* 테이블 셀 안쪽 간격 */
	text-align: center;
	font-size: 14px; /* 텍스트 크기 */
	border: none; /* 셀 내부 테두리 제거 */
}

/* 입력 필드 스타일 */
.styled-table input[type="text"] {
	width: 60px;
	height: 20px;
	padding: 4px;
	font-size: 14px;
	border: 1px solid #ddd;
	border-radius: 4px;
	text-align: center;
	box-sizing: border-box;
}

/* 버튼 스타일 */
.styled-table .amountBtn {
	width: 25px;
	height: 25px;
	font-size: 12px;
	background-color: #f5f5f5;
	border: 1px solid #ddd;
	border-radius: 4px;
	cursor: pointer;
	margin: 1px 0;
	transition: all 0.3s ease;
}

.styled-table .amountBtn:hover {
	background-color: #007bff;
	color: white;
	border-color: #007bff;
}

/* 수직 버튼 정렬 */
.vertical-buttons {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

/* 컨테이너 스타일 */
.styled-container {
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 15px;
	margin-top: 20px;
}

.buyBtn {
  border: none;
  display: block;
  border-radius:10px;
  text-align: center;
  cursor: pointer;
  text-transform: uppercase;
  outline: none;
  overflow: hidden;
  position: relative;
  color: black;
  font-weight: 700;
  font-size: 15px;
  background-color: white;
  padding: 10px 30px;
  box-shadow: 0 5px 15px rgba(0,0,0,0.20);
  transition: color 0.5s ease-in-out; /* 텍스트 색상 변경 시 애니메이션 */
}

.buyBtn span {
  position: relative; 
  z-index: 1;
}

.buyBtn:after {
  content: "";
  position: absolute;
  left: 0;
  top: 0;
  height: 490%;
  width: 170%;
  background: #454685;
  -webkit-transition: all .5s ease-in-out;
  transition: all .5s ease-in-out;
  -webkit-transform: translateX(-98%) translateY(-25%) rotate(45deg);
  transform: translateX(-98%) translateY(-25%) rotate(45deg);
}

.buyBtn:hover:after {
  -webkit-transform: translateX(-9%) translateY(-25%) rotate(45deg);
  transform: translateX(-9%) translateY(-25%) rotate(45deg);
}

.buyBtn:hover {
  color: white; /* 마우스를 올렸을 때 텍스트 색상을 흰색으로 변경 */
}
</style>

</head>
<body>
	<jsp:include page="../header/header.jsp"></jsp:include>


	<c:if test="${!empty users }">
		<c:if test="${sessionScope.cart_count ne 0}">

			<c:set var="totalprice" value="0" />
			<c:set var="totaldiscount" value="0" />

			<div class="cart-container">

				<c:set var="totalprice" value="0" />
				<c:set var="totaldiscount" value="0" />

				<div class="container2">
					<div class="items-container">
						<c:forEach var="vo" items="${list}">

							<c:if test="${vo.status eq 'active' }">
								<c:set var="totalprice"
									value="${totalprice + vo.price*vo.quantity}" />
								<c:set var="totaldiscount"
									value="${totaldiscount + vo.price*vo.quantity-vo.realprice *vo.quantity}" />
								<div class="item">

									<input id="prodidx-${vo.product_idx}" type="checkbox"
										onclick="check(${vo.product_idx})"
										data-checked="${vo.checked}">

									<div class="box1">
										<img class="cartImg" src="/shop/resources/img/${vo.filepath}"
											alt="상품 이미지"
											onclick="location.href='/shop/detail?product_idx=${vo.product_idx}'">
									</div>
									<div class="box2">
										${vo.name} <input type="hidden"
											id="inventory-${vo.product_idx}" value="${vo.inventory }">(남은
										수량:${vo.inventory }개) <br> <span
											class="discount"><fmt:formatNumber
												value="${vo.discount}" type="number" groupingUsed="true" />%</span>
										<span id="price" class="price"><fmt:formatNumber
												value="${vo.price * vo.quantity}" type="number"
												groupingUsed="true" />원</span><br>
										<h4 style="color:red;">
											<fmt:formatNumber value="${vo.realprice * vo.quantity}"
												type="number" groupingUsed="true" />
											원
										</h4>
										<div class="counter-container mt-3" style="display: flex;">
											<input id="prodidx-${vo.product_idx}" type="hidden"
												value="${vo.product_idx}" maxlength="3"> 
										<%-- 		수량 <input
												id="amount-${vo.product_idx}" name="amount"
												value="${vo.quantity}"
												onchange="amountChange(${vo.product_idx})">

											<button id="decrease" onclick="decrease(${vo.product_idx})">▼</button>
											<button id="increase" onclick="increase(${vo.product_idx})">▲</button> --%>
											<span class="mt-auto mb-auto">수량</span>
											<table class="styled-table ms-2">
												<tr>
													<td><input id="amount-${vo.product_idx}" style="outline: none; border: none; font-size: 17px; padding: 1px;" name="amount" type="text"
														value="${vo.quantity}" onchange="amountChange(${vo.product_idx})"></td>
													<td class="vertical-buttons"><input type="button"
														class="amountBtn" value="∧" id="increase"
														onclick="increase(${vo.product_idx})"> <input type="button"
														class="amountBtn" value="∨" id="decrease"
														onclick="decrease(${vo.product_idx})"></td>
												</tr>
											</table>
										</div>

										<br>
									</div>
									<div>
										<input type="button" class="xBtn" value=" X "
											onclick="location.href='/shop/delete?product_idx=${vo.product_idx}&user_idx=${users.user_idx}'">
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>

					<div class="box3">
						<h4>주문 예상 금액</h4>
						총 상품가격: <span id="totalprice"><fmt:formatNumber
								value="${totalprice}" type="number" groupingUsed="true" />원</span><br>
						총 할인: <span id="totaldiscount" style="color: red;"><fmt:formatNumber
								value="${totaldiscount}" type="number" groupingUsed="true" />원</span><br>
						<hr>
						최종 금액: <span id="finalsum" style="color: red;"><fmt:formatNumber
								value="${totalprice - totaldiscount}" type="number"
								groupingUsed="true" />원</span><button type="button" class="buyBtn mt-3" onclick="purchase();"><span>구매하기</span></button>
					</div>
				</div>
			</div>
		</c:if>
	</c:if>

	<c:if test="${sessionScope.cart_count eq 0}">
		장바구니에 암것도 없당께
	</c:if>

	<c:if test="${empty users }">
		<!-- 로그인정보 없이 장바구니에 접근했을시 -->
		<jsp:include page="../login/signin.jsp"></jsp:include>
	</c:if>

	<script src="/shop/resources/js/httpRequest.js"></script>

	<script>  
=======
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
      
      <script src="/shop/resources/js/httpRequest.js"></script>
      
      <style>
     .button-green {
		    background-color: #4CAF50; /* 초록색 */
		    border: none;
		    color: white;
		    padding: 10px 16px;
		    font-size: 14px;
		    border-radius: 5px;
		    cursor: pointer;
		    transition: background-color 0.3s ease;
		    display: block; /* 블록 요소로 변경 */
		    margin: 0 auto; /* 가운데 정렬 */
		}
		
		.button-green:hover {
		    background-color: #45a049;
		}
		
		.button-green:active {
		    background-color: #3e8e41;
		}

      </style>
      
      <script>  
>>>>>>> refs/remotes/origin/강성수01
      window.onload = function() {
          // 모든 체크박스를 찾기
          const checkboxes = document.querySelectorAll('input[type="checkbox"]');

          checkboxes.forEach(function(checkbox) {
              // 각 체크박스의 data-checked 값을 확인하여 체크 상태 설정
              const isChecked = checkbox.getAttribute('data-checked') === '1'; // '1'이면 체크
              checkbox.checked = isChecked;
          });
         updateTotal();
      };
      
      function amountChange(product_idx) {
          
         let amountInput = parseInt(document.getElementById("amount-" + product_idx).value, 10);
         let inventory = parseInt(document.getElementById("inventory-" + product_idx).value, 10);
         let user_idx = "${sessionScope.users.user_idx}";
           
           if(amountInput >50 && amountInput < inventory){
              alert("구매한도는 50개 입니다");
              location.href="amount_update?product_idx=" + product_idx + "&user_idx=" + user_idx + "&quantity=50";
              return;
           }
           if(amountInput > inventory){
              alert("남은 수량은"+inventory+"개 입니다");
              location.href="amount_update?product_idx=" + product_idx + "&user_idx=" + user_idx + "&quantity=" + inventory;
              return;
           }
           
       
         
           location.href="amount_update?product_idx=" + product_idx + "&user_idx=" + user_idx + "&quantity=" + amountInput;
       }

       function decrease(product_idx) {
          let amountInput = parseInt(document.getElementById("amount-" + product_idx).value, 10);
         let inventory = parseInt(document.getElementById("inventory-" + product_idx).value, 10);
         let user_idx = "${sessionScope.users.user_idx}";
           
           if(amountInput == 1){
              alert("최소수량입니다");
              return;
           }
           amountInput = parseInt(amountInput) - 1;
          
           location.href="amount_update?product_idx=" + product_idx + "&user_idx=" + user_idx + "&quantity=" + amountInput;
       }

       function increase(product_idx) {
          let amountInput = parseInt(document.getElementById("amount-" + product_idx).value, 10);
         let inventory = parseInt(document.getElementById("inventory-" + product_idx).value, 10);
         let user_idx = "${sessionScope.users.user_idx}";
           
           if(amountInput == inventory){
              alert("남은 수량은"+inventory+"개 입니다");
              return;
           }
           if(amountInput>=50){
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
          let cb="#prodidx-"+product_idx;

          const checkbox = document.querySelector(cb);
          
          if(!checkbox){
             alert("없어"+product_idx);
             return;
          }
          
           const user_idx = "${sessionScope.users.user_idx}";  // JSP 표현식으로 값 받기
           const isChecked = checkbox.checked;
         let res=0;
           if(isChecked){
            res=1;
         }else{
            res=0;
         }
           // JavaScript에서 URL 인코딩을 처리
           const url = "updateChecked";
           const param = "product_idx=" + product_idx + 
                        "&user_idx=" + encodeURIComponent(user_idx) + 
                        "&checked=" + res;
           // AJAX 요청 전송
           sendRequest(url, param, resultCheck, "POST");
       }

       function resultCheck() {
           if (xhr.readyState === 4 && xhr.status === 200) {
               const data = xhr.responseText; 
               console.log( data); 
               
               if(data=="success"){
               updateTotal(); 
               }else{
                  alert("오류발생");
               }
           }
       }
       
     
       function purchase(){
          let finalAmount = document.getElementById("finalsum").textContent.trim(); // '원'을 제외하고 숫자만 처리
           let totaldiscount = document.getElementById("totaldiscount").textContent.trim();
           let totalprice = document.getElementById("totalprice").textContent.trim();

           // '원'을 제외하고 숫자만 추출
           finalAmount = finalAmount.replace("원", "").trim();
           totaldiscount = totaldiscount.replace("원", "").trim();
           totalprice = totalprice.replace("원", "").trim();   
           //  문자열이므로 숫자로 변환
           finalAmount = parseInt(finalAmount.replace(/,/g, ''), 10);
           totaldiscount =parseInt(totaldiscount.replace(/,/g, ''), 10);
           totalprice =parseInt(totalprice.replace(/,/g, ''), 10);
    
         if(finalAmount==0){
            alert("구매할항목이 없습니다.");
            return;
         }
         
         location.href='cart_purchaseForm?user_idx=${sessionScope.users.user_idx}&finalAmount='+finalAmount+"&totaldiscount="+totaldiscount+"&totalprice="+totalprice;
         
       }
     
         
      </script>
<<<<<<< HEAD
</body>
=======
   </head>
   <body>
   <jsp:include page="../header/header.jsp"></jsp:include>
    
 
   <c:if test="${!empty users }">
   <c:if test="${sessionScope.cart_count ne 0}">
   
  <c:set var="totalprice" value="0" />
  <c:set var="totaldiscount" value="0"/>
  
  <div class="cart-container">

  <c:set var="totalprice" value="0" />
  <c:set var="totaldiscount" value="0"/>
  
  <div class="container2">
    <div class="items-container">
      <c:forEach var="vo" items="${list}">
     
        <c:if test="${vo.status eq 'active' }">
        <c:set var="totalprice"  value="${totalprice + vo.price*vo.quantity}" />
        <c:set var="totaldiscount"  value="${totaldiscount + vo.price*vo.quantity-vo.realprice *vo.quantity}" /> 
        <div class="item">
         
        <input id="prodidx-${vo.product_idx}" 
       type="checkbox" 
       onclick="check(${vo.product_idx})" 
       data-checked="${vo.checked}">
       
    <div class="box1">
        <img class="cartImg" src="/shop/resources/img/${vo.filepath}" alt="상품 이미지" onclick="location.href='/shop/detail?product_idx=${vo.product_idx}'">
    </div>
    <div class="box2">
        ${vo.name} 
        <input type="hidden" id="inventory-${vo.product_idx}" value="${vo.inventory }">(남은 수량:${vo.inventory }개) <br>
        <span id="discount" class="discount"><fmt:formatNumber value="${vo.discount}" type="number" groupingUsed="true"/>%</span>
        <span id="price" class="price"><fmt:formatNumber value="${vo.price * vo.quantity}" type="number" groupingUsed="true"/>원</span><br>
        <h4><fmt:formatNumber value="${vo.realprice * vo.quantity}" type="number" groupingUsed="true"/>원</h4>
        <div class="counter-container">
          <input id="prodidx-${vo.product_idx}" type="hidden" value="${vo.product_idx}" maxlength="3">
          수량 <input id="amount-${vo.product_idx}" name="amount" value="${vo.quantity}" onchange="amountChange(${vo.product_idx})">
           
          <button id="decrease" onclick="decrease(${vo.product_idx})">▼</button>
          <button id="increase" onclick="increase(${vo.product_idx})">▲</button>
      </div>
         
            <br>
          </div>
          <div>
             <input type="button" value=" X " onclick="location.href='/shop/delete?product_idx=${vo.product_idx}&user_idx=${users.user_idx}'">
            </div>     
        </div>
        </c:if>
      </c:forEach>
    </div>
    
   <div class="box3">
    <h4>주문 예상 금액</h4>
    총 상품가격: <span id="totalprice"><fmt:formatNumber value="${totalprice}" type="number" groupingUsed="true"/>원</span><br>
    총 할인: <span id="totaldiscount"><fmt:formatNumber value="${totaldiscount}" type="number" groupingUsed="true"/>원</span><br>
    <hr>
    최종 금액: <span id="finalsum"><fmt:formatNumber  value="${totalprice - totaldiscount}" type="number" groupingUsed="true"/>원</span>
    <input type="button" class="button-green" align="center" value="구매하기" onclick="purchase();">
</div>
  </div>
</div>
</c:if>
	</c:if>
	
	<c:if test="${sessionScope.cart_count eq 0}">
		장바구니에 암것도 없당께
	</c:if>
	
   <c:if test="${empty users }">
      <!-- 로그인정보 없이 장바구니에 접근했을시 -->
      <jsp:include page="../login/signin.jsp"></jsp:include>
   </c:if>
   
   
   </body>
>>>>>>> refs/remotes/origin/강성수01
</html>