package com.yueqian.epidemic.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yueqian.epidemic.beans.UserInfo;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/ajax")
public class AjaxController {

    private Logger logger = Logger.getLogger(AjaxController.class);

    //@RequestMapping(value = "/ajaxDemo",produces = "text/html;charset=utf-8")
    @PostMapping(value = "/ajaxDemo", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String ajaxDemo(String userName) throws JsonProcessingException {
        logger.debug("userName:"+userName);
        Map<String,Object> map = new HashMap<String,Object>();
        if(userName.equals("admin")){ //说明此用户名已经被占用了，请更换一下
            map.put("msg","此用户名已经被占用了，请更换一下");
        }else{
            map.put("msg","此用户名可以使用！");
        }
        ObjectMapper mapper = new ObjectMapper();
        String jsonstr = null;
        try {
             jsonstr = mapper.writeValueAsString(map);  //把对象转换成json格式的字符串
             logger.debug("json内容："+jsonstr);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        List<UserInfo> list = new ArrayList<>();
        UserInfo userInfo = new UserInfo();
        userInfo.setUserAccount("aaaa");
        userInfo.setUserPassword("1111");
        userInfo.setUserName("张三");


        UserInfo userInfo2 = new UserInfo();
        userInfo2.setUserAccount("bbbb");
        userInfo2.setUserPassword("2222");
        userInfo2.setUserName("老王");

        UserInfo userInfo3 = new UserInfo();
        userInfo3.setUserAccount("cccc");
        userInfo3.setUserPassword("3333");
        userInfo3.setUserName("李四");

        list.add(userInfo);
        list.add(userInfo2);
        list.add(userInfo3);
        String s = mapper.writeValueAsString(list);
        logger.debug("s:"+s);
        return s;
    }
}
