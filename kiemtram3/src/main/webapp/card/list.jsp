<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 19-Nov-21
  Time: 11:13 AM
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
            <th>Mã mượn sách</th>
            <th>Tên sách</th>
            <th>Tác giả</th>
            <th>Tên học sinh</th>
            <th>Lớp</th>
            <th>Ngày mượn</th>
            <th>Ngày trả</th>
            <th>Trạng thái</th>
        </tr>
        <c:forEach var="card" items="${cardList}">
            <tr>
                <td><c:out value="${card.id}"/></td>
                <td><c:out value="${card.getBook().getName()}"/></td>
                <td><c:out value="${card.getBook().getActor()}"/></td>
                <td><c:out value="${card.getStudent().getName()}"/></td>
                <td><c:out value="${card.getStudent().getClassName()}"/></td>
                <td><c:out value="${card.borrowedDate}"/></td>
                <td><c:out value="${card.payDate}"/></td>
                <td><c:out value="${card.status}"/></td>
                <td>
                    <a href="/cards?action=pay&idCard=${card.id}">Trả sách</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <%--    <a href="/products">Quay lại</a>--%>
</div>
</body>
</html>
