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

<style>
.custom-file-input::-webkit-file-upload-button {
	border: none;
	background: #007bff;
	color: white;
	padding: 5px 10px;
	border-radius: 5px;
	cursor: pointer;
}
</style>

</head>

<body>
	<!-- 헤더 포함 -->
	<jsp:include page="../header/header.jsp"></jsp:include>
	<!-- 상품 등록 폼 -->
	<div class="container mt-3">
		<br>
		<h1 class="display-5 text-center mb-5">상품 등록</h1>
		<hr>
		<br> <br>
		<div>
			<form action="addproduct" method="post" enctype="multipart/form-data">
				<div class="form-group row mb-2">
					<label for="name" class="col-sm-2 col-form-label">상품명</label>
					<div class="col-sm-8">
						<input type="text" name="name" id="name"
							class="form-control w-100" placeholder="상품명을 입력하세요" required>
					</div>
				</div>

				<div class="form-group row mb-2">
					<label for="price" class="col-sm-2 col-form-label">가격</label>
					<div class="col-sm-8">
						<input type="number" name="price" id="price"
							class="form-control w-100" placeholder="가격을 입력하세요" required>
					</div>
				</div>


				<div class="form-group row mb-2">
					<label for="discount" class="col-sm-2 col-form-label">할인율(%)</label>
					<div class="col-sm-8">
						<input type="number" name="discount" id="discount"
							class="form-control w-100" placeholder="할인율을 입력하세요" required>
					</div>
				</div>


				<div class="form-group row mb-2">
					<label for="inventory" class="col-sm-2 col-form-label">재고
						수량</label>
					<div class="col-sm-8">
						<input type="number" name="inventory" id="inventory"
							class="form-control w-100" placeholder="재고 수량을 입력하세요" required>
					</div>
				</div>


				<div class="form-group row mb-2">
					<label for="explain" class="col-sm-2 col-form-label">상품 설명</label>
					<div class="col-sm-8">
						<textarea name="explain" id="explain" class="form-control w-100"
							rows="5" placeholder="상품 설명을 입력하세요" style="resize: none;"
							required></textarea>
					</div>
				</div>

				<input type="hidden" name="selleridx" value="user_idx">

				<div class="form-group row align-items-center mb-2">
					<label class="col-sm-2 col-form-label">대표 이미지</label>
					<div class="col-sm-8">

						<div class="d-flex mb-3 mt-3 ms-3">
							<input type="file" name="photo" class="custom-file-input"
								style="background-color: #f0f0f0; border: 1px solid #ccc; padding: 10px; border-radius: 5px;">
						</div>
					</div>
				</div>

				<div class="form-group row mb-2">
					<label for="division" class="col-sm-2 col-form-label">메인
						카테고리</label>
					<div class="col-sm-8">
						<select name="division" id="division" class="form-control w-100"
							required>
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
						<select name="category" id="category" class="form-control w-100"
							required>
							<option value="">::: 메인 카테고리를 선택해주세요 :::</option>
						</select>
					</div>
				</div>

				<div class="form-group row mb-2">
					<label for="explain" class="col-sm-2 col-form-label">상품
						세부설명</label>
					<div class="col-sm-15">
						<!-- SmartEditor2 라이브러리 추가 -->
						<textarea name="details" id="smarteditor"
							style="width: 100%; height: 500px;"></textarea>
					</div>
				</div>
				<div>
					<a style="color: red">※ 가로 글자는 (공백포함) 50자 내외로 작성하시길 바랍니다. </a>
				</div>
				<!-- 버튼 -->
				<div class="form-group text-center mb-3 mt-3">
					<input type="button" class="btn btn-primary mt-5 mb-5"
						style="background: green; cursor: pointer;"
						onclick="previewDetails()" value="미리보기"> <input
						type="button" class="btn btn-primary mt-5 mb-5"
						onclick="send(this.form)" value="신청하기"> <input
						type="button" class="btn btn-secondary mt-5 mb-5"
						onclick="history.back()" value="취소">
				</div>
			</form>
		</div>

	</div>
	<!-- Footer-->
	<footer class="pt-4 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">
				Want It<br>대표이사:없음<br>서울특별시 강남구 강남구 테헤란로14길 6<br>후원계좌
				: 국민 852502-04-255054
			</p>
			<p class="m-0 text-center text-white fw-bold" style="font-size: 20px">고객센터
				: 010-3239-5204</p>
		</div>
	</footer>

	<script src="/shop/resources/js/amount_counter.js"></script>
	<script src="/shop/resources/js/httpRequest.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<!-- 네이버 스마트에디터 2.8.2.3 -->
	<script type="text/javascript"
		src="/shop/resources/smarteditor2/js/HuskyEZCreator.js"></script>

	<script>
    // Division에 따라 Category 데이터를 준비
    const categoryData = {
        의류: ["남성", "여성", "유아", "잠옷", "속옷", "신발"],
        식품: ["육류", "채소", "해산물", "조미료"],
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
        const selectedDivision = this.value;
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

    var uploadUrl = "/uploading"; 

    var oEditors = [];
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: oEditors,
        elPlaceHolder: "smarteditor",
        sSkinURI: "/shop/resources/smarteditor2/SmartEditor2Skin.html",
        fCreator: "createSEditor2",
        htParams: {
            fOnBeforeUnload: function () { },
            bUseToolbar: true,
            bUseVerticalResizer: true,
            bUseModeChanger: true,
            bSkipXssFilter: true, 
            fOnImageUpload: function (files, callback) {
                var formData = new FormData();
                formData.append("file", files[0]);

                $.ajax({
                    url: '/uploading',  
                    type: 'POST',
                    data: new FormData($('#uploadForm')[0]),
                    processData: false,
                    contentType: false,
                    success: function(response) {
                        console.log('업로드 성공:', response);
                    },
                    error: function(xhr, status, error) {
                        console.log('업로드 실패:', error);
                    }
                });

            }
        }
    });

    function send(form) {
        // 스마트에디터의 내용을 form에 반영
        oEditors.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);

        // 필수 입력 체크 로직 유지
        if (form.name.value == '') {
            alert("상품 이름을 적어주세요");
            return;
        }
        if (form.price.value == '') {
            alert("상품 가격을 적어주세요");
            return;
        }
        if (form.discount.value == '') {
            alert("상품 할인률을 적어주세요");
            return;
        }
        if (form.inventory.value == '') {
            alert("상품 재고 수량을 적어주세요");
            return;
        }

        if (form.photo.value == '') {
            alert("상품 이미지를 선택해주세요");
            return;
        }
        if (form.division.value == '') {
            alert("메인 카테고리를 선택해주세요");
            return;
        }
        if (form.category.value == '') {
            alert("세부 카테고리를 선택해주세요");
            return;
        }

        // 이미지 파일 검증
        let photo_test = /^.*\.(jpg|jpeg|png|gif|bmp|webp|tiff|svg|jfif)$/i;
        if (!photo_test.test(form.photo.value)) {
            alert("이미지 파일만 업로드 가능합니다.");
            return;
        }
        

        // 최종적으로 form 제출
        form.submit();
    }
    
    
    function previewDetails() {
        if (typeof oEditors === "undefined" || oEditors.length === 0) {
            return;
        }

        try {
            oEditors[0].exec("UPDATE_CONTENTS_FIELD", []);
            var editorContent = oEditors[0].getIR().trim();
        } catch (error) {
            console.error("스마트 에디터 반영 실패: ", error);
            return;
        }

        if (editorContent === "") {
            return;
        }

        var previewWindow = window.open("", "", "width=1000,height=600,scrollbars=yes");
        if (!previewWindow || previewWindow.closed || typeof previewWindow.closed === "undefined") {
            return;
        }

        previewWindow.document.write(`
            <html>
            <head>
                <title>미리보기</title>
                <style>
                    body { font-family: Arial, sans-serif; padding: 20px; } 
                    .content { max-width: 750px; margin: auto; white-space: pre-wrap; word-wrap: break-word; }
                    img { max-width: 100%; height: auto; display: block; margin: 10px 0; }
                    .content {
                        max-width: none !important;  
                        display: inline-block !important;
                        white-space: nowrap !important;
                    }
                </style>
            </head>
            <body>
                <div class="content">
                    <hr>
                    <div id="previewContent"></div>
                </div>
            </body>
            </html>
        `);
        previewWindow.document.close();
        previewWindow.document.getElementById("previewContent").innerHTML = editorContent;
    }


</script>

</body>
</html>
