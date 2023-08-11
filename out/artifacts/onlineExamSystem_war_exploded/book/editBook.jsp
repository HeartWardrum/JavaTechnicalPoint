<%@ page import="com.iweb.book.pojo.Book" %>
<%@ page import="java.util.UUID" %>
<%@ page %><%--
  Created by IntelliJ IDEA.
  User: HeartWardrum
  Date: 2023-08-10/0010
  Time: 9:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        #editdiv {
            margin-top: 10%;
            margin-left: 30%;

        }

        #tab {
            line-height: 40px;
        }


        /*关于按钮的梅花美化*/
        .custom-button {
            display: inline-block;
            width: 100%;
            max-width: 200px;
            padding: 10px 20px;
            background: linear-gradient(to bottom, #3498db, #2980b9);
            color: #ffffff;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            box-shadow: 0px 3px 5px rgba(0, 0, 0, 0.2);
            transition: transform 0.2s ease, box-shadow 0.2s ease, background 0.2s ease;
        }

        .custom-button:hover {
            transform: translateY(-2px);
            box-shadow: 0px 6px 10px rgba(0, 0, 0, 0.3);
            background: linear-gradient(to bottom, #2980b9, #3498db);
        }
    </style>
</head>
<body>

<%--<%--%>
<%--    Book book = null;--%>
<%--    if (request.getAttribute("book") != null) {--%>
<%--        book = (Book) request.getAttribute("book");--%>
<%--    }--%>

<%--%>--%>
编辑页面
<div id="editdiv">

    <%
        String uuid = UUID.randomUUID() + "";
        out.print(uuid);
        session.setAttribute("flag", uuid);
    %>
    <form action="${pageContext.request.contextPath}/edit.book" method="post">
        <input type="hidden" name="flagparam" value="<%=uuid%>">
        <table id="tab">
            <tr>
                <td>ID:</td>
                <td><input type="text" name="id" readonly="readonly"
                           placeholder="新增时无需填写" value="${book.id}"></td>
            </tr>
            <tr>
                <td>BOOKNAME:</td>
                <td><input type="text" name="bookname" value="${book.bookname}"></td>
            </tr>
            <tr>
                <td>AUTHOR:</td>
                <td><input type="text" name="author" value="${book.author}"></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center"><input class="custom-button" type="submit"
                                                                 name="提 &nbsp;&nbsp; 交"></td>
            </tr>
        </table>
    </form>
</div>

</body>
</html>
