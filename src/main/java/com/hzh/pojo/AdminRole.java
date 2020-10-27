package com.hzh.pojo;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;

import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author ${author}
 * @since 2020-10-10
 */
@TableName("t_admin_role")
public class AdminRole extends Model<AdminRole> {

    private static final long serialVersionUID=1L;

    private Integer aid;

    private Integer rid;


    public Integer getAid() {
        return aid;
    }

    public void setAid(Integer aid) {
        this.aid = aid;
    }

    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }

    @Override
    protected Serializable pkVal() {
        return null;
    }

    @Override
    public String toString() {
        return "AdminRole{" +
        "aid=" + aid +
        ", rid=" + rid +
        "}";
    }
}
