package com.yueqian.epidemic.mapper;

import com.yueqian.epidemic.beans.UserInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface UserMapper {
    @Select(value = "select user_id,user_account,user_password,user_name from users where user_account=#{account};")
    UserInfo findByAccount(String account);
}
