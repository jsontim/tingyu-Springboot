package com.hzh.pojo;

public class MsgResult {
    private Integer code;
    private String msg;

    public MsgResult() {
    }

    public MsgResult(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    @Override
    public String toString() {
        return "MsgResult{" +
                "code=" + code +
                ", msg='" + msg + '\'' +
                '}';
    }
}
