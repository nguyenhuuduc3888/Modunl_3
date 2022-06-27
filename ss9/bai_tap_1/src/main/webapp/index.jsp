<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 27/06/2022
  Time: 9:50 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Product Discount Calculator</title>
  <style>
    .product-discount {
      width: 350px;
      height: 370px;
      border: 1px solid #ccc;
    }
    .product-discount textarea, .product-discount input {
      margin: 5px;
      padding: 5px;
    }
  </style>
</head>
<body>
<div class="product-discount">
  <h1>Nguyễn Hữu Đức</h1>
  <form  action="/discount" method="post">
    <textarea cols="30" rows="10" name="description" placeholder="Mô tả sản phẩm"></textarea>
    <input type="text" size="30" name="price" placeholder="Giá"/>
    <input type="text" size="30" name="discount" placeholder="Chiết Khấu"/>
    <input type="submit" name="calculate" value="Tính Chiết Khấu"/>
  </form>
</div>
</body>
</html>
