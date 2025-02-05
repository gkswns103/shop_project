<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Want It 주문</title>
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
.pay {
    background-color: #4CAF50; /* 초록색 */
    border: none;
    color: white;
    padding: 10px 16px;
    font-size: 14px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.pay:hover {
    background-color: #45a049;
}

.pay:active {
    background-color: #3e8e41;
}
.button-green {
    background-color: #4CAF50; /* 초록색 */
    border: none;
    color: white;
    padding: 10px 16px;
    font-size: 14px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.button-green:hover {
    background-color: #45a049;
}

.button-green:active {
    background-color: #3e8e41;
}

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
   width: 100%
}

.buyList {
   border-top: 3px solid #dbdbdb;
   border-bottom: 3px solid #dbdbdb;
   border-collapse: collapse;
   width: 100%;
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

#entryNum {
   display: none;
}

.custom-btn {
  width: 170px;
  height: 50px;
  color: #fff;
  border-radius: 5px;
  padding: 10px 25px;
  font-family: 'Lato', sans-serif;
  font-weight: 500;
  background: transparent;
  cursor: pointer;
  transition: all 0.3s ease;
  position: relative;
  display: inline-block;
   box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
   7px 7px 20px 0px rgba(0,0,0,.1),
   4px 4px 5px 0px rgba(0,0,0,.1);
  outline: none;
}
.btn-11 {
  border: none;
  background: #454685;
    background: linear-gradient(0deg, #454685 0%, #454685 100%);
    color: #fff;
    overflow: hidden;
}
.btn-11:hover {
    text-decoration: none;
    color: #fff;
}
.btn-11:before {
    position: absolute;
    content: '';
    display: inline-block;
    top: -180px;
    left: 0;
    width: 30px;
    height: 100%;
    background-color: #fff;
    animation: shiny-btn1 3s ease-in-out infinite;
}
.btn-11:hover{
  opacity: .7;
}
.btn-11:active{
  box-shadow:  4px 4px 6px 0 rgba(255,255,255,.3),
              -4px -4px 6px 0 rgba(116, 125, 136, .2), 
    inset -4px -4px 6px 0 rgba(255,255,255,.2),
    inset 4px 4px 6px 0 rgba(0, 0, 0, .2);
}


@-webkit-keyframes shiny-btn1 {
    0% { -webkit-transform: scale(0) rotate(45deg); opacity: 0; }
    80% { -webkit-transform: scale(0) rotate(45deg); opacity: 0.5; }
    81% { -webkit-transform: scale(4) rotate(45deg); opacity: 1; }
    100% { -webkit-transform: scale(50) rotate(45deg); opacity: 0; }
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
               <th>배송 메시지</th>
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
                     <input id="easy_payment" name="checkbox" type="radio" value="간편결제">간편결제
                  </label>   
               </td>
                  
            </tr>
         </table>
         <div align="center">
         <span>위 주문 내용을 확인 하였으며, 회원 본인은 개인정보 이용 및 제공(해외직구의 경우 국외제공) 및 결제에 동의합니다.</span>
         <button class="custom-btn btn-11 mt-3 mb-5" type="button"
            onclick="purchase(this.form)">결제하기<div class="dot"></div></button>
         </div>
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
         name="finalAmount" id="finalAmount"
         value="${vo.price * vo.quantity-discountprice*vo.quantity}">
   </form>
   
  


   <script>
      function purchase(f) {
         let easy_payment = document.getElementById('easy_payment');
         
         let deliverymessage = f.deliverymessage.value.trim();
         
         if (deliverymessage == "") {
            alert("배송메시지를 입력하세요");
            return;
         }
         if (!easy_payment.checked) {
            alert("결제방법을 선택해주세요");
            return;
         }

         let request = document.getElementById("request").value;
         let entryNum = document.getElementById("entryNum");

         let deliveryrequest = request;
         if (entryNumCheck && entryNum.value.trim() !== "") {
            deliveryrequest += "(" + entryNum.value + ")";
         }

         let deliveryrequestField = document.getElementById("deliveryrequest");
         deliveryrequestField.value = deliveryrequest;
            
              if(easy_payment.checked){
              f.action="easyPayment";
              f.submit();
              }
      
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