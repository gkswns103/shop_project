<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="/shop/resources/js/httpRequest.js"></script>

<script>

	let can_i = "no"
	
	function send(f){
		
	if(can_i==="yes"){	
		let id = f.id.value;
		let pwd = f.pwd.value;
		
		let name = f.name.value;
		let email = f.email.value;
		let addr = f.addr.value;
		
		if( id === ''){
			alert("id를 입력하세요");
			return;
		}
		if( pwd === ''){
			alert("pwd를 입력하세요");
			return;
		}
		if( name === ''){
			alert("이름을 입력하세요");
			return;
		}
		if( email === ''){
			alert("메일을 입력하세요");
			return;
		}
		if( addr === ''){
			alert("주소를 입력하세요");
			return;
		}
		
		f.action = "modify_form";
		f.method = "post";
		f.submit();
	}else{
		alert("중복체크를 먼저 해주세요");
	}
	}
	
	
	function check(f){
		let id = f.id.value;
		let email = f.email.value;
		
		if( id === ''){
			alert("id를 입력하세요");
			return;
		}
		
		if( email === ''){
			alert("메일을 입력하세요");
			return;
		}
		
		let url = "idEmailCheck";
		let param = "id="+id;
		sendRequest(url, param, resultcheck, "post");
		
	}
	
	//아이디만 하는걸로 비밀번호 복호화
	function resultcheck(){
		if (xhr.readyState == 4 && xhr.status == 200){
			let date = xhr.responseText.trim();
			
			if(date === "no"){
				alert("아이디가 중복입니다.");
				can_i = "no";
			
			}else if(date === "yes"){
				alert("사용가능합니다.");
				can_i = "yes";		
			
			}else{
				alert("오류발생");
				
			}
			
		}
	}
	
	</script>

</head>
<body>

	<form>
		<input type="hidden" name="user_idx" value="${user.user_idx}">

		<table>

			<tr>
				<td><input name="id" value="${ user.id }"></td>
			</tr>

			<tr>
				<td><input name="pwd" type="password" value="${ user.pwd }"></td>
			</tr>

			<tr>
				<td><input name="name" value="${ user.name }"></td>
			</tr>

			<tr>
				<td><input name="email" value="${ user.email }"></td>
			</tr>

			<tr>
				<td><input name="addr" value="${ user.addr }"></td>
			</tr>

			<%-- <tr>
		<td><input name="" value="${ user.age }"></td>
		</tr> --%>

			<tr>
				<td>
				<input type="button" value="중복체크" onclick="check(this.form);"> 
				<input type="button" value="수정하기" onclick="send(this.form);"> 
				<input type="button" value="취소" onclick="history.back();">
				</td>
			</tr>

		</table>

	</form>

</body>
</html>