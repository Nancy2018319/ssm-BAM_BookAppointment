<%--
  Created by IntelliJ IDEA.
  User: Nancy
  Date: 2018/8/28
  Time: 16:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加书籍</title>
</head>
<body>
<center>
    <form action="addBook.do" method="post">
        书名：<input type="text" name="book_name"><br/><br/>
        类型：<input type="text" name="book_type"><br/><br/>
        价格：<input type="text" name="book_price"><br/><br/>
        出版社：<input type="text" name="book_publish"><br/><br/>
        出版时间：<input type="date" name="book_newtime"><br/><br/>
        数量：<input type="text" name="book_number"><br/><br/>
        简介：<input type="text" name="book_text"><br/><br/>
        <input type="submit" value="添加">
    </form>
</center>
</body>
</html>
