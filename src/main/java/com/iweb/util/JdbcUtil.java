package com.iweb.util;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


//防止SQL注入，并且能传入多个参数的最终JDBC工具类
public class JdbcUtil {
    private static final String URL =
            "jdbc:mysql://192.168.77.100:3306/mysql?characterEncoding=utf-8";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "123456";

    private static Connection conn = null;
    private static PreparedStatement pstat = null;
    private static ResultSet rest = null;

    public JdbcUtil() {

    }

    //获取数据库连接
    public static Connection getConn() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }

    //关闭所有资源和连接
    public static void closeSource() {
        try {
            if (rest != null)
                rest.close();
            if (pstat != null)
                pstat.close();
            if (conn != null)
                conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /*
    统一进行查询的JDBC方法
     */
    public static <T> List<Map<String, Object>> queryBySql(String sql, T... t) {
        List<Map<String, Object>> list = new ArrayList<>();

        ResultSetMetaData rsmd = null;
        try {
            pstat = getConn().prepareStatement(sql);
            for (int i = 0; i < t.length; i++) {
                pstat.setObject(i + 1, t[i]);
            }
            rest = pstat.executeQuery();
            rsmd = rest.getMetaData();
            while (rest.next()) {
                Map<String, Object> map = new HashMap<>();
                for (int i = 1; i <= rsmd.getColumnCount(); i++) {
                    map.put(rsmd.getColumnName(i), rest.getObject(i));
                }
                list.add(map);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rest != null)
                    rest.close();
                closeSource();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    /*
    增删改
     */
    public static <T> void editBySql(String sql, T... t) {
        int result = 0;
        try {
            pstat = getConn().prepareStatement(sql);
            for (int i = 0; i < t.length; i++) {
                pstat.setObject(i + 1, t[i]);
            }
            result = pstat.executeUpdate();
            System.out.println("成功编辑了" + result + "条记录");
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeSource();
        }
    }
}