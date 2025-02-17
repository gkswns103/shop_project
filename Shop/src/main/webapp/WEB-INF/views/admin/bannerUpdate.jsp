<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Want It 어드민 페이지</title>

<!-- Custom fonts for this template-->
<link
	href="/shop/resources/admin/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/shop/resources/admin/css/sb-admin-2.min.css"
	rel="stylesheet">

<style>
.class {
	border-top: 1px solid #E6E6E6;
	border-bottom: 1px solid #E6E6E6;
}

.class th {
	padding: 0 20px;
	font: bold;
	color: black;
	background: #FAFAFA;
}

.class td {
	padding: 0 20px;
}

.bn_udt_font {
	font-weight: bold;
	color: #5475e8
}

/* 커스텀 스위치 컨테이너 */
.switch {
	position: relative;
	display: inline-block;
	width: 40px;
	height: 20px;
}

/* 체크박스 숨기기 */
.switch input {
	opacity: 0;
	width: 0;
	height: 0;
}

/* 슬라이더 스타일 */
.slider {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: #ccc;
	transition: 0.4s;
	border-radius: 20px;
}

/* 슬라이더 안의 원 */
.slider::before {
	position: absolute;
	content: "";
	height: 16px;
	width: 16px;
	left: 2px;
	bottom: 2px;
	background-color: white;
	transition: 0.4s;
	border-radius: 50%;
}

/* 체크박스가 선택되었을 때 슬라이더 색상 변경 */
input:checked+.slider {
	background-color: #2196F3;
}

/* 체크박스가 선택되었을 때 슬라이더 원 이동 */
input:checked+.slider::before {
	transform: translateX(20px);
}

input[name="new_name"] {
	margin: 0;
	padding: 0;
	text-align: center;
	border: none; /* 기존 테두리 제거 */
	border-bottom: 2px solid #007bff; /* 밑줄 추가 */
	background: transparent; /* 배경 투명 */
	outline: none; /* 포커스 시 기본 테두리 제거 */
	font-size: 16px; /* 글자 크기 */
	transition: border-color 0.3s ease; /* 포커스 시 전환 효과 */
	color: #858796;
}

/* 포커스 시 밑줄 색상 변경 */
input[name="new_name"]:focus {
	border-bottom: 2px solid #0056b3; /* 포커스된 상태에서 더 어두운 색상 */
	color: black;
}

input[name="new_image"] {
	margin: 0;
	padding: 0;s
}

button {
	display: inline-block;
	padding: 5px 10px; /* 버튼 안의 여백 */
	font-size: 16px; /* 글자 크기 */
	color: white; /* 글자 색상 */
	background-color: #5475e8; /* 기본 배경색 */
	border: 1px solid #5475e8; /* 테두리 색상 */
	border-radius: 5px; /* 둥근 테두리 */
	cursor: pointer; /* 마우스 포인터를 손 모양으로 변경 */
	transition: background-color 0.3s ease, transform 0.2s ease;
	/* 전환 효과 */
}

/* 버튼 호버 효과 */
button:hover {
	background-color: #2e59d9; /* 호버 시 배경색 */
	border-color: #2e59d9; /* 호버 시 테두리 색상 */
}

/* 버튼 클릭 효과 */
button:active {
	background-color: #004085; /* 클릭 시 배경색 */
	border-color: #004085; /* 클릭 시 테두리 색상 */
}

/* 기본 파일 선택 버튼 숨기기 */
input[type="file"] {
	display: none; /* 기본 파일 버튼 숨김 */
}

.custom-file-upload {
	display: inline-block;
	margin: 0;
	padding: 0;
}

.custom-file-upload {
	display: inline-block;
	padding: 5px 10px;
	font-size: 16px;
	font-weight: bold;
	color: white;
	background-color: #5475e8;
	border: 1px solid #5475e8;
	border-radius: 5px;
	cursor: pointer;
	text-align: center;
	transition: background-color 0.3s ease, transform 0.2s ease;
}

