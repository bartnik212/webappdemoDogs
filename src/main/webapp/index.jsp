<%@ page import="com.sda.javagda31.webappdemo.database.HibernateUtil" %><%--
  Created by IntelliJ IDEA.
  User: amen
  Date: 9/5/20
  Time: 11:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<html>
<head>
    <title>Index Page</title>
    <style>
        table, td, tr {
            border: 1px solid #000;
            padding: 2px;
        }
    </style>
</head>
<body>
<jsp:include page="navigator.jsp"/>

<form action="${pageContext.request.contextPath}/" method="get">
    <label for="colInput">Ilość kolumn:</label> <input id="colInput" type="number" min="1" step="1" name="colNumber">
    <label for="rowInput">Ilość kolumn:</label> <input id="rowInput" type="number" min="1" step="1" name="rowNumber">
    <input type="submit">
</form>

<hr>
<%--linia horyzontalna--%>
<%
    HibernateUtil.getSessionFactory(); // spowoduje załadowanie bazy
    String colNumberString = request.getParameter("colNumber");
    int colNumber;
    if (colNumberString == null) {
        colNumber = 10; // domyślna wartość
    } else {
        colNumber = Integer.parseInt(colNumberString);
    }

    String rowNumberString = request.getParameter("rowNumber");
    int rowNumber;
    if (rowNumberString == null) {
        rowNumber = 10; // domyślna wartość
    } else {
        rowNumber = Integer.parseInt(rowNumberString);
    }

    out.print("<table>");
    // stwórz tabliczkę mnożenia (tabela)
    // rozmiar tabliczki mnożenia to 10 x 10
    // każda komórka w tabeli powinna zawierać jeden wynik mnożenia
    // tabela powinna być stylizowana i mieć obramowanie
    for (int row = 1; row <= rowNumber; row++) {
        out.print("<tr>"); // table row
        for (int col = 1; col <= colNumber; col++) {
            out.print("<td>");
            out.print(row * col);
            out.print("</td>");
        }
        out.print("</tr>");
    }
    out.print("</table>");
%>

<hr>
<table>
    <c:forEach begin="1" end="${param.rowNumber}" var="row">
        <tr>
            <c:forEach begin="1" end="${param.colNumber}" var="col">
                <td>
                    <c:out value="${row*col}"/>
                </td>
            </c:forEach>
        </tr>
    </c:forEach>
</table>

</body>
</html>
