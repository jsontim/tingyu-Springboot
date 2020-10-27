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
@TableName("t_planner")
public class Planner extends Model<Planner> {

    private static final long serialVersionUID=1L;

    @TableId(value = "nid", type = IdType.AUTO)
    private Integer nid;

    private String nname;

    private String nphone;

    private LocalDateTime addtime;

    private String status;

    private Integer cid;

    private Integer ordernumber;


    public Integer getNid() {
        return nid;
    }

    public void setNid(Integer nid) {
        this.nid = nid;
    }

    public String getNname() {
        return nname;
    }

    public void setNname(String nname) {
        this.nname = nname;
    }

    public String getNphone() {
        return nphone;
    }

    public void setNphone(String nphone) {
        this.nphone = nphone;
    }

    public LocalDateTime getAddtime() {
        return addtime;
    }

    public void setAddtime(LocalDateTime addtime) {
        this.addtime = addtime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Integer getOrdernumber() {
        return ordernumber;
    }

    public void setOrdernumber(Integer ordernumber) {
        this.ordernumber = ordernumber;
    }

    @Override
    protected Serializable pkVal() {
        return this.nid;
    }

    @Override
    public String toString() {
        return "Planner{" +
        "nid=" + nid +
        ", nname=" + nname +
        ", nphone=" + nphone +
        ", addtime=" + addtime +
        ", status=" + status +
        ", cid=" + cid +
        ", ordernumber=" + ordernumber +
        "}";
    }
}