/* 버튼 호버 효과 */
.custom-file-upload:hover {
	background-color: #2e59d9;
}

/* 파일 이름 표시 스타일 */
.file-name {
	display: inline-block;
	font-size : 16px;
	color: #858796;
	font-style: italic;
	font-size: 16px;
}

/* 테이블 헤더(th)와 데이터(td) 정렬 및 간격 */
.banner-insert-table th, 
.banner-insert-table td {
    text-align: center; /* 텍스트를 수평 가운데 정렬 */
    vertical-align: middle; /* 텍스트를 수직 가운데 정렬 */
    padding: 10px; /* 안쪽 여백 */
}

/* 이름 입력 필드 스타일 */
input[name="name"] {
    width: 150px; /* 입력 필드 너비 */
    height: 30px; /* 입력 필드 높이 */
    font-size: 14px; /* 글자 크기 */
    text-align: center; /* 텍스트를 가운데 정렬 */
    margin: 0 auto; /* 수평 가운데 정렬 */
}

/* 파일 선택 버튼 스타일 */
label.custom-file-upload {
    display: inline-block;
    width: 100px; /* 파일 선택 버튼 너비 */
    height: 30px; /* 파일 선택 버튼 높이 */
    line-height: 30px; /* 버튼 내부 텍스트 가운데 정렬 */
    font-size: 14px; /* 글자 크기 */
    text-align: center; /* 텍스트 가운데 정렬 */
    margin: 0 10px; /* 양쪽 간격 */
    background-color: #5475e8; /* 버튼 색상 */
    color: white; /* 텍스트 색상 */
    border-radius: 5px; /* 버튼 모서리 둥글게 */
    cursor: pointer; /* 마우스 포인터 변경 */
}

/* 파일 이름 텍스트 스타일 */
.file-name {
    display: inline-block;
    font-size: 14px; /* 글자 크기 */
    color: #858796; /* 텍스트 색상 */
    font-style: italic; /* 글자 스타일 */
    margin-right: 10px; /* 파일 선택 버튼과 간격 */
    text-align: left; /* 텍스트 왼쪽 정렬 */
}

/* 드롭다운 선택 박스 스타일 */
select[name="status"] {
    width: 80px; /* 드롭다운 너비 */
    height: 30px; /* 드롭다운 높이 */
    font-size: 14px; /* 글자 크기 */
    margin-left: 10px; /* 왼쪽 간격 */
    text-align: center; /* 텍스트 가운데 정렬 */
}

input[name="new_division"], input[name="new_category1"], input[name="new_category2"], 
input[name="new_keyword1"], input[name="new_keyword2"], input[name="new_discount"]
 {
	margin: 0;
	padding: 0;
	text-align: center;
	border: none; /* 기존 테두리 제거 */
	border-bottom: 2px solid #007bff; /* 밑줄 추가 */
	background: transparent; /* 배경 투명 */
	outline: none; /* 포커스 시 기본 테두리 제거 */
	font-size: 16px; /* 글자 크기 */
	transition: border-color 0.3s ease; /* 포커스 시 전환 효과 */
	color: #858796;
	width: 50px;
	margin-right: 60px;
}

input[name="new_discount"]
 {
	margin: 0;
	padding: 0;
	text-align: center;
	border: none; /* 기존 테두리 제거 */
	border-bottom: 2px solid #007bff; /* 밑줄 추가 */
	background: transparent; /* 배경 투명 */
	outline: none; /* 포커스 시 기본 테두리 제거 */
	font-size: 16px; /* 글자 크기 */
	transition: border-color 0.3s ease; /* 포커스 시 전환 효과 */
	color: #858796;
	width: 40px;
	margin-right: 50px;
}

