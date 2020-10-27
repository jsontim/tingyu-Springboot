package com.hzh.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalTime;

/**
 * <p>
 * 
 * </p>
 *
 * @author ${author}
 * @since 2020-10-10
 */
@TableName("t_host_power")
public class HostPower extends Model<HostPower> {

    private static final long serialVersionUID=1L;

    @TableId(value = "hpid", type = IdType.AUTO)
    private Integer hpid;

    private String hpstar;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate hpstartBegindate;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate hpstarEnddate;

    private String hpOrderPower;

    @DateTimeFormat(pattern = "HH:mm:ss")
    private LocalTime hpstarBegintime;

    @DateTimeFormat(pattern = "HH:mm:ss")
    private LocalTime hpstarEndtime;

    private Integer hpdiscount;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate hpDisStarttime;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate hpDisEndtime;

    private Double hpprice;

    private Double hpcosts;

    private Integer hostid;


    public Integer getHpid() {
        return hpid;
    }

    public void setHpid(Integer hpid) {
        this.hpid = hpid;
    }

    public String getHpstar() {
        return hpstar;
    }

    public void setHpstar(String hpstar) {
        this.hpstar = hpstar;
    }

    public LocalDate getHpstartBegindate() {
        return hpstartBegindate;
    }

    public void setHpstartBegindate(LocalDate hpstartBegindate) {
        this.hpstartBegindate = hpstartBegindate;
    }

    public LocalDate getHpstarEnddate() {
        return hpstarEnddate;
    }

    public void setHpstarEnddate(LocalDate hpstarEnddate) {
        this.hpstarEnddate = hpstarEnddate;
    }

    public String getHpOrderPower() {
        return hpOrderPower;
    }

    public void setHpOrderPower(String hpOrderPower) {
        this.hpOrderPower = hpOrderPower;
    }

    public LocalTime getHpstarBegintime() {
        return hpstarBegintime;
    }

    public void setHpstarBegintime(LocalTime hpstarBegintime) {
        this.hpstarBegintime = hpstarBegintime;
    }

    public LocalTime getHpstarEndtime() {
        return hpstarEndtime;
    }

    public void setHpstarEndtime(LocalTime hpstarEndtime) {
        this.hpstarEndtime = hpstarEndtime;
    }

    public Integer getHpdiscount() {
        return hpdiscount;
    }

    public void setHpdiscount(Integer hpdiscount) {
        this.hpdiscount = hpdiscount;
    }

    public LocalDate getHpDisStarttime() {
        return hpDisStarttime;
    }

    public void setHpDisStarttime(LocalDate hpDisStarttime) {
        this.hpDisStarttime = hpDisStarttime;
    }

    public LocalDate getHpDisEndtime() {
        return hpDisEndtime;
    }

    public void setHpDisEndtime(LocalDate hpDisEndtime) {
        this.hpDisEndtime = hpDisEndtime;
    }

    public Double getHpprice() {
        return hpprice;
    }

    public void setHpprice(Double hpprice) {
        this.hpprice = hpprice;
    }

    public Double getHpcosts() {
        return hpcosts;
    }

    public void setHpcosts(Double hpcosts) {
        this.hpcosts = hpcosts;
    }

    public Integer getHostid() {
        return hostid;
    }

    public void setHostid(Integer hostid) {
        this.hostid = hostid;
    }

    @Override
    protected Serializable pkVal() {
        return this.hpid;
    }

    @Override
    public String toString() {
        return "HostPower{" +
        "hpid=" + hpid +
        ", hpstar=" + hpstar +
        ", hpstartBegindate=" + hpstartBegindate +
        ", hpstarEnddate=" + hpstarEnddate +
        ", hpOrderPower=" + hpOrderPower +
        ", hpstarBegintime=" + hpstarBegintime +
        ", hpstarEndtime=" + hpstarEndtime +
        ", hpdiscount=" + hpdiscount +
        ", hpDisStarttime=" + hpDisStarttime +
        ", hpDisEndtime=" + hpDisEndtime +
        ", hpprice=" + hpprice +
        ", hpcosts=" + hpcosts +
        ", hostid=" + hostid +
        "}";
    }
}
