<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Want It 리뷰</title>
		
		<link rel="icon" type="image/x-icon" href="/shop/resources/img/favicon.ico" />
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
		<link href="/shop/resources/css/header.css" rel="stylesheet" />
	</head>
	<body>
	<jsp:include page="../header/header.jsp"></jsp:include>
	<section>
		<form action="reviewInsert" method="POST" enctype="multipart/form-data">
		<input type="hidden" name="product_idx" value="${vo.product_idx}">
		<input type="hidden" name="user_idx" value="${vo.user_idx}">
		<input type="hidden" name="rating" id="rating" value="2">
		<input type="hidden" name="product_name"  value="${vo.name }">
		<div class="container" style="max-width: 1000px;">
		  <h3>상품 리뷰</h3><br>
		  이 상품의 품질에 대해서 얼마나 만족하시나요?<hr>
		 
		  <table style="width: 100%; border-spacing: 10; margin-bottom: 20px;">
		    <tr>
		      <td rowspan="2" style="width: 90px; vertical-align: top;">
		        <img src="/shop/resources/img/${vo.filepath}" width="90px;">
		      </td>
		      <td style="vertical-align: top;">
		        ${vo.name} <br>
		      </td>
		    </tr>
		    <tr>
		      <td style="vertical-align: top; padding:20px;">
		        <img src="/shop/resources/img/gray.png" id="one" onclick="oneChange();">
		        <img src="/shop/resources/img/gray.png" id="two" onclick="twoChange();">
		        <img src="/shop/resources/img/gray.png" id="three" onclick="threeChange();">
		        <img src="/shop/resources/img/gray.png" id="four" onclick="fourChange();">
		        <img src="/shop/resources/img/gray.png" id="five" onclick="fiveChange();">
		      </td>
		    </tr>
			
			<tr>
				<th style="text-align: center; padding-bottom: 10px;">한줄제목</th>
				<td><textarea name="title" placeholder="한 줄 요약을 입력해주세요" style="width:800px; height:30px; resize: none;"></textarea></td>
			</tr>
		    <tr style="border-top: 1px solid gray;">
		      <th style="text-align: center;  vertical-align: top; padding-top: 30px;">
		        상세리뷰
		      </th>
		      <td style="padding-top:20px;">
		        <textarea name="comment" placeholder="다른 고객님에게 도움이 되도록 상품에 대한 솔직한 평가를 남겨주세요." style="resize:none; width: 800px; height: 300px; padding: 10px;"></textarea>
		      </td>
		    </tr>
		    
		    <tr style="border-top:1px solid gray;">
		    	<th style="text-align: center; ">사진첨부</th>
		    	<td><input type="file" id="photo" name="photo" onchange="previewImg(event);"> <img id="preview" src="" style="width:90px; padding-top:10px;"> </td>
		    </tr>
		  </table>
		  <hr>
		  <input type="button" value="취소하기" onclick="history.back();">
		  <input type="button" value="등록하기" onclick="send(this.form);">
		  </div>
		  </form>
	</section>
	
	<footer class="py-5 bg-dark">
		<div class="container">
			 <p class="m-0 text-center text-white fw-bold" style="font-size: 20px">고객센터 : 010-3239-5204</p>
         <p class="m-0 text-center text-white">Want It<br>대표이사:없음<br>서울특별시 강남구 강남구 테헤란로14길 6<br>후원계좌 : 국민 852502-04-255054 </p>
		</div>
	</footer>
	
	<script>
	 	function send(f){
			if(f.rating.value ==''){
				alert("별점을 선택하세요");
				return;
			}
			
			if(f.title.value.trim() ==''){
				alert('한줄제목을 입력하세요');
				return;
			}
			if(f.comment.value.trim() ==''){
				alert('상세리뷰를 입력하세요');
				return;
			}
			if(f.photo.value ==''){
				let result=window.confirm('사진없이 리뷰를 올리시겠습니까?');
				if(!result){
					return;				
				}
			}
			f.submit();
			
		} 
	
	 	function previewImg(event) {
	 	    let file = event.target.files[0];
	 	    if (file && file.type.startsWith('image/')) {
	 	        let reader = new FileReader();
	 	        reader.onload = function(e) {
	 	            document.getElementById('preview').src = e.target.result;
	 	        };
	 	        reader.readAsDataURL(file);
	 	    } else {
	 	        alert('이미지 파일만 업로드 가능합니다.');
	 	        document.getElementById('filepath').value = ''; // 파일 입력 초기화
	 	    }
	 	}
		
	
		function oneChange(){		
			let one=document.getElementById("one");
			let two=document.getElementById("two");
			let three=document.getElementById("three");
			let four=document.getElementById("four");
			let five=document.getElementById("five");
			
		 	let rating=document.getElementById("rating");
			rating.value='1'; 
			
			one.src="/shop/resources/img/yellow.png";
			two.src="/shop/resources/img/gray.png";
			three.src="/shop/resources/img/gray.png";
			four.src="/shop/resources/img/gray.png";
			five.src="/shop/resources/img/gray.png";
			
		}
		
		function twoChange(){	
			let one=document.getElementById("one");
			let two=document.getElementById("two");
			let three=document.getElementById("three");
			let four=document.getElementById("four");
			let five=document.getElementById("five");
			
			let rating=document.getElementById("rating");
			rating.value='2';
			
			one.src="/shop/resources/img/yellow.png";
			two.src="/shop/resources/img/yellow.png";
			three.src="/shop/resources/img/gray.png";
			four.src="/shop/resources/img/gray.png";
			five.src="/shop/resources/img/gray.png";	
			
			
		}
		function threeChange(){
			let one=document.getElementById("one");
			let two=document.getElementById("two");
			let three=document.getElementById("three");
			let four=document.getElementById("four");
			let five=document.getElementById("five");
			
			let rating=document.getElementById("rating");
			rating.value='3';
			
			one.src="/shop/resources/img/yellow.png";
			two.src="/shop/resources/img/yellow.png";
			three.src="/shop/resources/img/yellow.png";
			four.src="/shop/resources/img/gray.png";
			five.src="/shop/resources/img/gray.png";
			
		}
		function fourChange(){
			let one=document.getElementById("one");
			let two=document.getElementById("two");
			let three=document.getElementById("three");
			let four=document.getElementById("four");
			let five=document.getElementById("five");
			
			let rating=document.getElementById("rating");
			rating.value='4';
			
			one.src="/shop/resources/img/yellow.png";
			two.src="/shop/resources/img/yellow.png";
			three.src="/shop/resources/img/yellow.png";
			four.src="/shop/resources/img/yellow.png";
			five.src="/shop/resources/img/gray.png";
			
		}
		function fiveChange(){	
			let one=document.getElementById("one");
			let two=document.getElementById("two");
			let three=document.getElementById("three");
			let four=document.getElementById("four");
			let five=document.getElementById("five");
			
			let rating=document.getElementById("rating");
			rating.value='5';
			
			one.src="/shop/resources/img/yellow.png";
			two.src="/shop/resources/img/yellow.png";
			three.src="/shop/resources/img/yellow.png";
			four.src="/shop/resources/img/yellow.png";
			five.src="/shop/resources/img/yellow.png";
			
		}
		
	</script>
	</body>
</html>