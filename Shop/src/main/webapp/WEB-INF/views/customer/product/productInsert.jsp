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
    <script src="/shop/resources/js/httpRequest.js"></script>
  	
  	
  	<script>
  	

  	
  	function send(f) {
  		
  		f.method="get";
  		f.action="addproduct";
  		f.submit();
  	}	  
	
  	
  	
	</script>
  	
  	

</head>

<body>
    <!-- 헤더 포함 -->
    <jsp:include page="../header/header.jsp"></jsp:include>
	<jsp:include page="../header/headerImg.jsp"></jsp:include>

    <!-- 상품 등록 폼 -->
    <div class="container mt-5">
        <h1 class="display-5 text-center mb-4">상품 등록</h1>
        <form>
            <div class="form-group row">
                <label for="name" class="col-sm-2 col-form-label">상품명</label>
                <div class="col-sm-8">
                    <input type="text" name="name" id="name" class="form-control" placeholder="상품명을 입력하세요" required>
                </div>
            </div>

            
            <div class="form-group row">
                <label for="unitprice" class="col-sm-2 col-form-label">가격</label>
                <div class="col-sm-8">
                    <input type="number" name="price" id="unitprice" class="form-control" placeholder="가격을 입력하세요" required>
                </div>
            </div>

            
            <div class="form-group row">
                <label for="discountRate" class="col-sm-2 col-form-label">할인율(%)</label>
                <div class="col-sm-8">
                    <input type="number" name="discount" id="discountRate" class="form-control" placeholder="할인율을 입력하세요" required>
                </div>
            </div>

           
            <div class="form-group row">
                <label for="unitInStock" class="col-sm-2 col-form-label">재고 수량</label>
                <div class="col-sm-8">
                    <input type="number" name="inventory" id="unitInStock" class="form-control" placeholder="재고 수량을 입력하세요" required>
                </div>
            </div>

           
            <div class="form-group row">
                <label for="explain" class="col-sm-2 col-form-label">상품 설명</label>
                <div class="col-sm-8">
                    <textarea name="explain" id="explain" class="form-control" rows="5" placeholder="상품 설명을 입력하세요" required></textarea>
                </div>							      
            </div>
            
            <input type="hidden" name="selleridx" value="0">

            
		 	 <div class="form-group row align-items-center">
			    <label for="imagePreview" class="col-sm-2 col-form-label">이미지</label>
			    <div class="col-sm-8">
			       
			        <div id="imagePreview" style="width: 200px; height: 200px; border: 1px solid #ddd; display: flex; align-items: center; justify-content: center; margin-bottom: 10px; overflow: hidden;">
			            <span>이미지 없음</span>
			        </div>
			
			        
			        <div class="d-flex">
			        
			            <button type="button" class="btn btn-primary me-2" >이미지 등록</button>
			           <!-- onclick="document.getElementById('imageFile').click();"-->
			            <button type="button" class="btn btn-secondary" >이미지 취소</button>
			             <!-- onclick="cancelImage()""-->
			        </div>
			
			        
			        <input type="file" id="imageFile" name="image" class="form-control-file d-none">
			        <!--  accept="image/*" onchange="previewImage(event)" -->
			    </div>
			</div> 
			
			<div class="form-group row">
                <label for="explain" class="col-sm-2 col-form-label">파일이름</label>
                <div class="col-sm-8">
                    <textarea name="filepath" id="filepath" class="form-control" rows="5" placeholder="상품 설명을 입력하세요" required></textarea>
                </div>							      
            </div>
            
			   <div class="form-group row">
				    <label for="division" class="col-sm-2 col-form-label">메인 카테고리</label>
				    <div class="col-sm-8">
				        <select name="division" id="division" class="form-control" required>
				            <option value="">::: 선택하세요 :::</option>
				            <c:forEach items="${divisions}" var="division">
				                <option value="${division}">${division}</option>
				            </c:forEach>
				        </select>
				    </div>
				</div>
				
				<div class="form-group row">
				    <label for="category" class="col-sm-2 col-form-label">세부 카테고리</label>
				    <div class="col-sm-8">
				        <select name="category" id="category" class="form-control" required>
				            <option value="">::: 선택하세요 :::</option>
				            <c:forEach items="${categories}" var="category">
				                <option value="${category}">${category}</option>
				            </c:forEach>
				        </select>
				    </div>
				</div>

            <!-- 버튼 -->
            <div class="form-group text-center">
                <button type="submit" class="btn btn-primary" onclick="send(this.form)">등록</button>
                <button type="button" class="btn btn-secondary" onclick="history.back()">취소</button>
            </div>
            
            
            
            <br><br><br><br><br><br><br><br><br><br><br><br><br>
            
            
            
            
            
        </form>
        
    </div>
</body>
</html>