<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table border="1">
<input type="hidden" name="idx" value="${user.user_idx}">

<tr>
<th>아이디</th>
<td>${user.id}</td>
</tr>
<tr>
<th>비밀번호</th>
<td>${user.pwd}</td>
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

<tr>
<td><input type="button" value="수정하기" onclick=""></td>
<td><input type="button"></td>
</tr>

</table>

</body>
</html>