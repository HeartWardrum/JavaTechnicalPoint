<%--
  Created by IntelliJ IDEA.
  User: HeartWardrum
  Date: 2023-08-07/0007
  Time: 17:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页</title>
    <style>
        * {
            margin: 0px; /*没有边距*/

        }

        #top {
            height: 180px;
            width: 100%;
            background-image: url("<%=request.getContextPath()%>/img/人物.png");
        }

        #body {
            position: absolute;
            top: 180px;
            left: 0px;
            right: 0px;
            bottom: 30px;
        }

        #bodyLeft {
            height: 100%;
            width: 200px;
            float: left;
            background-color: #002da9;
        }

        #bodyRight {
            left: 200px;
            height: 100%;
            position: absolute;

            right: 0px;
            float: left;
            background-color: #ffe870;
        }

        #footer {
            position: absolute;
            height: 30px;
            left: 0px;
            right: 0px;
            bottom: 0px;
            background-color: #99bbbb;
            text-align: center;
        }

        #h3 {
            position: absolute;
            left: 200px;
            top: 50px;
            font-size: 40px;
            color: #ffe870;
        }

        .menu {
            line-height: 40px;
            color:#ffe870;
        }

        #bodyrightiframe {
            width: 100%;
            height: 100%;
            border:0;
        }
        a{
            color:#ffe870;
        }
        #tuichudenglu{
            text-align:right;
            margin-right:20px;
        }
    </style>

</head>
<body>
<div id="top">
    <h3 id="h3">XXX管理系统</h3>
    <div id="tuichudenglu">
        <a  href="<%=request.getContextPath()%>/logout.user">退出登录</a>
    </div>
</div>
<div id="body">
    <div id="bodyLeft">
        <ul >
            <div class="menu">
                <li><a href="<%=request.getContextPath()%>/selectByPage.book?pageNo=1" target="bodyright" >图书管理</a></li>
            </div>
            <div class="menu">
                <li><a href="<%=request.getContextPath()%>/user/user.jsp" target="bodyright" >类别管理</a></li>
            </div>
            <div class="menu">
                <li><a href="<%=request.getContextPath()%>/user/user.jsp" target="bodyright">用户管理</a></li>
            </div>
            <div class="menu">
                <li><a href="">库存管理</a></li>
            </div>

        </ul>
    </div>
    <div id="bodyRight">
        <iframe id="bodyrightiframe" src="<%=request.getContextPath()%>/selectByPage.book?pageNo=1" name="bodyright">

        </iframe>
    </div>

</div>
<div id="footer">技术支持：http://www.iweb.com.cn</div>
</body>
</html>
