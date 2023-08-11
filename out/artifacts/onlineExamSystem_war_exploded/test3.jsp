<%--
  Created by IntelliJ IDEA.
  User: HeartWardrum
  Date: 2023-08-11/0011
  Time: 9:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>test3页面</h3>
<%=session.getId()%>
<br/>
<%=session.isNew()%>
<br/>
<%=session.getCreationTime()%>
<br/>
<%=session.getLastAccessedTime()%>
<br/>
<%=session.getMaxInactiveInterval()%>
</body>
</html>
