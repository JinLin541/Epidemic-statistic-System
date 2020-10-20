package com.yueqian.epidemic.beans;

public class AjaxResponseInfo<T> {
    //code:-1:参数不正确，-2：权限不足，0：正常的
    private Integer code;
    private String msg;  //错误信息
    private T data;  //要封闭的数据

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

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
