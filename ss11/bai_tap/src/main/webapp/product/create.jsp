<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 28/06/2022
  Time: 4:41 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

</head>
<body>
<form action="/product" method="post">
    <input  hidden type="text" name="action" value="add">
    <input type="text" name="name">
    <input type="submit" value="add">
</form>
</body>
</html>
