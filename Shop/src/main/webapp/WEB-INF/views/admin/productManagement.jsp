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

table {
    width: 100%;
    table-layout: fixed;
    border-collapse: collapse;
}

/* 자동 줄바꿈 및 정렬 개선 */
td.product-description {
    max-width: 400px;
    min-width: 250px;
    line-height: 1.5;
    padding: 8px;
    text-align: left;
    word-break: keep-all;
    overflow-wrap: break-word;
}


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
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
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
						<a class="collapse-item" href="/shop/admin/productManagement">상품리스트</a> <a
							class="collapse-item" href="/shop/admin/apply_product">상춤 신청 관리</a> <a class="collapse-item"
							href="#">재고관리</a>
					</div>
				</div></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed"
				href="/shop/admin/admin_logout"> <i class="fas fa-sign-out-alt"></i> <span>로그아웃</span>
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
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">상품 리스트</h6>
								</div>
								<!-- Card Body -->
								<div class="card-body">
										<table class="table">
											<tr align="center">
												<th>상품번호</th>
												<th>상품이름</th>
												<th>상품가격</th>
												<th>할인률</th>
												<th>상품재고</th>
												<th>상품설명</th>
												<th>판매자IDX</th>
												<th>사진이름</th>
												<th>소분류</th>
												<th>대분류</th>
												<th>비고</th>
											</tr>
											<c:forEach var="product" items="${list}">
												<tr align="center">
													<td style="color: red;">${product.product_idx}</td>
													<td>${product.name}</td>
													<td>${product.price}</td>
													<td>${product.discount}</td>
													<td>${product.inventory}</td>
													<td>${product.explain}</td>
													<td>${product.selleridx}</td>
													<td>${product.filepath}</td>
													<td>${product.category}</td>
													<td>${product.division}</td>
													<c:set var="safeDetails">
													    <c:out value="${product.details}" escapeXml="true" />
													</c:set>
													<td>
													    <a href="#" onclick="openDetails('${product.name}'); return false;" data-details="${safeDetails}">내용 확인</a>
													</td>
													<td>
													<input type="button" style="top:auto;"
														class="btn btn-danger rounded" value="상품 삭제"
														onclick="delete_product(${product.product_idx});"></td> 
												</tr>
											</c:forEach>
										</table>
								</div>
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
		window.onload = function() {
			if ('${admin}' == "" || '${admin}' === "" || '${admin}' == null) {
				alert("<접속제한>관리자 페이지입니다.");
				location.href = "/shop/"
			}
		}

		function delete_product(product_idx) {

			if (!confirm("삭제할거?")) {
				return;
			}

			location.href = "delete_product?product_idx=" + product_idx;
		}
		
		function openDetails(name) {
		    // a 태그에서 data-details 속성을 가져옴
		    const details = event.target.getAttribute("data-details");

		    // 특수문자 및 개행 처리
		    const formattedDetails = details.replace(/\n/g, '<br>').replace(/&quot;/g, '"').replace(/&#39;/g, "'");

		    const detailWindow = window.open("", "_blank", "width=600,height=400,scrollbars=yes");
		    detailWindow.document.write("<html><head><title>상품 세부 설명</title></head><body>");
		    detailWindow.document.write("<h2>상품 세부 설명</h2>");
		    detailWindow.document.write("<p><strong>상품 이름:</strong> " + name + "</p>");
		    detailWindow.document.write("<p><strong>설명:</strong><br>" + formattedDetails + "</p>");
		    detailWindow.document.write("</body></html>");
		    detailWindow.document.close();
		}
		
		
	</script>

</body>
</html>