package com.yueqian.epidemic.controller;

import com.yueqian.epidemic.beans.UserInfo;
import com.yueqian.epidemic.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;


@Controller
@RequestMapping("/user")
public class UserController {
    private static Logger logger = Logger.getLogger(UserController.class);

    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public String login(UserInfo userInfo, Model model, HttpSession session){
        logger.debug("login()方法被执行了,userAccount:"+userInfo.getUserAccount()+",userPassword:"+userInfo.getUserPassword());
        //根据客户端提交过来的账号信息得到用户信息对象
        UserInfo user= userService.loginByAccount(userInfo.getUserAccount());
        logger.debug("user:"+user);
        if(user==null){  //说明此账号是不正确 //判断账号是否正确，如果不正确就应该跳转到登录页面，并且显示出错误提示信息，账号不正确
            model.addAttribute("msg","账号不正确!");
            return "login";
        }
        if(user.getUserPassword().equals(userInfo.getUserPassword())){
            //说明账号和密码都是正确的，登录成功！ //如果账号和密码都正确了，就跳转到main.jsp页面
            //return "main";
            //把用户信息存储在session会话当中
            session.setAttribute("loginedUser",user);
            return  "redirect:/main.jsp";
        }

        //判断密码是否正确，如果不正确就应该跳转到登录页面，并且显示出错误提示信息，密码不正确
        model.addAttribute("msg","密码不正确!");
        return "login";
    }

    /**
     * 注销
     * @param session
     * @return
     */
    @RequestMapping("/loginOut")
    public String validateOut(HttpSession session){
        session.invalidate();  //注销session会话，session会话中的所有数据都会清空
        return "redirect:/login.jsp";
    }


}
