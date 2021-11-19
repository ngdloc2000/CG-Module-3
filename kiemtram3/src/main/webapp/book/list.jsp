<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 19-Nov-21
  Time: 10:02 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>List Book</h2></caption>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Author</th>
            <th>Quantity</th>
            <th>Description</th>
        </tr>
        <c:forEach var="book" items="${bookList}">
            <tr>
                <td><c:out value="${book.id}"/></td>
                <td><c:out value="${book.name}"/></td>
                <td><c:out value="${book.actor}"/></td>
                <td><c:out value="${book.quantity}"/></td>
                <td><c:out value="${book.description}"/></td>
                <td>
                    <a href="/books?action=borrow&idBook=${book.id}">Mượn</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <a href="/cards?action=borrow">mượn</a>
<%--    <a href="/products">Quay lại</a>--%>
</div>
</body>
</html>
