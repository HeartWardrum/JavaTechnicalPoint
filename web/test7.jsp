<%--
  Created by IntelliJ IDEA.
  User: HeartWardrum
  Date: 2023-08-11/0011
  Time: 15:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript">
        window.onload = function () {
            var jsonObj = {
                "name": "iweb",
                "age": 10,
                "address": {
                    "city": "Nanjing",
                    "school": "南信大"
                }
            };
            //alert(jsonObj.name);
            //alert(jsonObj.address.school);
            // var str = "alert(\"hello\");";
            // eval(str);
            // var str2 = "{\"name\":\"iweb\"}";
            // var jsonObj2 = eval("(" +str2+")");
            // alert(jsonObj2.name);

            var str3= "{\"name\":\"iweb\"}";
            var jsonObj3 = JSON.parse(str3);
            alert(jsonObj3.name);
        }
    </script>
</head>
<body>


</body>
</html>
