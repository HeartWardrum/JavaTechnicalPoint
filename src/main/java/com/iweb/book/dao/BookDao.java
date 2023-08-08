package com.iweb.book.dao;

import com.iweb.book.pojo.Book;
import com.iweb.util.PageModel;

import java.util.List;

public interface BookDao {
    //查询全部（分页）
    public List<Book> selectByPage(String likevalue, PageModel pm);

    //查询单条（根据ID查询一条记录）
    public Book selectById(Integer id);

    //新增一条记录
    public Integer addOne(Book book);

    //修改一条记录
    public Integer updateOne(Book book);

    //删除一条记录
    public Integer deleteOne(Book book);


}
