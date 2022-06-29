
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Edit Product</title>
</head>
<body>
<h1>Edit Product</h1>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p>
    <a href="/product">Tro lai danh sach san pham </a>
</p>
<form method="post">
    <fieldset>
        <legend>Customer information</legend>
        <table>
            <tr>
                <td>Name: </td>
                <td><input type="text" name="name" id="name" value="${requestScope["product"].getName()}"></td>
            </tr>
            <tr>
                <td>Price: </td>
                <td><input type="text" name="price" id="price" value="${requestScope["product"].getPrice()}"></td>
            </tr>
            <tr>
                <td>Amount: </td>
                <td><input type="text" name="amount" id="amount" value="${requestScope["product"].getAmount()}"></td>
            </tr>

            <tr>
                <td>Production: </td>
                <td><input type="text" name="production" id="production" value="${requestScope["product"].getProduction()}"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Edit Product"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
