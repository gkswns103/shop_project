<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Shop Home</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="/shop/resources/img/파비콘_로고(완).png" />
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
<!-- 상품 애니메이션 -->
<link href="/shop/resources/dist/aos.css" rel="stylesheet" />


<!-- 구글폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@100..900&display=swap"
	rel="stylesheet">

<style>
/* 헤더 고정 */
header {
	position: fixed;
	top: 0;
	width: 100%;
	z-index: 1030;
}

body {
	padding-top: 70px; /* 헤더 높이만큼 여백 추가 */
	background-size: cover; /* 배경 이미지를 화면에 맞게 조정 */
	background-repeat: no-repeat; /* 배경 이미지를 반복하지 않음 */
	background-attachment: fixed; /* 배경을 고정하여 스크롤에도 따라오지 않음 */
	background-position: center; /* 배경 이미지의 위치를 가운데로 설정 */
}

.announcement {
	width: 80%;
	height: auto;
	margin-top: 40px;
	margin-left:auto;
	margin-right:auto;
	display: flex;
	font-size: 20px;
	background-color: #f1f0f0;
	border-radius: 30px;
	justify-content: center;
	align-items: center;
}

dl {
	display: flex;
	align-items: center;
}

.notice_dt {
	border-radius: 10px;
	background-color: #454685;
	color: white;
	padding: 3px 10px;
	font-size: 20px;
}

.event_dt {
	border-radius: 10px;
	background-color: #ecdf2b;
	color: white;
	padding: 3px 10px;
	font-size: 20px;
}

dd {
	margin-left: 20px;
	font-size: 20px;
	display: flex;
	justify-content: center; /* 수평 가운데 정렬 */
	align-items: center; /* 수직 가운데 정렬 */
}

ul {
	list-style: none;
}

.notice {
	width: 40%;
	margin-left: 10%;
	margin-bottom: 20px;
	margin-top: 20px;
}

.event {
	width: 40%;
	margin-left: 10%;
	margin-bottom: 20px;
	margin-top: 20px;
}
</style>



</head>
<body>

	<!-- Header-->
	<header>
		<jsp:include page="./customer/header/header.jsp"></jsp:include>
	</header>
	<div class="headerimg">
		<jsp:include page="./customer/header/headerImg.jsp"></jsp:include>
	</div>


	<div class="announcement">
		<div class="notice">
			<ul>
				<li>
					<dl>
						<dt class="notice_dt">공 지</dt>
						<dd><a href="#">2025-01-02 업데이트</a></dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt class="notice_dt">공 지</dt>
						<dd><a href="#">2025-01-01 업데이트</a></dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt class="notice_dt">공 지</dt>
						<dd><a href="#">2025-12-25 업데이트</a></dd>
					</dl>
				</li>
			</ul>
		</div>
		<div class="event">
			<ul>
				<li>
					<dl>
						<dt class="event_dt">이벤트</dt>
						<dd><a href="#">1월 신년 이벤트 진행중~</a></dd>
					</dl>
				</li>
			</ul>
		</div>
	</div>
	<!-- Section-->
	<section class="py-5">
		<div class="container px-4 px-lg-5 mt-5">
			<div
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<!-- 상품 1개 시작 -->

				<c:forEach var="vo" items="${list}">
					<div class="col mb-5" data-aos="fade-up">
						<div class="card h-100">
							<!-- Product image-->
							<img class="card-img-top"
								src="/shop/resources/img/${vo.filepath}" alt="..."
								onclick="location.href='/shop/detail?product_idx=${vo.product_idx}'" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<h5 class="fw-bolder">${vo.name}</h5>
									<!-- Product price-->
									<fmt:formatNumber value="${vo.price}" type="number"
										groupingUsed="true" />
									원
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<!--상품 1개 끝  -->
		</div>

	</section>
	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">
				Want It<br>대표이사:없음<br>서울특별시 강남구 강남구 테헤란로14길 6<br>후원계좌
				: 국민 852502-04-255054
			</p>
			<p class="m-0 text-center text-white fw-bold" style="font-size: 20px">고객센터
				: 010-3239-5204</p>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="/shop/resources/js/scripts.js"></script>
	<script src="/shop/resources/dist/aos.js"></script>

	<script>
		window.onload = function() {
			var res = '${param.res}';
			if (res != null && res != '') {
				alert("상품 등록 완료");
			}
		}
	</script>

	<!-- 상품 애니메이션 -->
	<script>
		AOS.init({
			duration : 800, // 애니메이션 지속 시간 (밀리초)
			easing : 'ease-in-out', // 애니메이션 효과
			once : false, // 애니메이션을 한 번만 실행
		});
	</script>

</body>
</html>