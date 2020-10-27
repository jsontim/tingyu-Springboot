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
@TableName("t_menu")
public class Menu extends Model<Menu> {

    private static final long serialVersionUID=1L;

    @TableId(value = "mid", type = IdType.AUTO)
    private Integer mid;

    private String mname;

    private Integer pid;

    private String isparent;

    private String status;

    private String url;

    private String mdesc;


    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }

    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getIsparent() {
        return isparent;
    }

    public void setIsparent(String isparent) {
        this.isparent = isparent;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getMdesc() {
        return mdesc;
    }

    public void setMdesc(String mdesc) {
        this.mdesc = mdesc;
    }

    @Override
    protected Serializable pkVal() {
        return this.mid;
    }

    @Override
    public String toString() {
        return "Menu{" +
        "mid=" + mid +
        ", mname=" + mname +
        ", pid=" + pid +
        ", isparent=" + isparent +
        ", status=" + status +
        ", url=" + url +
        ", mdesc=" + mdesc +
        "}";
    }
}
