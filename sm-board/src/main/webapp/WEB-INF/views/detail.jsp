<%--
  Created by IntelliJ IDEA.
  User: YHS
  Date: 2024-07-09
  Time: 오전 10:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>detail.jsp</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
<table>
    <tr>
        <th>id</th>
        <td>${board.id}</td>
    </tr>
    <tr>
        <th>writer</th>
        <td>${board.boardWriter}</td>
    </tr>
    <tr>
        <th>date</th>
        <td>${board.boardCreatedTime}</td>
    </tr>
    <tr>
        <th>hits</th>
        <td>${board.boardHits}</td>
    </tr>
    <tr>
        <th>title</th>
        <td>${board.boardTitle}</td>
    </tr>
    <tr>
        <th>contents</th>
        <td>${board.boardContents}</td>
    </tr>
</table>

<button onclick="listFn()">목록</button>
<button onclick="updateFn()">수정</button>
<button onclick="deleteFn()">삭제</button>

<div>
    <input type="text" class="commentWriter" placeholder="작성자">
    <input type="text" class="commentContents" placeholder="내용">
    <button class="comment-write-btn" onclick="commentWrite()">댓글작성</button>
</div>


<div class="comment-list">
    <table>
        <tr>
            <th>댓글번호</th>
            <th>작성자</th>
            <th>내용</th>
            <th>작성시간</th>
        </tr>
        <c:forEach items="${commentList}" var="comment">
            <tr>
                <td>${comment.id}</td>
                <td>${comment.commentWriter}</td>
                <td>${comment.commentContents}</td>
                <td>${comment.commentCreatedTime}</td>
            </tr>
        </c:forEach>
    </table>
</div>

<script>
    const listFn = () => {
        const page = `${page}`;
        location.href = "/board/paging?page=" + page;
    }

    const updateFn = () => {
        const id = `${board.id}`;
        location.href = "/board/update?id=" + id;
    }

    const deleteFn = () => {
        const id = `${board.id}`;
        console.log("id값 " + id);
        location.href = "/board/delete?id=" + id;
    }

    const commentWrite = () => {
        const commentWriter = document.querySelector(".commentWriter").value;
        const commentContents = document.querySelector(".commentContents").value;
        const boardId = `${board.id}`;

        $.ajax({
            type: "post",
            url: "/comment/save",
            data: {
                commentWriter,
                commentContents,
                boardId
            },
            dataType: "json",
            success: (commentList) => {
                console.log("커맨트리시트", commentList);
                let output = "<table>";
                output += "<tr><th>댓글번호</th>";
                output += "<th>작성자</th>";
                output += "<th>내용</th>";
                output += "<th>작성시간</th></tr>";
                for (let i in commentList) {
                    output += "<tr>";
                    output += "<td>" + commentList[i].id + "</td>";
                    output += "<td>" + commentList[i].commentWriter + "</td>";
                    output += "<td>" + commentList[i].commentContents + "</td>";
                    output += "<td>" + commentList[i].commentCreatedTime + "</td>";
                    output += "</tr>";
                }
                output += "</table>";
                document.querySelector('.comment-list').innerHTML = output;
                document.querySelector('.commentWriter').value = '';
                document.querySelector('.commentContents').value = '';
            },
            error: (e) => {
                console.log("실패", e);
            }
        });
    };
</script>

</body>
</html>