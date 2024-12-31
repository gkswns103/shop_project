   function send(f) {
      let id = f.id.value;
      let c_pwd = f.c_pwd.value;
      
      if (id === '') {
         alert("아이디를 입력하세요");
         return;
      }
      if (c_pwd === '') {
         alert("비밀번호를 입력하세요");
         return;
      }
      let url = "signin";
      let param = "id=" + id + "&c_pwd=" + encodeURIComponent(c_pwd) + "&redirect=" + f.redirect.value;
      sendRequest(url, param, resultlog, "post");
   }

   function resultlog() {
      if (xhr.readyState == 4 && xhr.status == 200) {
         let data = xhr.responseText;
		if(data == 'admin'){
			location.href = "/shop/admin/admin_login?id="+data;
		}
        else if (data === 'no_id') {
            alert("없는 id");
            return;
         } else if (data === 'no_pwd') {
            alert("비밀번호가 틀립니다.");
            return;
         } else if( data ===''){
           location.href="/shop/";
           }
          else {
            location.href = data;
         }

      }

   }
