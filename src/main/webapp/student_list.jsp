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
</head>
<body>
<jsp:include page="navigator.jsp"/>

<c:forEach items="${requestScope.jakastamsobie_lista}" var="studencik">
    <c:out value="${studencik.firstName}"/>
</c:forEach>

</body>
</html>
