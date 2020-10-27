package com.hzh.pojo;

import java.util.List;

public class DataGridPageDate {
    private Long total;
    private List<?> rows;

    public DataGridPageDate() {
    }

    public DataGridPageDate(Long total, List<?> rows) {
        this.total = total;
        this.rows = rows;
    }

    public Long getTotal() {
        return total;
    }

    public void setTotal(Long total) {
        this.total = total;
    }

    public List<?> getRows() {
        return rows;
    }

    public void setRows(List<?> rows) {
        this.rows = rows;
    }

    @Override
    public String toString() {
        return "DataGridPageDate{" +
                "total=" + total +
                ", rows=" + rows +
                '}';
    }
}
