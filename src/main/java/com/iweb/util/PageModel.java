package com.iweb.util;
/*
分页查询
 */
public class PageModel {
    private  int pageSize = 6;//每页的条数
    private int pageNo;//当前页数
    private int totalCount;//总条数
    private int pageCount;//总页数

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getPageCount() {
        return (this.totalCount%this.pageSize == 0) ? (this.totalCount/this.pageSize) : (this.totalCount/this.pageSize + 1);
    }

    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }

    public PageModel() {
    }

    public PageModel(int pageSize, int pageNo, int totalCount, int pageCount) {
        this.pageSize = pageSize;
        this.pageNo = pageNo;
        this.totalCount = totalCount;
        this.pageCount = pageCount;
    }
}
