<%--
  Created by IntelliJ IDEA.
  User: YHS
  Date: 2024-07-02
  Time: 오후 8:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s" %>

<html>
<head>
    <title>직원 추가 및 수정 페이지</title>


    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
    <style>
        .mt-custom {
            margin-top: 16px !important;
        }
        .mb-custom {
            margin-bottom: 0;
        }
    </style>


</head>
<body>
<div class="container" style="margin-top: 3rem">
    <h1>
        <c:choose>
            <c:when test="${not empty employee.id}">
                직원 수정
            </c:when>
            <c:otherwise>
                직원 추가
            </c:otherwise>
        </c:choose>
    </h1>
    <hr/>
    <s:form modelAttribute="employee" action="save-employee" cssClass="mt-custom">

        <input type="hidden" value="${employee.hobbies}" id="hobbiesText">
        <s:hidden path="id"/>

        <div>
            <s:input path="name" class="form-control" placeholder="이름"/>
        </div>
        <div class="mt-custom">
            <s:input path="email" class="form-control" placeholder="이메일"/>
        </div>

        <div class="mt-custom">
            <div class="form-group">
                <p class="mb-custom">성별</p>
                <div class="form-check-inline">
                    <label class="form-check-label">
                        <s:radiobutton class="form-check-input" path="gender" value="남성"/>남성
                    </label>
                </div>
                <div class="form-check-inline">
                    <label class="form-check-label">
                        <s:radiobutton class="form-check-input" path="gender" value="여성"/>여성
                    </label>
                </div>
            </div>

            <div class="form-group">
                <p class="mb-custom">취미</p>
                <div class="form-check-inline">
                    <label class="form-check-label">
                        <s:checkbox path="hobbies" value="독서" class="form-check-input"/>독서
                    </label>
                </div>
                <div class="form-check-inline">
                    <label class="form-check-label">
                        <s:checkbox path="hobbies" value="운동" class="form-check-input"/>운동
                    </label>
                </div>
                <div class="form-check-inline">
                    <label class="form-check-label">
                        <s:checkbox path="hobbies" value="게임" class="form-check-input"/>게임
                    </label>
                </div>
            </div>

        </div>

        <div class="mt-custom">
            <s:textarea class="form-control" path="address" placeholder="주소"/>
        </div>

        <div class="mt-custom">
            <input type="submit" value="저장" class="btn btn-info"/>
            <input type="reset" value="초기화" class="btn btn-danger">
        </div>
    </s:form>
    <hr/>

    <c:url var="rootLink" value="/"/>

    <p>
        <a href="${rootLink}">목록</a>
    </p>
</div>
<script>

    $(document).ready(() => {
        const hobbies = $("#hobbiesText").val().split(",");
        console.log("hodf" + hobbies);
        const $checkboxes = $("input[type=checkbox]");
        $checkboxes.each((idx, element) => {
            if (hobbies.indexOf(element.value) !== -1) {
                element.setAttribute("checked", "checked");
            } else {
                element.removeAttribute("checkd");
            }
        });
    });
</script>

</body>
</html>
