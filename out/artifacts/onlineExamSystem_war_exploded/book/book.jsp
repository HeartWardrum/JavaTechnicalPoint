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

        #addbutton {
            height: 0px;
            margin-left: 190px;
        }

        #tab {
            border-collapse: collapse;
            margin-left: 190px;
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
    <script type="text/javascript">
        //窗口加载时执行该方法
        window.onload = function () {
            if ('<%=request.getAttribute("message")%>' != null && '<%=request.getAttribute("message")%>' != "null") {
                alert('<%=request.getAttribute("message")%>');
            }

            if ('<%=((PageModel)request.getAttribute("pageModel")).getPageNo()%>' == 1) {
                document.getElementById("prea").href = "#";
            }
            if ("<%=((PageModel)request.getAttribute("pageModel")).getPageNo()%>" == "<%=((PageModel)request.getAttribute("pageModel")).getPageCount()%>") {
                document.getElementById("nexta").href = "#";
            }

            var dels = document.getElementsByClassName("del");
            for (var i = 0; i < dels.length; i++) {
                dels[i].onclick = function () {

                    var bookname = this.parentNode.parentNode.getElementsByTagName("td")[1].firstChild.nodeValue;

                    if (!confirm("确定删除" + bookname + "吗？")) {
                        return false;//阻止控件的默认行为  a标签的默认行为就是发请求
                    }

                }
            }
        }
    </script>
</head>
<body>
<%
    List<Book> books = (List<Book>) request.getAttribute("books");
%>

<div id="d1">


    <div id="addbutton">
        <form action="<%=request.getContextPath()%>/toEdit.book">
            <input type="submit" value="新增"/>
        </form>
    </div>
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
            <td><a href="<%=request.getContextPath()%>/toEdit.book?id=<%=book.getId()%>">Edit</a></td>
            <td><a class="del" href="<%=request.getContextPath()%>/delete.book?id=<%=book.getId()%>">Delete</a></td>
        </tr>
        <%}%>
    </table>
</div>
<div style="text-align:center">
    <%
        PageModel pageModel = ((PageModel) request.getAttribute("pageModel"));
        int pageCount = pageModel.getPageCount();
//        int preNo = Math.max(1,pageModel.getPageNo() - 1);
//        int nextNo = Math.min(pageModel.getPageNo() + 1,pageCount);
        int preNo = pageModel.getPageNo() - 1;
        int nextNo = pageModel.getPageNo() + 1;
        int totalCount = pageModel.getTotalCount();
        Object likevalue = request.getAttribute("likevalue");

    %>
    共<%=pageCount%>页
    &nbsp;&nbsp;&nbsp;
    共<%=totalCount%>条&nbsp;
    <a href="<%=request.getContextPath()%>/selectByPage.book?pageNo=1&likevalue=<%=likevalue%>">首页</a> &nbsp;
    &nbsp;
    <a id="prea"
       href="<%=request.getContextPath()%>/selectByPage.book?pageNo=<%=preNo%>&likevalue=<%=likevalue%>">上一页</a> &nbsp;
    &nbsp;
    <a id="nexta"
       href="<%=request.getContextPath()%>/selectByPage.book?pageNo=<%=nextNo%>&likevalue=<%=likevalue%>">下一页</a>
    &nbsp;&nbsp;
    <a href="<%=request.getContextPath()%>/selectByPage.book?pageNo=<%=pageCount%>&likevalue=<%=likevalue%>">尾页</a>
    &nbsp;

    当前第<%=pageModel.getPageNo()%>页
</div>
</body>
</html>
