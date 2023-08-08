package com.iweb.user.dao;

import com.iweb.user.pojo.User;
import com.iweb.util.JdbcUtil;
import org.apache.commons.codec.digest.DigestUtils;

import java.util.List;
import java.util.Map;


public class UserDaoImpl implements UserDao {
    @Override
    public User queryByUsernamePassword(String username, String password) {
        User user = null;
        password = DigestUtils.md5Hex(password);
        String sql = "select * from my_user where username=? and password=?";
        List<Map<String, Object>> list = JdbcUtil.queryBySql(sql, username, password);
        if (list != null && list.size() > 0) {
            Map<String, Object> map = list.get(0);
            user = new User((String) map.get("id"), (String) map.get("username"), (String) map.get("password"));

        }
        return user;
    }
}
