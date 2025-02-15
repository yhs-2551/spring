<%--
  Created by IntelliJ IDEA.
  User: YHS
  Date: 2024-07-22
  Time: 오후 12:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>update.jsp</title>
</head>
<body>
<form action="/board/update" method="post">
    <input type="hidden" name="id" value="${board.id}" readonly>
    <input type="text" name="boardWriter" value="${board.boardWriter}" readonly>
    <input type="text" name="boardPassword" class="boardPassword" placeholder="비밀번호">
    <input type="text" name="boardTitle" value="${board.boardTitle}">
    <textarea name="boardContents" cols="30" rows="10">${board.boardContents}</textarea>
    <input type="button" value="수정" onclick="updateReqFn()">
</form>
</div>
</body>
<script>
    const updateReqFn = () => {
        const passInput = document.querySelector(".boardPassword").value;
        const formEl = document.querySelector("form");
        const passDB = '${board.boardPassword}';
        if (passInput === passDB) {
            formEl.submit();
        } else {
            alert("비밀번호가 일치하지 않습니다!!");
        }
    }
</script>
</html>