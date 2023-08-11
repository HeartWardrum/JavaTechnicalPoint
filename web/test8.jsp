<%--
  Created by IntelliJ IDEA.
  User: HeartWardrum
  Date: 2023-08-11/0011
  Time: 16:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#str").change(function () {
                var param = $("#str").val();
                var jsonObj = {
                    "str": param
                };
                var url = "<%=request.getContextPath()%>/test6?str=" + param;
                $.post(url, jsonObj, function (data) {
                    var resultObj = JSON.parse(data);
                    if (resultObj.flag == 1) {
                        $("#message").css("color", "green").html("恭喜您，该用户名可以使用");
                    } else {
                        $("#message").css("color", "red").html("对不起，该用户名已存在");
                    }
                });
            })
        })
    </script>
</head>
<body>
<input type="text" id="str"/>
<span id="message"></span>
</body>
</html>
