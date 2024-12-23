<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Want It 회원정보 수정</title>

<link rel="stylesheet" href="/shop/resources/css/myinfo.css">

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
	
	<main class="content-container">

		<form>
			<input type="hidden" name="user_idx" value="${user.user_idx}">
			

			<div class="info-row">
				<div class="lable">Id</div>
				<div class="value">${user.id}</div>
			</div>

			<div class="info-row">
				<div class="lable">Name</div>
				<div class="value">${user.name}</div>
			</div>

			<div class="info-row">
				<div class="lable">Email</div>
				<div class="value">${user.email}</div>
			</div>

			<div class="info-row">
				<div class="lable">Address</div>
				<div class="value">${user.addr}</div>
			</div>

			<div class="info-row">
				<div class="lable">Age</div>
				<div class="value">${user.age}</div>
			</div>

			<div class="info-row">
				<div class="lable">Seller Certification</div>
				<div class="value">${user.sellerauth}</div>
			</div>


			<div class="button-container">
				<input type="button" value="계정삭제" class="delete-btn" onclick="delete_account(this.form);">
				
				<div class=button-right>	
				<input type="button" value="수정하기" class="modify-btn" onclick="modify(this.form);">
				<input type="button" value="뒤로가기" class="back-btn" onclick="history.back();">
				</div>
			</div>
		</form>


	</main>
	
	<script src="/shop/resources/js/httpRequest.js"></script>
	
	<script>
	
		function modify(f) {
			let user_idx = f.user_idx.value;

			f.action = 'modify';
			f.method = 'post';
			f.submit();
		}

		function delete_account(f) {
		 	
			let pwd = prompt("비밀번호를 입력하세요");
			
			if(pwd === ""){
				alert("비밀번호를 입력하세요");
				return;
			}else{
				
			let url = "pass";
			let param = "user_idx="+f.user_idx.value+"&pwd="+pwd;
			
			sendRequest(url, param, resultpass, 'post');
				
			}//delete_account
			
			function resultpass(){
				if(xhr.readyState == 4 && xhr.status == 200){
					let date = xhr.responseText.trim();
					alert(date);
					if (date === "yes") {
						alert("삭제가 완료 되었습니다.");
						location.href = "/shop/";

					} else {
						alert("오류발생 관리자에게 문의하세요");
						return;
					}
					
				}
			}//resultpass
			
		}
	</script>

</body>

 <footer class="py-4 bg-dark">
      <div class="container">
         <p class="m-0 text-center text-white fw-bold" style="font-size: 20px">고객센터 : 010-3239-5204</p>
         <p class="m-0 text-center text-white">Want It<br>대표이사:없음<br>서울특별시 강남구 강남구 테헤란로14길 6<br>후원계좌 : 국민 852502-04-255054 </p>
      </div>
   </footer>
   
</html>