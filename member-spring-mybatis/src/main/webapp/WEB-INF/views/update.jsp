<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>업데이트 페이지</title>
</head>
<body>
    <form action="/member/update" method="post" class="updateForm">
        id: <input type="text" name="id" value="${member.id}"readonly>
        email: <input type="email" name="memberEmail" value="${member.memberEmail}"readonly>
        password: <input type="password" name="memberPassword" class="memberPassword">
        name: <input type="text" name="memberName" value="${member.memberName}" readonly>
        age: <input type="number" name="memberAge" value="${member.memberAge}">
        Phone Number: <input type="tel" name="memberPhoneNumber" value="${member.memberPhoneNumber}">
        <input type="button" value="수정" onclick="update()">

    </form>
</div>
</body>
<script>
    const update = () => {
        const passwordDB = "${member.memberPassword}";
        const password = document.querySelector(".memberPassword").value;
        if (passwordDB === password) {
            document.querySelector(".updateForm").submit();
        } else {
            alert("비밀번호가 일치하지 않습니다!");
        }
    }
</script>
</html>