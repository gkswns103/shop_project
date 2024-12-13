   //카카오로그인
   function kakaoLogin() {

      $.ajax({
         url : '/shop/getKakaoAuthUrl',
         type : 'get',
         async : false,
         dataType : 'text',
         success : function(res) {
            location.href = res;
         }
      });

   }

   $(document).ready(
         function() {

            var kakaoInfo = '${kakaoInfo}';

            if (kakaoInfo != "") {
               var data = JSON.parse(kakaoInfo);

               alert("카카오로그인 성공 \n accessToken : " + data['accessToken']);
               alert("user : \n" + "email : " + data['email']
                     + "\n nickname : " + data['nickname']);
            }
         });

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
      let param = "id=" + id + "&c_pwd=" + encodeURIComponent(c_pwd);
      sendRequest(url, param, resultlog, "post");
   }

   function resultlog() {
      if (xhr.readyState == 4 && xhr.status == 200) {
         let date = xhr.responseText;

         if (date === 'no_id') {
            alert("없는 id");
            return;
         } else if (date === 'no_pwd') {
            alert("비밀번호가 틀립니다.");
            return;
         } else {
            location.href = "/shop/";
         }

      }

   }