<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 28/06/2022
  Time: 8:45 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<html>
<head>
    <title>Add</title>
</head>
<body>
<h1>Them moi san pham</h1>
<p>
    <c:if test='${requestScope["message"]!=null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p>
    <a href="/product">Tro lai danh sach san pham</a>
</p>

<form method="post">
    <fieldset>
        <legend> Product information</legend>
        <table>
            <tr>
                <td>Name</td>
                <td><input type="text" name="name" id="name"></td>
            </tr>
            <tr>
                <td>Price</td>
                <td><input type="text" name="price" id="price"></td>
            </tr>
            <tr>
                <td>Amount</td>
                <td><input type="text" name="amount" id="amount"></td>
            </tr>
            <tr>
                <td>Production</td>
                <td><input type="text" name="production" id="production"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Create Product"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
