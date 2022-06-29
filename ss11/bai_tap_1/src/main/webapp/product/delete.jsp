
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>delete product</title>
</head>
<body>
<h1> Xoa san pham</h1>
<p>
    <a href="/product"> Tro ve danh sach san pham</a>
</p>
<form method="post">
    <h3>Are you sure?</h3>
    <fieldset>
        <legend>Product information</legend>
        <table>
            <tr>
                <td>Name: </td>
                <td>${requestScope["product"].getName()}</td>
            </tr>
            <tr>
                <td>Amount: </td>
                <td>${requestScope["product"].getAmount()}</td>
            </tr>
            <tr>
                <td>Price: </td>
                <td>${requestScope["product"].getPrice()}</td>
            </tr>
            <tr>
                <td>Production: </td>
                <td>${requestScope["product"].getProduction()}</td>
            </tr>

            <tr>
                <td><input type="submit" value="Delete Product"></td>
                <td><a href="/product">Back to Product list</a></td>
            </tr>
        </table>
    </fieldset>
</form>

</body>
</html>
