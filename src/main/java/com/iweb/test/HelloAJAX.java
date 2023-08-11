package com.iweb.test;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class HelloAJAX extends HttpServlet {



    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");
        String str = req.getParameter("str");
        System.out.println("来了个GET请求");
        resp.getWriter().print("你好，这是我给你的返回值" + str);
        //test the second git repository
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");
        String str = req.getParameter("str");
        System.out.println("来了个POST请求");
        resp.getWriter().print("你好，这是我给你的返回值" + str);
        //test the second git repository
    }
}
