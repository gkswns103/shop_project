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
<title>Want It</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="/shop/resources/img/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- 상품 애니메이션 -->
<script src="/shop/resources/dist/aos.js"></script>
<link href="/shop/resources/dist/aos.css" rel="stylesheet" />

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
	<header>
		<jsp:include page="../header/header.jsp"></jsp:include>
	</header>
	<!-- Section-->
	<section class="py-5">
		<div class="container px-4 px-lg-5 mt-5">
			<div
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<!-- 상품 1개 시작 -->
				<c:forEach var="vo" items="${list}">
					<c:if test="${param.category eq ''}">
						<div class="col mb-5" data-aos="fade-up">
							<div class="card h-100">
								<!-- Product image-->
								<img class="card-img-top"
									src="/shop/resources/img/${vo.filepath}"
									onclick="location.href='/shop/detail?product_idx=${vo.product_idx}'"
									alt="..." />
								<!-- Product details-->
								<div class="card-body p-4">
									<div class="text-center">
										<!-- Product name-->
										<h5 class="fw-bolder">${vo.name }</h5>
										<!-- Product price-->
										<c:if test="${vo.discount ne 0}">
											<!-- 할인이 있는경우 -->
										${vo.discount}%
										<del>
												<fmt:formatNumber value="${vo.price}" type="number"
													groupingUsed="true" />
												원
											</del>
											<br>
											<span style="color: red; font-weight: bold; font-size: 18px;">
												<fmt:formatNumber
													value="${vo.price - (vo.price * vo.discount / 100)}"
													type="number" groupingUsed="true" maxFractionDigits="0"
													minFractionDigits="0" />원
											</span>
										</c:if>
										<c:if test="${vo.discount eq 0}">
											<!-- 할인이 없는경우 -->
											<span style="font-weight: bold; font-size: 18px;"><fmt:formatNumber
													value="${vo.price}" type="number" groupingUsed="true" />원</span>
										</c:if>
									</div>
								</div>
							</div>
						</div>

					</c:if>
					<c:if test="${param.category eq vo.category}">
						<div class="col mb-5" data-aos="fade-up">
							<div class="card h-100">
								<!-- Product image-->
								<img class="card-img-top"
									src="/shop/resources/img/${vo.filepath}"
									onclick="location.href='/shop/detail?product_idx=${vo.product_idx} '"
									alt="..." />
								<!-- Product details-->
								<div class="card-body p-4">
									<div class="text-center">
										<!-- Product name-->
										<h5 class="fw-bolder">${vo.name }</h5>
										<!-- Product price-->
										<c:if test="${vo.discount ne 0}">
											<!-- 할인이 있는경우 -->
										${vo.discount}%
										<del>
												<fmt:formatNumber value="${vo.price}" type="number"
													groupingUsed="true" />
												원
											</del>
											<br>
											<span style="color: red; font-weight: bold; font-size: 18px;">
												<fmt:formatNumber
													value="${vo.price - (vo.price * vo.discount / 100)}"
													type="number" groupingUsed="true" maxFractionDigits="0"
													minFractionDigits="0" />원
											</span>
										</c:if>
										<c:if test="${vo.discount eq 0}">
											<!-- 할인이 없는경우 -->
											<span style="font-weight: bold; font-size: 18px;"><fmt:formatNumber
													value="${vo.price}" type="number" groupingUsed="true" />원</span>
										</c:if>
									</div>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
				<!--상품 1개 끝  -->

			</div>
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

	<script>
		AOS.init({
			duration : 800, // 애니메이션 지속 시간 (밀리초)
			easing : 'ease-in-out', // 애니메이션 효과
			once : false, // 애니메이션을 여러번 실행
		});
	</script>
</body>
</html>