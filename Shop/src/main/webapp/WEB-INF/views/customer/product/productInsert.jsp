<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<link rel="icon" type="image/x-icon"
	href="/shop/resources/img/favicon.ico" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<link href="/shop/resources/css/style1.css" rel="stylesheet" />
<link href="/shop/resources/css/style2.css" rel="stylesheet" />
<link href="/shop/resources/css/style3.css" rel="stylesheet" />
<link href="/shop/resources/css/style4.css" rel="stylesheet" />
<link href="/shop/resources/css/style5.css" rel="stylesheet" />
<link href="/shop/resources/css/style6.css" rel="stylesheet" />
<script src="/shop/resources/js/amount_counter.js"></script>
<script src="/shop/resources/js/httpRequest.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
.custom-file-input::-webkit-file-upload-button {
	border: none; /* 기본 버튼의 테두리 제거 */
	background: #007bff; /* 버튼 배경색 */
	color: white; /* 버튼 글자색 */
	padding: 5px 10px; /* 버튼 패딩 */
	border-radius: 5px; /* 버튼 모서리 둥글게 */
	cursor: pointer; /* 마우스 커서 변경 */
}
</style>
</head>

<body>
	<!-- 헤더 포함 -->
	<jsp:include page="../header/header.jsp"></jsp:include>
	<!-- 상품 등록 폼 -->
	<div class="container mt-3">
		<h1 class="display-5 text-center mb-5">상품 등록</h1>

		<form action="addproduct" method="post" enctype="multipart/form-data">
			<div class="form-group row mb-2">
				<label for="name" class="col-sm-2 col-form-label">상품명</label>
				<div class="col-sm-8">
					<input type="text" name="name" id="name" class="form-control"
						placeholder="상품명을 입력하세요" required>
				</div>
			</div>

			<div class="form-group row mb-2">
				<label for="price" class="col-sm-2 col-form-label">가격</label>
				<div class="col-sm-8">
					<input type="number" name="price" id="price" class="form-control"
						placeholder="가격을 입력하세요" required>
				</div>
			</div>


			<div class="form-group row mb-2">
				<label for="discount" class="col-sm-2 col-form-label">할인율(%)</label>
				<div class="col-sm-8">
					<input type="number" name="discount" id="discount"
						class="form-control" placeholder="할인율을 입력하세요" required>
				</div>
			</div>


			<div class="form-group row mb-2">
				<label for="inventory" class="col-sm-2 col-form-label">재고 수량</label>
				<div class="col-sm-8">
					<input type="number" name="inventory" id="inventory"
						class="form-control" placeholder="재고 수량을 입력하세요" required>
				</div>
			</div>


			<div class="form-group row mb-2">
				<label for="explain" class="col-sm-2 col-form-label">상품 설명</label>
				<div class="col-sm-8">
					<textarea name="explain" id="explain" class="form-control" rows="5"
						placeholder="상품 설명을 입력하세요" style="resize: none;" required></textarea>
				</div>
			</div>

			<input type="hidden" name="selleridx" value="${users.user_idx}">

			<div class="form-group row align-items-center mb-2">
				<label class="col-sm-2 col-form-label">이미지</label>
				<div class="col-sm-8" >

<<<<<<< HEAD
					<div class="d-flex mb-3 mt-3 ms-3" > 
=======
					<div class="d-flex mb-3 mt-3 ms-3">
>>>>>>> refs/remotes/origin/나성진3
						<input type="file" name="photo" class="custom-file-input"
							style="background-color: #f0f0f0; border: 1px solid #ccc; padding: 10px; border-radius: 5px;">
					</div>
				</div>
			</div>

			<div class="form-group row mb-2">
				<label for="division" class="col-sm-2 col-form-label">메인
					카테고리</label>
				<div class="col-sm-8">
					<select name="division" id="division" class="form-control" required>
						<option value="">::: 선택하세요 :::</option>
						<c:forEach items="${divisions}" var="division">
							<option value="${division}">${division}</option>
						</c:forEach>
					</select>
				</div>
			</div>

			<div class="form-group row mb-2">
				<label for="category" class="col-sm-2 col-form-label">세부
					카테고리</label>
				<div class="col-sm-8">
					<select name="category" id="category" class="form-control" required>
						<option value="">::: 메인 카테고리를 선택해주세요 :::</option>
					</select>
				</div>
			</div>

			<!-- 버튼 -->
			<div class="form-group text-center mb-3 mt-3">
				<input type="button" class="btn btn-primary mt-5 mb-5"
					onclick="send(this.form)" value="신청하기"> <input type="button"
					class="btn btn-secondary mt-5 mb-5" onclick="history.back()" value="취소">
			</div>
		</form>

	</div>
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2023</p>
		</div>
	</footer>
	<script>
	    // Division에 따라 Category 데이터를 준비
	    const categoryData = {
	        의류: ["남성", "여성", "유아","잠옷","속옷","신발"],
	        식품: ["육류", "채소", "해산물","조미료"],
	        전자: ["TV", "냉장고", "세탁기", "건조기", "청소기", "PC", "휴대폰"],
	        인테리어: ["디퓨저", "침구류", "커튼", "조명", "생활용품", "욕실용품", "가구", "원예", "셀프인테리어"],
	        유아: ["생필품", "완구", "가구", "식품"],
	        취미: ["스포츠", "헬스", "용품", "자전거", "낚시"],
	        반려동물: ["반려식품", "반려용품", "반려의류"],
	        생활용품: ["생활", "주방", "청소", "빨래"],
	        뷰티: ["화장품", "스킨케어", "향수"]
	    };
	
	    // Division 변경 시 Category 옵션 업데이트
	    document.getElementById("division").addEventListener("change", function () {
	        const selectedDivision = this.value; // 선택한 Division 값
	        const categorySelect = document.getElementById("category");
	
	        // 기존 옵션 초기화
	        categorySelect.innerHTML = '<option value="">::: 선택하세요 :::</option>';
	
	        // 선택된 Division에 해당하는 Category 추가
	        if (selectedDivision && categoryData[selectedDivision]) {
	            categoryData[selectedDivision].forEach(category => {
	                const option = document.createElement("option");
	                option.value = category;
	                option.textContent = category;
	                categorySelect.appendChild(option);
	            });
	        }
	    });
		
		window.onload = function() {
			var res = '${param.res}';
			if (res != null && res != '') {
				alert("상품 신청 완료");
			}
		}

		function send(f) {
			if (f.name.value == '') {
				alert("상품 이름을 적어주세요");
				return;
			}

			if (f.price.value == '') {
				alert("상품 가격을 적어주세요");
				return;
			}

			if (f.discount.value == '') {
				alert("상품 할인률을 적어주세요");
				return;
			}

			if (f.inventory.value == '') {
				alert("상품 재고 수량을 적어주세요");
				return;
			}

			if (f.explain.value == '') {
				alert("상품 설명을 적어주세요");
				return;
			}

			if (f.photo.value == '') {
				alert("상품 이미지를 선택해주세요");
				return;
			}

			if (f.division.value == '') {
				alert("메인 카테고리를 선택해주세요");
				return;
			}

			if (f.category.value == '') {
				alert("세부 카테고리를 선택해주세요");
				return;
			}

			let photo_test = /^.*\.(jpg|jpeg|png|gif|bmp|webp|tiff|svg|jfif)$/i;

			if (!photo_test.test(f.photo.value)) {
				alert("이미지 파일만 업로드 가능합니다.");
				return;
			}

			f.submit();
		}
	</script>
</body>
</html>