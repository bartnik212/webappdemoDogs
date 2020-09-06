<%--
  Created by IntelliJ IDEA.
  User: amen
  Date: 9/6/20
  Time: 1:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Student details</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
</head>
<body>
<jsp:include page="navigator.jsp"/>
<h1>Details of student with id: ${requestScope.student.id}</h1>

<div class="details-container">
    <div class="details-section">
        <h2>Dane studenta:</h2>
        <div class="details-param">
            <div class="details-label">Id:</div>
            <div class="detail">${requestScope.student.id}</div>
        </div>
        <div class="details-param">
            <div class="details-label">Name:</div>
            <div class="detail">${requestScope.student.firstName}</div>
        </div>
        <div class="details-param">
            <div class="details-label">Surname:</div>
            <div class="detail">${requestScope.student.lastName}</div>
        </div>
        <div class="details-param">
            <div class="details-label">Birth date:</div>
            <div class="detail">${requestScope.student.birthDate}</div>
        </div>
        <div class="details-param">
            <div class="details-label">Age:</div>
            <div class="detail">${requestScope.student.age}</div>
        </div>
        <div class="details-param">
            <div class="details-label">Average:</div>
            <div class="detail">${requestScope.student.average}</div>
        </div>
        <div class="details-param">
            <div class="details-label">ECTS:</div>
            <div class="detail">${requestScope.student.ects}</div>
        </div>
        <div class="details-param">
            <div class="details-label">Is special:</div>
            <div class="detail">${requestScope.student.special}</div>
        </div>
        <div class="details-param">
            <div class="details-label"></div>
            <div class="detail">
                <a href="${pageContext.request.contextPath}/grade/form?studentId=${requestScope.student.id}">Add grade...</a>
            </div>
        </div>
    </div>
    <div class="details-section">
        <h2>Oceny studenta:</h2>
        <div class="grade-container">
            <div class="grade-table-header">
                <div class="grade-table-header-cell">
                    Id
                </div>
                <div class="grade-table-header-cell">
                    Value
                </div>
                <div class="grade-table-header-cell">
                    Subject
                </div>
                <div class="grade-table-header-cell">
                    Datetime
                </div>
                <div class="grade-table-header-cell">
                    Actions
                </div>
            </div>
            <c:forEach items="${requestScope.student.grades}" var="ocena">
                <div class="grade-table-row">
                    <div class="grade-table-cell">
                            ${ocena.id}
                    </div>
                    <div class="grade-table-cell">
                            ${ocena.value}
                    </div>
                    <div class="grade-table-cell">
                            ${ocena.subject}
                    </div>
                    <div class="grade-table-cell">
                            ${ocena.datetimeCreated}
                    </div>
                    <div class="grade-table-cell">
                        <a href="${pageContext.request.contextPath}/grade/delete?id=${ocena.id}">Delete</a>
                    </div>
                </div>
            </c:forEach>

        </div>
    </div>
</div>

</body>
</html>
