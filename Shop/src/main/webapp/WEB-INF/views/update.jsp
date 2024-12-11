<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상품 등록</title>

    <link rel="icon" type="image/x-icon" href="/shop/resources/img/favicon.ico" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="/shop/resources/css/style1.css" rel="stylesheet" />
    <link href="/shop/resources/css/style2.css" rel="stylesheet" />
    <link href="/shop/resources/css/style3.css" rel="stylesheet" />
    <link href="/shop/resources/css/style4.css" rel="stylesheet" />
    <link href="/shop/resources/css/style5.css" rel="stylesheet" />
    <link href="/shop/resources/css/style6.css" rel="stylesheet" />
    <link href="/shop/resources/css/style7.css" rel="stylesheet" />
    <script src="/shop/resources/js/amount_counter.js"></script>
</head>

<body>
    
    <jsp:include page="header.jsp"></jsp:include>
    <jsp:include page="headerImg.jsp"></jsp:include>	

    
    <div class="container mt-5">
        <h1 class="display-5 text-center mb-4">상품 등록</h1>
        <form name="newProduct" action="/processAddProduct.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
           
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">상품명</label>
                <div class="col-sm-8">
                    <input type="text" name="name" class="form-control" placeholder="상품명을 입력하세요" required>
                </div>
            </div>

           
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">가격</label>
                <div class="col-sm-8">
                    <input type="number" name="unitprice" class="form-control" placeholder="가격을 입력하세요" required>
                </div>
            </div>

            
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">할인율(%)</label>
                <div class="col-sm-8">
                    <input type="number" name="discountRate" class="form-control" placeholder="할인율을 입력하세요" required>
                </div>
            </div>

            
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">재고 수량</label>
                <div class="col-sm-8">
                    <input type="number" name="unitInStock" class="form-control" placeholder="재고 수량을 입력하세요" required>
                </div>
            </div>

            
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">상품 설명</label>
                <div class="col-sm-8">
                    <textarea name="description" class="form-control" rows="5" placeholder="상품 설명을 입력하세요" style="resize: none;" required></textarea>
                </div>
            </div>

           
	        <div class="form-group row align-items-center">
	            <label class="col-sm-2 col-form-label">이미지</label>
	            <div class="col-sm-8">
	                <!-- 미리보기 -->
	                <div id="imagePreview" style="width: 200px; height: 200px; border: 1px solid #ddd; display: flex; align-items: center; justify-content: center; margin-bottom: 10px;">
	                    <span>이미지 없음</span>
	                </div>


	                <div class="d-flex">
	                    <button  class="btn btn-primary me-2" onclick="document.getElementById('imageFile').click();">이미지 선택</button>
	                    <button  class="btn btn-secondary" onclick="cancelImage()">이미지 취소</button>
	                </div>
	                <input type="file" id="imageFile" name="image" class="form-control-file d-none" accept="image/*" onchange="previewImage(event)">
	            </div>
	        </div>

           
			           <div class="form-group row">
			    <label class="col-sm-2 col-form-label">카테고리</label>
			    <div class="col-sm-8">
			        <select name="category" class="form-control" required>
			            <option value="">::: 선택하세요 :::</option>
			            <c:forEach items="${vo.categories}" var="category">
			                <option value="${category}">${category}</option>
			            </c:forEach>
			        </select>
			    </div>
			</div>
			
			<div class="form-group row">
			    <label class="col-sm-2 col-form-label">세부 카테고리</label>
			    <div class="col-sm-8">
			        <select name="division" class="form-control" required>
			            <option value="">::: 선택하세요 :::</option>
			            <c:forEach items="${vo.divisions}" var="division">
			                <option value="${division}">${division}</option>
			            </c:forEach>
			        </select>
			    </div>
			</div>



            <div class="form-group text-center">
                <button class="btn btn-primary">등록</button>
                <button class="btn btn-secondary" onclick="history.back()">취소</button>
            </div>
        </form>
    </div>
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    
</body>
</html>



























