package com.hzh.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * <p>
 * 
 * </p>
 *
 * @author ${author}
 * @since 2020-10-10
 */
@TableName("t_order")
public class Order extends Model<Order> {

    private static final long serialVersionUID=1L;

    @TableId(value = "oid", type = IdType.AUTO)
    private Integer oid;

    private Integer pid;

    private Integer cid;

    private Integer hid;

    private String hotelname;

    private String hoteladdress;

    private LocalDateTime ordertime;

    private LocalDateTime weddingTime;

    private String weddingSplit;

    private Double deposit;

    private Double money;

    private String status;

    private String comment;


    public Integer getOid() {
        return oid;
    }

    public void setOid(Integer oid) {
        this.oid = oid;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Integer getHid() {
        return hid;
    }

    public void setHid(Integer hid) {
        this.hid = hid;
    }

    public String getHotelname() {
        return hotelname;
    }

    public void setHotelname(String hotelname) {
        this.hotelname = hotelname;
    }

    public String getHoteladdress() {
        return hoteladdress;
    }

    public void setHoteladdress(String hoteladdress) {
        this.hoteladdress = hoteladdress;
    }

    public LocalDateTime getOrdertime() {
        return ordertime;
    }

    public void setOrdertime(LocalDateTime ordertime) {
        this.ordertime = ordertime;
    }

    public LocalDateTime getWeddingTime() {
        return weddingTime;
    }

    public void setWeddingTime(LocalDateTime weddingTime) {
        this.weddingTime = weddingTime;
    }

    public String getWeddingSplit() {
        return weddingSplit;
    }

    public void setWeddingSplit(String weddingSplit) {
        this.weddingSplit = weddingSplit;
    }

    public Double getDeposit() {
        return deposit;
    }

    public void setDeposit(Double deposit) {
        this.deposit = deposit;
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    @Override
    protected Serializable pkVal() {
        return this.oid;
    }

    @Override
    public String toString() {
        return "Order{" +
        "oid=" + oid +
        ", pid=" + pid +
        ", cid=" + cid +
        ", hid=" + hid +
        ", hotelname=" + hotelname +
        ", hoteladdress=" + hoteladdress +
        ", ordertime=" + ordertime +
        ", weddingTime=" + weddingTime +
        ", weddingSplit=" + weddingSplit +
        ", deposit=" + deposit +
        ", money=" + money +
        ", status=" + status +
        ", comment=" + comment +
        "}";
    }
}