input[name="name"], input[name="division"], input[name="category1"], input[name="category2"], 
input[name="keyword1"], input[name="keyword2"], input[name="discount"]
 {
	margin: 0;
	padding: 0;
	text-align: center;
	border: none; /* 기존 테두리 제거 */
	border-bottom: 2px solid #007bff; /* 밑줄 추가 */
	background: transparent; /* 배경 투명 */
	outline: none; /* 포커스 시 기본 테두리 제거 */
	font-size: 16px; /* 글자 크기 */
	transition: border-color 0.3s ease; /* 포커스 시 전환 효과 */
	color: #858796;
	width: 100px;
	
}

input[name="discount"]
 {
	margin: 0;
	padding: 0;
	text-align: center;
	border: none; /* 기존 테두리 제거 */
	border-bottom: 2px solid #007bff; /* 밑줄 추가 */
	background: transparent; /* 배경 투명 */
	outline: none; /* 포커스 시 기본 테두리 제거 */
	font-size: 16px; /* 글자 크기 */
	transition: border-color 0.3s ease; /* 포커스 시 전환 효과 */
	color: #858796;
	width: 40px;
	
}

tr.inventory th {
    padding: 15px 20px; /* 상하 15px, 좌우 20px 패딩 추가 */
    min-width: 150px; /* 최소 너비 설정 */  
    text-align: center; /* 텍스트 중앙 정렬 */
    vertical-align: middle; /* 수직 중앙 정렬 */
}

/* inventory 행 전체 너비 조정 */
tr.inventory {
    display: table-row;
    width: 100%;
    table-layout: fixed; /* 각 th의 너비를 균등하게 유지 */
}

