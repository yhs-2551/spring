<%--
  Created by IntelliJ IDEA.
  User: YHS
  Date: 2024-07-09
  Time: 오전 9:48
  To change this template use File | Settings | File Templates.
--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>list</title>
</head>
<body>
<table>
    <tr>
        <th>id</th>
        <th>title</th>
        <th>writer</th>
        <th>date</th>
        <th>hits</th>
    </tr>
    <c:forEach items="${boardList}" var="board">
        <tr>
            <td>${board.id}</td>
            <td>
                <a href="/board/view?id=${board.id}">${board.boardTitle}</a>
            </td>
            <td>${board.boardWriter}</td>
            <td>${board.boardCreatedTime}</td>
            <td>${board.boardHits}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>