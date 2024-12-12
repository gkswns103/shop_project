<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>

function modify(f){
	let user_idx = f.user_idx.value;
	
	
	f.action = 'modify';
	f.method = 'post';
	f.submit();
}



</script>

</head>
<body>
<form>
<input type="hidden" name="user_idx" value="${user.user_idx}">
<table border="1">


<tr>
<th>아이디</th>
<td>${user.id}</td>
</tr>
<tr>
<th>이름</th>
<td>${user.name}</td>
</tr>
<tr>
<th>이메일</th>
<td>${user.email}</td>
</tr>
<tr>
<th>주소</th>
<td>${user.addr}</td>
</tr>
<tr>
<th>나이</th>
<td>${user.age}</td>
</tr>

<tr>
<th>판매자 인증</th>
<td>${user.sellerauth}</td>
</tr>

<tr colspan="3">
<td><input type="button" value="뒤로가기" onclick="history.back();"></td>
<td>
<input type="button" value="수정하기" onclick="modify(this.form);">
<input type="button" value="계정삭제" onclick="">
</td>
</tr>

</table>
</form>
</body>
</html>