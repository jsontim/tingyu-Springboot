package com.hzh.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 
 * </p>
 *
 * @author ${author}
 * @since 2020-10-10
 */
@TableName("t_host")
public class Host extends Model<Host> {

    private static final long serialVersionUID=1L;

    @TableId(value = "hid", type = IdType.AUTO)
    private Integer hid;

    private String hname;

    private String hpwd;

    private String hphone;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date starttime;

    private String status;

    private String strong;

    private Integer ordernumber;

    private Integer hprice;

    private Integer hpdiscount;

    private String hpstar;

    public Integer getHpdiscount() {
        return hpdiscount;
    }

    public void setHpdiscount(Integer hpdiscount) {
        this.hpdiscount = hpdiscount;
    }

    public String getHpstar() {
        return hpstar;
    }

    public void setHpstar(String hpstar) {
        this.hpstar = hpstar;
    }

    public Integer getHid() {
        return hid;
    }

    public void setHid(Integer hid) {
        this.hid = hid;
    }

    public String getHname() {
        return hname;
    }

    public void setHname(String hname) {
        this.hname = hname;
    }

    public String getHpwd() {
        return hpwd;
    }

    public void setHpwd(String hpwd) {
        this.hpwd = hpwd;
    }

    public String getHphone() {
        return hphone;
    }

    public void setHphone(String hphone) {
        this.hphone = hphone;
    }

    public Date getStarttime() {
        return starttime;
    }

    public void setStarttime(Date starttime) {
        this.starttime = starttime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getStrong() {
        return strong;
    }

    public void setStrong(String strong) {
        this.strong = strong;
    }

    public Integer getOrdernumber() {
        return ordernumber;
    }

    public void setOrdernumber(Integer ordernumber) {
        this.ordernumber = ordernumber;
    }

    public Integer getHprice() {
        return hprice;
    }

    public void setHprice(Integer hprice) {
        this.hprice = hprice;
    }

    @Override
    protected Serializable pkVal() {
        return this.hid;
    }

    @Override
    public String toString() {
        return "Host{" +
                "hid=" + hid +
                ", hname='" + hname + '\'' +
                ", hpwd='" + hpwd + '\'' +
                ", hphone='" + hphone + '\'' +
                ", starttime=" + starttime +
                ", status='" + status + '\'' +
                ", strong='" + strong + '\'' +
                ", ordernumber=" + ordernumber +
                ", hprice=" + hprice +
                ", hpdiscount=" + hpdiscount +
                ", hpstar='" + hpstar + '\'' +
                '}';
    }
}
