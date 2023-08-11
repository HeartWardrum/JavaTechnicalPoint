package com.iweb.user.servlet;

import com.iweb.user.service.UserService;
import com.iweb.user.service.UserServiceImpl;
import org.apache.commons.codec.digest.DigestUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


public class UserServlet extends HttpServlet {
    private UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        req.setCharacterEncoding("utf-8");
        String path = req.getServletPath();//获取当前请求名
        switch (path) {
            case "/login.user":
                login(req, resp);
                break;
            case "/logout.user":
                logout(req, resp);
                break;

            default:

                break;
        }

    }

    /*
     * 用户登录
     * */
    private void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        boolean flag = userService.isLogin(username, password);
        if (flag) {
            // 去首页
            req.getSession().setAttribute("username",username);
            req.getRequestDispatcher("/main.jsp").forward(req, resp);

        } else {
            //留在登录页面
            req.setAttribute("message", "对不起，账号或密码错误");
            req.getRequestDispatcher("/user/login.jsp").forward(req, resp);

        }


    }

    private void logout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession httpSession = req.getSession();
        httpSession.removeAttribute("username");//退出登陆时清理session
        req.getRequestDispatcher("/user/login.jsp").forward(req, resp);


    }

}
