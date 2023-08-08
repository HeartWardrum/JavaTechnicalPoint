package com.iweb.user.service;

import com.iweb.user.dao.UserDao;
import com.iweb.user.dao.UserDaoImpl;
import com.iweb.user.pojo.User;

public class UserServiceImpl implements UserService {
    UserDao userDao = new UserDaoImpl();



    @Override
    public boolean isLogin(String username, String password) {
        User user = userDao.queryByUsernamePassword(username, password);
        return user != null;
    }
}
