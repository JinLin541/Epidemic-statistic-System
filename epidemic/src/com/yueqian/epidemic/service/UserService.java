package com.yueqian.epidemic.service;

import com.yueqian.epidemic.beans.UserInfo;

public interface UserService {
    /**
     * 根据账号登录
     * @param account 账号
     * @return 用户信息
     */
    UserInfo loginByAccount(String account);
}
