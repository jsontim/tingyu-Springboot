package com.hzh.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
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
@TableName("t_role")
public class Role extends Model<Role> {

    private static final long serialVersionUID=1L;

    @TableId(value = "rid", type = IdType.AUTO)
    private Integer rid;

    private String rname;

    private String rdesc;


    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname;
    }

    public String getRdesc() {
        return rdesc;
    }

    public void setRdesc(String rdesc) {
        this.rdesc = rdesc;
    }

    @Override
    protected Serializable pkVal() {
        return this.rid;
    }

    @Override
    public String toString() {
        return "Role{" +
        "rid=" + rid +
        ", rname=" + rname +
        ", rdesc=" + rdesc +
        "}";
    }
}
