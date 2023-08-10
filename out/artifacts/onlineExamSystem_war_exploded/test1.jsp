<%@ page import="com.iweb.book.pojo.Book" %><%--
  Created by IntelliJ IDEA.
  User: HeartWardrum
  Date: 2023-08-10/0010
  Time: 13:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
我是测试页面
<%
    Book book = new Book(1001, "活着", "余华");
    Book book2 = new Book(1001, "许三观卖血记", "余华");


    pageContext.setAttribute("key01", book);
    request.setAttribute("key01", book2);
//    session.setAttribute("key03", book);
//    application.setAttribute("key04", book);

%>
<br/>
${key01.bookname};
<br/>
<%--${requestScope.key02.id};--%>
<%--<br/>--%>
<%--${sessionScope.key03.author};--%>
<%--<br/>--%>
<%--${applicationScope.key04.bookname};--%>

</body>
</html>
