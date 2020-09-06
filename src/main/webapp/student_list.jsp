<%--
  Created by IntelliJ IDEA.
  User: amen
  Date: 9/5/20
  Time: 3:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Student List</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
</head>
<body>
<jsp:include page="navigator.jsp"/>
<h1>Student List:</h1>
<div class="table">
    <div class="header-row">
        <div class="header-cell">
            Id
        </div>
        <div class="header-cell">
            First name
        </div>
        <div class="header-cell">
            Last name
        </div>
        <div class="header-cell">
            Birth date
        </div>
        <div class="header-cell">
            Age
        </div>
        <div class="header-cell">
            Is special
        </div>
        <div class="header-cell">
            Average
        </div>
        <div class="header-cell">
            ECTS
        </div>
        <div class="header-cell actions-cell">
            Actions
        </div>
    </div>
    <c:forEach items="${requestScope.jakastamsobie_lista}" var="studencik">
        <div class="student-row">
            <div class="student-cell">
                <c:out value="${studencik.id}"/>
            </div>
            <div class="student-cell">
                <c:out value="${studencik.firstName}"/>
            </div>
            <div class="student-cell">
                <c:out value="${studencik.lastName}"/>
            </div>
            <div class="student-cell">
                <c:out value="${studencik.birthDate}"/>
            </div>
            <div class="student-cell">
                <c:out value="${studencik.age}"/>
            </div>
            <div class="student-cell">
                <c:out value="${studencik.special}"/>
            </div>
            <div class="student-cell">
                <c:out value="${studencik.average}"/>
            </div>
            <div class="student-cell">
                <c:out value="${studencik.ects}"/>
            </div>
            <div class="student-cell actions-cell">
                <a href="${pageContext.request.contextPath}/student/details?id=${studencik.id}">Details</a>
                <a href="${pageContext.request.contextPath}/student/delete?id=${studencik.id}">Delete</a>
            </div>
        </div>
    </c:forEach>
</div>

</body>
</html>
