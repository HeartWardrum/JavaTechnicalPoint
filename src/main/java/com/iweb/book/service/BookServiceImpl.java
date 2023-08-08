package com.iweb.book.service;

import com.iweb.book.dao.BookDao;
import com.iweb.book.dao.BookDaoImpl;
import com.iweb.book.pojo.Book;
import com.iweb.util.JdbcUtil;
import com.iweb.util.PageModel;

import java.util.List;
import java.util.Map;

public class BookServiceImpl implements BookService{
   BookDao bookDao = new BookDaoImpl() ;

    @Override
    public List<Book> selectByPage(String likevalue, PageModel pageModel) {

        return bookDao.selectByPage(likevalue,pageModel);
    }

    @Override
    public Book selectById(Integer id) {
        return null;
    }

    @Override
    public Integer addOne(Book book) {
        return null;
    }

    @Override
    public Integer updateOne(Book book) {
        return null;
    }

    @Override
    public Integer deleteOne(Book book) {
        return null;
    }
}
