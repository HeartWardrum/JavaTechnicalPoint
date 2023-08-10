package com.iweb.book.servlet;

import com.iweb.book.pojo.Book;
import com.iweb.book.service.BookService;
import com.iweb.book.service.BookServiceImpl;
import com.iweb.util.PageModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class BookServlet extends HttpServlet {

    BookService bookService = new BookServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("utf-8");
        String path = req.getServletPath();
        switch (path) {
            case "/selectByPage.book":
                selectByPage(req, resp);
                break;
            case "/delete.book":
                delete(req, resp);
                break;
            case "/toEdit.book":
                toEdit(req, resp);
                break;
            default:
                break;
        }
    }

    //编辑
    private void toEdit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/book/editBook.jsp").forward(req, resp);
    }


    //分页查询
    private void selectByPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PageModel pm = new PageModel();
        int pageNo = Integer.parseInt(req.getParameter("pageNo"));
        pm.setPageNo(pageNo);
        String likevalue = req.getParameter("likevalue");
        likevalue = ("null".equals(likevalue) ? null : likevalue);
        List<Book> books = bookService.selectByPage(likevalue, pm);
        req.setAttribute("books", books);
        req.setAttribute("likevalue", likevalue);
        req.setAttribute("pageModel", pm);
        System.out.println("pm.getPageCount() = " + pm.getPageCount());
        System.out.println("pm.getPageNo() = " + pm.getPageNo());
        req.getRequestDispatcher("/book/book.jsp").forward(req, resp);

    }

    private void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("即将删除一条记录");
        //System.out.println("前端送来的book id = "  + req.getAttribute("bookid"));
        String id = req.getParameter("id");
        int res = bookService.deleteOne(Integer.parseInt(id));
        if (res > 0) {
            req.setAttribute("message", "删除成功！");
            req.getRequestDispatcher("/selectByPage.book?pageNo=1").forward(req, resp);//刷新页面

        } else {
            req.setAttribute("message", "删除失败！");
            req.getRequestDispatcher("/selectByPage.book?pageNo=1").forward(req, resp);//刷新页面

        }


    }
}
