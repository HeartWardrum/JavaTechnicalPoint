<%@ page import="com.iweb.book.pojo.Book" %>
<%@ page import="java.util.List" %>
<%@ page import="com.iweb.util.PageModel" %><%--
  Created by IntelliJ IDEA.
  User: HeartWardrum
  Date: 2023-08-08/0008
  Time: 10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        #tab, td, th {
            border: 1px solid black;

        }

        #tab {
            border-collapse: collapse;
        }

        td {
            padding: 10px 10px;
            width: 100px;
            text-align: center;
        }

        #d1 {
            margin-left: 10%;
            margin-top: 40px;
        }

        #searchForm {
            text-align: right;
            margin-right: 45%;
        }
    </style>
</head>
<body>
<%
    List<Book> books = (List<Book>) request.getAttribute("books");
%>

<div id="d1">
    <div id="searchForm">
        <form action="<%=request.getContextPath()%>/selectByPage.book" method="post">
            <input type="text" name="likevalue" placeholder="请输入搜索关键字"
                   value="<%=request.getAttribute("likevalue")==null?"":request.getAttribute("likevalue")%>"/>
            <input type="hidden" name="pageNo" value="1"/>
            <input type="submit" value="Search"/>
        </form>
    </div>

    <table id="tab">
        <tr>
            <th>ID</th>
            <th>BOOKNAME</th>
            <th>AUTHOR</th>
            <th colspan="2"></th>
        </tr>
        <%
            for (Book book : books) {

        %>
        <tr>
            <td><%=book.getId()%>
            </td>
            <td><%=book.getBookname()%>
            </td>
            <td><%=book.getAuthor()%>
            </td>
            <td><a href="">Edit</a></td>
            <td><a href="">Delete</a></td>
        </tr>
        <%}%>
    </table>
</div>
<div style="text-align:center">
    <%
        PageModel pageModel = ((PageModel)request.getAttribute("pageModel"));
        int pageCount = pageModel.getPageCount();
        int preNo = Math.max(1,pageModel.getPageNo() - 1);
        int nextNo = Math.min(pageModel.getPageNo() + 1,pageCount);
        Object likevalue2 = request.getAttribute("likevalue");

    %>
    共 <%=pageCount%> 页
    &nbsp;
    <a href="<%=request.getContextPath()%>/selectByPage.book?pageNo=1&likevalue=<%=likevalue2%>">首页</a> &nbsp;
    <a href="<%=request.getContextPath()%>/selectByPage.book?pageNo=<%=preNo%>&likevalue=<%=likevalue2%>">上一页</a> &nbsp;
    <a href="<%=request.getContextPath()%>/selectByPage.book?pageNo=<%=nextNo%>&likevalue=<%=likevalue2%>">下一页</a> &nbsp;
    <a href="<%=request.getContextPath()%>/selectByPage.book?pageNo=<%=pageCount%>&likevalue=<%=likevalue2%>">尾页</a> &nbsp;

    当前第 <%=pageModel.getPageNo()%> 页
</div>
</body>
</html>
