package com.yueqian.epidemic.beans;

/**
 * 用户的实体类
 */
public class UserInfo {
    private Integer userId;  //用户编号
    private String userAccount;  //账号
    private String userPassword;  //密码
    private String userName;  //用户名

    //Alter+Insert

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserAccount() {
        return userAccount;
    }

    public void setUserAccount(String userAccount) {
        this.userAccount = userAccount;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}
