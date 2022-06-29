
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Product List</title>
</head>
<body>
<h1> Trang List Product </h1>
<form action="/product">
    <input type="text" name="nameSearch">
    <input type="submit" name="action" value="findByName">
</form>
<ul>
    <li><a href="/product?action=create" >Thêm mới</a></li>
</ul>
<table border="1" cellpadding="5">
    <tr>
        <th>name</th>
        <th>price</th>
        <th>amount</th>
        <th>production</th>
        <th>Edit</th>
        <th>Delete</th>
        <th>Xem chi tiet</th>

    </tr>
    <c:forEach items="${products}" var="product">
        <tr>
            <td><a href="/product?action=view&id=${product.getId()}">${product.getName()}</a></td>
            <td>${product.getPrice()}</td>
            <td>${product.getAmount()}</td>
            <td>${product.getProduction()}</td>
            <td><a href="/product?action=edit&id=${product.getId()}">Sửa         </a></td>
            <td><a href="/product?action=delete&id=${product.getId()}">Xóa         </a></td>
            <td><a href="/product?action=findById&id=${product.getId()}">Xem chi tiet</a></td>

        </tr>
    </c:forEach>

</table>
</body>
</html>
