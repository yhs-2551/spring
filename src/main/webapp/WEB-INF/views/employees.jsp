<%--
  Created by IntelliJ IDEA.
  User: YHS
  Date: 2024-06-25
  Time: 오전 5:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<html>
<head>
    <title>직원 목록 페이지</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
</head>
<style>
    .mt-custom {
        margin-top: 3rem;
    }

</style>
<body>

<div class="container mt-custom">
    <h1>직원 목록</h1>
    <p class="text-right">
        <a href="add-edit-employee" class="btn btn-primary">직원 추가</a>
    </p>

    <Table border="1" class="table table-striped table-bordered" style="text-align: center">
        <thead class="thead-dark">
        <tr>
            <th>이름</th>
            <th>이메일</th>
            <th>성별</th>
            <th>취미</th>
            <th>주소</th>
            <th>작업</th>
        </tr>
        </thead>


        <c:forEach items="${listEmployees}" var="e">

        <c:url var="deleteLink" value="/delete-employee">
            <c:param name="employeeId" value="${e.id}"/>
        </c:url>

        <c:url var="updateLink" value="/edit-employee">
            <c:param name="employeeId" value="${e.id}"/>
        </c:url>

        <tbody>
        <tr>
            <td>${e.name}</td>
            <td>${e.email}</td>
            <td>${e.gender}</td>
            <td>${e.hobbies}</td>
            <td>${fn:replace(e.hobbies, ",", ", ")}</td>
            <td>
                <a href="${updateLink}">수정</a> |
                <a href="${deleteLink}"
                   onclick="if(!(confirm('정말 삭제 하시겠습니까?'))) return false">삭제</a>
            </td>
        </tr>
        </c:forEach>
        </tbody>
    </Table>
</div>
</body>
</html>
