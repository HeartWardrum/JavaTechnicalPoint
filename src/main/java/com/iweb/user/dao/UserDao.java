package com.iweb.user.dao;

import com.iweb.user.pojo.User;

public interface UserDao {

    public User queryByUsernamePassword(String username, String pasword);
}
