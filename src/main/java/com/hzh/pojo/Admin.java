package com.hzh.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;

/**
 * <p>
 * 
 * </p>
 *
 * @author ${author}
 * @since 2020-10-10
 */
@TableName("t_admin")
public class Admin extends Model<Admin> {

    private static final long serialVersionUID=1L;

    @TableId(value = "aid", type = IdType.AUTO)
    private Integer aid;

    private String aname;

    private String apwd;

    private String aphone;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date starttime;


    public Integer getAid() {
        return aid;
    }

    public void setAid(Integer aid) {
        this.aid = aid;
    }

    public String getAname() {
        return aname;
    }

    public void setAname(String aname) {
        this.aname = aname;
    }

    public String getApwd() {
        return apwd;
    }

    public void setApwd(String apwd) {
        this.apwd = apwd;
    }

    public String getAphone() {
        return aphone;
    }

    public void setAphone(String aphone) {
        this.aphone = aphone;
    }

    public Date getStarttime() {
        return starttime;
    }

    public void setStarttime(Date starttime) {
        this.starttime = starttime;
    }

    @Override
    protected Serializable pkVal() {
        return this.aid;
    }

    @Override
    public String toString() {
        return "Admin{" +
        "aid=" + aid +
        ", aname=" + aname +
        ", apwd=" + apwd +
        ", aphone=" + aphone +
        ", starttime=" + starttime +
        "}";
    }
}
