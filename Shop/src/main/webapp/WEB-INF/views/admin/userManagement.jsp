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
							class="collapse-item" href="#">상품추가</a> <a class="collapse-item"
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
									<h6 class="m-0 font-weight-bold text-primary">유저 리스트</h6>
								</div>
								<!-- Card Body -->
								<div class="card-body">
										<table class="table">
											<tr align="center">
												<th>유저번호</th>
												<th>유저아이디</th>
												<th>유저이름</th>
												<th>유저이메일</th>
												<th>유저주소</th>
												<th>유저나이</th>
												<th>판매자인증 여부(0:인증x 1:인증o)</th>
												<th>비고</th>
											</tr>
											<c:forEach var="user" items="${list}">
												<tr align="center">
													<td>${user.user_idx}</td>
													<td>${user.id}</td>
													<td>${user.name}</td>
													<td>${user.email}</td>
													<td>${user.addr}</td>
													<td>${user.age}</td>
													<td>${user.sellerauth}</td>
													<td><input type="button"
														class="btn btn-danger rounded" value="유저 삭제"
														onclick="delete_user(${user.user_idx});"></td>
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

		function delete_user(user_idx) {

			alert(user_idx);

			if (!confirm("삭제할거?")) {
				return;
			}

			location.href = "delete?user_idx=" + user_idx;
		}
	</script>

</body>
</html>