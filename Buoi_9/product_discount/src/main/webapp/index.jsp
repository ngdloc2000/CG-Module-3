<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 06-Nov-21
  Time: 9:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Product Discount Calculator</title>
  <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<h2>Product Discount Calculator</h2>
<form action="/display-discount" method="post">
  <label>Product Description </label><br/>
  <input type="text" name="description" placeholder="Product Description"/><br/>
  <label>List Price </label><br/>
  <input type="text" name="price" placeholder="Price" value="0"/><br/>
  <label>Discount Percent: </label><br/>
  <input type="text" name="percent" placeholder="Discount Percent" value="0"/><br/>
  <input type = "submit" id = "submit" value = "Calculator"/>
</form>
</body>
</html>
