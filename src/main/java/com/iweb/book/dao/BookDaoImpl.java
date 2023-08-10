package com.iweb.book.dao;

import com.iweb.book.pojo.Book;
import com.iweb.util.JdbcUtil;
import com.iweb.util.PageModel;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class BookDaoImpl implements BookDao {


    @Override
    public List<Book> selectByPage(String likevalue, PageModel pm) {
        StringBuffer sql = new StringBuffer(" select * from mybook ");
        List<Map<String, Object>> list = null;
        if (likevalue != null && !"".equals(likevalue)) {
            String param = "%" + likevalue + "%";
            sql.append(" where id like ? or bookname like ? or author like ? ");
            list = JdbcUtil.queryBySql(sql.toString(), param, param, param);
            pm.setTotalCount(list.size());
            sql.append(" order by id desc limit ?,? ");
            list = JdbcUtil.queryBySql(sql.toString(), param, param, param
                    , (pm.getPageNo() - 1) * pm.getPageSize(), pm.getPageSize());
        } else {
            list = JdbcUtil.queryBySql(sql.toString());
            pm.setTotalCount(list.size());
            sql.append(" order by id desc limit ?,?");
            list = JdbcUtil.queryBySql(sql.toString(), (pm.getPageNo() - 1) * pm.getPageSize(), pm.getPageSize());

        }
        List<Book> result = new ArrayList<>();
        for (Map<String, Object> map : list) {
            result.add(new Book((Integer) map.get("id"), (String) map.get("bookname"), (String) map.get("author")));
        }


        return result;
    }

    @Override
    public Book selectById(Integer id) {
        String sql = "select * from mybook where id = ?";
        List<Map<String, Object>> list = JdbcUtil.queryBySql(sql, id);
        Map<String, Object> map = list.get(0);
        Book book = new Book((Integer) map.get("id"), (String) map.get("bookname"), (String) map.get("author"));

        return book;
    }

    @Override
    public Integer addOne(Book book) {
        String sql = "insert into mybook values(null,?,?)";
        return JdbcUtil.updateBySql(sql, book.getBookname(), book.getAuthor());

    }

    @Override
    public Integer updateOne(Book book) {

        String sql = "update mybook set bookname = ? ,author = ? where id = ? ";

        return JdbcUtil.updateBySql(sql, book.getBookname(), book.getAuthor(), book.getId());
    }

    @Override
    public Integer deleteOne(Integer id) {
        String sql = "delete from mybook where id = ?";

        return JdbcUtil.updateBySql(sql, id);
    }
}
