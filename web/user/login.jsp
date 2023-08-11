<%--
  Created by IntelliJ IDEA.
  User: HeartWardrum
  Date: 2023-08-07/0007
  Time: 17:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>login</title>
</head>
<body>
<%
    Cookie[] cookies = request.getCookies();
    if(cookies!=null&&cookies.length>0){
        for(Cookie cookie : cookies){
            if("username".equals(cookie.getName())){
                cookie.setMaxAge(0);//使Cookie失效
                response.addCookie(cookie);//通知浏览器更新该Cookie状态
            }
        }
    }




%>


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
