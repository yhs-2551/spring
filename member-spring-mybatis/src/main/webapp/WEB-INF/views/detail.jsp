<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>디테일 페이지</title>
</head>
<body>
    <table>
        <tr>
            <th>id</th>
            <td>${member.id}</td>
        </tr>
        <tr>
            <th>email</th>
            <td>${member.memberEmail}</td>
        </tr>
        <tr>
            <th>password</th>
            <td>${member.memberPassword}</td>
        </tr>
        <tr>
            <th>name</th>
            <td>${member.memberName}</td>
        </tr>
        <tr>
            <th>age</th>
            <td>${member.memberAge}</td>
        </tr>
        <tr>
            <th>Phone Number</th>
            <td>${member.memberPhoneNumber}</td>
        </tr>
    </table>
</body>
</html>