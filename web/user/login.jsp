<%--
  Created by IntelliJ IDEA.
  User: HeartWardrum
  Date: 2023-08-07/0007
  Time: 17:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login</title>
</head>
<body>
<h3>用户登录</h3>
<form action="<%=request.getContextPath()%>/login.user" method="post">
    账号：<input type="text" placeholder="请输入账号" name="username"/>
    <br/>
    <br/>
    密码：<input type="password" placeholder="请输入密码" name="password"/>
    <br/>
    <br/>
    <input type="submit" value="登录"/>
</form>

<br/>
<br/>
<span><%=request.getAttribute("message")==null?"":request.getAttribute("message")%></span>
</body>
</html>
