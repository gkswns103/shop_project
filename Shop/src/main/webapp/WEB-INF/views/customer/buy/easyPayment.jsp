<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <script src="https://js.tosspayments.com/v2/standard"></script>
   
   <style>
.w-100 {
width: 100%;
min-width: 800px;
}

.h-100 {
height: 100%;
}

a {
text-decoration: none;
text-align: center;
}

.wrapper {
display: flex;
flex-direction: column;
align-items: center;
padding: 24px;
overflow: auto;
}

.max-w-540 {
max-width: 540px;
}

.btn-wrapper {
padding: 0 24px;
}

.btn {
padding: 11px 22px;
border: none;
border-radius:  8px;

background-color: #f2f4f6;
color: #4e5968;
font-weight: 600;
font-size: 17px;
cursor: pointer;
}

.btn.primary {
background-color: #3282f6;
color: #f9fcff;
}

.text-center {
text-align: center;
}

.flex {
display: flex;
}

.flex-column {
display: flex;
flex-direction: column;
}

.justify-center {
justify-content: center;
}

.justify-between {
justify-content: space-between;
}

.align-center {
align-items: center;
}

.confirm-loading {
margin-top: 72px;
height: 400px;
justify-content: space-between;
}


.confirm-success {
display: none;
margin-top: 72px;
}

.button-group {
margin-top: 32px;
display: flex;
flex-direction: column;
justify-content: center;
gap: 16px;
}

.title {
margin-top: 32px;
margin-bottom: 0;
color: #191f28;
font-weight: bold;
font-size: 24px;
}

.description {
margin-top: 8px;
color: #4e5968;
font-size: 17px;
font-weight: 500;
}

.response-section {
margin-top: 60px;
display: flex;
flex-direction: column;
gap: 16px;
font-size: 20px;
}

.response-section .response-label {
font-weight: 600;
color: #333d48;
font-size: 17px;
}

.response-section .response-text {
font-weight: 500;
color: #4e5968;
font-size: 17px;
padding-left: 16px;
word-break: break-word;
text-align: right;
}

.color-grey {
color: #b0b8c1;
}

.p-grid.payment-widget-cache-obp0gy > :nth-child(4) {
  display: none;
}
 
 
   </style>
</head>
<body>
	하이
   <div class="wrapper w-100">
      <div class="max-w-540 w-100">
        <div id="payment-method" class="w-100"></div>
        <div id="agreement" class="w-100"></div>
        <div class="btn-wrapper w-100">
          <button id="payment-request-button" class="btn primary w-100">결제하기</button>
        </div>
      </div>
    </div>
    
    <script>

      main();
      
      async function main() {
         
        const button = document.getElementById("payment-request-button");
        // ------  결제위젯 초기화 ------
        const clientKey = "test_gck_docs_Ovk5rk1EwkEbP0W43n07xlzm";
        const tossPayments = TossPayments(clientKey);
        // 회원 결제
        const customerKey = "rbj0WYJTjMj1ypIDFZNtK";
        const widgets = tossPayments.widgets({
          customerKey,
        });

        // ------ 주문의 결제 금액 설정 ------
     
        await widgets.setAmount({
          currency: "KRW",
          value: ${totalprice},
        });

        await Promise.all([
          // ------  결제 UI 렌더링 ------
          widgets.renderPaymentMethods({
            selector: "#payment-method",
            variantKey: "DEFAULT",
          }),
          // ------  이용약관 UI 렌더링 ------
          widgets.renderAgreement({ selector: "#agreement", variantKey: "AGREEMENT" }),
        ]);


        // ------ '결제하기' 버튼 누르면 결제창 띄우기 ------
        button.addEventListener("click", async function () {
          await widgets.requestPayment({
           
            orderId: "${ordernumber}",
            orderName: "${prodname}",
            successUrl: window.location.origin + "/shop/purchaseSuccess?ordernumber=${ordernumber}&user_idx=${user_idx}",
            failUrl: window.location.origin + "/shop/purchaseFail",
            customerEmail: "${user.email}",
            customerName: "${user.name}",
            customerMobilePhone: "01012341234",
          });
        });
      }
    </script>
</body>
</html>