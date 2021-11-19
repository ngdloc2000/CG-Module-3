<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 19-Nov-21
  Time: 10:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Title</title>
</head>
<body>
<h1>Mượn sách</h1>
<div align="center">
  <form method="post">
    <table border="1" cellpadding="5">
      <tr>
        <th>Mã mượn sách :</th>
        <td>
          <input type="text" name="idBook" size="45" value="${book.id}"/>
        </td>
      </tr>
      <tr>
        <th>Tên sách</th>
        <td>
          <input type="text" name="nameBook" size="45" value="${book.name}"/>
        </td>
      </tr>
      <tr>
        <th>Ngày mượn sách</th>
        <td>
          <input type="text" name="borrowDate" size="15" value="${borrowDate}"/>
        </td>
      </tr>
      <tr>
        <th>Ngày trả sách</th>
        <td>
          <input type="text" name="payDate" size="15"/>
        </td>
      </tr>
      <tr>
        <th>Học sinh:</th>
        <td>
          <select name="idStudent">
            <c:forEach items="${studentList}" var="t">
              <option value="${t.id}">${t.name}</option>
            </c:forEach>
          </select>
        </td>
      </tr>
      <tr>
        <td colspan="2" align="center">
          <input type="submit" value="Save"/>
        </td>
      </tr>
    </table>
  </form>
</div>
</body>
</html>