</style>

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a class="sidebar-brand d-flex align-items-center justify-content-center"
				href="/shop/admin/admin_login">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-laugh-wink"></i>
				</div>
				<div class="sidebar-brand-text mx-3">Want It</div>
			</a>

			<!-- Heading -->
			<div class="sidebar-heading">관리</div>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseTwo"
				aria-expanded="true" aria-controls="collapseTwo"> <i
					class="fas fa-users"></i> <span>유저관리</span>
			</a>
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="/shop/admin/userManagement">유저관리</a>
						<a class="collapse-item" href="/shop/admin/orderlist">주문관리</a>
					</div>
				</div></li>

			<!-- Nav Item - Utilities Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseUtilities"
				aria-expanded="true" aria-controls="collapseUtilities"> <i
					class="fas fa-tags"></i> <span>상품관리</span>
			</a>
				<div id="collapseUtilities" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="/shop/admin/productManagement">상품리스트</a>
						<a class="collapse-item" href="/shop/admin/apply_product">상춤
							신청 관리</a>
					</div>
				</div></li>

			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseBanner"
				aria-expanded="false" aria-controls="collapseBanner"> <i
					class="fas fa-tags"></i> <span>광고관리</span>
			</a>
				<div id="collapseBanner" class="collapse"
					aria-labelledby="headingBanner" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="/shop/admin/banner">배너설정</a> <a
							class="collapse-item" href="/shop/admin/banner_update">배너
							수정/추가</a>
					</div>
				</div></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed"
				href="/shop/admin/admin_logout"> <i class="fas fa-sign-out-alt"></i>
					<span>로그아웃</span>
			</a></li>

			<!-- Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>


		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<!-- Sidebar Toggle (Topbar) -->
					<button id="sidebarToggleTop"
						class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>

				</nav>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Content Row -->

					<div class="row">

						<!-- Area Chart -->
						<div class="col-xl-12 col-lg-12">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div
									class="card-header py-3 d-flex 
									flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">배너</h6>
									<h6 style="margin-right: 200px;" class="bn_udt_font">
										배너 추가 <label class="switch"> 
										<input type="checkbox" id="toggleInsert" onchange="toggleInsertArea()" value="배너추가">
											<span class="slider"></span>
										</label>
									</h6>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<table class="table">
										<tr align="center">
											<th>배너번호</th>
											<th>이름</th>
											<th>이미지</th>
											<th>대분류</th>
											<th>카테고리1</th>
											<th>카테고리2</th>
											<th>키워드1</th>
											<th>키워드2</th>
											<th>최대할인율</th>
											<th>수정</th>
											<th>삭제</th>
										</tr>
										<c:forEach var="banner" items="${list}">
		
											<input type="hidden" name="banner_idx"
												value="${banner.banner_idx}">
											<tr align="center">
												<td>${banner.banner_idx}</td>
												<td data-name="name" data-value="${banner.name}">${banner.name}</td>
												<td data-name="image" data-value="${banner.image}">${banner.image}</td>
												<td data-name="image" data-value="${banner.division}">${banner.division}</td>
												<td data-name="image" data-value="${banner.category1}">${banner.category1}</td>
												<td data-name="image" data-value="${banner.category2}">${banner.category2}</td>
												<td data-name="image" data-value="${banner.keyword1}">${banner.keyword1}</td>
												<td data-name="image" data-value="${banner.keyword2}">${banner.keyword2}</td>
												<td data-name="image" data-value="${banner.discount}">${banner.discount}</td>
												<td><label class="switch"> <input
														type="checkbox" onchange="toggleDisplay(this)"> <span
														class="slider"></span>
												</label></td>
												<td><input type="button" value="삭제"
													class="btn btn-danger rounded"
													onclick="delete_banner(${banner.banner_idx}, '${banner.name}');">
												</td>
											</tr>
											<tr class="hidden" align="center" style="display: none;">
												<td colspan="10">
													<form action="update_banner" method="post"
														enctype="multipart/form-data">
														<input type="hidden" name="banner_idx" value="${banner.banner_idx}" required> 
															<input type="text" name="new_name" placeholder="이름"
															value="${banner.name}"  style="margin-right: 70px; margin-left: 100px;" required>
															<span class="file-name" id="udt_file-name">선택된 파일 없음</span> 
															<label for="udt_image" class="custom-file-upload" style="margin-right: 110px;">파일선택</label>
															<input type="file" id="udt_image" name="udt_image" accept="image/*" required>
															<input type="text" class="text" name="new_division" 
															value="${banner.division}" placeholder="대분류">
															<input type="text" class="text" name="new_category1" 
															value="${banner.category1}" placeholder="카테고리1">
															<input type="text" class="text" name="new_category2" 
															value="${banner.category2}" placeholder="카테고리2">
															<input type="text" class="text" name="new_keyword1" 
															value="${banner.keyword1}" placeholder="키워드1">
															<input type="text" class="text" name="new_keyword2" 
															value="${banner.keyword2}" placeholder="키워드2">
															<input type="text" class="text2" name="new_discount" 
															value="${banner.discount}" placeholder="할인율">
															<button type="submit">수정하기</button>
															
													</form>
												</td>
											</tr>


										</c:forEach>
									</table>
								</div>
							</div>
						</div>

						<div class="col-xl-12 col-lg-12" id="insert_area" style="display: none;">
							<div class="card shadow mb-4">
							<form class="insert_text" action="insert_banner" method="post" enctype="multipart/form-data">
								<!-- Card Header - Dropdown -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">배너 추가</h6>
									<button type="submit">추가</button>
								</div>
								<!-- Card Body -->
								<div align="center" class="">
								
									<table class="banner-insert-table">
										<!-- 테이블 헤더 -->
										<tr align="center" class="inventory">
											<th>배너이름(설명)</th>
											<th>이미지</th>
											<th>대분류</th>
											<th>카테고리1</th>
											<th>카테고리2</th>
											<th>키워드1</th>
											<th>키워드2</th>
											<th>할인율</th>
											<th>활성화/비활성화</th>
										</tr>
										<!-- 입력 필드와 버튼 -->
										<tr>
											<td><input type="text" name="name" placeholder="이름"></td>
											<td><span class="file-name" id="file-name">선택된 파일 없음</span>
											<label for="new_image" class="custom-file-upload">파일선택</label>
											<input type="file" id="new_image" name="new_image" accept="image/*" required></td>
											<td><input type="text" name="division" value="없음" placeholder="대분류"></td>
											<td><input type="text" name="category1" value="없음" placeholder="카테고리1"></td>
											<td><input type="text" name="category2" value="없음" placeholder="카테고리2"></td>
											<td><input type="text" name="keyword1" value="없음" placeholder="키워드1"></td>
											<td><input type="text" name="keyword2" value="없음" placeholder="키워드2"></td>
											<td><input type="text" name="discount" value="0" placeholder="할인율"></td>
											<td>
												<!-- 상태 드롭다운 -->
												<select name="status" required>
														<option value="">상태</option>
														<option value="on">on</option>
														<option value="off">off</option>
												</select>
											</td>
										</tr>
									</table>
								</div>
								</form>
							</div>
						</div>

					</div>
				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright &copy; Your Website 2021</span>
					</div>
				</div>
			</footer>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Bootstrap core JavaScript-->
	<script src="/shop/resources/admin/vendor/jquery/jquery.min.js"></script>
	<script
		src="/shop/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="/shop/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/shop/resources/admin/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="/shop/resources/admin/vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="/shop/resources/admin/js/demo/chart-area-demo.js"></script>
	<script src="/shop/resources/admin/js/demo/chart-pie-demo.js"></script>

	<script>
	// 페이지 로드 시 관리자 로그인 유무와 기본적으로 insert_area를 숨깁니다.
		window.onload = function() {
			if ('${admin}' == "" || '${admin}' === "" || '${admin}' == null) {
				alert("<접속제한>관리자 페이지입니다.");
				location.href = "/shop/"
			}
			 const insertArea = document.getElementById('insert_area');
			    insertArea.style.display = 'none';

			    if ('${admin}' == "" || '${admin}' === "" || '${admin}' == null) {
			        alert("<접속제한>관리자 페이지입니다.");
			        location.href = "/shop/";
			    }
			}
		
		function toggleDisplay(checkbox) {
		    const row = checkbox.closest('tr'); // 현재 행을 찾습니다.
		    if (!row) {
		        console.error("Cannot find the row for the checkbox");
		        return;
		    }
		    const hiddenRow = row.nextElementSibling; // 다음 행을 찾습니다.
		    if (!hiddenRow || !hiddenRow.classList.contains('hidden')) {
		        console.error("Cannot find the hidden row for the checkbox");
		        return;
		    }
		    // 체크박스 상태에 따라 display 속성을 토글합니다.
		    hiddenRow.style.display = checkbox.checked ? '' : 'none';
		}
		
		function toggleInsertArea() {
		     const checkbox = document.getElementById('toggleInsert');
		    const insertArea = document.getElementById('insert_area');
		    if (checkbox.checked) {
		        insertArea.style.display = ''; // 보이게 설정
		    } else {
		        insertArea.style.display = 'none'; // 숨김
		    } 
		}
		
		document.getElementById('udt_image').addEventListener('change', function() {
		    const fileInput = this;
		    const fileNameSpan = document.getElementById('udt_file-name');
		    if (fileInput.files.length > 0) {
		        fileNameSpan.textContent = fileInput.files[0].name; // 선택된 파일 이름 표시
		    } else {
		        fileNameSpan.textContent = '선택된 파일 없음'; // 파일이 선택되지 않은 경우
		    }
		});
		
		document.getElementById('new_image').addEventListener('change', function() {
		    const fileInput = this;
		    const fileNameSpan = document.getElementById('file-name');
		    if (fileInput.files.length > 0) {
		        fileNameSpan.textContent = fileInput.files[0].name; // 선택된 파일 이름 표시
		    } else {
		        fileNameSpan.textContent = '선택된 파일 없음'; // 파일이 선택되지 않은 경우
		    }
		});
		
		
		function update(f) {
		   let banner_idx = f.banner_idx.value;
		   let new_name = f.new_name.value;
		   let new_division = f.new_division.value;
		   let new_category1 = f.new_category1.value;
		   let new_category2 = f.new_category2.value;
		   let new_keyword1 = f.new_keyword1.value;
		   let new_keyword2 = f.new_keyword2.value;
		   let new_discount = f.new_discount.value;
		   
		   const only_num = /^[0-9]+$/;
		   
		   if(new_name === ''){
			   alert("이름을 입력하세요");
			   return;
		   }
		   
		   if(new_division ===''){
			   alert("대분류가 없다면 없음 으로 입력해주세요");
			   return
		   }
		   if(new_category1 ===''){
			   alert("카테고리가 없다면 없음 으로 입력해주세요");
			   return
		   }
		   if(new_keyword1 ===''){
			   alert("키워드가 없다면 없음 으로 입력해주세요");
			   return
		   }
		   
		   if(new_category1 === '없음' && new_category2 !=='없음' ){
			   alert("카테고리1 부터 입력해주세요");
			   return;
		   }
		   if(new_keyword1 === '없음' && new_keyword2 !=='없음' ){
			   alert("키워드1 부터 입력해주세요");
			   return;
		   }
		   if(new_discount===''){
			   alert("할인율이 없다면 0 을 입력해주세요");
			   return;
		   }
		   if(!only_num.test(new_discount)){
			   alert("숫자만 입력해주세요");
			   return;
		   }
		   
		   
		   let image_test = /^.*\.(jpg|jpeg|png|gif|bmp|webp|tiff|svg|jfif)$/i;

			if (!image_test.test(f.udt_photo.value)) {
				alert("이미지 파일만 업로드 가능합니다.");
				return;
			}
		   f.submit();
		}
		
	function  delete_banner(banner_idx,name){
		if(confirm(name+" 배너를 삭제 하시겠습니까?")){
		
		location.href = "delete_banner?banner_idx="+banner_idx;
		}
	}
		
	function insert(f) {
		// 폼 데이터 추출
		let name = f.name.value;
		let new_image = f.new_image.value;
		let division = f.division.value;
		let category1 = f.category1.value;
	    let category2 = f.category2.value;
  	    let keyword1 = f.keyword1.value;
	    let keyword2 = f.keyword2.value;
		let discount = f.discount.value;
		let status = f.querySelector('select').value;
		
		const only_num = /^[0-9]+$/;

		// 유효성 검사
		if (name === "") {
			alert("이름을 입력하세요.");
			return;
		}

		if (new_image === "") {
			alert("이미지를 선택하세요.");
			return;
		}
		
		if(division === ''){
			alert("대분류가 없다면 없음 으로 입력해주세요");
			return;
		}
		if(category1 === ''){
			alert("카테고리1이 없다면 없음 으로 입력해주세요");
			return;
		}
		if(category1 === '없음' && category2 !== '없음'){
			alert("카테고리1부터 입력해주세요");
			return;
		}
		if(keyword1 === ''){
			alert("키워드1이 없다면 없음 으로 입력해주세요");
			return;
		}
		if(keyword1 === '없음' && keyword2 !== '없음'){
			alert("키워드1부터 입력해주세요");
			return;
		}
		if(discount === ''){
			alert('할인율이 없다면 0 으로 입력해주세요');
			return;
		}
		if(!only_num.test(discount)){
			   alert("숫자만 입력해주세요");
			   return;
		   }

		// 이미지 파일 확장자 검사
		const imageExtensions = /\.(jpg|jpeg|png|gif|bmp|webp)$/i;
		if (!imageExtensions.test(new_image)) {
			alert("유효한 이미지 파일을 선택하세요 (jpg, jpeg, png, gif, bmp, webp).");
			return;
		}

		if (status === "") {
			alert("상태를 선택하세요.");
			return;
		}
		f.submit();
	}
	
	</script>

</body>
</html>