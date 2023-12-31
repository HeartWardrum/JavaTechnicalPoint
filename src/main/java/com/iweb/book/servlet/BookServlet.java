package com.iweb.book.servlet;

import com.iweb.book.pojo.Book;
import com.iweb.book.service.BookService;
import com.iweb.book.service.BookServiceImpl;
import com.iweb.util.PageModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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

        //检查Session，判断请求是否绕过了登录页面
        String username = (String) req.getSession().getAttribute("username");
        if (username == null) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }


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
            case "/edit.book":
                edit(req, resp);
                break;
            default:
                break;
        }
    }

    //编辑
    private void edit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        HttpSession session = req.getSession();
        String flag = (String) session.getAttribute("flag");
        String flagparam = req.getParameter("flagparam");
        if (flag != null && flag.equals(flagparam)) {
            session.setAttribute("flag", "");
            String id = req.getParameter("id");
            String bookname = req.getParameter("bookname");
            String author = req.getParameter("author");


            int res = 0;
            if (id != null && !"".equals(id)) {
                //修改
                Book book = new Book(Integer.parseInt(id), bookname, author);
                res = bookService.updateOne(book);
            } else {
                //新增
                Book book = new Book(null, bookname, author);
                res = bookService.addOne(book);

            }
            if (res > 0) {
                req.setAttribute("message", "新增成功!");
                req.getRequestDispatcher("/selectByPage.book?pageNo=1").forward(req, resp);
            } else {
                req.setAttribute("message", "新增失败！");
                req.getRequestDispatcher("/selectByPage.book?pageNo=1").forward(req, resp);
            }
            req.getRequestDispatcher("/book/editBook.jsp").forward(req, resp);

        } else {
            resp.sendRedirect(req.getContextPath() + "/token.jsp");
        }


    }

    //去编辑页面
    private void toEdit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        if (id != null && !"".equals(id)) {
            //修改
            Book book = bookService.selectById(Integer.parseInt(id));
            req.setAttribute("book", book);

        }
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
