<%--
  Created by IntelliJ IDEA.
  User: amen
  Date: 9/5/20
  Time: 2:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Student Form</title>
</head>
<body>
<jsp:include page="navigator.jsp"/>

<form action="${pageContext.request.contextPath}/grade/form" method="post">
    <%--first name input type text--%>
    <c:choose>
        <c:when test="${requestScope.studentId ==null}">
            <label for="student">Student:</label>
            <select id="student" name="studentIdValue">
                <c:forEach items="${requestScope.all_students}" var="student">
                    <option value="${student.id}">
                        <c:out value="${student.firstName} ${student.lastName}"/>
                    </option>
                </c:forEach>
            </select>
            <br/>
        </c:when>
        <c:otherwise>
            <input type="number" value="${requestScope.studentId}" name="studentIdValue" hidden>
        </c:otherwise>
    </c:choose>
    <%--last name input type text--%>
    <label for="gradeValueInput">Grade value:</label> <input id="gradeValueInput" type="number" min="2" max="6"
                                                             step="0.5" name="gradeValue"><br/>
    <%--birth date input type date--%>
    <label for="subject">Subject:</label>
    <select id="subject" name="subjectValue">
        <c:forEach items="${requestScope.all_subjects}" var="subj">
            <option value="${subj}">
                <c:out value="${subj.name}"/>
            </option>
        </c:forEach>
    </select>

    <br/>
    <input type="submit">
</form>
</body>
</html>
