<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입 페이지</title>
</head>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<body>
     <form action="/member/save" method="post">
         <input type="email" name="memberEmail" placeholder="이메일" class="memberEmail" onkeyup="debouncedEmailCheck()">
         <p class="email-check-result"></p>
         <input type="password" name="memberPassword" placeholder="비밀번호">
         <input type="text" name="memberName" placeholder="이름">
         <input type="number" name="memberAge" placeholder="나이" min="0" max="100">
         <input type="tel" name="memberPhoneNumber" placeholder="전화번호">
         <input type="submit" value="회원가입">
     </form>

     <script>

       let emailCheckTimeout;

       // 사용자가 모든 입력을 마친 후 0.3초 뒤에 emailCheck 함수 실행
       const debouncedEmailCheck = () => {
           clearTimeout(emailCheckTimeout);
           emailCheckTimeout = setTimeout(emailCheck, 300);
       };


       const emailCheck = () => {
             const email = document.querySelector(".memberEmail").value;
             const emailCheckResult = document.querySelector(".email-check-result");
             $.ajax({
                 type: "post",
                 url: "/member/email-check",
                 data: {
                     memberEmail: email
                 },
                 success: (result) => {
                    if (result === "ok") {
                        emailCheckResult.style.color = "blue";
                        emailCheckResult.innerHTML = "사용 가능한 이메일 입니다.";
                    } else {
                        emailCheckResult.style.color = "red";
                        emailCheckResult.innerHTML = "이미 사용중인 이메일 입니다.";
                    }
                  },

                  error: (err) => {
                      console.log("에러", err);
                  }
             });
         }

     </script>
</body>
</html>