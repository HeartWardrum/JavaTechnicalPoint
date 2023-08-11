<%--
  Created by IntelliJ IDEA.
  User: HeartWardrum
  Date: 2023-08-11/0011
  Time: 14:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript">
        window.onload = function () {
            var strNode = document.getElementById("str");
            strNode.onkeyup = function () {
                var request = new XMLHttpRequest();//定义一个AJAX的核心对象
                var method = "GET";
                var url = "<%=request.getContextPath()%>/test6";
                request.open(method, url);//装载
                request.send(null);
                request.onreadystatechange = function () {
                    if (request.readyState == 4) {
                        if (request.status == 200 || request.status == 304) {
                            var resp = request.responseText;
                            document.getElementById("message").innerHTML=resp;
                        }
                    }
                }
            }

        }
    </script>
</head>
<body>
<input type="text" id="str"/>
<span id="message" style="color:red"></span>
</body>
</html>
