<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	href="/shop/resources/img/favicon.ico" />
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
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<!-- Section-->

	<section class="py-5">
		<div class="container px-4 px-lg-5 mt-5">
			<div
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<!-- 상품 1개 시작 -->
				<c:forEach var="vo" items="${list}">
					<div class="col mb-5">
						<div class="card h-100">
							<!-- Product image-->
							<img class="card-img-top" src="/shop/resources/img/${vo.filepath}"
								alt="..." />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<h5 class="fw-bolder">${vo.name }</h5>
									<!-- Product price-->
									${vo.price}
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				<!--상품 1개 끝  -->

			</div>
		</div>
	</section>
	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2023</p>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="/shop/resources/js/scripts.js"></script>
</body>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<link
    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
    rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/shop/resources/css/style1.css" rel="stylesheet" />
<link href="/shop/resources/css/style2.css" rel="stylesheet" />
<link href="/shop/resources/css/style3.css" rel="stylesheet" />
<link href="/shop/resources/css/style4.css" rel="stylesheet" />
<link href="/shop/resources/css/style5.css" rel="stylesheet" />

<!-- Bootstrap core JS-->
<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<link rel="icon" type="image/x-icon"
	href="/shop/resources/img/favicon.ico" />

<!-- Core theme JS-->
<script src="/shop/resources/js/scripts.js"></script>
<body>

	<jsp:include page="header.jsp"></jsp:include>


카테고리 : ${param.category } <br>
		
	<c:forEach var="vo" items="${list}">
		<c:if test="${param.category eq ''}"> 

				${vo.idx }  
				${vo.name }
				${vo.price }
				${vo.discount }
				${vo.inventory }
				${vo.explanation }
				${vo.selleridx }
				${vo.filepath }
				${vo.category } <br>
			</c:if> 
		</c:forEach>
		
				 

	<c:forEach var="vo" items="${list}">
		<c:if test="${vo.category eq param.category }"> 
				${vo.idx }  
				${vo.name }
				${vo.price }
				${vo.discount }
				${vo.inventory }
				${vo.explanation }
				${vo.selleridx }
				${vo.filepath }
				${vo.category } <br>

		</c:if>
	</c:forEach>
</body>
>>>>>>> refs/remotes/origin/김정완
</html>