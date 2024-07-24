<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>로그인 페이지</title>
</head>
<body>
    <form action="/member/login" method="post">
        <input type="email" name="memberEmail" placeholder="이메일">
        <input type="password" name="memberPassword" placeholder="비밀번호">
        <input type="submit" value="로그인">
    </form>
</body>
</html>