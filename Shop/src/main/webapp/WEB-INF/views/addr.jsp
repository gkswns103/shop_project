<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
    <link rel='stylesheet' href='/stylesheets/style.css' />
    <!-- jquery -->
    <script type="text/javascript" src="/js/jquery-1.11.3.min.js"></script>
    <script src="/javascript/popup_2.js"></script>
  </head>
  <body>
    <h1>개인정보 입력</h1>
    <input type="text" id="sample6_postcode" placeholder="우편번호">
    <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
    <input type="text" id="sample6_address" placeholder="주소"><br>
    <input type="text" id="sample6_detailAddress" placeholder="상세주소">
    <input type="text" id="sample6_extraAddress" placeholder="참고항목">
  </body>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <style>
    .wrong_text{font-size:1rem;color:#f44e38;letter-spacing:-.2px;font-weight:300;margin:8px 0 2px;line-height:1em;display:none}
  </style>
		<script src="/shop/resources/js/addr.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5c7aefd977d4d59940d84d9223e46d62&libraries=services,clusterer,drawing"></script>
	
</body>
</html>